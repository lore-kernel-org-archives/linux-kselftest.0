Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8AD5339B41
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Mar 2026 18:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773079629; cv=none; b=KccqtVo5jeZiw9L2tJl9zr40ASTUz1+fV37qEKxcp3e2iL6LGm38epAqSTxSm9UgTBeT/ZtrmYvN8SdH0mN8iuubtgO2Ur8wXl3ZuK7kXxVoGlrvgNg8br40F5uZcF9fOzP0rRUTg8ul4hV1M/9I3saaqE0P/GePu8OOrbHX+2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773079629; c=relaxed/simple;
	bh=MmljSQnw2lcYLsSo3FghZOv/9z9lThlxmlthDeAKQp4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J6x/PcY0UoWXLFlijWqQss7k82YseuhvXcsurQfbyFOZmqJ6dESrHwjItJmuCLxHfTW08zMqdH1Ngvog0JH5bt/jR3/ot3yhFnLqWtzk9T1M2zWXK5cKazfZ7efQEl80xB0EJHNKtxq3Wn4SGKCCCed/pkH3QaaKl0WfetvGpkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=D3SxbZGT; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="D3SxbZGT"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-439c9bdc1eeso2539057f8f.3
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Mar 2026 11:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773079626; x=1773684426; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MrfDzIDC5Rwkn3qiBzXUKn7XOVFFMBF2JI8saiP7iIE=;
        b=D3SxbZGT9Lz/X6NgZ1mHGvVazeFTqbOb+mX+TpTFjbUPJUZY0K/f/Cpxjfm/uOubGF
         Xrp5QMS93zFqoO8hkb8PLN3q5DdW6V6bVd3++6JIr4AOxVjZT1m9NyBj0ebk45rxlSZo
         e4cDAcDYIap7KFnDY8Cd1kqK9TsgzK/qdm5j0BJmqoNfCMJkUGBpFy62Xora3AnRWF4N
         PqsNb06kPaUoxdfoPl+pKNIuwXXUIxhJFXM4MQ5pX6ucOVrSS9Ta84tAbr91pEqYFRZ/
         r/GxtSS4K69EKQQ3MJ5FaMJSuEVN5vnsIb6b4p7c+/OPcawjwZXqIEIt7rn75plc7fXl
         IvQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773079626; x=1773684426;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MrfDzIDC5Rwkn3qiBzXUKn7XOVFFMBF2JI8saiP7iIE=;
        b=lJeLxVgko37aA+hBsKidtDpVHd03Eg8G5w0npG6tldoUwoO/jnDZd5FrIf+HLH+oJ2
         NRWksoNTNrLAVIQv8x5kYdSo2QNd1ElkpvP1RGLpamM6AtFQuEJw+MAC18mN5z44W54m
         RHJ0RsFxhrXPcQqcfbb4tmxdMyaoZRdEg6bXV0nzpA8e8pMtPAAQC/0B4PKG3QQo/zuz
         8c6hK8o9QeF4ebhJ7jacFL4V1YrMPDenaUC5T1yFxnZoAMA/VU4BAMc5jT/uSEcZ8Pff
         CgN9x0PxzOVxPMqXmCWHyujL4ZOhVkvGSz/HuORr6cU/jEc0F3meuQYWFId6t7bvjI3k
         D7Bg==
X-Forwarded-Encrypted: i=1; AJvYcCV0m8Fm1dWBNjN96nhr6cz0o6BQLO0RoxBdGBuFucuFWPPQA1oT5xwMxjGR68pQEwMf29F2k1efCTAC4IE3IDU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUc9oq5pXdOHw0Gks4ZlXNHIyhQEZ2+DPkHspmktYM1QFi0glV
	oAp5fd3zErK1HZTHIPp+1yarbMA2ZXTsAqPr+vmMvJxu4JhFp4eQUYZemoz+5SaXXzg=
X-Gm-Gg: ATEYQzzLdOPF3kXv8M7YpdKKagtWvNzZuaLSPrx3/Yv32GnmlK/ZB1LBcoGAJD+5BvP
	8guFt03RFl9gxHFWUg6OJXd9izYlTcDEIieiV9qjITc6hQe4pMG33HZ2lSMs5pqECLokI/93oPt
	LJAr8CSNNsyNV6uCLBvk7K6KPnPI0Zm1L6xIMtMCIgZYfrzrr3N8WUSa9U/8EdLxeOz3xcz1R6M
	8n9EpJvZfkuQzqBB2AKF01cwkbBhWeHb2Az8ECjtnT7tueSvfuR1XKoD1m/9oO9eMMD95wTbGjK
	9feNwTIYatiseyF41ZT1/FbcWQqrWTVMgXXmylI+lnirzENTLlys9JQlgpNJsmBvMvuX6Jm/X7W
	fb29eBiRv0tjoGlPYlQDkJIgHT6gW+7RE2JTTR/4HW1eRsv4EFfhgZKhsMPnO/VbsdBmJL4a3Ie
	Klsg/3jF899sbwIILHNt+P4oC7ffUN0mbZ1wXeMmTjCbI=
X-Received: by 2002:a05:6000:220d:b0:439:c43a:acb1 with SMTP id ffacd0b85a97d-439da67c0bcmr22231635f8f.35.1773079626120;
        Mon, 09 Mar 2026 11:07:06 -0700 (PDT)
Received: from blackdock.suse.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae2ba66sm24939422f8f.20.2026.03.09.11.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 11:07:05 -0700 (PDT)
Date: Mon, 9 Mar 2026 19:07:04 +0100
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Waiman Long <longman@redhat.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Muchun Song <muchun.song@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Tejun Heo <tj@kernel.org>, Shuah Khan <shuah@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH] selftest: memcg: Skp memcg_sock test if address family
 not supported
Message-ID: <4ddd3jascnb6nt7quhyjfmsgsmtfmjofwmnrgjktz57cfbfymj@6ejbdgbg4lz2>
References: <20260309160205.651754-1-longman@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yd53fwzzczbtgjoq"
Content-Disposition: inline
In-Reply-To: <20260309160205.651754-1-longman@redhat.com>


--yd53fwzzczbtgjoq
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] selftest: memcg: Skp memcg_sock test if address family
 not supported
MIME-Version: 1.0

On Mon, Mar 09, 2026 at 12:02:05PM -0400, Waiman Long <longman@redhat.com> =
wrote:
> On systems where IPv6 isn't enabled or not configured to support
> SOCK_STREAM, the test_memcg_sock test always fails.

I think IPv6 is not substantial for the check...

> The purpose of the test_memcg_sock test is to verify that
> memory.stat.sock and memory.current values are close.

=2E.. so this should work with IPv4 too.

> If the socket() call fails, there is no way we can test that. I
> believe it is better to just skip the test in this case instead of
> reporting a test failure hinting that there may be something wrong
> with the memcg code.

Yes, the skip on (any) socket creation is also (independently) good.

> @@ -1460,6 +1466,9 @@ static int test_memcg_sock(const char *root)
>  	free(memcg);
> =20
>  	return ret;
> +skip:
> +	ret =3D KSFT_SKIP;
> +	goto cleanup;

Maybe make this analogous with other cases where there is no specific skip-=
label but

	if (err =3D=3D EAFNOSUPPORT) {
		ret =3D KSFT_SKIP;
		goto cleanup;
	}

Thanks,
Michal

--yd53fwzzczbtgjoq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCaa8MRBsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIACgkQfj0C55Tb+AjPoQD+PmjLLORgemm6L6Wd7y1R
hoB0caqu50AlVSz1SKP3ThsBAP+AO9l6EzSrSBWNiUV7LSV/NsXeLyrdxjriU91M
fVEL
=GNSq
-----END PGP SIGNATURE-----

--yd53fwzzczbtgjoq--
