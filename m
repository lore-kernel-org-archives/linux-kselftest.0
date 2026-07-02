Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C849381E92
	for <linux-kselftest@vger.kernel.org>; Thu,  2 Jul 2026 17:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783013573; cv=none; b=MttNS984RC7VT9d/fPBgsGZnzMOcWdSt9FRK4mhBOcgfjwiBvRaLcoPTN2qDATcacsDLdJ42FP821RbZSflzpibPJbRhV3ZnF4eqQ9xYFp9xutdF71rHetC/noH/MZxHs0yIFP0lRfs+tRJV9ibScb335aW0RwdlV5UIH+qKiqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783013573; c=relaxed/simple;
	bh=ewkPmB40E5HgW1mZjpDZYllsPVIIIb6p0Opgqe4EtfE=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JtCOlazNyxOgxPq5Lvg4NX9EbEapS6bi+4+kf8sAQogtUO5BBkwcE7jUOu+ARNjOg9bkOAumAHJZzPHVXQYzJ/CxO9S6cPxJLheMWoKihC+H8yjpLV+SMAr5MGs50wPXXUCNehhiiTMiQ5JPMYbiNemvvsmWMfWd/c8+FMIj3R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lffVUGv/; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lffVUGv/"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-37e0a189b0bso1374409a91.1
        for <linux-kselftest@vger.kernel.org>; Thu, 02 Jul 2026 10:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783013571; x=1783618371; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:subject:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4y+Zl/3YkvNN8FzMg6Af9oGiKQKRE/0ZpwWnqvzLb6Q=;
        b=lffVUGv/08N1buiDib2ZBjSpOTcWVHLoCq13fkJU7L1/F2fmJ7fQooXGyonatf6qZb
         yC95izPpAYBZKsdSNPPc6TXzL+8C0Z7ZZYZqceoAiSwN5BauG2VhVGJgsgFl52bH+zW1
         2lYnp4yza4tjDT4i7Ndtj/jzZyKUtxUxtQaftcSTMTgdAN0fhEiShzFEZUgcCWV/HgZN
         LXgcohwcsSA1m0JSHiJTr0VAmiWerwJvcatExWUjIOk3ZWF6mlu8o12VmSDbV9H53O0x
         KVvrwP9WIAK+PJyTHoC43RfsUB+Ef8N1UcccZV7PTm6Ljsp7DSSriKlneWHgX0TTUcze
         HWxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783013571; x=1783618371;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4y+Zl/3YkvNN8FzMg6Af9oGiKQKRE/0ZpwWnqvzLb6Q=;
        b=Jg0XQvg2tVuDmMiXWT/h9jZ+OQrFVIYbG491S/4sLBdek6lrpQ2idj8wvwqQmSzFzP
         z4HoxlVdrE8K4ij1xkrtwRs28AzKB5v2uNCEfvW9i8k0JnRvUKgPUuBRalQIHYmFgiKD
         xpNDRw240dLwQyER2aMVYWgEBCoXxhiJh4g5bK/37atINE3eFsrmnpPxG5LudcsabEHN
         jyyJlxdejk26RH8UtKPmYq1plXz9XZK+vK8lUePgauEhcHUYkcrBkPx7HRmc4sL2OjyI
         B5cpNEZmdqlaQ5VMSAsgT6cd9qVB9yRfGXB15C/VcKCm5rMZuUERafWcWsv2E9QffH0p
         HIHw==
X-Forwarded-Encrypted: i=1; AHgh+RqjNGWPGcQGXWVmnVFGkYqXyx5aMaMSFB7vf4dBV7czBSuwoy6X+3RU1xjJ3oF7q+noRtfVj1WN9Rxk/O4+EU4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4H8gzfreMxtFDOMbdi1PT5x2nRinfimVeHc2rJ1XytcK5h231
	LNqLNFFbkNEPaXCQnQNrpxnDzgBa8dHBrI+2OrpPTo7EYpOWUtM0g93B
X-Gm-Gg: AfdE7cngwk6zD3j8zeF1SvivGpUKsaNhyHYQuzIiLuDlsTyBxuZZP32fVeIDS765er6
	SA1tRkEFoeZw4Bo60/msRWf2h1KK9dE5gWXXQ5dcc/hzT9dyRXMneV4pwAMKQdJ5qBSqRueuk5J
	UP11RxL0qVUosVp7aWJ1DX02/IUQ3vgM1hylytzbWuu18PFCV+k4lJu4f6t9HWDzIRoJP18cee+
	GpgG6e0itxSZKMZDBSylpZDmFcLKDXGq1ADDa6qGrV5+D0yXsji/osCUVRMwvsmeQW+xqSP0UqP
	pbafcQZoertD3bnXyofiCY7m66Wb8S22vtFAHrsY2QWI1XjLTk0ZSg+oMuZknwMaRHcLJs0dwIp
	AjLfNZJNOGoLLHSb2NxTGAn0BOcWWTRsxf5IuprcRrvX3vx0jw7skXCbtwLXT6fqlMu5nqgx/96
	yU3NamzvFHZZ7/tbKXLaUgVRokVh6XlieFSmy9r/YQBHRYVJH6FgXj6+RrayY=
X-Received: by 2002:a17:90b:1844:b0:37f:c2a9:468 with SMTP id 98e67ed59e1d1-380baa6b497mr6238459a91.18.1783013571218;
        Thu, 02 Jul 2026 10:32:51 -0700 (PDT)
Received: from [192.168.0.160] (c-98-225-44-182.hsd1.wa.comcast.net. [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3811584a9a9sm168539a91.16.2026.07.02.10.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 10:32:50 -0700 (PDT)
Subject: [PATCH v5 2/3] mm/hmm: add hmm_range_fault_unlockable() for mmap
 lock-drop support
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
To: Liam.Howlett@oracle.com, akpm@linux-foundation.org,
 akpm@linux-foundation.org, david@kernel.org, jgg@ziepe.ca, corbet@lwn.net,
 leon@kernel.org, ljs@kernel.org, mhocko@suse.com, rppt@kernel.org,
 shuah@kernel.org, skhan@linuxfoundation.org, surenb@google.com,
 vbabka@kernel.org, skinsburskii@gmail.com
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-mm@kvack.org
Date: Thu, 02 Jul 2026 10:32:49 -0700
Message-ID: <178301356964.373695.14274584821659522979.stgit@skinsburskii>
In-Reply-To: <178301344866.373695.16044452017467686329.stgit@skinsburskii>
References: <178301344866.373695.16044452017467686329.stgit@skinsburskii>
User-Agent: StGit/0.19
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

hmm_range_fault() holds the mmap read lock for the duration of the
call. This is incompatible with mappings whose fault handler may release
the mmap lock - notably userfaultfd-managed regions, where
handle_mm_fault() can return VM_FAULT_RETRY or VM_FAULT_COMPLETED after
dropping the lock. Drivers that need to populate device page tables for
such mappings have no way to do so today.

Add hmm_range_fault_unlockable(), modelled on the int *locked pattern
from get_user_pages_remote() in mm/gup.c. Callers set *locked = 1 and
pass &locked. The function may transiently drop and reacquire the mmap
lock while servicing retryable faults, and may set *locked = 0 if a
completed fault returns with the mmap lock dropped. In the latter case
the caller must reacquire the lock and restart the walk with a fresh
mmu_interval_read_begin() sequence.

The implementation is local to hmm_do_fault() and the outer loop in
hmm_range_fault_unlockable(). hmm_do_fault() conditionally sets
FAULT_FLAG_ALLOW_RETRY | FAULT_FLAG_KILLABLE when locked is non-NULL.
VM_FAULT_RETRY is handled internally by reacquiring mmap_lock and
retrying with FAULT_FLAG_TRIED set so fault handlers make forward
progress. VM_FAULT_COMPLETED is translated into *locked = 0 plus a
private return code consumed by the outer loop, which in turn returns 0
(or -EINTR on fatal signal) to the caller.

The previous refactor that moved page fault handling out of the
page-table walk callbacks is what makes this change small. Faults now
run after walk_page_range() has unwound, with only the mmap lock held, so
dropping it does not interact with the walker's pte spinlock or
hugetlb_vma_lock. Hugetlb regions therefore participate in the
unlockable path uniformly with PTE- and PMD-level mappings; no special
case is required.

hmm_range_fault() becomes a thin wrapper, preserving exact behaviour for
all existing callers. No EXPORT_SYMBOL behaviour change for
hmm_range_fault.

Documentation/mm/hmm.rst is updated with a description of the new API
and the recommended caller pattern.

Signed-off-by: Stanislav Kinsburskii <skinsburskii@gmail.com>
---
 Documentation/mm/hmm.rst |   66 ++++++++++++++++++++++++++++
 include/linux/hmm.h      |    1 
 mm/hmm.c                 |  109 ++++++++++++++++++++++++++++++++++++++++++----
 3 files changed, 166 insertions(+), 10 deletions(-)

diff --git a/Documentation/mm/hmm.rst b/Documentation/mm/hmm.rst
index 7d61b7a8b65b..751ef3fb0434 100644
--- a/Documentation/mm/hmm.rst
+++ b/Documentation/mm/hmm.rst
@@ -208,6 +208,72 @@ invalidate() callback. That lock must be held before calling
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
+If ``handle_mm_fault()`` returns ``VM_FAULT_RETRY``, the function reacquires
+the mmap lock internally and retries the fault with ``FAULT_FLAG_TRIED`` set.
+If ``handle_mm_fault()`` returns ``VM_FAULT_COMPLETED``, the function sets
+``*locked = 0``. If the return value is ``0``, the caller must reacquire
+the lock and restart the walk from ``range->start`` with a fresh notifier
+sequence. If the return value is ``-EINTR``, a fatal signal is pending and
+the caller should abort; the mmap lock is no longer held. When ``locked`` is
+``NULL`` the function keeps the lock held for the duration of the call,
+identical to ``hmm_range_fault()``.
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
index db75ffc949a7..46e581865c48 100644
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
index 2129b1ee4c35..1869b6df23a6 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -32,6 +32,7 @@
 
 struct hmm_vma_walk {
 	struct hmm_range	*range;
+	int			*locked;
 	unsigned long		last;
 	unsigned long		end;
 	unsigned int		required_fault;
@@ -44,6 +45,14 @@ struct hmm_vma_walk {
  */
 #define HMM_FAULT_PENDING	-EAGAIN
 
+/*
+ * Internal sentinel returned by hmm_do_fault() when handle_mm_fault()
+ * completes a page fault with the mmap lock dropped. hmm_do_fault() sets
+ * *locked = 0; the outer loop consumes the sentinel and never propagates it
+ * to the caller.
+ */
+#define HMM_FAULT_UNLOCKED	-ENOLCK
+
 enum {
 	HMM_NEED_FAULT = 1 << 0,
 	HMM_NEED_WRITE_FAULT = 1 << 1,
@@ -73,9 +82,9 @@ static int hmm_pfns_fill(unsigned long addr, unsigned long end,
  *
  * Called by the walk callbacks when they discover that part of the range
  * needs a page fault.  The callback records what to fault and returns
- * HMM_FAULT_PENDING; the outer loop in hmm_range_fault() drops back out of
- * walk_page_range() and invokes handle_mm_fault() from a context where no
- * page-table or hugetlb_vma_lock is held.
+ * HMM_FAULT_PENDING; the outer loop in hmm_range_fault_unlockable() drops
+ * back out of walk_page_range() and invokes handle_mm_fault() from a context
+ * where no page-table or hugetlb_vma_lock is held.
  */
 static int hmm_record_fault(unsigned long addr, unsigned long end,
 			    unsigned int required_fault,
@@ -624,7 +633,7 @@ static const struct mm_walk_ops hmm_walk_ops = {
 /*
  * hmm_do_fault - fault in a range recorded by a walk callback
  *
- * Called from the outer loop in hmm_range_fault() after a callback
+ * Called from the outer loop in hmm_range_fault_unlockable() after a callback
  * returned HMM_FAULT_PENDING.  At this point we hold only mmap_lock;
  * the page-table spinlock and any hugetlb_vma_lock acquired by the walk
  * framework have already been released by the unwind.
@@ -641,6 +650,14 @@ static int hmm_do_fault(struct mm_struct *mm,
 	unsigned int fault_flags = FAULT_FLAG_REMOTE;
 	struct vm_area_struct *vma;
 
+	if (hmm_vma_walk->locked)
+		fault_flags |= FAULT_FLAG_ALLOW_RETRY | FAULT_FLAG_KILLABLE;
+
+retry:
+	if ((fault_flags & FAULT_FLAG_TRIED) &&
+	    fatal_signal_pending(current))
+		return -EINTR;
+
 	vma = vma_lookup(mm, addr);
 	if (!vma)
 		return -EFAULT;
@@ -651,10 +668,30 @@ static int hmm_do_fault(struct mm_struct *mm,
 		fault_flags |= FAULT_FLAG_WRITE;
 	}
 
-	for (; addr < end; addr += PAGE_SIZE)
-		if (handle_mm_fault(vma, addr, fault_flags, NULL) &
-		    VM_FAULT_ERROR)
-			return -EFAULT;
+	for (; addr < end; addr += PAGE_SIZE) {
+		vm_fault_t ret;
+
+		ret = handle_mm_fault(vma, addr, fault_flags, NULL);
+
+		if (ret & VM_FAULT_COMPLETED) {
+			*hmm_vma_walk->locked = 0;
+			return HMM_FAULT_UNLOCKED;
+		}
+
+		if (ret & VM_FAULT_ERROR) {
+			int err = vm_fault_to_errno(ret, 0);
+
+			if (err)
+				return err;
+			BUG();
+		}
+
+		if (ret & VM_FAULT_RETRY) {
+			mmap_read_lock(mm);
+			fault_flags |= FAULT_FLAG_TRIED;
+			goto retry;
+		}
+	}
 
 	return -EBUSY;
 }
@@ -677,11 +714,57 @@ static int hmm_do_fault(struct mm_struct *mm,
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
+ * hmm_range_fault_unlockable - fault in a range, possibly dropping the mmap
+ *                              lock
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
+ * *@locked = 1 before the call.  Retryable faults may drop and reacquire the
+ * mmap lock internally before retrying the fault with FAULT_FLAG_TRIED set.
+ * On return:
+ *
+ *   *@locked == 1: the mmap lock is still held. The return value has the
+ *                  same meaning as hmm_range_fault() (0 on success, or one
+ *                  of the error codes documented there).
+ *
+ *   *@locked == 0: the mmap lock was dropped during a completed page fault.
+ *                  No PFNs collected so far are guaranteed to be valid because
+ *                  the address space may have changed under us. If the return
+ *                  value is 0, the caller must reacquire the lock and restart
+ *                  with a fresh mmu_interval_read_begin(). If the return value
+ *                  is -EINTR, a fatal signal is pending and the caller should
+ *                  abort; the mmap lock is no longer held.
+ *
+ * -EINTR may also be returned if a fatal signal is pending during retry
+ * handling.
+ * See Documentation/mm/hmm.rst for the full usage pattern.
+ */
+int hmm_range_fault_unlockable(struct hmm_range *range, int *locked)
 {
 	struct hmm_vma_walk hmm_vma_walk = {
 		.range = range,
+		.locked = locked,
 		.last = range->start,
 	};
 	struct mm_struct *mm = range->notifier->mm;
@@ -704,8 +787,14 @@ int hmm_range_fault(struct hmm_range *range)
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
@@ -715,7 +804,7 @@ int hmm_range_fault(struct hmm_range *range)
 	} while (ret == -EBUSY);
 	return ret;
 }
-EXPORT_SYMBOL(hmm_range_fault);
+EXPORT_SYMBOL(hmm_range_fault_unlockable);
 
 /**
  * hmm_dma_map_alloc - Allocate HMM map structure


