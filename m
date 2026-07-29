Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6337B47ACC6
	for <linux-kselftest@vger.kernel.org>; Wed, 29 Jul 2026 11:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785326296; cv=none; b=gepwbvMU6HGkOKRYZowiZHy0EUZvbZsFg++xMaDgl/MzkFkP62J3cvJpaeARXmAci7kBcCXmZUUh1Cll3L48BXO65pMchfofv3izToQr6CVbtPMpHhk8n9kkNyyKEP45k/xJhCZGf55YV88R4nvV/wQstXlRuigiLfqk5ItKfhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785326296; c=relaxed/simple;
	bh=fx28yLsjMFBo29GVE+42E8T8wzXSd5A3fGv+1jc5AZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HpO+zjPJO8aKqvle8eg4g3JcrAeGGaXk9xmToQ+vTHjweYCca8bGKqm+KmKWQdRpD0jAh4HbLjWL1QmFhMWibwIHN175OcGafzLTw0JstempI/J1Qn36mphABnvuoKUpgJ+PlBP3lRsQyAPgm+dyKMaI/3tvgC7TvTYWnR8whVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=T2h29NQk; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="T2h29NQk"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49558ce01afso5928255e9.1
        for <linux-kselftest@vger.kernel.org>; Wed, 29 Jul 2026 04:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1785326292; x=1785931092; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BsRdjuLA+dOXNU1jaPBvSl5joX+2y8GNdlad/t56tTA=;
        b=T2h29NQkmul440gqOJM7DuyUF0wG6AzhmgCdWl/fNu/JqUtfS5Kzjicjy6pKHRX9sT
         pBwCRGOukttuqBo9y9qPI3nktn6sy8cRiouGfVsl9d560TiSzSyM2CTBdxWk92PdEc5E
         1gBeiR60PgJtVO00fP+VKYiic/UmSMdRwGhRoECVRS1wZCguxB9CXsZf9CsRJ+6PCATc
         GmytZ5wtlV3qrLyA50S/nLC5PLdXT5BtrGBCk813vThTRfTwMmTNbXP+HEjnMvsvrBk4
         r14X1BR+PF9JsZueDb62KOKk/OeDNIaGSq5QpJNMcdiD1P63OWfPIVOrn06JKPq5We9N
         qHiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785326292; x=1785931092;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BsRdjuLA+dOXNU1jaPBvSl5joX+2y8GNdlad/t56tTA=;
        b=qtl86RZMXitV/uIhS2+fGP4rXmPuBD/fQGLeBBPIHVXZWeWS2b4kB60b0OSVr1aCeB
         pMqVTUDSL0WoQJAqnLDDEXMCCmsJnaJAQ5i0SDoNl8spaH+/MKsKnCkyu0nhMvVW42EY
         WxZWL8IUDQruKMV76MuWBTk+2WRKwdWOveEW7Ob5rjTxTSPnvOSNgSWRNra5vnhWIZKw
         SwbwqzsIJMxsvDn65+JbD+R6aysf2LV1jKDgRVJqWVVXkwxgATdczSDJdRAwf95maozW
         rKYLQD4rkRG6ei9BfPdwnMa7PqMEW79ljypBzK0ydg3EdHYgHMGCYVRHVJ5pNfbOgixn
         1fPA==
X-Forwarded-Encrypted: i=1; AHgh+RpHx4KAp9Ttbgj1XJ/pg1iSabQPKba4/db5X9F74EAtKC6Xkd6RB05Gyt37V7C34ciURZOv4GqlVijfqmll4Wg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPV8qMS3HpYdSyOhJ88eu6ce3UxxPubvWbVKTmKvF+OXhS/hg0
	Yr4ylSsd6YLRMW55dJwgq5R03ehaMyo7R9pMMXu7efF6KYKvPIwVQL86YHio9OUto0Y=
X-Gm-Gg: AR+sD13XzUtSDHEUKVX5EafBNlL9rWgs4GhXkU2D6v0eerJzTm/NFYUi4fG7YfxHm7w
	vrwuptwaqH3AGqksyT3jBom93bIuvp5YTLnQ3ZBjCoFDWzPGG7ELhsUturoV+/ncDMo2rMFKEwP
	oNCvh3w3LtkGUGpQBl4jWXqOT3jySK1NNnQt0HGyex0eh/gKqYceBbjJsOhkJJW58qo8CpsbNue
	4fs3bLeePv0+eQS/HfjZmX2GuM7slIXqhKkvr4FgGrXyTmGC9+o+8FReFJ3UJ3F572j14R5VhDO
	CsoccF0QpawQVXY8B4MZZPhIipn5reVHN6VrPw/Lk99jj7jyLJ3KLwnwC13ABLAT4OrwOJi3Uxq
	njLLRglAjl2TEdm3Z2SGWK1yVoP5+iJkkMWLRblaL53SPqva2whdyTyJeGMPhWiTKC/YGUjFd11
	1Fwqv5ic657Gs/FZjU0XAaITyLFrf58RdTHDK82lpS1c09d/v4pj5fpiTeQaHjkImRAXfqGXYPq
	l3L
X-Received: by 2002:a05:600c:6986:b0:495:6840:9728 with SMTP id 5b1f17b1804b1-496c659d6e2mr78781925e9.38.1785326292527;
        Wed, 29 Jul 2026 04:58:12 -0700 (PDT)
Received: from localhost.localdomain ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c45b1c2asm151064555e9.5.2026.07.29.04.58.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 04:58:11 -0700 (PDT)
Date: Wed, 29 Jul 2026 13:58:10 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Shaojie Sun <sunshaojie@kylinos.cn>
Cc: tj@kernel.org, hannes@cmpxchg.org, shuah@kernel.org, 
	cgroups@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] selftests/cgroup: remove unused user_usec read in
 test_cpucg_nice
Message-ID: <amnqUlrPxhTobE1E@localhost.localdomain>
References: <20260729100451.689458-1-sunshaojie@kylinos.cn>
 <20260729100451.689458-2-sunshaojie@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ifcqqrvh53udcnbk"
Content-Disposition: inline
In-Reply-To: <20260729100451.689458-2-sunshaojie@kylinos.cn>


--ifcqqrvh53udcnbk
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/2] selftests/cgroup: remove unused user_usec read in
 test_cpucg_nice
MIME-Version: 1.0

On Wed, Jul 29, 2026 at 06:04:50PM +0800, Shaojie Sun <sunshaojie@kylinos.c=
n> wrote:
> diff --git a/tools/testing/selftests/cgroup/test_cpu.c b/tools/testing/se=
lftests/cgroup/test_cpu.c
> index 7a40d76b9548..fe637e1d2fcd 100644
> --- a/tools/testing/selftests/cgroup/test_cpu.c
> +++ b/tools/testing/selftests/cgroup/test_cpu.c
> @@ -289,7 +289,6 @@ static int test_cpucg_nice(const char *root)
>  		if (!WIFEXITED(status))
>  			goto cleanup;
> =20
> -		user_usec =3D cg_read_key_long(cpucg, "cpu.stat", "user_usec");
>  		nice_usec =3D cg_read_key_long(cpucg, "cpu.stat", "nice_usec");

Good catch.

This test is anologous to test_cpucg_stats(), so the checks should be
analogous too, like:

 		user_usec =3D cg_read_key_long(cpucg, "cpu.stat", "user_usec");
 		nice_usec =3D cg_read_key_long(cpucg, "cpu.stat", "nice_usec");
 		if (user_usec <=3D 0)
 			goto cleanup; =20

instead of the removal.

Thanks,
Michal

--ifcqqrvh53udcnbk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCamnqzRsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIACgkQfj0C55Tb+Aii9gD9GGP+0pSRf1z4ITK+SOed
r5N8KWGml6r9WTyFcsoAvAUA/3ffWJbE9xPk9PpZcQa8oND7NB5OPWBG3a8zgEl8
JKAO
=rtSp
-----END PGP SIGNATURE-----

--ifcqqrvh53udcnbk--
