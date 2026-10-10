Received: from dfw-s06.nixihost.com (dfw-s06.nixihost.com [104.225.208.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046412EEE65;
	Sat, 10 Oct 2026 02:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=104.225.208.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791599523; cv=none; b=rtrQCDsYikn6AVxts+dTzTnpT3pjucjxQMvbyLa5sD6TVkaf1/7iD8LF7gyqlSqk7Iyg4YPP8I3YW2Ry6UsqeARpTh29KUhQ4WPMjL0HfJnPW1vgSzI5RTsRXZM3EXZJmbG+Sv56cVd6y6ZU9lNMHQ/HjDSd/g9njXzzep+HqmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791599523; c=relaxed/simple;
	bh=TEJgGKxTTijidTOW6khy8tqoI++706EcOQMURrW0noY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JO+vW9T2b3DIaLMX+mkJ6HS17i1jUYUZlqgtz7efG5cULKoJacbbmAnzrTMhyLMCH5iREqA9lts3j+TNEst3kk1hvoF9DhheVx9asArJSrCkjmUzMUC9tLO4p6Ig44zzGL4Tm2nIEmTocljU9vxu6bu5AVkCdkDP4i6TSVwOs+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narraduct.com; spf=pass smtp.mailfrom=narraduct.com; dkim=pass (2048-bit key) header.d=narraduct.com header.i=@narraduct.com header.b=OZfPdXCH; arc=none smtp.client-ip=104.225.208.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narraduct.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=narraduct.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=narraduct.com header.i=@narraduct.com header.b="OZfPdXCH"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=narraduct.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=eRxQq/LgFPSsn689kVMjYiXabeDQdmIjxrIxdVG75uI=; b=OZfPdXCH/+hz
	AJIPIsvdJ9AhqrUAQpmSAS8BRkE4Zbl8LA+yodXFzxFB0srFZ1NS1C0uuL5k2PPuWaU9ZaPElN7+a
	PN2bJ4c1qeFxtRem3mppHFeTMq/HewpwXO/PQD3T/ebySJjAYgeGaQoT+ngz9HdFCBWwcq8b0GdHQ
	e41n7I5OrnuTLGzehBTba04Y/6MHi6GwrrAydHnu3OYB9G0Ev8RJmksmn6BsBl9kdhr5t5P4nx5XF
	ovEC7JqoWRUm2jv8iWKERd6YFrqRiAa1SgkMpdisOd/mLZa3uYWg+NWUSQ91R1L9TATjKR5YPxcWM
	uhc3b1jIR44mUI3OQlsqlA==;
Received: from [189.217.94.218] (port=50244 helo=[192.168.68.120])
	by dfw-s06.nixihost.com with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.100.1)
	(envelope-from <alex@narraduct.com>)
	id 1xFMb7-00000000Y6t-1t7S;
	Fri, 09 Oct 2026 21:14:05 -0500
Message-ID: <7f315c7a-0fd1-4f7e-93bb-703d4107aa5a@narraduct.com>
Date: Fri, 9 Oct 2026 20:13:55 -0600
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] x86: Start removing X86_X32_ABI
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Cc: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>,
 "H. Peter Anvin" <hpa@zytor.com>, "Maciej W. Rozycki" <macro@orcam.me.uk>,
 Bill Wendling <morbo@google.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Jonathan Corbet <corbet@lwn.net>, Justin Stitt <justinstitt@google.com>,
 Nathan Chancellor <nathan@kernel.org>, Neal Gompa <neal@gompa.dev>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 Sam James <sam@gentoo.org>, Shuah Khan <shuah@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?=
 <linux@weissschuh.net>, Tomas Glozar <tglozar@kernel.org>,
 Willy Tarreau <w@1wt.eu>, x86@kernel.org, Arnd Bergmann <arnd@arndb.de>
References: <20261008-x32_removal-v4-0-d389a193c506@breakpoint.cc>
 <20261008-x32_removal-v4-2-d389a193c506@breakpoint.cc>
Content-Language: en-US
From: Tancred <alex@narraduct.com>
In-Reply-To: <20261008-x32_removal-v4-2-d389a193c506@breakpoint.cc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - dfw-s06.nixihost.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - narraduct.com
X-Get-Message-Sender-Via: dfw-s06.nixihost.com: authenticated_id: alex@narraduct.com
X-Authenticated-Sender: dfw-s06.nixihost.com: alex@narraduct.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 



On 10/8/26 03:07, Sebastian Andrzej Siewior wrote:
> where certain workloads widely
> move to x32 and use it exclusively. In the meantime Debian introduced a
> patch to disable x32 by default (so it has to be enabled at boot time on
> the command line) because they are afraid of the increased attack
> surface. Fedora as far as I tell has X32 disabled (looking at 7.0-rc5
> rpm in rawhide).
> 
> Since there is practically no real use for x32

I only recently discovered x32 and built a Desktop (with all daemons and 
utilities running 10-30% smaller and some a bit faster, with 64 bit 
libraries for eg. Firefox.) My experiment should definitely not decide 
anything, but how much real-world use would be sufficient to justify 
continued presence (more complex compat code)?

If left behind a flag like Debian (like the 2014 proposal 
https://lore.kernel.org/lkml/1415245982.3398.53.camel@decadent.org.uk/), 
there are no security risks so I understand the benefit is reduced code 
complexity and maintenance burden. Older threads critiqued the 
implementation. What's the smallest kernel support which would keep 
32-bit pointers possible? Could a small design (eg. just 32-bit pointers 
on x86-64 with i386's type layout, so no 3rd compat case (cf. MIPS n32 
and o32)) work?

- Alex Alejandre
