Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964712;
	b=MZoO0bmxSnhW/MOVjfkruluEaOV8qS8UWO/hsgPGUnymOii9EhlgmbafzHJl/JCWI2TL
	 7Wq+hiwFpmx/oRLrM9Drjaq3xHX/xQf3cy8bkvucM/6vrqU6+j8IkXKxIPXJAZds/XQch
	 KPHDQkM/zE2ur6Eh2D5hMEIaDVbOl72hfYLee4a+tzBAeo8hrOwHx2Kk+cJgzVKqj2ya4
	 bBYxYBDE8gHTOBknw0qj8uw8Vh7LKXwRH2BNGlWGRY7z7v03+gPQQA2SHZEDOCv+QGdfV
	 AbPmI8gWZRjODRm3Pby2Xw4E8L8vl6Fz7BwcOf6aDGsX1TNwc6BjHzkBdY3R0IfsYtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964712;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=SQ+bR0WsyyCFBGJBKidE/zH6NxLKVxawz0VkrPvJ+00=;
	b=mzag5rcBEwdOsrQQn3DGNujf9eSXtpMSrqA9oFBawPi/IhgJ80Id9NsgvDevy2RCAUHN
	 YLfPKzgkYbWgqnXvZtsOwhZOyuy5773ecopn6i5mcrkBkErNTXLex9cDIBSE1TY1Se1CI
	 K4xEJEdZQI3bAHVpSlrMo+K1R3tsU0riYkG6LuAzqUF8u8wLemUsgkNYYN4e8UxPTmo/y
	 91OICsdMUWrFGF1rTJS2SUezsf1uET76mJbYTu9OmSNil2VBsETdAKdpAK6bKQcItduu3
	 iZc0RtUPHDHr/yriRazQZ7W6pHD3wGyyCA0XOr5/TaroJ8IY7mYyPQ2tPvhrO/+q/SQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Yz14CjDF;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b="/MdFE5xp";
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF1F606D812;
	Fri,  6 Nov 2026 11:31:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DF1F606D812
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Yz14CjDF;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=/MdFE5xp
Date: Fri, 6 Nov 2026 12:31:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1793964709;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SQ+bR0WsyyCFBGJBKidE/zH6NxLKVxawz0VkrPvJ+00=;
	b=Yz14CjDFOCgRguTVSRQ7gZP3skdtwm53d7acPTzxN77Y7NNbqegbwsjO34ddn+NmIEoCvz
	pXZhIjVURbmH6bYROICKIYVXol/ooelkKCFcVQ5kBZdmEind/ojzhpGVZv4q4sEkvIk8SY
	9EsNYy4Tf3JPT02LB10IhffJoqke7HmHCsgp9pZkLnResZPppRL+1kh2jr3lgeuHmobMlD
	Wux+9RHgzLClRK75NCb6drH2XVvCPaeny/SLIf0hF5cojgyKjWxZT5l6JSSxGz7tzP0H/s
	sAztrQ4bx265HNwi9RCJUHsw8ABEw9Ayh9AWNoqS1nvX/iXrBKtFzyDxM8gzhg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1793964709;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SQ+bR0WsyyCFBGJBKidE/zH6NxLKVxawz0VkrPvJ+00=;
	b=/MdFE5xpg2hqawdk5Hrko2nMpbQa4aacMxKJKQnWlDWo5ZGE4mcp98uB0yDP8ziSUpNY+o
	ep4ipFnGAMYL2HBA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Cc: "H. Peter Anvin" <hpa@zytor.com>,
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
Message-ID: <20261106113147.iCEmPCOW@linutronix.de>
References: <20261015-x32_removal-v5-0-2bfef9151fad@linutronix.de>
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
In-Reply-To: <20261015-x32_removal-v5-0-2bfef9151fad@linutronix.de>

On 2026-10-15 20:47:13 [+0200], To linux-kernel@vger.kernel.org wrote:
> Patch #2 prepares the removal of the X32 ABI and has the broader
> reasoning. Patch #1 removes x32 from the selftests because it does not
> have a depends on and assumes x32 to be always available on x64 and so
> it breaks.

Can this be merged, please?
That (syscall) test fallout mentioned later in the thread is fixed in tip.

Sebastian
