Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D5B430BB2;
	Sun,  1 Mar 2026 11:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772364854; cv=none; b=aKR/Tknd72rK7bRnNo9pKofppzgV/wD6cwAL3BsjasHVwpejhaCl2YochRFGYu9wIUlMBD8xzWjX2fAmm73olCJntW1tAV/tH2naXdMvnP4jy9/1jUz6zKiZcqG0pYF1rYTT8crezv5mfgrDjEFZfaI0X3TMnp+ln/Rd+ausYGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772364854; c=relaxed/simple;
	bh=lndfEzYApbo+J04W6xnrDsR6Op8iVMeQ+RiOt5fO2os=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TsQC5PPKRDwzOHQMgV1P1BPNv4BwxDXPEJsl1hElzUz3IjrUqjeJ3QLftJuPm+Fic0ADs/6DL+wEcfI+1dPYDPTe4Koz4luCWkVGUHc3ojr8qAyq7q6h2Uv2ncUjXqpNclJ3ClOvtxafnccjDaTR3/7wvOx555Izjm2NDxF3ouo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=OWq45Qfs; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="OWq45Qfs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1772364849;
	bh=lndfEzYApbo+J04W6xnrDsR6Op8iVMeQ+RiOt5fO2os=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OWq45QfsR/qIKiikbdSWOF1SILE8uFrGCpL6iWbGz+Q9V4/dsWCsB7ply0VbG72pO
	 0JHcUGvrwvpcroHqoTlO0GaCblhHU0PXkuGE5jW/IHtA3Z2mqaWqFU7M1V1H06jNR0
	 TWqxBp+2nLOGhvu7/0eg1oHafLGIVQyWOtxnyPH8=
Date: Sun, 1 Mar 2026 12:34:09 +0100
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Matteo Croce <technoboy85@gmail.com>
Cc: Joe Perches <joe@perches.com>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] get_maintainer: add KUnit maintainers for KUnit test
 files
Message-ID: <0fd8bfde-e7d4-4730-841d-85cb4c5eb8ac@t-8ch.de>
References: <20260301011131.4057-1-teknoraver@meta.com>
 <8eb8c51eeb87f178e92e68bcfffd02701845c48d.camel@perches.com>
 <CAFnufp0rQ=p2qGcpDdJB-SjW=qNOaxFRTrO1TprhKLtds96bJg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFnufp0rQ=p2qGcpDdJB-SjW=qNOaxFRTrO1TprhKLtds96bJg@mail.gmail.com>

On 2026-03-01 12:17:17+0100, Matteo Croce wrote:
> Il giorno dom 1 mar 2026 alle ore 03:36 Joe Perches <joe@perches.com>
> ha scritto:
> >
> > On Sun, 2026-03-01 at 02:11 +0100, Matteo Croce wrote:
> > > ```
> > > KUnit test files are scattered across the tree and don't always match
> > > the F: patterns in the KERNEL UNIT TESTING FRAMEWORK MAINTAINERS entry.
> > > Add the KUnit maintainers automatically when the file path matches
> > > common KUnit naming conventions: _kunit.c, -kunit.c, _kunit_test.c,
> > > and -kunit-tests.c.
> >
> > nack.  There's no need to modify get_maintainer.
> >
> > Use F: patterns instead.
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 96e97d25e1c2..9796e184b9d5 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -13956,6 +13956,11 @@ F:     rust/kernel/kunit.rs
> >  F:     rust/macros/kunit.rs
> >  F:     scripts/rustdoc_test_*
> >  F:     tools/testing/kunit/
> > +F:     */*[_-]kunit*.c
> > +F:     */*/*[_-]kunit*.c
> > +F:     */*/*/*[_-]kunit*.c
> > +F:     */*/*/*/*[_-]kunit*.c
> > +F:     */*/*/*/*/*[_-]kunit*.c
> >
> >  KERNEL USERMODE HELPER
> >  M:     Luis Chamberlain <mcgrof@kernel.org>
> 
> So many rules covering all possible depths?
> Sounds good.
> 
> BTW at this point it would be useful to implement the ** glob operator,
> but maybe it's not worth it.

K: or N: patterns would be cleaner than both proposals here.


Thomas
