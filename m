Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C1A3FD155;
	Wed,  1 Apr 2026 11:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775041397; cv=none; b=jNufSywmjei7P72FuMhiO2KyRWo9/H2FoOzyyi31bozJcbKl0WJ/ca+p1F74ugPBXJnDITM3dJzUSCh+GJL+1Q6nlfHVND+iEg4VJE2Jw+lX4T6s8AzAargdtY+hUZ/XYJjCe28SV6o+SwOzDfhE7va7ZAt504tkayfADkIbOps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775041397; c=relaxed/simple;
	bh=RH/XYoy0u1GXxuioMWBp+5tj4HkPtd9OVS7rZ8jnj3o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cw3Xifjk8pr2FgncjsTt1stpjqOgWUeaDNog+mR6Y3UTi/SSuLKvyZaWK7v4i2mJLLfHe85Z3TjuD2CiZXC88ntwtN12aNYtDp5r9eBiTjAcyQvG8e8W80iG/9AeeHQ0PE4x6K+LEfWoHGgkqaYH2ubhtVhEX6y6zE97jtQExfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aL0b4Yew; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aL0b4Yew"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 503AEC2BC9E;
	Wed,  1 Apr 2026 11:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775041396;
	bh=RH/XYoy0u1GXxuioMWBp+5tj4HkPtd9OVS7rZ8jnj3o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aL0b4YewS9hzxKIWWcxGghBZ3HN/cCZSjanrVtgvlJnUT97WpPDMbDKAHUq+C0NXs
	 g+ZioF+/oNv5M4DuW4ATayCcgkynj3WLHv8UBeNdhzBxM7x4F7Ie/0avlygPhWhPfZ
	 IYIowM15pgSBEFAjHjp37HOhMGdpPuOWEdvALeM4QGttnedLuBvMbF6om9+6RIAaWp
	 aZ4BsckZdUURf/oE1Tqg57dEFEczBoA6wUwVvJa30XjAzXhojNz+2MHORCYlSpXlFw
	 oAwTrTNGRq14AEuKy4I3DbhJd5Gbo59PwXm2+UJsRgooPh9jkTMyhHlteRdLbzPPyo
	 oLdnFyv6xgRmA==
Date: Wed, 1 Apr 2026 12:03:09 +0100
From: Mark Brown <broonie@kernel.org>
To: Chunyu Hu <chuhu@redhat.com>
Cc: akpm@linux-foundation.org, david@kernel.org, shuah@kernel.org,
	linux-mm@kvack.org, ljs@kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org,
	surenb@google.com, mhocko@suse.com, ziy@nvidia.com,
	baolin.wang@linux.alibaba.com, npache@redhat.com,
	ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org,
	lance.yang@linux.dev,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Willy Tarreau <w@1wt.eu>
Subject: Re: [PATCH v7 4/7] selftests: ksft_exit_fail_perror: support printf
 style arguments
Message-ID: <efbad6c5-8d5e-4774-8d0a-d455e6e2c182@sirena.org.uk>
References: <20260330151503.670415-1-chuhu@redhat.com>
 <20260330151503.670415-5-chuhu@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xo4ND846i3VDr5Tk"
Content-Disposition: inline
In-Reply-To: <20260330151503.670415-5-chuhu@redhat.com>
X-Cookie: You will be divorced within a year.


--xo4ND846i3VDr5Tk
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 30, 2026 at 11:15:00PM +0800, Chunyu Hu wrote:

> The ksft_exit_fail_perror function previously only accepted a single stri=
ng
> argument, which limited its flexibility for providing specific context to
> failure messages.

> This change updates ksft_exit_fail_perror to support variable arguments,
> similar to ksft_exit_fail_msg.  Adding the __printf(1, 2) attribute enabl=
es
> compile-time checking for format string correctness.

This is causing build regressions on the arm64 selftests:

/arm64/fp/za-fork-asm.o -o /build/stage/build-work/kselftest/arm64/fp/za-fo=
rk
In file included from za-fork.c:12:
=2E./../kselftest.h: In function =E2=80=98ksft_exit_fail_perror=E2=80=99:
=2E./../kselftest.h:427:13: error: implicit declaration of function =E2=80=
=98vasprintf=E2=80=99; d
id you mean =E2=80=98vsprintf=E2=80=99? [-Wimplicit-function-declaration]
  427 |         if (vasprintf(&buf, msg, args) =3D=3D -1) {
      |             ^~~~~~~~~
      |             vsprintf

This is because za-fork uses nolibc which does not implement
vasprintf().

I need to look at why this managed to pass the build testing I do in
-next...

--xo4ND846i3VDr5Tk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnM+2wACgkQJNaLcl1U
h9DE3gf8CyPPY0cS+fjVRrHslaPRCSHlXcW6VZnznjdKtRRFlBifghOePoiIZseN
By2f9+ZvZfElAWGMr2QgC+2AUkCgAzFJDJsjQNgxqy8yScuJ4zrp+qa49YUFVwiP
cgd8uDlzCskr9Uaqoo7dRegP7st74Kr2ZPVtGi+yaOh/aDZ9CD9L7pHG3cU2Olcd
lmRbjWNYIa7k471RVQTxC8FPWj2X0kY6X8DCB44BeqkWKnw1XgFZF8Y7HlboK5VM
RIS+ggqHuTJ3zOJiGmAalwCcNL9Pdj83axrLHW2EX2x1EEaVxV9spK1cdVDA8J6x
P2wbQfL9yT2Awy/9KJDfVxAfeQTuIA==
=Z1lx
-----END PGP SIGNATURE-----

--xo4ND846i3VDr5Tk--
