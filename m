Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C75C359A99
	for <linux-kselftest@vger.kernel.org>; Fri, 10 Jul 2026 16:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783700873; cv=none; b=BYI/NrDpVsHXEdljbvAz+bYgzCmAg3vGF//SNhXRwATv4Iw4i7nwfC6MW6zXT5sN+aBc1RZsI15G52R08YUZvAPnEmL0mRO5bXiLcUT8UCh6CrnxosbbggzXY/q6TWieYotmHmQBS1Fglvqe4V57d6mhCd7N/eqC8eO8TKh6HJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783700873; c=relaxed/simple;
	bh=zFHfJ1sc06mEROvkctmUCy8ljGsoiIWpsgO49VU7hjE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GOJPaWzt0T0mqn3guQ49AigMlEryLhJpD2SlezjPWBbsCWjztoej8Gu5rgSE57oknTsqABCUi/G8/a0EMk9iFxJevrvYTLMlk8p5c6JNrGtt1yGy/umZ7smFMF9jweUAC+upFbMMTBUOwgxZplxoHh+Wskxf09DPOEIsPomDtuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=kzWtCM71; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="kzWtCM71"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-8ee88fce476so11922716d6.0
        for <linux-kselftest@vger.kernel.org>; Fri, 10 Jul 2026 09:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1783700870; x=1784305670; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UNIXCm8Zus/z4nQ3xLBTLCwOawMM/+5sDMMsd2dm66E=;
        b=kzWtCM71+HYvSg5oE26kEeUnwihq3A/acXX4BVp3dJc4iGnjTsKQa4fnDYBQ6pBk5b
         29P7+Ypob7sR/qVJoC4xvQRlyVPCMjusy4b039Vp+MK0tL862RkeqyZhehuW4fn6jBFg
         BjxPS2nXse00VxL/pgQkm6gJ4jdEQwmI73lDyKnZGowzDZmOCSL17+P5Ktrf+fL6mmzf
         zxy6NhAvixXcWArIhMEK+//tQhuCNzrhiieoCnSaFt3Czfuu+cqU5kw81pvl3qkEYBbL
         S7JSGCUqPHUb7lYX8lvUJynDgusxrNxM7CH2DQtYQy3HkWF8djnbgx0z0K5075l4UiLM
         NK8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783700870; x=1784305670;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UNIXCm8Zus/z4nQ3xLBTLCwOawMM/+5sDMMsd2dm66E=;
        b=apn9i9bluvPWZSpJWMKrjYFNRQoHi/sMjCm9Aez3P2VrH+J9QreiG5MTGU/jbAuTSy
         JKGVoT6IF0oeRh7ehzUkP8n8lv5nXQ3ewQhNWPfz2hbr34WYU3Mr6lKo+PgYUeayli0J
         zqCX7OY0XcJOLqeh54WDSbQPU8z7PxFrso3/ZZaV7OVBel9Hvzu09CxOjpnXhYtQxeKJ
         50fvRVPRl+Eken/d894OO1/Clv+Y5A7im8LBkZe+F53Wpna0iKcr8JTG7VEZAcK9Z4Pt
         /v0+rDR4Hn0myRdB30EcAcrYMKlNVJuM4iOixRWHENI/IJ6rQ5UVvrn7qQ5ucNKwuA+2
         Up0Q==
X-Forwarded-Encrypted: i=1; AHgh+RpuISKPAZpPo0XOZoghj5cChr7y/4erDxUpp2WOVIwU5pCSf3jIv0obhs1Xqss7DVDEv2XE4cA/LfVGr3qPDhc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYZWSK6TcPTqAyWnwC0zmObclLAKVg+IIDlvd4ldkrlZhS+P3d
	PSun/GKEKLi8uc97fptcKCzQxGZl4+E3qSKzk1PxuXrTg74ZwG6vBYXmAeBbKo58O2g=
X-Gm-Gg: AfdE7ck0VVo7mBMhAefj6JXZU3Zn+SjMMUneaLp5MAWwQK/XBhZyKsJB7m5i7XThyVh
	U4nGsCLpVZKJMnAhJmgiy5ePQ3MYcEqHgnp32TRyj5t/yXy0auZ2toVvPPpkC3qFgkYFGuLq/DY
	SK7hlVh8/anyw+CjY7KPBL9OHbmo/nk7qtdJcXemcThNsM8GLFTVcUExTLKBkjMloJDNau7xXb3
	97qYKIVwOQ8BR+F9L7ANK6fezwRkKUyknlZ+8IXi1qrYQwXRgSt11GxXhZKtoV8e5Y7qj4WSyf1
	tsBvjkRJbg3A+YN3zFAijD9drYrz1P9rY438ELCTJo47vecSTmlSowTYeXHnKM34qVebt1tBLpu
	Z5+pnQqDpjcFpdR4+2ZJjQOIFBSbWigyF2r2YYyB9Q75JPbioW24q+cM7ZHUNAdBwuZgIZ88=
X-Received: by 2002:a05:6214:2127:b0:8f5:eea1:6f04 with SMTP id 6a1803df08f44-8fec3522cffmr120531466d6.54.1783700870475;
        Fri, 10 Jul 2026 09:27:50 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd50e081dsm44781476d6.9.2026.07.10.09.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 09:27:49 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wiE4r-00000007XPF-1WDC;
	Fri, 10 Jul 2026 13:27:49 -0300
Date: Fri, 10 Jul 2026 13:27:49 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Stanislav Kinsburskii <skinsburskii@gmail.com>
Cc: airlied@gmail.com, akhilesh@ee.iitb.ac.in, akpm@linux-foundation.org,
	corbet@lwn.net, dakr@kernel.org, david@kernel.org,
	decui@microsoft.com, haiyangz@microsoft.com, kees@kernel.org,
	kys@microsoft.com, leon@kernel.org, liam@infradead.org,
	lizhi.hou@amd.com, ljs@kernel.org, longli@microsoft.com,
	lyude@redhat.com, maarten.lankhorst@linux.intel.com,
	mamin506@gmail.com, mhocko@suse.com, mripard@kernel.org,
	nouveau@lists.freedesktop.org, ogabbay@kernel.org, oleg@redhat.com,
	rppt@kernel.org, shuah@kernel.org, simona@ffwll.ch,
	skhan@linuxfoundation.org, surenb@google.com, tzimmermann@suse.de,
	vbabka@kernel.org, wei.liu@kernel.org,
	dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
	linux-doc@vger.kernel.org, linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-rdma@vger.kernel.org
Subject: Re: [PATCH v7 2/8] mm/hmm: add hmm_range_fault_unlocked_timeout()
 for mmap lock-drop support
Message-ID: <20260710162749.GP118978@ziepe.ca>
References: <178345345668.660027.2952911919681614557.stgit@skinsburskii>
 <178345362182.660027.12809852179204464964.stgit@skinsburskii>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178345362182.660027.12809852179204464964.stgit@skinsburskii>

On Tue, Jul 07, 2026 at 12:47:01PM -0700, Stanislav Kinsburskii wrote:

> +int hmm_range_fault_unlocked_timeout(struct hmm_range *range,
> +				     unsigned long timeout)
> +{
> +	struct mm_struct *mm = range->notifier->mm;
> +	unsigned long deadline = 0;
> +	int locked, ret;
> +
> +	if (timeout)
> +		deadline = jiffies + timeout;
> +
> +	do {
> +		if (fatal_signal_pending(current))
> +			return -EINTR;
> +
> +		if (timeout && time_after(jiffies, deadline))
> +			return -EBUSY;

I really dislike there is a timeout here, HMM is supposed to be more
deterministic. GUP doesn't have a timeout, what is this about?

Jason
