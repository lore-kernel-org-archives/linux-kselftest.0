Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2074485CDC
	for <linux-kselftest@vger.kernel.org>; Thu, 23 Jul 2026 17:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784828228; cv=none; b=pUny5/j+JK/czpc2HZImqpNCL97bOE9bSDvWZZdaP9N4n/4egK9nxKwT6AMyldNrFwsyAjGCUSA4TVwCOG1cAa+DcAF2pZgmSwrgARhpkqGJTrkRTGrQbyG7qFTBP4PltLZJDK1pCpmBfJIA0sq1QuT2Ia0cNdsQC2Mzv28cSKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784828228; c=relaxed/simple;
	bh=Js9Z5fScNTLs9yZDEPq5MMQDWBFdccrrYdkvKMfBR0c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GhN7ssCQDVKS/hWrBFeicepliNXNvAN0GX6qmlKi6Cqvluvi8d559rOHNFXd0f1p/gK6ZYt5GTkoZ7RgjK8Cc/v42flimGlOAfCiZuiqMH+8NaK4ZYlh8krjcPa2uxUuYl2LEOchpM34cRqWH6A6Q1F8tgU1sRNZ86B8pmX8220=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BKL6hJTS; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BKL6hJTS"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-84a652535dcso621029b3a.3
        for <linux-kselftest@vger.kernel.org>; Thu, 23 Jul 2026 10:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784828216; x=1785433016; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/3EHZQlaXq9sLmhVgtuP5ODA2wxc36yvs54yemcncOc=;
        b=BKL6hJTSZk19OoDFcA63/ZRoV0prsj8yCa4ogkU90ZAlAakTfXuIGGS/iowNK20Shm
         48LLdV1VLcRWB+urPSsdyN0SvDg3d5TRjBBZ91VHO9dGcLM7NP5U5NMulOAal5hJ07Q4
         J1ds7S3tCtGMQ0nJS4JKg2CXAmTMXTAXD90ceLfgLW81TiwyrV1T0V6qmP7F3+23sGKK
         ystiPsEBmqOhU53eERSPQWhWZYpis1kHPTqaTAM2/8tKMKtDgkNi4GGJGu6EhArOMTt9
         X2otbFigngyTor75rMG2t8eHnCm9TQHuyZEGyW2NqF+eQpSl9GlrB927etwZYxmjpij1
         XyUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784828216; x=1785433016;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/3EHZQlaXq9sLmhVgtuP5ODA2wxc36yvs54yemcncOc=;
        b=dT7I90uaXvAfy80l+TjGSdDMMYvk7RZMf3ldeXMl54944+vjkgjAGJmtf13aZTgCzV
         yPH6Kb7iCMlVfiDsBjNhkzDLDncAwY6X5/hFhnENxV+Ftwq6FQBwP7MuC3vLppAzCBm0
         brM+AjDBSmrTF8uUW0HfYY4IJYuhADgEf+STWF8xh7wVd7SFoIIVhr1S2HDlAhqZfKJH
         joBPZjctqB/q40zAdiUSw2g+g7sgm7JJnWffvaVFXZYvXTxQtK+oQJ1d2vg631o8l2jv
         6sWYM6HxLva6K8lf4oGMIPjlU8LQUjl3ecKZc+9g4qwOSaNMxzL+dQh889Cfs+ZrIb4V
         zTBg==
X-Forwarded-Encrypted: i=1; AHgh+Rr7DMFyDUoZtwIHa0oCP90bDj8RsX+HZptVU7S8IIasNGrQ53JDfabHFGIgYHYIu4li/Wzt/WQTTBH/YgQECMo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWNW7vxaWMZI2HVraDBpUcxpZP7+iilAqYtl2bLu6+9YHVN4y7
	KWZApo6XgbffxWerUng32jBGpkeOZWpKwcOfN9yKVWSubDKkNhlkM9iV
X-Gm-Gg: AR+sD10EiLCyqdRHNTcbGavA3iPHlYPu5tlUAVUrxxiVYXq32EBY3XdzHV8rdCEBIjF
	zI91g21iGFkIpFomqXDaQOtt8iQFyRrXrCIoWicnNozC4CpzUQO8hPeisyaQLqZpkFfOpQGEMtr
	5ClIOSMZ9nLudo/uXL6l+IL+XXoYZUD7QSSQB2MNcHZEZEVHsdDtGclErcNADG0Wc2AIuUp0I7t
	LzUhvgdQAoupscGghs8RD+GhCjuC8EUev8vrER5SbkpLAjRr6eQJYup/HgYQIQl8N6VQzfd4Yhc
	ayrnZleWz7S4Kpux8NsWkifRALZhVmdExsDwAcEbaAIUWAjtllAcNBDQfnbq2dxnQe6GBP86Lyk
	7HK8fxSxJ98lII/opowGNNtGEzneEzq2ReBMLrNHO5VIuWqiszyvFyhKa1llotewwOsFwM9Q2nI
	iH4DnR0PD0K/S1tVSnDxmpLaghVZGyVuMuO1i7sKz4dYgx5I/P
X-Received: by 2002:a05:6a00:4482:b0:848:47d3:47ec with SMTP id d2e1a72fcca58-84e2b8ab6d2mr4797080b3a.31.1784828216068;
        Thu, 23 Jul 2026 10:36:56 -0700 (PDT)
Received: from [192.168.0.160] (c-98-225-44-182.hsd1.wa.comcast.net. [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e20622dedsm2691612b3a.11.2026.07.23.10.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 10:36:55 -0700 (PDT)
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
Date: Thu, 23 Jul 2026 10:36:39 -0700
Subject: [PATCH v11 7/8] accel/amdxdna: Use
 hmm_range_fault_unlocked_timeout() for range population
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-hmm-v10-v11-7-c55b003a4b61@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784828202; l=2650;
 i=skinsburskii@gmail.com; s=20260722; h=from:subject:message-id;
 bh=Js9Z5fScNTLs9yZDEPq5MMQDWBFdccrrYdkvKMfBR0c=;
 b=UoKX2QEi16TQG/XSPiXepu/KONklG+8l1kn86LgWhqxQQe32BnNrpIu04JJYOeap8yhmhRNnI
 Xgchah8NIfnDwgLdxf/plAUECr/N2GDtTgg00z0Czhp7vw9hyXoBoqQ
X-Developer-Key: i=skinsburskii@gmail.com; a=ed25519;
 pk=bDpriHBYgeTdkIDweZDCemxsU93neJBOCn3YLIuJpnE=

aie2_populate_range() takes mmap_read_lock() only around hmm_range_fault().
It also open-codes the mmu interval sequence setup before each HMM walk and
retries -EBUSY until HMM_RANGE_DEFAULT_TIMEOUT expires.

Use hmm_range_fault_unlocked_timeout() instead. The HMM helper now owns
the mmap lock and refreshes mapp->range.notifier_seq for its internal
retries, so the driver only needs to call the helper and then validate the
sequence before marking the mapping populated.

Pass HMM_RANGE_DEFAULT_TIMEOUT as the helper retry budget for each HMM
population attempt. This scopes the timeout to repeated HMM notifier
retries while preserving the existing outer loop that moves between invalid
mappings and restarts when the interval is invalidated before the driver
updates its mapping state.

Keep returning -ETIME when the HMM retry budget expires, matching the
driver's existing timeout error convention.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Stanislav Kinsburskii <skinsburskii@gmail.com>
---
 drivers/accel/amdxdna/aie2_ctx.c | 23 ++++-------------------
 1 file changed, 4 insertions(+), 19 deletions(-)

diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
index 54486960cbf5..b5b4ca263002 100644
--- a/drivers/accel/amdxdna/aie2_ctx.c
+++ b/drivers/accel/amdxdna/aie2_ctx.c
@@ -1034,7 +1034,7 @@ static int aie2_populate_range(struct amdxdna_gem_obj *abo)
 	bool found;
 	int ret;
 
-	timeout = jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
+	timeout = msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
 again:
 	found = false;
 	down_write(&xdna->notifier_lock);
@@ -1061,24 +1061,9 @@ static int aie2_populate_range(struct amdxdna_gem_obj *abo)
 		return -EFAULT;
 	}
 
-	mapp->range.notifier_seq = mmu_interval_read_begin(&mapp->notifier);
-	mmap_read_lock(mm);
-	ret = hmm_range_fault(&mapp->range);
-	mmap_read_unlock(mm);
-	if (ret) {
-		if (time_after(jiffies, timeout)) {
-			ret = -ETIME;
-			goto put_mm;
-		}
-
-		if (ret == -EBUSY) {
-			amdxdna_umap_put(mapp);
-			mmput(mm);
-			goto again;
-		}
-
+	ret = hmm_range_fault_unlocked_timeout(&mapp->range, timeout);
+	if (ret)
 		goto put_mm;
-	}
 
 	down_write(&xdna->notifier_lock);
 	if (mmu_interval_read_retry(&mapp->notifier, mapp->range.notifier_seq)) {
@@ -1096,7 +1081,7 @@ static int aie2_populate_range(struct amdxdna_gem_obj *abo)
 put_mm:
 	amdxdna_umap_put(mapp);
 	mmput(mm);
-	return ret;
+	return ret == -EBUSY ? -ETIME : ret;
 }
 
 int aie2_cmd_submit(struct amdxdna_hwctx *hwctx, struct amdxdna_sched_job *job, u64 *seq)

-- 
2.43.0

