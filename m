Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C0A1442FB7
	for <linux-kselftest@vger.kernel.org>; Wed, 22 Jul 2026 21:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784756704; cv=none; b=AJ+lqzOiTg2s/lIN3iVebE24IbDQsFClxHxd4zuFJP1g95Wg1EuFkzgUgxyMequ3fxHlu9bjNWFEpx58+YYIDd5EOuRHFVTenWO9DLNpurwjP7O8cXOxj0aaqpQ7cjt8AGF5U85qt6bW4p0z79aZ3v2QZvlcF95wYBwa/At0gq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784756704; c=relaxed/simple;
	bh=JxcTBTW6lEzlUH9pe80rZJYyQZGUPa2uP7JaZIpbDO4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hbCsD6qQi+j/gblZfHapX4EcVPNlx/4FShHvwYKFH1X5XwW7ZfMlMp3rY8HptLebXdiLvEvlWeJkGbECqEtnHuhTEoz48/32kXzz3KM0LjoK36e7/ePoV5xEM/spydrFlkrOMs83kdEwOOIP5iN95p9xwLGgMQLTThItIws1uF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QEUHhGML; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QEUHhGML"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8486672f03cso12981072b3a.0
        for <linux-kselftest@vger.kernel.org>; Wed, 22 Jul 2026 14:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784756700; x=1785361500; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TSbIIq+MW5ujNCU6weGrEYnGd53JSmfWB5BOONHtR2c=;
        b=QEUHhGMLlERdp/ksj43uAtQfYB+uqlIx+aW6wnIUJLXOblYCFHTacX1v8ZLFDaRmBb
         ab77uFTIEJJ4vIYBPI33HDnSx59zsUnf2fnv8wBy9NWyQSivjbsekbWa3q2OM3pbk+cr
         vjK0lSgyPyEUQSjvrR2mi/XHNb3Ym/7Xd9gQrOyvm+sU+srsKQQgweud9ATK2ZVqGnAA
         Lcvx8JIV5RPb5ShYWnXIH2/Jk024MogiOW80uEDsrhOE9fTwU4lWHi25YbqLkonyqme9
         kR1A4zPE2CtfcPM8bXudQiXO5/aEzI6C9a+fil8Tz1qe+SrWjrNIgyqT+P8mafVfVkUS
         NFag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784756700; x=1785361500;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TSbIIq+MW5ujNCU6weGrEYnGd53JSmfWB5BOONHtR2c=;
        b=c3pgRD0ZZnUqyv7cgESbK9+Oqrzy0pqIym5TT9V5h+4yWqSRPIq/2JYqqP37ueHJ1k
         G79OE2PDUJnZ4KRjwZAPqtM6peTG+Z6xuI8hwR5ug5QsNTnUBgGSk3mv7xEgT6AY/9em
         MZPdJBZOEuvUiaZ3zwfkQJ51iFyYAKMNu+2eK3px7o4iTDb3WEaqJPVb2oDVHz9La5gN
         kx8sqncC84sih/teC9dRMxkdCArhimDUdztHeKX+ZTdX8OBNb7xCh2/JeQ3iXTXH/YYW
         g6ma7tCwzjpVD1jRsYGL/zGwHftU+YK0ShmfYtNygY6CGyqDrj6ce9bPlPXNJBMBrzG5
         B4sA==
X-Forwarded-Encrypted: i=1; AHgh+RqWK3n3TUDeldlzMqvkUwNimAGWODNMAVNvxnsuIpjiGioHPG+k6kakW4GROOrO3e9YBMxjNZxxY1I8k0PPpN4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxsq3MGiOhZIRABQWFrD6BufcSvZyGzIrHIxn9ZGvNuLiYHNu7m
	eIVPu4yP9kMUXuKrm14qTeyS9iKmsV/7YogSKkGsGBMjr9xPWkHelB7a
X-Gm-Gg: AR+sD11+zCVnhhch0jVWVGpEeB7HnlbyBt6qWJX6ujiZaATBzNfRy7r9kjm+YTbsquv
	IFC4x9MUwmi8dgbXxtb0egdm6X8fszgeYA6oiIHI4k2ZxU4GTKcs6uj5g5i+O+vrVPnDrWUrR+f
	9OdjkGKIxAvsIHKYnUd1AY5a7/DYFMMwpJr8Lp1z89clTOOfjrkF8HsvM+gDUk9mq2Byc3fKhvw
	F4GXqExx0veLpU68+UK31U8iUujEpV+lID3I6Vllb4aN0A+z608WBZ3MZw4GiAW8T/Z/8Xk1DS3
	ajtvLy/sFBFOa1igIfdFiN3hURrEmFg7FJVYmUuDF40sxxS9CJ6KhHPevDwR5DyD5xTGursK3lw
	rUtZZNWz8T9noWAewVb9TsmjgXVaYKrjZyOOJChkd7CKLsgpEBH88TW7iUUeuHzom7Gg5JvWSNf
	wt5TJFn7uvLROqn3tCQkHojWZaHNxkN/pftt1ZpPaUp2b7z+h3
X-Received: by 2002:a05:6a00:94f7:b0:848:467d:293e with SMTP id d2e1a72fcca58-84e2baddf66mr627847b3a.43.1784756700316;
        Wed, 22 Jul 2026 14:45:00 -0700 (PDT)
Received: from [192.168.0.160] (c-98-225-44-182.hsd1.wa.comcast.net. [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e17237c3fsm1946297b3a.9.2026.07.22.14.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 14:44:59 -0700 (PDT)
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
Date: Wed, 22 Jul 2026 14:44:30 -0700
Subject: [PATCH v10 8/8] drm/gpusvm: Use hmm_range_fault_unlocked_timeout()
 for range faults
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-hmm-v10-v1-8-606464dd601a@gmail.com>
References: <20260722-hmm-v10-v1-0-606464dd601a@gmail.com>
In-Reply-To: <20260722-hmm-v10-v1-0-606464dd601a@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784756683; l=5001;
 i=skinsburskii@gmail.com; s=20260722; h=from:subject:message-id;
 bh=JxcTBTW6lEzlUH9pe80rZJYyQZGUPa2uP7JaZIpbDO4=;
 b=t5pXaIaExV86XNOZX4rodLg/qlkvO7z8UzQMAKDvBSpVBwUgOqPA+1uKWVHHstjr3FsmGAV1u
 FhiXQ8BfH3FAK6QXFIhXuSWoEAqA3lYTf5A7cJupNOmjpSFDJW/pEX3
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
index 958cb605aedd..b946f920b7a0 100644
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
@@ -1422,9 +1407,11 @@ int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
 	struct dma_iova_state *state = &svm_pages->state;
 
 retry:
-	if (time_after(jiffies, timeout))
+	if (time_after_eq(jiffies, timeout))
 		return -EBUSY;
 
+	remaining = timeout - jiffies;
+
 	hmm_range.notifier_seq = mmu_interval_read_begin(notifier);
 	if (drm_gpusvm_pages_valid_unlocked(gpusvm, svm_pages))
 		goto set_seqno;
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

