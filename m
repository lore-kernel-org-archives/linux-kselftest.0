Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EBD44EC667
	for <linux-kselftest@vger.kernel.org>; Mon,  7 Sep 2026 14:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788789999; cv=none; b=GVEQAbsNGiuzCcgpmewUSpD/hDPkIc/RV+tjMeAhYRM8dZT9tn2aJSrEYdWWTendd0EuxGfu710qenqq4rtm7UsS1IYV0/OfMds1wxzLySPZwrYUYqbJX/jDWFwkYz13j/hBhgP0xuuZ0HI6A6+LjYucDUDRdakSsPc9H0wMWQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788789999; c=relaxed/simple;
	bh=kAiALmTWnf8x9SsADiUwVb4eDhzSyPp2/E69JaKJyug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E8iD4RIi0IKjaY0+lVdDSI03tkvBsvom7VxHi+grXp2/U8heXwpQNXjcjl1re3Q4n96vgDVQBvSNDJLxVkYv1W0JW187o6doC2Awcz9Jq6nxkcT7Lz6SGGt6OhKzsZRQM6oeNVweWJW8/kyU5l5Uaiu4rRt5l6PwvDy+lIsXTiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Fowv+iyf; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Fowv+iyf"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48441fa5c37so2668387f8f.3
        for <linux-kselftest@vger.kernel.org>; Mon, 07 Sep 2026 07:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788789994; x=1789394794; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hnVIlm2nSumk0PrCQmB9sy4lQ8aJwTihVNma9sBp9rQ=;
        b=Fowv+iyfr+KORHEl5atNl+7aAwsXvqtBTsM6zUgXJucKvDkMEVGUkhGuNvV6A0GKrq
         2TOLgDaQOOYq8Pa9yvJW9ela5KfpxlYYVdQ0iZSVr0+NFOSPzoMhyueP2IVRuHQAaC1L
         L71LrPhPKXdowjiGoPy8mVD08JcmohltxtUprlvQ+XuQNIPkK4IggtPxtjpCS1bEJkS+
         lyjAkHNM74Li+F/ScdA1u2GvyL/hPxMqyr4WDjLeHgK6nIRJOwuhavu+zxS7tC3aNDBh
         dnKffwS0AVynB5j/qhgiWaDINiq6K1munQ+tuO9cP+oUimRz37xhuVBbhyH31ufm7+bl
         zOtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788789994; x=1789394794;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hnVIlm2nSumk0PrCQmB9sy4lQ8aJwTihVNma9sBp9rQ=;
        b=gL+P1TpUGf2ltzrSWPQpdg5WE4iPRe+k83S36Zj4xSB7XAyfUPZCfbWw8REqSoXP4G
         x4OkV+mj/QRHqEpdFxEtrXrV1YfLR1qwug42STVIbuJ4WdgwGPvg0bTSOrNSNmHOiwq+
         QGp3Az+rBaAOAodpmB9XGEIfb/Ec0MgwIglU5+QiDoc20DUA1AAoOiaAGkCNTnGsYU3h
         X5bULLYBdU1nQHbcAbNnh3USSLcelsWce7g+hrHLG9q3TfDFf7vyW6MRwZbGkuWXNZbM
         AWbe6qZ2TuT2AR/ji82RKyplyg5HmN80/gC08i4RHJpmOYuZN/1bujz4dcEG2SjhrpG8
         GPzg==
X-Forwarded-Encrypted: i=1; AKwUvBy6m8MzNgZRl+yWB3pup1bOelN0fHCPyMck1AfiBJ2nyFv7sxBGdi/jIrr6h7teBMRjsUx13zbN5JiB1lpfak8=@vger.kernel.org
X-Gm-Message-State: AFuF++k4A/NnjTEj6VlzZad4GGOwi1ZQceoWpn6IamWFymb/GbQ4Ta44
	V7K3a6Oh8yZTwwQkmz5DLu9altoHblt/KZCv1Pc3+pzeRNYbuTVzKr4MzvEVKAKQ3Vs=
X-Gm-Gg: AYBFou2SLqPmPq/URZkmZRtT9IEmpdagzZTMGen0o52RtMGJkhxY6A8MQX6bfQZSfCG
	8Tqt84z0iSfvWu6BC5NfroHn/xk22V6VNdVMnBmvqFrW4xA57jUix4ZCDrKVYJbxYZ9Ihw4PI+B
	vBIBbaDhihL66ikdCPet8oOqBM3bQZHTycfQ/W0TFokjWsFehvEm5VulePUbExAuhWGRTytodI4
	NSlscWLXtTTtul0bieeB3VF1iferQWnLwn4E+qHZsy6jEBVHa5CjBbPOmPK4dbvF1txUUyqCvXh
	aP1YbOHqXT+C20jjOD/Zli/J0XPv2B5qYeUCyuiUuizr95iPLcUy6vYEeSYtt2/SIOZu25+EKHe
	y/hzfWuozEFCQH7gYb1cXaknm2oqiTfo4w5duHUTAKGjL8AgZ0CjToGT0y0P7QXdX53RsIrpFKW
	jC1aayfe1pVasxNydCpECkunXBWnHvXb+GYWD+T6/TEAnbIafP5EoQHS5RyPcjvVo=
X-Received: by 2002:a05:6000:4014:b0:485:8a46:b3cf with SMTP id ffacd0b85a97d-4858a46b5fcmr20890181f8f.55.1788789994173;
        Mon, 07 Sep 2026 07:06:34 -0700 (PDT)
Received: from localhost.localdomain ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48591eb3d3bsm16866649f8f.0.2026.09.07.07.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 07:06:33 -0700 (PDT)
Date: Mon, 7 Sep 2026 16:06:31 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Zhe Liu <liuzhe1@kylinos.cn>
Cc: bsegall@google.com, cgroups@vger.kernel.org, corbet@lwn.net, 
	dietmar.eggemann@arm.com, hannes@cmpxchg.org, juri.lelli@redhat.com, 
	kprateek.nayak@amd.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, mgorman@suse.de, mingo@redhat.com, peterz@infradead.org, 
	rostedt@goodmis.org, skhan@linuxfoundation.org, tj@kernel.org, 
	vincent.guittot@linaro.org, vschneid@redhat.com, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/3] sched/fair: Remove the write-order dependency
 between cpu.max and cpu.max.burst
Message-ID: <ap69-MoOmAJifgjG@localhost.localdomain>
References: <aobnZEh1hfIBhswD@localhost.localdomain>
 <20260904062013.504236-1-liuzhe1@kylinos.cn>
 <20260904062013.504236-2-liuzhe1@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5sahav5mzexczfrn"
Content-Disposition: inline
In-Reply-To: <20260904062013.504236-2-liuzhe1@kylinos.cn>


--5sahav5mzexczfrn
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 1/3] sched/fair: Remove the write-order dependency
 between cpu.max and cpu.max.burst
MIME-Version: 1.0

On Fri, Sep 04, 2026 at 02:20:11PM +0800, Zhe Liu <liuzhe1@kylinos.cn> wrot=
e:
> Keep the configured burst independent of the current quota and cap it
> when CFS refills runtime. This allows quota and burst updates in either
> order.
>=20
> Fixes: f4183717b370 ("sched/fair: Introduce the burstable CFS controller")
>=20
> Cc: stable@vger.kernel.org

The change makes sense to me and it should've been like that from the
beginning. OTOH, it may break someone's setup, so I'd take it but revert
it should regressions be reported. Hence, I wouldn't mark it for stable.=20


> Signed-off-by: Zhe Liu <liuzhe1@kylinos.cn>
> ---
>  kernel/sched/core.c | 3 +--
>  kernel/sched/fair.c | 3 ++-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index f78275192036..5269b8cfcf7f 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -10159,8 +10159,7 @@ static int tg_set_bandwidth(struct task_group *tg,
>  	if (quota_us !=3D RUNTIME_INF && quota_us > max_bw_runtime_us)
>  		return -EINVAL;
> =20
> -	if (quota_us !=3D RUNTIME_INF && (burst_us > quota_us ||
> -					burst_us + quota_us > max_bw_runtime_us))
> +	if (burst_us > max_bw_runtime_us)
>  		return -EINVAL;

I notice this'd be relaxed rather like:

	if (burst_us > max_bw_runtime_us / 2)
		return -EINVAL;

I don't see in the current code that these BW_SHIFT'd calculations were
relevant for burst.
(Sashiko mentions overflows of the addition but I think it's confused
MAX_BW and UULONG_MAX or more precisely (UULONG_MAX / NSEC_PER_USEC),)
so even your version should still be safe.

(Without that stable annotation above.)

Reviewed-by: Michal Koutn=FD <mkoutny@suse.com>

--5sahav5mzexczfrn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCap7E4hsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIACgkQfj0C55Tb+AgafAEA/lDIyfoaL+fSg3OpnbzT
kKX5pkBVfO+FBzeCudKKlY0A/jVSRzj8PL3weJy/l9NmUY9jh/ilifk5nRv6Z0tK
K/cK
=kYvk
-----END PGP SIGNATURE-----

--5sahav5mzexczfrn--
