Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3234E3EC683
	for <linux-kselftest@vger.kernel.org>; Wed, 15 Jul 2026 18:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784139403; cv=none; b=YBq7x6PZJ0vFJy4kNu5FMsl8YR9C2TSV+Wp3M8kboN7+nQvdy2YSqWxMb/FQtBVktF3YVA8tmdyCwELNF6SFqiwocIwYYpg3ApHezgTEvRziyCn7dIU6F8cPZ97gGvHOo2wsEfHO9Xaq7kno75kbNzBkAg3YYCFtqXqS7ZEJoVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784139403; c=relaxed/simple;
	bh=QDkn/RQPvTt4rCrtIK7bOiEWlSwSa2c8a6ijlJ6xk/E=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JiDgZVaZhSUB97nNqTk+pfI1q9D5aYztKj0Gds8XNnV+zNLhKKF7LqfSmm146Pzz2Q54bqsCsigmzrxBCirYimEFDMtjsT6XWoK2MnJsZIBEvLVmkwZftS66npe5b5/inl3ui94Z/Gk2BuTuON2SFzw9FC2bqBQnkqMXhrU68E0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HWXDJQHB; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HWXDJQHB"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cabc0a1ab6so68401805ad.0
        for <linux-kselftest@vger.kernel.org>; Wed, 15 Jul 2026 11:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784139400; x=1784744200; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:subject:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=xews/oLHPsdqsmPpn1oXU4/lUwRmc6mOTrGvCA27l7U=;
        b=HWXDJQHBm4rFxdLm2+gv56gw+psJw2vVt5OZf1Y01gGSkeE4EW9Iw1ITC8mJfcU9Mc
         nFmYSlzE7OrNHy8QGK/stl3aQHjzk3uld6y7z/UymSuWaCx41XhpjaWVuqqQ9SghtLWI
         n+UzeG8MpoFpas+nJieykgj/qH1+p6tZfI7GAgeF78ymdjVvyiilieEiTbAOvbZQpeQV
         LFFoN4VDcskkFCsL6Eqpo2bQ1uRHo0Yrt6n0J0nSx72d39oyNsDMFjXeiV/4YtjN7YFi
         xCLO3M30GnghdfKEHgrM5/7c5EZPFD85fZuNth2j3B1hwals7RQhwaUFXVc0cTTXsxdr
         I2Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784139400; x=1784744200;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xews/oLHPsdqsmPpn1oXU4/lUwRmc6mOTrGvCA27l7U=;
        b=IahAwIrPp3ljFRuh8Ri852cDYzhR1q3ttMjqVr4lpmRsID+xddbJIo/g4PuJ70ielL
         jcBfBKkv0VrUPxhc0V7jELdsKiIFfMcyVoKNKPkdFXUWJfVHoQczJtDVuwiUVmpjIrgz
         +h7KuuQeQNOYfWOMR601raT+dJJjFhU1XaWquhQRIk+AErne1wCYM1JjyIPmK++2MYpj
         cyu2rKZckiCDglRftlwaDX8MKkSzn3XERYbuZi/iYo3jyl20N1hQ3Ifz9uXVr6bpM/eq
         pRmPaiEqDtOuvO5AlnbmBMs+IFdvc2s3DsBAyTbzySmDeLOPD/srS84WbRHOzEJRxhty
         0KGA==
X-Forwarded-Encrypted: i=1; AHgh+RoG8gYeyeifJ53JVI0SCg6VjuZHgccz767Lo0e24PckT0GOU9g8KFRrfpzs0NZjU9bjWiiIgtkZGWVWHVYo8MM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBzRmh2x6HTohgOZt0Qop3Gsr+kYTcp7OyGrCNMkAtD92IA4nD
	E+5+B2WUmu8AGfv/Ov72/sOxgY/w3DLeUPc1RUwmeN+vIjGM1m26M4ku
X-Gm-Gg: AfdE7cmUzfA6iPGqsMHYyoZg3oEISEBqkXrxIp2mOlAwzvXkemxC8wFbxWm6R5w6oza
	6jYYNSak3KeGueS0U6uSIvqJGM5HI/2bBIF5Ouf9Ljmn3jqnt9sg1q+tDv7O3nLiyYo55nKNLJx
	Na62HPm/ywcQ/UBJRh2LO7HPcDr2ZfzTcFlbn2+LuVwaR8L0Byh2J4kZm9+VNUA4nclTOIbnEUZ
	KDOyj3Gjn/aF/yMfmxzI4j3vw1sPZsKUwnqefpEgZIP/CcRMEHbLhCfpj6Jzz7snO5t11gfgCaN
	tgfz4wc6hFYVp9bO56GVHxT6se5oEGy9GgxwhcqCT9wNmqiJLmbDLAD5Y6CU3/hToTuRunLp+Aq
	OaaqANc+YT4i4hAO7lPtmPS5BWX4Mqz8U8MdPoeSnXzJK3QqE5OfKtHSDWw9R9OwebxFkYDP1XJ
	7ynP1+o0PCeJ87sheIygKTdwL/XhIp+N/yelJoD7ejaPwAQgW/aBcl1kfEGkQ=
X-Received: by 2002:a17:902:ccd2:b0:2c8:4c29:afeb with SMTP id d9443c01a7336-2cee9a64cf7mr89372715ad.8.1784139399557;
        Wed, 15 Jul 2026 11:16:39 -0700 (PDT)
Received: from [192.168.0.160] (c-98-225-44-182.hsd1.wa.comcast.net. [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf10592040sm6621985ad.55.2026.07.15.11.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 11:16:38 -0700 (PDT)
Subject: [PATCH v9 6/8] RDMA/umem: Use hmm_range_fault_unlocked_timeout() for
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
Cc: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-mm@kvack.org, linux-doc@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-rdma@vger.kernel.org
Date: Wed, 15 Jul 2026 11:16:37 -0700
Message-ID: <178413939750.1155966.3639451690646685854.stgit@skinsburskii>
In-Reply-To: <178413903133.1155966.3904063656020521607.stgit@skinsburskii>
References: <178413903133.1155966.3904063656020521607.stgit@skinsburskii>
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

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
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


