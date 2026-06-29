Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7811A3375CB
	for <linux-kselftest@vger.kernel.org>; Mon, 29 Jun 2026 13:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782741498; cv=none; b=IkBTL27Uv0CnpewUtJdrC9t6ItoukLqCSbFkplMLBXrF/1ioHFQDn3YViKEfxwJYMDBq16GJBOizquhKVTrlUrby+E7HyaQBzMUwahB0w3+3lNuOEfeyndzihCwnAx9Btkb6E1L6c88SnzqnQjWAt8i3aASz9NZAg//paSL+UJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782741498; c=relaxed/simple;
	bh=DRlmXZWlqten3MVGfQOjEdiIvKTFdBlls6hAAo2eRQw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ho9MSwFvxPc2cnJEFPvvQfjh/HH0OH543U+l0V4dyg6lykibFVK+hRpKlCklaZEXEWWh8ocAlqfdfj+WrAIJeFWpJbO/vgXpfE1EnIC2Au+mN+AdAa+rdaw3M+G6iONnZZzwGqnpEM+L6Tza46OLdnmpiTGwFWXqKZnFpnIMpak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=SOrBkV5R; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="SOrBkV5R"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so25368235e9.0
        for <linux-kselftest@vger.kernel.org>; Mon, 29 Jun 2026 06:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1782741496; x=1783346296; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ckhr+A9zr+J32IrfHMZuetYzQ2uESKh3SuZ//glpMWc=;
        b=SOrBkV5RO7dY46sIQOMdJrjS2TpGNIsgmpzuuS66MU3wV6sA35T28IiB7l9kQo9O6A
         aKVFI1s1L+E1cXJlaNbkxBo2oQwc14SBECLPYfBPS/mdSsSiaLQFijSUzEq3Z9ByIC2C
         9NzfT8CEVicXMj0p3Pyo148YnaGD8kgxX4vFxmZ6Cpjhlr4rAS+BiN0ahFbB2dtpDo/3
         vlvTRfHsLcFSAO3YKnUMSEAm6wC1738SF5zNZbJAEnWPYNDmfMnvOpgvXVsylX74p2OP
         GqMpN5Faa0jgVUC4k7I616TlCfhGFqMjoWBMjc+KSlDx7nhnGmq7Grdbj95qzQLixqJj
         5tIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782741496; x=1783346296;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ckhr+A9zr+J32IrfHMZuetYzQ2uESKh3SuZ//glpMWc=;
        b=dqXeK7+3lQRFGY36r626lsXjEGBlpvjD3L49PqLjpN7Kc/n14e9SX4NdZvNTQIIFOb
         T2BWbTZ1oIPQgBO2CsMTANdYU1e2YX5aQJKuU78spavWG2Ysk5iJNLPHxm0+p8VovOBf
         6VMpz/pY0405veCh998/2IYIsYlEodk/f11TN8Vvwebf5uatmcx3QSscL2sXw/C+5W0L
         sLmTHKzjuFAOZOYAPUOl36aFdG6Yya0O+ec16gIzeFRNvKMPSClh9gg588wD6CLVK5Qm
         f3XHU7PKwLgNqY9XayH/CPhHWD5NjOYO1VTYmMrnXncSPOD3u4LNIPJ96gDaw40h2moK
         m8XA==
X-Forwarded-Encrypted: i=1; AFNElJ9G5fadIWlTmJl9Nd3xJiyaXf4vgT1PATb6QvSp1dqAtQ8u6y69dDGGT8AFsccBKTuwjZkfJ7850+qeP8PRR2E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIlXGRM0P3jXZ2S2xt9v9ERvWHPqM7/wVUI9wnfMoYAbGm5tz6
	sItfjT/TQnslG3R4632ZcJVIkLM4cpVEzah+5Bf40us80S7CzKoaQUEtS3+gbqNlwz8=
X-Gm-Gg: AfdE7cmWPYc908jrQmozrz6S2QerJJBlmCU+ue/HPyqcNYYB/ZTvW0X3mv258/gFbRC
	mf4OJdvpK1U7gLmgLo0mYRf3YWLpFK84nKTCZV1Ru9xdFxqd+SW7MorXqU9ACsUZ2Ih1gA5gRdF
	AgfzxVS0qXexL6nkHlbuGS60Qw3Ac/cZcSLDutz2SwG2zOiL7wxe2EQlzmoF/t3b1x91P290nK/
	gvxzUm6xXPnb4/xgiAeKDjnbNd0u+vT4RVEoAdjiFvjSEVRIJs3j+K5glp7xg4WEAqgSRrZfccV
	IDE0gueslpIHDxzAHvzCJ2os1H0kAShNKHLt18A1oxO40GIaWnpDJ4LXhBR4Kq7ojl79/Y0/u4c
	fkEjuxgpclghf5mxX4R7VE3cZb6vSWQC8p4ILpVNivOzHTlocx20kLw/quw9acv30zP50lQ0fXC
	DdZqqfGTonsmtbuAiELQ==
X-Received: by 2002:a05:600c:c045:b0:493:b6e2:1b10 with SMTP id 5b1f17b1804b1-493b71cfff5mr11334205e9.31.1782741495906;
        Mon, 29 Jun 2026 06:58:15 -0700 (PDT)
Received: from localhost.localdomain ([62.77.90.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46efd7ee1c7sm41210744f8f.14.2026.06.29.06.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 06:58:15 -0700 (PDT)
Date: Mon, 29 Jun 2026 15:58:13 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Joe Simmons-Talbott <joest@redhat.com>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Shuah Khan <shuah@kernel.org>, cui.tao@linux.dev, Andrew Morton <akpm@linux-foundation.org>, 
	Nhat Pham <nphamcs@gmail.com>, Waiman Long <longman@redhat.com>, Li Wang <li.wang@linux.dev>, 
	Sebastian Chlad <sebastianchlad@gmail.com>, Guopeng Zhang <zhangguopeng@kylinos.cn>, 
	"open list:CONTROL GROUP (CGROUP)" <cgroups@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5] selftests/cgroup: Adjust cpu test duration based on HZ
Message-ID: <akJ50VywgMXHvOqI@localhost.localdomain>
References: <20260626202925.1527524-1-joest@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wt466z5oxdyad3x6"
Content-Disposition: inline
In-Reply-To: <20260626202925.1527524-1-joest@redhat.com>


--wt466z5oxdyad3x6
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5] selftests/cgroup: Adjust cpu test duration based on HZ
MIME-Version: 1.0

On Fri, Jun 26, 2026 at 04:29:22PM -0400, Joe Simmons-Talbott <joest@redhat=
=2Ecom> wrote:
>  .../cgroup/lib/include/cgroup_util.h          |  1 +
>  tools/testing/selftests/cgroup/test_cpu.c     | 43 ++++++++++++++++---
>  2 files changed, 38 insertions(+), 6 deletions(-)

Acked-by: Michal Koutn=FD <mkoutny@suse.com>

--wt466z5oxdyad3x6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCakJ58RsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIACgkQfj0C55Tb+Aj56AEAm/33THJwKq5HqIo/Mzwa
CFW+wEvcdsgjuF738rboa9AA/RVyfUbxEbsIOftbmrLOKpSy+Qoe4nC5z6afmoWu
a60J
=9Dss
-----END PGP SIGNATURE-----

--wt466z5oxdyad3x6--
