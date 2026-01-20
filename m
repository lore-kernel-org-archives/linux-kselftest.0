Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020D3423A8A
	for <linux-kselftest@vger.kernel.org>; Tue, 20 Jan 2026 11:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768909048; cv=none; b=ZfRFu4o1okrKVU8VOBPgIFl+wlvUEJ/2loOt9nhzQFtwSzR29gSAjutB+/KP4rtGIgeZPJXr59Tc9LOGi95xc9BvYbB2OcxxhthhpHsWQNCaUkXM7HYZMCN2MVIuSQbadjMKiVsjxIKfk+0feaVmC1Nj92vWqvfll2GXzc2JY3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768909048; c=relaxed/simple;
	bh=rEZf/1Sg4LXN0exmaMPQLqDFKOXXdr/Yxg1dey9pOTA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qW1I0mtmPcj7e/YeiCHfr/dA9qmRueIMsPcTIgxAJwaL+q6tjLJ0Dw+GPDLxmgAt0MDDAcK6alG4oEOYLb/KA3QPLcZ4Ybo93HdC6NpHWiY4WeYbOpupM/wiBfFHsw8hX4iSjyhonTB8iuF7k7v2Ba6nRZx4woRP9PqUxBYzNZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7cfd10887d5so2185986a34.1
        for <linux-kselftest@vger.kernel.org>; Tue, 20 Jan 2026 03:37:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768909046; x=1769513846;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LSmHYeXBvlEb7OLSe8G59RYQyhINnpjWVcu9COHnqJY=;
        b=GVmb4v1W9hgWWRd5LT4bWZTtd4kkl2lPY9ux+Q80Em1hdFyth/YywOy1L7o3O8xOTn
         70wyMhsDCHy7SZn92HHUD2G+s7CWMV7UQG/EhQ7oiVgPFNH9WnCSNIGzXl7vDxFQGioV
         K6m5bJ7Tyy2kmjoofvnErtcrsgZ4ViQz5B6JBKfu4qdwfwIc9e2CCON29VoqvOWFuAIY
         eFeKjlm2UHd1VfWRUwimeAqjSPPmIpt8ByEGJh2UnLNKj8JqI4akld7H7/raGx46GqZW
         q6ByZjKhxW3LLdXIimJwRWtahpeAVvidv9aeIVsIzv4LfxyWx2E/W/cSCMlPAOyw/+9l
         CxmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXASZOvQQk8Ggd+9kQmIZ/KRmzZfse5zgq93wSP5F5TiPAuojP6JpmAxnHZIWyIRMPIaggEWB0QlLiGjLRqLZI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbI/G5IpEicuAu+mjti2BDKBO98L6305m/tRhqSCD8tVCGuvb9
	WOjqeeMxDHG4hBOw6QHO2hdlidyldpFloaFqyeAO3QbS2WUrnjliPgEB
X-Gm-Gg: AY/fxX6aVFBe9+xhuWFy9a3rV3XbEL6QyKwPNdoXyC330H/4a9v0i+NDK5ckw3Y7vrU
	gAK7HRttvKlF3fiagSiwpXhv5DpQB/ETFUfx1Tjrm67vgzlPXHc1fUlq22RLfhvmpPc/vKrPmfF
	sRcJq3qOxThdvxk37M76U8mJStr0kPfMhunKhAkqHfu9FqdZ9oC//mRN7FZ8GxSzgdjglH/1BRu
	4FxMl7mw6yhInybn0OY+qjy7eHSVyZgfNYvsmNGLMFgMHjiyWzFRE1M7A43yl48Qe26b1ZBxRlo
	y/jA3Vk2nbNBESRaSQws3flM6gvB30cQEGoubwOql4RcFExYwKk22jIvd6sIIkBskfmNJdxAhNa
	bQqaodicHwz7bVw7J7H75E7XE15Ev70PZSa5CEMwROmo41yXhTCKLiN0X1ouTQYjmuv1JxyC7w8
	gj
X-Received: by 2002:a05:6830:378a:b0:7cf:d9ba:c9a6 with SMTP id 46e09a7af769-7cfdfd7a1a1mr6528097a34.0.1768909045718;
        Tue, 20 Jan 2026 03:37:25 -0800 (PST)
Received: from gmail.com ([2a03:2880:10ff:7::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7cfdf0db2ddsm8381109a34.3.2026.01.20.03.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 03:37:25 -0800 (PST)
Date: Tue, 20 Jan 2026 03:37:22 -0800
From: Breno Leitao <leitao@debian.org>
To: Andre Carvalho <asantostc@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next v11 6/7] netconsole: resume previously
 deactivated target
Message-ID: <aW9o34Qfoxca3lt8@gmail.com>
References: <20260118-netcons-retrigger-v11-0-4de36aebcf48@gmail.com>
 <20260118-netcons-retrigger-v11-6-4de36aebcf48@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260118-netcons-retrigger-v11-6-4de36aebcf48@gmail.com>

On Sun, Jan 18, 2026 at 11:00:26AM +0000, Andre Carvalho wrote:
> Attempt to resume a previously deactivated target when the associated
> interface comes back (NETDEV_REGISTER) or when it changes name
> (NETDEV_CHANGENAME) by calling netpoll_setup on the device.
> 
> Depending on how the target was setup (by mac or interface name), the
> corresponding field is compared with the device being brought up. Targets
> that match the incoming device, are scheduled for resume on a workqueue.
> 
> Resuming happens on a workqueue as we can't execute netpoll_setup in the
> context of the netdev event. A standalone workqueue (as opposed to the
> global one) is used to allow for proper cleanup process during
> netconsole module cleanup as we need to be able to flush all pending
> work before traversing the target list given that targets are temporarily
> removed from the list during resume_target.
> 
> Target transitions to STATE_DISABLED in case of failures resuming it to
> avoid retrying the same target indefinitely.
> 
> Signed-off-by: Andre Carvalho <asantostc@gmail.com>

Reviewed-by: Breno Leitao <leitao@debian.org>
