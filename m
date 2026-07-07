Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63153321A2;
	Tue,  7 Jul 2026 22:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783463310; cv=none; b=poyNBaUdII20f+Anjg9hUlyEYwJvG9IySHawHuNLZvB59Sv6bpmxRUI884HfupXjpDV1HGuW2OMXc0XyVSnDvFSgUcxQIUIQRPh3m6e8r9sTrSfX01As4m/AY7IQRxQ5OmpjYO5A154FhH2e8p2XCsrzTzQoKA9Fn/mNOCrd8Uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783463310; c=relaxed/simple;
	bh=gwars4tIwF8ZSiKexqY3zZ+nB1GHM+Y5Ci19JtjQJ1o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PrTAaX4Z7u9F+OhkZHQF5upx8PdILCyL0CfXzs4Xnr4KU2QBk6IGBnAJNZ1orE9UQAHnXkG10pzl+J03vAHqmDGgxKkmzNTqcw1u8DNLzbhWbtdZnvUxAqNJKIeWhN68pOcWD4xYz5BgyvvG01XklpYIbjT/KAS7Kd87FQcdLug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dg5qvZ2N; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dg5qvZ2N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AD4B1F000E9;
	Tue,  7 Jul 2026 22:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783463308;
	bh=NKa7i4Xu52C4UmZJoVh9H10GULMz/9174eF8sTZU5CQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dg5qvZ2NS5xbVZ5rdWfpyvgG6GMw2XXYQfSn2UcEEqpg1fy+9fFjwFN7D9Dxxl3dL
	 93PnyDHOUztWkCMOmyBKcBcwJlBCv+1aXIq6PuKJ6Oq16jJcYc30cjU5Y+B70+ic4J
	 ZM7T6LMkhLxpdupE991tKiu7PEZBaR/lfNOYprllvLtxhHBMLFbdO2uJCIi9mu7rYG
	 npYnTJEMkSpi0E/x/4I9nwvJ/Q5jAiMYNwHTfiVbwT9/XlPtXinggdWajfQjaP7MJP
	 MrRqzzOB6JPC6Te7ej0LQfQk8F19XvITeGNPDeHQxgA1n/RoH4sA3mk/7hmvgFNI3Z
	 3jS05XA1w8iwQ==
Date: Tue, 7 Jul 2026 23:28:21 +0100
From: Mark Brown <broonie@kernel.org>
To: Yuwen Chen <ywen.chen@foxmail.com>
Cc: akpm@linux-foundation.org, andrealmeid@igalia.com,
	bigeasy@linutronix.de, colin.i.king@gmail.com, dave@stgolabs.net,
	dvhart@infradead.org, edliaw@google.com, justinstitt@google.com,
	kernel-team@android.com, licayy@foxmail.com,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	luto@mit.edu, mingo@redhat.com, morbo@google.com, nathan@kernel.org,
	ndesaulniers@google.com, peterz@infradead.org, shuah@kernel.org,
	tglx@kernel.org, usama.anjum@collabora.com, wakel@google.com,
	mark.rutland@arm.com
Subject: Re: [PATCH v8 2/2] selftests/futex: fix the failed futex_requeue
 test issue
Message-ID: <a8886f13-e6e4-4561-a2b1-db2bd3f77a6a@sirena.org.uk>
References: <tencent_A68F2BD3395C9EFE1759975A511BB7D9F806@qq.com>
 <tencent_76B9DE9C9FE5C57F6D74B5149970DF8CCF0A@qq.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Kl7bXtxbzhPDGk2t"
Content-Disposition: inline
In-Reply-To: <tencent_76B9DE9C9FE5C57F6D74B5149970DF8CCF0A@qq.com>
X-Cookie: My LESLIE GORE record is BROKEN ...


--Kl7bXtxbzhPDGk2t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 18, 2026 at 10:16:54AM +0800, Yuwen Chen wrote:
> This test item has extremely high requirements for timing and can only
> pass the test under specific conditions. The following situations will
> lead to test failure:

=2E..

> If the child thread is not waiting in the futex_wait function when the
> main thread reaches the futex_cmp_requeue function, the test will fail.
>=20
> An attempt is made to avoid this problem by checking whether the child
> thread is in a sleeping state in the main thread.

I'm seeing failures on arm64 (running a system with 4xA53) in -next in
this test which bisect to this commit, the commit seems obviously
plausible but I didn't actually investigate:

# TAP version 13
 1..2
 # Starting 2 tests from 1 test cases.
 #  RUN           global.requeue_single ...
 # futex_requeue.c:28:requeue_single:Expected res (-1) =3D=3D 0 (0)
 # futex_requeue.c:29:requeue_single:waiter failed errno 110: Connection ti=
med out
 # futex_requeue.c:49:requeue_single:Expected futex_wait_for_thread(&waiter=
, _metadata) (110) =3D=3D 0 (0)
 # futex_requeue.c:50:requeue_single:Wait for thread failed
 # requeue_single: Test terminated by assertion
 #          FAIL  global.requeue_single
 not ok 1 global.requeue_single
 #  RUN           global.requeue_multiple ...
 # futex_requeue.c:28:requeue_multiple:Expected res (-1) =3D=3D 0 (0)
 # futex_requeue.c:29:requeue_multiple:waiter failed errno 110: Connection =
timed out
 # futex_requeue.c:28:requeue_multiple:Expected res (-1) =3D=3D 0 (0)
 # futex_requeue.c:29:requeue_multiple:waiter failed errno 110: Connection =
timed out
 # futex_requeue.c:28:requeue_multiple:Expected res (-1) =3D=3D 0 (0)
 # futex_requeue.c:29:requeue_multiple:waiter failed errno 110: Connection =
timed out
 # futex_requeue.c:28:requeue_multiple:Expected res (-1) =3D=3D 0 (0)
 # futex_requeue.c:29:requeue_multiple:waiter failed errno 110: Connection =
timed out
 # futex_requeue.c:28:requeue_multiple:Expected res (-1) =3D=3D 0 (0)
 # futex_requeue.c:29:requeue_multiple:waiter failed errno 110: Connection =
timed out
 # futex_requeue.c:28:requeue_multiple:Expected res (-1) =3D=3D 0 (0)
 # futex_requeue.c:29:requeue_multiple:waiter failed errno 110: Connection =
timed out
 # futex_requeue.c:28:requeue_multiple:Expected res (-1) =3D=3D 0 (0)
 # futex_requeue.c:29:requeue_multiple:waiter failed errno 110: Connection =
timed out
 # futex_requeue.c:28:requeue_multiple:Expected res (-1) =3D=3D 0 (0)
 # futex_requeue.c:29:requeue_multiple:waiter failed errno 110: Connection =
timed out
 # futex_requeue.c:28:requeue_multiple:Expected res (-1) =3D=3D 0 (0)
 # futex_requeue.c:29:requeue_multiple:waiter failed errno 110: Connection =
timed out
 # futex_requeue.c:28:requeue_multiple:Expected res (-1) =3D=3D 0 (0)
 # futex_requeue.c:29:requeue_multiple:waiter failed errno 110: Connection =
timed out
 # futex_requeue.c:76:requeue_multiple:Expected futex_wait_for_thread(&wait=
er[i], _metadata) (5) =3D=3D 0 (0)
 # futex_requeue.c:77:requeue_multiple:Wait for waiter thread 0 failed
 # requeue_multiple: Test terminated by assertion
 #          FAIL  global.requeue_multiple
 not ok 2 global.requeue_multiple
 # FAILED: 0 / 2 tests passed.
 # Totals: pass:0 fail:2 xfail:0 xpass:0 skip:0 error:0

Full log should be at:

   https://lava.sirena.org.uk/scheduler/job/2954705#L13289

but I'm having a terrible time with AI scrapers right now so perhaps not
usefully.

# bad: [5c73cd9f0819c1c44e373e3dabb68318b1de1a12] Add linux-next specific f=
iles for 20260707
# good: [fc5f2284ad6951ce06d6881ca8cbd6d14d5f5071] Merge branch 'for-linux-=
next-fixes' of https://gitlab.freedesktop.org/drm/misc/kernel.git
git bisect start '5c73cd9f0819c1c44e373e3dabb68318b1de1a12' 'fc5f2284ad6951=
ce06d6881ca8cbd6d14d5f5071'
# test job: [5c73cd9f0819c1c44e373e3dabb68318b1de1a12] https://lava.sirena.=
org.uk/scheduler/job/2954705
# bad: [5c73cd9f0819c1c44e373e3dabb68318b1de1a12] Add linux-next specific f=
iles for 20260707
git bisect bad 5c73cd9f0819c1c44e373e3dabb68318b1de1a12
# test job: [f03ff00f5fd55e2c02b44611ac65380082c46b62] https://lava.sirena.=
org.uk/scheduler/job/2954744
# good: [f03ff00f5fd55e2c02b44611ac65380082c46b62] Merge branch 'libcrypto-=
next' of https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git
git bisect good f03ff00f5fd55e2c02b44611ac65380082c46b62
# test job: [fe28d02cde5372d7f71cc6132ccdef37a98ac750] https://lava.sirena.=
org.uk/scheduler/job/2954790
# good: [fe28d02cde5372d7f71cc6132ccdef37a98ac750] Merge branch 'for-linux-=
next' of https://gitlab.freedesktop.org/drm/i915/kernel.git
git bisect good fe28d02cde5372d7f71cc6132ccdef37a98ac750
# test job: [954c3050e57c29ee3a216cda83da13f16815bbb4] https://lava.sirena.=
org.uk/scheduler/job/2954824
# bad: [954c3050e57c29ee3a216cda83da13f16815bbb4] Merge branch 'for-next' o=
f https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git
git bisect bad 954c3050e57c29ee3a216cda83da13f16815bbb4
# test job: [6054d7d90130d6788ec459be1bfdc14300587aac] https://lava.sirena.=
org.uk/scheduler/job/2954855
# good: [6054d7d90130d6788ec459be1bfdc14300587aac] Merge branch 'for-mfd-ne=
xt' of https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git
git bisect good 6054d7d90130d6788ec459be1bfdc14300587aac
# test job: [f705c6728b357ca8d675f9ee94191d7c900e3652] https://lava.sirena.=
org.uk/scheduler/job/2954897
# bad: [f705c6728b357ca8d675f9ee94191d7c900e3652] Merge branch into tip/mas=
ter: 'x86/msr'
git bisect bad f705c6728b357ca8d675f9ee94191d7c900e3652
# test job: [7af7f4599923cc4e1ab60d0991b33cab17ade101] https://lava.sirena.=
org.uk/scheduler/job/2954940
# bad: [7af7f4599923cc4e1ab60d0991b33cab17ade101] Merge branch into tip/mas=
ter: 'perf/core'
git bisect bad 7af7f4599923cc4e1ab60d0991b33cab17ade101
# test job: [c6cf5150bdb99c61d32fca8da51f5a2a80227ca2] https://lava.sirena.=
org.uk/scheduler/job/2954963
# bad: [c6cf5150bdb99c61d32fca8da51f5a2a80227ca2] Merge branch into tip/mas=
ter: 'locking/futex'
git bisect bad c6cf5150bdb99c61d32fca8da51f5a2a80227ca2
# test job: [86620fb9d37b9f5aaae7c7cb27a173463d961cdc] https://lava.sirena.=
org.uk/scheduler/job/2955014
# good: [86620fb9d37b9f5aaae7c7cb27a173463d961cdc] selftests/futex: Provide=
 thread creation and synchronization helpers
git bisect good 86620fb9d37b9f5aaae7c7cb27a173463d961cdc
# test job: [86e9ba573c353afd1a46816682f4cc3dbabeeb23] https://lava.sirena.=
org.uk/scheduler/job/2955047
# good: [86e9ba573c353afd1a46816682f4cc3dbabeeb23] irqchip/irq-imgpdc: Remo=
ve unused driver
git bisect good 86e9ba573c353afd1a46816682f4cc3dbabeeb23
# test job: [1cd91823008a033cc766b78ad0cd1138e96bfcd9] https://lava.sirena.=
org.uk/scheduler/job/2955064
# good: [1cd91823008a033cc766b78ad0cd1138e96bfcd9] Merge branch into tip/ma=
ster: 'irq/core'
git bisect good 1cd91823008a033cc766b78ad0cd1138e96bfcd9
# test job: [919c6f2762254d4bcb92ea30bf473cfcc5521c9c] https://lava.sirena.=
org.uk/scheduler/job/2955116
# good: [919c6f2762254d4bcb92ea30bf473cfcc5521c9c] Merge branch into tip/ma=
ster: 'locking/debug'
git bisect good 919c6f2762254d4bcb92ea30bf473cfcc5521c9c
# test job: [157a9b22ff769e1a657aec6210df3ea896600eec] https://lava.sirena.=
org.uk/scheduler/job/2955137
# bad: [157a9b22ff769e1a657aec6210df3ea896600eec] selftests/futex: Use thre=
ad synchronization helpers instead of usleep()
git bisect bad 157a9b22ff769e1a657aec6210df3ea896600eec
# first bad commit: [157a9b22ff769e1a657aec6210df3ea896600eec] selftests/fu=
tex: Use thread synchronization helpers instead of usleep()

--Kl7bXtxbzhPDGk2t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpNfYQACgkQJNaLcl1U
h9A4YQf+L8rdZqVHee80Gc3CGV+kiLAEXRP9scfR+Guq7mozibc3cIAz4InR2Ebe
tFxUyyY+MXzwMe8BPtO2eBdOosNSvCiKKgSG5OQmWDLL3gBrNvBOW2+SBilTqygj
t74gRqjEKhsT4w42PgIG7uVNXo/ajmetyJtJyPkropvw6NKF3cQGR8I7z1PxUp08
ks/xfyC3FIoi7bhl8uqJEeHSSy6hbp+1EeTkRugE0dyPfMNNqK34qU4X85O45FAa
GPjlI3Zpi4lsSBONLeX004qJpK50WQIv9Ucgg4sJXbDVGOIvLpIn9SLYw7GJ4QjL
0UcAsZRqHhxJCEfJtALChSmgznR4yQ==
=O09P
-----END PGP SIGNATURE-----

--Kl7bXtxbzhPDGk2t--
