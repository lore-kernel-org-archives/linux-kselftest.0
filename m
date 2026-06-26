Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA1C184524
	for <linux-kselftest@vger.kernel.org>; Fri, 26 Jun 2026 16:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782492291; cv=none; b=cq8k4ID6S7Np/57bssMXrugZodqDIKXyrLXpLZZUwreWreSIIR+YswA7ZIaOGqPQ+/73LxGmocEN9RDraWVf5fiDkgkPk/R2sUNEOiL+2rBcUa9i/KbcIewT0jFLgy3QggywINGsGdggg/i4yvF1jtfn89HqSxCH9R/bNZCoRRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782492291; c=relaxed/simple;
	bh=m7F5wb38djwjdU4PCT+nH0ihnwGgVV3yXMzvQ77WA+A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DqCKZeESxQnRPolOiuHnIIrWnBK1fog4ZI/qsMp/9m6i4+4VnfuUragmC4uCLiV16vcT+pnepxYR2IlJf9E/opxoKg4vFeiUTur/QLHcxgUpcSbrR5Y37WCMQEYdO7JHZnks225EX15IC/rsZiz+b0fjNY5RaN6UcRVwa/J7DCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=TECVmPGk; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="TECVmPGk"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49241a577d8so9302165e9.3
        for <linux-kselftest@vger.kernel.org>; Fri, 26 Jun 2026 09:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1782492289; x=1783097089; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KiWBrutmWIAfCPXVB/qlhLvNu7kR/O5EnS7WLLWLfPA=;
        b=TECVmPGkq0DaeiaNUl23gL3Wb4fhb619kgYRgs/l/tsrnW8IM81fqybkFcEldIy0yX
         n3UInS9NnojoXAYsWuY+lDUjQbhMPr4gW4v/DKxoeJ/vZ21BtTE9MDnmX1wdiVsrwwPt
         bW8UT01KcgXbHBPIKbHyWHG5/X0EK9Pbn682eqHPA0XTW+Ry06jsRsO9fx6Q7fz+ZNs7
         Pj+tQuSZu3iCToo7DzMWcVoqQoLXfqUwvOcThlHMhz3uJc9LSiIO3NJV7emdkzVvSSO8
         oqyuwj5XsE0U1PyBPkjcpV+USn1im6dg/xb4ZwF1fQ4w1I4rjScVEuFHy4jQQihDrQTC
         8QIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782492289; x=1783097089;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KiWBrutmWIAfCPXVB/qlhLvNu7kR/O5EnS7WLLWLfPA=;
        b=Ba6Uo1Hxbde4AeRuncboZijOpWh/9hf9KtISuV5BAyrWAEOlwHzwO5eJUv2Q2tkC2F
         0Sl7Y5PlPvWHIBZtR0EKWVW4PHIlaKOV7h1YM/BKH1xsVySzuRfHpkz1b8GEqH+irZNx
         HbCRvxDBAjh7ZBlE3MzYmDYCwIIDcHZ5JJEd25B8c9fdGKAuwwAkx7M63gaf2q5x2QlK
         RubNs8A3TFPKLnn40fP3u9xVTb0r8Rr0Fx1G99/rDxCBVrPQ4LW6ExNXooKcVOz51TU5
         P05ssxkm/RTmRX1J93Y6B0pDgdrnaQsb7SCzP/r5kYtHbH4Vi8xBVm9utNCIQUIsizSM
         ZbtQ==
X-Forwarded-Encrypted: i=1; AFNElJ/BRoQZ+V7C0q9qEMsh7PKru81SjCRRERVKibtyYjoIyuffssrgHZI7kkw11KLdD28tIIm/BvUB6Vu1h8NO4fo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSTUBIDo7bNMFKHju8Zpg29yA4LO5vnhMWnLg5i2Vjx0iV1tMt
	VH4MBqiRncyiIUMi8tzQMM3OEC6MAiA3bLgia6dGfCDjYVYd2wBezjIeM8eByLb+LpU=
X-Gm-Gg: AfdE7ckqZmPZAUXboG+mEYCyewtpY6ZKUC2EcaFvJRuPzPTu4VvILtbIcQxDouigAWo
	h7dnEtse/xryGlPL87Uyxt8gXMjISGBbLclllUDDNGs8ATKRfFh4MwVZ7YcK7UIPX0k+/3DBoo5
	892iJOZadlQEjtVzrnCQElqWBCLFR4AZNiiLHUpVEPnixYnDsars8NMZwM5PPJfbgCPKVlub0Va
	AogS7aVAUlZ/nQJvjrMSxFWXHJdEAbyDL7dEHnHAkb6kouRkMfgOn54dL6EiNicGS5uOeYlj6Nn
	yzFhkgq6FRhWtBFkn5JtTWEWi+JumrvUy6nFrZuDH8j93MqEeoC6LNw/6HL+bN5Hd5mtBORtaqD
	mGy+Nf4mlyfUnAUBOkYGI3CQ5GbR0tIB3NV+WaLs9WJhlmi7mbRukFjQHEb+QfpEHXG2z8/duLC
	gBB49l/K8GFUZvzhtjCQ==
X-Received: by 2002:a05:600c:c118:b0:492:6881:1114 with SMTP id 5b1f17b1804b1-49268811131mr76135445e9.0.1782492289053;
        Fri, 26 Jun 2026 09:44:49 -0700 (PDT)
Received: from localhost.localdomain ([62.77.90.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4926c02088dsm53200365e9.0.2026.06.26.09.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 09:44:48 -0700 (PDT)
Date: Fri, 26 Jun 2026 18:44:46 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Joe Simmons-Talbott <joest@redhat.com>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Shuah Khan <shuah@kernel.org>, cui.tao@linux.dev, Li Wang <li.wang@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Nhat Pham <nphamcs@gmail.com>, 
	Guopeng Zhang <zhangguopeng@kylinos.cn>, Sebastian Chlad <sebastianchlad@gmail.com>, 
	"open list:CONTROL GROUP (CGROUP)" <cgroups@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RESEND v4] selftests/cgroup: Adjust cpu test duration
 based on HZ
Message-ID: <aj6r_tUrPH8eTuQw@localhost.localdomain>
References: <20260625203307.1114538-1-joest@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hnagmfluecnp3bhm"
Content-Disposition: inline
In-Reply-To: <20260625203307.1114538-1-joest@redhat.com>


--hnagmfluecnp3bhm
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH RESEND v4] selftests/cgroup: Adjust cpu test duration
 based on HZ
MIME-Version: 1.0

On Thu, Jun 25, 2026 at 04:33:04PM -0400, Joe Simmons-Talbott <joest@redhat=
=2Ecom> wrote:
>  static int test_cpucg_max_nested(const char *root)
>  {
>  	int ret =3D KSFT_FAIL;
> +	long hz =3D get_config_hz();
>  	long quota_usec =3D 1000;
>  	long default_period_usec =3D 100000; /* cpu.max's default period */
>  	long duration_seconds =3D 1;
> =20
> -	long duration_usec =3D duration_seconds * USEC_PER_SEC;
> +	long duration_usec, duration_sec, duration_nsec;
>  	long usage_usec, n_periods, remainder_usec, expected_usage_usec;
>  	char *parent, *child;
>  	char quota_buf[32];
> =20
> +	duration_usec =3D duration_seconds * USEC_PER_SEC * 1000 / hz;
> +	duration_sec =3D duration_usec / USEC_PER_SEC;
> +	duration_nsec =3D duration_usec % USEC_PER_SEC * NSEC_PER_USEC;

Oh, that's duration in so many units and the seconds is there twice. (I
understand why you did that for the rescale but) could you pick more
descriptive/distinctive names then and ideally keep it simple :-p

Thanks,
Michal

--hnagmfluecnp3bhm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCaj6sexsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIACgkQfj0C55Tb+AjcsgD+PahM0s+YmXEN2Ui9pVtE
FMgDbmDnWk4anoBQVxTF6ZoA/0jjiW78vkltqLj1imUmdkfUdTjr7GhBD+a+VHwV
lTQC
=j+J0
-----END PGP SIGNATURE-----

--hnagmfluecnp3bhm--
