Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794744781;
	b=DdjrOuDywrjza3WbAPsekdWzltm1ArzGIcK9XCpJaiNnBKHHtudYuiqvD3drj5ySkGbN
	 fA5OXh10s0IJXgX+Cdcglbjto668M7rKutsuVwJLL1Y3chxmpV4/M1F5P5cHtk0jMz2RZ
	 wqN/eRyYVAe3TV4+YdbeNlamZRgzTxEYzyAr4A10wx595kH8yuc2lBctI7Snj86HWJeVI
	 L5YCFiuftriu/Qr0raKkfz3RqwCVuXF8jGxOR07V9K3scJq7J+/b5WJ0AR84vKIfZaFVN
	 DvYGbHvLNlaMtTPAO4QYZcC3/xM8WJAnIGa9f3xiLDWI6LidAocc4RWgzHLGEZ5A09w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794744781;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=6nAdsUOd3sfLiZ5il0Rjkey++jxOa1KVm/OVFeybvpI=;
	b=QS98BFZbKPQn1BJXaTQxmb+vJ5xssc/6dV01Cze9oDl/kewDoBq6JPKi8QuP0s7NC8Yc
	 yAHBzm3R0zbiIC/jvSr6yVSuWWUGnUDqlYs+ZqiK08u0hsMA2nZttfti030SANKA+6CI0
	 oqd0c7gFS277KT7nfgWNzC3Jqr51E3d7rV5QNqUJGd11u3m2Jzlw/x7HCHLieUt6mc5PR
	 nWTV5NlPjH/Ydrki6IYLIYD8xJwyvV3XilVtCbdbTFu+asoj8RaYMIG5iCoonqa57Ov1y
	 bY6alaUk9ykwXVUEw43wsagVIW2ePvLjdAw7RiKKL3MzR4Egg0l06ycsyXp8j1TegxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Mo2xO+ZY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E168C606A31E
	for <linux-kselftest@vger.kernel.org>; Sun, 15 Nov 2026 12:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Mo2xO+ZY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6322F1F000C4;
	Sun, 15 Nov 2026 12:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794744780;
	bh=6nAdsUOd3sfLiZ5il0Rjkey++jxOa1KVm/OVFeybvpI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Mo2xO+ZYdxrOq1t6MQZL84cjQftKeJE/GIENXYn0PQU8insGkFBGT2ua4+7ydBMOn
	 YV6tZB4gCbby9XENAeB0SHLW7dkIk8EpeD0Zsk2RRjKdCPlMoGfyeNRXsKP9xNun5E
	 dAyU2h2+QNH5AxERDAr1eUTPneTOESDp9yh7NRlUJmWZqeGjIcrjdkYUZGHcnrYbjV
	 rYUhu2Z+fMschPXLeay3giGQLt+9+cobo0UxJ+xqqw8Pwr4qwn1SoT2EgS820P//Lh
	 dLhjVRmcmYe5w+j+sVPNY3zfHFZKW5G34HcXxCXrqY/4EQiJNipCMO92kkhV8fscRh
	 cpXugzJH7QIkg==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id E5F0E336AA00; Sun, 15 Nov 2026 12:12:57 +0000 (GMT)
Date: Sun, 15 Nov 2026 12:12:57 +0000
From: Mark Brown <broonie@kernel.org>
To: Long Wei <longwei27@huawei.com>
Cc: catalin.marinas@arm.com, will@kernel.org, shuah@kernel.org,
	mark.rutland@arm.com, kevin.brodsky@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, hewenliang4@huawei.com
Subject: Re: [PATCH] selftests/arm64: signal: fix inverted feature mask in
 diagnostics
Message-ID: <d7ad4591-ace3-4c56-80b5-7130b9954051@sirena.org.uk>
References: <20261114081013.964933-1-longwei27@huawei.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BTX7ICWH0mABSo9W"
Content-Disposition: inline
In-Reply-To: <20261114081013.964933-1-longwei27@huawei.com>
X-Cookie: A watched clock never boils.


--BTX7ICWH0mABSo9W
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 04:10:13PM +0800, Long Wei wrote:
> When a testcase is skipped because an incompatible CPU feature is
> present, test_init() reports the feature set with:
>=20
>         feats_incompatible & ~feats_supported
>=20
> That is the set of incompatible features which are *not* supported,
> i.e. always empty, instead of the incompatible features which actually
> triggered the skip.  As a result the diagnostic prints an empty list and
> gives no hint about why the test was skipped.

Looks like a cut'n'paste error.

Reviewed-by: Mark Brown <broonie@kernel.org>

--BTX7ICWH0mABSo9W
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCavmhyQAKCRAv73Ows9A4
iUjQAP9HxqvWC55RPim1gX0a2Sr/cSbCgGYMKfepsoaZAyZlCAD/Z7ytZn0cKXRD
vHVjI3eoYdcb4IGW2zHgB0nH+HBA7Qw=
=Tm+H
-----END PGP SIGNATURE-----

--BTX7ICWH0mABSo9W--
