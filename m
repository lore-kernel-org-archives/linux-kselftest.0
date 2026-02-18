Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 513542FE05B
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Feb 2026 11:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771414382; cv=none; b=V0B6M3fQzTSEwIXfjfqE3KI+RPXeannRvWzFp8iUxyt+OAaH1S7BVmcwIkvvboegVdmr1T9bvzpU43+YJb/FO4eV8Q04Qu8DymCot4sU9JZ/7Jy8td6yl3WlkDpLxdor/qAlrqkPe04UO8B0/Ux5Qbjat43hTdyJO1ay4Q4HlCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771414382; c=relaxed/simple;
	bh=0CX48F8+5lwU4DMyRC5K4BUusGsP5md54wZcyKDZW5s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uMvXIxv/jvHagWEGgjGnOajWOviDJJ3R/mZPLXwTY9WYPSM6StNZ/8wby1uV1AJe+ELZ+g5fTq2KTitYToaLkLRKomQnCtt7LN8DzS6vYfdEV4cy0IrZCaD2+63jGBuK1XS/C1xgE9rRZr0b5C+0TlN0nFpVBjW08siero1xE/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=maDsT9+Q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="maDsT9+Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97E77C19425;
	Wed, 18 Feb 2026 11:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771414382;
	bh=0CX48F8+5lwU4DMyRC5K4BUusGsP5md54wZcyKDZW5s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=maDsT9+QPK+zGAoe+Un9ExfZiTAvW2IbjuvSvWbO8xtwUvTMPHnSC5wwbhPMpbtQf
	 wHCu3nNIZJzrM28T7gOQDcZbapcVyn9DUIVRU/7i72Rgo7rIC7oY1RNgKWSv4ddHs8
	 NSrEq//JYXEouxPQkf2FmuZy5v37UircohPUwNTEsI8l5lYMPUfrHRY8AyxgPRkXeJ
	 QFa32uyhErG5FyanFSsUJA3Xao6gMN4kCOgBLI1WR7JKrtq9Ojg3QXwwiiYnhNqWpO
	 0R1rQxBNOIWgxzqTcVWfOEmyYw1dOXpgRHVw+vuDPlomKB6+FXlcyYybO1TY6NUqtW
	 ODBCDo35J3seg==
Date: Wed, 18 Feb 2026 11:32:57 +0000
From: Mark Brown <broonie@kernel.org>
To: David Gow <david@davidgow.net>
Cc: Brendan Higgins <brendan.higgins@linux.dev>,
	Rae Moar <raemoar63@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com
Subject: Re: RCU stalls running KUnit on mainline
Message-ID: <ec319f29-5fc8-4578-8826-26ed29c6fce6@sirena.org.uk>
References: <b537dc5a-f7e2-4daa-bff1-d07c5852ece5@sirena.org.uk>
 <59e8c352-7bc8-4358-af74-fee8c29280ba@davidgow.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mYFQeGmbEGU2o2/m"
Content-Disposition: inline
In-Reply-To: <59e8c352-7bc8-4358-af74-fee8c29280ba@davidgow.net>
X-Cookie: They just buzzed and buzzed...buzzed.


--mYFQeGmbEGU2o2/m
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 18, 2026 at 04:53:16PM +0800, David Gow wrote:
> Le 17/02/2026 =C3=A0 10:10 PM, 'Mark Brown' via KUnit Development a =C3=
=A9crit=C2=A0:

> > When running KUnit via qemu on current mailine I'm seeing random
> > lockups, frequently but not always reporting an RCU stall.
> > Unfortunately these don't seem to happen in a consistent place which
> > makes it hard to figure out exactly what's going on, they started in

> Hmm=E2=80=A6 I haven't seen this yet on x86_64, but looking at arm64 and =
32-bit
> i386, I do see a sporadic panic, often with rcu in the stacktrace. Seems =
to
> happen more often when the KUnit test kthread is starting/stopping
> (particularly, at least on i386, if it's due to a trapped fault).

I did see this on x86_64 FWIW.

> I've not been able to reproduce it after reverting the kthread affinity
> series (git revert -m1 d16738a4e79e55b2c3c9ff4fb7b74a4a24723515), but that
> could just be due to luck. It's flaky enough that my attempt at bisection
> kept pointing at documentation patches.

Yeah, it's not reliably reproducible though it happens pretty often.  I
did try things like retrying N times to see if it fails but I have a
horrible feeling there's some dependency on the specific build somehow.
Hopefully not.

--mYFQeGmbEGU2o2/m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmVo2kACgkQJNaLcl1U
h9CAUwf8DPd9xrRlDqTI4nVriXqiGs3zuBi0+VHQirBYEmi1Mxe/ZaAdYyQeRgXV
xtDWmCFSGm/gTasHpdnNcnD4cYA9ZUvf2MP0FUV+X4Evi2dy+4hUFUn8jzA3YjYb
jVZh1DRcr06TZbA1oMkMPiyh3GbBNEjmdOq/O2hG5uRNvRs9YhLx/o/CLddvgs3R
bb1FxYo521SqYcte7effDDxCbvxRHHqfM9KwEYPy2Cia/VGSgKPe70ohQjH01c7Y
k5PLs17RQJeRLePqIdcIzlnCTI8q31J6fK1F0amnoUtDeSdzjUfwwMvU/rdvnnYd
vcsM3UNBByQTyfm0uoaGEY4EhsM9tg==
=3BtB
-----END PGP SIGNATURE-----

--mYFQeGmbEGU2o2/m--
