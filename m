Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795530525;
	b=r7vNI3qSIFvWQdPmIJnyTygxlH/7ZlpPZFpkyHEMK/6kpXJV57yvBBwgK5bP7tKc5yCU
	 +Hf8RGMoxTNbX72rrJdSaVuCPCe16gVw9ygR3U39s/zS4bXyxTvJ4LpCzk8UVj8969J8c
	 ebjkG1XWnBnaDj42SkmeG6HaoaO48Q+vGmjNNzYR66BKHAsU6yqcB1i09wMEsqu2oFCxu
	 fnaceW6Lu5IlSMpwP5JQ14c5q98/k3NlZro3G+WrgLJEDlX9AvWgkQRotV6xEJexoYTzE
	 W9gD/YiaFerDZslDNLOEKYBM/VsDNxHOGEm53y7lUTqzoE0aFiZGbpLK1ECfzw2l/ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795530525;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=LH4a4hHP4+iSjT21Gj0fTiK9neIkhLuhZMVIe6xvia0=;
	b=GTN8ZAlv9K3U/SAcQ25BIO1CgGcbZWSoNoSLv2Hr/xZgVwVbXsXakGHXUKlAOuKBN7MI
	 XBof5tdRkNY0tcfNKbJB1DgASDl8vBFd+c+TFrPT1iItgg2OeQU0KVXgnoLJhgZxSQ+ee
	 zsIHNd5QhNPDqwY1N3Z31538W3rdcUYskY1lRFMLlwCFGvs+n0w2rFPqnouS2QENXgt3c
	 /Xw5DFtnbyUQyH7XWRsdCWcHlqpfUXm8Hs8rfEVccDKUUgiinHj0fH54SCje0fi7JTrO7
	 omnazRKpJVzAsxlyoK6KD0AT/bz9ryrEw/EJSTnvgucvdzeHVo3ELLTPdn6pL6W97Ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=lwtvOzvB;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A61A606A31E;
	Tue, 24 Nov 2026 14:28:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A61A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=lwtvOzvB
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C0D371A17C2;
	Tue, 24 Nov 2026 14:28:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 95019601E1;
	Tue, 24 Nov 2026 14:28:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D29D611E6983A;
	Tue, 24 Nov 2026 15:28:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795530511; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=LH4a4hHP4+iSjT21Gj0fTiK9neIkhLuhZMVIe6xvia0=;
	b=lwtvOzvBfTausWjF1yMGdOURL2wkFwGYG5dPFuaZEAqBxxsQew8BGJp/NBCEDD7ilggNaR
	PjILLjJzjQSZlnqQj6d2N9CMtRVZR3eIrKyd3zXYUdyFXjfmF8CjFPSa+E8ToJvTkk4Cbh
	VGVVJWjsWxSWVNAxSqgQwodVe7BMNUcY3Lf6hyldH+viILoEl4AG0XuJSCZee70rmK8blD
	WXcr8AGORCRMmFVzFv0gf2xaJAtduRIG0JJe3nYfU4hjrWtyFmd+aNbPNzTQYVQYcXdrCk
	cYasnytEzuj4VLjqgMWgE+Wscnmn/LQdGhw9otHIW3uGRuRLDxt5D6fBGisXaw==
Message-ID: <fb92bc0b-ab3f-49ac-b4a5-5368c87b3a7e@bootlin.com>
Date: Tue, 24 Nov 2026 15:28:22 +0100
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
Subject: Re: [PATCH net] selftests: drv-net: pause: detect the link partner
 from the remote side
To: Matthieu Baerts <matttbe@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
 davem@davemloft.net, Eric Dumazet <edumazet@kernel.org>,
 Willem de Bruijn <willemb@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Bobby Eshleman <bobbyeshleman@meta.com>, Stanislav Fomichev
 <sdf@fomichev.me>, Breno Leitao <leitao@debian.org>,
 thomas.petazzoni@bootlin.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20261123201406.479904-1-maxime.chevallier@bootlin.com>
 <4148e81b-ec5b-4374-b74f-4f5cba175c7b@kernel.org>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <4148e81b-ec5b-4374-b74f-4f5cba175c7b@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3



On 11/24/26 12:29, Matthieu Baerts wrote:
> Hi Maxime,
> 
> On 23/11/2026 21:14, Maxime Chevallier (Netdev Foundation) wrote:
>> The logic used to detect if the kselftest remote we're interacting with
>> is directly connected to us uses link renegotiation to flap the link,
>> that way we know if there's a switch between the remote and the DUT.
>>
>> However the current logic is racy. It triggers a link renegotiation,
>> wait for the link to come back up locally, and looks on the remote if
>> the link flap counter changed.
>>
>> It's possible that this entire cycle happens locally before the peer
>> reports the link flap, in which case it reports that we're not directly
>> connected to the peer when we actually are.
>>
>> Solve that by reversing the logic : Trigger a link renegotiation on the
>> peer, and check if we see the link flap locally. The current
>> wait_for_aneg() already waits for a full "up - down - up" cycle, so
>> it doens't really matter which side of the link flaps first here.
>>
>> This was found in the stmmac CI setup, between an Intel I350-T4 card and
>> an iMX8mp + KSZ9131 board. The Pause test was failing seemingly at
>> random, due to the link flap occuring either on the host or the remote
>> first.
> 
> Thank you for the fix, but it looks like it is introducing new issues on
> BCM57508:
> 
> 
> https://netdev.bots.linux.dev/branch_deltas/net-next-hw-2026-11-24--08-00.html

Arg seems that on this setup, the remote (I don't know which one it is) doesn't
support 'ethtool -r', damn :(

I'll take another approach then.

> 
> Do you mind looking at that, and mask this test on your side for the two
> boards you mentioned, please? :)

Np, tests are masked on all boards though, I've done more runs and the race
shows on all of them (all are now connected to the same type of NIC).

Thanks for the report !

Maxime

> pw-bot: cr
> 
> Cheers,
> Matt

