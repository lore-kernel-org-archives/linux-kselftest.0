Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D3D36728B;
	Wed, 12 Aug 2026 19:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786562100; cv=none; b=ELkKOgj8Pt+t9/gdeLkBv0Ru7/eittHUfQqz03h6b/17swzzSTa9fhTL6VAv9vEMUmf/4sBFFRqlZRoVZq9Tc5LoujSW7sCp2fDffGnLo4e0Nl6skZWeW/038GXK5JAlTBOnRijXhTFC9KbqoS7sjP7UfeCegQeZXq5MiH41JSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786562100; c=relaxed/simple;
	bh=ru9oC3nwyTg2TgsRuyECTz6ojuCQP5LonZfYK97TW4A=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=X6th3ZbfZfrm3NvkrQy9he2xl2jpDnLjuqtosrms5Gvbp9IBLiBN2azGmH4xeJXVslwHq/oKgYNIOwYeIbHH07B0ztpObRLuItajuXHU1iNy4NoxepHH5PRnil9fMPfBLyu0YDbpP8r/d6p+K95D/CJDqzFcmxs7opZ+J6jvptA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hK6PpDUB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hK6PpDUB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E9EA1F000E9;
	Wed, 12 Aug 2026 19:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786562098;
	bh=GpTkSREI905u6GgG9uqjbVS/FGl/Og7KLI14zywTWAM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=hK6PpDUBrfZ1E7iOi1cvTu2dqLAgUJDnKZ9bF27BdTkD5GRb+Qt5DXUOMzLBxQPKs
	 16NxE9bgNbt1JF127jCJaUXOH9nFNwUH0GE4Jq3MXQ7JIvmWnz7e/3WxLB/bYZHtLj
	 bL45woVkinKc0YpYq6Rdy85SlTXjVOClo2ROTjugR17sC2e5X+eQOsxEgvnByYatCx
	 fISTopWwNpqbJ6xPMIINpa7j9kGwyWvo61HRfOb5xDTmG7dKL+mUgdF4YH8LYaD0u3
	 1sMLZgQON9WvNNjiB7v8BzZJNc2AMWCYTs0uC6WZXojSTJVaLcfUM3fECNqbKqE2DS
	 jravsNUH3fPTg==
Message-ID: <4fab5e75748e8d2d274d65688f021fb6c9b37a12.camel@kernel.org>
Subject: Re: [PATCH] lib/tests: add KUnit tests for errseq
From: Jeff Layton <jlayton@kernel.org>
To: maarseveent@gmail.com, Andrew Morton <akpm@linux-foundation.org>
Cc: David Gow <david@davidgow.net>, kunit-dev@googlegroups.com, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Wed, 12 Aug 2026 15:14:56 -0400
In-Reply-To: <20260812-errseq-kunit-v1-1-312be4c3aa0d@gmail.com>
References: <20260812-errseq-kunit-v1-1-312be4c3aa0d@gmail.com>
Autocrypt: addr=jlayton@kernel.org; prefer-encrypt=mutual;
 keydata=mQINBE6V0TwBEADXhJg7s8wFDwBMEvn0qyhAnzFLTOCHooMZyx7XO7dAiIhDSi7G1NPxw
 n8jdFUQMCR/GlpozMFlSFiZXiObE7sef9rTtM68ukUyZM4pJ9l0KjQNgDJ6Fr342Htkjxu/kFV1Wv
 egyjnSsFt7EGoDjdKqr1TS9syJYFjagYtvWk/UfHlW09X+jOh4vYtfX7iYSx/NfqV3W1D7EDi0PqV
 T2h6v8i8YqsATFPwO4nuiTmL6I40ZofxVd+9wdRI4Db8yUNA4ZSP2nqLcLtFjClYRBoJvRWvsv4lm
 0OX6MYPtv76hka8lW4mnRmZqqx3UtfHX/hF/zH24Gj7A6sYKYLCU3YrI2Ogiu7/ksKcl7goQjpvtV
 YrOOI5VGLHge0awt7bhMCTM9KAfPc+xL/ZxAMVWd3NCk5SamL2cE99UWgtvNOIYU8m6EjTLhsj8sn
 VluJH0/RcxEeFbnSaswVChNSGa7mXJrTR22lRL6ZPjdMgS2Km90haWPRc8Wolcz07Y2se0xpGVLEQ
 cDEsvv5IMmeMe1/qLZ6NaVkNuL3WOXvxaVT9USW1+/SGipO2IpKJjeDZfehlB/kpfF24+RrK+seQf
 CBYyUE8QJpvTZyfUHNYldXlrjO6n5MdOempLqWpfOmcGkwnyNRBR46g/jf8KnPRwXs509yAqDB6sE
 LZH+yWr9LQZEwARAQABtCVKZWZmIExheXRvbiA8amxheXRvbkBwb29jaGllcmVkcy5uZXQ+iQI7BB
 MBAgAlAhsDBgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIXgAUCTpXWPAIZAQAKCRAADmhBGVaCFc65D/4
 gBLNMHopQYgG/9RIM3kgFCCQV0pLv0hcg1cjr+bPI5f1PzJoOVi9s0wBDHwp8+vtHgYhM54yt43uI
 7Htij0RHFL5eFqoVT4TSfAg2qlvNemJEOY0e4daljjmZM7UtmpGs9NN0r9r50W82eb5Kw5bc/r0km
 R/arUS2st+ecRsCnwAOj6HiURwIgfDMHGPtSkoPpu3DDp/cjcYUg3HaOJuTjtGHFH963B+f+hyQ2B
 rQZBBE76ErgTDJ2Db9Ey0kw7VEZ4I2nnVUY9B5dE2pJFVO5HJBMp30fUGKvwaKqYCU2iAKxdmJXRI
 ONb7dSde8LqZahuunPDMZyMA5+mkQl7kpIpR6kVDIiqmxzRuPeiMP7O2FCUlS2DnJnRVrHmCljLkZ
 Wf7ZUA22wJpepBligemtSRSbqCyZ3B48zJ8g5B8xLEntPo/NknSJaYRvfEQqGxgk5kkNWMIMDkfQO
 lDSXZvoxqU9wFH/9jTv1/6p8dHeGM0BsbBLMqQaqnWiVt5mG92E1zkOW69LnoozE6Le+12DsNW7Rj
 iR5K+27MObjXEYIW7FIvNN/TQ6U1EOsdxwB8o//Yfc3p2QqPr5uS93SDDan5ehH59BnHpguTc27Xi
 QQZ9EGiieCUx6Zh2ze3X2UW9YNzE15uKwkkuEIj60NvQRmEDfweYfOfPVOueC+iFifbQgSmVmZiBM
 YXl0b24gPGpsYXl0b25AcmVkaGF0LmNvbT6JAjgEEwECACIFAk6V0q0CGwMGCwkIBwMCBhUIAgkKC
 wQWAgMBAh4BAheAAAoJEAAOaEEZVoIViKUQALpvsacTMWWOd7SlPFzIYy2/fjvKlfB/Xs4YdNcf9q
 LqF+lk2RBUHdR/dGwZpvw/OLmnZ8TryDo2zXVJNWEEUFNc7wQpl3i78r6UU/GUY/RQmOgPhs3epQC
 3PMJj4xFx+VuVcf/MXgDDdBUHaCTT793hyBeDbQuciARDJAW24Q1RCmjcwWIV/pgrlFa4lAXsmhoa
 c8UPc82Ijrs6ivlTweFf16VBc4nSLX5FB3ls7S5noRhm5/Zsd4PGPgIHgCZcPgkAnU1S/A/rSqf3F
 LpU+CbVBDvlVAnOq9gfNF+QiTlOHdZVIe4gEYAU3CUjbleywQqV02BKxPVM0C5/oVjMVx3bri75n1
 TkBYGmqAXy9usCkHIsG5CBHmphv9MHmqMZQVsxvCzfnI5IO1+7MoloeeW/lxuyd0pU88dZsV/riHw
 87i2GJUJtVlMl5IGBNFpqoNUoqmvRfEMeXhy/kUX4Xc03I1coZIgmwLmCSXwx9MaCPFzV/dOOrju2
 xjO+2sYyB5BNtxRqUEyXglpujFZqJxxau7E0eXoYgoY9gtFGsspzFkVNntamVXEWVVgzJJr/EWW0y
 +jNd54MfPRqH+eCGuqlnNLktSAVz1MvVRY1dxUltSlDZT7P2bUoMorIPu8p7ZCg9dyX1+9T6Muc5d
 Hxf/BBP/ir+3e8JTFQBFOiLNdFtB9KZWZmIExheXRvbiA8amxheXRvbkBzYW1iYS5vcmc+iQI4BBM
 BAgAiBQJOldK9AhsDBgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRAADmhBGVaCFWgWD/0ZRi4h
 N9FK2BdQs9RwNnFZUr7JidAWfCrs37XrA/56olQl3ojn0fQtrP4DbTmCuh0SfMijB24psy1GnkPep
 naQ6VRf7Dxg/Y8muZELSOtsv2CKt3/02J1BBitrkkqmHyni5fLLYYg6fub0T/8Kwo1qGPdu1hx2BQ
 RERYtQ/S5d/T0cACdlzi6w8rs5f09hU9Tu4qV1JLKmBTgUWKN969HPRkxiojLQziHVyM/weR5Reu6
 FZVNuVBGqBD+sfk/c98VJHjsQhYJijcsmgMb1NohAzwrBKcSGKOWJToGEO/1RkIN8tqGnYNp2G+aR
 685D0chgTl1WzPRM6mFG1+n2b2RR95DxumKVpwBwdLPoCkI24JkeDJ7lXSe3uFWISstFGt0HL8Eew
 P8RuGC8s5h7Ct91HMNQTbjgA+Vi1foWUVXpEintAKgoywaIDlJfTZIl6Ew8ETN/7DLy8bXYgq0Xzh
 aKg3CnOUuGQV5/nl4OAX/3jocT5Cz/OtAiNYj5mLPeL5z2ZszjoCAH6caqsF2oLyAnLqRgDgR+wTQ
 T6gMhr2IRsl+cp8gPHBwQ4uZMb+X00c/Amm9VfviT+BI7B66cnC7Zv6Gvmtu2rEjWDGWPqUgccB7h
 dMKnKDthkA227/82tYoFiFMb/NwtgGrn5n2vwJyKN6SEoygGrNt0SI84y6hEVbQlSmVmZiBMYXl0b
 24gPGpsYXl0b25AcHJpbWFyeWRhdGEuY29tPokCOQQTAQIAIwUCU4xmKQIbAwcLCQgHAwIBBhUIAg
 kKCwQWAgMBAh4BAheAAAoJEAAOaEEZVoIV1H0P/j4OUTwFd7BBbpoSp695qb6HqCzWMuExsp8nZjr
 uymMaeZbGr3OWMNEXRI1FWNHMtcMHWLP/RaDqCJil28proO+PQ/yPhsr2QqJcW4nr91tBrv/MqItu
 AXLYlsgXqp4BxLP67bzRJ1Bd2x0bWXurpEXY//VBOLnODqThGEcL7jouwjmnRh9FTKZfBDpFRaEfD
 FOXIfAkMKBa/c9TQwRpx2DPsl3eFWVCNuNGKeGsirLqCxUg5kWTxEorROppz9oU4HPicL6rRH22Ce
 6nOAON2vHvhkUuO3GbffhrcsPD4DaYup4ic+DxWm+DaSSRJ+e1yJvwi6NmQ9P9UAuLG93S2MdNNbo
 sZ9P8k2mTOVKMc+GooI9Ve/vH8unwitwo7ORMVXhJeU6Q0X7zf3SjwDq2lBhn1DSuTsn2DbsNTiDv
 qrAaCvbsTsw+SZRwF85eG67eAwouYk+dnKmp1q57LDKMyzysij2oDKbcBlwB/TeX16p8+LxECv51a
 sjS9TInnipssssUDrHIvoTTXWcz7Y5wIngxDFwT8rPY3EggzLGfK5Zx2Q5S/N0FfmADmKknG/D8qG
 IcJE574D956tiUDKN4I+/g125ORR1v7bP+OIaayAvq17RP+qcAqkxc0x8iCYVCYDouDyNvWPGRhbL
 UO7mlBpjW9jK9e2fvZY9iw3QzIPGKtClKZWZmIExheXRvbiA8amVmZi5sYXl0b25AcHJpbWFyeWRh
 dGEuY29tPokCOQQTAQIAIwUCU4xmUAIbAwcLCQgHAwIBBhUIAgkKCwQWAgMBAh4BAheAAAoJEAAOa
 EEZVoIVzJoQALFCS6n/FHQS+hIzHIb56JbokhK0AFqoLVzLKzrnaeXhE5isWcVg0eoV2oTScIwUSU
 apy94if69tnUo4Q7YNt8/6yFM6hwZAxFjOXR0ciGE3Q+Z1zi49Ox51yjGMQGxlakV9ep4sV/d5a50
 M+LFTmYSAFp6HY23JN9PkjVJC4PUv5DYRbOZ6Y1+TfXKBAewMVqtwT1Y+LPlfmI8dbbbuUX/kKZ5d
 dhV2736fgyfpslvJKYl0YifUOVy4D1G/oSycyHkJG78OvX4JKcf2kKzVvg7/Rnv+AueCfFQ6nGwPn
 0P91I7TEOC4XfZ6a1K3uTp4fPPs1Wn75X7K8lzJP/p8lme40uqwAyBjk+IA5VGd+CVRiyJTpGZwA0
 jwSYLyXboX+Dqm9pSYzmC9+/AE7lIgpWj+3iNisp1SWtHc4pdtQ5EU2SEz8yKvDbD0lNDbv4ljI7e
 flPsvN6vOrxz24mCliEco5DwhpaaSnzWnbAPXhQDWb/lUgs/JNk8dtwmvWnqCwRqElMLVisAbJmC0
 BhZ/Ab4sph3EaiZfdXKhiQqSGdK4La3OTJOJYZphPdGgnkvDV9Pl1QZ0ijXQrVIy3zd6VCNaKYq7B
 AKidn5g/2Q8oio9Tf4XfdZ9dtwcB+bwDJFgvvDYaZ5bI3ln4V3EyW5i2NfXazz/GA/I/ZtbsigCFc
 8ftCBKZWZmIExheXRvbiA8amxheXRvbkBrZXJuZWwub3JnPokCOAQTAQIAIgUCWe8u6AIbAwYLCQg
 HAwIGFQgCCQoLBBYCAwECHgECF4AACgkQAA5oQRlWghUuCg/+Lb/xGxZD2Q1oJVAE37uW308UpVSD
 2tAMJUvFTdDbfe3zKlPDTuVsyNsALBGclPLagJ5ZTP+Vp2irAN9uwBuacBOTtmOdz4ZN2tdvNgozz
 uxp4CHBDVzAslUi2idy+xpsp47DWPxYFIRP3M8QG/aNW052LaPc0cedYxp8+9eiVUNpxF4SiU4i9J
 DfX/sn9XcfoVZIxMpCRE750zvJvcCUz9HojsrMQ1NFc7MFT1z3MOW2/RlzPcog7xvR5ENPH19ojRD
 CHqumUHRry+RF0lH00clzX/W8OrQJZtoBPXv9ahka/Vp7kEulcBJr1cH5Wz/WprhsIM7U9pse1f1g
 Yy9YbXtWctUz8uvDR7shsQxAhX3qO7DilMtuGo1v97I/Kx4gXQ52syh/w6EBny71CZrOgD6kJwPVV
 AaM1LRC28muq91WCFhs/nzHozpbzcheyGtMUI2Ao4K6mnY+3zIuXPygZMFr9KXE6fF7HzKxKuZMJO
 aEZCiDOq0anx6FmOzs5E6Jqdpo/mtI8beK+BE7Va6ni7YrQlnT0i3vaTVMTiCThbqsB20VrbMjlhp
 f8lfK1XVNbRq/R7GZ9zHESlsa35ha60yd/j3pu5hT2xyy8krV8vGhHvnJ1XRMJBAB/UYb6FyC7S+m
 QZIQXVeAA+smfTT0tDrisj1U5x6ZB9b3nBg65kc=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2026-08-12 at 20:55 +0200, Thomas Maarseveen via B4 Relay
wrote:
> From: Thomas Maarseveen <maarseveent@gmail.com>
>=20
> The errseq_t infrastructure (lib/errseq.c) underpins writeback error
> reporting but has no regression tests. Its semantics are subtle enough
> to have needed fixing before: commit b4678df184b3 ("errseq: Always
> report a writeback error once") changed how unseen errors reach new
> samplers.
>=20
> Add a KUnit suite covering the documented single-threaded semantics:
>=20
>  - a zeroed errseq_t is the "no error yet" epoch
>  - errors are recorded, overwrite one another, and both ends of the
>    valid errno range round-trip exactly
>  - an error nobody has seen samples as zero, so a check against a
>    fresh sample still reports it
>  - errseq_check_and_advance() reports a given error exactly once per
>    cursor and leaves the cursor in place when nothing has changed
>  - once an error has been seen, a fresh sample is current and a check
>    against it reports nothing
>  - the same error recorded again after being seen is reported again,
>    even to a cursor that consumed the first occurrence while another
>    cursor marked the repeat as seen
>  - independent cursors each observe each error
>=20
> The lockless behaviour of errseq_t under concurrent updates and the
> WARN path for invalid error values are deliberately out of scope.
>=20
> Tested with ./tools/testing/kunit/kunit.py run, with a kunitconfig
> enabling CONFIG_KUNIT=3Dy and CONFIG_ERRSEQ_KUNIT_TEST=3Dy; all 13 tests
> pass under ARCH=3Dum.
>=20
> Signed-off-by: Thomas Maarseveen <maarseveent@gmail.com>
> ---
> Single patch adding the first KUnit suite for lib/errseq.c.
> (Cover not sent for a single-patch series; trailers below drive
> the recipients.)
> ---
>  MAINTAINERS              |   1 +
>  lib/Kconfig.debug        |  15 +++
>  lib/tests/Makefile       |   1 +
>  lib/tests/errseq_kunit.c | 237 +++++++++++++++++++++++++++++++++++++++++=
++++++
>  4 files changed, 254 insertions(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8014b9f8253edf15231df215d1b14063a54a55ec..70de54372c4f8f12b2431e693=
cb3b0b5ec5fdfc9 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -9624,6 +9624,7 @@ M:	Jeff Layton <jlayton@kernel.org>
>  S:	Maintained
>  F:	include/linux/errseq.h
>  F:	lib/errseq.c
> +F:	lib/tests/errseq_kunit.c
> =20
>  ESD CAN NETWORK DRIVERS
>  M:	Stefan M=C3=A4tje <stefan.maetje@esd.eu>
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index 1244dcac2294ad99fda37fa6767c9e76f16a4d14..3f1a7103328678926dd826203=
49957fdede32ee4 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -2826,6 +2826,21 @@ config SYSCTL_KUNIT_TEST
> =20
>  	  If unsure, say N.
> =20
> +config ERRSEQ_KUNIT_TEST
> +	tristate "KUnit test for errseq" if !KUNIT_ALL_TESTS
> +	depends on KUNIT
> +	default KUNIT_ALL_TESTS
> +	help
> +	  This builds the errseq KUnit test suite.
> +	  It tests the documented semantics of the errseq_t error-tracking
> +	  infrastructure (lib/errseq.c), which underpins writeback error
> +	  reporting.
> +
> +	  For more information on KUnit and unit tests in general please refer
> +	  to the KUnit documentation in Documentation/dev-tools/kunit/.
> +
> +	  If unsure, say N.
> +
>  config KFIFO_KUNIT_TEST
>  	tristate "KUnit Test for the generic kernel FIFO implementation" if !KU=
NIT_ALL_TESTS
>  	depends on KUNIT
> diff --git a/lib/tests/Makefile b/lib/tests/Makefile
> index 4ead57602eac468e1b9b8148593dc8c41ddc5779..a1e69b2c4318ae03f7834ba41=
414caf986997f02 100644
> --- a/lib/tests/Makefile
> +++ b/lib/tests/Makefile
> @@ -13,6 +13,7 @@ obj-$(CONFIG_BLACKHOLE_DEV_KUNIT_TEST) +=3D blackhole_d=
ev_kunit.o
>  obj-$(CONFIG_CHECKSUM_KUNIT) +=3D checksum_kunit.o
>  obj-$(CONFIG_CMDLINE_KUNIT_TEST) +=3D cmdline_kunit.o
>  obj-$(CONFIG_CPUMASK_KUNIT_TEST) +=3D cpumask_kunit.o
> +obj-$(CONFIG_ERRSEQ_KUNIT_TEST) +=3D errseq_kunit.o
>  obj-$(CONFIG_FFS_KUNIT_TEST) +=3D ffs_kunit.o
>  CFLAGS_fortify_kunit.o +=3D $(call cc-disable-warning, unsequenced)
>  CFLAGS_fortify_kunit.o +=3D $(call cc-disable-warning, stringop-overread=
)
> diff --git a/lib/tests/errseq_kunit.c b/lib/tests/errseq_kunit.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..8f39ebc4a2488e564efe21688=
3008b0d96a75fe6
> --- /dev/null
> +++ b/lib/tests/errseq_kunit.c
> @@ -0,0 +1,237 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * KUnit tests for the errseq_t error-tracking infrastructure.
> + *
> + * These exercise the documented single-threaded semantics of the errseq
> + * API (see Documentation/core-api/errseq.rst and lib/errseq.c): error
> + * recording and overwriting, the "seen" handoff between errseq_sample()
> + * and errseq_check_and_advance(), and the re-reporting of an error that
> + * is recorded again after it has been seen.
> + *
> + * The lockless properties of errseq_t under concurrent updates are
> + * outside the scope of these deterministic tests, as is the WARN path
> + * for invalid error values.
> + */
> +#include <kunit/test.h>
> +
> +#include <linux/err.h>
> +#include <linux/errno.h>
> +#include <linux/errseq.h>
> +
> +/*
> + * A zeroed errseq_t is the "no error has ever occurred" epoch: it
> + * samples as zero and no check against it reports anything.
> + */
> +static void errseq_test_zero_epoch_reports_no_error(struct kunit *test)
> +{
> +	errseq_t eseq =3D 0;
> +	errseq_t since =3D 0;
> +
> +	KUNIT_EXPECT_EQ(test, errseq_sample(&eseq), 0);
> +	KUNIT_EXPECT_EQ(test, errseq_check(&eseq, 0), 0);
> +	KUNIT_EXPECT_EQ(test, errseq_check_and_advance(&eseq, &since), 0);
> +	KUNIT_EXPECT_EQ(test, since, 0);
> +}
> +
> +static void errseq_test_set_records_error(struct kunit *test)
> +{
> +	errseq_t eseq =3D 0;
> +
> +	/* errseq_set() returns the previous value; the epoch is zero. */
> +	KUNIT_EXPECT_EQ(test, errseq_set(&eseq, -EIO), 0);
> +	KUNIT_EXPECT_EQ(test, errseq_check(&eseq, 0), -EIO);
> +}
> +
> +/* Any error set always overwrites an existing error. */
> +static void errseq_test_set_overwrites_error(struct kunit *test)
> +{
> +	errseq_t eseq =3D 0;
> +
> +	errseq_set(&eseq, -EIO);
> +	errseq_set(&eseq, -ENOSPC);
> +	KUNIT_EXPECT_EQ(test, errseq_check(&eseq, 0), -ENOSPC);
> +}
> +
> +/* Both ends of the valid error range are recorded exactly. */
> +static void errseq_test_errno_range_extremes(struct kunit *test)
> +{
> +	errseq_t lo =3D 0;
> +	errseq_t hi =3D 0;
> +
> +	errseq_set(&lo, -1);
> +	KUNIT_EXPECT_EQ(test, errseq_check(&lo, 0), -1);
> +
> +	errseq_set(&hi, -MAX_ERRNO);
> +	KUNIT_EXPECT_EQ(test, errseq_check(&hi, 0), -MAX_ERRNO);
> +}
> +
> +/*
> + * An error nobody has seen yet samples as zero, so that a check against
> + * the sample still reports it (see commit b4678df184b3 ("errseq: Always
> + * report a writeback error once")).
> + */
> +static void errseq_test_sample_of_unseen_error_is_zero(struct kunit *tes=
t)
> +{
> +	errseq_t eseq =3D 0;
> +
> +	errseq_set(&eseq, -EIO);
> +	KUNIT_EXPECT_EQ(test, errseq_sample(&eseq), 0);
> +}
> +
> +static void errseq_test_new_sampler_sees_unseen_error(struct kunit *test=
)
> +{
> +	errseq_t eseq =3D 0;
> +	errseq_t since;
> +
> +	errseq_set(&eseq, -EIO);
> +	since =3D errseq_sample(&eseq);
> +	KUNIT_EXPECT_EQ(test, errseq_check(&eseq, since), -EIO);
> +}
> +
> +/* A given error is reported exactly once per advancing cursor. */
> +static void errseq_test_check_and_advance_reports_once(struct kunit *tes=
t)
> +{
> +	errseq_t eseq =3D 0;
> +	errseq_t since =3D errseq_sample(&eseq);
> +
> +	errseq_set(&eseq, -EIO);
> +	KUNIT_EXPECT_EQ(test, errseq_check_and_advance(&eseq, &since), -EIO);
> +	KUNIT_EXPECT_EQ(test, errseq_check_and_advance(&eseq, &since), 0);
> +}
> +
> +/*
> + * Once an error has been seen, a fresh sample is non-zero and checking
> + * against it reports nothing: handled errors do not reach new samplers.
> + */
> +static void errseq_test_sample_after_seen_is_current(struct kunit *test)
> +{
> +	errseq_t eseq =3D 0;
> +	errseq_t since =3D 0;
> +	errseq_t sample;
> +
> +	errseq_set(&eseq, -EIO);
> +	KUNIT_EXPECT_EQ(test, errseq_check_and_advance(&eseq, &since), -EIO);
> +
> +	sample =3D errseq_sample(&eseq);
> +	KUNIT_EXPECT_NE(test, sample, 0);
> +	KUNIT_EXPECT_EQ(test, errseq_check(&eseq, sample), 0);
> +}
> +
> +static void errseq_test_new_error_after_advance(struct kunit *test)
> +{
> +	errseq_t eseq =3D 0;
> +	errseq_t since =3D 0;
> +
> +	errseq_set(&eseq, -EIO);
> +	KUNIT_EXPECT_EQ(test, errseq_check_and_advance(&eseq, &since), -EIO);
> +
> +	errseq_set(&eseq, -ENOSPC);
> +	KUNIT_EXPECT_EQ(test, errseq_check_and_advance(&eseq, &since), -ENOSPC)=
;
> +	KUNIT_EXPECT_EQ(test, errseq_check_and_advance(&eseq, &since), 0);
> +}
> +
> +/*
> + * Recording the same error again after it has been seen must bump the
> + * sequence, so cursors that consumed the first occurrence see the
> + * second one too.
> + */
> +static void errseq_test_same_error_reported_again_after_seen(struct kuni=
t *test)
> +{
> +	errseq_t eseq =3D 0;
> +	errseq_t since =3D 0;
> +	errseq_t seen_cursor;
> +
> +	errseq_set(&eseq, -EIO);
> +	KUNIT_EXPECT_EQ(test, errseq_check_and_advance(&eseq, &since), -EIO);
> +
> +	seen_cursor =3D since;
> +	errseq_set(&eseq, -EIO);
> +	KUNIT_EXPECT_EQ(test, errseq_check(&eseq, since), -EIO);
> +	KUNIT_EXPECT_EQ(test, errseq_check_and_advance(&eseq, &since), -EIO);
> +	/* The repeat must advance the sequence, not just re-toggle "seen". */
> +	KUNIT_EXPECT_NE(test, since, seen_cursor);
> +}
> +
> +/*
> + * A cursor that consumed an error must still observe a repeat of that
> + * error even when another cursor has already marked the repeat seen:
> + * recording over a seen value must advance the sequence.
> + */
> +static void errseq_test_repeat_error_visible_to_all_cursors(struct kunit=
 *test)
> +{
> +	errseq_t eseq =3D 0;
> +	errseq_t cursor_a =3D 0;
> +	errseq_t cursor_b =3D 0;
> +
> +	errseq_set(&eseq, -EIO);
> +	KUNIT_EXPECT_EQ(test, errseq_check_and_advance(&eseq, &cursor_a), -EIO)=
;
> +
> +	errseq_set(&eseq, -EIO);
> +	KUNIT_EXPECT_EQ(test, errseq_check_and_advance(&eseq, &cursor_b), -EIO)=
;
> +
> +	KUNIT_EXPECT_EQ(test, errseq_check(&eseq, cursor_a), -EIO);
> +	KUNIT_EXPECT_EQ(test, errseq_check_and_advance(&eseq, &cursor_a), -EIO)=
;
> +	KUNIT_EXPECT_EQ(test, errseq_check_and_advance(&eseq, &cursor_a), 0);
> +}
> +
> +/* An advance with no new error reports nothing and leaves the cursor pu=
t. */
> +static void errseq_test_advance_stable_when_unchanged(struct kunit *test=
)
> +{
> +	errseq_t eseq =3D 0;
> +	errseq_t since =3D 0;
> +	errseq_t cursor;
> +
> +	errseq_set(&eseq, -EIO);
> +	KUNIT_EXPECT_EQ(test, errseq_check_and_advance(&eseq, &since), -EIO);
> +
> +	cursor =3D since;
> +	KUNIT_EXPECT_EQ(test, errseq_check_and_advance(&eseq, &since), 0);
> +	KUNIT_EXPECT_EQ(test, since, cursor);
> +}
> +
> +/*
> + * Cursors are independent: one subscriber consuming an error does not
> + * consume it for another, and each subscriber sees each error once.
> + */
> +static void errseq_test_two_subscribers_independent(struct kunit *test)
> +{
> +	errseq_t eseq =3D 0;
> +	errseq_t cursor_a =3D errseq_sample(&eseq);
> +	errseq_t cursor_b =3D errseq_sample(&eseq);
> +
> +	errseq_set(&eseq, -EIO);
> +
> +	KUNIT_EXPECT_EQ(test, errseq_check_and_advance(&eseq, &cursor_a), -EIO)=
;
> +	KUNIT_EXPECT_EQ(test, errseq_check(&eseq, cursor_b), -EIO);
> +	KUNIT_EXPECT_EQ(test, errseq_check_and_advance(&eseq, &cursor_b), -EIO)=
;
> +
> +	KUNIT_EXPECT_EQ(test, errseq_check_and_advance(&eseq, &cursor_a), 0);
> +	KUNIT_EXPECT_EQ(test, errseq_check_and_advance(&eseq, &cursor_b), 0);
> +}
> +
> +static struct kunit_case errseq_test_cases[] =3D {
> +	KUNIT_CASE(errseq_test_zero_epoch_reports_no_error),
> +	KUNIT_CASE(errseq_test_set_records_error),
> +	KUNIT_CASE(errseq_test_set_overwrites_error),
> +	KUNIT_CASE(errseq_test_errno_range_extremes),
> +	KUNIT_CASE(errseq_test_sample_of_unseen_error_is_zero),
> +	KUNIT_CASE(errseq_test_new_sampler_sees_unseen_error),
> +	KUNIT_CASE(errseq_test_check_and_advance_reports_once),
> +	KUNIT_CASE(errseq_test_sample_after_seen_is_current),
> +	KUNIT_CASE(errseq_test_new_error_after_advance),
> +	KUNIT_CASE(errseq_test_same_error_reported_again_after_seen),
> +	KUNIT_CASE(errseq_test_repeat_error_visible_to_all_cursors),
> +	KUNIT_CASE(errseq_test_advance_stable_when_unchanged),
> +	KUNIT_CASE(errseq_test_two_subscribers_independent),
> +	{}
> +};
> +
> +static struct kunit_suite errseq_test_suite =3D {
> +	.name =3D "errseq",
> +	.test_cases =3D errseq_test_cases,
> +};
> +
> +kunit_test_suite(errseq_test_suite);
> +
> +MODULE_DESCRIPTION("KUnit tests for the errseq infrastructure");
> +MODULE_LICENSE("GPL");
>=20

Sounds like a good idea.

Acked-by: Jeff Layton <jlayton@kernel.org>
