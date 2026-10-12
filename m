Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79BB73B52EE
	for <linux-kselftest@vger.kernel.org>; Mon, 12 Oct 2026 12:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791809117; cv=none; b=TUjbu2plqcdHUB46ux3ySw1g5i8vkzd8huaDcUa5yG49xR0NkcOw50qbaQ2YQCDBAet6hxfcj920c8iiDo1nYyd5BikVHWlruAkSXt/OEdRJb1CWVij/j/wUQfoWYq/uh9PqBKV3sSSMr+jd7QNkMusTgcEH7mLKCEirfREEHPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791809117; c=relaxed/simple;
	bh=Bvm8tSdfsJWIwE5zHlPE8PH2QA6rnOT5LTtUAz4GQ9s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=akwhG+qOA790nQybvKbpAFASlEthOHcD8gJX6eojN1pIZcDCyM8ppHK3tq4xxES/LG5rmixDgwDmNZ9xmn3IytNWwAmnMeSxTsMXjWkr8JbRiMXYqb040YTNlj9hJ3AIfteTmU4L2yiWIBVWGNfadCTResHbFRE9GCc/7jDPH1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=dAl4mdt9; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="dAl4mdt9"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48dd33a7bd4so255105f8f.3
        for <linux-kselftest@vger.kernel.org>; Mon, 12 Oct 2026 05:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1791809113; x=1792413913; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pxDcCA7hpgDYYxgdhqPc+1ZwblatM2CFgvbhhZn3Nj4=;
        b=dAl4mdt9oQ/OywhYf80OcvYcnn7KgFK76YiXV9dZf5GYWouqbUp0uHBMdlB3ODXdSF
         Ijz1XFN/qvwlKXd4rYtoY/8zG0NkcwkogisM+w51lYQKz3QOzNiJqaK+wK5UwB0ca6mE
         Z2z+lMvfajfn4Kvi/lS5YgqhzCeO+C/FxDg9JMnl8GuzDAzlljd+0SdpiYSltvUpPSQz
         4GFnCxWwEuiqEpvxD5iyxK9ptBS46qnE2UpjHbXLpJWy7ltx6SXAQT1+pYtzMjJ5vLMa
         OqVQ09JUjLoCC8wVTn8s2w+EUlFBBT1QEQiRelEqnraLqm5z3tpYy+g5Lk9iM6i1ZRGW
         83Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791809113; x=1792413913;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pxDcCA7hpgDYYxgdhqPc+1ZwblatM2CFgvbhhZn3Nj4=;
        b=yNG6NQKzZbNHYTbNQ8YKZZMdt7ikwzs32PiznDgL/Bw8/SyI1b2glTyvZIebcHcWHX
         yMre1YHVbVunTsSxhlKw0elg0BXsX5W8RTrYWmeUMEXxtiDuW4ij40F8K/Uv/1H6ySOB
         ygMa0+mHDpF4SiC3HWdxZ7rc3dcMiN3ikXf7stKzo9dUK3UqgsqeUvYjfEtKhHKCzpZa
         WD5NeUwW/GvDs7gqSYKsZH0IKYfdW7rHVqTK1HjlFIOFtG3+I1XYEeJ2DiwAcqaBowkS
         H1DK1tDQxYpJQf9kLJ1cgh+twevJXapFKskZEsr3uPP3RG7J3vP5cfYYvTscdV/u00bD
         CpJg==
X-Forwarded-Encrypted: i=1; AKwUvByBCT7H73CM21hDRwbJWV8qzKqXPts2Uz8YOye1FW5iAdSA9AqosQZmf/SZW7YXlZr/9vf17IfLsvmpa6rO/aU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1+CCCADJeDpeKoqWMohh3BjsDmbVjwt25ynDASYVy1wS6LNyc
	afpBCQgRVqBkO0ZbQgjBWgw3D/8XrmMSO4qiSVT/a/GOWmT5ywKja98ShWU/EmzslfA=
X-Gm-Gg: AYBFou3LfNMKQeR4/mU5anwruA5GLHjgugKHp+JTs1EEtYRndxHO4oYK8GNQb4E0/Gh
	m4ZZZNzH2//wwB4TccQnW1525KQUzhOru7dEfDl8/FjdO7HoWk2b/bR2bGZ5PsfN+AaJOE1/2Iz
	OlKPaFRZ4Rn5oF91j080bMJUJmqq5e/8ef4zzplFAec+Jttdq17xlEZOCHX3TNQlJyzIP+yLkDk
	v/pRSYBy7TYnzKNIPPprH1U8PyqftDkPuu7Wpohhi97GPxKg5lEVPpshg0xMU4E6taT3TyGpVBw
	09LkzZRZeBeyNMqgpdVdvl2ms6JraG4pehgRSltgBI5preX35dQeR9Neepie6vkkAgduP3htG8J
	UuE8jrv5VN6ovEYb40gqfJZ07RMm91zFPRaxW8tTDMUHzWghh5L/u3RkqtVbRnbi+KUViLLMqAN
	wnPUe0aqMuxuPIFq7NtvJJvjA/wgmyBExUFzo3R31K2zE1xXo1Iyy3XWDZFokD8kkJS1pVcVEkm
	g==
X-Received: by 2002:a05:6000:160e:b0:487:27f9:842 with SMTP id ffacd0b85a97d-48dbace9d4fmr11992821f8f.55.1791809110413;
        Mon, 12 Oct 2026 05:45:10 -0700 (PDT)
Received: from localhost.localdomain ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9ac02cfsm18344889f8f.39.2026.10.12.05.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 05:45:09 -0700 (PDT)
Date: Mon, 12 Oct 2026 14:45:07 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Sasha Levin <sashal@kernel.org>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Shuah Khan <shuah@kernel.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Muchun Song <muchun.song@linux.dev>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Amir Goldstein <amir73il@gmail.com>, "T.J. Mercier" <tjmercier@google.com>, cgroups@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH] selftests/cgroup: free the paths returned by cg_control()
Message-ID: <20261012-grumbling-spearman-3a313ae31198@there>
References: <20261011223358.2327625-10-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lgnee3ewncxbl2us"
Content-Disposition: inline
In-Reply-To: <20261011223358.2327625-10-sashal@kernel.org>


--lgnee3ewncxbl2us
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] selftests/cgroup: free the paths returned by cg_control()
MIME-Version: 1.0

On Sun, Oct 11, 2026 at 06:33:38PM -0400, Sasha Levin <sashal@kernel.org> w=
rote:
> cg_control() returns a path allocated with malloc(). The two callers
> that pass it straight to inotify_add_watch() never free it, and pass
> NULL to it if the allocation fails.
>=20
> Keep the path in a local variable, check it, and free it when done.
>=20
> Fixes: 5313bfe425c8a ("kselftests: cgroup: add freezer controller self-te=
sts")
> Fixes: 2de27980e1d46 ("selftests: memcg: Add tests for IN_DELETE_SELF and=
 IN_IGNORED")
> Assisted-by: LLM
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  tools/testing/selftests/cgroup/lib/cgroup_util.c | 13 ++++++++++---
>  tools/testing/selftests/cgroup/test_memcontrol.c |  9 +++++++--
>  2 files changed, 17 insertions(+), 5 deletions(-)

Thanks,
Acked-by: Michal Koutn=FD <mkoutny@suse.com>

--lgnee3ewncxbl2us
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCaszWTxsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIACgkQfj0C55Tb+AjYAgD8C3rg4DsOngu0tGcoEsvc
5NuTbUsIxMtIYR1QnuiqLKoA/2ZVZusoTfiU4S96kRaXYt4cG9+dSPS3Il16Cshr
GREF
=nNP1
-----END PGP SIGNATURE-----

--lgnee3ewncxbl2us--
