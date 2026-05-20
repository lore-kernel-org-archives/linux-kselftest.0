Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39BAA3E7171
	for <linux-kselftest@vger.kernel.org>; Wed, 20 May 2026 14:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779286177; cv=none; b=AMsAA6T6Y6kllkQdvNrvDQwOe/h6XAhKgTKTy+7ZQ8MD99CiD0j4GIM66snBX1YOns/lFJ6Ezwqlk68fTN+0xMHj3uOC0P/HnEPua5x1nbB3nlXBrL8RbB3QC36goMPTplUGtsGMtu0znVFhz+CEA41qtyToou+uuwUuZonlDzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779286177; c=relaxed/simple;
	bh=61apRPqn1rv5BYz47gpqkPMB6IBZPKR798yxdL/4E30=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qO9ma/xtEeKQ103d29Ke/es9K0aM5jqZTHPEGKU/wW0qOHQSAjgeXEQy0VKgPeT1Th9OjHvMurMgwqaUJ966tSQJwgs9bt8lNGSJu1G2O9/fuLJvp1hBlcOzH3/bdkamNejAlHv5SYLWfDLTOLG+ILQnMR+2fMaL6y6sdoX1yng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aDi1bpTo; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aDi1bpTo"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3697c35eab7so2752596a91.0
        for <linux-kselftest@vger.kernel.org>; Wed, 20 May 2026 07:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779286174; x=1779890974; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:message-id:date:cc:to:from:subject:from:to:cc:subject
         :date:message-id:reply-to;
        bh=urGGI+UABys1blw899nvFkhAmcNFFQESIMIpWL4Nq+s=;
        b=aDi1bpTorSlVnof+3z9nkKsyKkad4idTeQudwuTJxDWgW5pAyTpT7UT1mWjkguL0yS
         qEozkZkpxp2tO48mnvOFBGRrrXhuQ3eLkGzUrwP7x0y9HEtvfz5NLrqSU2qj68D5cC2b
         ymQSEsvCwgdLLm9NRlfpMEbZ7b4sLSvKCbxRf2uCUbReRTQKcQLwOVPCSQU96hZ9NhHv
         qXYvKDad4OqICcu6sLWTybhrt8I/boS4Uwj9vfALhu+zOpg5vnUTHFN54e3tav8Egqof
         N2O7k6QWRrwLIoF6Faq5PHFsbDDhaSkpkafAVcb52tQS1jBkH0/ptz6k5TKeWsNEP+T2
         NayA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779286174; x=1779890974;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:message-id:date:cc:to:from:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=urGGI+UABys1blw899nvFkhAmcNFFQESIMIpWL4Nq+s=;
        b=pC9XIKMTGC+zBwvMN0eB4BFtw5mx1sWLWHIDhTG5TyMp8PuM1sAAT00uLattWB9x+1
         f/Mwpg8+RH/Z8HdcEVyAyKLGIZ9p1TEDFTN8OgPFZQGEv30WxuGAlerwAXo7ajzFwFwo
         ZX6472mW7WufsdrbLvF7OfOKglHNoHcUVxY4Cq6r16iprDco1qaZ5fCMO7HNKkTdXPwq
         oACdTNlnquaXRdF6IiLF0CCScQL7hhuVC+z2cA3UqjQ1OFVL3hf8vOSTebCo08NrS1s9
         yu9ENtJZu0igHhqLEZIDqZhGhmnKI4mJBsSZ7Fe7s7UMZTCu5pa7zm1fZDFKISxIdyk3
         Csmg==
X-Forwarded-Encrypted: i=1; AFNElJ8gPxesQhVr+Ms4JgfL6oZkGONwCek04gwRChLkwM93Ypmnov1RJnGWgy8f+R3v42wd1W8yQHB0b79xhR1aBTM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzUuOBLDXrPVcX1e+whZpEINOVNCZinxXnjyq55SQtGocaWoC7
	bhqLWv4ftaKCdtXa8C0mQOutQrLjvmx11YRM7eoVTrotj4ZuJ9iBVc6E
X-Gm-Gg: Acq92OG6IGQpeiCJxdxEMkJXlY9Ofi3QHtcrPBqOycoj6U+rQLn6ZiM+i5LOE9cLR1W
	TdF7zeiNiVzCK3PKypP8FQfs8zOFpp1EZM0hbhzoNRSRxLhoU5M64Fl4SqVbwC7UEg6YR2ZvGkU
	7NToc8yu9XmtmyhCNOR6qC7De+xzYRVGrSCOFH3KJ9HTMG2mTxe016n5tnfu0ocNqKORTkXPInM
	ZTcavV2PGCJuZ/AcPRYi01l9wxdJ/cs2iVnMntXi4EvUXCkFUAGZFw8VN0IQenTuEe5Rux5Ztof
	ZI1s0uhpPdgTTLJf6uBLoec1GwfVqcugV8cUn9Dryb4OnVKjPlJ3/+z/nBAdDjED/0v1vgYO8ey
	2EwOUTrGqWR4vPA8pIyMokCapSfuPt6kNb/A6QZ9ChU4UI9PE+ThX7zoWDUupUXtYJZF1J2GK97
	7HUpmIS0QCuoxeXgWHcelYuVE6sISDtVGtYez+aGRwH65uacD3SsPchXZbAHVFe1vVDl/7/g==
X-Received: by 2002:a17:90b:2d0c:b0:369:7433:2fe with SMTP id 98e67ed59e1d1-369743303a4mr19190776a91.6.1779286174420;
        Wed, 20 May 2026 07:09:34 -0700 (PDT)
Received: from [192.168.0.159] (c-98-225-44-182.hsd1.wa.comcast.net. [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3695a0efa7esm6546608a91.11.2026.05.20.07.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 07:09:34 -0700 (PDT)
Subject: [PATCH v3 2/3] mm/hmm: add hmm_range_fault_unlockable() for mmap
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
Date: Wed, 20 May 2026 07:09:32 -0700
Message-ID: <177928617293.589431.17688544423323771407.stgit@skinsburskii>
In-Reply-To: <177928604779.589431.14703161356676674288.stgit@skinsburskii>
References: <177928604779.589431.14703161356676674288.stgit@skinsburskii>
User-Agent: StGit/0.19
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

From: Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>

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
index 7d61b7a8b65b..a9309023ec23 100644
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
index 446dd0c39b3a..b9ced5003e16 100644
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


