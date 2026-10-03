Received: from mail-pj2-f41.google.com (mail-pj2-f41.google.com [74.125.227.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D28E3B0AE9
	for <linux-kselftest@vger.kernel.org>; Sat,  3 Oct 2026 10:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791023446; cv=none; b=cpLPNIexTYAxqAbFTJNTgSoeELvgMNQvbAeJ7LWalX+yygeoLP2QhPck0bvS4eWmgH6k788JhKJA3KV3hReSWdnyj9D3Qux/8BISa06PjgFFSr4NzAD2UAxnvu9kbsXAX5wxiI1Fttao7PbD0n/DWLUK/yh1chnZCCMnDIe8FxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791023446; c=relaxed/simple;
	bh=DShMsqHNVKO91T7Yyb+iFlD3Yt/tA9oiAmE9p8tWelU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i2Qa6IcEGO3ToThwh4aiCRCKeOH6uAGpf0Ug9qa/BZOttgRlYWbdMbJDaf/dmP8fSolnP99f8Jw4I0XGERqtW3xxANAbpaGlYcSSYoXdufHJncd75WSjsr/XrR7ryQBVGye1Y4ljYAxofk62ERMmqhOvdwtchgXGDV2WujUUGbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=krUQWJpG; arc=none smtp.client-ip=74.125.227.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="krUQWJpG"
Received: by mail-pj2-f41.google.com with SMTP id 98e67ed59e1d1-3a7906f463dso238269a91.3
        for <linux-kselftest@vger.kernel.org>; Sat, 03 Oct 2026 03:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791023439; x=1791628239; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4OIv8n/HT65OVykH/XmjfYmij9l4kWjigrp7qJ7DUYA=;
        b=krUQWJpGHiBGceHvMmIaFhEyAFPx5HaPneahLNOHKK8ViZm/ZmJFlhq/QQGJEG0WqV
         E98khnu84GUfDW1UlYvbrabZAlp/6n26aof9wsdcx2FpwY3o9kPB0zbEmAA2XKy6tZKA
         4pyc3ViM1oH/wbyQihDCHRGf5llcbNPdA8JqeA4cLLe41zXgzjGIg4lwA8hvwi7+s7UD
         U3cLfMhdJE15JEoHdG1VNFS+/XxrAMDOwmR8Qqop0zf3/9ruae9he62QRoR+iY2i9Vsy
         6uuOIZjO4s5l/MkME/QJuX4w73dj93R+y+UbowHC4Wh6mruDEKa7qBBT4611k7fMBy0D
         zrzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791023439; x=1791628239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4OIv8n/HT65OVykH/XmjfYmij9l4kWjigrp7qJ7DUYA=;
        b=B7Q75NLNHEOJd8xKkvQEBg6/BQXRg9mdHZZWfCce3Wfv8HkJ6eUAf/3xRxRsZdi2WO
         Sv/RoQIhi9xAvarPZGyl8zXVKT7O0sPNlt2+FFJ+EZ+ZTDZxJLJgamr3MVBFXMhdsU94
         mzBBpoN4g84pp2Iblst5nA3X51erMhveCLvwCzzHUfax6jaJ7Hz3E1jM6dSGO1SNIlwc
         10JsVIO1VXcZyvlNS/P57pUaNuxc8A7nch23D4A/ULQvP+VFfWODDPBHWkWYuV1Jr8ZF
         txaE64gcjiZ7pqvKKYf8oZ32TrhiwPj5zAfi6G5ZUZXLHXRkhJMgSq8HAiolUhiLKV+w
         8Btw==
X-Forwarded-Encrypted: i=1; AKwUvBw3iiCTlaAoxIlNw0EAESWWVL0ONeqS0uJzqx/+nwHqOkEA4wLGq9UynFGCf0uazkjdzabSpljOiYP9xl8xlzE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKWRYAtPvAstrmXdjmvaFYsWKmBJIu7kE5k1ihpisRytvcvpL41
	LP2mZU69ff6jl7uE4SOTrxTGgeW2qrC/uBtxjeyehWflQG/rDI15jhM=
X-Gm-Gg: AYBFou31IssnplzuUOOEGJ2j3S68w1aHTCLSSiq6Wqf6hd+R0gu3H5O6QnbuRHMCh4g
	4rxKGHLzOpwuRNp6IKFojIh0nVUPORHaK9QDqh/9XsZkk4D9/sYr1KvOquNDxJUlRvvzL/lQc4c
	iqTWujMzn1vnYzDe7auaNme618VSHnSG9CqHNNjzf+sZuSFgP69/IGLkKAAg71bZiDCRMkZNyup
	jpHAQJ8Nx83uDZp0gBSCLlTWXIm8QcQ5tat3qkZUv3ZhFq3P1bCpQYfHXXLxlX2H16v1eMWbH5M
	ct7V/GUuidetrkcRU49WFXxdsp3Ki53UlF6Ogk5dGfJD4NCK/WMJabz64CiAy51hYz2V0DwXJtV
	KjmTUWKmlaa1MxkCCfZl6KTWAV72Uk2aeI4EQ6GXb7Mj6L0+pJgAhf8uYNEAZRNt5/gnETpO8Vj
	tWkG4iCWNajGxNiyS9MVIU9OzFYZFj8nhYncZVScnmtEgpgIKfvjYjJO0wJ1YdINteUXJeLtcE3
	SfeViOju1LRwIQhbEA6vCwGhg==
X-Received: by 2002:a17:90a:fc47:b0:39e:6a80:b795 with SMTP id 98e67ed59e1d1-3a6cec9b170mr4991753a91.37.1791023438924;
        Sat, 03 Oct 2026 03:30:38 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([211.230.25.193])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a709a4e80bsm2121961a91.4.2026.10.03.03.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 03:30:38 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: akpm@linux-foundation.org,
	rppt@kernel.org
Cc: peterx@redhat.com,
	surenb@google.com,
	aarcange@redhat.com,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	mhocko@suse.com,
	shuah@kernel.org,
	kas@kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	donggeunyoo.kernel@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH v4 1/2] userfaultfd: clear the inherited uffd bit in move_swap_pte()
Date: Sat,  3 Oct 2026 19:30:29 +0900
Message-ID: <20261003103030.63380-2-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261003103030.63380-1-donggeunyoo.kernel@gmail.com>
References: <20261003103030.63380-1-donggeunyoo.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

UFFDIO_MOVE on a swapped-out page installs the source PTE at the
destination unchanged, so a uffd bit set on a write-protected or
RWP-protected source lands in a destination VMA that was never
registered for either.  Nothing clears it there, and userspace sees:

 - /proc/<pid>/pagemap reports the page as uffd-tracked (bit 57), both
   while it is swapped out and after it is faulted back in.
 - MADV_COLLAPSE fails with EINVAL on a range containing it, because the
   collapse scan bails on a swap entry with the uffd bit set.
 - With CONFIG_PAGE_TABLE_CHECK, faulting the page in warns.
   do_swap_page() carries the bit into the present PTE and, since the
   destination isn't WP-registered, also makes it writable:

   WARNING: mm/page_table_check.c:202 at __page_table_check_ptes_set+0x185/0x1e0
   Call Trace:
    set_ptes+0x67/0xc0
    do_swap_page+0x990/0xfe0
    __handle_mm_fault+0x7d0/0xeb0
    handle_mm_fault+0x9c/0x250
    do_user_addr_fault+0x207/0x650
    exc_page_fault+0x65/0x150
    asm_exc_page_fault+0x26/0x30

Reaching it takes UFFDIO_MOVE out of a WP- or RWP-protected area into
one that isn't, on a page that is swapped out at the time.  It hasn't
been seen in practice.

A resident page doesn't carry the bit, because move_present_ptes() builds
the destination PTE from dst_vma->vm_page_prot.  Clear it on the moved
swap entry as well, then re-arm it if the destination is RWP-registered.

The WP case has been there since v6.8, where UFFDIO_MOVE was added.

Fixes: adef440691ba ("userfaultfd: UFFDIO_MOVE uABI")
Cc: <stable@vger.kernel.org>
Assisted-by: LLM
Signed-off-by: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 mm/userfaultfd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
index 74f04c323c50f..f39f109f17989 100644
--- a/mm/userfaultfd.c
+++ b/mm/userfaultfd.c
@@ -1449,6 +1449,7 @@ static int move_swap_pte(struct mm_struct *mm, struct vm_area_struct *dst_vma,
 	orig_src_pte = ptep_get_and_clear(mm, src_addr, src_pte);
 	if (pgtable_supports_soft_dirty())
 		orig_src_pte = pte_swp_mksoft_dirty(orig_src_pte);
+	orig_src_pte = pte_swp_clear_uffd(orig_src_pte);
 	/* Re-arm RWP on the moved swap entry if dst_vma is RWP-registered. */
 	if (userfaultfd_rwp(dst_vma))
 		orig_src_pte = pte_swp_mkuffd(orig_src_pte);
-- 
2.53.0

