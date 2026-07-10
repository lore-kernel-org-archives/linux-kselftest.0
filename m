Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 840173BFE2B
	for <linux-kselftest@vger.kernel.org>; Fri, 10 Jul 2026 21:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783718823; cv=none; b=hRYhuTMBXwGdLC0dPw8mifvgwO8yJ3NXrfNcyODsFKDAcjtmWauuaJfLeirU1Gc/Qw/76OMVRU1Gbfd4EpDzg3qkGkIZx9s7C071+LmwObVEsEWErHMo1Enu5wU2aFid4lefTfvlsp+TCAVyb+xVg/NtH7pEHgfu9tgIle7DNAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783718823; c=relaxed/simple;
	bh=oLJSKeCx7nGCL58ICDoU/1+ilBudUYNfbCfVls0zVKM=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dDJiDGpmWVInA6dF9SSRW2T2J/kELW18HIWkyuhpFJUAdYOIVTu/z51ML4lGHibbNcbZ8MOhj3f4zxJk+ldGHVkGBPIjV04GtiPPnxYyHPFoSQejDvHZrugFQxzJQiBUL8v2W/dTVcheDN9TXUuLTrQVVRZU4PimBPOv1xpFF1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ba7UuVa+; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ba7UuVa+"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8485fad302bso1397827b3a.3
        for <linux-kselftest@vger.kernel.org>; Fri, 10 Jul 2026 14:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783718821; x=1784323621; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:subject:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=i81Mvoxwiz31acM23+HpM6LiopJwdOVnXlQ0p0m7OMc=;
        b=ba7UuVa+shzeXiuPbfIfB9GNaimyLY+aaJQs1V/AfART1SAYnwC05hG3fJSB4zEAY5
         Mp6DpLSz6dcfovvJCW02nGUWjWMqMfKR8WZCdLGpdVCZmrFzDtxEEV/IrLQubfWCHXLM
         GbWkTPuSqIcNXWWcUCP35u9sUBZD+BfSEBpx84eUuJS0txs3mw+Yar4YvIQOf0I+8D68
         GVkWroYoz7DqW7ETsBUHS6PEtmLBHHhp2o4YujhYBDKDV+PCp9hVutWg9A6alTITfMcX
         jhM28s7vJCz4Ll1UUG/0IHb/iVNyczMejjsKintfCJXKf4CCt71Ba1i+Vlxkr/nAxLRl
         CEbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783718821; x=1784323621;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i81Mvoxwiz31acM23+HpM6LiopJwdOVnXlQ0p0m7OMc=;
        b=KLtNQB171lZDLjPpCEJn9WuxWWUBZwzl1uRJ/NE7h4l82zYNjrnipFms/Q8qKnZza4
         DnyP8iw814iZYHEuYiOPlSBdJVKmCRLaoUXZa23tAID9sgYW7bioeqwk/X2eQtNkk3aP
         NPa8v2+PK2PwF6xkQKLexJfpXCXm0xv8WcodYFotxLw3ETm1BAh0GDX0EBRuyEuqqBUw
         pxTxalP4eUYY+k3ZcLyEBWSSL4YnMQPlYur+6jN+UHjDL6dLAhdtlYTHC94s88Hjk0LV
         OGLRTcvrl2jCc7LnMXQ2U6cYsb8J8G94SA+MQH6pulniHUzBlN3dudry60nQafANvbe1
         3zdg==
X-Forwarded-Encrypted: i=1; AHgh+RotwHKspsGBeexcyBHUjyM2W/3xO8YJlY7decFIl9D0yt0bN5f7f4EzBhxo+qmXjd+lDUZTzSRVZI7rwzuDuK4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx47s2G4aGy4qYjTSi1t+6vY9JLbVqeJ2ODsrq+bHS02pMCp/xd
	2ZCClRFfSE5cXUz2MbQ92dLxPsH5vDht/m/0ImSOU4hyQRI7NsIH4tcH
X-Gm-Gg: AfdE7clbpi2OXpNsX1LjwffGo6WYGl4EyXjJhIdZozVbcfcrozqrmC0LXFmWPGf9KYW
	R9bkPIhPLqXTnK6ZwBNOWVAc909Z6ZNou31jxW83bPlV/Wte5J1gbQJJFq0sLeRPiF13dYi96Wz
	qlNMooE0iIzczA8pUZx99ji8/LfeW3T0VMaRlNGHfOCO3IKv0F1IRDpy6FR1A2N4+Fclsl4/ss1
	qDmN3P9LtBkNhqpxAZOAbB2cyfGvs7jj8tiLnwYM+q1b3jMyK+tmXEhXveooKGSnC9hjUbsmXVe
	E5LlIYVKjvLP9uxkI65kc222X2ZF52d1ZseOnMP/l2a7HmUEQox/Tg32UuiWRAtCddOuj04HZ+C
	fRPBF//baBrFyWZGBOJ0Ksb/Qwt686CwqCyupk/p3KBo7zBGY95/xcyYIysQArDos6d6Haz77ES
	evMc8QkODkhhdNtNp4oZh37G31/RU2WNWudlqFXtnepzqy+rgOYVwy57EzAuyp1nQWX0+PrA==
X-Received: by 2002:a05:6a00:a0e:b0:847:7f38:27ad with SMTP id d2e1a72fcca58-8488975299emr661948b3a.53.1783718820769;
        Fri, 10 Jul 2026 14:27:00 -0700 (PDT)
Received: from [192.168.0.160] (c-98-225-44-182.hsd1.wa.comcast.net. [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8482b333d4fsm6649821b3a.54.2026.07.10.14.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 14:27:00 -0700 (PDT)
Subject: [PATCH v8 5/8] drm/nouveau: Use hmm_range_fault_unlocked_timeout()
 for SVM faults
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
Date: Fri, 10 Jul 2026 14:26:58 -0700
Message-ID: <178371881847.900500.8789369230260725500.stgit@skinsburskii>
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

nouveau_range_fault() takes mmap_read_lock() only to call
hmm_range_fault(). It also keeps a single HMM_RANGE_DEFAULT_TIMEOUT
deadline across both HMM -EBUSY retries and post-fault
mmu_interval_read_retry() retries.

Use hmm_range_fault_unlocked_timeout() instead. The HMM helper now owns
the mmap lock and refreshes range->notifier_seq for its internal retries.
Nouveau keeps its existing absolute deadline in the outer loop and passes
the remaining jiffies to the helper for each fault attempt, so retries
caused by mmu_interval_read_retry() do not reset the overall retry budget.

Nouveau still validates the interval notifier sequence while holding
svmm->mutex before programming the GPU mapping.

Signed-off-by: Stanislav Kinsburskii <skinsburskii@gmail.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_svm.c |   12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
index dcc92131488e..4cfb6eb7c771 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -683,15 +683,11 @@ static int nouveau_range_fault(struct nouveau_svmm *svmm,
 			goto out;
 		}
 
-		range.notifier_seq = mmu_interval_read_begin(range.notifier);
-		mmap_read_lock(mm);
-		ret = hmm_range_fault(&range);
-		mmap_read_unlock(mm);
-		if (ret) {
-			if (ret == -EBUSY)
-				continue;
+		ret = hmm_range_fault_unlocked_timeout(&range,
+						       max(timeout - jiffies,
+							   1L));
+		if (ret)
 			goto out;
-		}
 
 		mutex_lock(&svmm->mutex);
 		if (mmu_interval_read_retry(range.notifier,


