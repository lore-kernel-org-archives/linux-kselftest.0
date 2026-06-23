Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1118137E2F7
	for <linux-kselftest@vger.kernel.org>; Tue, 23 Jun 2026 13:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782222756; cv=none; b=jD7ibA+Gub5q5ffu0FkiAe0IqpBQGnQC3doB2MDFDIpXa+BqcfumDDK4vRWyDRpPDXvuWJom0nuKV8e8uow1bqdRsgrlj0WPNOOq6fSst/OouPaHD1aid+Z6UfG9o5HqE8v+SfoEmrxqB8KQzcRnQOA9UtVPRWmPybGG1oDNjT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782222756; c=relaxed/simple;
	bh=qQDzdCIM36hTAqOEAnWir+7wrUqqW1kd9jhGVeFV15I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZsjWH8azOkHjqZTXj65OfZFpimFtW+oAmaNJWbEjfxHkxqBII6Krp9ieCKmnMtjIkZG+bBMY5jq68v3yYhDpA73+HdUpYE9z5JA8y44BlKg1e4wd3hVRDfJrtAedwTcMwXmOaHyDSI5J7kTOAYYu0AgNC5F7xb+IsWOZ7u2eJEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ADOSpobz; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ADOSpobz"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4924944fe6bso22206285e9.0
        for <linux-kselftest@vger.kernel.org>; Tue, 23 Jun 2026 06:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1782222753; x=1782827553; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PHObhepawfnCQqRNz4R+JkWCcyuhA+vOquuYLNzbdAc=;
        b=ADOSpobzjcEHMkYS/sXIZQVl12XUJxZyCde6NbG569ry62GsvfZJQbNIabmCIXW0c6
         WTjV7ynnXngK/dxEitSDCKJbdG7zjJv2XH1NLDpXqs2XZexUN0Q22p8Yx1FZXv/uoT9d
         T/ixCXEyGiH7t7+cr94+LJYCD6Xjp3vOAEgNXyrP2DfWeBwRa8BoRojdKIZJ0SALOY3V
         SLqj00yV936CMBQZecJ2hXJ9Sx/vC1Q21TWGjMYiQADpE8K7Ja7H+PwVlfLVOvJkMGN3
         lpIKPP+H92mjgMti9Af3DKaF74AAGaxkFBqyaKGotAGSuknI1/YH6vk/y6vaY2xiSB+n
         nTNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782222753; x=1782827553;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PHObhepawfnCQqRNz4R+JkWCcyuhA+vOquuYLNzbdAc=;
        b=An1OGKmSHpPROc+Y39eTTmwZ4kSDjbEgHxIjUTsGuxuhT6VKr3Unh7PzwKFgL2jR5s
         R/T6stL4E/QAdXxyhL7nRFTJIRrF7+62oy1KLSjiwvPpK25JgwAEZPymLrvwEUkkrUp8
         UmM08W+7m/e5SavVDIlN+NhMj/Mla1VNAMVhkx40GStcL2eSAOveZXSRhfMyDj91vHkr
         njHnzaaHapBhpnFI4PTc5WcC2OdDv54vxnBUqeEW1WG5Ud02GRm8iY2gNzzAoldXwsMh
         AcVhVFzFGQLJAYdp0ISZLgYZlaGfpc/fkEIyLCcQtM5skgFAXb4NWcxrRx8dR3sDw/0G
         6IWA==
X-Forwarded-Encrypted: i=1; AFNElJ8buKVuDVtGMzxQmfOYd9OoZdH34R0wDf+YfWuIQ/IDkNrR6ndq9of7L4/Vznx6H2Q6ZChun3/qJUfVPoTcYXY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEaTXIlLehZFAjhmW6nrbEfKzt+E9zsvm1atd3LcatYS3/YS/2
	1N+DwlNiABApbbBGEyxxk9RlRuhecxwTAyjcPqbiOipI6Q0MPYkRWadyBVK4QLKwP0M=
X-Gm-Gg: AfdE7clGXl4D8HnqPrK8YALgMm0gXIr8Y/B9+wf9qYYJOir82he0RmzZA8KjY12Rgl7
	yhfZV/ah0azc/fT0VJeds/OiNrFrmEvT3i/EM3B55RSgFkRtry7vBFdlkksHxUM6HK502KbCFkl
	Ye9HX6lXJZ0B95flf+c7Za+ox5j74/jtBWVby5WqJIWRPdpXQAZWpjazq4A7zfdu04kXuHDvdwX
	XAs+Ov24FjPTRhB1jghVZ9YlC1UFFVcWM4TaMTWGwDPNs7BcOL7N/RsPJ1viohmT2XrWpvrn4jb
	xOmrgbUExk5+teg7H3VqrLqjxMnyOAD1Cl/jVuQKNU7erhYhtvZZG9OeC5ISJwvTzenmajnPJpW
	v+hUthTa4mEdSuipDwGa65BrE+74Y2HdUIoZ96NxoglMJC3Uu4Gr3t5Xo7lmxJ5iyCit5gLqCCI
	IcoFRRlBo6TPrlB30qXQ==
X-Received: by 2002:a05:600c:1d1e:b0:492:4ca9:a46d with SMTP id 5b1f17b1804b1-4924ca9a4e8mr212679495e9.5.1782222753308;
        Tue, 23 Jun 2026 06:52:33 -0700 (PDT)
Received: from localhost.localdomain ([62.77.90.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fd15470sm438068605e9.2.2026.06.23.06.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 06:52:32 -0700 (PDT)
Date: Tue, 23 Jun 2026 15:52:30 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Joe Simmons-Talbott <joest@redhat.com>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Shuah Khan <shuah@kernel.org>, cgroups@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Sebastian Chlad <sebastian.chlad@suse.com>
Subject: Re: [PATCH v2] selftests/cgroup: Adjust cpu.max quota based on HZ
Message-ID: <ajqBjmJ-VT3UDPMr@localhost.localdomain>
References: <20260622194305.601392-1-joest@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xyyzzujscooqtqev"
Content-Disposition: inline
In-Reply-To: <20260622194305.601392-1-joest@redhat.com>


--xyyzzujscooqtqev
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] selftests/cgroup: Adjust cpu.max quota based on HZ
MIME-Version: 1.0

On Mon, Jun 22, 2026 at 03:43:04PM -0400, Joe Simmons-Talbott <joest@redhat=
=2Ecom> wrote:
> +static long
> +_get_config_hz(void)
> +{
> +	long hz =3D -1;
> +	FILE *f;
> +	char cmd[256] =3D "zcat /proc/config.gz 2>/dev/null | grep '^CONFIG_HZ=
=3D'";
> +
> +	f =3D popen(cmd, "r");
> +
> +	if (!f)
> +		goto out;
> +
> +	fscanf(f, "CONFIG_HZ=3D%ld", &hz);
> +
> +out:
> +	pclose(f);
> +	return hz;
> +}

I like that you voiced this dependency on CONFIG_HZ and also that
_SC_CLK_TCK is useless in this regards.
(I see that BPF selftests have similar infra for this.)


> +
>  /*
>   * This test creates a cgroup with some maximum value within a period, a=
nd
>   * verifies that a process in the cgroup is not overscheduled.
> @@ -646,7 +669,8 @@ test_cpucg_nested_weight_underprovisioned(const char =
*root)
>  static int test_cpucg_max(const char *root)
>  {
>  	int ret =3D KSFT_FAIL;
> -	long quota_usec =3D 1000;
> +	long hz =3D _get_config_hz();
> +	long quota_usec;
>  	long default_period_usec =3D 100000; /* cpu.max's default period */
>  	long duration_seconds =3D 1;

I would not bend the tested value but it's expectation (so that
approximately same quantity is tested acroos configs).

I reckon the problem might be tasks that overrun the quota due to long
tick, fortunately, we can assume this is compensated over multiple
periods, so _on average_ quota should be honored (more) precisely.
But the test duration may be not well aligned with all the compensation
periods, to that must be accounted for in the expectation.

When I write it all down, I get this:

--- a/tools/testing/selftests/cgroup/test_cpu.c
+++ b/tools/testing/selftests/cgroup/test_cpu.c
@@ -651,7 +651,9 @@ static int test_cpucg_max(const char *root)
        long duration_seconds =3D 1;

        long duration_usec =3D duration_seconds * USEC_PER_SEC;
-       long usage_usec, n_periods, remainder_usec, expected_usage_usec;
+       long usage_usec, expected_usage_usec;
+       long n_periods, spread_periods, unaligned;
+       long tick_usec, low_usage, high_usage;
        char *cpucg;
        char quota_buf[32];

@@ -687,9 +689,16 @@ static int test_cpucg_max(const char *root)
         * the cpu hog is set to run as per wall-clock time
         */
        n_periods =3D duration_usec / default_period_usec;
-       remainder_usec =3D duration_usec - n_periods * default_period_usec;
-       expected_usage_usec
-               =3D n_periods * quota_usec + MIN(remainder_usec, quota_usec=
);
+       tick_usec =3D USEC_PER_SEC / hz;
+       /* Up to tick_usec (over)run is compensated over multiple periods */
+       spread_periods =3D MAX(1, tick_usec / quota_usec);
+       low_usage =3D n_periods / spread_periods;
+       high_usage =3D (n_periods + spread_periods - 1) / spread_periods;
+       unaligned =3D n_periods % spread_periods;
+
+       expected_usage_usec =3D quota_usec * (
+               unaligned * high_usage +
+               (spread_periods - unaligned) * low_usage);

        if (!values_close_report(usage_usec, expected_usage_usec, 10))
                goto cleanup;


(I neglected (and dropped) remainder_usec because it is zero with
default values)

However, not all preemptions are tick-based, so there'd be noise=20
and one has to tune the values_clone_report(,,err) anyway.

Then to reduce noise, the simpler solution is to let the test run
longer

duration_usec =3D duration_seconds * USEC_PER_SEC * 1000 / hz;

(where 1000 is the CONFIG_HZ=3D1000 where the test runs sufficiently [1] we=
ll.)

Joe, how do to the two variants above (unalignment account and prolonged
duration) affect test_cpu behavior on your setup?

(I'm personally wondering what is bigger quantity: systemic error due to
HZ quantization or random (SMP) error.)

Thanks,
Michal

[1] Even there one runs into noise depending on nr_cpus, thus even that
    fixed err=3D10 is not ideal.

--xyyzzujscooqtqev
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCajqPlBsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIACgkQfj0C55Tb+AjYkwEAkanTs6Oe4Wq8RbfJGWwj
wfOgF9zepsGbVUE/9eQ+9FkBAIPJFLYaGnMSkGMcL8dWTL+iRmaz7E8a+o4mmZjT
mKEM
=5cZS
-----END PGP SIGNATURE-----

--xyyzzujscooqtqev--
