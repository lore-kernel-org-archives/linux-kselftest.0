Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795536924;
	b=tDBsG5gI0PURnq9qcFVu7XUjf/m61ASmIggXD31OJLhHJ1FXYdZMWc64Npw7Lz0RSADt
	 2lRln0IAptCj8dUr9ttsIjRFi4ommhopUvg3eduKvTYUmrJ2rbmIlxMUVtMcadUwyIvE0
	 lWwsMTo1NApnBJKlDHUDWzvwXl51euLkhUCEHxBnrXDerVGfwmkvUp1Mz7TBOJxM1glJl
	 koD0FxR7kkQ2K2P3WkKQ6l4CDZsn6IA20Azvw32CU3OM5cbPACE3kF8NykG6fmVOUEDFg
	 bb0nA6t3yRPwG6XB/4RwegcRloM+dRqHZSU6/ayZ26nc020QEJ0c3ODu+r3U+I1v0yA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795536924;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:Content-Language:To:Cc:References:From:Autocrypt:Organization:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=uiQNVYXgIUG4G11/OroKN5uES2cSMZOjSb9VYOv68PE=;
	b=gYQa2/nEDoiZ7cmM5T4UfXc3NknK3Gkmw+rzDZ75QcSPRTyjALnriB9ONX+Tt7s/IzK9
	 bMovZj9UptEEDiE2tY8gXREkJTIXlDm3JXdtagGlVUM0ucSjVFS8nQIOhp6IF9B6cjjuX
	 aRr4OOzjBkiQhtJ5PdOpZr/QT0JSZTlObqnYDtM+U9qkLNe0Z22ApCA4Bzuqhg6TdnwNx
	 4efeq9UuYT4um9c543VFnDxhKt8QJdAy4y3P+P/ouQR9oeXhi6TeYaNaGRqc+9Yqn9ZSc
	 3sh5uB3Rtqwl5p01J2lq3zySsFu5M0jN4jcQuZ4EqUE5gKr2asa8z2MqiYfCFTAntaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H8BWmock;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392B8606A326;
	Tue, 24 Nov 2026 16:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H8BWmock
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFE951F000C0;
	Tue, 24 Nov 2026 16:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795536923;
	bh=uiQNVYXgIUG4G11/OroKN5uES2cSMZOjSb9VYOv68PE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=H8BWmock2kg3Y65KbONZTDD+P77pV0AReiFEwNO/8wNxZzlADqJCRU23dwB06Tpwz
	 toHpTMwMC78MdeLKigJWU8Yua3frMvc3trZLPDEpiZflAQ2HGt0E6AiNmQK3tUBz/4
	 B243BptkvfiQ7mmDRJWbIa6HyDSez2FBzZ/tYMaDwgNJkEh9+xCpHUwdAuxVH8U7Y2
	 ZmicHBtvlUKgppOMtWxXf+n6OOWIvmgpuK1sdlUJ1LShq1tyfFJ+YCVg1egVNgi9lk
	 FjGYn04B7zd8coT3wJ/k/43mS26yY3iDgX3EgIEOh+1SSOvvniIc81i6hOa58rJR4u
	 7DpRetjVHD8ow==
Message-ID: <bd804c6d-0294-40b9-a6eb-2b1ab2ad357e@kernel.org>
Date: Tue, 24 Nov 2026 17:15:16 +0100
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH net] selftests: drv-net: pause: detect the link partner
 from the remote side
Content-Language: fr
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
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
 <fb92bc0b-ab3f-49ac-b4a5-5368c87b3a7e@bootlin.com>
From: Matthieu Baerts <matttbe@kernel.org>
Autocrypt: addr=matttbe@kernel.org; keydata=
 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
 lzVbFe7fduHbABmYz9cefQpO7wDE/Q==
Organization: NGI0 Core
In-Reply-To: <fb92bc0b-ab3f-49ac-b4a5-5368c87b3a7e@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/11/2026 15:28, Maxime Chevallier wrote:
> On 11/24/26 12:29, Matthieu Baerts wrote:
>> Hi Maxime,
>>
>> On 23/11/2026 21:14, Maxime Chevallier (Netdev Foundation) wrote:
>>> The logic used to detect if the kselftest remote we're interacting with
>>> is directly connected to us uses link renegotiation to flap the link,
>>> that way we know if there's a switch between the remote and the DUT.
>>>
>>> However the current logic is racy. It triggers a link renegotiation,
>>> wait for the link to come back up locally, and looks on the remote if
>>> the link flap counter changed.
>>>
>>> It's possible that this entire cycle happens locally before the peer
>>> reports the link flap, in which case it reports that we're not directly
>>> connected to the peer when we actually are.
>>>
>>> Solve that by reversing the logic : Trigger a link renegotiation on the
>>> peer, and check if we see the link flap locally. The current
>>> wait_for_aneg() already waits for a full "up - down - up" cycle, so
>>> it doens't really matter which side of the link flaps first here.
>>>
>>> This was found in the stmmac CI setup, between an Intel I350-T4 card and
>>> an iMX8mp + KSZ9131 board. The Pause test was failing seemingly at
>>> random, due to the link flap occuring either on the host or the remote
>>> first.
>>
>> Thank you for the fix, but it looks like it is introducing new issues on
>> BCM57508:
>>
>>
>> https://netdev.bots.linux.dev/branch_deltas/net-next-hw-2026-11-24--08-00.html
> 
> Arg seems that on this setup, the remote (I don't know which one it is) doesn't
> support 'ethtool -r', damn :(

These hosts are running Fedora 44. They have ethtool 7.0. I can upgrade
to the latest from F44 repos (7.2) if it can help.

> I'll take another approach then.
> 
>>
>> Do you mind looking at that, and mask this test on your side for the two
>> boards you mentioned, please? :)
> 
> Np, tests are masked on all boards though, I've done more runs and the race
> shows on all of them (all are now connected to the same type of NIC).

Thanks!

Cheers,
Matt

