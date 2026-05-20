Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71E03E7171
	for <linux-kselftest@vger.kernel.org>; Wed, 20 May 2026 14:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779286163; cv=none; b=efnGWft2/AcThXHMPVFsCPlwevu8NmPguC7MH8oBfD5O3o5S6KuRXejSyizV7QFS+AA7XCZQy+t4qfCas8nKgJFAuWWwWtIofDQoHzHxPSwrRmkSJPURnj2qkNwgnhD39yYXi574lMFT3WSOmENZKa24vAbJQ9mddsW16DkjAfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779286163; c=relaxed/simple;
	bh=j+kSatJQmLMjGFS2p58ndF1JTe1BGFowC+pn8sbbCFU=;
	h=Subject:From:To:Cc:Date:Message-ID:MIME-Version:Content-Type; b=u4DIJoTfJ5COuF921+4jiey3/eyZ67AIxTmSEwyN3d1bIkjDSMpf/a3yEKQFCBHkD60MOfIJxD2xxMkzeyLJlEFyZDZQE+0c2XT2SVcWCnR2YsAzWVbu6r2sIEEeoZFuRKuCkKBrbI7F6t5y/oiNR6CQxmYQNur3hgkgDA0J4v0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z/DwKqvk; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z/DwKqvk"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2b9fcf7c91bso50926125ad.0
        for <linux-kselftest@vger.kernel.org>; Wed, 20 May 2026 07:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779286161; x=1779890961; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:user-agent:message-id:date
         :cc:to:from:subject:from:to:cc:subject:date:message-id:reply-to;
        bh=umF5ta/ZCRrJTgwIAtcRYeo3cZUAkdCQZi2umN2kMZU=;
        b=Z/DwKqvkPSRIib8w3OKRjqwR+jMc2JTebskGt0/h01AMlCOSw5+oyv6lHWv2QXfbuu
         eHQyw56HwfcAhLBIsQwmdgdovgoXB7lQ/wTKOhNfMPPVP2dqNbpeG8wFffHjmIStpQ3s
         oHeXM1lvKgN3yu2JhJiCe6qp5rKoXVDv5plYU9xH9YVsMmWOCs9vrgmV2p8gVpwyLV1n
         K50AMzCeibKZ8JxB9RdKr50HtvN/uGkzE8JUzYnYhQQQy4NlchQclzIy7sFcfkjgUwUt
         MsMeI9WDD0pCbBLY69Vdwb48vYDbGz8a3bDRZh0x3cAgy/jgfwFT0z4UCSMsGjqKW03t
         rs3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779286161; x=1779890961;
        h=content-transfer-encoding:mime-version:user-agent:message-id:date
         :cc:to:from:subject:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=umF5ta/ZCRrJTgwIAtcRYeo3cZUAkdCQZi2umN2kMZU=;
        b=d+4GjQTUPJca2YrDOVnESGbQyBz/6rRMhDidHgkUkxVUlSvq0wEsLOxigU8pUeL/4k
         17ABs994ku0fcCauHgGmS7e7xXczSK+SUUFWNla96hIPO1BoOzaaF+fz5zaHbcJpXyfK
         c4t0X/m5Ie7Cr+LHhttCu+9EwN1t2i0+gkWfgVIPEKQ+ltMbvTaldeLBX0cC+/EUkWaC
         dZOTAOdTh7yg2wqzxY0is3HtWdn8aJrKNgo7t6Z2Zzt0hYMIo1aTm2tZHjGStcJlSNHw
         /950eG1poPPKAbvSMV6GcCN6S7O/PfoJKZgAaC+f+VUUSIx0LLpUSCO3TDwsNqQOrECD
         osjA==
X-Forwarded-Encrypted: i=1; AFNElJ+wnIFFffWoae98v7s0wSlE7ksjVT9Vsx45ntlJO9X5Ot/48X9ZvW15eVn6DvuoVhuplq9Jx5HmnOHvfjuRmjQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg8+eto4vqHD4u4wPwD+5UXOBukF6UhuhTkU6sHpGx+zeGNPVt
	jDAzGAL1v4X5WuXbGEBemvUv/sfDWEljEwzwHYqTg0LpQ5oHsDoEX/Ss
X-Gm-Gg: Acq92OEyIlOUI8VKXCdq1m9s/4YgP6lsmYowKThgbgKd/JA5JsxBEm1ecFrRNf8SJkt
	+xKEb0+x4rCKlDRLydsHwGNikXcWv+BEg8vhgu9DdZNT7aWFLFWa+v5dtvAkXbfOtedtMSwXVMW
	8vknI/QJoHtP7nmX1QxxVDLopj5PL/wUxZqY+Zrq5YWGKsmJrq6dWyvuxVxaq9NCYRe/6WTXCqD
	3DEvMFJSL/oWinys/yTCJeKY+fkK6TUTaI5PEExzlyZ53CTq8u7olcicLRllGEGtNyA5ECPAzWF
	Fa6zZ8nyIjQdmWmzLg4VmQc5UFpCCKPid8d5xjT3JiqqqjgGUtsCP3iDGskyVJpHt2kqW0FV3JG
	K/Uu6VyvtXFhFePgtyjjbxpfkO2MxBCafgUy9GMgZ0E9PMlOlTx0BWt7lqPS4KNBNs80Q3OX7zk
	rFr0egVU9JrRRz6QeN1OmbnQqD1Ps1BKYKZmP0EDd1JAgphy1d7p0m9V4D3gB5Gmq0M6cV36Teb
	gZvmiru
X-Received: by 2002:a17:902:c943:b0:2b9:7ad1:bf2b with SMTP id d9443c01a7336-2bd7e927ae1mr272535545ad.29.1779286160874;
        Wed, 20 May 2026 07:09:20 -0700 (PDT)
Received: from [192.168.0.159] (c-98-225-44-182.hsd1.wa.comcast.net. [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d23b085sm221782185ad.84.2026.05.20.07.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 07:09:20 -0700 (PDT)
Subject: [PATCH v3 0/3] mm/hmm: Add mmap lock-drop support for
 userfaultfd-backed mappings
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
To: Liam.Howlett@oracle.com, akpm@linux-foundation.org,
 akpm@linux-foundation.org, david@kernel.org, jgg@ziepe.ca, corbet@lwn.net,
 leon@kernel.org, ljs@kernel.org, mhocko@suse.com, rppt@kernel.org,
 shuah@kernel.org, skhan@linuxfoundation.org, surenb@google.com,
 vbabka@kernel.org, skinsburskii@gmail.com
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-mm@kvack.org
Date: Wed, 20 May 2026 07:09:19 -0700
Message-ID: <177928604779.589431.14703161356676674288.stgit@skinsburskii>
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
get_user_pages_remote() in mm/gup.c. A new entry point,
hmm_range_fault_unlockable(), accepts an int *locked parameter. When the
mmap lock is dropped during fault resolution (VM_FAULT_RETRY or
VM_FAULT_COMPLETED), the function returns 0 with *locked = 0, signalling
the caller to restart its walk. The existing hmm_range_fault() is
refactored into a thin wrapper that passes NULL, preserving current
behavior for all existing callers.

Faulting hugetlb pages on the unlockable path is not supported because
walk_hugetlb_range() unconditionally holds and releases
hugetlb_vma_lock_read across the callback; if the mmap lock is dropped
inside the callback, the VMA may be freed before the walk framework's
unlock. Hugetlb pages already present in page tables are handled normally.
Possible approaches to lift this limitation are documented in
Documentation/mm/hmm.rst.

Changes in v3:
 - Return -EFAULT from dmirror_fault_unlockable() when the mirrored mm can no longer be pinned.
 - Add an eventfd stop signal for the userfaultfd handler thread to avoid waiting for the poll timeout on successful test completion.


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

Stanislav Kinsburskii (3):
      mm/hmm: move page fault handling out of walk callbacks
      mm/hmm: add hmm_range_fault_unlockable() for mmap lock-drop support
      selftests/mm: add userfaultfd test for HMM unlockable path


 Documentation/mm/hmm.rst               |   62 +++++++++++
 include/linux/hmm.h                    |    1 
 lib/test_hmm.c                         |  122 +++++++++++++++++++++
 lib/test_hmm_uapi.h                    |    1 
 mm/hmm.c                               |  187 ++++++++++++++++++++++++--------
 tools/testing/selftests/mm/hmm-tests.c |  149 +++++++++++++++++++++++++
 6 files changed, 478 insertions(+), 44 deletions(-)

