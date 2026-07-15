Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 694DF2BEFEF
	for <linux-kselftest@vger.kernel.org>; Wed, 15 Jul 2026 13:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784123951; cv=none; b=PmXPfjcZ8vYBsamVymOoS729mmecWgBhEYipOBOftFS729YbZJuavIIwNZq26z4G04k4+e2IpPRmALstHTKV9CZtNtB74mqmYDpCfSbgtuRmSUgjYGqVKzkcJpg3sybmFRH+ThDxGwsZg//D6MjuNtJB6BCaMTuY+D0G2w/vHRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784123951; c=relaxed/simple;
	bh=QYrx3la5ntAKtVZEZfw1wXSd0ShgpB97LVU+Yz+xAdE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=llg/YxpJArNu87z24yZgsKtJTd6MzDZ67SDsXtAjdPu0eD+bYN9xlsHflV/6I8eBT/p9yFfMybh4XRGQW9y0aBoYXEmH5/zS99vt3ZHlknriiZGSPfKJMlM/3M3wNTrqvzIbJP8QQ5CdgM3DVf2Hmp59tVFlN23/slVwJjgB/1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Gk2uER6O; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Gk2uER6O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Ves8
	I4HQSDwuYcpoElbBGp3o0zSoq6p668rnJaElwDY=; b=Gk2uER6O3dnGG4Tzay8x
	hnUHTqgkyHVmeGTwh1Ho+Tz2jv88pfPQ+HS/Hd8CRRh6ZGxFwZ3/wkDObbkh06A/
	1G2c2ACo5KhAJ0PxvGFC8SQINdL1VmNDfx/CzKHypgzPgbht7jWrUe5Zx3/fu89C
	HudCFiACI2US140f4pGY7WnS7yjIlWQZkOT93UE+3nrMSV9NtuSy9edXpBM5JSuV
	as/Ouz3anP8MHll4bHlkPqBKSScOPcQoDrzc5vQP4gFJBuNAx92+csFNbxrhQ4ei
	plqjTU/OxG5vIijdTXUv62btHFrDBnGFfYThQlP6O80oHzlPH+UEX4U8Kr13FAth
	Kg==
Received: (qmail 715327 invoked from network); 15 Jul 2026 15:59:04 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Jul 2026 15:59:04 +0200
X-UD-Smtp-Session: l3s3148p1@bPXjuaZWOA9tKXCU
Date: Wed, 15 Jul 2026 15:59:01 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Pascal EBERHARD <pascal.eberhard@se.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
	Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v2 0/7] clk: Add support for clock nexus
Message-ID: <aleSJafTTPe9Keas@shikoro>
References: <20260710-schneider-v7-2-rc1-eip201-upstream-v2-0-b4680787377e@bootlin.com>
 <alNN5qxBJ4EsB3Li@shikoro>
 <87ik6ge7kd.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3CdlzGtZ2+z9JVFH"
Content-Disposition: inline
In-Reply-To: <87ik6ge7kd.fsf@bootlin.com>


--3CdlzGtZ2+z9JVFH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Miquel,

> that all the drivers work on RZN1 hardware. When we send this out we
> will include a link in the cover letter with a branch to test,
> connecting the clock, irqchip an crypto changes together. Don't hesitate
> to remind us for that testing branch if we forget to include it!

Will surely do. Sounds awesome, thank you! Bonus points if you could
also shorty summarize how you tested all the stuff then.

Looking forward to it,

   Wolfram


--3CdlzGtZ2+z9JVFH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmpXkiEACgkQFA3kzBSg
KbZcHA//dAis+ekgGQ0PPkVMFajQvqo7G8CsFDkqEZNV8a0wtK+CAnJ3sF9ZnA/9
5THQaosfNakifzGHMcKlvn+U11IJhQHbg0Bcswu8hbjWN2zorDFqQ0JcvyqCHC1Y
PFoirBvIDARIeWWZrJUon+uR4JRb9TR1ERnYKJ5or/4e5eqVOZJQQkf/a40tTIq6
qxvd3rK8cn3dkBur8DNCTCDraen7a8iw61DFJeUL4kZ3a6ILzDp68rN1uY3LmOhH
ZMHfzqiLBkT2wyJEpQhEKrBy4/tarHyKBYcHJDsObDnByz3TqP0pXAloEdRkZAF8
4LnNHbR0TeQjvO99WXDfphyNtfoiJKRSLYIFebuiKSO+sw50yFnTqiUU7xOAZOyx
D+ztbEAyanEivlkDwGk5EcSPHQFY6s30wmzmk9b6r3Lr7QKHsiNs/yLX5p9BKvCV
hvPTvwSfKPWpNVUZZajD8GCLXlhyRdzQMLEY5RS5ne/zXYyW1uwHAs1oIuC3OMMx
EpIdMFTkylPcykTOZrLo7DnjJFsv3dZFKg1B2qmlVlac3k19CY+vOCslBvVOMAQf
TedFryjC44eu1JK0/L3iCF8+Cky/lNn0HuYTTUA874qpNMfrBLCKPQagqGac+Qad
JEyucuyYS5pbYLW/LEtbvPmn8ZPi8NDmr+w//4mQ89wvIn4KdN0=
=cvdn
-----END PGP SIGNATURE-----

--3CdlzGtZ2+z9JVFH--
