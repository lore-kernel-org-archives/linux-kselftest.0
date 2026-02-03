Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BACD392C48;
	Tue,  3 Feb 2026 09:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770109860; cv=none; b=GCbmLQLaP4BXXLB4T1/zpifyfXRCGQZ1hqQyuNZn7HnzRmpO/DUni4r0Z4r0YmTtZgrnIrZvSeTO5PIjtuvTaMttcwVnTCY1FOisBdb0mlrk4DrgjbmMYmoKcmK918RxTrEK8XFYww14E7lcVfOvoaywd5rx9AZ4wgBqeB0M77k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770109860; c=relaxed/simple;
	bh=LlBEaY/B0j9hTW3yp6PhoNQDNcJfMfJRCMziWK3voPI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k3VZYGH5bogwoL+OtYkZ0oTry8kMYYBCpz2/437mZtzMAwizzVOEGASPEZAuJUdsCNlW7wmGkCCOhAUJVJkDrN8meKZQrTu/94Dj7DdwnUN2dO9ZZpZMTd/pAmdR/1tFUPov51yGiSOTd4gDFroPdNDbLF69MYNEAZy2/ZnzqOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AKkZbvrF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AKkZbvrF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 750C0C116D0;
	Tue,  3 Feb 2026 09:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770109860;
	bh=LlBEaY/B0j9hTW3yp6PhoNQDNcJfMfJRCMziWK3voPI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AKkZbvrFGlkyF3SjquTxf2AxylwGIMeyjMAaHltGIHCHUur8gZkI7eI4CpLHAhSAo
	 64LbmIU7NqNC15I5jM9uoJjmyAr4Ze2EIF7NkhOuZiN/uqZxHClUbyy0djD6tSBGhw
	 +2Cfz9ZUn0tQuqGZhbRsgtwXJA0i1tCIxbnO5U5NK/h1m0K5eEVCuItYEGlCeXTs1W
	 XYffYRHngcNeA9/ZgI6Rn/C6rx9JU9ekXeoUhdj1uwSPb83S9b3VBnuMSpIcl8Nw4a
	 /bi9hAPR8ckrYPbz4zE1CkupV1SXttFPKYQ8p44MC39P7YRIJfA6NVnnlWfK4NLlS0
	 hdupJ1Y8/mimQ==
Date: Tue, 3 Feb 2026 10:10:57 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Johan Hovold <johan@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Simona Vetter <simona.vetter@ffwll.ch>, 
	Dan Williams <dan.j.williams@intel.com>, linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>, 
	maarten.lankhorst@linux.intel.com, tzimmermann@suse.de
Subject: Re: [PATCH 0/3] Revert "revocable: Revocable resource management"
Message-ID: <20260203-lyrical-taipan-of-enhancement-df5615@houat>
References: <20260124170535.11756-1-johan@kernel.org>
 <DFX20SA67PF2.VONCFNDOZOZT@kernel.org>
 <2026012554-chatty-policy-42a1@gregkh>
 <aXdxDBXdyqLFfKKI@hovoldconsulting.com>
 <CAESzEGiA2DSp79pkjxBA5X-DWmSAAgyAF7usKn253jkGpYJMew@mail.gmail.com>
 <20260127235232.GS1134360@nvidia.com>
 <20260129010822.GA3310904@killaraus>
 <DG1FF2VY54AO.2Q3YHA4WNLV5C@kernel.org>
 <20260130091049.GH3374091@killaraus>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="udewh34oifiokydq"
Content-Disposition: inline
In-Reply-To: <20260130091049.GH3374091@killaraus>


--udewh34oifiokydq
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 0/3] Revert "revocable: Revocable resource management"
MIME-Version: 1.0

Hi,

On Fri, Jan 30, 2026 at 11:10:49AM +0200, Laurent Pinchart wrote:
> On Thu, Jan 29, 2026 at 11:29:03PM +0100, Danilo Krummrich wrote:
> > (Cc: Maxime, Thomas, Maarten)
> >=20
> > On Thu Jan 29, 2026 at 2:08 AM CET, Laurent Pinchart wrote:
> > > That's what I've been advocating for. The best way to ensure that dri=
ver
> > > code will not accessed data freed at .remove() time is to prevent the
> > > code to run at all.
> >=20
> > With this we are in full agreement, I think that'd be best too. But, I =
also
> > think that sometimes this isn't possible. For instance, DRM has such a =
case with
> > atomic mode setting.
>=20
> I don't see why it would be impossible there.

I'm not quite sure what you have in mind there, but DRM always allowed
the DRM driver to stick around longer than its device to accomodate the
fact that userspace might still have an open fd to it.

If userspace has an open fd, it can still call ioctl so preventing to
run any code is going to be difficult.

Maxime

--udewh34oifiokydq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaYG7oAAKCRAnX84Zoj2+
dhQ+AX9t5YGtdLoSB+e30KEQ2ZIVpyqXJO3hiPBr8vM6IhmH0KLv6ZXX8wx4yL9j
PMJjMNcBf3daV26VIEGZqSHQQvlG3R55Pw+pi42DgcP53HQStDBImAGErY1bXEZj
8gxa/xvpUg==
=HDDn
-----END PGP SIGNATURE-----

--udewh34oifiokydq--
