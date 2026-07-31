Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B5D35E955
	for <linux-kselftest@vger.kernel.org>; Fri, 31 Jul 2026 09:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785489523; cv=none; b=YzZREyg7UfeOiuNuHiBrbahy0bM+ARbh325GGm7TAqGtqNTZS3H1diLD82fm5XCAvvR6YS5xG5701gMAyTGFajZydhJVq5GAaQaU68RbpRsPsOWhzbGZHsL4a867LoKPJaQwiFiInyymUaKA/A4nb9okT4bbX8lqD1PJORuU8jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785489523; c=relaxed/simple;
	bh=bwHfECC55OnCtvP0E7IoCPnJ4TAlc8AGp6+ZR7/YYSI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XPYP6HdswThhIyQ6x1U5D2MxC/NvbtT+JyCpFPWoK4D7ub990tfRQL1wrGGRGTNSmk9Lm8MX8gyBhD2PUzLbucNv27VZIYTwNOqigxZ/W/Em0zHTaFB5+NFpWggav8PC2ELd+kf3Q1GVq8CfyoWvrqNcZ60EiSFS2QOIuWeEHJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=TwK1+eid; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="TwK1+eid"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47f904e80eeso668160f8f.1
        for <linux-kselftest@vger.kernel.org>; Fri, 31 Jul 2026 02:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1785489520; x=1786094320; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ru7vgSQnsNbpoP3wPkVpdq3kmKPHaB3aDPcV1egDXRU=;
        b=TwK1+eidJMI0jh6WrIazODH+oknm+ehf0/ocBJQijaO250Hd7SsJzIWHU6YPjLBzLn
         wgkkDa3s3yIHTIiPu+dauqC91l38lWUlNVQSM9DJr/ttaO0BF+KtPVp89Fsxej5Q8B2M
         HUGMKQs8DlMLAX9ywtOuKKvRhLaJqqpksCYb81YNHJp7oQhsztOxEItzrwL57mSGV5nm
         qVxHDQyY2CeoydbbppoPjw6hFLjYL/WGEh1xDcXmq+Qdo9PJgeP2FiPNEZQ29KH8Gwz1
         /D0JLmV9bdJiV5Yq1tf48jBqUNyh428fuV+pGBe7sbvsP1Bd9VwtV9n6BBuOpIY8II91
         XWAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785489520; x=1786094320;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ru7vgSQnsNbpoP3wPkVpdq3kmKPHaB3aDPcV1egDXRU=;
        b=FWm0SkjozzYm2klqhRI2pZr7v0JYYmHF6C9PW7aeN08C/UKBa5XGQmbcW4X2MNMgqW
         oe0UTOp/TFBnmgXkAwGqpentuVhK4LOfoFqw67W2kqdmDXbbp6Z3hIYrSXRv7QjAlQKI
         3Wi5GaZaJ8HJP1gcrxLYA7IaAF6OU6/dngi4iLSZztNPzUWds9Bx6wlp7fLCjWmG13Vu
         JL4TzXSrUYxvwqflaTsl0fnRhLsi5Ig4KEydB+QTxofXuBuSiIBfAaOPl33TPkVtQg/3
         v/+9UT94HDxnXgvqIED64tYIANNoSazWDQHS2cUWEW/KBemEI/u06X9+jpwE9iRdjdIz
         ZxuA==
X-Forwarded-Encrypted: i=1; AHgh+Rq10/vXL6LvLbqn8xAgt7wBQhr+qFm1r+ilvslagQu9ObGb0ikeRRr70ir53YMRlbeOsqBDuH0/dVVMChQCyaU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtWKcKhB8oF4FFeUREjG1m9TGdlbASHwGmRY5Sl4CW9K4f2d9K
	EdQ8x5ZLbwE3IA0gHfdmjnvquy7C0U8CexsDjw/XRVRi1iW9i77EIAx9tWfaIvDbgn4=
X-Gm-Gg: AR+sD12VP1RGBZgwXIV8m0T2hdopgGsxmSze6B3ko8t6gSz7XNFE9M2UVvKd1qCQxvX
	nrQiwIEGpLEn1kffwX4vMUngakaX3oFTIAK2hWNVw9j1s9xVSnXmajfHjXUwhfsMKO52+WlvtaD
	arjVxwlUFpxKJGJ5dCjVwt8Y1n67OO0zzHy/wMGM6+xdFhGp2/tIH4PNotJKDYimqiAgk5PZ5dh
	xBlcJnRynfpjUABZlhpCrXisfKs2+nUZZazdtI/HD+SjnRlvQev+mzL5HyzI9mrD7ORDFt7Wh15
	ROeEg3VNTDWShRUNJ1c/mUi0UO7sA3HjcJj043hIQIL6BfBxiCejfR8WhxZ/f0MaK4wuxtg3YNU
	//uB1sPTB6+bVKdIHxQq3ojLVBXeYGbpQThdizNQxaDSIUob4kdS/F+pOR9BNa6T6uTwpDqBNf1
	ou8eAFS+iVMuO+q89Sfd9vd945wE0z3AC4tlVTjwnXwRzAmnGe9Z6UQcCXNqWbZKjgE8RZ+G/1H
	xE=
X-Received: by 2002:a05:6000:4808:b0:47e:9f03:e542 with SMTP id ffacd0b85a97d-47fd2b679d9mr3015237f8f.45.1785489519948;
        Fri, 31 Jul 2026 02:18:39 -0700 (PDT)
Received: from localhost.localdomain ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd456262bsm2209203f8f.17.2026.07.31.02.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 02:18:39 -0700 (PDT)
Date: Fri, 31 Jul 2026 11:18:37 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Shaojie Sun <sunshaojie@kylinos.cn>
Cc: cgroups@vger.kernel.org, hannes@cmpxchg.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, shuah@kernel.org, tj@kernel.org
Subject: Re: [PATCH v2] selftests/cgroup: add user_usec sanity check in
 test_cpucg_nice
Message-ID: <amxoWCgc94e9E6kb@localhost.localdomain>
References: <amnqUlrPxhTobE1E@localhost.localdomain>
 <20260730130717.1236233-1-sunshaojie@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tnxx3t7cpk6cygju"
Content-Disposition: inline
In-Reply-To: <20260730130717.1236233-1-sunshaojie@kylinos.cn>


--tnxx3t7cpk6cygju
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] selftests/cgroup: add user_usec sanity check in
 test_cpucg_nice
MIME-Version: 1.0

On Thu, Jul 30, 2026 at 09:07:17PM +0800, Shaojie Sun <sunshaojie@kylinos.c=
n> wrote:
> In test_cpucg_nice, after the child process exits, user_usec is
> read from cpu.stat but the value is not checked. Add a sanity check
> to ensure user_usec > 0, analogous to test_cpucg_stats(), so that
> the test fails early if CPU usage wasn't properly accounted.
>=20
> Signed-off-by: Shaojie Sun <sunshaojie@kylinos.cn>
> ---
> v2: Instead of simply removing the unused user_usec read, add a sanity
>     check (if user_usec <=3D 0, goto cleanup) analogous to test_cpucg_sta=
ts(),
>     as suggested by Michal.
>=20
>  tools/testing/selftests/cgroup/test_cpu.c | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Michal Koutn=FD <mkoutny@suse.com>

--tnxx3t7cpk6cygju
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCamxoaRsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIACgkQfj0C55Tb+AjaEAD9GI3/HmQMFyz4zdT8cIiB
p9Vql087AqIUXZiczHDlf1YA/3ZACeKyH+gzAyxyuHI8vnYFSBQVd7zAUYO9Mjt5
NToL
=l2Dw
-----END PGP SIGNATURE-----

--tnxx3t7cpk6cygju--
