Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C1B4189AD
	for <linux-kselftest@vger.kernel.org>; Mon,  6 Jul 2026 17:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783360497; cv=none; b=NVuYft4W65qqYPUVHjEWd5LX9WGhSkrBHtw3Z7B3k6I9LvjF0mWd4kLiD9T/P5L9dfh/wOPPr7r0N9Lmoizzra59cacKr027EUuheJ2YvJBMbPGnu4N2iZk8gdzt3ApKvBOX/uqDQ8SZUshRbSGjq1DZPHRdlJo5rym38e3/C4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783360497; c=relaxed/simple;
	bh=ycv2BoXCHb5oo4aS8e5sx2b774vzMMHbqpSNM8HQ2L4=;
	h=Subject:From:To:Cc:Date:Message-ID:MIME-Version:Content-Type; b=SgebnYdbfLNozOIZ4hFrjiSvUSBWP/j9lwi7+Phi4prdOYkOgnBc3pI6h4RGksQwVPSeixOlkYDWmrCWL7rl05poFva/ByQ/Kdli9WtUlvImWAnbE7toeR1H+jvLep2ht+dStzeTW4vrsIPnm3xqg1Z5vWySxt392GYK/KoKOuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hySgxsfh; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hySgxsfh"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2c9b1edf2bdso39991815ad.1
        for <linux-kselftest@vger.kernel.org>; Mon, 06 Jul 2026 10:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783360495; x=1783965295; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:user-agent:message-id:date
         :cc:to:from:subject:from:to:cc:subject:date:message-id:reply-to;
        bh=cnwJHJEouqLhDU4VS1gzSe1nEPe1/QANOGjZf+5gN18=;
        b=hySgxsfhErEzgrNcNdZPP8YKzrUYzCy7WrxKa1MFGX03dmyhxpqaPrOSdIq4j56AiZ
         YCuM7t29XnaCbYUFaJXPQdN4L7VCE8V6P2qvV/ITu+ymPrvfRxadpvJaOUnhp0J4ULZd
         Q4ioAFqMLzoycsgsbSzR33aN9N/O8HqUYIbGE8njtO6fnciua4G94tFPZzO1RvCdps9E
         FHNP16NhtOs0SXyRa8+VVL/xBDDjbIG5Yv32ms6dmeb9O5xfqh/l8jxG1k3wjPLtD+12
         wep4pA2IEGqFPRK44k74eXj0g161qB3MU3oLogFNwrqkhY166UacflTjf3KiUCNb350M
         hs+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783360495; x=1783965295;
        h=content-transfer-encoding:mime-version:user-agent:message-id:date
         :cc:to:from:subject:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cnwJHJEouqLhDU4VS1gzSe1nEPe1/QANOGjZf+5gN18=;
        b=QTCz9Ky33kwXZaYtgJR/GNE6M8QRcA8btO5ey/Z6YxlrabyQGM4RAlVodzSkiOSWp0
         MC4+AbsQBriupsnajNHYAT5XZ3rDIoYe43aHVVEgAyyD1qgF8dTxGdN90Qwz0jL3UCR/
         s0M99eWFx+SyNqMGqJ2vTxyY8W5Tq3dtS4hUSEzuPaWxgq8JQJDY+6vAsxbqOs4o0wpn
         Dpud4+y9tdKEENV2W98VtXKmBdSqaS2NKDQ1s6Yutimdzp7WTtvLDYKwO5P7UgOX1Klm
         QuxHWk/Em3iw0yR/t181OxF2UEPvK3/vkGMtCUoo9UYRDc/c2F2y6Nbpz08XgL+xeYmA
         EpIg==
X-Forwarded-Encrypted: i=1; AHgh+RoHRvNPN3xx//NiHnhyHQkJMTW+vJr86Al1BuSH+V42Sq1nZDs9/dA01x8e2rz/DnlHTLwPKCwierEvgUKAJCc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAH1kndikyoY+wJppXFhEHr25ntwK3G7rdyEZOOCVAlVnIo6qV
	2wfy63t4IbRDdyrHtifG1mAk1+ZbGXB9FCm580ZSeWOKAJT937EX0UuZ
X-Gm-Gg: AfdE7ckbym9I5SuBMAvocuiuTrQi/iqHcAqJ3JbTf2FBIo3Xn7Yqnmz2u17dSHYYJeG
	hGg2uS3hJDbCr2/99xbzX4hZh7z6BWZ1CG/r6zCeqa9Vt4GsbaKcdkrR3waMmGSUSb/2Ug0IYGX
	JgqQX8gHmRgCFGIoy3l+lhnvqIZaf6n/DgldDTu4UFtt1ASXC2QmO4t+B5MV6MDX7dy9cGKca2M
	cD09Mz9bVzaNgRgDZkBecMRPztQH/QWPKPpNzMTLYCoZefiS+TM/cwWBEvoWzyvZuO+IC6tCj22
	yvGVK4FIIvQESZTmkWN7Mg+DXODr5kGRBg9KJA1/DX1VoXSt5pb4LyIvZp+//PErAqmNzRAiZjJ
	HlxX4i+/V1FVxY1y2XzeOdjUVJqTbDhdKORD+bLkjCYRqSI80Ms26Cc2jpQ3FtJSdCEX/2ibYRZ
	9gCmJ84ahUf5sE4wHtLxKX6jNDnJC4azOlt9bnjIetkyVbE20VZRTtYMD5Odo=
X-Received: by 2002:a05:6a21:485:b0:398:9b42:69f7 with SMTP id adf61e73a8af0-3c08eed6b41mr1940825637.39.1783360495452;
        Mon, 06 Jul 2026 10:54:55 -0700 (PDT)
Received: from [192.168.0.160] (c-98-225-44-182.hsd1.wa.comcast.net. [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e927a1152sm6529965a12.29.2026.07.06.10.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:54:54 -0700 (PDT)
Subject: [PATCH v6 0/4] mm/hmm: Add mmap lock-drop support for
 userfaultfd-backed mappings
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
To: Liam.Howlett@oracle.com, akpm@linux-foundation.org,
 akpm@linux-foundation.org, david@kernel.org, jgg@ziepe.ca, corbet@lwn.net,
 leon@kernel.org, ljs@kernel.org, mhocko@suse.com, rppt@kernel.org,
 shuah@kernel.org, skhan@linuxfoundation.org, surenb@google.com,
 vbabka@kernel.org, skinsburskii@gmail.com, kys@microsoft.com,
 haiyangz@microsoft.com, wei.liu@kernel.org, decui@microsoft.com,
 longli@microsoft.com
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-mm@kvack.org, linux-hyperv@vger.kernel.org
Date: Mon, 06 Jul 2026 10:54:52 -0700
Message-ID: <178336023903.504354.7500950448226027718.stgit@skinsburskii>
User-Agent: StGit/0.19
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

This series extends the HMM framework to support userfaultfd-backed memory
by allowing the mmap read lock to be dropped during hmm_range_fault().

Some page fault handlers — most notably userfaultfd — require the mmap lock
to be released so that userspace can resolve the fault. The current HMM
interface never sets FAULT_FLAG_ALLOW_RETRY, making it impossible to fault
in pages from userfaultfd-registered regions.

This series follows the established int *locked pattern from
get_user_pages_remote() in mm/gup.c. A new helper function,
hmm_range_fault_locked(), accepts an int *locked parameter. When the
mmap lock is dropped during fault resolution (VM_FAULT_RETRY or
VM_FAULT_COMPLETED), the function returns 0 with *locked = 0, signalling
the caller to restart its walk. The existing hmm_range_fault() is
refactored into a thin wrapper that passes NULL, preserving current
behavior for all existing callers.

Possible approaches to lift this limitation are documented in
Documentation/mm/hmm.rst.

Changes in v6:
  - Reworked the new API from the external int *locked pattern to
    hmm_range_fault_unlocked(), which owns mmap_read_lock() internally.
  - Changed the dropped-lock contract: hmm_range_fault_unlocked() now returns
    -EBUSY when the mmap lock is dropped, and callers restart with a fresh
    mmu_interval_read_begin() sequence.
  - Kept hmm_range_fault() as the locked variant for existing users, preserving
    its caller-held mmap lock contract.
  - Added an in-tree user by converting the MSHV region fault path to
    hmm_range_fault_unlocked().
  - Updated Documentation/mm/hmm.rst and kernel-doc to describe the unlocked
    helper and retry pattern.
  - Updated commit messages to match the new API and return semantics.
  - Kept the userfaultfd HMM selftest using the test_hmm unlocked read ioctl
    path.

Changes in v5:
 - Rework hmm_range_fault_unlockable() retry handling to retry
   VM_FAULT_RETRY internally with FAULT_FLAG_TRIED set, matching the
   fixup_user_fault() pattern and avoiding repeated first-retry lock drops.
 - Distinguish VM_FAULT_RETRY from VM_FAULT_COMPLETED: retry faults now
   reacquire the mmap lock internally, while completed faults return to the
   caller with *locked = 0 so the caller can restart with a fresh notifier
   sequence.
 - Document the two *locked return states, including the -EINTR case when a
   fatal signal is pending after the mmap lock has already been dropped.
 - Update comments around HMM_FAULT_UNLOCKED and the HMM fault loop to match
   the current hmm_range_fault_unlockable() implementation.

Changes in v4:
 - Rebased on 7.2-rc1

Changes in v3:
 - Return -EFAULT from dmirror_fault_unlockable() when the mirrored mm can
   no longer be pinned.
 - Add an eventfd stop signal for the userfaultfd handler thread to avoid
   waiting for the poll timeout on successful test completion.


Changes in v2:

 - Split into a preparatory refactor (new patch 1) that moves
   handle_mm_fault() out of the walk callbacks, plus a smaller feature
   patch on top.  Suggested by David Hildenbrand.
 - Hugetlb regions are now supported on the unlockable path; the v1
   -EFAULT short-circuit and the hugetlb_vma_lock_read drop/retake
   dance are gone.
 - Distinct internal sentinels for "needs fault" (HMM_FAULT_PENDING)
   and "lock dropped" (HMM_FAULT_UNLOCKED).
 - Outer loop now re-walks after a successful internal fault so the
   faulted pfns end up in range->hmm_pfns.
 - Kernel-doc on hmm_range_fault_unlockable() and the
   Documentation/mm/hmm.rst example match the implementation.
 - Dropped the mshv driver conversion (v1 patch 2); will post
   separately.
 - Selftest converted to drive the path through test_hmm with a
   userfaultfd handler (new HMM_DMIRROR_READ_UNLOCKABLE ioctl).

---

Stanislav Kinsburskii (4):
      mm/hmm: move page fault handling out of walk callbacks
      mm/hmm: add hmm_range_fault_unlocked() for mmap lock-drop support
      selftests/mm: add userfaultfd test for HMM unlocked path
      mshv: Use hmm_range_fault_unlocked() for region faults


 Documentation/mm/hmm.rst               |   59 ++++++++
 drivers/hv/mshv_regions.c              |   14 +-
 include/linux/hmm.h                    |    1 
 lib/test_hmm.c                         |  114 ++++++++++++++++
 lib/test_hmm_uapi.h                    |    1 
 mm/hmm.c                               |  223 +++++++++++++++++++++++---------
 tools/testing/selftests/mm/hmm-tests.c |  149 +++++++++++++++++++++
 7 files changed, 492 insertions(+), 69 deletions(-)

