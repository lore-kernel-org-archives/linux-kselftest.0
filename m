Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC69542669D
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Mar 2026 21:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772831020; cv=none; b=pOptW4jhi0Vi14BZeeJTRmt3C6r4sNL1anAIsBmjcPFSqo/v3NrzAYvKWW/k3PzeAjNo7leDuShZQVIP0Oy+1o7mD8ppqtBuosyQPqJKNXUO45161++wbRUvObx/BPcXqVSJPi2JzKwhTKthh/TO4d+nXkNNpx0bCjpz5E6Xm0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772831020; c=relaxed/simple;
	bh=f9HPLplmGZJT6ekH3d6OaVwO0sJIVGcElbBUIIYf2jU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xc/WEIhXL2A9XjX0jNv9wN4CNk0HbIS1BDfZdEw5AkJQrctE8DDabZCJ33H2KJAMPGvUsw02hUex3VVJjMoEJZa1q5dBFDjWJGnnPpmeNDJJOJBADyg2WmkoYEnlpzvsr0Lp8V4Ody4WViEu8sJrH8xscBnfc0GCiEAispNaAqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=openvpn.net; spf=pass smtp.mailfrom=openvpn.com; dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.b=FuY1ViFH; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=openvpn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openvpn.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.b="FuY1ViFH"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4806bf39419so78352155e9.1
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Mar 2026 13:03:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openvpn.net; s=google; t=1772831017; x=1773435817; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LmPd7fKX1MJWS9YsyWAU5zz19VwQyuopGfhjBZOhMCI=;
        b=FuY1ViFHTP2jvul8QpIoOb70v973prOxLeqnAjIK2d24OGCEGUXbIjvX6b/EqnpLnQ
         awzOYN4eqjkFZkEQg66aGRRshB4plFKr4lzGET9Mq664c8cW+tDuOPYx94wB4pymR87d
         fr94Tji/+JdsubR3YhOHQqMkkwwlJr3JtoCTFiJdUfTjCCzmXsoJpemYnWpVZUU6mN2S
         QQiX7rIkZKLBmE9ETtIUOTWLryRqNpzm8ss6X38cal4KZnO9FpdhJQ7HGh/m7cQBFqU0
         0IJ705v0yM2dbOwybA9+nDXwQglFE7DZaNrLbnBB71NSkCHoKoYGxj6aeJcldhqgH3hm
         n8Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772831017; x=1773435817;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LmPd7fKX1MJWS9YsyWAU5zz19VwQyuopGfhjBZOhMCI=;
        b=ZXdMg3Ugxb8neHllUc7qa/MxUDbTN+bhL/TvP7waxJJdf/qtPJFAAxJIbRwNa9X6wc
         SlxzUTwBVtkNYkFoic6nQ9fEB0XdZfMQlCoZVQXT8CK6zpjuGRYVuyynTWvKwyQn+I50
         h898Enl+hR01N5haP6kMPqWQxLlkuHINE149/m+AFIU5oA4QVHoZaeofy1LQT6xKpDvH
         Mu+irlE8gVfFMKyYaCGztOHwgq78KuFKbl0o3YSTquAs8DXC0+pohVtn1Sj/wUxIBKrz
         sUeqSnggqAvJ6t2cPS7Vi78VkCjsLDZC2D0WF8e3U1hQaMkuFHITgb0xTNvuINUaqV7/
         PsUw==
X-Forwarded-Encrypted: i=1; AJvYcCUGsH+KPkbucX8gtfYyER87NSJ8fMzlPJYgGLuTS5tPi8vwYNvZ7J2LiLNCNxWB/E0pfi4q8cvdJxqGQPQOkb0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMX5LdoMPoJd1CAS9fi9vA5o2wII/mYzPQzvncNrVr4GdI1fbJ
	bmyg+LBo1NHV90KfhIZ6xO0qUYVMEBSVdVpMMS4wXJqrBmdN+K1lKkWQ5LdylHHym1284QTKX7x
	UPGFRFq/SvDHcZZf3iRp90Oql/3l8nxbScFxkEAxjj2jfE/lPUKsnkSKJ5i6QpjA=
X-Gm-Gg: ATEYQzxhYjgLXQuqJB09FUOIEc8u3OBVY4ZcuoO77b56VGD8GxeivOmMZywIQzFGJ5h
	szOth+8+KZGClse7wvimh/2wmwYJBEFbrGxhX3kyymwaafehs9mI+76Mccuuwfksl2wAuKwDu4L
	BV+bH+xO3cMyaSLTyLhz1ienUNaDow2zZQtTikVYVEjnVgsvDIUGI/BCn0ejVklLjGI9LHFXi11
	ABV1ATmA/yp62XdhwTn3CXbhlMik1z93oW/ywnkgaFrhecxTbz9n6f/hjzNx5M21JIpzamoOVYI
	mABlIWpM2yVcPSjjKhuGOMWMIvLz3X+dS1WYwzxE21zacTuEo3fkTaj6DIjWfArbCQDDi8sYlQO
	haarrBXzuVVv6Zch82PtKL67Ce29e3hU7niPoW5F/h/FDPEeZfLf+rizrM730J2g2yceCYTAdm2
	a/lYj4KIxhyRB5j4cNy9Q3Xofn20uQd08t8pEFGZMzVx8sRGC1Hu/jt9Okf5VDcw==
X-Received: by 2002:a05:600c:154b:b0:47d:6c36:a125 with SMTP id 5b1f17b1804b1-4852675edf7mr53802145e9.17.1772831017315;
        Fri, 06 Mar 2026 13:03:37 -0800 (PST)
Received: from ?IPV6:2001:67c:2fbc:1:99eb:76f9:2124:56da? ([2001:67c:2fbc:1:99eb:76f9:2124:56da])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48527648a19sm58448065e9.0.2026.03.06.13.03.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 13:03:36 -0800 (PST)
Message-ID: <618d8073-8191-41ed-9fc8-e0a36f45bdea@openvpn.net>
Date: Fri, 6 Mar 2026 22:03:35 +0100
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 5/9] selftests: ovpn: add notification parsing
 and matching
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, Ralf Lici <ralf@mandelbit.com>,
 Sabrina Dubroca <sd@queasysnail.net>, Paolo Abeni <pabeni@redhat.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 linux-kselftest@vger.kernel.org, shuah@kernel.org, horms@kernel.org
References: <20260304230643.1014-1-antonio@openvpn.net>
 <20260304230643.1014-6-antonio@openvpn.net>
 <20260305191732.2bbc386b@kernel.org>
 <b3197cdc-83db-4739-966c-018f8570070d@openvpn.net>
 <20260306125738.73a17bb4@kernel.org>
Content-Language: en-US
From: Antonio Quartulli <antonio@openvpn.net>
Autocrypt: addr=antonio@openvpn.net; keydata=
 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
Organization: OpenVPN Inc.
In-Reply-To: <20260306125738.73a17bb4@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/03/2026 21:57, Jakub Kicinski wrote:
> On Fri, 6 Mar 2026 14:05:53 +0100 Antonio Quartulli wrote:
>>> There should probably be an else branch which prints some kind of
>>>    echo "SKIP - requirements missing"
>>>
>>> Your requirements.py script prints stuff but the output needs to
>>> contain the word SKIP
>>
>> If "has_listener_requirements" is false, the test script still goes on,
>> but it won't check the received netlink notification content.
>>
>> So we're not really skipping the whole test, just one specific check
>> that requires extra tooling (which is normally found on all standard
>> distros).
>>
>>
>> Do you think we should rather SKIP the whole test so that we can easily
>> spot that something is missing?
> 
> No strong preference. But speaking speaking just from the netdev CI
> perspective it's probably best to report SKIP and then keep going.
> The system does string matches on the output. If we report FAIL after
> the pass it will show as FAIL, if it's SKIP + PASS the report will be
> SKIP.

Got it.
I agree that reporting SKIP and then keep going is probably the best option.

Will change the script accordingly.

Thanks!


-- 
Antonio Quartulli
OpenVPN Inc.

