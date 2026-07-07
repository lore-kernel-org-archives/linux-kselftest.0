Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 596AD3BB11C
	for <linux-kselftest@vger.kernel.org>; Tue,  7 Jul 2026 19:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783453640; cv=none; b=h6sEWAIyB37MAyjvd1ufsBNTFyz6+1ZpsyLdyL1Ff+dxWqS3BgHhws0behQaZKxy5eO+vOvo+rY8EI9qvj9Vo7Fl2/xZ+Lt9tujT0ligRNsZGfqCD4gW0GTrUBFA7DB9iu2gLL68hNjCGV4aW9BotH24IgxKErHwUIzLV+0MLy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783453640; c=relaxed/simple;
	bh=y4kdf7jDco6ySPlhlG10NkFmrsOAGPDs4XhdHxu7r30=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nXNJngtSbKGfGtjf/UL7kbe09JqSf9zIDQnHMG9a3BDqzv3I7fR6Rv/UjMNOKmGqrqHl+pkkSKaCusnun1aWzIRIKtx5lJ+oQT95smElu52FNlkVcvqCdLxaszQ9hKP2oN3vBgGSTKZvU22/l+XgWbOsGetCk2bPV2uVCh81ZrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g+1RU7E8; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g+1RU7E8"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-385b78b44a0so16281a91.0
        for <linux-kselftest@vger.kernel.org>; Tue, 07 Jul 2026 12:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783453638; x=1784058438; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:subject:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=vfGwKSNbrl+nU6kvbTrSHfyfMmoFAmwmGff/pR29LWo=;
        b=g+1RU7E8JfhVwad/YWEmP4e09DfkRefbo+a1P3tNzwFx+E7LtWbYGhDKdtaOqVvgMP
         Cnev6FTdzFjrbiaGsl20piHN4eoHrbubU9hWBYN5dPUrg19R8uvmNEskb2fAnVZISNmk
         eeHRs1l+bZmP4QwIg+HtkHuay9VkbeVXoICYq+x89FOvI+GNW36xY6QbIuPWMdbsGGVv
         zimJ88WKlPNVGXUfud5e29iA+MhtCus+59bv5JRqN2PEbSavCHtUudqN/lSdiF6m1raL
         PsIREfeoI+EFQxRjoaZ+ENa5rGHKVcIM+ToyQq62kFctftkbSeGUN127aK1GZcUyrrXp
         Uh3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783453638; x=1784058438;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vfGwKSNbrl+nU6kvbTrSHfyfMmoFAmwmGff/pR29LWo=;
        b=jEVLYxmNZXlDqFWorIiY0DCupuQzjC94C6tokIlzaQDDV+TyGS6y/vN3jA1UUjKcLx
         JCaa1+i9r9Y1HCEeEY0LN68/tFz4turzopyTpH5JXiqTDyOfd8n73hjbNnLMbyx7w98c
         jfjPMuyJoPYxcrOhvr50yhEU603YAf19bh2+9E+r85YnoCsllHKRYG9Ev2Wt8Clc3F49
         FjoNIsvQLQuOq79odcrozxIKD6N9eLQRwGCBeG+OiD9TKiw3iUpphYx0uwONQoUQdTFL
         sMRHzUC8JSWsaIGtutq1levir+zverSIbHGYMNrEWTjfmyCL904aYm+wRvAXiJHLoS7E
         IQ8Q==
X-Forwarded-Encrypted: i=1; AHgh+RoFxYG9pCOTpf9AGWOz5P+fFJrFnG0gk0E9lFXNf2K61L+KilZlN/0tm5ecsjdLNhRodzKgAAuqnBkAtIGpSRg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmkiqQs6teYjCqXw4W2/bf/V00g5sRtzBzmhgyzJP7Xn8n4Rv7
	UMINEATqohiW3cef/d/TsML9qF08R6KIzV/R//y21XMP7hE0fdn+xxcRAuZc0g==
X-Gm-Gg: AfdE7cnoBUaLLv5M6lWmXL4O0c5Z7/xkf2RRh3LXGVPh6MvYKRSsWU6iOk0WPzYhV00
	961xqREKXghcDQh6hNYoxy+SV2i0pE4lDoiNbTam5ggAhhXDTGHGSQQ1r5GAaipKDKiMkdlPwbj
	UPvf22eEUt8VRTKc7eToOhp+cLKrsN9kLQAjxKmtEdKdPdcorCCS+VuIrYGXiGwyhqBc7zx2rx8
	yxcz+s4nVS6XP5K/uKGSUYNFmQnP7NXaIiezwk0ddV4SSvbX/aUBfLiqvLt02hbXyK/LVJluDcL
	boADBnu/XbBxELsEoVnzZbhvTSKfzhyjO3pfvzXWAHxqarngwIRMqD3drwDIQuFSDPrwQNzZCQm
	AArgP4gSOEiq9uM/nGRVaeR9So6ndo+s9wO+hbXvw6bhagn47jNK5223vGFKGLRSJ1JgciWlBZJ
	JgfJKQikXtlyELZ59mQ1zfQEXL60Xpy6h72pPvk8qfJowqWLBONypIjONRDkk=
X-Received: by 2002:a17:90b:2e48:b0:36a:fcf5:64d2 with SMTP id 98e67ed59e1d1-387573b24f7mr6589891a91.16.1783453637572;
        Tue, 07 Jul 2026 12:47:17 -0700 (PDT)
Received: from [192.168.0.160] (c-98-225-44-182.hsd1.wa.comcast.net. [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d36675d5sm1660092a91.12.2026.07.07.12.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 12:47:17 -0700 (PDT)
Subject: [PATCH v7 4/8] mshv: Use hmm_range_fault_unlocked_timeout() for
 region faults
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
To: airlied@gmail.com, akhilesh@ee.iitb.ac.in, akpm@linux-foundation.org,
 corbet@lwn.net, dakr@kernel.org, david@kernel.org, decui@microsoft.com,
 haiyangz@microsoft.com, jgg@ziepe.ca, kees@kernel.org, kys@microsoft.com,
 leon@kernel.org, liam@infradead.org, lizhi.hou@amd.com, ljs@kernel.org,
 longli@microsoft.com, lyude@redhat.com, maarten.lankhorst@linux.intel.com,
 mamin506@gmail.com, mhocko@suse.com, mripard@kernel.org,
 nouveau@lists.freedesktop.org, ogabbay@kernel.org, oleg@redhat.com,
 rppt@kernel.org, shuah@kernel.org, simona@ffwll.ch,
 skhan@linuxfoundation.org, skinsburskii@gmail.com, surenb@google.com,
 tzimmermann@suse.de, vbabka@kernel.org, wei.liu@kernel.org,
 skinsburskii@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-rdma@vger.kernel.org
Date: Tue, 07 Jul 2026 12:47:15 -0700
Message-ID: <178345363584.660027.14063544694872741718.stgit@skinsburskii>
In-Reply-To: <178345345668.660027.2952911919681614557.stgit@skinsburskii>
References: <178345345668.660027.2952911919681614557.stgit@skinsburskii>
User-Agent: StGit/0.19
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

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

Signed-off-by: Stanislav Kinsburskii <skinsburskii@gmail.com>
---
 drivers/hv/mshv_regions.c |   54 ++++++++-------------------------------------
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
 


