Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D294B3B71A9
	for <linux-kselftest@vger.kernel.org>; Fri, 10 Jul 2026 21:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783718831; cv=none; b=m4sbVgVYtmd8LCtFkmfSr6yivG5Tg2ghbrcjZ2vOL5aC3i696Zcmkp6V20qvVAcTN+5an4HCLlUGQO5sk4WdrOs7iOxDAUElmGPcr2MSmGIvM+oK8ZE0RYsC8KEj6uEDFXUs7BDRg+zaICnWF8O7aEesLkuQnWOdeZbHn0oPZys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783718831; c=relaxed/simple;
	bh=yo2fuaOVnmkl0q7h8FrQEKV1A9VgItwbSFDMrCikuws=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MCCFPcIp1FulDCkVHOdQNgH2GacFeTKHF047PraMqEISFSmjAQ0KTp5ORNblgktjA6HE/Hblosio1xorxUcNKLL91jzJCWDm85Xw8cEt63yBNJFrUCSUssdFmPkF1Z7KXjQwWNJBGfmERoS5RGE87XhDoK0+8kYth64GlLwPAYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jV9auuzD; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jV9auuzD"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cc6dd436c6so15163555ad.2
        for <linux-kselftest@vger.kernel.org>; Fri, 10 Jul 2026 14:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783718828; x=1784323628; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:subject:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=rz6324+iAv2KNy97kcq58R5fN0X8s7ommcJ7e4qhr4M=;
        b=jV9auuzDZvDj6VMojq7BIoqTG51cW0CjJxBYhNbsuPpcz2Ct8Eu8lMGcH6kfxw144V
         yITXCfFyOtrQMkmFOG06jUY4YyptbhnwHE813n2NLHHkiTxUIvTsDk4JgPcWRlCwqnOG
         UEnSMycGR+PrpW+DtQG7/RAuLyDUbhD0JNV/oE3ujkfjTKYz3lobUU1NHDI5qf6/tsgk
         UCEJljPHpCE6wO2Tbcg7QlZFYjgeiSAVjRXsj1Xn8RVniVaP1unc7qp5WJ0Khys/jTjl
         +6x+uXb9E/v6g8vcbPpsV9BhFKGoCCP1bz2XMCxWBzfOws0sCCDMQgMkc81wMf7q5+JJ
         91EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783718828; x=1784323628;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rz6324+iAv2KNy97kcq58R5fN0X8s7ommcJ7e4qhr4M=;
        b=VN6S+p/mfehgsnBPT0RCvOktZ8lUgmcxhxTRa60HT8X1M3bAczk1uPqjVaIWf1EOg+
         MJ+HATcwEDDd9cG9uBz50RH6R/86d4Bqox5K4WH41gCA/WB8Ex06sTj5ahWU7adM4kxv
         XlYYaxejOmF+ll2SfSzuzy7bE2OwvNP2lEb/md4kakYtyW1YxKRI6o9HwkrSks12IQMB
         0l74yyvRsLn93bp61pC05SXmGqE+Fr9OFexEjbSOtmJhOPk/pocQQmm8IhBlpasArQtF
         jUEhaLSsO8vjA2pBfZCXxIyiksTfOBQeiSnnYTMXnL3Iar3QjhdvhmGY4cro8euGOrnS
         Pw3g==
X-Forwarded-Encrypted: i=1; AHgh+Rp0aDJUqJxg3v3LRtYCsXzVZPFLzecqNCFUql1gtdGJl1Dn7bvelNmz9+MKLhnXdLlRFN1/ijHPXrckUSbW0Yc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyA7ajnMbs858Xa93klpJC6yPKYgDEfwFiVkyy3nkb3nxSj+hbi
	pNv8p0HcinpBs5y0onJb5rAwL+VRXkI3DkyER1oiuw8lpYNuiRhcpoch
X-Gm-Gg: AfdE7ckXkBmLchw1JaYk08ds8G8R8yM1yEtC/PRQtlZUN6i/yXS7eefCjOQsITN1z2P
	FQCdvoOvxt4yKImhHawG3GEkFomEYAlc/pm+/W7Ak7oQKWGTaTSn4wrGuOA+zlLZXCYwZEr4L0F
	/aEYGPa0gJ7e8mBoVsGneH4X/SogMPn541AFCvEGSP9NsASOfoymOksEW7/cGDCA+ottiDvkpwk
	nh3Vs0roIAxF8BP/DgY0xb4jMW+MeHU6YAeegrYs79ph77KikXH0eRxbH4VQaJa/zIxmsZRo58t
	kub9Dyek3eeZH7Pxqgdn6vTLJ2WHTj3e6CWHo4VfsvBjOZ24YyI2do6ghgrsxNoeysYTQ9jKHy8
	wjkWY6Aet0J9yUcDpo3R4XLiJT5h0qDeEkPkhERG/HAz1gLQlqLt0ToziK6Chm2EU3niH/tv2aK
	QoBJWxMS40f99HVUEoxUcFuAUjCTqWJewa7KvBEhhmRI+C7n+n95kuwn7bHZ5flrnQ/vBmwQ==
X-Received: by 2002:a17:902:d98b:b0:2ca:1bbe:c3d0 with SMTP id d9443c01a7336-2ce9f3d5e4amr6769265ad.43.1783718827906;
        Fri, 10 Jul 2026 14:27:07 -0700 (PDT)
Received: from [192.168.0.160] (c-98-225-44-182.hsd1.wa.comcast.net. [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3bd33sm65951165ad.58.2026.07.10.14.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 14:27:07 -0700 (PDT)
Subject: [PATCH v8 6/8] RDMA/umem: Use hmm_range_fault_unlocked_timeout() for
 ODP faults
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
Date: Fri, 10 Jul 2026 14:27:05 -0700
Message-ID: <178371882559.900500.4008217424194230517.stgit@skinsburskii>
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

ib_umem_odp_map_dma_and_lock() takes mmap_read_lock() only around
hmm_range_fault(), then retries -EBUSY until HMM_RANGE_DEFAULT_TIMEOUT
expires.

Use hmm_range_fault_unlocked_timeout() instead. The HMM helper now owns
the mmap lock and refreshes range->notifier_seq for its internal retries.
ODP keeps using HMM_RANGE_DEFAULT_TIMEOUT for each HMM fault attempt,
while interval invalidation retries continue to be handled by the existing
outer loop.

ODP still validates the interval notifier sequence while holding umem_mutex
before DMA mapping pages.

Signed-off-by: Stanislav Kinsburskii <skinsburskii@gmail.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/infiniband/core/umem_odp.c |   18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/drivers/infiniband/core/umem_odp.c b/drivers/infiniband/core/umem_odp.c
index 404fa1cc3254..9cc21cd762d9 100644
--- a/drivers/infiniband/core/umem_odp.c
+++ b/drivers/infiniband/core/umem_odp.c
@@ -329,7 +329,7 @@ int ib_umem_odp_map_dma_and_lock(struct ib_umem_odp *umem_odp, u64 user_virt,
 	struct mm_struct *owning_mm = umem_odp->umem.owning_mm;
 	int pfn_index, dma_index, ret = 0, start_idx;
 	unsigned int page_shift, hmm_order, pfn_start_idx;
-	unsigned long num_pfns, current_seq;
+	unsigned long num_pfns;
 	struct hmm_range range = {};
 	unsigned long timeout;
 
@@ -363,26 +363,18 @@ int ib_umem_odp_map_dma_and_lock(struct ib_umem_odp *umem_odp, u64 user_virt,
 	}
 
 	range.hmm_pfns = &(umem_odp->map.pfn_list[pfn_start_idx]);
-	timeout = jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
+	timeout = msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
 
 retry:
-	current_seq = range.notifier_seq =
-		mmu_interval_read_begin(&umem_odp->notifier);
-
-	mmap_read_lock(owning_mm);
-	ret = hmm_range_fault(&range);
-	mmap_read_unlock(owning_mm);
-	if (unlikely(ret)) {
-		if (ret == -EBUSY && !time_after(jiffies, timeout))
-			goto retry;
+	ret = hmm_range_fault_unlocked_timeout(&range, timeout);
+	if (unlikely(ret))
 		goto out_put_mm;
-	}
 
 	start_idx = (range.start - ib_umem_start(umem_odp)) >> page_shift;
 	dma_index = start_idx;
 
 	mutex_lock(&umem_odp->umem_mutex);
-	if (mmu_interval_read_retry(&umem_odp->notifier, current_seq)) {
+	if (mmu_interval_read_retry(&umem_odp->notifier, range.notifier_seq)) {
 		mutex_unlock(&umem_odp->umem_mutex);
 		goto retry;
 	}


