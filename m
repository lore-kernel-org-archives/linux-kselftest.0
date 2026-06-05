Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E4B78F29;
	Fri,  5 Jun 2026 19:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780686265; cv=none; b=tuKUGHUirmcn7w6nPWsOKRT7WVLKVxFnmCQxpKNarPgDWEiLhFBzogkO41VOWIEmOLs0yxIiGf+1C7k23YBemK3A2VBUvag5aIXr1H0BLNhLrvaYG2jLCyVRc+qSsZ5bOPQKE47aHohizupszzz2VkibwtLiZSlcZxcONIb/0Kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780686265; c=relaxed/simple;
	bh=3Qev/ga1upyjag7L7OC7iOHDoD/o3gA0l8Dv5VlTZbI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D4tUWK5TU5Gk8hIiIM1cEhbSHdydcyoEZyHuligqfewj+Aiq0NxMQaRZgnm5LZAooYoHPH8RTgA8UT2keuQ6etdJ2qSTH0O6ACf1pD0OPQ0P6NpKnBqt2wtlLji736K9Sa+6sPCmd7rOR5vkOOWinvF3Z1TbqlYRHM0JgOAflP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=g3RB42RD; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="g3RB42RD"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=G2oytyllnNUBsuAf9b0EEAUxa2HtBIiC89XNjOcARtc=; b=g3RB42RDjWvRQQSQ9qoYxfYiCF
	1xWte6scH78tE1FojTdm8OxEIlk9gsqqIjPnZG2uLtG0u1Z3ihLO0WGGJDSy+1edoBIdguUy3o6jK
	KYqbr5iEx7XpGGEBGMZJ5FuwOw17orn+qiijZ6OGnSe+OAVCCz1vjrcrLigwVCK26+WZu4r5B33ZP
	LGzZdnSgouicLvSCl84xC1yrBi8+8hw9GK1A1Kbl+JBdRzyCFBDi3xGN+xighMRrhR0RSllt2S5Qy
	SsweKZvk8R4pi5I2frpCcJtRi/vvZ/nXVnOvkKNyEz1KeYmW5GmjueDC0r5pqMxvl8becCGmNAtNj
	IVG2okDg==;
Received: from 2001-1c00-8d85-4b00-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d85:4b00:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVZq0-00000008RFz-2bdF;
	Fri, 05 Jun 2026 19:04:13 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 5317C3001FD; Fri, 05 Jun 2026 21:04:12 +0200 (CEST)
Date: Fri, 5 Jun 2026 21:04:12 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Richard Patel <ripatel@wii.dev>
Cc: x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Yu-cheng Yu <yu-cheng.yu@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	David Laight <david.laight.linux@gmail.com>,
	Andy Lutomirski <luto@kernel.org>, Kees Cook <kees@kernel.org>,
	Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, Florian Weimer <fweimer@redhat.com>
Subject: Re: [PATCH v2 0/5] Usermode Indirect Branch Tracking
Message-ID: <20260605190412.GE3117850@noisy.programming.kicks-ass.net>
References: <20260605184715.3383415-2-ripatel@wii.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260605184715.3383415-2-ripatel@wii.dev>

On Fri, Jun 05, 2026 at 06:47:11PM +0000, Richard Patel wrote:

> The above sequence does not crash.
> 
> With IBT, it should crash at the nop (because an endr64 is expected there).
> The IBT state (WAIT_FOR_ENDBR in IA32_U_CET MSR) is not backed up to the
> signal frame though.  So, when userland does a sigreturn, the CPU has
> forgotten that it was doing an indirect branch before the signal.
> (This specifically only occurs with signal handlers that sigreturn.)
> 
> This is because IA32_U_CET is part of XSAVE 'supervisor' state, so
> regular XSAVE/XRSTOR can't access it.  Doing a manual backup is tricky.

WAIT_FOR_ENDBR should be part of the exception frame with FRED, so if
you're on FRED hardware, this should be fixed IIRC.
