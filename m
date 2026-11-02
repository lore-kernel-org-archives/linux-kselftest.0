Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793638732;
	b=WfAW9aYgr0I9CqXxZh6tHrBcxoNdqJ6PxH8hw4i0LqE2G06NazsHPjrL0LdmVAIn6MWj
	 Ds0niflhHM8ys1BNH1ORcN6pcaGtcGSKQ5fe8R3U8649jX1WZsFlLWv6YkNsuqsNbpPSJ
	 Jr92jwSjR3jgriVtV/D/sQUU70HN3A7Lc78wngEcvxUS4FLRmEaiiAIXciheEjdk7ZfVP
	 osdRGzcEZFNk3gaXzjN0yFjLh97f0VnnejJjKgV5JkKJ2KthsHI7GinAVIN26pUa7Aa9Z
	 u6eB3LI9aE0Cl8VvxvmQ+QExG1LXJbmc6b93iEDzWHUIx6y4uLroVAHMKmJY1E68SEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793638732;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=a1UEizqhRrALzFHTNmQJUTSrG4L5xUZaP4W7alKZj4s=;
	b=XE+0ORKKQrU2T1UfF0+lTIkoIaTIzhc1lEzT9KxAncy2nnigfPI1KCFd1vdkoBSkv6Nk
	 d/KLtwwmFDQ/q0+7ddU8oY2X1dmUaMXX2i0TtcTne1MrkyUMEunmE3NFh+SlI3fREXfvl
	 DZtnHuThqdWlcmjrzEGUHtUHVWhOTqMz+D9yEWJydRA6QULUFkTKTjsXi2/kfNoD32fsh
	 ef2XCulG95KhClfW2KCAU662HBvZoX+3MzjYtCplQAFdYymBIz1TvErh2TnBc/BU8M24K
	 T3DkM08mx9RLqah9TE8NfeNkSYa9b5oA2ooaCp2XWTTngvVyKSye5EM0yZSVu3ixvQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YxufiMKy;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2456A606A33D
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Nov 2026 16:58:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2456A606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YxufiMKy
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e985106c0cso30750235ad.2
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Nov 2026 08:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793638731; x=1794243531; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a1UEizqhRrALzFHTNmQJUTSrG4L5xUZaP4W7alKZj4s=;
        b=YxufiMKy+5T6HFI/woya2krFgptqtHLbGe3rwyLWiQZMTCIIxkoLbaDFYuinTxnDFQ
         jBNeRWpghfgUamRChITph1viv7GFidy9xg4+jtJoiBRdR8InNlMfCI05jOIRCkoqALPK
         GpA8ByvN7M6EL+H3AZZh2427QyqKSXxkbrSYxWIa2YHY8mR4wdniz25s+VrHilKMecZ5
         iN+88ridw0KG+e9+ILMExg7wzeDWazL5ZXxTMlsM1iO1815PwMqxV/JXNb9drO1a7Kqb
         GgJoT13jzZAsjaZuixpDgSYbCxuTuKN0hLBCDqQjivoCOgZsS7uIJh5fm89oD2UbzlHD
         fVsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793638731; x=1794243531;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a1UEizqhRrALzFHTNmQJUTSrG4L5xUZaP4W7alKZj4s=;
        b=V2YCHXoxec7+CNAEVWt+Fv/9GESN2pUTxyl2JCpEOpnoFflZRnBYPCuQk0ZdDs5ZOD
         ZORotrWoPp1KOouYeAjP3jQa5s6JksKUqYtEmUkcWonLX8CditZTUCqdI/wctg8ZPh7B
         /IYUkRs8Ws7vloopQ/+iOhZ2ld9QDVk7Vqes22/eLDdyOmtqjSBwOiGdStSFYr5LAYbm
         0fSiBwwfiwdSMyhLJfeTw+mG0+sOK0sd00qe+jOlMuny3J/bUd2oxM0YHu+5RnOZk809
         /wZyj3q40ZSvfqy+KXOy8sCo8TMbF1XjfJU0SnRSow7PjWhtb0RqOuS/7DNsC2cwDSvi
         rWtQ==
X-Forwarded-Encrypted: i=1; AKwUvByMukr1xNRz3SiFPRKyndR9Sf+DqvuhK4BhWtK4xgDbb0x4r5hZEL8OBS37KI0WnsZwyYsVeTROzeFzDBMMJhs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/9bsfPDgFmUUkdtBjbheFcAtIIWe0yePBbkuhnbzcDov+2v+kY
	XRy1oMW1eaBsyZ2YD/3kRyBUoiqu4RvYqjgqzjMFr7k5GpiN77n7yG6S
X-Gm-Gg: AYBFou1mThjRBg2gYSfhd5aJSAILWbiaY7VkyEXjg4HMSvzTHj9F+bCouu+knnjaT8q
	7stbTnM1AcnvTgxL0fBIVHosZP3zn0KnTcQpPQNH8MGq4U6p3Eq7irHMWzdbiLoPZ2E4Lov+xjx
	6Mjivjw5ieqAUEIPSre6ZAr2jwudzC81CspIMHeUS28/DD88Fip1G/551CUac4w3t7hShoJLU2L
	UnhIAity5uC6x3gDKAAy++M3jl1zM60P0kcxVuDiwb+oh5YsNnVH80OVbzjUxnibVfyxhZlup3R
	yEEGCY1IxBQIb8eZY7As50beqm+8xoSDY02TFFqpnyhP5PuTX+K1vQdlNYpvw/ZQXIJQcKzWNql
	03ozM/DYqG03n+bTasN4mZcUS9XxFy6zUzzdsNdTE17DtZ2aI2ywdObW//yuIOkPabSDb4DIQgM
	4s+TOfUhwCHBrQFshh3Xj/HCXurxpZ4mez6sKRY0H5YN/xKuSzTvWA3a0NMur8u6uDTgvzivxhb
	J6eTrd6IvFELTHzyRgz4t0mHBEwm+I9Um79gEkmldG+rrey5wfc51BkL+UeuqoDi4PqtdhPfb8Z
	fkX2ec0vBASznWBFTwDjDfKoFhbJFut8nYWDz31YS7igkFrSECqr32A1Jg0ggq/Sjyc709x2fjA
	=
X-Received: by 2002:a17:90b:570c:b0:3ac:8897:7ba9 with SMTP id 98e67ed59e1d1-3ae8985d52dmr9637264a91.56.1793638731557;
        Mon, 02 Nov 2026 08:58:51 -0800 (PST)
Received: from ?IPV6:2a03:83e0:1151:15:c56:221b:35d5:85f? ([2620:10d:c090:500::4:97ab])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae85d24261sm8776807a91.0.2026.11.02.08.58.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 08:58:51 -0800 (PST)
Message-ID: <ea9e29df-6f3a-4f98-a08a-d7efbee2ce9a@gmail.com>
Date: Mon, 2 Nov 2026 08:58:49 -0800
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
Subject: Re: [PATCH net] selftests: drv-net: pause: Skip support tests without
 link autonegotiation
To: Andrew Lunn <andrew@lunn.ch>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, shuah@kernel.org
References: <20261030173516.1002250-1-mohsin.bashr@gmail.com>
 <701c6f7e-e715-4647-bddf-48a1485afbe2@bootlin.com>
 <7cd99851-5bc0-4db8-a44c-a664c3f824b1@gmail.com>
 <2efe9f61-5a04-473e-bb57-12d2779ad829@lunn.ch>
Content-Language: en-US
From: Mohsin Bashir <mohsin.bashr@gmail.com>
In-Reply-To: <2efe9f61-5a04-473e-bb57-12d2779ad829@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 10/30/26 1:12 PM, Andrew Lunn wrote:
>>> Or maybe a bit more clever, have a quick check to see if the device accepts
>>> an ethtool -s XXX command ? looks like fbnic will refuse all of'em as it
>>> doesn't have a .set_link_ksettings.
>>>
>>
>> Yes, checking whether the DUT accepts ethtool -s is one options. We could
>> reuse the existing autonegotiated and forced-link attempts, and report SKIP
>> if neither allows pause checks to run. Alternatively, we can add a remote
>> arg to require_link_autoneg(), default to True, and pass False for this test
>> so it checks only the DUT’s autonegotiation support.
> 
> There is a subset of pause configurations which don't require autoneg.
> 
> ethtool --pause eth42 autoneg off [rx on|off] [tx on|off]
> 
> These can be implemented by a device which does not support
> autoneg. These setting go straight to the MAC. They are never
> negotiated.
> 
> 	 Andrew

Hi Andrew,

Right. The autoneg setup and MAC pause checks need to be decoupled. Let 
me respin the fix.
