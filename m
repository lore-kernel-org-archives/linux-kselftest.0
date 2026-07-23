Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDFEB47D468
	for <linux-kselftest@vger.kernel.org>; Thu, 23 Jul 2026 17:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784828221; cv=none; b=haSZFEtjx9sMvNdO4qVMEvCQBRHlkqGQbojdOi8MnaO0yIWQyzgyxPta3YqYJd/Tin3poFCbvfOo0bpAIBqq/fqHCCSyHDUXNVB7NQuV3re2XUwTL0Vtq4MYJmMTTiSsr98p+V7bQAXqRnItEl+1MsF1Ka3VKJlbj6CKPW2JM1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784828221; c=relaxed/simple;
	bh=ZyAhBAfWZePcXjSsL7QqvsrSYU5bhX/lu/bgMYHTJjg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TW7ag8U+ydY39hAOBDyZyrt1Pr0sOLnkvGARwrq5zvpKVWC9+7RYxOL64luAxeQ5wPk+BkImgYFpHblj9A5sreMYE5R0HZ9UJqRVBhO+g8IYSBIv4FI/PZsn/sMV5x+3KKp8jeWSTxvy35hKLzDMYcTVz+cU5qezkqa3Cg5bdTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TxDQV4ad; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TxDQV4ad"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-848d21bbaffso1019104b3a.0
        for <linux-kselftest@vger.kernel.org>; Thu, 23 Jul 2026 10:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784828211; x=1785433011; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3slUHnl834IP76VoxdiRinKrcbFYlUZTVsrXFJZ4JdY=;
        b=TxDQV4adhqRRAekWKez2o8M9b2r1N8AqJJwAYODXxBXkLYFJQkJEdchOdxcj8bhvrM
         VAUQBDtVhqqz1QYGH9SkvlUvzw+PSD3qHq/CtSUz95oRVoBgIZpRGtNy6YzFO9ze8Ahc
         D4l4Fj9JpYgfSAKb8NbAQvV/P1dINo9cElUfZDImdi5bzBGJ7Fvl6qInx+o8cYy8zH4P
         YC8f3mFup4oQ0/yGL2PUs92s0+La/W9BKGjKEKhVG4LS1cmmM4WVeeWQmY1pWGdtRoWA
         5WtKrrraSVTNyA8JVVUb05BWJAXZ+Pe8F61u/GCnMpmHA+/hpoSvoIuCXn+I4zdGUo46
         XGIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784828211; x=1785433011;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3slUHnl834IP76VoxdiRinKrcbFYlUZTVsrXFJZ4JdY=;
        b=N62reiF0nTp32yaBh1y/G6hbf0Hva5qK1fIWSCj7/1uaO6+StHYL1fvuXq+I1jwMpU
         GZJXJFoQiAihCdGNEyulfzcLsgzG8T2skIVhqGAHj6ltHs7X0rod0r6YqxlZr2GUy8qA
         xyTGGITkPrsDqecOZg8JLvO2423+WLMbYRJqkpBW+VDGD51IZcIKogKXAm05Fr74XxEl
         pqvEJgFKpyNBVLrpu94LH+t4UoN0MJAnKG2DJFW7tfD7adyp9CfC+JfPYx90xKU3W+s8
         hN00MdprnDcFmkr5GvlUqIlyAu4y4V+XePcRbgh/kCob6hXGL7xDr4T4tqrVkcCwS4Fw
         2Anw==
X-Forwarded-Encrypted: i=1; AHgh+RpFdF15ihyZmikuuchSNCbpMJS5fxLi4nF4cTwLhCgdxyds+Oj5n5xpJvN+yjlgSM7X1t/GpznDolQJhKFKPPg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCtSDgo/yPVcOFRrLEo5JNp3JavYKJVA8uJ6X9ixbDodXvfTDg
	uKXCTysp+I3Hm2scjtfq0PIK/6K7qGtcDxmfEiD61kpxKHFjUfpk7HZq
X-Gm-Gg: AR+sD12x4pFK0Q5hrocQb0rnP5PrGo8yZc49HLjYgATXZ9pIdVcZAoukBL1ra87tsk3
	Jb4LeS6AOu/26EVJcylFSN1w2C2jRF1vKrApFnsG6LYwVwB4bbcKc0fgqESodyUWrgq4ThzUmC9
	L1JfKWsbdwTdXGFoWkprdkSJoxuYXvnWrd65pbXAICzG0o6Gwksr1CoE5Rn1LVHEEMjUEJvloKI
	rlcJsmXpz9f4YxFxdX9BGa9rqaIxc6aO5wnQuqwzEoBBBWLkmuKI/SapotbiDMwl1F7wj80ZVrD
	lPA+zsWtgWnv6c9gdpmsPwnq5eJVEYf/miiMFHJXDd4Og1mMeZEl0Umi/KT+QQT7Wwk+WN6Fvuj
	2901cRhzJSltCSBJoI0ximLve/JP4+uhANhY9E7JRibrnNsnGR94AnfE0bKWO4a3a/es/63b+x6
	3wDXBl2rUuL3Nxx2YMPjWF7qlIk6s2j6kTcqQUM3ChXI3n5P+qVwi+/4uG77I=
X-Received: by 2002:a05:6a00:27aa:b0:848:2d1d:836f with SMTP id d2e1a72fcca58-84e2bd6923fmr4526185b3a.28.1784828211456;
        Thu, 23 Jul 2026 10:36:51 -0700 (PDT)
Received: from [192.168.0.160] (c-98-225-44-182.hsd1.wa.comcast.net. [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e20622dedsm2691612b3a.11.2026.07.23.10.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 10:36:51 -0700 (PDT)
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
Date: Thu, 23 Jul 2026 10:36:36 -0700
Subject: [PATCH v11 4/8] mshv: Use hmm_range_fault_unlocked_timeout() for
 region faults
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-hmm-v10-v11-4-c55b003a4b61@gmail.com>
References: <20260723-hmm-v10-v11-0-c55b003a4b61@gmail.com>
In-Reply-To: <20260723-hmm-v10-v11-0-c55b003a4b61@gmail.com>
To: Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>, 
 "K. Y. Srinivasan" <kys@microsoft.com>, 
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
 Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Min Ma <mamin506@gmail.com>, Lizhi Hou <lizhi.hou@amd.com>, 
 Oded Gabbay <ogabbay@kernel.org>, skinsburskii@gmail.com
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-hyperv@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, linux-rdma@vger.kernel.org, 
 Jason Gunthorpe <jgg@ziepe.ca>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784828202; l=3646;
 i=skinsburskii@gmail.com; s=20260722; h=from:subject:message-id;
 bh=ZyAhBAfWZePcXjSsL7QqvsrSYU5bhX/lu/bgMYHTJjg=;
 b=U8sSsRw+6XM+qGDxpQuoe99V7LeZ+M1zXxyPfZetIcbxZBFVX+M/0/c0psrN63mtn0Gyjy1RN
 9IByi6+fiCLCWN+9DASYqtkcc69AC9zezCPbmBdSfWzMLLq1QDXujHn
X-Developer-Key: i=skinsburskii@gmail.com; a=ed25519;
 pk=bDpriHBYgeTdkIDweZDCemxsU93neJBOCn3YLIuJpnE=

MSHV currently faults movable memory regions by taking mmap_read_lock()
around hmm_range_fault(). That prevents the fault path from handling VMAs
whose fault handlers need to drop mmap_lock, such as userfaultfd-backed
mappings.

Use hmm_range_fault_unlocked_timeout() instead. Passing a timeout of 0
preserves MSHV's existing unbounded retry behavior while letting the HMM
helper own mmap_lock acquisition and refresh range->notifier_seq internally
before walking the range. After the fault succeeds, MSHV still takes
mreg_mutex and checks mmu_interval_read_retry() before installing the pages
into the region, so the existing invalidation synchronization is preserved.

Fold the small fault-and-lock helper into mshv_region_range_fault(), since
the remaining retry path is just the standard "fault, take the driver lock,
check the interval notifier sequence" pattern.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Stanislav Kinsburskii <skinsburskii@gmail.com>
---
 drivers/hv/mshv_regions.c | 54 +++++++++--------------------------------------
 1 file changed, 10 insertions(+), 44 deletions(-)

diff --git a/drivers/hv/mshv_regions.c b/drivers/hv/mshv_regions.c
index 6d65e5b42152..dddaade31b5d 100644
--- a/drivers/hv/mshv_regions.c
+++ b/drivers/hv/mshv_regions.c
@@ -381,46 +381,6 @@ int mshv_region_get(struct mshv_mem_region *region)
 	return kref_get_unless_zero(&region->mreg_refcount);
 }
 
-/**
- * mshv_region_hmm_fault_and_lock - Handle HMM faults and lock the memory region
- * @region: Pointer to the memory region structure
- * @range: Pointer to the HMM range structure
- *
- * This function performs the following steps:
- * 1. Reads the notifier sequence for the HMM range.
- * 2. Acquires a read lock on the memory map.
- * 3. Handles HMM faults for the specified range.
- * 4. Releases the read lock on the memory map.
- * 5. If successful, locks the memory region mutex.
- * 6. Verifies if the notifier sequence has changed during the operation.
- *    If it has, releases the mutex and returns -EBUSY to match with
- *    hmm_range_fault() return code for repeating.
- *
- * Return: 0 on success, a negative error code otherwise.
- */
-static int mshv_region_hmm_fault_and_lock(struct mshv_mem_region *region,
-					  struct hmm_range *range)
-{
-	int ret;
-
-	range->notifier_seq = mmu_interval_read_begin(range->notifier);
-	mmap_read_lock(region->mreg_mni.mm);
-	ret = hmm_range_fault(range);
-	mmap_read_unlock(region->mreg_mni.mm);
-	if (ret)
-		return ret;
-
-	mutex_lock(&region->mreg_mutex);
-
-	if (mmu_interval_read_retry(range->notifier, range->notifier_seq)) {
-		mutex_unlock(&region->mreg_mutex);
-		cond_resched();
-		return -EBUSY;
-	}
-
-	return 0;
-}
-
 /**
  * mshv_region_range_fault - Handle memory range faults for a given region.
  * @region: Pointer to the memory region structure.
@@ -452,13 +412,19 @@ static int mshv_region_range_fault(struct mshv_mem_region *region,
 	range.start = region->start_uaddr + page_offset * HV_HYP_PAGE_SIZE;
 	range.end = range.start + page_count * HV_HYP_PAGE_SIZE;
 
-	do {
-		ret = mshv_region_hmm_fault_and_lock(region, &range);
-	} while (ret == -EBUSY);
-
+again:
+	ret = hmm_range_fault_unlocked_timeout(&range, 0);
 	if (ret)
 		goto out;
 
+	mutex_lock(&region->mreg_mutex);
+
+	if (mmu_interval_read_retry(range.notifier, range.notifier_seq)) {
+		mutex_unlock(&region->mreg_mutex);
+		cond_resched();
+		goto again;
+	}
+
 	for (i = 0; i < page_count; i++)
 		region->mreg_pages[page_offset + i] = hmm_pfn_to_page(pfns[i]);
 

-- 
2.43.0

