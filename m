Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D67417BD1;
	Tue, 14 Jul 2026 17:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784050918; cv=none; b=ZEiB3MEJ24Rsj2Beepevun4KXOtYBWDlyWxud2JytbuG1hoHG72PJ0JigTZ/Iwg7+GVLHoeYlla7ctsDMyNFvg313/tAOfZTRuxGsX9lEQyuO7bMBvi2+5LTwbPJK4aPegt7zgQFPz58tgMb602orWlJ3sbmiGqBW4nmZRNBbQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784050918; c=relaxed/simple;
	bh=ot+TH7xtaDoqo2780r8tQzRKJYbXrIF/nHOdSdhfUSM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q3T1+xfMPu3rELnw+HsGar1a645EwBAnlmQPSSG4Xid67usGASHm/C0KG6phbMG9E5VACpt3eyaiJXNZaI4f4un3+kItMryJcvMWjmoXtYvjM7ErivvvG7/WCvSJaNu2waQVxJv7dWMfHglBQ41p49kq4y3QJyoDw0awyBFidRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RdlCqQgy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RdlCqQgy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDAFB1F000E9;
	Tue, 14 Jul 2026 17:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784050916;
	bh=61F0uUcPwOxHP6TcMwnpaiAfrRg0DqC7fQAdp1F+GoE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RdlCqQgypM6LiNF8St6l8I98qiWsx8gJRJCipt6iVTF5RKgcb1RhDj8LlGcHjL+XT
	 S/vN1atOs1jkoIlkvlQ1dbjmi3TYYCBKiGscmlIGNRESkyF+INzVAL0/aYtNnnE9MY
	 wnrBQsediBp25GOINl53fZjS4K82Gb3LCyls+knbR6wenHYaHXPB8ZqHYddWfurGwB
	 DJmRHGsf72y+SwizCifG+hCIMqL3Mz+NCjiXqqL7GYC7eh+VAVikOi6K3+DvOjA3eU
	 Yy5MenPgO2O4ZwCNrmlO/bzcfT5YVexANrQzaVPkA3Xsi5JL6DNNZmNqvkjL/hELVk
	 EVbdY3Mmfb8wg==
Date: Tue, 14 Jul 2026 18:41:49 +0100
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
Message-ID: <7b5aa640-da5b-4b59-b6c0-f4940b66958f@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="f3SPXGhwDEF95W0b"
Content-Disposition: inline
In-Reply-To: <87cxwys7fi.ffs@fw13>
X-Cookie: Neutrinos have bad breadth.


--f3SPXGhwDEF95W0b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 08, 2026 at 01:31:45AM +0200, Thomas Gleixner wrote:
> On Tue, Jul 07 2026 at 23:28, Mark Brown wrote:

> > I'm seeing failures on arm64 (running a system with 4xA53) in -next in
> > this test which bisect to this commit, the commit seems obviously
> > plausible but I didn't actually investigate:

> >  # Starting 2 tests from 1 test cases.
> >  #  RUN           global.requeue_single ...
> >  # futex_requeue.c:28:requeue_single:Expected res (-1) == 0 (0)
> >  # futex_requeue.c:29:requeue_single:waiter failed errno 110: Connection timed out
> >  # futex_requeue.c:49:requeue_single:Expected futex_wait_for_thread(&waiter, _metadata) (110) == 0 (0)
> >  # futex_requeue.c:50:requeue_single:Wait for thread failed

> Do you have /proc/ disabled by chance or is it not accessible for the
> test case?

I've had another poke at this, I'm still seeing it with today's -next:

   https://lava.sirena.org.uk/scheduler/job/2973947#L5558

It looks like we start seeing connection timeout reports a bit earlier on:

   https://lava.sirena.org.uk/scheduler/job/2973947#L4231

though the test succeeds.

On another arm64 system I can reproduce with a current kernel in a
kvmtool VM (so a rather distinct userspace, though also Debian based),
but not directly in the host where the kernel is Debian's
6.12.95+deb13-cloud-arm64.  The kvmtool VM does mount /proc read only,
remounting it read/write doesn't seem to help.

At the very least it feels like we need better diagnostics here.

--f3SPXGhwDEF95W0b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpWdNwACgkQJNaLcl1U
h9BamQf/TQ1b48+4PRI4EetzWZNFGwiJYK/VKxWNYEyRxSjHw+xgNBM4MIxBV/0u
eeoGv5kRUyTdAZd3CMvLiEy3BkmI6JhokIQrAdvXILb3hHzL4yFOgwLVd/o/MWbE
EQl/jphtygVWw+5VxMhl6fi7LKxyjWXtqWttYBvPyFQEfmA9CZvHLPfNBt4vNsX8
edShs1Dd6UZ1IQPeiZg6HRdH4kkWi+F3MDNrGK9mh2dzSU8aiijGNbIE0h4ZZddh
qqj7HbewQ37VYmFcFREZ+HwUwUK0GZlzudUkSJQRIXJxsXgvV4fvG1zGJP+oNhLR
jXAsEfb08vJR7bcM8TjnCJEAfHQJEw==
=PA8W
-----END PGP SIGNATURE-----

--f3SPXGhwDEF95W0b--
