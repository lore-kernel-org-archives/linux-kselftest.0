Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93AA64DBD8E;
	Mon,  7 Sep 2026 13:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788789495; cv=none; b=eDe4aRiY5bhmqcdvqz9tDZKLMt6zld/h5QPdpWGrlm9VRSuwqOZQbty8eoIcGnBa2w+Cso1R+jtaU0sZBAFeGf+zOCrWu/57jTH8297U/dcxX1cH/n43Afxn32ndiOVGrtQreE0mpAVMSNp+eUt8eRCxTEqp8TmbX4v0sJKsctE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788789495; c=relaxed/simple;
	bh=ljcrHedWq1Ys9K1dBC8Uo+R6ghaWA1Ae92dUxaCRhf8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BDMCPvK2dvbwV/gUmaux9JPhktJp4IyNI9IiiJGpXtJ6UfsLOEaeOlrR4uEkuP9KzvZDRVTey6M/PU35ZHY5I4zU85erxyNfD7HZt+EJXuqDoGphY3UXnKS/f2/WVkZnnKDwxm44zklcPm0n33V5vWU7KQMImKqjQEPsrJIjZ48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HjuqP7iO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HjuqP7iO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6BAC1F00A3A;
	Mon,  7 Sep 2026 13:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788789494;
	bh=z1mDaPmRC7gImDglEUkpWGQVzM5gc1put679glt5HCw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=HjuqP7iOWuRKnl0cjj83pOsmKyZZfDpFaX/7fXlGMgvcM9WyeEkETkpNhpqO27ir6
	 ZskIxkoVhS0tLV+tBFJSPd7OCVy6tAiqaNUD2eTQxmlq51gil2SHCb4nNaegA97mMo
	 fD3QRVD8XeJcIHzardA0zB3cQ8KnOPTMMAhuQ+am+u7yf1FqbpO5tJeAMjAYhuUXzX
	 ediC/g34DEJ5ll7Ys0W9vUECadlcEHTULSGD8Tjl7aRMM9SBB65LdY1zy+8S4ORa3e
	 cevbwdXSqb0/Ft3KlElfzqQEK2sCLpGYXcyhhN7MRwQ/5R2cfxuA09YpJqfB62Ukk1
	 bb2jNgGDgGBYg==
Message-ID: <ab86a29e-2825-4ae9-aaa9-b26580ac49a9@kernel.org>
Date: Mon, 7 Sep 2026 15:58:07 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH net-next v2 2/2] selftests: drv-net: Use cross-compilation
 environment for the io_uring check
Content-Language: fr
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
 netdev-bot+sashiko@kernel.org
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, donald.hunter@gmail.com,
 horms@kernel.org, shuah@kernel.org, sdf@fomichev.me, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
 linux-kselftest@vger.kernel.org
References: <20260903155524.2241065-3-maxime.chevallier@bootlin.com>
 <178870682049.219967.8686151218558794028@kernel.org>
 <318ed226-ec5a-42f8-a2be-c41959970ef5@bootlin.com>
From: Matthieu Baerts <matttbe@kernel.org>
Autocrypt: addr=matttbe@kernel.org; keydata=
 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
 lzVbFe7fduHbABmYz9cefQpO7wDE/Q==
Organization: NGI0 Core
In-Reply-To: <318ed226-ec5a-42f8-a2be-c41959970ef5@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07/09/2026 15:51, Maxime Chevallier wrote:
> Hi,
> 
> On 9/6/26 17:00, netdev-bot+sashiko@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 2 potential
>> issue(s) to consider:
>>
>> Critical: 0 · High: 0 · Medium: 1 · Low: 1
>>
>> - [Medium] Incomplete fix: the capability probe still uses a different
>>   compiler than the one lib.mk installs to build `iou-zcrx`, in two…
>> - [Low] Missing `Fixes:` tag.
>>
>> --
>>
>> selftests: drv-net: Use cross-compilation environment for the io_uring check
>>
>> This patch sets CC to $(CROSS_COMPILE)gcc at the top of
>> tools/testing/selftests/drivers/net/hw/Makefile so that the liburing
>> zero-copy capability probe (HAS_IOURING_ZCRX) is compiled with the
>> cross compiler instead of make's built-in default. The override is
>> guarded by ifeq ($(LLVM)$(CC),cc).
>>
>> [Severity: Low]
>>
>> Should this carry a Fixes: tag?  git blame on the baseline attributes the
>> whole probe block, including the ifeq ($(HAS_IOURING_ZCRX),y) gating, to
>> f81171fecd0c3 ("selftests: hw-net: auto-disable building the iouring C
>> code").  Since no CC is set before the probe in this Makefile, in
>> tools/testing/selftests/Makefile, or in lib.mk, that commit is where the
>> probe started evaluating with the built-in CC=cc in cross builds:
>>
>>   Fixes: f81171fecd0c3 ("selftests: hw-net: auto-disable building the iouring C code")
> 
> Yeah but OTHO this never worked, and apparently was never tested before.
> 
>>
>> On the changelog wording:
>>
>>> The CC value used for the io_uring library check defaults to the host
>>> compiler, which will fail in cross-compiling environments.
> 
> I'll reword yeah...
> 
> [...]
> 
>>
>> Since the probe is expanded well before include ../../../lib.mk, would it
>> be possible to mirror lib.mk's own CC derivation here, or to move the probe
>> after lib.mk is included, so the gate always matches the compiler that
>> builds iou-zcrx?
> 
> Well this is what I wanted to avoid :(
> 
> Let me reword the commit log for V2, Matthieu if that's OK I'll also keep your
> R-b, as I'll leave the code as-is unless someone has any objection ?

Fine by me to document this "limitation" but keep it as is: I think the
proposed "workaround" is enough for this case.

Cheers,
Matt
