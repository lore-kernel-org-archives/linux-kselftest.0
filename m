Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793934091;
	b=2jcre7RS25P0t9DCdK3QA0w6J2w2HHUiamHkj6oLHQLYpD5Jla5kL5CaJcpJ5saKvYeT
	 aCZWTFnjG71modvxG5Pc0Tg+HD8yLRj4/jQ9NF41jEpkKjosHlIKLLPeekYhi1cwMgiBy
	 0dn7LWQ4Oq5HatoVoQdnGsaJ6iODmb+y6ptg6kRbvqwxEATmLzMA3gq5axwyCMiEXUZYI
	 OuyJZHefLoIXGYBxDa/KQ+dw01RUoLHbwlevr5CvOjr9G7S6q6DQzy0Sg+Y6ITxe3a4Yo
	 ov0raZ7p3fv0B2Dc35Y1P4PTWoUN6GNMhjmFEE88yBkD94Ys86pjfnE3aCuct194M0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793934091;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=t6aRulHNXUeC2tlehsSj6ODcF0+cJ04EmVwTbLYgrmk=;
	b=iqAh4n17S/qb+qmt6Jk61nt6wkc2YxqwQ/mEWCpktBRZD9z158+PJ5z+cico99NSZU2u
	 IAsZsitadsi0ACc2qQ3wu2Uch8vr+Fe1xQ2NKAYX/L4eaSM6u9PJFeqxSG+UKihoKRh5o
	 MjGddMjcJA20TFIhptRV5Wx+JdocsdGpEeVFuCeOeJUAS80V9FsmlKj4wd5vmwlMavlIX
	 cVp65fRI/PmeyEa4bV9H2d6pefXPXdE6VwEqKyS4UR+sWoA/d40WAVkMYhyjxZf2i0BA4
	 cqx60up2McNOhD84bISLuMd5WlQ06bshHJjsrXI3c/ECJUAT1GUsp2mn/tZF94Fpr7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JCl4Gfy0;
	arc=none smtp.remote-ip=209.85.222.54
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ECE7606A328
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Nov 2026 03:01:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5ECE7606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JCl4Gfy0
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-9905d61449cso39815241.0
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Nov 2026 19:01:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793934090; x=1794538890; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=t6aRulHNXUeC2tlehsSj6ODcF0+cJ04EmVwTbLYgrmk=;
        b=JCl4Gfy0EBXXqrT5LV6qnfQdzP0zEsd279x8qeNp9xw1/cvvvBRYQcDjrC6GVeX8h/
         jfNkCTg3MZ5RUsyP2iQuXxG4os7zuN8QwX7y81S6xL7pSjyoZk6R8TkaCu9hAu5Ei2Mh
         ZYkL52QTJfBup6LDoFjp90Hjg/RUnODdQXlU4YnyTkPTvCix/uDocjDzixnymYooFjcG
         mITLgCR0CeXhXzH+uQTVkTtGwBXuEg/5MeuLoAFtpR+R2QCNGMLBO2V/+KSn6tW80Y+t
         z+0aKEtK5SqkEXHYzQKScdpOb75WveqS3Wg+sjB4Bw2zM0KWOR9c4WxkJOWS2cosEbUx
         d+dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793934090; x=1794538890;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t6aRulHNXUeC2tlehsSj6ODcF0+cJ04EmVwTbLYgrmk=;
        b=ZbJt+DjAwt1z2662E7qjsamHodI4xB9441TVbBf+xAhH6sBdWxOocRLff1l4N7s8dL
         K7/thlUHFSH6215VGiqoejjqEaZ/UYFIaRKjaN0Pjd+DJWRCqMszWlJz9/OKccxJaIuD
         +vUWdyrKPjvM4Wv7ByPsEawZY819aC9EmesA6uQl9ehzE/XnM4h0V43LgARMzAUlgH1O
         +WbmYh+Ip9xsiHlJxSsV/1WYr1vimqG58c/XgJD1zH9DkoPnGsF3hPJmuO35jRsvib5t
         TXfJTz7iPXNKslpwpa4d9M9pm9l5JEYhE715vYAH16sAGuj+RgnRssJ9RIeGPCmrgDag
         +gsQ==
X-Forwarded-Encrypted: i=1; AKwUvBzqhOg+W9smmwX8G2lXGqLRSnYwVOxaF5sOHvf1ybLf1U8QslXOPMZ88+6SGA/Thphm6gjOFXQkEEVijizwn7c=@vger.kernel.org
X-Gm-Message-State: APuU4Z8c9CJCzL+9pa8xIRqy8HC0yj6f1ZTx89dWOV9sTdDIZ+wuMspE
	+BaY738A79rq64U5vjIGUsoat1SubeU6+sRHtaTYdTE6wV+kw9Lbm6gh
X-Gm-Gg: AYBFou1cPvgo6Gj78T+akEZSU20s9WDRzyjFI7O8CPUphgqzo/eUJjqybdXPxYOCgEn
	/U2koXo+asHXcgQ8XY8dWnqjjMLRF0/GyEew99l3oyVGnAu6V+5Eu07JeMBQRvO00+W/n0cEUHn
	S7IrW1ueg/OXA7oJKmm4AEwjN8JWvLSE3iQGiYhJNTqHOzvwwkocswwad/PBUHi4j7WofSVcrG3
	Wd4E1bSmWhVrW9wnTY/wY36wmW4ttUobx8Tj6solIml+0gcKo+xhffHSKj4CgB0oz/8AsTjMcSb
	/Z94S5OhYptXJMsABqig1BkCP98nAsVnpUOCeE5ijDtsIZk4OsUsy+IWT5wFZyH4T5BYfuw6ddH
	DNtX4gxLyXolZQ5BazMpxsBF1rgdF5dyU6477IjBtPO5H2doVBP6nEsF7LD7drwDmQ2XH4Ka3Em
	tFHIknssji5KS7XHFLz3XTMcPko/bx281HIY2NAREUXw8EXX6ICAdcsuENgudB1IB6KSev+I8M6
	9x4MDWle3sbcGCqMfbzNJIJOe+qSGmTNV84S0/DlDvkBFxhZRVaLnWfL89DaI4qJ6xlvCne17m+
	Amentyv0bM+IPkefjL3dESruvb8EbikdIsun9wqmTeZ1qgolKH5Hpx2+TVhaB9Vax26TjF62/Rb
	PryycgmGtSRBPWB/L80KZ+h9p6CsaYqF2xvA77GsIz52MuMIBTMpX66Y978btMha74j78Lkg=
X-Received: by 2002:a05:6102:160c:b0:7cb:288a:b66d with SMTP id ada2fe7eead31-7d2a15989e3mr838027137.20.1793934090385;
        Thu, 05 Nov 2026 19:01:30 -0800 (PST)
Received: from gmail.com (223.230.150.34.bc.googleusercontent.com. [34.150.230.223])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99baea8e48csm854885241.10.2026.11.05.19.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 19:01:29 -0800 (PST)
Date: Thu, 05 Nov 2026 22:01:29 -0500
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Xia Yan <yanxia@cmss.chinamobile.com>, 
 willemdebruijn.kernel@gmail.com, 
 netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, 
 dsahern@kernel.org, 
 idosch@nvidia.com, 
 davem@davemloft.net, 
 edumazet@kernel.org, 
 kuba@kernel.org, 
 pabeni@redhat.com, 
 horms@kernel.org, 
 linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, 
 yana06070@163.com, 
 shuah@kernel.org, 
 linux-kselftest@vger.kernel.org, 
 willemb@google.com, 
 tpluszz77@gmail.com
Message-ID: <willemdebruijn.kernel.1e8c4e152eca9@gmail.com>
In-Reply-To: <20261106021245.246267-1-yanxia@cmss.chinamobile.com>
References: <20261104092240.15649-1-yanxia@cmss.chinamobile.com>
 <179387153949.488856.16266299848614841295@kernel.org>
 <20261106021245.246267-1-yanxia@cmss.chinamobile.com>
Subject: Re: [PATCH net v2 1/2] ipv6: fix cached route reuse for SO_MARK
 control messages
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Xia Yan wrote:
> Hi,
> 
> Thanks for the review. v2 fixes SO_MARK sends, including the concurrent
> sk_mark case that came up during the v1 review. Sends without an SO_MARK
> cmsg keep the current behavior.
> 
> Willem, you also raised the flowlabel and dscp cases in the v1 review:
> https://lore.kernel.org/netdev/willemdebruijn.kernel.6ba984cf38a@gmail.com/
> 
> I'd like to keep the SO_MARK fix targeted at net and handle the
> remaining cache issues separately in net-next. Does that split make
> sense to you?

Agreed that those additional concerns should not block this patch.

Are they net-next material, or similar bugs and thus also net?
 
> I'll wait for your feedback on the scope before posting v3.
> 
> v3 will also add a fwmark 0/0xffffffff prohibit rule to the
> connected-socket selftest, so reusing the cached route instead of doing
> a fresh lookup fails the explicit-zero cases.
> 
> Thanks,
> Xia Yan
> 
> pw-bot: cr
> 
> 


