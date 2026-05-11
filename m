Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98240402444;
	Mon, 11 May 2026 14:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778511554; cv=none; b=co2qbMB5yuhAalkvaiKZYV0ZxhPpo+ddNaSw7nVZAkWpsiOYAZH5A6cLuAodS5CW16Jux/wy7MEpYZJje+HM7pM0A58kwkQAd/Nm3bm/H+eDaAQ0dEt50UCIQ4jYCsDNFGSN0CakpZkdOv7CyjPZhBBV6vpFtfZia1ieY4rFbm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778511554; c=relaxed/simple;
	bh=RVzl5euHWlrFeYWaPgVmNtPOGAoszfCB1xdHEgvKugY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dc7BUiIbTWEHMb8amR/v0BBu1NE8GBQOBaYVtLesxquRrVmV/SExgFMSEWtGlOxbmJZ/ClHyZCT4+kpbQFx+X+4TE7fkFkR/gnNsztuKhr3i1ZSBK6IF/P43oso2XJbvH2YuepfVL4rdjborer4OXSvGSL0z4BLsNi4j1a1ijXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=O40GmaiQ; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="O40GmaiQ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description;
	bh=BVxqP+WZYYmuf+JZcJQLw0/ZVaGLASkbs+ai8cu7+xI=; b=O40GmaiQg0doxpFVgahy4FlehJ
	c63QN8OMSCwe9GiwwoBmvi3xvqBNc9ZmMVDwpj+eYPHsMZDus8iCPT5PRd0x2ECTjqdSuWsxQ6a1a
	77g2UkpvLAKJKkcKv7JX1KgXOx2GQ8KYlppQ3b/Dt+FB0Q/N5gd8xxmTD2qcLU10Z0Fk9CXcjaS95
	Am8dNdzPKcKrk6rmOI0Th4mlZWNgK3A3FkTTBsMRtw1K6LINbUgvcoV63lPUefqTA51irCubKOPhW
	CItElULogaLm1uu8yLEZ4Ym+v6rqq/5AX6etASQm56nF2UHYm918NMrsxxi7eq5pqRH0CVYyb5QWC
	rcn7sklw==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wMS67-001gE2-0S;
	Mon, 11 May 2026 14:59:07 +0000
Date: Mon, 11 May 2026 07:59:02 -0700
From: Breno Leitao <leitao@debian.org>
To: Sasha Levin <sashal@kernel.org>
Cc: corbet@lwn.net, akpm@linux-foundation.org, skhan@linuxfoundation.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	gregkh@linuxfoundation.org
Subject: Re: [PATCH v2] killswitch: add per-function short-circuit mitigation
 primitive
Message-ID: <agHrzsQzBw2yJZp-@gmail.com>
References: <20260508195749.1885522-1-sashal@kernel.org>
 <agHSFo0yqypa9vk9@gmail.com>
 <agHcc4s-xj83dzty@laps>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <agHcc4s-xj83dzty@laps>
X-Debian-User: leitao

On Mon, May 11, 2026 at 09:41:07AM -0400, Sasha Levin wrote:
> On Mon, May 11, 2026 at 06:14:27AM -0700, Breno Leitao wrote:
> > helo Sasha,
> >
> > First of all, Thanks for this feature, this is useful to me, and I am
> > interested in it. Feel free to copy me and I can test the next revisions
> >
> > On Fri, May 08, 2026 at 03:57:48PM -0400, Sasha Levin wrote:
> >
> > > +config KILLSWITCH
> > > +	bool "Killswitch: short-circuit a kernel function as a CVE mitigation"
> > > +	depends on SECURITYFS
> > > +	depends on KPROBES && HAVE_KPROBES_ON_FTRACE
> > > +	depends on HAVE_FUNCTION_ERROR_INJECTION
> > > +	select FUNCTION_ERROR_INJECTION
> > > +	help
> > > +	  Provide an admin-facing mechanism to make a chosen kernel function
> > > +	  return a fixed value without executing its body, as a temporary
> > > +	  mitigation for a security bug before a real fix is available.
> > > +
> > > +	  Operators write "engage <symbol> <retval> [reason]" to
> >
> > Should [reason] be shown at "engaged" ? I was expecting it, and in fact find it
> > very useful, but I don't see it.
> >
> > 	# echo "engage __x64_sys_getuid 12 CVE-2026-99999-INCIDENT-4242" > /sys/kernel/security/killswitch/control
> > 	# cat /sys/kernel/security/killswitch/engaged
> > 	__x64_sys_getuid retval=12 hits=12
>
> This was a woopsie on my end: originally I planned to have a reason field, but
> then decided to drop it to keep the patch simple. However, I forgot to fix up
> the kconfig help text :(
>
> If you think it'll be useful, I'm happy to add it back.

I see the value in having a reason field, but at the same time this is
just a small detail in the grand scheme here. That said, starting with
a simpler implementation and adding it later—once the feature sees
production use seems like a reasonable approach.

Thanks,
--breno
