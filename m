Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62CAF4C81;
	Tue,  7 Jul 2026 23:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783468093; cv=none; b=HE8Oz1eCvuUcD/DOUgE52LcHbqi12eo5mi1Fi067NroljzulOnuMsnNEYHjq6HZzr1MfAsFTMwpjHPTcHwQQi0fJiBEu8lrGCEqrXSol2wzjh19ebC/fNw3kccW0zFoWkwyOPIw99U0zd+1ig4o1WRlCAPYtIjk8FBxDtk5d/gI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783468093; c=relaxed/simple;
	bh=pE5xiKA6efNxDHq+DesHBfQbEIzpwp1g5mOtM/DOo6c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u/wEe7WpecAd2pL4HVW+BkI7axR2b++lRPWbwgsh1qgQlU6Lqiwf/LEKsHZA84Ystll1QTeAy8CJeXAMB+LmI4NYzxsqgo13B1F3Uxg7pPzKlxJ6DaQWlklmvIqSPgnMfRVJKrjA6fX4CVVshIDlH+EcR67QxEGh1vzZFTm/SEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a/RBjpW2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a/RBjpW2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD2181F000E9;
	Tue,  7 Jul 2026 23:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783468092;
	bh=2AMW0prL5IZm08/ElUM1/ir/uH93UD8U6g9fWM4yCjE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=a/RBjpW2BJggMZBjxV8507G2UaSGbgn8iZB75dUzgKrTp/x2eLvpu1+WNWN9OicNd
	 94BgXvJDsSqdnJnHSAKXw5850CKa+1I5GS2mjwhjXcquty4KgXgwmMeev4pb6O3sYh
	 HYEugeH98WRDEVHiYkXCBtZXxJa9zPcC7yQQP7UyiXV6PHeVTV3NN7kv2awf4JqR1h
	 ueAtVNPEMyN2lGAP9vhbBdzl+gpi+v2X5X1Cerga8lvIo4dCQ2cC45wDnTz87bmt7/
	 fz1PDuxvOQIVekEq9tSkX2WDq0qWGqMtf+zVVX+VxN2UN7WqOIT9C7ECdqGCQQyM41
	 TosenVKi2qIgQ==
Date: Wed, 8 Jul 2026 00:48:05 +0100
From: Mark Brown <broonie@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Yuwen Chen <ywen.chen@foxmail.com>, akpm@linux-foundation.org,
	andrealmeid@igalia.com, bigeasy@linutronix.de,
	colin.i.king@gmail.com, dave@stgolabs.net, dvhart@infradead.org,
	edliaw@google.com, justinstitt@google.com, kernel-team@android.com,
	licayy@foxmail.com, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, luto@mit.edu, mingo@redhat.com,
	morbo@google.com, nathan@kernel.org, ndesaulniers@google.com,
	peterz@infradead.org, shuah@kernel.org, usama.anjum@collabora.com,
	wakel@google.com, mark.rutland@arm.com
Subject: Re: [PATCH v8 2/2] selftests/futex: fix the failed futex_requeue
 test issue
Message-ID: <4eb612b1-517c-4796-92c6-af73de54f3f4@sirena.org.uk>
References: <tencent_A68F2BD3395C9EFE1759975A511BB7D9F806@qq.com>
 <tencent_76B9DE9C9FE5C57F6D74B5149970DF8CCF0A@qq.com>
 <a8886f13-e6e4-4561-a2b1-db2bd3f77a6a@sirena.org.uk>
 <87cxwys7fi.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JLfxhuyMainPoDfJ"
Content-Disposition: inline
In-Reply-To: <87cxwys7fi.ffs@fw13>
X-Cookie: Walk softly and carry a megawatt laser.


--JLfxhuyMainPoDfJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 08, 2026 at 01:31:45AM +0200, Thomas Gleixner wrote:
> On Tue, Jul 07 2026 at 23:28, Mark Brown wrote:

> >  1..2
> >  # Starting 2 tests from 1 test cases.
> >  #  RUN           global.requeue_single ...
> >  # futex_requeue.c:28:requeue_single:Expected res (-1) == 0 (0)
> >  # futex_requeue.c:29:requeue_single:waiter failed errno 110: Connection timed out
> >  # futex_requeue.c:49:requeue_single:Expected futex_wait_for_thread(&waiter, _metadata) (110) == 0 (0)
> >  # futex_requeue.c:50:requeue_single:Wait for thread failed

> Do you have /proc/ disabled by chance or is it not accessible for the
> test case?

Not intentionally, it's an arm64 defconfig running a Debian rootfs.  The
jobs that do the futex tests actually also run the proc selftests (after
the futex ones) and those are passing, adding checks that /proc is there
seems to confirm it is:

  # mount
  sysfs on /sys type sysfs (rw,nosuid,nodev,noexec,relatime)
  proc on /proc type proc (rw,nosuid,nodev,noexec,relatime)
  ...

ls seems to work too.

> > Full log should be at:

> >    https://lava.sirena.org.uk/scheduler/job/2954705#L13289

> > but I'm having a terrible time with AI scrapers right now so perhaps not
> > usefully.

> Seems to correlate with the test case failure: Connection timed out :)

Bah.  If you've got a fixed IP or IP range I can fiddle with the
firewalling?

--JLfxhuyMainPoDfJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpNkDQACgkQJNaLcl1U
h9DIMgf+IprVqmZKm+CENbtlWMhE5VZPUvXb//ImWK8toFkg6uUK5PaqgK+0YsPf
teVLAcy4nh+idlNfJ6afmlt/vWvVrNQQ6AtK4PJrPX7FWV9od96WZ/6glSU0uRAf
2/Lnpfh2Bi5WbaOkyqFNmSK3mutgjusqpa2hu5fwXSMNUwK1KXnLqX9zpadOKMBr
aUWu7CNx6X3pyQgMmmnAomVDfrm4ZCAH/XJKP++VB4oA6Q9XGP/oxVQtLh+gx4Iy
rPwxh3fnPGTpiGf+8E1xF/KZDw5RHZ1Iw+m8xJVHGOhc01pEa+LqBs0UApvWhkT7
jN5Pt81hLxrjjzBcy8DgEOELL451mg==
=7Aih
-----END PGP SIGNATURE-----

--JLfxhuyMainPoDfJ--
