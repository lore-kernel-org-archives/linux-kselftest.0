Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1214F318BB5
	for <linux-kselftest@vger.kernel.org>; Thu, 20 Aug 2026 09:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787218047; cv=none; b=WGWEzwes+Xg4HBxKOpC3RWuAh1217Dwou38sxa6C79BlUCRZ8e4B4vItYwA0MyRRlgh/qZX/mCPgODJfiafO1BxJ2nTQG8bAv+YH0VJvn2jlMNU/46ifeEqIHaNJWhEbTwSFvXepDWPRfUgCdWiRfVngCD3AYJjKRH3dRdch+oY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787218047; c=relaxed/simple;
	bh=Scs/yfMT1Qt6xHXiv08qF9LC5VYwbtCPsFLZi99I6mI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ev1a2t03NHby1nnUBq1NMAwNZYMKepDHJ6akHCyWlPpo3chZ2mx826OxlE7IY1tRZfuXeuU0Sd3jmuOEw5KYBajPwCD+VGfziZfmpWPMUtAnIBPtsKk2VuJGx3K98/U7X2oGiE6YhhgsUNZjb4r27XQL1Epjlq3wthqkCEwu/O4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=I1mWtRfK; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="I1mWtRfK"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-495590dde14so23103635e9.0
        for <linux-kselftest@vger.kernel.org>; Thu, 20 Aug 2026 02:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1787218044; x=1787822844; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hMskdTdkeMRGiYIbEal35ckaJbDeYchkDIOfTGopKXE=;
        b=I1mWtRfK3qt6Bb1ohKe9M+B8loMX/4FzelrYufcII+va9aoImsod/r+wyRgYY0j0qQ
         NsE0p1KldUD6nyDGBDpOkhsDvLghhdiQeFzm3H14KELbJWMqTDKhguWtsjwcCWTEsk2i
         k5/BZGaYSSiCv9pEAZFsdgACaT3FppeJ7r+64JaMXSdjoWe7W9bm6PmVH/VDPzbPmXQB
         497ZCh7wVHi0qI+xKTG2TSVqgKHxFpTmkj3vH9pQIZ2FTSwqDa6QYCyhKrnZAuIU+ZrT
         NPzJqok9n20mjAGzX+KWK/f8l6P0GXNm1I80wh56GcNMxaLhxfXXq+sIvuOIZYL0x5+/
         LpaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787218044; x=1787822844;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hMskdTdkeMRGiYIbEal35ckaJbDeYchkDIOfTGopKXE=;
        b=ir+8WvRD/b8TnZAQ1OT8WqJCtUvd1nQ0ZrQIrmYLdJvY2fn/kxh7kI8LBXARZzUmDu
         ibS3GHM8TL4RUroUtU+6cdPOcMDq7sv6mtVRvHCYkeN/KFGcc4wxMASA9XpGLFpCOijI
         Y4+ajMHHXxuVJNhTIq7DFqqyqjRRVolOd4GSwJjX8mldBoisukhziePWTfHX1Q9EABOt
         3RRAVUp3Yz790mTm5sT6PMjU7CoIkco/jvGNV7+DhrrnOu+ZplmPFhlRcIFMyek3OfTQ
         MZtfUunkqbOkrZx0DQlC5xMaajCVfOlKYRPG51sCSb1LMBCEiiN0o967HEE0erWOf1ix
         5fpQ==
X-Forwarded-Encrypted: i=1; AHgh+RqzT3l/KP11C18W1WCMnE+RnPX5iHdXkQDeE0t6nhr/s4q9NY2hKDhRjSGQC5aMzoMXsUII+iv5IMc+AcmM5p0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPO0+1WXN178LO1cRtvjU0qhaRHdj1aFPrx0c7pUpg/JnELQE2
	CvGs8NrX4AKgehUsQzJOIN3sx2xFoVR35tDvXRHle/2MYIBTCEjJcp72xQSj+2fbrRxLoFyZGtr
	oNWYRqH4=
X-Gm-Gg: AR+sD137O8b+H6FHCOnSDijxdJphd/ljfHoDI7wM1A4hhnCa+ohyVrymz4TqSdLl1Y8
	jOQEnO7pQHu1xiSdtj2ekW9NwDb7+znfySk0GqTb8P1pxM8dNKZa8s6CPMcQxkdENyiPvwnFL4q
	X+c65wbgg1BMZBcs2VdVg6JmF5xOMzcxcX6vTj6FqshgzBd4nMC3A1NMSEPk2FbDPpTwwdglj+s
	jsQia1HxhBk894LiG1V2drIL5wjJsc8IMwDM88s51exJEEMxt8wMQy0BpQ42GZb5qZc19CJyIxZ
	GaWJkcr6zTsdNzdTg1okC4F3CAu9O+obnQUwuuIMAv7eEcKcQFBPZ2nIS6+VMCIMrzqZ4d3yOh8
	MxCZezW6VfVBsuEdl+pIM12dpCg8g8921CXqSY0mdg66Fk2JP/P1BFvg06WHINzMJid6ciqxvjl
	TkInevl0vA6gVE8NrxTwpn5O2kwAizeX10MEvOyGOB1M8x2Oh+tJPe4wqw3Q09MW0=
X-Received: by 2002:a05:600c:c167:b0:495:4d00:2fda with SMTP id 5b1f17b1804b1-499aa143546mr214370055e9.2.1787218044328;
        Thu, 20 Aug 2026 02:27:24 -0700 (PDT)
Received: from localhost.localdomain ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499a9e805a4sm144983515e9.4.2026.08.20.02.27.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 02:27:23 -0700 (PDT)
Date: Thu, 20 Aug 2026 11:27:20 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Hongfu Li <hongfu.li@linux.dev>
Cc: hannes@cmpxchg.org, mhocko@kernel.org, roman.gushchin@linux.dev, 
	shakeel.butt@linux.dev, muchun.song@linux.dev, tj@kernel.org, shuah@kernel.org, 
	akpm@linux-foundation.org, cgroups@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, Hongfu Li <lihongfu@kylinos.cn>
Subject: Re: [PATCH] selftests/cgroup: Fix cg_run_in_subcgroups ignoring arg
 parameter
Message-ID: <aobIWjGwusjSzvBn@localhost.localdomain>
References: <20260820070944.31451-1-hongfu.li@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5mgqyivtgswggrj3"
Content-Disposition: inline
In-Reply-To: <20260820070944.31451-1-hongfu.li@linux.dev>


--5mgqyivtgswggrj3
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] selftests/cgroup: Fix cg_run_in_subcgroups ignoring arg
 parameter
MIME-Version: 1.0

On Thu, Aug 20, 2026 at 03:09:44PM +0800, Hongfu Li <hongfu.li@linux.dev> w=
rote:
> From: Hongfu Li <lihongfu@kylinos.cn>
>=20
> cg_run_in_subcgroups() discards its arg and always passes NULL to cg_run(=
),
> turning the (void *)100 from test_kmem_dead_cgroups() into NULL so no
> allocation occurs.
>=20
> This makes test_kmem_dead_cgroups() falsely pass without exercising the
> "dying cgroup with charged slab" scenario it intends to test.
>=20
> Pass the arg through to cg_run() to fix this.
>=20
> Fixes: 933dc80ec262 ("kselftests: cgroup: add kernel memory accounting te=
sts")
> Signed-off-by: Hongfu Li <lihongfu@kylinos.cn>
> ---
>  tools/testing/selftests/cgroup/test_kmem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Good catch,

Reviewed-by: Michal Koutn=FD <mkoutny@suse.com>

--5mgqyivtgswggrj3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCaobIcxsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIACgkQfj0C55Tb+AjWhwEAka0wkR1ajkCSVyjaiXDA
XIVViX0NbgRoaisxbd3m6XYA/0av7r0/ssp0z/21d6p1a6x5TWOMouSsQwmWbet+
y5YG
=RIxv
-----END PGP SIGNATURE-----

--5mgqyivtgswggrj3--
