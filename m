Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6743FCB10
	for <linux-kselftest@vger.kernel.org>; Mon, 18 May 2026 15:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779118883; cv=none; b=KP9b4ylbb97sffmY+tuHxfNhSEj5w0arGrT7d7dpgNdoTzVM4Fs8Wsu+ZTq+gcoFOD3fSbuSjSlHcteI54QNtEwOT5X08krpAI72CR+G9W4Df5hH0A2zTZVKauHsm2LeT7xcXEoEgJ5Uy91qrMPijx0mBjfXcxGMu7SDnz4HcCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779118883; c=relaxed/simple;
	bh=tk5GTPAK/nlnsOY7+TwdKEKLbFUPr/NxBIWdKs81b/o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tKc8xdOLImVqKtvVlZiCufKKZ+uv7LSMMDfET+9r5T47vg5SmCqtkrXIgwHtgV+LpHDmTo/tbupmORnFY/fbalMv0PduMs1TTLHKSoQrM9TWTx/32r2O9VCuYY+SdCo1/M+7yEVrnazOlkZBBnzKdvUCny7ogdjj9sJ8eD1E580=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com; spf=pass smtp.mailfrom=6wind.com; dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b=XIWxQNX7; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=6wind.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b="XIWxQNX7"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488ac04e13dso2763285e9.1
        for <linux-kselftest@vger.kernel.org>; Mon, 18 May 2026 08:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=6wind.com; s=google; t=1779118880; x=1779723680; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=94Zjn9XQ3WDyXLdVoVZUdv+2NPn/y4aj79+Tl33qL2Y=;
        b=XIWxQNX7m8TQdntyMGgQxBLS1mv3Q6HmKWuxc1yDJmr66Utt283l/LZHrDrTkcGjHX
         +WaRfN/iivzLR/5GjTWkSKsehnGxQwRybuzaqWwG0ZprvVx2IEiZP1bwY2cOzcf927Nz
         YyEm8ntvVba7ATjnEzgw6yWHhAtgbyofN1KJNtvBfzfNJ8wXPN5eLuNl/gkrBShHXVvg
         elEHntUwzeIHS1eKPS2svpqTfzN/Z1QW6vREXZGM2KWFbXOmN26D5j1zK4HgSwy93yT3
         AMXcyr1hvlnrf+K5E8B2O1uWwTDapAES05+zz6ECQI7q8eefHPgO4pV1CKck2m9PEx05
         Va9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779118880; x=1779723680;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=94Zjn9XQ3WDyXLdVoVZUdv+2NPn/y4aj79+Tl33qL2Y=;
        b=UZsXXU7nwDxKT32c+jz0MFM4thN2XG02Q2gOopLAwUklYs7UhNzFTgjOYbts5q8YV3
         PI/5jYdbbdfpvxUzI9cFEmW034e9ZwDCmWBnA5PqN+SqpzRNvaQh9ivy+lpAoF7jm4dm
         Lihvbkphi5LOOWgNhAzcd1G1v9DFXVSX89NzYzt5jlOcOJE/pReNxzooZH6cwbtvMhGA
         t/UjLmSCr7QQBCdhRpHBBLzq5XqsHoFWfgzbRPoROO3XgCfraHBs2g/LZYDg4sX08++V
         X72/m0gVJSaRHuGkLWaEBsiAyjEzl3JSNx4m6Qpbyi4SDiIdc2i5raDRnClKwtcBo8dY
         VHrw==
X-Forwarded-Encrypted: i=1; AFNElJ/Wk6fSHSWjOsgHfJzgWE+H6MQq6b2ziJUlBZ94xxZ8WI1/Yyr351iSh4/lMCxwYkyYOKIQo/Pbfu8gJA0+Dcc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnYlhAF2I3IQa0EyUeiID4SjdrxjkiQFObikOr0V6RwdNGV/3L
	6ayWuPszfZ8f9ICara6Xn9dorCh/wN91Y8fYk6JeC1PQ5u151wAVHQ9XOXiWYjlw/Xg=
X-Gm-Gg: Acq92OEBv+T4EEjE8f9TDbN1urwxLNjiMnszUNGySRdjH5XNUvYQdqJPBpwYo8y0JQf
	aNdIil7V6jZKOMLviZpjAWodCZrJ/F027iIdEWB0yTk8b+otqnTlFgslQ9Fj4NqmEPl9Zs3HsPm
	lL4sdMLw8Tris+l8uIfqiMDCckMlRNesMwNAvMUhsx/Wg9zgmmuYFvdKA8qXUYm0pCddthsDGi1
	c5jUoOuxQaxyvgOdFkJeBDWl+JOL6zPHMMfAVsHo2iSV95dpN4SXBzv5k31B6HRWp3RdTkSSpSE
	/G77VsFCALt2wFGctW3lzpJ3QIY195SDfVa7wnK7oO46j6DgVkNuyUmPf18J9/yhOdxRj5D1HIH
	7GaBX9+i+a5qWBcZEzWmQBI2RZTfp0Kc07wYuefdvzZoHRk0NxuN/2yl9nsBIH4V1+8OHglu9WO
	fWZVzr/lvZkDJj8mh2EASDhE5xJlzruNp2YhnXsaEDp/nZOltHL/GlLYYqsbTPjSJdMjIJ/pOuf
	kf7+zlViOUpRvYuxhCjTVgszg==
X-Received: by 2002:a05:600c:1d02:b0:48a:5302:8ed9 with SMTP id 5b1f17b1804b1-48fe5ea0842mr143830215e9.0.1779118880533;
        Mon, 18 May 2026 08:41:20 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:b41:c160:6a1d:efff:fe52:1959? ([2a01:e0a:b41:c160:6a1d:efff:fe52:1959])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a6449sm38102785f8f.37.2026.05.18.08.41.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 08:41:20 -0700 (PDT)
Message-ID: <ef3b3583-253e-4e83-8bab-31672effb9ab@6wind.com>
Date: Mon, 18 May 2026 17:41:19 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: nicolas.dichtel@6wind.com
Subject: Re: [PATCH net 3/5] net: netlink: don't set nsid on local
 notifications
To: Ilya Maximets <i.maximets@ovn.org>, netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Donald Hunter <donald.hunter@gmail.com>, Shuah Khan <shuah@kernel.org>,
 Adrian Moreno <amorenoz@redhat.com>, Jiri Benc <jbenc@redhat.com>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Matteo Perin <matteo.perin@canonical.com>
References: <20260515201937.2813983-1-i.maximets@ovn.org>
 <20260515201937.2813983-4-i.maximets@ovn.org>
 <40603dce-f801-42ad-96ec-c8c0a57e5aae@6wind.com>
 <5344852f-e920-4232-9b54-5b22f6c8a1d3@ovn.org>
 <5d19e543-ac3b-4d32-a464-377d03cde500@6wind.com>
 <f695ac3a-aec9-41fd-a3d3-9537ea4c50f1@ovn.org>
From: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Content-Language: en-US
Organization: 6WIND
In-Reply-To: <f695ac3a-aec9-41fd-a3d3-9537ea4c50f1@ovn.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Le 18/05/2026 à 16:06, Ilya Maximets a écrit :
> On 5/18/26 2:56 PM, Nicolas Dichtel wrote:
>> Le 18/05/2026 à 14:46, Ilya Maximets a écrit :
>>
>> [snip]
>>
>>> True and also not really.  The main problem is that ID can be allocated
>>> at any point in time, so the application needs to listen for NEW messages
>>> on the same socket that it is listening for the events that are interesting
>>> to it (to avoid races), if it doesn't want to make a separate GET request
>>> per notification or track all the IDs that were previously checked.  It's a
>>> non-trivial amount of code depending on the application structure.
>> iproute2 handles it ;-)
> 
> I don't think it does.  If I run this in one terminal:
> 
> ip netns add test-ns
> ip netns exec test-ns ip monitor link all-nsid
> 
> And then in the other terminal:
> 
> ip -n test-ns link add dummy1 type dummy
> ip netns exec test-ns ip netns set test-ns 100
> ip -n test-ns link add dummy2 type dummy
> ip netns del test-ns
> 
> I see the following events:
> 
> [nsid current]2: dummy1: <BROADCAST,NOARP> ...
> [nsid 100]3: dummy2: <BROADCAST,NOARP> ...
> 
> Which is confusing to the user (myself) and shows that iproute2 doesn't
> know or doesn't care (which may be fine for this particular command) that
> 100 is the ID of the current namespace.
Right, it doesn't update its cache. I thought I fixed this :D

[snip]

>> I need to make some tests with your series.
> 
> Note: sashiko points out that it may be possible to have stale values reported, so
> re-setting the nsid_is_set flag unconditionally before the check may be required,
> e.g.:
> 
> +  NETLINK_CB(p->skb2).nsid_is_set = false;
>    if (!net_eq(sock_net(sk), p->net)) {
>        NETLINK_CB(p->skb2).nsid = peernet2id(sock_net(sk), p->net);
>        if (NETLINK_CB(p->skb2).nsid != NETNSA_NSID_NOT_ASSIGNED)
>            NETLINK_CB(p->skb2).nsid_is_set = true;
>    }
> 
> I'll include that in v2.
I will wait for the v2 to test the series.

Regards,
Nicolas
