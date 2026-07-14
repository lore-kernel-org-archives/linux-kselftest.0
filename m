Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C189042B75D
	for <linux-kselftest@vger.kernel.org>; Tue, 14 Jul 2026 21:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784064842; cv=none; b=Wtk7+6O9eRcgArPp8yR7D6lWn0XAR3ZsQdGh0yFRvGLLE8wmVaqB1fQhcTS7CWGlnKD7rbhnhu1m0oO/rKd9oF5HHOGp8JjHwgntKcb5WX3HtcUODcYBhgR8uouMqm8p4Hy5REuj8wwbD6Y6FhTj2oRTwcBCAeEWnU31uLfGLOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784064842; c=relaxed/simple;
	bh=tb1NJ6THbO4fGAOt71qmHzyuduWdHm5vzycR/NKaFuI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ctJD+YSXJ8WyLXbUki9VxZEgopxusAdY7qFqO3ycfrYjZx3/MWcvIW2OLoDsJ1JBJvmwiwlElIy9n6RH1JTw/xFARRCsgj2su03juRRv69xy3fmQYr5sjyKDgXkWxA3wxR0GLvYVTpLlGoZ+prZhdJ2RueIk3xhSH90g+c9W5NM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SLrF5G+b; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SLrF5G+b"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ced3386430so13090425ad.1
        for <linux-kselftest@vger.kernel.org>; Tue, 14 Jul 2026 14:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784064837; x=1784669637; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zebbIro5mkXbuDBJ5TKnPBr9hFGew4CMfA/H27lS0KU=;
        b=SLrF5G+b5i9n/3C+1ZCCGVOL+lo2aSb4ZZhaf/rOZiKtc9rVJfvZKeHs2nrXG+wB3x
         tiCGoJwbkDuR/llcQ3wcdd1xxS9UcpyE8YlGZjA9fiKSz7ICkEK8V3rFElngGU3OTq6v
         Iy8hsiYVV83MwrwEjbBXfpgu3CQPHa11v8Uf+n5T9Hoz05Zp6NdbU/4uzpe+B5JVU6gN
         S5cesmj/yjPfUXsPIf29kOL9A4rHxMDZhPI5f2vKUsMj9lCCFPyEFzAPF7sQWd/y+hA1
         jzCX2Gnl+XvAR7uu/KLQXeM78j3wMGuS6xo/xfxQk911dNDqI4Vn+8B7AwMYQbw0Y661
         b08A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784064837; x=1784669637;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zebbIro5mkXbuDBJ5TKnPBr9hFGew4CMfA/H27lS0KU=;
        b=LWTIJD13M8ki3OGMPs6XZPiUyV5OVlClfJdzWp8V8R9qZFYNyBU/0PO3lDGv+iAB30
         2Mg/SinzZXlJdBdHB6T6CBXrIOsqzaGKSUnX7fYiJ7OMz7BvR9O7FOQ7+8liuG8fGPwH
         /4jO0ej18QRqi7Sr+l7wxG8sM3iHjQ0HFVlGIGVq2FUAgGeKt/7nKxkKSjr0798lTlBi
         kAu7lraudPhb38GR5Tgkbo3+oOItkAq7BKkyc+5s9U3BFUoYobj1iEydYfg6mivdVw2r
         JOp8KtlhF66Pz6nTEwpTdN3g4wfTupE5PsLJiDgmYFBcpAt1yTYL+3hmPgDEu36dIvY2
         A4WQ==
X-Forwarded-Encrypted: i=1; AHgh+RplEPU0qCx9Ug30cifkp64tc4aM7rMfP4Q0wkfmH0oYjbXatGCFTWkmjsFxNYJHK1/HEmpF8PjkYB1I94BpNOk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwchG/6IRwjBtOXbEk7u7TdS0VrtaYr1w0pX6EkEBffpFerLHQI
	Bjs+wvZPKOWGHXAo9VoXoHZeubEuHtzw+98dXgeRIj0BpAcAKltGhz7c
X-Gm-Gg: AfdE7clbXQmRA88MKQo81EeUGxLaq/ealjZI4d0heWGmATnOypjMUVj87qAWvvgawYL
	VK8QlO5wMTx6yNLGaJgy/RrptzLQkgdEqkeaUVn3KYXycXNDTph+1PYEJ101z56ZK8xPWbUZkGc
	1ux/SgdwwFVnFyoXd6gj0LxuiEwEEg+cCySyWx/YSw8qDxI2bvBBa02cMDKUc9/HDiFN9albpe7
	uxeieMWo5dVlFaktyB1xnIDwKNekBkt/pFvNq5p6FvVN01sd9ILnG0eMtepILcXnJzi8ahS0lCR
	zexJh+zlcFePBkNtn0pdmu/pFnwsadbebMpOd+Xtxi7Tms6FF2cEP4vQLjJ0zdvGrKX4npAEHsO
	IkcvzQz03Jjjn5UTZeyZeH3ucZA17fZwDQTNhBIPt/zrZSVzEF40ih0wXgYka/kVQLCr5ReKMhk
	j4CjS+rF8/iKJKUpGBb0TjnMQJU+kYMfptVEA3EAnACvH5X1JVG1kGzQT5HuszLFfbtg==
X-Received: by 2002:a17:903:240c:b0:2c8:1c05:16bb with SMTP id d9443c01a7336-2ce9ec0f108mr142192545ad.24.1784064836947;
        Tue, 14 Jul 2026 14:33:56 -0700 (PDT)
Received: from skinsburskii (c-98-225-44-182.hsd1.wa.comcast.net. [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cea6507b5csm55058005ad.72.2026.07.14.14.33.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 14:33:56 -0700 (PDT)
Date: Tue, 14 Jul 2026 14:33:53 -0700
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
To: airlied@gmail.com, akhilesh@ee.iitb.ac.in, akpm@linux-foundation.org,
	corbet@lwn.net, dakr@kernel.org, david@kernel.org, jgg@ziepe.ca,
	kees@kernel.org, leon@kernel.org, liam@infradead.org,
	lizhi.hou@amd.com, ljs@kernel.org, lyude@redhat.com,
	maarten.lankhorst@linux.intel.com, mamin506@gmail.com,
	mhocko@suse.com, mripard@kernel.org, nouveau@lists.freedesktop.org,
	ogabbay@kernel.org, oleg@redhat.com, rppt@kernel.org,
	shuah@kernel.org, simona@ffwll.ch, skhan@linuxfoundation.org,
	surenb@google.com, tzimmermann@suse.de, vbabka@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-rdma@vger.kernel.org
Subject: Re: [PATCH 2/4] fixup! drm/nouveau: use
 hmm_range_fault_unlocked_timeout() for SVM faults
Message-ID: <alarQbmnjwtgdBUB@skinsburskii>
References: <178405975214.1082778.5193079941156341151.stgit@skinsburskii>
 <178406001808.1082778.17299764648397654220.stgit@skinsburskii>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178406001808.1082778.17299764648397654220.stgit@skinsburskii>

On Tue, Jul 14, 2026 at 01:13:38PM -0700, Stanislav Kinsburskii wrote:
> nouveau_range_fault() now uses hmm_range_fault_unlocked_timeout() for
> the HMM fault path. The timeout passed to that helper is meant to bound
> HMM's internal mmu-notifier retry loop, not the whole nouveau retry loop
> around mmu_interval_read_retry().
> 
> Pass the full relative HMM_RANGE_DEFAULT_TIMEOUT value to
> hmm_range_fault_unlocked_timeout() on each attempt, and retry from the
> nouveau-side mmu_interval_read_retry() check with a fresh HMM retry
> budget. This lets HMM continue when it has made progress, while still
> preserving a timeout for repeated notifier invalidation retries inside
> one HMM fault attempt.
> 
> This also removes the open-coded absolute deadline and remaining-time
> calculation from nouveau_range_fault().
> 

Sashiko is right. I'll need to do it differently.
There will be a v2 of this series.

Thanks,
Stanislav


> Signed-off-by: Stanislav Kinsburskii <skinsburskii@gmail.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_svm.c |   30 ++++++++++--------------------
>  1 file changed, 10 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
> index 4cfb6eb7c771..b1415c2e49fc 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_svm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
> @@ -655,8 +655,7 @@ static int nouveau_range_fault(struct nouveau_svmm *svmm,
>  			       unsigned long hmm_flags,
>  			       struct svm_notifier *notifier)
>  {
> -	unsigned long timeout =
> -		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
> +	unsigned long timeout = msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
>  	/* Have HMM fault pages within the fault window to the GPU. */
>  	unsigned long hmm_pfns[1];
>  	struct hmm_range range = {
> @@ -677,25 +676,16 @@ static int nouveau_range_fault(struct nouveau_svmm *svmm,
>  	range.start = notifier->notifier.interval_tree.start;
>  	range.end = notifier->notifier.interval_tree.last + 1;
>  
> -	while (true) {
> -		if (time_after(jiffies, timeout)) {
> -			ret = -EBUSY;
> -			goto out;
> -		}
> -
> -		ret = hmm_range_fault_unlocked_timeout(&range,
> -						       max(timeout - jiffies,
> -							   1L));
> -		if (ret)
> -			goto out;
> +again:
> +	ret = hmm_range_fault_unlocked_timeout(&range, timeout);
> +	if (ret)
> +		goto out;
>  
> -		mutex_lock(&svmm->mutex);
> -		if (mmu_interval_read_retry(range.notifier,
> -					    range.notifier_seq)) {
> -			mutex_unlock(&svmm->mutex);
> -			continue;
> -		}
> -		break;
> +	mutex_lock(&svmm->mutex);
> +	if (mmu_interval_read_retry(range.notifier,
> +				    range.notifier_seq)) {
> +		mutex_unlock(&svmm->mutex);
> +		goto again;
>  	}
>  
>  	nouveau_hmm_convert_pfn(drm, &range, args);
> 
> 
