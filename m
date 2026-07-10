Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDBA43BED69
	for <linux-kselftest@vger.kernel.org>; Fri, 10 Jul 2026 21:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783718845; cv=none; b=LWDY8Nr/nclE12FptWhtvcn3KHe7MxZOepJ02vF1AVTig0wRDj4K9ijjx6KnhB7W7Sa7Bm+5r44fWM+lwPUR5B7fWUjfWMJPYuDi01K6DNJh3QZ4RGDXQeuAbwXooqmEuXxz0ufUjrOOgwlEXM+9gf2zteB7cYdxzfz0cDgZFo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783718845; c=relaxed/simple;
	bh=pYhysMeIzYMEv8sb/P2wTG7Vkw/cqtE9UPpQ0ZrJ3m0=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HVjhb+OJDvLzpnHLJPJ5V+RKS6Tw9I11bznRwo1sTQrkKB61QgJr5EhEsjoOVDAsDKQ5FjvHtD/y5bsM6mmr+xQ8uimGdUOPG2ciIpSLYUmcKHe7TCTq7XRdaio+zkQklySwnLsw99xQuNvl4XXTSey0U1aa05Jeozsl0sj/9l4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WpD8hxSt; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WpD8hxSt"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2c7c61b5292so23797255ad.0
        for <linux-kselftest@vger.kernel.org>; Fri, 10 Jul 2026 14:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783718843; x=1784323643; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:subject:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=9/L8xh2nQ4nR7e9MheG1BnxPJ3sCm51YBcPVud12DY4=;
        b=WpD8hxStX/pXg0XO4lzmZrLqJGkR2hDSTtTjUomEveeRWZ3613rmaB+mI7Q46hQfc0
         9V0tKRSgPubGvz94bZDl3sFc44HJXusdlgQ5786YS6x9FMHXhkPjXigyXGcfvZ4viink
         +dTxbfqKytycr68xHcVeEyY6quXq2djHpv0C3JKlyCp0enzB3m2RIiNmrrohw3pzJSMe
         UUZMkE6ZAPQj/vXeKGtD/zEVoS1m1Qh9D2Z9h88lXyJSrXvxNVZb3gpX3n1eilRPZYPH
         Na7LnwMqDT+o+ehXkIoRSp264EseD9ke2+v78wfFRc6UQmFvTrRRksaw3r1Hz7/DMFrG
         oX0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783718843; x=1784323643;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9/L8xh2nQ4nR7e9MheG1BnxPJ3sCm51YBcPVud12DY4=;
        b=JjhPJmWP6J9VNJJpwT/ZHqXCiTkEiE0RrSDrB92gYg2OiVLcy71j93ex3Vf9NYXEFp
         c9iDiRA5P5LX9ryFPYh2NZqVjpnMfrvmcLIyemqmrYPjzDh/JlO3D0Mnzh1b245qpZHt
         cV1YrvtNeJaiXoW8jadnJn5bjujdDGL+By5L1QjcpJ9uppiarL4jqVEfNUNmJqqlZR1q
         Aqnj3jSphTBMblgX0PZF6GhRae+mckQej3yKUVuRQO8O3W1KYlQHrHxQ/Mgjn3hWiDvS
         mjJx7OEnJDdph3EyNmD05ui4r0Ij6LPg04+4q8TJcst7+sJEe92fUuphb4BDSThWTxyF
         /S7Q==
X-Forwarded-Encrypted: i=1; AHgh+RoeMI4GmjCJRhUNmzQf4NQow9vzXn/IKgc2LfgXFj8teUGr64o1zXOkop1KR5OcDXNGgaa/1KuWdW+kAI3FfeE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwpvYMexcUxRGXe/JMHE5G96siZk4rGKHVmRW5DSKTIi0npsQ8
	hQ5zTHunotI7Flfc7VTqKCvPfUdUGjuP3lFbxlHNdiLbf21g6TxM5QvK
X-Gm-Gg: AfdE7cnodDfmtLx3E9xf+v65KzYyl4G+OpgmoqDrTVvDgawHoqMtvdCQmruWomokzz5
	tcfHo05OEX+i43lwEI0dTItMlrTrJ2afS1SF0x0xVm4gNEJESc5L9XQRqthn0xWWpLF3es3sQm8
	Q5rwbs7lWCOZiGJi/PUgz6Swtv64zv4WhhmYj59toiQXDOePlKOEslbtk8rySnGakIALa+hdjfH
	5EVgTOjkuIyLVhlzhR23Zm3rSwcfZlqM6SHctyz37b+1Ta584TiBi96Mt5NwWeZfmJvRiA3c0sW
	kRPXANDch4EVFCWaczWXX9zuDJQ/afdMB76ESyUnKL/ZsZG55ll/PoRC34N08WL9U32X8XHKPCE
	hlcTlq31403m/qHjyEvk7pGl6Pylt5/5reQPqxsnoBLlEwYjgLucx+6wj8mYlyZPvvMG0XPrTfa
	LCIZFleEskFVSUcPvn1eTZpWpeI4EpKPvoTMtRs2TSwQv7Lqc17BbU7UafL38=
X-Received: by 2002:a17:903:2b0d:b0:2ca:11af:5ee9 with SMTP id d9443c01a7336-2ce9ec0f0b4mr7098515ad.25.1783718843116;
        Fri, 10 Jul 2026 14:27:23 -0700 (PDT)
Received: from [192.168.0.160] (c-98-225-44-182.hsd1.wa.comcast.net. [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bf77e4sm65443035ad.22.2026.07.10.14.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 14:27:22 -0700 (PDT)
Subject: [PATCH v8 8/8] drm/gpusvm: Use hmm_range_fault_unlocked_timeout() for
 range faults
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
Date: Fri, 10 Jul 2026 14:27:19 -0700
Message-ID: <178371883977.900500.2198446134676328631.stgit@skinsburskii>
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

Several GPU SVM paths take mmap_read_lock() only to call hmm_range_fault(),
then retry -EBUSY until HMM_RANGE_DEFAULT_TIMEOUT expires. Those paths use
MMU interval notifiers whose mm matches the mm that was locked for the HMM
fault.

Use hmm_range_fault_unlocked_timeout() for those faults and pass the
remaining retry budget to HMM. The helper owns mmap_lock acquisition and
refreshes range->notifier_seq internally for each retry, while GPU SVM
keeps its existing driver-lock validation with mmu_interval_read_retry()
after a successful fault.

Leave drm_gpusvm_check_pages() on hmm_range_fault() because that path is
called with the mmap lock already held by its caller.

Signed-off-by: Stanislav Kinsburskii <skinsburskii@gmail.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/gpu/drm/drm_gpusvm.c |   52 ++++++------------------------------------
 1 file changed, 7 insertions(+), 45 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
index 958cb605aedd..6b7a6eaebcd9 100644
--- a/drivers/gpu/drm/drm_gpusvm.c
+++ b/drivers/gpu/drm/drm_gpusvm.c
@@ -788,22 +788,8 @@ enum drm_gpusvm_scan_result drm_gpusvm_scan_mm(struct drm_gpusvm_range *range,
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
+	err = hmm_range_fault_unlocked_timeout(&hmm_range,
+					       max(timeout - jiffies, 1L));
 	if (err)
 		goto err_free;
 
@@ -1439,21 +1425,8 @@ int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
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
+	err = hmm_range_fault_unlocked_timeout(&hmm_range,
+				max_t(long, timeout - jiffies, 1));
 	mmput(mm);
 	if (err)
 		goto err_free;
@@ -1736,24 +1709,13 @@ int drm_gpusvm_range_evict(struct drm_gpusvm *gpusvm,
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
+	err = hmm_range_fault_unlocked_timeout(&hmm_range,
+				max_t(long, timeout - jiffies, 1));
 
 	kvfree(pfns);
 	mmput(mm);
 
-	return err;
+	return err == -EBUSY ? -ETIME : err;
 }
 EXPORT_SYMBOL_GPL(drm_gpusvm_range_evict);
 


