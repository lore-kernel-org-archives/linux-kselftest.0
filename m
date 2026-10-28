Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793200365;
	b=Y+X6Aav0/lX/dd9w8C88S04L+HZZUXSSSbSiXxm9S6OMe/EcbxTjDj6SOH71Cf9JhQkt
	 EESoj9QXGM/hEQFKGJ/+zmKfSlgMM0YT3B3esjCjdfbdAVu0x9nFu9Zow4T5bOrdk2wkp
	 oSVAe6lYASqlG5PGkUFPfY8agRlVviVD/MVOzuwO/eztxjb8TGiczQw+TbcTIEwLl/k13
	 UCyOk+3E6OUWT8ZbxtpOqJHgGgq3OeVxRKw1XRhgbHt45DLCU9mBQzPEilDxOhfhkTrni
	 bHBY2GgA0BNDHDopBCmSmI2nQdqwd0zckxLYORlVRvo1Zf40aI8/fPgYN3hG3ThIJ2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793200365;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=C5xQd1xIwUtBJyycWD3+XcISdDlmOWmJGD2rjg0it4c=;
	b=B5Gl/WINGJnc0pcHLhHrIxm+hTSk1JkhZEYh8FjI+3Ops4c1DawRyYFr8lEPr5eWBPYJ
	 T0/lI1qQVmRrMQTUfOgSebpRggtpFiAJw3Re96tfiSq4MXjNuau3U3Kl3Ur7KI7Yc81Qo
	 p6Jg1sC2DLHSIjcHs2EstIj7r/d9SSZYUB/snmJ4LYw2Zn87rx6t/mZvgYIAF31dk39RK
	 sbtsl1Y2UfcRbOhVYVPI5NFKnItrRQxt6tt76NSaa9EB6BNd/zs8VytyEn4Jr4c/KxiIl
	 FW7cYVcLTOzoJ0bZTS10Dxx/WTcaa1Euq5We6yOnf5jQv1MAvBg6yquRVeuuFQe8x3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="m03FeW/k";
	arc=none smtp.remote-ip=74.125.224.139
Received: from mail-yx2-f11.google.com (mail-yx2-f11.google.com [74.125.224.139])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49BD8606A31E
	for <linux-kselftest@vger.kernel.org>; Wed, 28 Oct 2026 15:12:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49BD8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m03FeW/k
Received: by mail-yx2-f11.google.com with SMTP id 00721157ae682-8b1809cf49eso4914057b3.1
        for <linux-kselftest@vger.kernel.org>; Wed, 28 Oct 2026 08:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793200364; x=1793805164; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C5xQd1xIwUtBJyycWD3+XcISdDlmOWmJGD2rjg0it4c=;
        b=m03FeW/kbbVO+stnbit8ASYFjId3lG4TSvHhfOXq3a6uw8L9jO13zltFNWD7EK966I
         Aa9AxJf62YvyAd/5ADLndNx4MXyVvZQzIFdmyN3U2wtCIwWcSq8dx8Wfi7gpnaweyjQ0
         vSY5dxW2nQq6/dyCYl42nl3ut8l3w88C8sgtFCmD5PB1dSOG16NvtzU8Hjq1/pRlWWhe
         33+GBGQhf3CRVe4PaPwAgpMvbiSyMSbRG/JG7NtZHq8eCRlvlNK59njb3AjJ5gre6YE+
         4JIj28Y+tRI045M9MHlUIMVL7d8A/2xSb1IcfrGmyUGrXynTSR3ENyGZcRKSYMopBxOf
         E+HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793200364; x=1793805164;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C5xQd1xIwUtBJyycWD3+XcISdDlmOWmJGD2rjg0it4c=;
        b=2ht5EVTUdLI5lQv+WZqP4SRmrsWJ/inckAZACU48VdmzqCQAKcALacuQ3m2AOwat+Z
         dCTVya5O8QTMydErT/nMgta2fi9IQ3rR7idBu1oasL3FyXANW6bJSOp1iHNWrKOQ2P+Q
         lpB9ucvMNipfESJ+PLXWCwWnZbWQB+MO65Q4ofDLPjsefW3r7G4mHtAOkGZVeHhgGR/x
         /aCZewqsWxk2rvttoLslx2wMwyxTFc54tN9vzh9pX360RVyyFoWnZ+cwIph2+Jqeb/Dn
         UbScKI/RxN+Hs10EKgoMIt1ZU1q0zC5QFEOqaeUsiu6WW5w7fZEdzamAb8/8Fc1AcFMs
         kpQQ==
X-Forwarded-Encrypted: i=1; AKwUvBwn5sZo7iHNQtGz3le/a4eDBWS1wPE2fWftWYGwBJMi5byHK2cKgg7IelTS7bzQ/0s70+E2r75KCCK51rRAlQQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKnTNuChM2MY4MlaHFhnnuJlmXllMNLiiTM6zYtjBwJv/x2Bj/h
	/cLrcWl9ytlVqEDxmcUAa06uq8FZU+GIWwG9Piz/nDQ5k9+A5q4/FYLp
X-Gm-Gg: AYBFou1ZDUHz/Z37avv89kqpIW7jhB0TTbaSjav443//Jtfq7HwwV9Z9mU4i4ERPFqO
	cHOu41ZrU4lqrQ5Wdmtf15BwXSUOHKC0kDeQKaZtNyvnzDTVxhsnQy/PZKwoUDyh1XzCgfZ3Yr+
	tSaE1Zd/KNeNeJoIRZWli/9Iwmm7fHl/OuZc29j2m9Vt+SgMSPndLsZYLipKyjmdk2XM5a9JP2y
	Wv/jr3iF3YznSFY0ElXvSTEO+f1mZ5muktl8HthNpj/ht6SFNFL7EDqUndIDA/hVCcPwYdA/wEh
	yA9z+3ZdotFhIFMlJxg4xVBrWfVbEZYXxG3RzEaz+gVOfAk3I+Us8Vi8f8UDJ5cGPTKAgTINkSt
	crQrx1fgI77gpACArpJe9KpBTqeWV4+n99Hkd0GNWc2bo+kVHdLaXWcwpXQaok8O429zueKqJgj
	ILfN6VVxpilvBBlUTsWcxyLHicXe7vJtiB6aatT//I4jNA9mb8/4vYrJM9U8/JhTVUkFUo21u7V
	ZHzjZv1unqbz6aQ7+IFdF++p5LTmDrL6fhK2T5V0rCVhco5p5smd3owIMdo2d5FQYkT9R9d6mqs
	UKBZqTzZmAYT9pc4u6pZX9Ewk4owFwb05Z8=
X-Received: by 2002:a05:690c:386:b0:8ae:dfee:cd30 with SMTP id 00721157ae682-8b1b5b457ffmr18430047b3.56.1793200364364;
        Wed, 28 Oct 2026 08:12:44 -0700 (PDT)
Received: from [10.0.0.48] ([71.69.222.122])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b19e539e34sm29934517b3.9.2026.10.28.08.12.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 08:12:44 -0700 (PDT)
Message-ID: <e674379f-819f-4334-99b2-7b8dfc89d1a0@gmail.com>
Date: Wed, 28 Oct 2026 11:12:43 -0400
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC net-next v2 0/5] tls: perform TLS 1.3 KeyUpdate in the
 kernel
To: Chuck Lever <cel@kernel.org>, Hannes Reinecke <hare@suse.de>
Cc: John Fastabend <john.fastabend@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Sabrina Dubroca <sd@queasysnail.net>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Shuah Khan <shuah@kernel.org>,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Hannes Reinecke <hare@kernel.org>, kernel-tls-handshake@lists.linux.dev,
 linux-nvme@lists.infradead.org, Alistair Francis <alistair.francis@wdc.com>,
 Martin Belanger <martin.belanger@dell.com>
References: <20261028-keyupdate-rfc-v2-0-eb5143b4c487@gmail.com>
 <76ccd502-f1d1-4135-b92e-d783f259a687@app.fastmail.com>
 <3544cb56-e43b-49ec-aa94-beafe061879b@suse.de>
 <CAPG1HMsnUDa=Q5O4fwZOU=Pd+m7ahzu574Cs+mWoB_9KUT5ASA@mail.gmail.com>
 <097a2d7a-af80-47b0-b800-238396e6e662@app.fastmail.com>
Content-Language: en-US
From: Martin Belanger <martin.nvme.dev@gmail.com>
In-Reply-To: <097a2d7a-af80-47b0-b800-238396e6e662@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/28/26 11:01, Chuck Lever wrote:

> 
> I get that dropping the connection is bad; the current weak-ass
> implementation is meant to handle KeyUpdate until we have a proper
> spec-conformant implementation.
> 
> My concern here is if the current design is malfunctioning in LTS
> kernels, the only mechanism we have is to fix it upstream and backport
> the fix. I don't believe stable@ would be happy absorbing this full
> series.
> 
> Your commit message claims the connection stalls rather than getting
> replaced. If that's true, that needs to be fixed before this series
> gets merged. Can you confirm? I don't expect such a fix would be large,
> but the ordering matters.
> 

Yes, for nvme-tcp. Since 6.7, tls_sw_read_sock() returns -EINVAL for a 
KeyUpdate record. nvme_tcp_io_work() then stops without error recovery, 
and the queue stalls until a command times out. Only the timeout handler 
replaces the connection.

The fix is small: "nvme-tcp: start error recovery when read_sock fails". 
I posted it on Monday, and Keith applied v2 to nvme-7.4 yesterday:
https://lists.infradead.org/pipermail/linux-nvme/2026-October/066937.html

The queue now starts error recovery at once and reconnects. It has no 
Fixes: tag. I will ask Keith to add Fixes: be8e82caa685 ("nvme-tcp: 
enable TLS handshake upcall") and Cc: stable, so it reaches the LTS 
kernels before this series.

I have not checked sunrpc. Does xprtsock replace the connection when 
tls_sw_read_sock() fails, or does it stall too?

Martin
