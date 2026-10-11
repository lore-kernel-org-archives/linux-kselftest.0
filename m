Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A233B2AD00;
	Sun, 11 Oct 2026 20:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791749441; cv=none; b=ORjQhmN/MHb/9g1PuTHB+hCaxItwlvOqot8x93u9B7xXfAfvCXZoeP1MoCRi6LC6Ae7LB8aLpDifaykNeNN/mhcTX0s+9EdHqH2MIlWe03FBgK+mC3SzVVCpl1JzeOxQgPiEMLer4SniVEae/swVkypj72HPvig90+ABFsA9RRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791749441; c=relaxed/simple;
	bh=0lW7NXlLWcW3JHmAsxnYfuMkROJlPGhMtERY68ouGdY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FKLJxEe28TcoU3fpl5T2ApGYlDqytHBl8KibColGlHfijtlqaLRZfFzYGOhlWEdnfxHDP2AywnXwmX6Cj7eersBdSELuwGWDmwe84BUhRtTpgOle2Dm0JEHuu3f8LHlRw7DbRjcuCGKdruelXkuYc888LAexYjNxicfRdMSqUcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=PFEG18UE; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="PFEG18UE"
Received: from [IPV6:2601:646:8003:f231:99ff:bd5:ac70:6da0] ([IPv6:2601:646:8003:f231:99ff:bd5:ac70:6da0])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 69BK83d82753795
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Sun, 11 Oct 2026 13:08:04 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 69BK83d82753795
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026092801; t=1791749287;
	bh=38kwe/MM4HFYzJyg54GfyoGLCPo81FIpxmyL9rCu+jU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PFEG18UEjBlsJ1Kx+OxwBMu4T1HzMqDczww7DDQYUMOjd4B+hI6krRm5lZJAUOFWA
	 U6G+DKWwJx2GI6jNoTsSgBKTdm6G+YSIZAamT1i/qJnCVKfbcgSKCarMGGm00SIbR7
	 ra7QFi0GrMJMU5/1zw2at3uJ6a7sE5FkQkkJQbzn/uJxhbg4jjRaLikmXiSNwGM4mT
	 wLp/O73yY0PsviG8OH5mV1uk0H6UrBVEuf3Khr5U66PceZ0eGvA41fbS+MxmCQIrdv
	 QuAKyzpy051ZzZeVqZPho8kJ3TfSBinSckjQ6t5eBHu0vUFFljMJI1AojWyVRLAhJm
	 H6P3IkA5oFDWA==
Message-ID: <1d34d990-fe55-4bb7-99b9-82ca201a031d@zytor.com>
Date: Sun, 11 Oct 2026 13:07:58 -0700
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] x86: Start removing X86_X32_ABI
To: Willy Tarreau <w@1wt.eu>,
        Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
Cc: Tancred <alex@narraduct.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        "Maciej W. Rozycki" <macro@orcam.me.uk>,
        Bill Wendling <morbo@google.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Ingo Molnar <mingo@redhat.com>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Justin Stitt <justinstitt@google.com>,
        Nathan Chancellor <nathan@kernel.org>, Neal Gompa <neal@gompa.dev>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Richard Purdie <richard.purdie@linuxfoundation.org>,
        Sam James <sam@gentoo.org>, Shuah Khan <shuah@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>,
        =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?=
 <linux@weissschuh.net>,
        Tomas Glozar <tglozar@kernel.org>, x86@kernel.org,
        Arnd Bergmann <arnd@arndb.de>
References: <20261008-x32_removal-v4-0-d389a193c506@breakpoint.cc>
 <20261008-x32_removal-v4-2-d389a193c506@breakpoint.cc>
 <7f315c7a-0fd1-4f7e-93bb-703d4107aa5a@narraduct.com>
 <20261011171946.gMv8V9Ck@breakpoint.cc> <asvJlVyfxMVqw2E2@1wt.eu>
Content-Language: en-US, sv-SE
From: "H. Peter Anvin" <hpa@zytor.com>
In-Reply-To: <asvJlVyfxMVqw2E2@1wt.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2026-10-11 10:38, Willy Tarreau wrote:
> On Sun, Oct 11, 2026 at 07:19:46PM +0200, Sebastian Andrzej Siewior wrote:
>> On 2026-10-09 20:13:55 [-0600], Tancred wrote:
>>>
>>>
>>> On 10/8/26 03:07, Sebastian Andrzej Siewior wrote:
>>>> where certain workloads widely
>>>> move to x32 and use it exclusively. In the meantime Debian introduced a
>>>> patch to disable x32 by default (so it has to be enabled at boot time on
>>>> the command line) because they are afraid of the increased attack
>>>> surface. Fedora as far as I tell has X32 disabled (looking at 7.0-rc5
>>>> rpm in rawhide).
>>>>
>>>> Since there is practically no real use for x32
>>>
>>> I only recently discovered x32 and built a Desktop (with all daemons and
>>> utilities running 10-30% smaller and some a bit faster, with 64 bit
>>> libraries for eg. Firefox.) My experiment should definitely not decide
>>> anything, but how much real-world use would be sufficient to justify
>>> continued presence (more complex compat code)?
>>
>> "a bit faster" needs actual numbers to justify. One examples was quicker
>> gcc but I don't see a x32 compile farm leveraging this benefit.
> 
> FWIW I do build my ARM cross-compilers in a32 because they're generally
> ~10-15% faster than in a64. I wouldn't be surprised if that was the same
> on x86 because tools such as compilers very likely use pointers a lot. In
> a build farm it certainly makes a difference, possibly not sufficient to
> justify keeping a kernel port, but it's just to illustrate one valid use
> case.
> 
Compilers is known to be significantly faster with x32, because compilers use
a *lot* of pointers. However, even compilers are starting to need > 4 GiB of
memory in many configurations, especially when using LTO.

	-hpa

