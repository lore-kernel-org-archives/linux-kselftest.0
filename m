Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792681595;
	b=Kl186jozagsZ9+i8qJClEu5hyhwyoQnvrCXG6r0h3fBzidu0nKaIqTGsZ1Tk3tNV0TF6
	 2sGf+xEb884eK8NbhRdLDM7rzs9R96yKb56IX0kwm0P9I8kJe+nwCFJmk2HLuOv1BE2hS
	 Cx8OMs+awm+EYDVOSYHlMDi6yzxQ+A1Hi+5czAd99a1X0Cq3z4CZAZlu1eNDDDoaEiRRS
	 Qn7qt4DLH0NwlQGPkaLv8C8iw1km9XZDwpAfk6hqh9LqGupcHWTFL3HG/XpQrhkmlIYJR
	 Oo5/CZ6W73pLuQgoVVK6Q4vF0jI7poxa6ysiRhSZeLwAWfPrJjiGZjiQ1swmx5R1pPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792681595;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=ekF9lvLEzxb62Wm2Cc+1txkyvCz8Sd5551YJaQLjfRs=;
	b=XBVAfTxRJyW86tEvMTchCjwZMEYTbduskfrEmkATYe4aPn1LUiG2/RT+4AYnExFox6av
	 Okk4M1LkDhgJAItts6svHT/sVT8fqJ0vzFQaQM2OTYHz5K3ZDrFTSzcDkDxvcueJAEh+m
	 Ywl4odXyxBLPMDArkQqEzvJ9dtCSzHCslJHRPSJbcVRQixjFxjs08nMCWV0XbXlGJaFZX
	 /DQ/q1v/hWJjEXYN3TZAIqjP5LnfuJXHPCytmTkpNw5KoI1nO4WnJFuRbTVJzq1bFtSmh
	 bnmxJR02BiVBXt9ClN1gUwA+3ZQg0DushTJxHhpJwPxDXS+QpWSq3T3TfrraM+m2qBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Jg5dLcS8;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b="aaR8/HBF";
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D2BA60A4ADB;
	Thu, 22 Oct 2026 15:06:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D2BA60A4ADB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Jg5dLcS8;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=aaR8/HBF
Date: Thu, 22 Oct 2026 17:06:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792681586;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ekF9lvLEzxb62Wm2Cc+1txkyvCz8Sd5551YJaQLjfRs=;
	b=Jg5dLcS8WZ0ATuIZuZCaBL48hde0yZocPOi908H1kWqe1U4mStZMic8ly3lpCnkX/L8NYF
	kSqcyPMN42ljsjGV+fbGidRUtyChnaQjZcW9/Dbg0cZZNEm7lPqNYCd8DEQZvIuZuqff1c
	jcODFthFZGBZFBCEgtqH1CRCLOepQRIqUDgMJ3Rqu9ourwddZqMGlW6Ppg5rQ4mFZcQa68
	q2j1hs+2i//mdxnq7enOuBvXFpkEYVn7ZLh3TppmALtONESER2qZdC9ueAewRA8/oMhhiQ
	/GrIV+8hAXDIscAP2A6Jp8NLMIk8rp2MEQLWG749+Ioe6a/mCVGAIgxtj6NV6Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792681586;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ekF9lvLEzxb62Wm2Cc+1txkyvCz8Sd5551YJaQLjfRs=;
	b=aaR8/HBFxXEu2/ou4hgnvCbj4j/nyGiR450+/Xze4YZMy6aDI8MqMlQyI7iqtmAWVBKcz4
	62QO5FUtaOWZIvDw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
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
	Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Tomas Glozar <tglozar@kernel.org>, Willy Tarreau <w@1wt.eu>,
	x86@kernel.org, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v5 0/2] Start removing X86_X32_ABI
Message-ID: <20261022150624.THzKWu9_@linutronix.de>
References: <20261015-x32_removal-v5-0-2bfef9151fad@linutronix.de>
 <2fcf2983-0972-427b-ad05-b403e325ce40@linuxfoundation.org>
 <20261019103532.E7ra8pya@linutronix.de>
 <96d29c1f-d797-4f83-a65a-d1763f0cf760@linuxfoundation.org>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <96d29c1f-d797-4f83-a65a-d1763f0cf760@linuxfoundation.org>

On 2026-10-21 12:31:46 [-0600], Shuah Khan wrote:
> On 10/19/26 04:35, Sebastian Andrzej Siewior wrote:
> > On 2026-10-15 13:47:37 [-0600], Shuah Khan wrote:
> > > For selftests:
> > > 
> > > Acked-by: Shuah Khan <skhan@linuxfoundation.org>
> > 
> > Thank you.
> > 
> > > Do you plan to cleanup x32 checks from selftests/x86 Makefiles?
> > 
> > Could you please give me an example? I've been looking through
> > 	tools/testing/selftests/x86
> > 
> > and didn't find anything Makefile + x32 related. Just
> > syscall_numbering.c which has x32 bits.
> > 
> 
> Take a look at x86 selftest directory. You will find sigreturn.c
> and syscall_numbering.c that have references to x32 syscalls.
> 
> Makefile has handling for TARGETS_C_32BIT_ONLY.

Okay. If x32 marked as broken it does not hurt to the selftests as-is,
right?
I think sigreturn.c can stay as-is except for the comment referring to
x32.
syscall_numbering.c has plenty of x32 bits and I would go and remove
them once start removing the x32 bits. The reason for 1/2 in this series
is that the nolibc selftests expect x32 to be working on x86-64.

But this isn't the case here afaik. Now that I test it run into 
   https://lore.kernel.org/all/20261022142425.3Wx-RrU5@linutronix.de/

so the test is currently broken.

Did I understand you properly?

> thanks,
> -- Shuah

Sebastian
