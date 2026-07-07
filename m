Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74BDD3B9618
	for <linux-kselftest@vger.kernel.org>; Tue,  7 Jul 2026 19:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783453653; cv=none; b=hLGq+87qO0KG0KcliuvIRIRJm9lcgcF43xSBYRmByWhcSzEifWyHZNXmp0YeEA73ywTQj0TcEN0W07+PPllUG75+VfZ7tzl5qe5yRuBMi51gMXqXB9C7mBtPScVTf4ssHyN2lDJBQ/PX6N71NDVr8JF1FGclZIxm4bHQPvdfGT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783453653; c=relaxed/simple;
	bh=o8/LCoChLc+cjaHIcTVW1iSpwRxITCscyW4bNzHeIFQ=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M1b4+l7xQrL5siAXj0fMrWPtn+drLa99aFpf46HNEKeiSdow9B/3ZpvvU5YAqAUAAgXXXXWX4o5jglkXxcUVJfU+qYlWtKFCHUdRV6lJ5HT4yNxtp4wiq7b381hUKucs+ym1NilTqb4/ygTNWa/i1vpcB6QR4lVAa3RGg0MlZOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mm79clkx; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mm79clkx"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cc73e322dbso30438995ad.1
        for <linux-kselftest@vger.kernel.org>; Tue, 07 Jul 2026 12:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783453652; x=1784058452; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:message-id:date:cc:to:from:subject:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MurgedTImf2dmSaSEEivYoY5j30SVqg6Is/CYFnqB6k=;
        b=mm79clkxUKgHtp7T+8PaY8N5LxlZQvwPZa96TfWFDtURf/utkayfKebvOSuiwap0ns
         JrIfcRXllWxf5E2VCMQoeBf1OtzmVRdFf5e9eLg2ZaF/2JoLU2vg1eA2poBXT+Aso0GL
         0pMq42MsLfMi249f+iiflIEys7jE3S+b5zpY08BXZIAuWBEuLugd9xCUPuG8ugHdytIL
         ln3xqmqqyHvvP2MtNLJyI/YOwKjLsxfTIa7bHLlzDjqqZ7zq9aMoNMjN92lkVVH5vI89
         wpe4qI5nrXPz0VON2fBEPeM+VvQI9sC/FpO/LexNabt6Yp6dFcjKiGeuXQDIWL82YWKK
         R1OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783453652; x=1784058452;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:message-id:date:cc:to:from:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MurgedTImf2dmSaSEEivYoY5j30SVqg6Is/CYFnqB6k=;
        b=SV0yy/relLVISup8QvOXBc4QzB0Ddeqja24inmusTXMdhAyfQ0Zjy58twMX0l1W6xp
         w7/PVFl0/yHmbNjbWcy06HtZirTUMqJzqqWN8Wc6+J5EWjUwzcaUgCRq+M6GyvsYYSYo
         UR8M4VTnUZZNRa5GxF06MRbzPUun2L7qqoJtJrJT5ESginxaHp2zdhzOVM5S01ougtYs
         f7kg9NnDUE2ggsEBZA8HsPbioi4WdwfaCLSFCjBB1i3vMdiKg64MIFlUZv2Wh8Y1M+HP
         19FZXxJX7sxz761AqJ53w+FVXsC4F6vjcZ8Qbcl512Z2ZetX/3SNlLSS7MnJ0ddHyWwC
         xcfg==
X-Forwarded-Encrypted: i=1; AHgh+Rq1uZT0In3H/8Gbtz9Zj2adeBHJdvwDNe7pCEMJv2cVHxg7vKi2dpxDZO+V4/Hz0t5g1FourNZplXLPUizyA98=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbX2xm0iSHxNwUCXiNR11U7MbJx7t43Ue4cFTCbpyE+ajBKixs
	9XU/gMNwmgWX1W18M+gI1NU5Z3oLZYoK34piHO2aUUgR5vYgsPCzJrg1
X-Gm-Gg: AfdE7cl2JQKjeJQxsKfzpFbk4oJlopeB5iu+Q3+GSOBla7DVaKN2OMV8WVrlOQFIS6+
	QhQ/J0B814lIgr/770Rq8u8baYtQ6LyJcnkRBiabR899XaMq/uFULOdqSTGubL4yoG+ly50qxEB
	H8ODNO3wCcxh/TKjMU7sKdSCyCJ2hyNY4RmVJzhnnG6L552AJvV63UcHMHa3m+K4YIpgqIFGn32
	+YGMdf9TXeGHp+Un0WOJqukKXn745pOHPsH4ML7S/DE+JvBzmeEdGDLw9vLhM14JBodsb0Em4V6
	B+J6+JFjIdSE7I2YXeEdM/NCTNlDWCcu1qP5GVFI6Ci4tdgkPIO+da3JF9SeWd6xaOcWIQ/6E7h
	5LizMEB4ohKPtuz0HR6TaIi+M17hzDm/6JYZV3QoG2HtRL7x962PjUy59MVcHv6JMiyW8rJ2b0N
	EpgNgDlRhFrxZUUb4LZaFwnc8r/goZG7Se4sKAJfNnR2ZuwIvZZmmXvyoaTRQ=
X-Received: by 2002:a17:902:ef44:b0:2c9:cf62:6f61 with SMTP id d9443c01a7336-2ccbe616252mr63274975ad.17.1783453651528;
        Tue, 07 Jul 2026 12:47:31 -0700 (PDT)
Received: from [192.168.0.160] (c-98-225-44-182.hsd1.wa.comcast.net. [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d1e0c4sm17270585ad.49.2026.07.07.12.47.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 12:47:31 -0700 (PDT)
Subject: [PATCH v7 6/8] RDMA/umem: Use hmm_range_fault_unlocked_timeout() for
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
Date: Tue, 07 Jul 2026 12:47:29 -0700
Message-ID: <178345364975.660027.8790629832830633290.stgit@skinsburskii>
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


