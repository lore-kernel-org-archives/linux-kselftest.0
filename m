Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34CA63BFE52
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Mar 2026 10:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773224880; cv=none; b=TEH48lySksP7g9jc8k6xM5ZtGS4eftMWLA5ccjnOFOGyHMkDHPzlgn4/Zsv0oEeiMvbf/VEPBGba9cxoC7sqWUO2TUfaSUIlq8EjvNmBK/WLPaLMi4oDN+Q2DLLBTWTH6WQa4S9gfgmuspBndVxLzALPXREgIyswOWL5AyOMULQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773224880; c=relaxed/simple;
	bh=OhZeESvtdZ4jcH9ll++uGOg/vtAvdZiKWXfdTC4/v0c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=evYtKl/NyshPfxZTtOcmv3uYZhQc0ydhUtsbLVwbbxbo3v+pO5kk8RjDHwXHjolZYs//p9cyyZ5nhxT0vczTym8gJjzSJYhOccr81nDDv2x44X2OFt/e61fde/Komn6nodBzIlNXq/X+EEqEeZS048+NCRfSeaZ98OSFYQ2wdTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=HpieEL+2; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="HpieEL+2"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-485345e1013so6347325e9.1
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Mar 2026 03:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773224878; x=1773829678; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=X5j4jaAYOM8eCoDOEvFzIXtQzN3FUkdB0X3c7yVW0+s=;
        b=HpieEL+2kDYR+JFtfFNSc7yS7FlOBfG+FZT5dMBSUe9KHKzXaMHJa6EMbuc1kgow9K
         oXAf8BpIEXTWOoBTNODxBBnlMoRKVkPCbbziWap/TizI3B3R9Ma7RiafuKCdfYRLMqw3
         78r41Hx8Z0znueyUgSpoQBI7lvHCgjtz/9Xjlu5VfPSneCgcUbtkh6BdgSJ21m9DDmQV
         z6yYKdfgB1mytmFuhfvd+BrF80tI06whXcUPISFPeIxTRE60armaEAbkceg1M0vREegB
         Ea5EuQYqsF/s+3GwZuUABPvsNLApN1y/TDmR0esxzzElqZ2WCs7px+fJ57Lpfh23UG0p
         VrLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773224878; x=1773829678;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X5j4jaAYOM8eCoDOEvFzIXtQzN3FUkdB0X3c7yVW0+s=;
        b=om4NPjvI7U97suuRGOd0XjH2606W9ngQct1S19RNnbzehQPfSf8faZT0tnwneVfgXW
         ANvJbR/HtSz+hyuM4+i0qdT+0RPaUGh4COj1F8HQxMUz4brWhcRrG6CWMORN/L7fNKx+
         CGMJ5+QYJNxU5yO0PHtjbF+y/m7OnenR4qozv3T2Zn0BIuamDcEeQB01lfx8CLRnn4Ld
         4zLhROHNopDtNoiUnXX0nEDvOs743wShOVad9QFyrNw7i49Y/jU//ioxjlHLE4qN5sLw
         IHc0VPkvQM9eVcUFiCryVbcbqDY2U2MSJIFithoW6FynEyZK26HiQKG1jfha4g5Rbtlk
         0BZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWoyMxgEJGF5I5IVgrJsCijjeLCnNQcS0m2ajJYK0Z9oEel8EwRPny58WAk5JV9j8GXYvogybJOM2C3U99bk/Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIkjuphOwzQuNbg6/Cbf6+bcQdlBG8y0ikqPh+8S88WniBVk09
	lkOChYR1Q3Fn6V5PR9cNUc8hcImiQB5Ij3eK23lQ6S1wVDF6le0bA2cuMVUH/LMMliRTeKwRBwZ
	MFCun
X-Gm-Gg: ATEYQzxnPz+yTfJ9x1ZtpNdeG4rHs6MlO1EbNPkPvXPEUcsZPd0fNDabkzu3brISFG1
	2ZtIx+/eTTn8009jKIkmx2GL6eX5D2bEiq+Sw3YDAjE2WpTrS3HODBhQy1/Y+fxqbNMpfmZyBKx
	B0fK5JxIKpBONRyDvn9UlzrARtw2wPsRPez0l0tL28FqSgNvqO+COElUTbZjhs00FXl0HnWR5+t
	5SGwCH8AuA2XQTVB3PioTkg4e+teJ67gK2AUdRE6sCyvtNEgeVgoJzJpZhqrAiMO9Ae9KObn0Ju
	1jF9CC+A+qp9/2OTBlsNefH1CuSAbtg3PVtf73ZR9+dcOZmGlREJIT+oABP/EKW71NrwbYCGtX2
	TITpVfJ1EZo0/r+iiuR2+sn9oXDS6x2FEdqB+03qjaCEm/rdSCDELfvAj2e7XPvFx7LY5OBlvMw
	9vR47ABIqC4QzGTFb5pvK+yMOjSYhq+EXa8t8BkdkhNfo=
X-Received: by 2002:a05:600c:8b05:b0:485:38f1:5cec with SMTP id 5b1f17b1804b1-4854b255a79mr29402935e9.7.1773224876909;
        Wed, 11 Mar 2026 03:27:56 -0700 (PDT)
Received: from blackdock.suse.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b6756e4sm49552295e9.15.2026.03.11.03.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 03:27:56 -0700 (PDT)
Date: Wed, 11 Mar 2026 11:27:54 +0100
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Waiman Long <longman@redhat.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Muchun Song <muchun.song@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Tejun Heo <tj@kernel.org>, Shuah Khan <shuah@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2] selftest: memcg: Skp memcg_sock test if address
 family not supported
Message-ID: <rbw6bit7rgcpcw5zc6vdezp2x3sufogled4yxn2i3xmjkg2gb6@i2rpowwixa5m>
References: <20260310143936.720592-1-longman@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pa4tyuvad3rxlz5h"
Content-Disposition: inline
In-Reply-To: <20260310143936.720592-1-longman@redhat.com>


--pa4tyuvad3rxlz5h
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] selftest: memcg: Skp memcg_sock test if address
 family not supported
MIME-Version: 1.0

On Tue, Mar 10, 2026 at 10:39:35AM -0400, Waiman Long <longman@redhat.com> =
wrote:
> The test_memcg_sock test in memcontrol.c sets up an IPv6 socket and
> send data over it to consume memory and verify that memory.stat.sock
> and memory.current values are close.
>=20
> On systems where IPv6 isn't enabled or not configured to support
> SOCK_STREAM, the test_memcg_sock test always fails.  When the socket()
> call fails, there is no way we can test the memory consumption and
> verify the above claim. I believe it is better to just skip the test
> in this case instead of reporting a test failure hinting that there
> may be something wrong with the memcg code.
>=20
> Fixes: 5f8f019380b8 ("selftests: cgroup/memcontrol: add basic test for so=
cket accounting")
> Signed-off-by: Waiman Long <longman@redhat.com>
>=20
> [v2] Update and commit log & adjust the skip code as suggested by Michael.
>=20
> ---
>  tools/testing/selftests/cgroup/test_memcontrol.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)

Thanks,
Acked-by: Michal Koutn=FD <mkoutny@suse.com>

--pa4tyuvad3rxlz5h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCabFDkBsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIACgkQfj0C55Tb+AirqwEA5ez8dlyt/ZfidHe6iSqC
8cAuhuEPnD7bwDGi8sH7DSsA/39ZAFz8X5c/wfwzVixVP458FkA+Xqr/aPpG33QE
WDgD
=jKdH
-----END PGP SIGNATURE-----

--pa4tyuvad3rxlz5h--
