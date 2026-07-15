Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852A142FCDD
	for <linux-kselftest@vger.kernel.org>; Wed, 15 Jul 2026 18:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784139398; cv=none; b=NvUId3y6X1f8t/QIUBV1fQZLh2WVwjjENXJnJLfhG+uHLoDNno56WUSjEkg7XjVEMZSHwHi3z3jpnGWFJngGYTqI76uJWEeu272lNW9k3vhI+8U4bweZmPsi83t9PddU+s/0EzFYJX1avEgoPWhC/4upuquGYIgv1/j0uZ5Yr4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784139398; c=relaxed/simple;
	bh=WjbR1yYJvUnP6Ki/Ch1cSCwnR1/UzkvRzcRqts53AcQ=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u2CaKJ2zhQLSbiHxSfCcRSgN9gjvHQPYac+HefcwW5GlTgzSU1LvSkkkpDtLrFkSmlWahIw9jodPc7wl5A0EKae31HhHShhfsymC/aUd13g3wJo9hf0dUW6RoQ9D97Bi8UnA8EckVSE5VEvwjAu+YkzTT7IVpLFd2Tr5M3JHWoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m6TbMt8n; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m6TbMt8n"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ce7d2adef4so34915145ad.3
        for <linux-kselftest@vger.kernel.org>; Wed, 15 Jul 2026 11:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784139392; x=1784744192; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:subject:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4IcjMhwypTXX14WXh1GVYxiUX1ayGU/csb6g5Y2UiV8=;
        b=m6TbMt8nz8qqpVH9SrEubmKEspUu6JhWcAApw1JPE61+7AWvolXapr4mB2nrMlYsni
         2tig5XKQc7+3FW/8Su2jrLSVrhUMM2bjhdAEHABjuHd6/+5iR0lzw7jqGpuyGbtCmP0j
         fbKiAYXs74bIoxYYeheAjWKRcjWNMcY0nxrr+6663ZWL4XSpB6s1VMvgYCPEUK0UwGyn
         ELvQyTwhhmHJrY7hBt9tPnbf426fiDdmz+7nKgOjjt/DRaH9Q1hBXmrq9Y8NkOGQ5/Lj
         HN4YpvvjcMqUQa8pwhNusanW0pp/pKhGNGSNHpZqpL4rHVklUxLNFQ0qbh7nU1jVQHkQ
         weIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784139392; x=1784744192;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4IcjMhwypTXX14WXh1GVYxiUX1ayGU/csb6g5Y2UiV8=;
        b=NBbst27HXMjlB4LyJ94XEwuOjBvC8GRfGPc3p4MF3AV+Jsq/PUvsMzqqHo2hyKda8Z
         JtSl2u9GebsFDWmyVk5igoa8lCIQX9PQc2uZrqKwd0LuYnOqIqL4y2sNvyW/u8n3R0M/
         x1jBM1SB4XZGdob2YlMjz9DwjH+s8WBORVfpVd9WxvmafgwsEzbVXgtJOzbrh9uR64vN
         cRJQ+6JwdaggebTeu6BhMkTRtdR3R1R+sIHvylNbD/HKJFq3FrvB1o5nBlv6yp3RHG7/
         bjZ1pem+VjqcWj84zsQpY+/K2FrDof3VW6GsHt2G8VcSnKQZWiRrsFlttmRPJs2FWnEW
         zlfQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro0MwMNNV+mJU9/OHGi1zRFFNCxV+SEhuFtoAWl41tvavPXqhcYgXdXs2P4aptos0WkRdPR8a0McqWR0Fv3GoY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJXwjotGz8dsx1s3U2W0Ny3JyOIzAizH3CYst4p6nwyvWUojg6
	zZqCo78uVM0+WwSyzWbwiboiUNugYoFR5BFxuCPgvDVe4QZWnThdABrp
X-Gm-Gg: AfdE7ckNFtkeEQ9oXjSpT+PIvwesQIZ1eI+EdkYLfbRhstSkDgJjQa2TSWekidnDSGu
	BgQJ/EOqJDbMNW0maN3OgFSmHCPbJSu7Dy4ji7FKkdRxK8c/qPAefcfHfENBmZK7ulPVuIbsuZ8
	jBAbW6rPG7TFLHNHfL2iflLMEG/TGTwEnok7rv5Ocb8jey+CSo0NYImxjfabmxQyGY41E8Ycw/L
	yM+HnaU5N+nz13pJbwgVn4tyrupYHfQqeK4XQ2RfVy1Tq+uy86/HfIBK7hTEJnzsYwYnlVBxWcY
	B7XqOgAgk1509ecrbZXvYWoIi0VrM+08NXBVneIhPLQkkohOEHxOymeNvYKgikawWJlmMf3V5l3
	xdkO9dpT5YZlFAT2Q4KL2NPIyy0cwdDamHtRHlwhLORbo/zjhaxMu1GqE41SEeEwNUEAM8EyOID
	4NApWtQ6W9oqSmSL7vQX+9Ad9zBsZCXCH1/U+xpIli2AuSr8XtFJvM+EohqPE=
X-Received: by 2002:a17:902:f645:b0:2c9:fc14:588f with SMTP id d9443c01a7336-2ce9ec0f95fmr181359435ad.29.1784139392357;
        Wed, 15 Jul 2026 11:16:32 -0700 (PDT)
Received: from [192.168.0.160] (c-98-225-44-182.hsd1.wa.comcast.net. [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf100e3946sm6817295ad.4.2026.07.15.11.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 11:16:31 -0700 (PDT)
Subject: [PATCH v9 5/8] drm/nouveau: Use hmm_range_fault_unlocked_timeout()
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
Cc: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-mm@kvack.org, linux-doc@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-rdma@vger.kernel.org
Date: Wed, 15 Jul 2026 11:16:30 -0700
Message-ID: <178413939024.1155966.6246787744253724390.stgit@skinsburskii>
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
 drivers/gpu/drm/nouveau/nouveau_svm.c |   20 +++++++++++---------
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


