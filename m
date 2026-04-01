Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B773090D9
	for <linux-kselftest@vger.kernel.org>; Wed,  1 Apr 2026 18:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775068916; cv=none; b=Nks0ZPeHETwG3x/fOfIVPo3gmzRLO0juHkBUkcMhwzd2pk7e5KJTyqslCtUdg0+Nt7Ozv17l65okRJDQMEECYln2aGOER5X1RvGxYOG4iKk1HhxJXhTXxEd1tEyQR52pH62tpT4J9TwXWhYC+WM4AnEEtSbXWV1xOOjQKN9orLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775068916; c=relaxed/simple;
	bh=1CG3RDIiwIsMcQ/1sYaFthugLh62zYQvURXEfTxg7As=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TVgd4iyYl/C9yZQd38kHqpXp3oezlJdWCKgfJyg5YG8npAQ+nZFrBIzMwJ3EsS0v2Dor+xYJpeMkfPpYBi0BYtapztu7G3Vl6fRK9UTFNCZNs4HiUaBhBMefBaO9UBtX48Y8gyYRCIq7Dv58An8zL9eei9DDysfLDf0A6wUH7K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=c01dqKlQ; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="c01dqKlQ"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-486b96760easo261975e9.2
        for <linux-kselftest@vger.kernel.org>; Wed, 01 Apr 2026 11:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775068912; x=1775673712; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=diWyiF5CM6MLfjiGHibL/eUp1W0TNuRh03hTNEA1N0U=;
        b=c01dqKlQBSVef1OSnX68UYM6w0G5VmILr7oLQIJFQ/vd6Xfmt7UZv29PCRxEBii5Oy
         OCc1uruZzQM8OfcL1/9rR/1PdTSn2jWA6MdU6Ra3yJsF4rcDiEqkgiDJRgrUyF7mAciL
         6UdzO8Ym9LbtLHtskn9Ifl29WBDTcGCBYlFUoPh4V36724RXXlc0JLb5Phhs70cos9Vd
         /0D4sfCjn6DvWpgWkB4id6QjOyqXOGUAyzVGq00YHxakpH/WkKP42/hacxq/ObmbnVjn
         vT2NiflR0bwN2iaMcIkkTha3xwZHCBDsC4+XRQIKBkVauDtiLkuhtn3lJGuLalC++2H0
         KCwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775068912; x=1775673712;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=diWyiF5CM6MLfjiGHibL/eUp1W0TNuRh03hTNEA1N0U=;
        b=sYB5zWcSZ9DuW75+FvOUQwee3dSxMB9/aIw3Ps0WOgAm1oQhX9vAzRKfum6bxqB0tZ
         EJEoZ30NsA+dn6ncUZPA2pHbFnwO8+xT7Zb5piZG6i0Hy8AC8p4t9cAy+rYOm1D9r6A+
         4DT1n7VfZysa6IUrgr6dWo7T3sAJ3qeF3M1emB5ZLvWz6vi3K2Jzxnlw2GSBXROOIsWB
         WMvdQMRb609LTMzA3dfq7CHXLIb4uzP5AELoiKT++Yfa9B+Kn+voW4RjhshaYPKx7DF/
         9AUhzELCGhQsMGDVmRqmp/ugPGQKVptf9+erVxbxsy+mEPsTkXgy9c3PiSPRSP0WQ6nk
         PsEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuGgxGlbhSqUWG85MqcB2dJyk7Q43IztOqZVdpzD/+1dyl3+iS9OmJblGEYS0juM8B39NwJ3STNAxScOLgaeE=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywcxj8kFp/TqXJujEnjX6xWenkrdMcVniSNStySWe4IM+QNxm45
	sNAAYrXHB0+oWxU2ES0rRD4tkT2K4n/3I+DEixBwRtjlbUfaP7UVboKnqsRQvpDZTjI=
X-Gm-Gg: ATEYQzzqReuVAnG9pz7QKWDOduCq5pL4WI6LK4Ajtu3xwddd1+qaNsrtEFSCnif69/C
	TminoRh20juX+rl/1Pn/+yUyNeGjRytWd6J1GDMTbmSrBk3GjBScwJQ8e1D46LUXaIcUzVwmTqh
	NX3BlM77K+H1dm1hL3MW40zcBhsO2LHaUqH1z6yBzJXheHm//ApBSzSt7Q4Vl/jqgPqdjk8Nb94
	Emm0K7a9gVRgLsNWjqPcX08Uy7zK5RnxQAxDEr/eypfHv2N8EnAHZEk4tmXlun2MyTGpu7ToMuR
	Rf6h5bQ3GkaTQRSnScxFWPQRb5WUkF5AuvNxPCiPDIV3CySWaFLcvb6uS9vxM3q2DZYXi7LejJY
	9uMFloSgql+bBNoXyxBu5k1cF3TywnMbnzE4HWHxBEzleEqusQMNMTc5jDr4TtmrqvY5NUQuMqe
	1s3tfQfFu+O9ArImr24XKTf8uiacA1yb7u/Z7rq2GmyOA=
X-Received: by 2002:a05:600c:1798:b0:488:8bdd:cfde with SMTP id 5b1f17b1804b1-4888bddd1bemr1447595e9.7.1775068911853;
        Wed, 01 Apr 2026 11:41:51 -0700 (PDT)
Received: from blackdock.suse.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887c9250afsm49170605e9.36.2026.04.01.11.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 11:41:51 -0700 (PDT)
Date: Wed, 1 Apr 2026 20:41:49 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Waiman Long <longman@redhat.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Muchun Song <muchun.song@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Tejun Heo <tj@kernel.org>, Shuah Khan <shuah@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, Sean Christopherson <seanjc@google.com>, 
	James Houghton <jthoughton@google.com>, Sebastian Chlad <sebastianchlad@gmail.com>, 
	Guopeng Zhang <zhangguopeng@kylinos.cn>, Li Wang <liwan@redhat.com>, Li Wang <liwang@redhat.com>
Subject: Re: [PATCH v2 1/7] memcg: Scale up vmstats flush threshold with
 int_sqrt(nr_cpus+2)
Message-ID: <n6mhkjsxsami3qmczkdh57eep4lmcgbtyl7ox3ajzveke44yf6@m4bjevvsr47k>
References: <20260320204241.1613861-1-longman@redhat.com>
 <20260320204241.1613861-2-longman@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="isa3i4d4tepb4cvo"
Content-Disposition: inline
In-Reply-To: <20260320204241.1613861-2-longman@redhat.com>


--isa3i4d4tepb4cvo
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 1/7] memcg: Scale up vmstats flush threshold with
 int_sqrt(nr_cpus+2)
MIME-Version: 1.0

Hello Waiman and Li.

On Fri, Mar 20, 2026 at 04:42:35PM -0400, Waiman Long <longman@redhat.com> =
wrote:
> The vmstats flush threshold currently increases linearly with the
> number of online CPUs. As the number of CPUs increases over time, it
> will become increasingly difficult to meet the threshold and update the
> vmstats data in a timely manner. These days, systems with hundreds of
> CPUs or even thousands of them are becoming more common.
>=20
> For example, the test_memcg_sock test of test_memcontrol always fails
> when running on an arm64 system with 128 CPUs. It is because the
> threshold is now 64*128 =3D 8192. With 4k page size, it needs changes in
> 32 MB of memory. It will be even worse with larger page size like 64k.
>=20
> To make the output of memory.stat more correct, it is better to scale
> up the threshold slower than linearly with the number of CPUs. The
> int_sqrt() function is a good compromise as suggested by Li Wang [1].
> An extra 2 is added to make sure that we will double the threshold for
> a 2-core system. The increase will be slower after that.

The explanation seems [1] to just pick a function because log seemed too
slow.

(We should add a BPF hook to calculate the threshold. Haha, Date:)

The threshold has twofold role: to bound error and to preserve some
performance thanks to laziness and these two go against each other when
determining the threshold. The reasoning for linear scaling is that
_each_ CPU contributes some updates so that preserves the laziness.
Whereas error capping would hint to no dependency on nr_cpus.

My idea is that a job associated to a selected memcg doesn't necessarily
run on _all_ CPUs of (such big) machines but effectively cause updates
on J CPUs. (Either they're artificially constrained or they simply are
not-so-parallel jobs.)=20
Hence the threshold should be based on that J and not actual nr_cpus.

Now the question is what is expected (CPU) size of a job and for that
I'd would consider a distribution like:
- 1 job of size nr_cpus, // you'd overcommit your machine with bigger job
- 2 jobs of size nr_cpus/2,
- 3 jobs of size nr_cpus/3,
- ...
- nr_cpus jobs of size 1. // you'd underutilize the machine with fewer

Note this is quite na=EFve and arbitrary deliberation of mine but it
results in something like Pareto distribution which is IMO quite
reasonable. With (only) that assumption, I can estimate the average size
of jobs like
	nr_cpus / (log(nr_cpus) + 1)
(it's natural logarithm from harmonic series and +1 is from that
approximation too, it comes handy also on UP)

	log(x) =3D ilog2(x) * log(2)/log(e) ~ ilog2(x) * 0.69
	log(x) ~ 45426 * ilog2(x) / 65536

or=20
	65536*nr_cpus / (45426 * ilog2(nr_cpus) + 65536)


with kernel functions:
	var1 =3D 65536*nr_cpus / (45426 * ilog2(nr_cpus) + 65536)
	var2 =3D DIV_ROUND_UP(65536*nr_cpus, 45426 * ilog2(nr_cpus) + 65536)
	var3 =3D roundup_pow_of_two(var2)

I hope I don't need to present any more numbers at this moment because
the parameter derivation is backed by solid theory ;-) [*]


> With the int_sqrt() scale, we can use the possibly larger
> num_possible_cpus() instead of num_online_cpus() which may change at
> run time.

Hm, the inverted log turns this into dilemma whether to support hotplug
or keep performance at threshold comparisons. But it wouldn't be first
place where static initialization with possible count is used.


> Although there is supposed to be a periodic and asynchronous flush of
> vmstats every 2 seconds, the actual time lag between succesive runs
> can actually vary quite a bit. In fact, I have seen time lags of up
> to 10s of seconds in some cases. So we couldn't too rely on the hope
> that there will be an asynchronous vmstats flush every 2 seconds. This
> may be something we need to look into.

Yes, this sounds like a separate issue. I wouldn't mention it in this
commit unless you mean it's particularly related to the large nr_cpus.

> @@ -5191,6 +5191,14 @@ int __init mem_cgroup_init(void)
> =20
>  	memcg_pn_cachep =3D KMEM_CACHE(mem_cgroup_per_node,
>  				     SLAB_PANIC | SLAB_HWCACHE_ALIGN);
> +	/*
> +	 * Scale up vmstats flush threshold with int_sqrt(nr_cpus+2). The extra
> +	 * 2 constant is to make sure that the threshold is double for a 2-core
> +	 * system. After that, it will increase by MEMCG_CHARGE_BATCH when the
> +	 * number of the CPUs reaches the next (2^n - 2) value.

when you switched to sqrt, the comment should read n^2

> +	 */
> +	vmstats_flush_threshold =3D MEMCG_CHARGE_BATCH *
> +				  (int_sqrt(num_possible_cpus() + 2));
> =20
>  	return 0;
>  }
> --=20
> 2.53.0

(I will look at the rest of the series later. It looks interesting.)

[*]
nr_cpus	var1	var2	var3
1       1       1       1
2       1       2       2
4       1       2       2
8       2       3       4
16      4       5       8
32      7       8       8
64      12      13      16
128     21      22      32
256     39      40      64
512     70      71      128
1024    129     130     256

--isa3i4d4tepb4cvo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCac1m6BsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIACgkQfj0C55Tb+AhqDgD/ZH5FdNATX0Dm9ldZMHyS
oV/8qO6gLgjmu8goJGbY7NgA/Av2MbsmiWijOj+3I3XEmPfOtsPxWjctyieoz9ut
LtMB
=Nhw7
-----END PGP SIGNATURE-----

--isa3i4d4tepb4cvo--
