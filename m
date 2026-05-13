Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D8C638E8A9;
	Wed, 13 May 2026 02:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778640024; cv=none; b=Ky3xl0uZK2uWXYdcuW1yXaKqYTAVIZrg7iROItScU+i/mablWDvRvbAR96aQBn8KkLg5rSiz4LVy1fIxJRCbDDezTVPq5RMODA2Btjfl2OJcS6pKFaLrOm7L8XOo3s7HCuj0OpMdNgdSf+/QUdg+vQk8QVLI5cekNyAfs8A24C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778640024; c=relaxed/simple;
	bh=7eoYjiDvdxxuDDmagbQRPNhP/Fw7nx9rjfkhnTcegxw=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iYJ46c2JSJsk01Oq+paR8YCqahvwzps8BthpLVEuwJKr6z1tM6+TjmiX4KXruWICywAtFsjYAXbCF494Vf1+DuT9aInZ05DOclDFRSqtmUuGhUTi6tPjik1IIW2tPExAMfNuyBsmlB+jy4X2tafSiFnaXJyKK37tpDzp3H8tkx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=eBUDWouu; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="eBUDWouu"
Received: from skinsburskii-cloud-desktop.internal.cloudapp.net (unknown [4.155.116.186])
	by linux.microsoft.com (Postfix) with ESMTPSA id 010C020B7167;
	Tue, 12 May 2026 19:40:19 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 010C020B7167
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1778640020;
	bh=u3iwN8fedX/LPJF6JF1T+g8GUAM/wbnJVA72tCN1KS4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=eBUDWouuNOuiyvKo/w7bQaiDLISdPb4Y3djBjzXo/g3/6uRiBfzWpxgeNWYX1LO+l
	 zKdJzs0+lir8UNeu8rcyzrETVzbOvDbY2IjYclOEtxIrclTKwUb4y1KRd92pv06PBA
	 MZ+qsGROnN/mEvcCmQ9VUhkt/5vX6LDLNb0kGMxU=
Subject: [PATCH v2 2/3] mm/hmm: add hmm_range_fault_unlockable() for mmap
 lock-drop support
From: Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>
To: kys@microsoft.com, Liam.Howlett@oracle.com, akpm@linux-foundation.org,
 akpm@linux-foundation.org, david@kernel.org, jgg@ziepe.ca, corbet@lwn.net,
 leon@kernel.org, ljs@kernel.org, mhocko@suse.com, rppt@kernel.org,
 shuah@kernel.org, skhan@linuxfoundation.org, surenb@google.com,
 vbabka@kernel.org, skinsburskii@gmail.com
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-mm@kvack.org
Date: Wed, 13 May 2026 02:40:22 +0000
Message-ID: 
 <177864002226.82528.17028660406208992767.stgit@skinsburskii-cloud-desktop.internal.cloudapp.net>
In-Reply-To: 
 <177863991557.82528.15288076059759579141.stgit@skinsburskii-cloud-desktop.internal.cloudapp.net>
References: 
 <177863991557.82528.15288076059759579141.stgit@skinsburskii-cloud-desktop.internal.cloudapp.net>
User-Agent: StGit/0.19
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

hmm_range_fault() holds the mmap read lock for the duration of the call.
This is incompatible with mappings whose fault handler may release the mmap
lock - notably userfaultfd-managed regions, where handle_mm_fault() returns
VM_FAULT_RETRY or VM_FAULT_COMPLETED after dropping the lock. Drivers that
need to populate device page tables for such mappings have no way to do so
today.

Add hmm_range_fault_unlockable(), modelled on the int *locked pattern from
get_user_pages_remote() in mm/gup.c.  Callers set *locked = 1 and pass
&locked; the function may set *locked = 0 to report that handle_mm_fault()
dropped the mmap lock during a page fault, in which case the caller must
reacquire it and restart the walk with a fresh mmu_interval_read_begin()
sequence.

The implementation is local to hmm_do_fault() and the outer loop in
hmm_range_fault_unlockable(). hmm_do_fault() conditionally sets
FAULT_FLAG_ALLOW_RETRY | FAULT_FLAG_KILLABLE when locked is non-NULL and
translates VM_FAULT_RETRY / VM_FAULT_COMPLETED into *locked = 0 plus a
private return code consumed by the outer loop, which in turn returns 0 (or
-EINTR on fatal signal) to the caller.

The previous refactor that moved page fault handling out of the page-table
walk callbacks is what makes this change small. Faults now run after
walk_page_range() has unwound, with only the mmap lock held, so dropping it
does not interact with the walker's pte spinlock or hugetlb_vma_lock.
Hugetlb regions therefore participate in the unlockable path uniformly with
PTE- and PMD-level mappings; no special case is required.

hmm_range_fault() becomes a thin wrapper, preserving exact behaviour for
all existing callers. No EXPORT_SYMBOL behaviour change for
hmm_range_fault.

Documentation/mm/hmm.rst is updated with a description of the new API and
the recommended caller pattern.

Signed-off-by: Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>
---
 Documentation/mm/hmm.rst |   62 +++++++++++++++++++++++++++++++++++++
 include/linux/hmm.h      |    1 +
 mm/hmm.c                 |   77 +++++++++++++++++++++++++++++++++++++++++++---
 3 files changed, 135 insertions(+), 5 deletions(-)

diff --git a/Documentation/mm/hmm.rst b/Documentation/mm/hmm.rst
index 7d61b7a8b65b7..a9309023ec232 100644
--- a/Documentation/mm/hmm.rst
+++ b/Documentation/mm/hmm.rst
@@ -208,6 +208,68 @@ invalidate() callback. That lock must be held before calling
 mmu_interval_read_retry() to avoid any race with a concurrent CPU page table
 update.
 
+Dropping the mmap lock during page faults
+=========================================
+
+Some VMAs have fault handlers that need to release the mmap lock while
+servicing a fault (for example, regions managed by ``userfaultfd``).
+``hmm_range_fault()`` cannot be used on such mappings because it must hold the
+mmap lock for the duration of the call. Drivers that need to support them
+should call::
+
+  int hmm_range_fault_unlockable(struct hmm_range *range, int *locked);
+
+The caller sets ``*locked = 1`` and holds ``mmap_read_lock`` before the call.
+If the mmap lock is dropped inside ``handle_mm_fault()``, the function sets
+``*locked = 0`` and returns ``0``; the caller is responsible for reacquiring
+the lock and restarting the walk from ``range->start`` with a fresh notifier
+sequence. When ``locked`` is ``NULL`` the function keeps the lock held for the
+duration of the call, identical to ``hmm_range_fault()``.
+
+A typical caller looks like this::
+
+ int driver_populate_range_unlockable(...)
+ {
+      struct hmm_range range;
+      int locked;
+      ...
+
+      range.notifier = &interval_sub;
+      range.start = ...;
+      range.end = ...;
+      range.hmm_pfns = ...;
+
+      if (!mmget_not_zero(interval_sub.mm))
+          return -EFAULT;
+
+ again:
+      range.notifier_seq = mmu_interval_read_begin(&interval_sub);
+      locked = 1;
+      mmap_read_lock(mm);
+      ret = hmm_range_fault_unlockable(&range, &locked);
+      if (locked)
+          mmap_read_unlock(mm);
+      if (ret) {
+          if (ret == -EBUSY)
+              goto again;
+          return ret;
+      }
+      if (!locked)
+          goto again;
+
+      take_lock(driver->update);
+      if (mmu_interval_read_retry(&interval_sub, range.notifier_seq)) {
+          release_lock(driver->update);
+          goto again;
+      }
+
+      /* Use pfns array content to update device page table,
+       * under the update lock */
+
+      release_lock(driver->update);
+      return 0;
+ }
+
 Leverage default_flags and pfn_flags_mask
 =========================================
 
diff --git a/include/linux/hmm.h b/include/linux/hmm.h
index db75ffc949a7a..46e581865c48a 100644
--- a/include/linux/hmm.h
+++ b/include/linux/hmm.h
@@ -123,6 +123,7 @@ struct hmm_range {
  * Please see Documentation/mm/hmm.rst for how to use the range API.
  */
 int hmm_range_fault(struct hmm_range *range);
+int hmm_range_fault_unlockable(struct hmm_range *range, int *locked);
 
 /*
  * HMM_RANGE_DEFAULT_TIMEOUT - default timeout (ms) when waiting for a range
diff --git a/mm/hmm.c b/mm/hmm.c
index 2b157fcbc2928..be13894e67bb8 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -32,6 +32,7 @@
 
 struct hmm_vma_walk {
 	struct hmm_range	*range;
+	int			*locked;
 	unsigned long		last;
 	unsigned long		end;
 	unsigned int		required_fault;
@@ -44,6 +45,13 @@ struct hmm_vma_walk {
  */
 #define HMM_FAULT_PENDING	-EAGAIN
 
+/*
+ * Internal sentinel returned by hmm_do_fault() when handle_mm_fault() drops
+ * the mmap lock during a page fault. hmm_do_fault() sets *locked = 0; the
+ * outer loop consumes the sentinel and never propagates it to the caller.
+ */
+#define HMM_FAULT_UNLOCKED	-ENOLCK
+
 enum {
 	HMM_NEED_FAULT = 1 << 0,
 	HMM_NEED_WRITE_FAULT = 1 << 1,
@@ -639,6 +647,7 @@ static int hmm_do_fault(struct mm_struct *mm,
 	unsigned long end = hmm_vma_walk->end;
 	unsigned int required_fault = hmm_vma_walk->required_fault;
 	unsigned int fault_flags = FAULT_FLAG_REMOTE;
+	int *locked = hmm_vma_walk->locked;
 	struct vm_area_struct *vma;
 
 	vma = vma_lookup(mm, addr);
@@ -651,10 +660,20 @@ static int hmm_do_fault(struct mm_struct *mm,
 		fault_flags |= FAULT_FLAG_WRITE;
 	}
 
-	for (; addr < end; addr += PAGE_SIZE)
-		if (handle_mm_fault(vma, addr, fault_flags, NULL) &
-		    VM_FAULT_ERROR)
+	if (locked)
+		fault_flags |= FAULT_FLAG_ALLOW_RETRY | FAULT_FLAG_KILLABLE;
+
+	for (; addr < end; addr += PAGE_SIZE) {
+		vm_fault_t ret;
+
+		ret = handle_mm_fault(vma, addr, fault_flags, NULL);
+		if (ret & (VM_FAULT_RETRY | VM_FAULT_COMPLETED)) {
+			*locked = 0;
+			return HMM_FAULT_UNLOCKED;
+		}
+		if (ret & VM_FAULT_ERROR)
 			return -EFAULT;
+	}
 
 	return -EBUSY;
 }
@@ -677,11 +696,53 @@ static int hmm_do_fault(struct mm_struct *mm,
  *
  * This is similar to get_user_pages(), except that it can read the page tables
  * without mutating them (ie causing faults).
+ *
+ * The mmap lock must be held by the caller and will remain held on return.
+ * For a variant that allows the mmap lock to be dropped during faults (e.g.,
+ * for userfaultfd support), see hmm_range_fault_unlockable().
  */
 int hmm_range_fault(struct hmm_range *range)
+{
+	return hmm_range_fault_unlockable(range, NULL);
+}
+EXPORT_SYMBOL(hmm_range_fault);
+
+/**
+ * hmm_range_fault_unlockable - fault in a range, possibly dropping the mmap lock
+ * @range:     argument structure
+ * @locked:    pointer to caller's lock state, or %NULL
+ *
+ * Behaves like hmm_range_fault(), but allows handle_mm_fault() to drop the
+ * mmap read lock during a fault.  This makes the function usable on mappings
+ * whose fault path may release the lock (for example, userfaultfd-managed
+ * regions).
+ *
+ * If @locked is %NULL the mmap lock is never released and the function
+ * behaves exactly like hmm_range_fault().
+ *
+ * If @locked is non-%NULL the caller must hold mmap_read_lock and set
+ * *@locked = 1 before the call.  On return:
+ *
+ *   *@locked == 1: the mmap lock is still held.  The return value has the
+ *                  same meaning as hmm_range_fault() (0 on success, or one
+ *                  of the error codes documented there).
+ *
+ *   *@locked == 0: the mmap lock was dropped during a page fault.  No PFNs
+ *                  collected so far are guaranteed to be valid because the
+ *                  address space may have changed under us.  The return
+ *                  value is either 0 (caller must reacquire the lock and
+ *                  restart with a fresh mmu_interval_read_begin()) or
+ *                  -EINTR (a fatal signal is pending; abort).
+ *
+ * The caller is responsible for reacquiring mmap_read_lock and restarting
+ * the operation from range->start.  See Documentation/mm/hmm.rst for the
+ * full usage pattern.
+ */
+int hmm_range_fault_unlockable(struct hmm_range *range, int *locked)
 {
 	struct hmm_vma_walk hmm_vma_walk = {
 		.range = range,
+		.locked = locked,
 		.last = range->start,
 	};
 	struct mm_struct *mm = range->notifier->mm;
@@ -704,8 +765,14 @@ int hmm_range_fault(struct hmm_range *range)
 		 * returns -EBUSY so the loop re-walks and picks up the
 		 * now-present entries.
 		 */
-		if (ret == HMM_FAULT_PENDING)
+		if (ret == HMM_FAULT_PENDING) {
 			ret = hmm_do_fault(mm, &hmm_vma_walk);
+			if (ret == HMM_FAULT_UNLOCKED) {
+				if (fatal_signal_pending(current))
+					return -EINTR;
+				return 0;     /* caller must restart */
+			}
+		}
 		/*
 		 * When -EBUSY is returned the loop restarts with
 		 * hmm_vma_walk.last set to an address that has not been stored
@@ -715,7 +782,7 @@ int hmm_range_fault(struct hmm_range *range)
 	} while (ret == -EBUSY);
 	return ret;
 }
-EXPORT_SYMBOL(hmm_range_fault);
+EXPORT_SYMBOL(hmm_range_fault_unlockable);
 
 /**
  * hmm_dma_map_alloc - Allocate HMM map structure


