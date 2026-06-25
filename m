Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FAEA378D89
	for <linux-kselftest@vger.kernel.org>; Thu, 25 Jun 2026 08:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782375811; cv=none; b=IQQq/0gWN3uLVvFEbPCcy3KEyimrNfPAghja1dcWzxEoGdhWrrc13WcQofMdLUHse/o7iTGp+ePBnzNocwF2ZAyxvFQ9b+Y0JkXDEJvetqpJA468SAwoyQdfqq8R4NnpwDb2dmD8Rhnag398eqeztq/psVbs/12wHA/skW4wYxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782375811; c=relaxed/simple;
	bh=/TVcjFpY9ymsJcczpiXFMMolxxWt9nj/DstrmpaSufs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g9AoCz2CbnQ8DQDHfCggLfFO/0XCkuxYzYZuKtVpHkWQw02eiIerL8AijE/J65WfN2f9gIVV8uQusNOwI3iQEq5wRcwkXlZn7XXcFGlPu+p91vRlikTY/lEYw7BDLBV/dbzgAVFeBS1oiNEak3MSsy9WkHCvtcsM26DuvrrIWNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=FfDcTflW; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="FfDcTflW"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4926046fbc5so7813105e9.0
        for <linux-kselftest@vger.kernel.org>; Thu, 25 Jun 2026 01:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1782375806; x=1782980606; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=E2p+Jg6tBRRqzoSuzYoMs3fkx6AeDBpOlq7Y8Lm6x6k=;
        b=FfDcTflWGDROikXtQ9tNuIvgXYR/LwbJhqO9we85rjOjzSftc24Z7S/r5NnsOLrX82
         aAkBochuj6EInp4Z9/W2T6FDR3i1v88cWsNUcaoTQYVAKHBhcHOCo7X6NwmjRqboxZuB
         +x9JnbuABjZ8AJfq0xxifFEbBSYht240oRT/qan9FSrm9X244gvNj0HxwxAz2R3zXVpr
         JavmnL6htxB6YVnE5saqYCDbaQ5UIuBZxTVllBT7MSbOrJSsfA0A3Knj+gzmj++yrgJn
         fM17DO4YjNjTmfqu1rbbaL8Ytt/NevnSWKxyB4HEPUe+jwYmaJJfDa05NdOb8JYKPsOF
         fvPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782375806; x=1782980606;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E2p+Jg6tBRRqzoSuzYoMs3fkx6AeDBpOlq7Y8Lm6x6k=;
        b=U45gb017UgQ5XDy82ds/sKUcDX/XnXnJgULFGvgywVWwOYH3pAJ3ZsoPXfgO/oOvCT
         x4cWAUNKta/xDNl1jlBACRmr229exv07QZe9cfdqVTF0C/GTUt/Byj0THbplQSROVNBW
         zgv5XBaiTRvOnPDWL4zLAZWgn5NCvDDQgOO861j4VWacUK9GVVegVunzjhyi1fkJj06O
         V1cs+rITf/SeJ1Yk679+s4CBCjFYDYfR8RL7DOgrZRcoOywAsOD8BQ07dnj3i2085EfQ
         Hi5lRkPit9bH8jy6IB19NZaj3Rxb5Gkfw5BOuJIbV1HWKbQTzSNZxCOegUL69ckyMHzJ
         ydSA==
X-Forwarded-Encrypted: i=1; AFNElJ+mgbSdD5xpJ8dRO+1iCTRZOtlKJvWpautRhNi6ue+zx4YLMxKbUk4XXzrXYGcdXNt08gKQrAD5LfDyb8kV7dk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXRN6ngLwufZyrr4cSoya+X0gK/fuUuJijjv/xCkyhAm45ODZo
	ygwlT8/LZcqja4NWHpk+w4YCJaF3GtQHj2dykUM3ewySzQbmp5PWTJ402rgH/Q5hPD4yoZ370d9
	TOXdEuh4=
X-Gm-Gg: AfdE7cnsSjGb8J2uR17iHJBnRM+copP23r61lmxEAcyKS5XR+WvEtiVCRId+Pm4TY0w
	BfI0MHUB2td66phPR7NRujlc/I7kEwEJERpF2TwbVaOBt88pymFxHFevlA9ZFZffQg2D4KctZLR
	vql2REoin7Hv8Kwdlmau/fMo1wLD4xM8zGXHjZmDowdo8iOdPy631L7jwZ2IQlFyp2s+4RvsJ7Z
	vYIHMGpKEwbKxD9Laov2lCTCOEW3S0C2P+eThH6L7fPiNRDhM5Y+LANYXUHRTx/QF9C/MJA698W
	lHGy4ZttSxs87vG9fLxJ2zHecTk23xnxIbHGcugjE30D2zF9kRbX/ffgMpl3x0oo1hYTmhUGf6V
	vxd1r0hGnvmdaf91+h5XQz9v+ieHkEWtkKvILmLGxFOWZFn3Yv9Wo8jobmtTDixjqX+DRDh44/A
	r5wz3mmGAc/fXL+6TMvw==
X-Received: by 2002:a05:600c:638e:b0:490:7df7:9190 with SMTP id 5b1f17b1804b1-492663ea3d3mr15651405e9.8.1782375804387;
        Thu, 25 Jun 2026 01:23:24 -0700 (PDT)
Received: from localhost.localdomain ([62.77.90.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492660a333asm41965875e9.3.2026.06.25.01.23.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 01:23:23 -0700 (PDT)
Date: Thu, 25 Jun 2026 10:23:22 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Joe Simmons-Talbott <joest@redhat.com>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Shuah Khan <shuah@kernel.org>, cgroups@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] selftests/cgroup: Adjust cpu test duration based on HZ
Message-ID: <ajzjLsBNS7rNZV2x@localhost.localdomain>
References: <20260624160358.430354-1-joest@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="omrw3ip3e232dwpc"
Content-Disposition: inline
In-Reply-To: <20260624160358.430354-1-joest@redhat.com>


--omrw3ip3e232dwpc
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3] selftests/cgroup: Adjust cpu test duration based on HZ
MIME-Version: 1.0

Hi.

On Wed, Jun 24, 2026 at 12:03:57PM -0400, Joe Simmons-Talbott <joest@redhat=
=2Ecom> wrote:
> +/*
> + * Best effort attempt to get the kernel's HZ value from the config.
> + * Return the HZ value if found otherwise return -1 to indicate failure.
> + */
> +static long
> +_get_config_hz(void)

drop underscore from the static function

> +{
> +	long hz =3D -1;

use the default 1000 here to simplify the callers

> +	FILE *f;
> +	char cmd[256] =3D "zcat /proc/config.gz 2>/dev/null | grep '^CONFIG_HZ=
=3D'";
> +
> +	f =3D popen(cmd, "r");
> +
> +	if (!f)
> +		return hz;
> +
> +	if (fscanf(f, "CONFIG_HZ=3D%ld", &hz) =3D=3D EOF)
> +		goto out;
> +
> +out:
> +	pclose(f);
> +	return hz;
> +}
> +
>  /*
>   * This test creates a cgroup with some maximum value within a period, a=
nd
>   * verifies that a process in the cgroup is not overscheduled.
> @@ -646,15 +670,21 @@ test_cpucg_nested_weight_underprovisioned(const cha=
r *root)
>  static int test_cpucg_max(const char *root)
>  {
>  	int ret =3D KSFT_FAIL;
> +	long hz =3D _get_config_hz();
>  	long quota_usec =3D 1000;
>  	long default_period_usec =3D 100000; /* cpu.max's default period */
> -	long duration_seconds =3D 1;
> +	long duration_seconds;
> =20
> -	long duration_usec =3D duration_seconds * USEC_PER_SEC;
> +	long duration_usec;
>  	long usage_usec, n_periods, remainder_usec, expected_usage_usec;
>  	char *cpucg;
>  	char quota_buf[32];
> =20
> +	if (hz =3D=3D -1)
> +		hz =3D 1000;
> +	duration_seconds =3D 1000 / hz;
> +	duration_usec =3D duration_seconds * USEC_PER_SEC;

I'd do the calculation in usecs

	duration_usec =3D duration_seconds * USEC_PER_SEC * 1000 / hz;

so that actual duration is more precise (for hz=3D300 which is the only
that doesn't divide 1000)

All in all, make the adjustments for HZ with less code (since I expect
this will need adjustments for SMPs in future).

Thanks,
Michal

--omrw3ip3e232dwpc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCajzldhsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIACgkQfj0C55Tb+AhG5AEAsiaZILB8jz1XPZq6anV8
Hc6J1Y5Pv7YWDyBDDQXko2EA/3VvrRbv6LPfgIy+hXnRfjhjxl4i1e2WobK0WYIe
V/0A
=0a5l
-----END PGP SIGNATURE-----

--omrw3ip3e232dwpc--
