Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480113B841F
	for <linux-kselftest@vger.kernel.org>; Fri, 10 Jul 2026 21:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783718815; cv=none; b=uqbAkxYY/t33znS0ewQ57qwadGzO+AWNxIAP2RTiTovuw1ann3LvV7GWhg5wjmUOPSmVAgy1ZVir81nX84RZnVGU5VbUKVCZoQcYHTHgklfnVmzR1htuMlJ9NxfhV58fpwaOCp21KzWaKPruTsY2BfuJI675itmQVyc6EfhDebc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783718815; c=relaxed/simple;
	bh=UH8EdkvxcBQr7tFP4cWIxItcXG4Yona++Xa1OoLjzWw=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Tat72xkrQ0MUcnQyMs7sXzw3bW2YX/KmnavN7pksFH+0ndnG5iydwzDHHiGM8ksiKJT9ucYgYkSjz52D+AK3CHA2Ybz5Ar4ueM07/2Xo4k/kRKblDPzjf6tnC3bAHRKGRiWb4uA3g7zSETawTq2cSeuUSJnN+6/S9yAluKw7BK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PS+elB01; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PS+elB01"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cad8076b01so16881525ad.2
        for <linux-kselftest@vger.kernel.org>; Fri, 10 Jul 2026 14:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783718814; x=1784323614; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:subject:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=3sr6piRbjR+cpoS2FsjQdy3tGYWA8BG46QjFZOECUzI=;
        b=PS+elB011jwqaknWI3rbhruNlyMs7K66rAnCdNtjmlTTNBp+Av55fUFSi/OFOLpXuu
         4hOprDlzJe+ADXayf9himYn0L49KlhKVLfvhOkKJjVFZghqGHPslBBwomaSYndjkm+33
         IZjNe1ISOAOD4VuAwc5okbzUzGhQWKXNlJgTLhX8/FNoeu7VqHe18PpJrj0EIoNrWglo
         YhunuWdBiBzC0JrXTcou9vz6fyY36vbBDkjmHNJM8jju2inJbO6EBiofJdXJjfg+q6Sb
         rQPXjPGYCl5rJlsuwc2Lq4ilyNnC4vrCBaCU24kX1gWZdvjopWq5iIeXnC4zxGVPTYHO
         vSgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783718814; x=1784323614;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3sr6piRbjR+cpoS2FsjQdy3tGYWA8BG46QjFZOECUzI=;
        b=MXLn5y17ozl0ePHJZBvGmgZ5ZC4yI9CqNoti7WY/ANhu7PlEToEzEQ9n8icgGCAjXn
         ZJxyqlf4vxNLFDTUGohsWBpnh3lOTnrxHG0FPBhscfZ2orahftNE0X0hZNMN39PoU7Qm
         nMTpPfGBq0DuciChPyJdO2UlOgWbzzu5V2O2vm4tOUo4IOZvLaba5/COC9bT76PlNOdS
         Af+bWhk2uiskFblbVfxSjyAp9IOf+1/HxS2B7wZ+0jnR29GE6skiSbz0r9teWNGjsFKr
         990eGp0dW0s5BqTYfyRpNPa75Wg1VtGfQMkbaZEiwSrS/8QIq6q3/HsWtS/XTfEIzPkt
         Gk/g==
X-Forwarded-Encrypted: i=1; AHgh+Ro7VwzeuGg7CJoNw+8qysZWisOaKYGXt0WgvddFricgH4FAyDfisyjLLFVelvnQY3sNdxAFjuZhV5BsZhckqz4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIQbh+jXvS0CG2lvqWDCcBIurV1aiM1Hnhnkyd7pd2jwW+qXn8
	eWyhQLta9YRnRL3Hk7XnsR/V9hROSvp0P8ClAW5ABUKJJV25jNjzT41T
X-Gm-Gg: AfdE7cn+XtfmneeuZs13SZZr5R2/O8LtV6uVI0GCPntgiCXJa6eztNl30oMD8SAPh6z
	ZylSqjWQsUPSu2A+Bgp2/t4HSs/dh3jetX6o8SORtqhecqmgQ59ma/H5pcciwBaXvkVLRRP5cH8
	Ze+PAn70Vq5XmkrBAWIyZxcXGftMyLMdnm30xUwlzc0BGsXXDl9CdP1O/aDaUHGHIOLzGj7GfoU
	K12sC0KaxHzYbYdlwRAjeduItfNBcJ5dNfHx/gzZ5FiQtr4pGkDw5W4KxLzWdfUqmRPBzSu/mYY
	XhqyI30fLV1TAZJhke0H6vj/1Sx4R1gdlyQoqSVT3BxvNatVHiOACoDOgaMsTdUdgLRFdeoDNps
	CusEa7+n9ATP0ixuMSCMsNHNIAtW6vt42wAKJvkyfnPv0pTed3N53rtMY6+4KyOSzpB42NSIts5
	DKYxUQUHLMM8y1D6jIBHIbO/uaVmdXMoHKkA9R+Zymv0fzZKmObeZXC58XZ+4=
X-Received: by 2002:a17:902:dacf:b0:2c2:7baf:139f with SMTP id d9443c01a7336-2ce9ef1bd15mr7721375ad.30.1783718813633;
        Fri, 10 Jul 2026 14:26:53 -0700 (PDT)
Received: from [192.168.0.160] (c-98-225-44-182.hsd1.wa.comcast.net. [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d1e0c4sm66015545ad.49.2026.07.10.14.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 14:26:53 -0700 (PDT)
Subject: [PATCH v8 4/8] mshv: Use hmm_range_fault_unlocked_timeout() for
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
Date: Fri, 10 Jul 2026 14:26:50 -0700
Message-ID: <178371881034.900500.5214601525971121683.stgit@skinsburskii>
In-Reply-To: <178371866223.900500.12312667138651735591.stgit@skinsburskii>
References: <178371866223.900500.12312667138651735591.stgit@skinsburskii>
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
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
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
 


