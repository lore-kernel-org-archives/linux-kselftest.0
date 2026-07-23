Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE72247D461
	for <linux-kselftest@vger.kernel.org>; Thu, 23 Jul 2026 17:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784828222; cv=none; b=Ilj6dvVGQQeAjNQEnuo6hCS4L9qf/JNjrK+ilGzOm2J3nQyMLY28YuB6Tiow0jpELvw1fuedz+VhJNGURDlO/WwxhOq/TXMWHNPswdCNTs4X7qbWUtOLXkkOfsx5HOCVfmWOeN1ZRtX/8KVb9Xt53U0RnSUj+kPosnZw43MNkcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784828222; c=relaxed/simple;
	bh=KaVy0LDD2WZ56zIlG4jDVljfxrz2j27JL0AnOSACkpk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bY/qGlv/JuGkq1Qvf8o6P04W1nn1rvyVXZCZdYRU7K+9aOcGcfFXo8/ZaQ7Wd1AwPbtmADZO+q9y9xtuLwriGs4I//t9FRfetJ8b6VttIvLlmcWn1ybdA/klhXFeP+uHd/iLQgL73QxzM0UQ2g7I0XZsaA/+59+KmDSOzIChPK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F5I5dTg9; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F5I5dTg9"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8485ef63b68so948401b3a.1
        for <linux-kselftest@vger.kernel.org>; Thu, 23 Jul 2026 10:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784828213; x=1785433013; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WVIK4CTS2ebWqFuX16f+6TzH9lK4l3CZHr+WHLsMqrs=;
        b=F5I5dTg9VBzF8IrLEaasAUXZbc35tqzwAdoCUQ+NS+RPMYG4ODlhVr8S+6B/UuWGme
         5nCKQSaPomN4EIrV/rrHdA4D3MkjfWEDRdyrsclWwLhfDPIRXUVSsAxe3lrjbkWlC6Wk
         BFMwS7j5ueHyF+Fhk3FNrDSgn2jSv+P3bE/+VgkKRpme6Zk/lOCjvB9UBmt684//KJmj
         Mti36tLu0CGwY65yJWBr0wu7SJonL83xRNavFj3yrK/7rnlAbNNGMD8VpGeX7fUQSJgo
         QUbVnGlGAiMX0eI8uW+iDZL7L91QE/E48bsOvhKI7fvifHhKAGII41iYSw2p6v6APLyT
         5CGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784828213; x=1785433013;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WVIK4CTS2ebWqFuX16f+6TzH9lK4l3CZHr+WHLsMqrs=;
        b=eqXbULJc4kjq9Ex1g8RwFjwMlS1w7mZtxHfk6IIknUowq9qv3MhT3tgMzpCUFe+Z7J
         ig2JK0B1GUKVVXqG6CeOWegS8BczHMXiwrBY5YXVgvhRCb/vh9FmR7gZ9ps1c0zVHgps
         ikS9SdMbVmTN1Xs2ccQWiP8BDtSddHLmFKv4pnJMnQq44eMkTT4KA7txg1QrEju1FYD4
         nwxnqbrWsgQtHSEvbW6wjU5vXLi7M02Tul3XOMj0nUNZdlCNxvMhir7Ar+tyDK4KcZAp
         jStyR8wspB80ZLPd7yTtIiR+j6QajxxHrRXqsRSBSS0lmqP1tr6frrKhHawzDRqciQLU
         1i4A==
X-Forwarded-Encrypted: i=1; AHgh+RrPWakmlDtqBXA/994CghcOhpF84RZBdRm5+a262BtbRdmDU/eiGl2Ze82grLwRG8yMpgyXvDjZy8js6AR47rA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxiTbv6KKz1ZXVzIbL7/aUFQ2woAdY5xPPhNVTlv6CD1Gx9hBSx
	HjeU9AjFTHttsVoKA7qlOpbRviXN3hF4lzFjvAWOzzuEuMu+I5efBFY2
X-Gm-Gg: AR+sD12zKobq3/Ft+agao7aGyb98XZbZRg3UyqEYMS5taVLZ9JLFW/s2n+tmecFdGs/
	bzTIgGGwMDJTOW5uRhOUNGXhI7yU0MnnTswV6po9oSbhaLcl7VFpfDE1rMCTkIcVNanK6batttw
	Z/OoACQZKBjRzytyPvKF3xgXHkDAgVoluN88qeJtdNmOrG5vJX/eMoFuS69subHWioQz5m9bBIQ
	z0r6fWHElMv7gl2EsPpLLDFPIzWRLi6VePAZw7ZQPIsIEKnxRhY/gtFIvaddLTxq+fTqi8QYns6
	51YEnbD1h4rcalQnPKNTIvvjrN0T7IOybebDZYW4qVJUTOf85ab7hKykw9S3Es+qdEQ+7VaWJHe
	Q1Gzu/3g4rTcnnj+fIGhjlOp3h+FJglOKizEHXDep9F0Ps+y5SgCHsT1ADtZCczFmBqyx3qsJj9
	vlNOmAsH/11lLqLF5pRpsdZxnClYM5zzAgAVRJgCa1OnKzp7tq
X-Received: by 2002:a05:6a00:278a:b0:848:42d0:bc91 with SMTP id d2e1a72fcca58-84e2b7f4d38mr4894542b3a.12.1784828213088;
        Thu, 23 Jul 2026 10:36:53 -0700 (PDT)
Received: from [192.168.0.160] (c-98-225-44-182.hsd1.wa.comcast.net. [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e20622dedsm2691612b3a.11.2026.07.23.10.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 10:36:52 -0700 (PDT)
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
Date: Thu, 23 Jul 2026 10:36:37 -0700
Subject: [PATCH v11 5/8] drm/nouveau: Use
 hmm_range_fault_unlocked_timeout() for SVM faults
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-hmm-v10-v11-5-c55b003a4b61@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784828202; l=2163;
 i=skinsburskii@gmail.com; s=20260722; h=from:subject:message-id;
 bh=KaVy0LDD2WZ56zIlG4jDVljfxrz2j27JL0AnOSACkpk=;
 b=KV2nZSPyVg1Dt5uSSiSffiKfkGgb7W3sWOI6CSqvJIxSZb1CjTMqYYugO/lEA7iz8WZFfaBr6
 LbFOvRd/oG3AQDmUr73ZTQ/tVrKY3HQM715K46T+2IVDrVm2X1nPXe2
X-Developer-Key: i=skinsburskii@gmail.com; a=ed25519;
 pk=bDpriHBYgeTdkIDweZDCemxsU93neJBOCn3YLIuJpnE=

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

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Stanislav Kinsburskii <skinsburskii@gmail.com>
---
 drivers/gpu/drm/nouveau/nouveau_svm.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
index dcc92131488e..58735446d783 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -678,20 +678,22 @@ static int nouveau_range_fault(struct nouveau_svmm *svmm,
 	range.end = notifier->notifier.interval_tree.last + 1;
 
 	while (true) {
-		if (time_after(jiffies, timeout)) {
+		long remaining = timeout - jiffies;
+
+		/*
+		 * The HMM timeout only bounds retries while HMM is walking and
+		 * faulting the range. This fault is handled by a kernel worker,
+		 * so fatal signals from the faulting process cannot stop an
+		 * endless stream of invalidations here.
+		 */
+		if (time_after_eq(jiffies, timeout)) {
 			ret = -EBUSY;
 			goto out;
 		}
 
-		range.notifier_seq = mmu_interval_read_begin(range.notifier);
-		mmap_read_lock(mm);
-		ret = hmm_range_fault(&range);
-		mmap_read_unlock(mm);
-		if (ret) {
-			if (ret == -EBUSY)
-				continue;
+		ret = hmm_range_fault_unlocked_timeout(&range, remaining);
+		if (ret)
 			goto out;
-		}
 
 		mutex_lock(&svmm->mutex);
 		if (mmu_interval_read_retry(range.notifier,

-- 
2.43.0

