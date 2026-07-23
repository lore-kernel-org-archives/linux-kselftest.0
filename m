Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C94B47D476
	for <linux-kselftest@vger.kernel.org>; Thu, 23 Jul 2026 17:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784828228; cv=none; b=LtTHuBxRz1tXyEDnau89LQawlgeQUr+YAYK5ADPzT091NDFpS2/yXx6W9U0O/0aXhHeavuV43FN1+R0d5bEZiN46RQPQ8yYUK4VU2hHL+C1lBYukIH+VSkzYy8VIR+28iAIpe1Qpe9Je+/sWdcEg64rfMI0YTL8uMjpAJ8wy1Do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784828228; c=relaxed/simple;
	bh=OHRNaT5JjbQYbg0HfVsh/goi/Wp2JeVv837tKjXheiU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WeYMDAf4D8PxyRKqA5/cJn9sHXr1ED71qPg86iZFcFFges2ps2NyvfClrWgX0zWhpw6ye4mjzmJe+pM1SjH8SdagCY3KeiU4hiz/1rWH5JftZZQ7Qe1uD2QSXxvBnu3K26afimwPsgPqgDbZt9hhlelg0L2XhFKu5bHAtCqAmFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WSXNC98m; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WSXNC98m"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-84e3007a2b7so771273b3a.0
        for <linux-kselftest@vger.kernel.org>; Thu, 23 Jul 2026 10:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784828218; x=1785433018; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i8Qd33SMLkRtmqANiDW8AEhl0t9s2Dut7/75bk+4IdQ=;
        b=WSXNC98mn9E0uZv6c2hSBxaJ5THbotrgF8Z9RkvDYuq4Q4evsHpW4g3mqJYQWggIpf
         zt0Gp0677ef4lE+UEuWL6cq09YFhfDkld1spJvjM/x2tEbA5n+/fYqZSj6/fh9IXcCTu
         ixmXyltpDNi/NOEf9arwP00oJMN8zMDDDnQRimdOkX2p4kTQDi8PjYqwaCtc9DgMkCxx
         c64FSyVvbcVHAJtVXLCEExjtElC0ViZjOER1MjCb/lF7xwMYJ8wnYTOeuoqaDZ/Lyq/E
         BIdjNu3rl7Vd3ly213tz3cfTC31gvKlDq9z/0YF6dMEzjdJYXBn35fUWfRiuLEwR4v92
         Xr2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784828218; x=1785433018;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i8Qd33SMLkRtmqANiDW8AEhl0t9s2Dut7/75bk+4IdQ=;
        b=kmDpI8Kgb3XyXfi0f4zFHK1dnN22kWAGt6zVGnlh0x9dU1k+joDzT2NJbwXJ7DfbiJ
         srwW6VLJzrt0taV6PDwF1Slf0+sNgvXN4RM/qFPm74hQm2OQcqYPyn8iUW9L2o8kLfX4
         s2jJnwi/Usb+kUpBQ3mARf1Ln3h4G7Z0lshifVvl5HNe8XHU7Bhh6pvpyoE8LsdRYcul
         gf1Mf5FJccu81UAWDc3iWCLv2ll9VBxEPCqbF9IeZrQ7tBDpWi8nYThfWGyK92999NzP
         1s4nqKOgch0CBCp/GNzN1k0RXeRFPenVJR2KOBkgRzj0ssjjKq3cLObdZdQEPy+UvX4Z
         hLWA==
X-Forwarded-Encrypted: i=1; AHgh+Rqvifym9qqK83FBLOJZrIF1HqE/L32VcU13mbcK62VO9fqeYDCMCAiOnmdNOtf3uugpYDupXIwcfSH7kHeKvis=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ328ArQ9ReU6Kbkb7sOcXjWmOckgpD/0sGgziKnOqMDBmkybF
	1+20uUZ6v4heiloATYwDSg3brx7Xomiw25f5WHOeTx5PBG03adLjx5sg
X-Gm-Gg: AR+sD11oD8Kz6JzQZiXj513TCg3+eRNAH7/U+BVeNfgHeYirqWwsQtKtFRDbXSLIV0I
	jpbydjdAPDPunIASM8iNlU6lUtFUHUUwrGuANBi45pBdgyXaPsHjP+xmDCRPulzNi87sVJ/gkRB
	BVwaUnHc68v+tMe+CqClEN8i+uZSLo34mXtVRKYRVxw3om1YcNY4PjUqwLXQDMEfPDPCZXlQImV
	F/81IyjOhinP/8rAdLyoZ7XqxKRkzxBZP2uHd/hjIQkIzngHSBU2Xgtg7PRXmV6kGSvWfkaXXiD
	YrlgJSp0bhWG6wNyNoPhYMM3ulUWc4VkIOto6B5XaHOc+SVl9o3cBEIcihF3yusXlFEQN7b3DRK
	pgzZx/1mvXtRFG3jGxC00VhA1umNrYaYkT6k2uH+loU088qQqy1Er8gAye/hWvahy65u6qz4Xq9
	KdOhqvTMaVPDtm8sRuLl94EauC7x6yHc0264OTQMV7dgwViPtV
X-Received: by 2002:a05:6a00:cd3:b0:848:88e6:95d3 with SMTP id d2e1a72fcca58-84e2bc4d259mr4728321b3a.72.1784828217972;
        Thu, 23 Jul 2026 10:36:57 -0700 (PDT)
Received: from [192.168.0.160] (c-98-225-44-182.hsd1.wa.comcast.net. [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e20622dedsm2691612b3a.11.2026.07.23.10.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 10:36:57 -0700 (PDT)
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
Date: Thu, 23 Jul 2026 10:36:40 -0700
Subject: [PATCH v11 8/8] drm/gpusvm: Use hmm_range_fault_unlocked_timeout()
 for range faults
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-hmm-v10-v11-8-c55b003a4b61@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784828202; l=4921;
 i=skinsburskii@gmail.com; s=20260722; h=from:subject:message-id;
 bh=OHRNaT5JjbQYbg0HfVsh/goi/Wp2JeVv837tKjXheiU=;
 b=3mS7hpEm1cC4EjlfjSHzs08itt/haPD5UmH5YZzhkX5wXqdTOzSMnls0rW++T0vSS8hxNEDOH
 H/0vN9YPqS8C3NJp8Qfk40j/53Cv5CNaQqrwQS1NX9qK2UYGBofyGE6
X-Developer-Key: i=skinsburskii@gmail.com; a=ed25519;
 pk=bDpriHBYgeTdkIDweZDCemxsU93neJBOCn3YLIuJpnE=

Several GPU SVM paths take mmap_read_lock() only to call hmm_range_fault()
and open-code mmu interval sequence setup before each HMM walk. They also
retry -EBUSY until HMM_RANGE_DEFAULT_TIMEOUT expires.

Use hmm_range_fault_unlocked_timeout() for those faults. The HMM helper now
owns mmap_lock acquisition and refreshes range->notifier_seq for its
internal retries, while GPU SVM keeps its existing driver-lock validation
with mmu_interval_read_retry() after a successful fault.

drm_gpusvm_scan_mm() and drm_gpusvm_range_evict() pass
HMM_RANGE_DEFAULT_TIMEOUT as the helper retry budget for each HMM fault
attempt. drm_gpusvm_get_pages() keeps its existing absolute outer deadline
because it can be reached from GPU page-fault workers, where fatal signals
from the faulting process cannot stop an endless invalidation retry loop.
It passes the remaining time from that deadline to HMM for each fault
attempt.

Leave drm_gpusvm_check_pages() on hmm_range_fault() because that path is
called with the mmap lock already held by its caller.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Stanislav Kinsburskii <skinsburskii@gmail.com>
---
 drivers/gpu/drm/drm_gpusvm.c | 60 ++++++++------------------------------------
 1 file changed, 10 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
index 958cb605aedd..e912e994beb2 100644
--- a/drivers/gpu/drm/drm_gpusvm.c
+++ b/drivers/gpu/drm/drm_gpusvm.c
@@ -773,8 +773,7 @@ enum drm_gpusvm_scan_result drm_gpusvm_scan_mm(struct drm_gpusvm_range *range,
 		.end = end,
 		.dev_private_owner = dev_private_owner,
 	};
-	unsigned long timeout =
-		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
+	unsigned long timeout = msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
 	enum drm_gpusvm_scan_result state = DRM_GPUSVM_SCAN_UNPOPULATED, new_state;
 	unsigned long *pfns;
 	unsigned long npages = npages_in_range(start, end);
@@ -788,22 +787,7 @@ enum drm_gpusvm_scan_result drm_gpusvm_scan_mm(struct drm_gpusvm_range *range,
 	hmm_range.hmm_pfns = pfns;
 
 retry:
-	hmm_range.notifier_seq = mmu_interval_read_begin(notifier);
-	mmap_read_lock(range->gpusvm->mm);
-
-	while (true) {
-		err = hmm_range_fault(&hmm_range);
-		if (err == -EBUSY) {
-			if (time_after(jiffies, timeout))
-				break;
-
-			hmm_range.notifier_seq =
-				mmu_interval_read_begin(notifier);
-			continue;
-		}
-		break;
-	}
-	mmap_read_unlock(range->gpusvm->mm);
+	err = hmm_range_fault_unlocked_timeout(&hmm_range, timeout);
 	if (err)
 		goto err_free;
 
@@ -1408,6 +1392,7 @@ int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
 	void *zdd;
 	unsigned long timeout =
 		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
+	unsigned long remaining;
 	unsigned long i, j;
 	unsigned long npages = npages_in_range(pages_start, pages_end);
 	unsigned long num_dma_mapped;
@@ -1422,7 +1407,9 @@ int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
 	struct dma_iova_state *state = &svm_pages->state;
 
 retry:
-	if (time_after(jiffies, timeout))
+	remaining = timeout - jiffies;
+
+	if (time_after_eq(jiffies, timeout))
 		return -EBUSY;
 
 	hmm_range.notifier_seq = mmu_interval_read_begin(notifier);
@@ -1439,21 +1426,7 @@ int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
 	}
 
 	hmm_range.hmm_pfns = pfns;
-	while (true) {
-		mmap_read_lock(mm);
-		err = hmm_range_fault(&hmm_range);
-		mmap_read_unlock(mm);
-
-		if (err == -EBUSY) {
-			if (time_after(jiffies, timeout))
-				break;
-
-			hmm_range.notifier_seq =
-				mmu_interval_read_begin(notifier);
-			continue;
-		}
-		break;
-	}
+	err = hmm_range_fault_unlocked_timeout(&hmm_range, remaining);
 	mmput(mm);
 	if (err)
 		goto err_free;
@@ -1720,8 +1693,7 @@ int drm_gpusvm_range_evict(struct drm_gpusvm *gpusvm,
 		.end = drm_gpusvm_range_end(range),
 		.dev_private_owner = NULL,
 	};
-	unsigned long timeout =
-		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
+	unsigned long timeout = msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
 	unsigned long *pfns;
 	unsigned long npages = npages_in_range(drm_gpusvm_range_start(range),
 					       drm_gpusvm_range_end(range));
@@ -1736,24 +1708,12 @@ int drm_gpusvm_range_evict(struct drm_gpusvm *gpusvm,
 		return -ENOMEM;
 
 	hmm_range.hmm_pfns = pfns;
-	while (!time_after(jiffies, timeout)) {
-		hmm_range.notifier_seq = mmu_interval_read_begin(notifier);
-		if (time_after(jiffies, timeout)) {
-			err = -ETIME;
-			break;
-		}
-
-		mmap_read_lock(mm);
-		err = hmm_range_fault(&hmm_range);
-		mmap_read_unlock(mm);
-		if (err != -EBUSY)
-			break;
-	}
+	err = hmm_range_fault_unlocked_timeout(&hmm_range, timeout);
 
 	kvfree(pfns);
 	mmput(mm);
 
-	return err;
+	return err == -EBUSY ? -ETIME : err;
 }
 EXPORT_SYMBOL_GPL(drm_gpusvm_range_evict);
 

-- 
2.43.0

