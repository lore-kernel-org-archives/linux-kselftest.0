Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D678C429034
	for <linux-kselftest@vger.kernel.org>; Fri, 17 Jul 2026 14:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784298218; cv=none; b=M0BuN6KfYP8C8ky42GeM8sSJYw2KgSbwkBLcCR+57rKaQWvP6Oc5wEQrdmiURyE8Nf6GihUerecRn3mWJKgnDft2VplpxjRWa3ey7d+RfomRKYUjn2jYjJ+/HIr/wajFa0bU4lvMrYs/6VfhsZ20T1m3usBPfMbTwQWBJRw+0hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784298218; c=relaxed/simple;
	bh=4z/ZM/kHqhece94DHAkgUPCmtAnBvKs9+ODADv3yvOY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qJ0dsvfwTGgfCMlUYBT2+p2/12b8HP2M+d9W1Mw8PbE1ZIXtcmsNE5o3RhhxTWcvmw5popfCd78F/b+p5uwnVHchwzlAFdaUqMpEZ37ICySl0sXStOrrP8oI+9G68oSw46EIFOE/G2Tk7ZZ71KUoYb2XntmTr32p9kaq+BHQfQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=E/tGOCcR; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="E/tGOCcR"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47640541585so3966449f8f.1
        for <linux-kselftest@vger.kernel.org>; Fri, 17 Jul 2026 07:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1784298215; x=1784903015; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g+lJSnUWG+oT4HrzrVhOyUY2HQo6Hr/x9ILN67HFaIs=;
        b=E/tGOCcR/dC3340a3c+GJcC5MHo3AafAhSrYJRgJ090aniN0AfFhSN1qfw22QWitGx
         50elmdfXs9y5bzJgBD7j6jgm8KYyg7Ym3cpGac4VOURUyhlNdu5ZPmHaBSuN5wnbigZ8
         BzNOITABSAYbpOTTOiOdPT7sa0x0wdSXE3wUKQIrsi4F6tmE6aIv07NGEUSPCziYtPx6
         c4Wl4SwRusafJ65kdRqcFD2Daolr5rnzNVpxL9DRYrN6A3ZsyzdULKP057QIKDxqGHCF
         CGsw3qbxDCbaoxjd/dHhuSO4W+w9CS5yqBc0is/UFlKWUMLnaqUbp8FIsHCuN3CtmymL
         tdgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784298215; x=1784903015;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g+lJSnUWG+oT4HrzrVhOyUY2HQo6Hr/x9ILN67HFaIs=;
        b=IfvR0HDZNN4DXkrlLevhl6bT2CDhi3AiwprjBvKmRgrJxXLu6kS0f8c05BLuBlZHCx
         Oc3q1xyx8QUTquVAzOZVIMKljrXTbJifzMKftnUZ48xTDndG5Xfda8Xo4mEv9A4ME2mK
         9HBZuL90pDk8DYZqsB5i/VN0dc/MnDScFcH6gdMAbULYLzOiISvC4eUo+mDHB+Myr778
         n8+bBQLkSH4VeXGnks29OexhqTJMCWzR60Q/1i8vE8EsjEt1oVXjTcU+O7xbASnAIOnC
         oRQMKWeVPumGNu461sZmfStFxg1/72ljEXFny8fyxY9C31Br0vRAv5+cXj1UP1pMNvHV
         TZzA==
X-Forwarded-Encrypted: i=1; AHgh+Ro1SqkU84a45j4g07my22Ib5uBHKqKVuLScWL5NDOQReYc35sgktzVtuCyAEK0tryhZH1ZQ7pFVc4Ewfdgr6fA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgJ7F9egi2lCqFmMWVCzzLltWRUxmpNzFC8rjiabQlLcArQVXe
	9zGONvqy4c4Up9nj033b7T3MpeODtwUe9sXID+ILQsmQ0ZX1mk+tx+Lq+LAOseciOSY=
X-Gm-Gg: AfdE7cmnudBQgmp18gg5HkK3h3BjOdInwaggVjgd5Z82lBBPL2OYnB/mdE17Jq1brXD
	Eb16eX7vI5fUJNYhi1fvH4a9Drx9Qrt/cnd+H2Rmrhhji12y1fMZpfmx/RBXJf6h+r8bndCCd7B
	vsgC7yB3tbAxgex5XFPQzZ9D0QgBPf9Xy6CDNTGwrNx5+9d4JstcUINbzbWwcVCQQoHqXjZA8o5
	JI1AwcCxFjJh9gZwH5POL3IJIP7ZusqPGXVd3yCUnlvUtoYIeJGUHexbnzibM/YqJ1Lz44ZOFS5
	+GfxRqQjyazMLlL4ctGCuqQhSfqGW3RrLt717FTQhhhmWAbnF4rFLsQoZu2imVYYTfYzyQfGE88
	Cw0BjRu/s0OXdxVGAwOGD3XbtfZzuODcdCMy04JcK1FKpZgkZ/6KbnentwpTKCiXJv3F8YZcipY
	RodA3Chg==
X-Received: by 2002:a05:600c:5351:b0:493:c8a6:b517 with SMTP id 5b1f17b1804b1-4954a51bb65mr23104385e9.38.1784298214940;
        Fri, 17 Jul 2026 07:23:34 -0700 (PDT)
Received: from localhost.localdomain ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2f210csm56209415e9.15.2026.07.17.07.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 07:23:34 -0700 (PDT)
Date: Fri, 17 Jul 2026 16:23:32 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: guojian <guojian@kylinos.cn>
Cc: tj@kernel.org, hannes@cmpxchg.org, shuah@kernel.org, 
	cgroups@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH] selftests/cgroup: Remove redundant cg_enter_current()
 call in test_core
Message-ID: <alo6hnNBA5qLAyGk@localhost.localdomain>
References: <20260717110606.298368-1-guojian@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dgzblnkfz736lsnj"
Content-Disposition: inline
In-Reply-To: <20260717110606.298368-1-guojian@kylinos.cn>


--dgzblnkfz736lsnj
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] selftests/cgroup: Remove redundant cg_enter_current()
 call in test_core
MIME-Version: 1.0

On Fri, Jul 17, 2026 at 07:06:06PM +0800, guojian <guojian@kylinos.cn> wrot=
e:
> From: Jian Guo <guojian@kylinos.cn>
>=20
> The test_cgcore_no_internal_process_constraint_on_threads test has two
> back-to-back cg_enter_current(root) calls in its cleanup path.
>=20
> A single cg_enter_current() call atomically migrates the entire thread
> group to the target cgroup even for multi-threaded processes, and this
> test creates no extra threads or child processes that would require a
> second migration attempt. The second call is a harmless no-op once the
> process is already in the root cgroup, but it is redundant and
> inconsistent with the cleanup logic used in all other cgroup core
> selftest cases.
>=20
> Remove the duplicate call to clean up the code. No functional change is
> intended.
>=20
> Signed-off-by: Jian Guo <guojian@kylinos.cn>
> ---
>  tools/testing/selftests/cgroup/test_core.c | 1 -
>  1 file changed, 1 deletion(-)

Fixes: d863cb03fc5f9 ("Add cgroup core selftests")

Good catch.

Acked-by: Michal Koutn=FD <mkoutny@suse.com>

--dgzblnkfz736lsnj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCalo63xsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIACgkQfj0C55Tb+AitDgD/UbuUiXOGtFpCCTZfBsMC
M5HjWGFJWivmM+7NPaauMaEBAI0kzQ5rIjnNG/LYJ9VZ1lrYudYi8kS/+vZoHGVb
IJgG
=wOvu
-----END PGP SIGNATURE-----

--dgzblnkfz736lsnj--
