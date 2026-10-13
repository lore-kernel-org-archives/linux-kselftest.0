Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871FE3B6346;
	Tue, 13 Oct 2026 22:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791928863; cv=none; b=I34IcUK5I25OGtAEGrQ2yfQeyhjgnPJl2QtDvAQjH4tv+lVGik6mHHvaCpA9mXp+5KSSMT+yhnk+4fAwN8EQ8siywAs+ndmgBgHp4hJhWpd0iU8MZATcujQYNIXZEeIKn/Pbkv3nKEr6t4ODHMe+tgqA4pwH2KeWe+KmHsvpPk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791928863; c=relaxed/simple;
	bh=Uoru0Ln8n0j+Y+jL/cT9q6fa660Z0a0KOaCogdOrZx0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r/xy0a1zPvzUFBNusIhG7xqiAV4uSoxwj3n6sPnnJHECE35RI4pHSbh3WKKv0tFobr5TjU3qNj1ercab7SW8uZvh7gRNWhz4PcwZfJpPcLtpbqMQs85+llApv7JVWV23qptaVNuvqFJHJDscsItkAsVJXfDF543zksT1RORDuFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VUiaUqTS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VUiaUqTS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F8511F00893;
	Tue, 13 Oct 2026 22:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791928859;
	bh=WIAG9ZPtK7rF48YI3/CRMR2k3XarZS/gUCEEGTrfjYM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VUiaUqTSTSEn1W7NEqXTzxLCq+sgnoSIY+gxuh+xNEc3cZPUHJKeuk7UuFbRNiUDj
	 XGoJiJiDB0GvvY2/A7WOhApLiHxFft0vlf32d0931wBDXhkrjeEQQLOKZZmbu4PaqA
	 TBCWc/vD03nn3EPoeHsH6DcKtCn5Tjjaq6aBrJrAueM8NolDssWotmgbEHLj404zyI
	 X3QrgUr+PbmZA0BsgAn3E0aoRBJC/H039Odk/TXlo6N/dEP+I9/Nb55EeuPfQqDAYj
	 zxU85M1UuqY10HUSbvxbxb7vBRjVWffh0EpzZYJgXGT+8Aum7dvKYKwJf4pOCg400A
	 ObDMj4QkS9UvQ==
Date: Tue, 13 Oct 2026 23:00:55 +0100
From: Mark Brown <broonie@kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Shuah Khan <shuah@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] selftests: kselftest_deps.sh: Support LLVM
Message-ID: <38d31a6b-b3d0-4b15-9b24-62d2bd6f9040@sirena.org.uk>
References: <20261013-kselftest-deps-llvm-v1-1-f2ee70ae1b79@kernel.org>
 <CAKwvOdmQkYy3xqTsumSxLdHpaXnt1Hb9g++DVmAYcx=cvjFBeg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3YSveUX7Riv2bkLN"
Content-Disposition: inline
In-Reply-To: <CAKwvOdmQkYy3xqTsumSxLdHpaXnt1Hb9g++DVmAYcx=cvjFBeg@mail.gmail.com>
X-Cookie: Some equipment shown is optional.


--3YSveUX7Riv2bkLN
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 02:07:28PM -0700, Nick Desaulniers wrote:
> On Tue, Oct 13, 2026 at 12:40=E2=80=AFPM Mark Brown <broonie@kernel.org> =
wrote:

> > +       clang_target[riscv]=3Driscv64-linux-gnu
> > +       clang_target[s390]=3Ds390x-linux-gnu
> > +       clang_target[x86]=3Dx86_64-linux-gnu

> ^ should this be either i386-linux-gnu or i686-linux-gnu, or does
> `-m32` get set somewhere?

Hrm, that'll just be a cut'n'paste from lib.mk which does not so far as
I can see set -m32 - it sets i386-linux-gnu for _i386.  Does that need a
fix too, or am I missing something with how it works?

--3YSveUX7Riv2bkLN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrOqhYACgkQJNaLcl1U
h9C5DAf/Y4e1g+HQlhEZEhFkcn/yKhMAkEaGzgVWKAVlxUMTADPEgvak+WTSILD6
ZZn8etaaj5gmB8g9RV8ES8nBAwBu5acl4d9v1ArjfPqVs4ftcqc7uAyI77G2hAVk
BGgWhsOVlZ9YBqMYqP1kt/lollE8Dk/fEx/nA50mRP+WZQ1pzHp848zaGO8ssRwj
9BK9ue9/VRg4R3SOmVPU+QC19xOwGWvqswJNzEDbFpmTyQ+SFEEKjbpARmy1ss3N
onDXHAgt7/0qg12MXqFsSrl9jFef31XILEfSGWm8n/3O5zznpUD0p5l03188VbiW
n/wyAwgLpYaYsj07Z0oGYe14XJn0Uw==
=uljT
-----END PGP SIGNATURE-----

--3YSveUX7Riv2bkLN--
