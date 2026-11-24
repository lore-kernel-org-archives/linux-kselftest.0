Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795537580;
	b=GE/cblFcI0CJ4pyMkcgzd+8UqY09EqBysxk+7+ty8ljlJlAYFAC3AjQrtUeOb1x6AzEC
	 WAQf6uEV3yKjN5qcshotGQ5Wa7TJ7unY7cmvMT2o2EbHeMsYmLJLTR/negLrEOYhNbrM2
	 QxKH5kp+lNJhIu3HQxZj328g5XnETBZDOVFtFDEMXg7Rt8x4xV8I+o9YbSSQuPh36t1W+
	 WIP3SFdgchHeogsrh9ED6FbocNOAg8QK8UrzH9jeLFybdyQtypm7D2hAAzrJ1AR3SCMbT
	 zKKqvolRN5uxGKWe9UB6M9b4xvVajwzcxiW/u5Kv7ywBfPXymV6XCwKhE7R7mqJ8AGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795537580;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=hvvEzw5j2uSFoxzLpQOwPs9N5Vu5l+tcKwqV86A5ZE8=;
	b=Xza9PLLNhrYrn4r8BiiRatStrLyNCIuC9CKKQ740ge7CWKOLlT8+rrX6kW+Wl75/yIS+
	 PTjNBVQN/HtYoF974nEqvTNK54wTlzT+ZZoYNvVryPiBOk97l2otF+QZlNiy97oIEUtC7
	 t81NLviODlB8OvI49fkOB1z5ejhBj5LWXMBvI33iGScIDklhDQGtsym1MAIuzlyRA2qdz
	 n6ZrYeEA8IOf8VBSF+OTsbK7LcKM/GsrLaJRuUaVA+qzHoGYbwO/6of4ZgnQljLBPlBsc
	 WnpmfLgIoZjKeaXgJOvyi8jAKNaitIxppvxKInzkFXQggVibaCuSUM1XFPIfPuepTSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Ywr8FHFJ;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837A2606A31E;
	Tue, 24 Nov 2026 16:26:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 837A2606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Ywr8FHFJ
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C95671A16F5;
	Tue, 24 Nov 2026 16:26:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9DC13601E1;
	Tue, 24 Nov 2026 16:26:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 722DD11E685A3;
	Tue, 24 Nov 2026 17:26:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795537576; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=hvvEzw5j2uSFoxzLpQOwPs9N5Vu5l+tcKwqV86A5ZE8=;
	b=Ywr8FHFJT7jYFD4Ih0SyslTF2nfcg8jy6ZYSjIwscLBG/OcrDE53A73Ww78ik/zR4g31Jy
	KpxW8lf1vQ3kvyDupNJJ4GH66oRHpUlumN27vPW1YOR6DmzL88tRcEJqk6m+xK3ZdqmAfu
	m8NEYAKYI3vDgCD7ok+Z/nn78FPLqH9Co8t5twc08Y74PvKaaOBVzvVjwaIvw0SqFbDOKS
	3h/dSiajXQtgoYBXpoSWpOgZWMs7WC0KBjo1sRDX8Vn9NTO+fDYeFFRKj1dAg3C/5nlwRL
	TkwfhokXTsNv7bsQVURn71oUbDjz0o87Wv4CdxVheo76ZHkl0D46H7xQ0V3AHw==
Message-ID: <39d50105-c550-4925-bf63-6f0fcbb897c3@bootlin.com>
Date: Tue, 24 Nov 2026 17:26:09 +0100
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
 <fb92bc0b-ab3f-49ac-b4a5-5368c87b3a7e@bootlin.com>
 <bd804c6d-0294-40b9-a6eb-2b1ab2ad357e@kernel.org>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <bd804c6d-0294-40b9-a6eb-2b1ab2ad357e@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3



On 11/24/26 17:15, Matthieu Baerts wrote:
> On 24/11/2026 15:28, Maxime Chevallier wrote:
>> On 11/24/26 12:29, Matthieu Baerts wrote:
>>> Hi Maxime,
>>>
>>> On 23/11/2026 21:14, Maxime Chevallier (Netdev Foundation) wrote:
>>>> The logic used to detect if the kselftest remote we're interacting with
>>>> is directly connected to us uses link renegotiation to flap the link,
>>>> that way we know if there's a switch between the remote and the DUT.
>>>>
>>>> However the current logic is racy. It triggers a link renegotiation,
>>>> wait for the link to come back up locally, and looks on the remote if
>>>> the link flap counter changed.
>>>>
>>>> It's possible that this entire cycle happens locally before the peer
>>>> reports the link flap, in which case it reports that we're not directly
>>>> connected to the peer when we actually are.
>>>>
>>>> Solve that by reversing the logic : Trigger a link renegotiation on the
>>>> peer, and check if we see the link flap locally. The current
>>>> wait_for_aneg() already waits for a full "up - down - up" cycle, so
>>>> it doens't really matter which side of the link flaps first here.
>>>>
>>>> This was found in the stmmac CI setup, between an Intel I350-T4 card and
>>>> an iMX8mp + KSZ9131 board. The Pause test was failing seemingly at
>>>> random, due to the link flap occuring either on the host or the remote
>>>> first.
>>>
>>> Thank you for the fix, but it looks like it is introducing new issues on
>>> BCM57508:
>>>
>>>
>>> https://netdev.bots.linux.dev/branch_deltas/net-next-hw-2026-11-24--08-00.html
>>
>> Arg seems that on this setup, the remote (I don't know which one it is) doesn't
>> support 'ethtool -r', damn :(
> 
> These hosts are running Fedora 44. They have ethtool 7.0. I can upgrade
> to the latest from F44 repos (7.2) if it can help.

Looks like it's rather the HW or driver that doesn't support this :(

But that's OK, I think we should ask the least possible features from the
remotes, the rest of the selftest should already handle the missing capabilities
just fine,

Thanks :)

Maxime

