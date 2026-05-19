Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B5D3BD63B
	for <linux-kselftest@vger.kernel.org>; Tue, 19 May 2026 07:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779175060; cv=none; b=JavmKJyvva+sIGU7cpp2DBOhJE7bneiAJllw+5PLB9KO6zLaKaDVvBhCLRcTZQqxSSRzFYnNdP9RIf0xoMVo9WK1tuT9iDpHwA8cj/J+G7Ao6RIKWVKGWCisjuwDaPGMiOI3OeGAxGTaGNM3jzQ8NqmFvWdWRoO1sNHETCvs6tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779175060; c=relaxed/simple;
	bh=dzETsDdbYK0x8/pCg24n3n56p4YbaBRDF0Bik7m8yRU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W5CzhHi6STnA9Hd5yICkw6s+OX9svY6euWyka7L6Z0dxubojaA1b7rRuvjfD2J83HHOJj1pFoHJywuOQJsm61R5X0U8F0tFW+UomzzLixTMptoc7o4R1ybZHhbdrEIe8UBe1+OICC40WH8T0iddIcIjFlUXPuUcDt2e8SMdxG0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ImaZBUzj; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=qwS3BExu; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ImaZBUzj";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="qwS3BExu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779175058;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r0K4PXGRihbgM0Q1lccy8tXCU1A0cnyGkfzj/MtoSdE=;
	b=ImaZBUzjPqg1F3eMQokfMuuAeRT7znLpcnQpTCOWy9Gm4ghS0YwDvnHn3YeXLeI4MiVD8s
	/t124svvf+Jd55HTmu8MVMnkvQixzTZ/nMCJdrYmWf2Pjd8sC4Xp3YIZHGV18ifx+yIfre
	ESkRiIkEiUaqJzOb3PxlSFNSxaCLWDI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-553-1EYR0XX5P_OPT_hYTU20rw-1; Tue, 19 May 2026 03:17:36 -0400
X-MC-Unique: 1EYR0XX5P_OPT_hYTU20rw-1
X-Mimecast-MFC-AGG-ID: 1EYR0XX5P_OPT_hYTU20rw_1779175055
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-48feb029961so18660345e9.3
        for <linux-kselftest@vger.kernel.org>; Tue, 19 May 2026 00:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1779175055; x=1779779855; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r0K4PXGRihbgM0Q1lccy8tXCU1A0cnyGkfzj/MtoSdE=;
        b=qwS3BExuyjGVYbGNzgYrD0di28iuOMJcO7Hncaaiwo2/qX+g6Su/QfR0Tqwymmv7qV
         ggugejE+gdmN/t77lMZnbgmUNd01J1zT4tgY23sS/aTQzs2zj1ZAli1MG3nSOGUxGwOO
         XPy7gwljBor4yhqAAN/8o0b72Yu2WmAwdq3yFy1u/nbawbAlRaJY9KKcWLN9EMxBf+7l
         1alWMjIz2y/y76gCPKQOQX2Xw/rKtomntECnPyc+YeVd/vdI3oG+gWpo4rVpKp3zsSzD
         zXp6GqvZcPDZmd38vFIg29AtLcumPYVyMWELnSg0j9N1awRsr4ZdQeVUuYkCen/pjSB4
         xfxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779175055; x=1779779855;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r0K4PXGRihbgM0Q1lccy8tXCU1A0cnyGkfzj/MtoSdE=;
        b=K13kk4zSyCWOnQUoz1g75juJnXnm6eWE8Tu83W5LR0hXaYTiKN02KXBpRo3hkLUBFj
         WnwDS9Zojllhxn5xIG1FluYxZd2vooSIw67LZnwnIWaYMNKH3KwBIRnOPL0LyeoQbGaZ
         jYitUBNsy4zOVNb//GP9f03zDSEiHMpRpR9qKTl/DQxz64W2yAzUMC2Q0auHd48z/LNy
         v2zf9M41Nst6tzedgbjmXwRpJV8WoQejqQDwchlYIxc3iDkbYEp7kjBJ/H0E6DJL6kGJ
         O4I8RB1/EmBuK2Aih9kRIG/9zS7OiKD0Buldb0hUH0ltoYn30MRQgafpKq5albVl5XpZ
         wlJw==
X-Forwarded-Encrypted: i=1; AFNElJ/1h81VheysbIUSRB87df8V3TnzBj/75DaB9sRZdsmJG1v+juIggaDF2vKgm104JINR06sAVg/+0Ndr8dSB3Mk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyof6IqvTdWdzMIXJylKRz9OX3P/z7grC3nrMFMlzBc9MXv+xNa
	Ewx/6mlFnIXATD8lJdC+LtsINkooRzcIoa00ChRy0At9sZpFil7/0yc/v76HQtURreVo2dNAMSp
	Fyeo4YLrwm3TrPW16f+9da8UJttYcNGVODB+PFtfEyvAPEQwI+hxJUKRPJh1lI1jYhKJI5g==
X-Gm-Gg: Acq92OEqKKtZd0UiZOmUF2L86gNebgh/nNmgX2rOWfC5Q+twp9J1ugARjU7QocukZhd
	DKruQusph1doqXRDFz06xOjYpIUv+Wt2eWK2N6S63vMk1MUAjH2S4uoCxDJq4WxBB1zq0P0DNhT
	U4OXkVcPjRcgpBKGwAA4XUqmdU9YhZEvqCbsSJFBnNkL9zUOaMBFkoFIshiCUHdfwIKE0r2C0dV
	wlYzikcYMCu54T+PvJ9d0sfPqc3Hzu787zNF4QqVTRIxcOSb6ar9UaiwC/wtpvaSdVSwcdWpp61
	KfkCSZGpFcimvSbXddD/9yrVrq5o1nqIzhkvFfiFg99BqlPzp6tSrtLLOL0p76395qGaUnjYX3n
	IOwJkyxq0rV+L+9f3C6ymvIDrvClcl//A6B3hyl14pz9h3AvhwgKUO5Y=
X-Received: by 2002:a05:600c:8b6e:b0:48a:6fd4:d3d3 with SMTP id 5b1f17b1804b1-48fe61ed21amr298884435e9.20.1779175055224;
        Tue, 19 May 2026 00:17:35 -0700 (PDT)
X-Received: by 2002:a05:600c:8b6e:b0:48a:6fd4:d3d3 with SMTP id 5b1f17b1804b1-48fe61ed21amr298884015e9.20.1779175054759;
        Tue, 19 May 2026 00:17:34 -0700 (PDT)
Received: from [192.168.88.32] ([150.228.25.33])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe57944c1sm335599635e9.7.2026.05.19.00.17.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 00:17:34 -0700 (PDT)
Message-ID: <54f7f213-9783-42c0-8ae8-51a6b65b7b5d@redhat.com>
Date: Tue, 19 May 2026 09:17:33 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3 net-next v4] selftests: net: add test for IPv4 devconf
 netlink notifications
To: Jakub Kicinski <kuba@kernel.org>,
 Fernando Fernandez Mancera <fmancera@suse.de>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 horms@kernel.org, edumazet@google.com, dsahern@kernel.org,
 davem@davemloft.net
References: <20260510081528.5257-1-fmancera@suse.de>
 <20260510081528.5257-3-fmancera@suse.de> <20260513193544.47970cb8@kernel.org>
 <bd560c89-c71f-4ef5-a0fd-5ea096a0f767@suse.de>
 <20260514162429.366b94c9@kernel.org>
 <f528360c-18b3-46e5-8ba8-88f921203716@suse.de>
 <20260515181623.5a44140e@kernel.org>
 <f5cae72f-93c7-41d7-b7db-2b60281afb72@suse.de>
 <20260518142346.4c0903de@kernel.org>
From: Paolo Abeni <pabeni@redhat.com>
Content-Language: en-US
In-Reply-To: <20260518142346.4c0903de@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/18/26 11:23 PM, Jakub Kicinski wrote:
> On Sat, 16 May 2026 09:02:27 +0200 Fernando Fernandez Mancera wrote:
>>>> Oh sorry, I should have clarified it. ip netconf only shows/query them
>>>> but it cannot set them AFAICS.
>>>>
>>>> Usage: ip netconf show [ dev STRING ]  
>>>
>>> Oh, fun. anyway, you gotta find a better way. Or just give up on the
>>> selftest, the YNL hack is too ugly to live
>>>   
>>
>> Fair, let me see what I can do. Otherwise, Paolo as you requested the 
>> selftest, would it be acceptable for you to drop it given the situation? 
>> I looking for alternatives anyway :-)
> 
> Maybe extend iproute2 ?

Ideally I think extending iproute2 would be the better solution.
@Fernando: perhaps you could update the self-test accordingly, adding an
explicit check for the iproute subcommand. If `ip netconf set` is not
available skip the test, so that iproute2 patches could land later.

Does the above look feasible?

/P


