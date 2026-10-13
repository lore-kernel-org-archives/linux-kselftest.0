Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B49BF54B1DA;
	Tue, 13 Oct 2026 20:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791924483; cv=none; b=R+yieOGtnNfBW+sm/r7GMG/fnX1rpQuF0mNNPeVebT5agAwUI0oXl/+bL+sFFY0xxJPytjdhBCSTQ1zbX/4YcdWBlWdrrEtDCcjiZOOCvzjSb1AZ0Y0/HpV0UAbOSln9d25fM3D54FgNGpUW1c7eFQIBRIpSoYJwQwf03s5AwK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791924483; c=relaxed/simple;
	bh=V4K7u9F1P1CDlj5fUnSPJS4oHFxKmDwId/qrHhK0X6A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bjoinJAZxTGVP3NQiY78EVP/DaKibbOgjjDJwd+gW6nDaE84RkKvZRkBBcUTB24RedB+4lyjQZ5Kflb8qd1ntJ/ov2eiHKI+B5yRhBXBok6JKO5mXcgR9+Y7iDD1Www2SMYv3zEOWJX/dUlhouoIhIuGoVK7k57oNd3MmbIXJ0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hgzs/a9B; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hgzs/a9B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38CD51F000FF;
	Tue, 13 Oct 2026 20:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791924482;
	bh=gMxE4ZdPVRtE6fI66mvqhnoZewZFcpk9HQER54f9cCg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hgzs/a9B47yAsp7A03AqI1YOPAfx7YOEXnndDlth2U0Lf6dK1Y20Pt15scIOKipgy
	 iZAZlVe6kVzbVzwaa6gFVkXeQmM/7sP8km/eWi0MHfxl9Tkp3M/KLapCqwgZCQtTNk
	 sTLKQQFU6rShE+v5VlGeI8o2oY6hoaYgc5V1qECveZMLX6bZC3eVHrd88SOUtpd8vn
	 mZAAQqgjrD7EFUeSI2ouEzk5DVmhI/8j50LKBFrk2rxN2BIfKv6qoQn0rYlLlvlpWx
	 wdJKR9NRwJPi/sW5rOO/BoKYuOr0VKuWWhSJjI8kxGlmguWs32s/chsb/uAtonrb+/
	 g9x6wRIhahWCg==
Date: Tue, 13 Oct 2026 21:47:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Daniel Latypov <dlatypov@google.com>
Cc: Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 6/7] kunit: tool: Serialise output written from multiple
 threads
Message-ID: <a4019200-dfa3-4e73-9918-857ef40c21ef@sirena.org.uk>
References: <CAGS_qxrRMoy2fB3zzpD=bOf7R4not5TqpDXE3a-dRKJOpyRt8A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MQ9cNM3RMOGSnrEA"
Content-Disposition: inline
In-Reply-To: <CAGS_qxrRMoy2fB3zzpD=bOf7R4not5TqpDXE3a-dRKJOpyRt8A@mail.gmail.com>
X-Cookie: Some equipment shown is optional.


--MQ9cNM3RMOGSnrEA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 13, 2026 at 12:53:08PM -0700, Daniel Latypov wrote:

> Firstly, thanks for taking on test parallelization!
> In March 2022, I'd written a proof of concept that worked, it just
> leaked some memory on the C side so I never shared it.
> (Instead of using the existing test filter glob, I'd added the ability
> to specify arbitrary test indices to run a slice of tests)

Perhaps that could be done by adding --run_isolated=N or A..B to split
into numbered blocks of tests?  TBH mine is implemented this way so we
have to solve fewer problems but it does also feel sensible to be able
to compose the paralleism and how things are split up.

> I'd have to reacquaint myself with the code to actually review the series.
> But one thing that sticks out immediately is, my version had added
> this new type to avoid the need for any locking:

> It required passing along kunit_printer.Printer objects to more
> functions, but I think it might be a cleaner end result.
> By explicitly calling `close()`, we could control when exactly output
> gets flushed so we can avoid weird interleaving.
> It seems in a later patch, you write each kernel's output to a file to
> get the same effect, but an object like this could be used in more
> places.

The existing code does log the kernel output to test.log, this was
piggybacking on that since those logs are there anyway - we'd want the
separate logs regardless I think.  That doesn't preclude doing in memory
buffering though, from a first pass other than invasiveness the only big
issue I can think of with buffering in memory is that if we faceplant
badly enough it might be harder to figure out what went wrong but I'm
not sure that's a real issue.

--MQ9cNM3RMOGSnrEA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrOmPwACgkQJNaLcl1U
h9AFZwf/ah10gNKGQfDRt+4tA5fmeGUEfEwmPUR4tJlAH+io+17tvYwW34uBDvdQ
6e7hfkt0Y7fwgEENKNJldTHKvr8r6viQI9TZp2Ppt/pxJ7Igg70qt0eKkzK3hIFn
vMV+E2XdpbWFNq6n0nX2F418oFIb/nNrZtLD/BwVRbZAlf5L3ZR3ET5HnQuIXLTj
hmJ+9kK3j95CKX4bqqxz7uvJEbyYu/kdh3TeAcJlcxsi1tATgsLD0QOpEMqrK9KE
EluShD2GAnX0yZ8tvpmnSwicMD7sKFt5reZBF2TymgoA0/5gu9RYyR75jyhGOqO3
+5m8ShFhH66C+gC7Ep5RaUwzZcWsYA==
=6M79
-----END PGP SIGNATURE-----

--MQ9cNM3RMOGSnrEA--
