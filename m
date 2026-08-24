Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E2EE3839A9
	for <linux-kselftest@vger.kernel.org>; Mon, 24 Aug 2026 18:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787596119; cv=none; b=eUtXr+JCHXYVGb3JydSv4AJ+ZIQKT47xRsT4KwVN5eeFbtNCk0BmEmyThomfoPa0xg6lPZH/8K/fJVsAiMHEQV1o8TlynNwAb9bvbwbdru+jMC0vh4Bghv7JdmBLBgv1e1U3fSt3wnCc26uE+2bnNMx8V5Og+6i8xOCZE9JmfDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787596119; c=relaxed/simple;
	bh=pZjnpozCibRh6pCzcosABsooXGmIcTuw9UHZgaIG8sg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MVHC2kWWvW3KA0c7UsfI3BmEdCFIF09Y3QLtzJdF7T1BpVS3mG5BFYV0gX+5A2WqmG/9LmcSbqavY3dtNKJuwBPZMyD3hqGDas8YPJbCjRwyWjxtHwg7SMZe1r6qqStPwgQHjIXzWyAI5tSAACvKsSrZ0bOhkJG0++jzw0MEHgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=BCWghTw1; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="BCWghTw1"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-698ae09e356so5400459a12.2
        for <linux-kselftest@vger.kernel.org>; Mon, 24 Aug 2026 11:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1787596115; x=1788200915; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ObNoYDIeAcOEP6J++OHusySEsVrjzWAA0XAeggvzDpI=;
        b=BCWghTw1lk6lvB/Mlw9mdrJfrWsyg4L6ppW6YKk4aGmABbDOBkfmJad/EInZ0Xg6Qp
         bSeEIZn3Wt8sIWTEXjEh/NMvJhN9dpVbtUfuG99VEMKh/QKUw+ddiHPghxh1REBXxE55
         Cc7lkl1IBJNHtX4mQYCt4hBy8wt979jWCMNrEuvhJ/v9Sw8uNQFl/ky/8+smdhTyfcrd
         aodgNEWmbDZHqB51zM8LusZy+yFrDjefbhfgUo+mt7DFYlqs1hA1YWBpeyK2zCQKVuaB
         ubt+CPZE7BV7GD9WdTlxhOEDNuJe8iLbgsqhSqOHqJr6NSGjeBX8eJ5aTQgZ5DNWEj4b
         9y5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787596115; x=1788200915;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ObNoYDIeAcOEP6J++OHusySEsVrjzWAA0XAeggvzDpI=;
        b=Ks/UOFIXBPeYFaHvlAB77oT0E1SZScKmRKypU7Xrvj0TDRPx/Yy0RmVofkiKd1XRLM
         oembS9rhBxhkJFL6xIPMDanM+ZqZOdn5fG3DanBcAVN6aiFnp88uuyAx6jnRKuskRYCe
         1zeVDapwP11H9hU4q4T33LK8qZOycf/dgfPgRplfLGw7VK2lV7eAF8tLJ94oH8bjJuwz
         /5hTmShQ/ZeVFDIdMLKb94RcYF7AKc10Oh3bkvQu6oXuDY4tlMyTdF+spmWapLof6fjn
         M85rwV3cxL6GEwV0VNSc8vqvp4Q610R8AZIgxIMuZ89e0VOpV+MnEOBNwCpGiqrHHMp+
         Uq+Q==
X-Forwarded-Encrypted: i=1; AHgh+RoQf08L3ef4Bjh4RhuwrKcuzBv67HI5lJVwNEcW1+thHL65nu47F8uWbm9rTmTaF2hiFAJZczuLbW9jEsEY8aw=@vger.kernel.org
X-Gm-Message-State: AFuF++kEIHpdA8FWpYhvwO/bcMhbRJJJkPSF7j+Bah9c7nwNoExqrLoD
	t6UlI1KMjFpTMBrUMQs2IH3E5fQwGcLcbFyiipDKOMGntUnMBhn/7EL4aXv74JQOh20=
X-Gm-Gg: AR+sD11CfBDUfnZG+Bh1KSjFOIlSpdvzlvIavSnrrk1gGVfpwS8sCz+YtEFq4Wi2OSJ
	oLDorNW245tAKAwE2bdXXqv4VbLcCW1sooSuOREtmljtXh5UJXu/CohMcx8PZG2QoKXgd1gdEV0
	MqpDAX+IUvcpqiftoV+CUFuD5XlC8psrSohK3jTSqXFTbaYXs99bIVPModz2gZWLASSfgPjWk4t
	Oj3HTXnb+8BJAPqs9XW2rVWXv6QJf+oWFxvvtLxMa3o3PKcZYI+oJq8P+KL71wsetPDDYtk0AK5
	2wth0vyd25M4wocKID6v5m9FjdjivByevYs3dw+e4J30lo5+oCUH0I6I7UC6Nsd16+7U6NVVyeZ
	wVka0iVE5J92Mu9CJiog4FmD6FJWr6UpqYLEDmnJmEIyQlDIzFgsT59rDIijg67CbtEgh10wV+C
	FbdUqAbmxH4rRTzUHUKn3mC0CCWyCr5Kvf+GfKsvxcgkLJBtsa93FvsA5zZMWI5Is=
X-Received: by 2002:a05:6402:270c:b0:6a3:ee5c:8800 with SMTP id 4fb4d7f45d1cf-6a42f1ac2edmr27546601a12.8.1787596114730;
        Mon, 24 Aug 2026 11:28:34 -0700 (PDT)
Received: from localhost.localdomain ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e2ddad2sm9454950a12.30.2026.08.24.11.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 11:28:34 -0700 (PDT)
Date: Mon, 24 Aug 2026 20:28:32 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Albert Esteve <aesteve@redhat.com>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v5 1/4] cgroup: Add dmem_selftest module
Message-ID: <aoyFYWYmocJkTeXk@localhost.localdomain>
References: <20260706-kunit_cgroups-v5-0-6c42c8753468@redhat.com>
 <20260706-kunit_cgroups-v5-1-6c42c8753468@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jo7e4siha6vyyr2l"
Content-Disposition: inline
In-Reply-To: <20260706-kunit_cgroups-v5-1-6c42c8753468@redhat.com>


--jo7e4siha6vyyr2l
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 1/4] cgroup: Add dmem_selftest module
MIME-Version: 1.0

On Mon, Jul 06, 2026 at 02:06:40PM +0200, Albert Esteve <aesteve@redhat.com=
> wrote:
> Currently, dmem charging is driver-driven through direct
> calls to dmem_cgroup_try_charge(), so cgroup selftests
> do not have a generic way to trigger charge and uncharge
> paths from userspace.
>=20
> This limits any selftest coverage to configuration/readout
> checks unless a specific driver exposing charge hooks is
> present in the test environment.

What about that
drivers/gpu/drm/ttm/tests/ttm_resource_test.c
?

>=20
> Add kernel/cgroup/dmem_selftest.c as a helper module
> (CONFIG_DMEM_SELFTEST) that registers a synthetic dmem region
> (dmem_selftest) and exposes debugfs control files:
> /sys/kernel/debug/dmem_selftest/charge
> /sys/kernel/debug/dmem_selftest/uncharge

Nit: I'd think about alloc and free (to denote meaning not how it's
implemented).=20

>=20
> Writing a size to charge triggers dmem_cgroup_try_charge() for
> the calling task's cgroup (the module calls kstrtou64()).
> Writing to uncharge releases the outstanding charge via
> dmem_cgroup_uncharge(). Only a single outstanding charge
> is supported.
>=20
> This provides a deterministic, driver-independent mechanism
> for exercising dmem accounting paths in selftests.
>=20
> Signed-off-by: Albert Esteve <aesteve@redhat.com>
> ---
>  init/Kconfig                  |  12 +++
>  kernel/cgroup/Makefile        |   1 +
>  kernel/cgroup/dmem_selftest.c | 198 ++++++++++++++++++++++++++++++++++++=
++++++
>  3 files changed, 211 insertions(+)
>=20
> diff --git a/init/Kconfig b/init/Kconfig
> index 5230d4879b1c8..6fab65d6b44ea 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -1267,6 +1267,18 @@ config CGROUP_DMEM
>  	  As an example, it allows you to restrict VRAM usage for applications
>  	  in the DRM subsystem.
> =20
> +config DMEM_SELFTEST
> +	tristate "dmem cgroup selftest helper module"
> +	depends on CGROUP_DMEM && DEBUG_FS
> +	default n
> +	help
> +	  Builds a small loadable module that registers a dmem region named
> +	  "dmem_selftest" and exposes debugfs files under
> +	  /sys/kernel/debug/dmem_selftest/ so kselftests can trigger
> +	  dmem charge/uncharge operations from userspace.
> +
> +	  Say N unless you run dmem selftests or develop the dmem controller.

Could this be made w/out introduciton of a new Kconfig option? (E.g.
what tools/testing/selftests/livepatch/test_modules/Makefile does)

(Maybe reword to insmod if you choose building the test module as OOT.)

> +static int __init dmem_selftest_register(void)

Just an idea to reduce the amount debugfs of boilerplage -- the testing
args could be handled by module_param_cb().

> +static int __init dmem_selftest_init(void)
=2E..
> +	add_taint(TAINT_TEST, LOCKDEP_STILL_OK);

Great!


--jo7e4siha6vyyr2l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCaoyNTBsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIACgkQfj0C55Tb+AhBXgD9EFqHG2oc6c8RRXssBXkL
BB8ufAhWQbaRdvcU6MVf4bMBAOTkkUnSkt63gDhS5BnZJH9A7urHiUZpvJb82kKJ
rY8E
=WvrM
-----END PGP SIGNATURE-----

--jo7e4siha6vyyr2l--
