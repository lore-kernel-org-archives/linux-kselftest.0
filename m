Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED7235BDDC;
	Wed, 22 Apr 2026 17:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776880264; cv=none; b=a8Nnf5faE6eA5wsRXjTKES9m3YQWHsofieA8R5v83l+2HbpRsDoJuwWGut4b6fEQcpuZO138DnacXNRIYOpWzleE+laJdcB74JMF+wsmhs+9DMhCSWElxzFHhIddqMWkr54ZB+CMMsOZhXTUSzxtooLBMn8LL0trSt6+TC0lKD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776880264; c=relaxed/simple;
	bh=KPvLrXE2/oUIc7/DGRST/uOw61jgaB21B6zfJODnfvg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R2922+Iql30K1aAJXTKMnudtbnZo7Zxv8r61qPIm+2pmS7rjZDNhJ+aiC6UgGkYA8rJn50bV7DL+xnLURJ8Apm0jjXw3Lh+rj54UihMTPPbq3lgfUVMGJ/Q+JCj0/izsxvLvstGB0HBC8ak9gTqLf7JRd3KK5zapqW5p87mGzu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r0gxB7GB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r0gxB7GB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F148AC19425;
	Wed, 22 Apr 2026 17:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776880264;
	bh=KPvLrXE2/oUIc7/DGRST/uOw61jgaB21B6zfJODnfvg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r0gxB7GBgcmuNv2k5W7mvLRhUPeknwOcHhJ7vcUMwYyOAwhEzMlPUUdgqqKEAKf8N
	 plJ8OVHHWcqO1GleG/UwibiIldak2bSKxxAxwbJLZOSJXDOTK0ujQP3Qwd/8XnT3yA
	 JrpBzw2UUsrCMwaFOBMxN6fbmxpKDlH+tbFpVXLPJpISxuz61JOg3NP7BEnsDkvmUw
	 xr6F2v6PKHMAPsxtjfirmtwB7hn6vJakeYGRo8+++ZoQ9Rhi4M1lPQSq9ynhlqlXdj
	 fEmrqFEMzegKfYNLB/QVN4Qb62nNUOgAQtUtIef9ono1OQRpwltgmo2dCxusebfONM
	 PVDN3ioktc9uQ==
Date: Wed, 22 Apr 2026 18:50:59 +0100
From: Mark Brown <broonie@kernel.org>
To: Leo Yan <leo.yan@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] kselftest/arm64: Fix build failure with GCC-15
Message-ID: <bdec0293-e962-432e-9056-f21079707a4d@sirena.org.uk>
References: <20260422-selftests_arm64_gcc15-v2-1-c0134de8838a@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KXxGrSnyNAOe7ayE"
Content-Disposition: inline
In-Reply-To: <20260422-selftests_arm64_gcc15-v2-1-c0134de8838a@arm.com>
X-Cookie: I'm definitely not in Omaha!


--KXxGrSnyNAOe7ayE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 22, 2026 at 06:42:54PM +0100, Leo Yan wrote:

> For GCC-15, NT_ARM_GCS is defined in the libc header, causing gcs-util.h
> to skip its fallback definition of struct user_gcs. This leads to the
> compiler error.

> Fix this by including <asm/ptrace.h> to provide the proper definition.

> +++ b/tools/testing/selftests/arm64/gcs/gcs-util.h
> @@ -7,6 +7,7 @@
>  #define GCS_UTIL_H
> =20
>  #include <stdbool.h>
> +#include <asm/ptrace.h>
> =20
>  #ifndef __NR_map_shadow_stack
>  #define __NR_map_shadow_stack 453

Reviewed-by: Mark Brown <broonie@kernel.org>

--KXxGrSnyNAOe7ayE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnpCoMACgkQJNaLcl1U
h9A52wf9FOb2X61sAKZFg0tLjl5OvSTmH8kEuCqQRMnPND+u2vn+CKXzQ5pK8x9e
TSdPkU3ttff8u5Rifl1nk7RKEotMP7APZv0h7JiP9+Qd/mfWaJXYlP9XBgtyHUdn
KCLU0uMCzGlRtmXdLVTqTB6K2ov8/3W89yKCdFITnrq8KXfLGJRO1mA8fqkSs8cP
snGks4TIezZkA/9yTuL5DIIf+xYH1ip7nR+FMO20SVcwLdJytIYVgqC7lnG5L5kr
GSCN6E7oIBmck2ja63nvFkqUq7kbCjDexlObJ5kiOnVM+NpdXkHgACuO5Uiom87H
p3cJ+0uKaqvgmKYFycqXl4hXixcMsw==
=z8AI
-----END PGP SIGNATURE-----

--KXxGrSnyNAOe7ayE--
