Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B50E313E36
	for <linux-kselftest@vger.kernel.org>; Wed, 28 Jan 2026 16:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769619544; cv=none; b=Q8YYLpvs1hHfcYxKRG9bun9DK7lz1gBG1Z9ZMkrQOVJFk7LbFk+yKXNVQwHTrUsJ7usWIeAZgdGVWYQUx68ps+tjPk9W5pcOC4JNq5jth6q3nC8eAVSojPBdSmckkO+rWfZ6x31Ncvy8oh5LB/+LvoP6HAkpk59tSs6E6bD8478=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769619544; c=relaxed/simple;
	bh=8xe77tuZ8Z5QtCXy8sZIKurU0DRJyhmN/i54idfyKuw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k6aFPpjlT9R/D7EegTPJnJar2jz7vvJ1GCIQ9Un2EoUtbKRnbWyN8p2v74g7r4hrn638FOT7PZ2Z5fr1FEuTxKWaBmqWQYJyl2lOll1SZZJ2dHCS4HFkWO8NCNRY7vgjZRa9NClq98F7k6TiZJZ5iRUf01og8a4bZB49QrJ40K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Tlsto9CF; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Tlsto9CF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=8xe7
	7tuZ8Z5QtCXy8sZIKurU0DRJyhmN/i54idfyKuw=; b=Tlsto9CFJcuQffi5Si3q
	OrU+28+6CiwxtcDAHFoiG/xRkYw5R95+xrv2gyB7KiTucDiY/YxQDEqIaoA28FRL
	TECvKTFAYUqjFoALyA4vj1BxKCluNL1EamB0IFVao2QP5ogYSdtdmHL0TsAJRR/E
	Dz5IjRcoyezNWeIhLBcGBc9Sq83NQ6/nTwVpJINHD0FNX5nxLVN2259fWDczaXY2
	WNy4x/sfrgT/bMo4A/uIkZ9JzLi/cLDPSUJ09ePEwVR8DnD+SIykhgqT1AMrS1yQ
	UGpoEhiaVvtH/s48qatScLBNqikOwqHHdk+H3cj1m5/qIH76HXBGgVZny0XfCtR6
	/w==
Received: (qmail 3706657 invoked from network); 28 Jan 2026 17:58:51 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Jan 2026 17:58:51 +0100
X-UD-Smtp-Session: l3s3148p1@4XWHp3VJKMsgAQnoAHyCAPmmylPb6eQR
Date: Wed, 28 Jan 2026 17:58:49 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Linus Walleij <linusw@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Dan Williams <dan.j.williams@intel.com>, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH 0/3] Revert "revocable: Revocable resource management"
Message-ID: <aXpAScyRUuI3bH13@shikoro>
References: <20260124170535.11756-1-johan@kernel.org>
 <DFX20SA67PF2.VONCFNDOZOZT@kernel.org>
 <2026012554-chatty-policy-42a1@gregkh>
 <aXdxDBXdyqLFfKKI@hovoldconsulting.com>
 <CAESzEGiA2DSp79pkjxBA5X-DWmSAAgyAF7usKn253jkGpYJMew@mail.gmail.com>
 <20260127235232.GS1134360@nvidia.com>
 <CAMRc=MfP1_fH91AVjerbnwVfhA0oqBKV+CTX0_1n32g1t-Pvuw@mail.gmail.com>
 <aXneX-aZofvuk8gl@ninjato>
 <20260128150538.GA1134360@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6cHdxSyimAu6pOEp"
Content-Disposition: inline
In-Reply-To: <20260128150538.GA1134360@nvidia.com>


--6cHdxSyimAu6pOEp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> I would just gently advise again that SRCU is not a pancea and should
> only be used if the read side sections are super performance
> critical. I'm not sure that describes I2C. rwsem is often a simpler
> and better choice.

You might be totally right. But in any case, we need to prepare the
subsystem first. That is where I am now. Next steps come after that.

> > [1] https://lkml.org/lkml/2021/1/20/999
>=20
> Yeah, this was brought up a couple drafts of possible options were
> exchanged already but nothing was really focused on and polished.
>=20
> It is a tricky problem to find a storage location for the lock and
> revoke so that the fops shim can access it while not disturbing the
> actual driver.

I can imagine. Thanks for the heads up, nice to see it was not
forgotten!


--6cHdxSyimAu6pOEp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAml6QEYACgkQFA3kzBSg
Kbbj0xAAkaDeXFCCHTU7NY0Rw3u+RaVU99ifjHelaJUW0iwsoWaNzeZCknyeVvE7
C22PQ7haovuKIFdXimwEwH33cQahCIoDYD3xYZfFFsqfFykG9Eo354Lav7/tLY0f
qN06wD+OBn6SBrMCAv2n0c+ubuayI4VWi7fRpoJ1e3m6QvOXxkIaEFNkK9GZE1Mt
2T/4B6WdIe+SuZohqZF5oSYZvtu7LdxZ2vs6KjKm9tBeEU5SFYzHdc0Aab+am4Kj
PmPsGSwr+c6K42ssFUl3lda2ngLJNDy/j2+cO4Ho5vV7k9aRAoK/92ZLuZjzk5Ql
fjvcgu2Kdti/2EdYC695S3K2xtwW3xYhhNHTRqrtjr78UWvPtv8noUdjYZCpgKNl
Ty7F7hTJRDh42tKDv/aeFUDOFjrwTpM0TcO8rJE7LTcoQTXnwx6kSYpmDCuU02R7
wu17xckgYdzpYOX0K6UGurXVdToxqLs0k1Jk1HES+4iAeC2p6k8EVXAjDHP6OUpL
amtQmzg8dxjW/jWxyY4nEUptcsTbXubIy04pfpwWhgOVILL7upRhFwmKYN+L5OYv
ivLQu74AwPzsKamas/nSYQ+GK4i2lFZ27vF93YmoPQ40VBtK5XA4i/ci9bXgBZEv
sACRNCVYDcxKbAa6u3EbX6EH6sU7vJsrXfUjwgl+CBi9y7ndlJY=
=XcM1
-----END PGP SIGNATURE-----

--6cHdxSyimAu6pOEp--
