Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4652C4EC65C;
	Tue, 29 Sep 2026 22:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790719413; cv=none; b=MJmTDZkXRoZvbwVjVA/qZDi9IjY2NhyAtItD+vSv7clo2tzwJMoCuW0mCR9tPcX+Tc7m16/bnLx8PolKE0GJvbXA9sil8pkAQSlpTjqYMrV0UXoJeTj0ZLo6YMlhi65vB/HLJNq1dfFK4vBxU13g37pYzwtGQOS498ZLzNXcPSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790719413; c=relaxed/simple;
	bh=xv8YOZN5Exepypbq24b/k1Km7GfktNrqLP2hJw1SNC4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BSttU/JfEd2MourEf6C6h/BDFsJFe8BAG+zNgnvELGkhYv45ttZ/0OdH2tvrGcYOOtzih2nk7y5n9M7XQWCGjzlSBcNkeraqxkvCS+6P0KjYLZzShYZq/NPbp5zNb1E5iCvjgPdacuExRxXhgo+giaUUG0Pk1D8ch/zqS5OsOWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mMO3s90B; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mMO3s90B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98B401F000FF;
	Tue, 29 Sep 2026 22:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790719411;
	bh=v/nJ4k1u78ke7ZIHZ4IMT2+oEY9uF0eOOz//6bbIgqY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mMO3s90BPyVNAf3nUTt7RP3vpKU1sWdUZrUeRmMYdW/AKChDH4asRiPP6HJwxqnyB
	 B1zy1qrfD/5nHEfgGSU1E9IIIEQ1MIHwxuMke8DCbWfqMnf0myGRguUW/8ScsTYajh
	 qz94KFKNJtSIGMHhgdpoksf+uJuLDgGTpj0u/Zo0kU2rM++IUD2qk+jE6cVNpE77wz
	 aYMorE41+yHTgN4bBWx2Yhb572oTvAs+9aWhlC023k50o2sTVgow2/6ZKEtZPoemgo
	 bvktGTajcnXcxEAxxKURHAZ8p4vrR7ZKgm6Lob1JpEtk507QyPnQYbEzinEldEG7kh
	 PgOKbB8HgOlMw==
Date: Tue, 29 Sep 2026 23:03:27 +0100
From: Mark Brown <broonie@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 03/11] kselftest/arm64: Move exit calls out of fp-stress
 loads
Message-ID: <489314ca-0bdd-4d19-8f53-cf0b38130da4@sirena.org.uk>
References: <20260901-arm64-fp-stress-kvm-v1-0-31bce995b49b@kernel.org>
 <20260901-arm64-fp-stress-kvm-v1-3-31bce995b49b@kernel.org>
 <arvm8O6kL1I9Plrw@J2N7QTR9R3.cambridge.arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yhcXNUoMVHeEzr/M"
Content-Disposition: inline
In-Reply-To: <arvm8O6kL1I9Plrw@J2N7QTR9R3.cambridge.arm.com>
X-Cookie: 1 bulls, 3 cows.


--yhcXNUoMVHeEzr/M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 29, 2026 at 05:27:28PM +0100, Mark Rutland wrote:
> On Tue, Sep 01, 2026 at 06:06:43PM +0100, Mark Brown wrote:

> > When they detect corruption the fp-stress test loads print load specific
> > diagnostics and exits with a failure status.  In preparation for
> > building versions intended to run as KVM guests factor the exits into
> > asm-utils-linux.S.

> This is a good cleanup, but I do think it'd be worth noting that some of
> the existing asm was wrong and worked by coincidence.

> I did mention that in the patches I linked you to a while back:

>   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/commit/?id=922d15ef46cb486a79f168949e103f6df26f4fba

Ah, so you did.  To be honest I'd initially forgotten what was in there
when I wrote these, though I did go check them after writing and should
have updated the changelogs when I did.

--yhcXNUoMVHeEzr/M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq8Na4ACgkQJNaLcl1U
h9B6XQf/afmbwqYeX8wC1xYdsrffIp0UYaX5YWRV++8pmaaLaLV1J+8tGXCUQ+yB
iio51yiXRE4/24GNDnX0AdMaxsruqbgUi2Oy9EWMcY9/juQqWkNAfz9iXo1cUEPm
mJ4Nl6LNNC7GRdO0a1vdLaM7bPQVmb/bS6hl7tmDwgf6Ysz8YEfsd3ww5ARQmlHp
ybmzWIytlXREenELwE2+iTu3x2iIS3pjWIbqSnKF94oNZt+MeoFKo9yoc7T/4qbu
VFUPBK50gtAq1Xx8M1yPk3urF2sWsbgV/Ya5hwQik1haeEBr/E3i/BTLnXDg7K/1
vLmUZuilkfnFkfJkR6XfF6WLOAc+4w==
=8oJI
-----END PGP SIGNATURE-----

--yhcXNUoMVHeEzr/M--
