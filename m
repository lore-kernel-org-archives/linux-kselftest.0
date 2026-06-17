Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A7D3D9DCA
	for <linux-kselftest@vger.kernel.org>; Wed, 17 Jun 2026 12:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781699315; cv=none; b=URQckob8OYTGm6yG6IN336EaXrYlemwat6hNUvOJxKxQoxMyhAwOFBBGev4dLN5Wz7kfxkf7EsSl+XrI3PfTJxA+9uTDPx1qz6DDGgHb9sGVqPbMy9wo6IVwkZ1ho87LWpKur2JPpfcvB3viUkEpmTzoaLQVIoq9uYhcl70yio0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781699315; c=relaxed/simple;
	bh=KdBoKWDASaJZcB8nsJefnRNH1Bw/c7zkoLeSLSrghWc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AFdOp2V67no7oxi5FU8x4QkqcWzIIodV6OGM4xU/ENFS9ViL+6ccKLKhRvY/uqgUpGDmGd2Xp4moLTkPdZ4GypjZAcIeg3+hmzO8vMbDqwd5NVpzl9lEn460E3pwcDHgCiFGB87WKwlFihmGPOuRS0bJK30vw4QAN9IQ9b5Oq3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=gUe/ai7P; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="gUe/ai7P"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4908b92904fso70983265e9.0
        for <linux-kselftest@vger.kernel.org>; Wed, 17 Jun 2026 05:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1781699312; x=1782304112; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MM5qR7HnQsV8ihoP5sIjvhIawDKg/qrSVM0NHkgkEXQ=;
        b=gUe/ai7P3AYkIhI4hobkAJTpgSYK4m2N7PUpwlrdre2EwW+Yi4GKGUQutbOfGVBwBY
         nmxqSoalQ7nd40QMfjETk7qI4SP8d7YtSzR18Q9P280m2FrhDN8YoElCUsdpx77AfTq4
         HIIy5VoFDNNBUVRTDUfWNOilEwHZs7y9aSTJXNrs6myHx09Jx9RHJbfczQUIUSFMUgo/
         ThP5e9/+6Fb87VI0OdlEG6+xkP4g4Tj1PaHOFbwR6/vabp8+ma62bJqDtJmUd5/By5IO
         31BEQhIzpHilkJMZyEjibDOYqla4W0rPGiKDTzJh07Vhq0lY96hZ/m0vveK3OYjpcSdg
         hFhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781699312; x=1782304112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MM5qR7HnQsV8ihoP5sIjvhIawDKg/qrSVM0NHkgkEXQ=;
        b=emMlfQZoZDZmy77fd7GQNx5TH/cT+BDqdtcpGcbvLei2fzTfInOcKGr0/fXOByvUdo
         gpbFzQVc70Bwyih5V1Tx/roOR89vF2QZU6+1gnLNLLTfokPLoAQ5vmWrX0DpMV2CabYy
         hjJQza4KtpFDcrvImi95NEsHbl5xcM6dm5GzZcnUviHB5+DD0gMzSOEmY/7vBBm/GCxk
         mrqB6pwGuIU1OfKxpAbkNAn04uxRB7XDvT/B0RN9FSYqWmzjLLaywlhdJ+F6ZBJLLbk5
         EPLvnQ/8ilDhVm141SUnu8dg+GolehLVJ51aCN1GBZLYbxO9JODkHev0a8avjTwTS+ql
         JjNA==
X-Forwarded-Encrypted: i=1; AFNElJ/y3befdsy+IPECQZZbT7W4gfyvZBVpKQ/NZHxFlgXTxDcJngKe1JhmefAAzGLb9vBlzFuyrbEwbop4FvhEUEw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqUeknd9hV3di6BtO8Bu3x0/RgjbZ9InoNJSeMnnBwbgeSwt4A
	9RW3VPoljlJeP3dIOiKwuZiDKfk2h3fqYQ2FQwlBStd+xK1vOcm7VsQRiRdtQTOB0Kk=
X-Gm-Gg: Acq92OGsiiNG+sTOSkvpFa1mtdDzs9vtY9cpuBplC6dRNSBGJcS3aGtapIMgHcPhDoY
	2g5UQUBDNSw/qqGJixhfbtGXR3XPwvLRRBWPaKwh21EljpKlJ7mLOiOCtQh0/S7gqi/nOOAzzx+
	dZjYri0r8jIn70uM01/Vt+wCo12yyKx+jCOSBL3dUorMuTaxHN14wqMcbjWIL3edNRrw133XVe4
	HhPHhlzVxSXZ8NoOgWmW9AWkEkXrAVPwL5KvGi/kgZgTK2cPPvzkASoamJHXbdiqk6vuZHToW89
	2TrWJ32X0h/cpql1eXNkWHPuUtIsr41QCRr+NDEIayqptoT9gx9pa3mtiy960Ld++RuTG+qagXH
	G253shQaPDLGMuIODU8Zn/LKjh3KWjI5KMolXrjT0S1HBCYidSVK3QsyN0/ZZyFAmHRI3ez3sRO
	Uc5cROnKb2VJ65QXlHUg==
X-Received: by 2002:a05:600c:4644:b0:490:9d1b:f06a with SMTP id 5b1f17b1804b1-4923410388dmr30618225e9.10.1781699311826;
        Wed, 17 Jun 2026 05:28:31 -0700 (PDT)
Received: from localhost.localdomain ([62.77.90.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922fa891acsm160948085e9.9.2026.06.17.05.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 05:28:31 -0700 (PDT)
Date: Wed, 17 Jun 2026 14:28:29 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Li Wang <li.wang@linux.dev>, tj@kernel.org
Cc: akpm@linux-foundation.org, longman@redhat.com, 
	roman.gushchin@linux.dev, hannes@cmpxchg.org, yosry@kernel.org, jiayuan.chen@linux.dev, 
	nphamcs@gmail.com, chengming.zhou@linux.dev, shuah@kernel.org, linux-mm@kvack.org, 
	cgroups@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 0/8] selftests/cgroup: improve zswap tests robustness
 and support large page sizes
Message-ID: <ajKSrZ5xBAj8lquy@localhost.localdomain>
References: <20260424040059.12940-1-li.wang@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4yjtviewjv7h5rrp"
Content-Disposition: inline
In-Reply-To: <20260424040059.12940-1-li.wang@linux.dev>


--4yjtviewjv7h5rrp
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v7 0/8] selftests/cgroup: improve zswap tests robustness
 and support large page sizes
MIME-Version: 1.0

On Fri, Apr 24, 2026 at 12:00:51PM +0800, Li Wang <li.wang@linux.dev> wrote:
> This patchset aims to fix various spurious failures and improve the overa=
ll
> robustness of the cgroup zswap selftests.
>=20
> The primary motivation is to make the tests compatible with architectures
> that use non-4K page sizes (such as 64K on ppc64le and arm64). Currently,
> the tests rely heavily on hardcoded 4K page sizes and fixed memory limits.
> On 64K page size systems, these hardcoded values lead to sub-page granula=
rity
> accesses, incorrect page count calculations, and insufficient memory pres=
sure
> to trigger zswap writeback, ultimately causing the tests to fail.
>=20
> Additionally, this series addresses OOM kills occurring in test_swapin_no=
zswap
> by dynamically scaling memory limits, and prevents spurious test failures
> when zswap is built into the kernel but globally disabled.
>=20
> Changes in v7:
>   Replace my work email by li.wang@linux.dev address.
>   Add Acked-by: Nhat Pham <nphamcs@gmail.com> to series.
>   Rebase to the latest branch (only one tiny conflict resolved).

I think the patches from the series where I had no special remarks can
be applied already (and base next (smaller) series on that).

Michal

--4yjtviewjv7h5rrp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCajKS6RsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIACgkQfj0C55Tb+AiRWwD7B006DcY0x2F+2Sbw4j8K
IZEESihg3ZPEkA+MdYeum5cA/24UUIQFp9j85Oa50uzT0iUVL6FumNyKNhH7lGIv
0IkF
=0L1g
-----END PGP SIGNATURE-----

--4yjtviewjv7h5rrp--
