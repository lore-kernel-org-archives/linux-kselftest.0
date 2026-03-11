Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72CED25FA05
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Mar 2026 13:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773235230; cv=none; b=Bh5Aakc587G8CGaHlobjl44RzBpibKW/HjIlDzujLgMN9+3ucajTd8NpcAdlDvN6rWX6u27QS0PRY5V/HCqpXmWLLJwXp+BOslRpcXJwj2KBOwzv/hyoB+DhIK9bUDErv2qpBWIa9cx449fpr+aN31PgQ+EgPwjfgbAEbTv77jI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773235230; c=relaxed/simple;
	bh=Ln56xTSBPHuo+wORJTPbGKQ+7LG8v507ISOtSTL0l9o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iOvabC1OgaJW6YkOXR/CkqgJS1Imd1D2fm7HcDjD13KsFNQCQm/tolarAoWCb0Y8HE/CvRAHyz1vQxTiE+/uU79VQOTUpKG5nSXr/LNNsvQ1AP/d+yEa0TJFzoHrnTLh/+OY9rrXgwm3RVzyqwI2iogSxpyLYnKuoNSU4wGiTMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=NGHsWpF2; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="NGHsWpF2"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-439bc14dcf4so793395f8f.1
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Mar 2026 06:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773235228; x=1773840028; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bY9qxO4iOxelF76gPsclTlF3JjBmbJed/4XnE6XgRH8=;
        b=NGHsWpF2bHJWnDyUcF5V+d2FyvVu7U/t9I2i4vcpPn/3CLbiVEezZVsK67di8zVyNF
         tIqK7xuTggNlnnPuKE1ry00GQAcjNDMnq+AX+Rr10cIMHeHxBBUycIzoa9wcHWJY4n+5
         PWTmH0o7vv8wQ5s/EVQi/f6lj4csk3/dNNSn4a3jWVQUVRIcGaBVLbJPSLpbifCh78eX
         kQxbYg/3Nii2U4zQio7SatkULDkb1CvIypBHZRONnNBisOVPYZrVdgBSuk0pYlTEYc6A
         QStOh8Rri2HpMyELqadkBhyAYF3b7QZqMqI4t6F+jmtxihXrNHFwIJfuVjpxUbbkNvgR
         kIvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773235228; x=1773840028;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bY9qxO4iOxelF76gPsclTlF3JjBmbJed/4XnE6XgRH8=;
        b=A4fAHrdBhi+UjvERt8xxeQWl6KyIFHKpv5S9l8fQk2/9veJhlypp6hVkAttxmdqQiu
         tCrUYQ2xpiy3jAl2Gxl+BFAT5cooPuTdiB3MZk8bRCVVA0ttP2TQYuXQ+SNRV8CRt9ga
         mecyvHEZ/JhZp9+sd2DcYZt3rgWt8F/L1Q2UDWRChUzj4Cao1S1E9DWEgWCdXGIDNZNV
         /hZ7AqvWMFRY250eOQg2JuJ3WOYhqvOO6N9gAwFfFjvt5fUZ0z+ZIwwnmBnU3KMhYhxF
         PSJyxH/szHY75ecIuJWDJ4+Whk+T8K+5nRHeZGLcszPE91TACUvXTyUNNtanb8HZJLAE
         FEWw==
X-Gm-Message-State: AOJu0YxfK6W9NyzEue7o7Okb+XoDOQVhckYI9h8aYyw1H0p3Y9w38J9u
	Nj+Z7YB3EESW2FU2aN4JYVRrLEwAKn2sKN6xLA9yusWg8VYpikD077sn+vY4WWwGW64=
X-Gm-Gg: ATEYQzztc34Fpp14xIRIcT4ixf5UMXHmCMmq/aaGzQOIVU6KHW41gYu5Wjh25YllnRy
	1OVmiawFJaLhMMJUVtJj/6dQHBuGVYOq3x3UhYN9I/OQLhg/Yf9QkQiq7BctM09DwdatB4WFxvB
	44ksIkktXbw5ijO3TFOvhiuF8t2VRFIJeralGKkDTW3o/STj3XWgGiZE2IOR2IzrbvZCuTk6vr0
	FAE4BpEM+Pkjy2nTZO4QLCSKU9/ccI2bnGmj+T2WpYn9kO3SM+U0tsxPUk/IhFDWWO76AHXoUJu
	ZCN8lKSPKwBI2+x/Pnu9c4Iw5zhDYhS2eDAvN4Hi4SyGNBQ4I6lXMgzbeJm6g8/GvzAXjWdJw0y
	kwoNX5g8ZM/0yZEZuO4MSiPDcU3aLAeC1+VNJNg+pThoPlH3Wh0MsGTUQlUkgYp9U2ZdFigCD+E
	H8YPDsgZ83WVByHD9A2NadiKKemVs+dK3Ghnx1fOJTgRY=
X-Received: by 2002:a05:6000:4283:b0:439:d0ac:8a8f with SMTP id ffacd0b85a97d-439eff12b6amr13844406f8f.1.1773235227788;
        Wed, 11 Mar 2026 06:20:27 -0700 (PDT)
Received: from blackdock.suse.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439f821d095sm7037911f8f.32.2026.03.11.06.20.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 06:20:26 -0700 (PDT)
Date: Wed, 11 Mar 2026 14:20:25 +0100
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Li Wang <liwang@redhat.com>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	akpm@linux-foundation.org, Johannes Weiner <hannes@cmpxchg.org>, 
	Michal Hocko <mhocko@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Nhat Pham <nphamcs@gmail.com>, Tejun Heo <tj@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Yosry Ahmed <yosryahmed@google.com>
Subject: Re: [PATCH 1/5] selftests/cgroup: detect and handle global zswap
 state in test_zswap
Message-ID: <nynf44sljfbjeftotwow56w7nz4j3zkgnoor3ulljq5ajo4lgq@fogtfchssfnt>
References: <20260311110523.26624-1-liwang@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="z3cvcq7geocohxmw"
Content-Disposition: inline
In-Reply-To: <20260311110523.26624-1-liwang@redhat.com>


--z3cvcq7geocohxmw
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/5] selftests/cgroup: detect and handle global zswap
 state in test_zswap
MIME-Version: 1.0

Hi.

On Wed, Mar 11, 2026 at 07:05:19PM +0800, Li Wang <liwang@redhat.com> wrote:
> +static bool disable_zswap(void)
> +{
> +	int st;
> +	char n[] =3D "N\n";
> +
> +	st =3D zswap_enabled_state();
> +	if (st =3D=3D 0)
> +		return true;
> +	if (st < 0)
> +		return false;
> +
> +	if (write_text("/sys/module/zswap/parameters/enabled", n, strlen(n)) >=
=3D 0) {
> +		if (zswap_enabled_state() =3D=3D 0)
> +			return true;
> +	}
> +
> +	ksft_print_msg("Failed to disable zswap\n");

Hm, so this can fail?

> +	return false;
> +}
> +
>  int main(int argc, char **argv)
>  {
>  	char root[PATH_MAX];
> -	int i;
> +	int i, orig_zswap_state;
> =20
>  	ksft_print_header();
>  	ksft_set_plan(ARRAY_SIZE(tests));
>  	if (cg_find_unified_root(root, sizeof(root), NULL))
>  		ksft_exit_skip("cgroup v2 isn't mounted\n");
> =20
> -	if (!zswap_configured())
> +	orig_zswap_state =3D zswap_enabled_state();
> +
> +	if (orig_zswap_state =3D=3D -1)
>  		ksft_exit_skip("zswap isn't configured\n");
> +	else if (orig_zswap_state =3D=3D 0 && !enable_zswap())
> +		ksft_exit_skip("zswap is disabled and cannot be enabled\n");

I should simply check the enablement state and skip if it's not
satisfactory (possibly printing an instructive message what to tweak).
(To keep the test dummy and leave it up to who's reponsible for the environ=
ment.)

My 0.02=E2=82=AC,
Michal

--z3cvcq7geocohxmw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCabFsFRsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIACgkQfj0C55Tb+AiAPAEAv69wPQKB4206xWxOp8YG
0H68wyXMSd860S+S/a87drABAOlbjNgjuF/SbmNcW/Q8NhjLUGVle5SLn2TYZi3J
h+oN
=JhMB
-----END PGP SIGNATURE-----

--z3cvcq7geocohxmw--
