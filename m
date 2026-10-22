Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792685397;
	b=TclUcCqCkEAu/iiibCxOcNtnP/eKMGGKnUo1jBHMPE659YQa1VyA8EaT91JOrNJ3dBHi
	 bUlY8uDoc7AyMlQsyf+ThNGPdj4U5Bf8bF2LYLUgiJ66l9DXjPIJQZpSXH+Q0aks9pIJF
	 5e0KHaWgQMV6t603baC9gCsg6D/VGyBfMQKz5C5pfoJWBhVrkwzCUygHzivkkknWnIbpc
	 6YNTB+IWSrzcqEjRBQPI2+IH7kRMRtoJ+TW9kX497xq/MOFuA2aEvUZH6ct8Ms7pybvHd
	 EFayANpE7eraWKkcLIEIUto8/3VdIRNRu7pjFhYXHWoekgaR9qQW89nuPCJuonEzXWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792685397;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=v1Prpp1754oDiTS20NqGEFL5tiELyqU5TBJPE4Di/34=;
	b=ucy4A5GEDUGfFTMdhDN8GM3Pwg1aINGairUNeXQiJaUktYeIHVNYvp9AwWTPjvPSGcqg
	 akfsp9rpgIFGUfDlmsYrdFhg15MEs8sm4PZMjbVePPIyMliVPXzMQ7x+74YZPicHUHyDn
	 7MEdYf7jxzJM6jHhHHpTdy6hqFMhjwb1gYEs5ntl6OSnj+gqgIUCVKfeg4h/FPoBD12KB
	 9JogwVFi9ePG94nYwYvohf9Ed12/qRSIP1e3TU/Y151EBeCm4Yfbb4+dKWX1xZR0kub0v
	 Mnl4REGn9B5KRveqJ6nrs3sMB2vzGrpYhcxeo29hLlbGEmAu874aQZCaZqFkX4AaWpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=c8grHt1M;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b="HRy/pchk";
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3921F606A321;
	Thu, 22 Oct 2026 16:09:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3921F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=c8grHt1M;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=HRy/pchk
Date: Thu, 22 Oct 2026 18:09:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792685390;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v1Prpp1754oDiTS20NqGEFL5tiELyqU5TBJPE4Di/34=;
	b=c8grHt1M357EJP9+SRiIzZOJDe1Nkx8zzKjUju/KETCvRrHFe7yKwCAbP7pb1CSMqox95C
	5Ak/tS+X+6FJ+2ebv9X8KmQrt8w5Z3GRHSMo1dN9OhEchMAkVdgRI7T4DG4EMeVQGTtQCF
	Wp+oDOzr7t6x1t3Y9q2V68nb8YejlpMDhHaEqNE90wNzfAydtxyLW0RtxYGXQyUabREwFI
	Sw59RhIaZZGbxiSoqTHz1vPBKc2zgK5mnHm0J1OadTkvavFO6g6sPnYhXecQsKvhQFErd8
	N/88/fvPjvBJGdG7zyawNbCTU3DDN/3WqDANKFFWqmDY+F47eRKYDDSUUZDKmQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792685390;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v1Prpp1754oDiTS20NqGEFL5tiELyqU5TBJPE4Di/34=;
	b=HRy/pchkaWHeZE2tmmY1W4XimyRO4ykVMott7BQvUGqLVh+82KJUA+J6bVJmcEYGhvFm6x
	B4ETxuPIKfeJaYCQ==
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
Message-ID: <20261022160947.K-lG2zzN@linutronix.de>
References: <20261015-x32_removal-v5-0-2bfef9151fad@linutronix.de>
 <2fcf2983-0972-427b-ad05-b403e325ce40@linuxfoundation.org>
 <20261019103532.E7ra8pya@linutronix.de>
 <96d29c1f-d797-4f83-a65a-d1763f0cf760@linuxfoundation.org>
 <20261022150624.THzKWu9_@linutronix.de>
 <271a7031-aa67-467a-be40-9b08efe3fae6@linuxfoundation.org>
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
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <271a7031-aa67-467a-be40-9b08efe3fae6@linuxfoundation.org>

On 2026-10-22 09:55:43 [-0600], Shuah Khan wrote:
> > But this isn't the case here afaik. Now that I test it run into
> >     https://lore.kernel.org/all/20261022142425.3Wx-RrU5@linutronix.de/
> >=20
> > so the test is currently broken.
>=20
> Probably. I haven't investigated.

I poked the one that made the change and lets see what happens=E2=80=A6

> >=20
> > Did I understand you properly?
>=20
> Yes. My objective is to get these items on your list to take a
> look and address whichever you see fit and we accomplished it. :)

Okay, perfect.

> thanks,
> -- Shuah

Sebastian
