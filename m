Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF2033506F
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Feb 2026 14:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771337428; cv=none; b=YL2sOeav7/xgHWP2M1/dC5UIWdFP2VPjFXTHCS+VxrfCu/MIMShgCpI9zdCv0qUf5Bbb9lhfKzT1IzeC+XZYR42bjYjxFIyWzCb+lEry1yToqOPJ8LsqalXN7VR4tO/4p2jj6MpjJ/d0Qhft+l8KBTNcWCGDme6JGM/T5jZyL98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771337428; c=relaxed/simple;
	bh=8A797m62rD/nAKOqE6V+d+qZTA5vh0xdKp+Yegjy3qw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cPlWZQ/LReD70VbAAl+p8APKnGW1SVX2LL0TDoZglwTYzehqXr7C1lnAVmeiPIPzgZq6VED06T2kgoMTHXVTRavcm8+vOUvvHEYvivKczeQDqnvUCbqFCLyH82FycdpF7qi4a/AeHdRH2JFtDvZFalOFjAvbz7It3cbDk8PtkrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nja7gunU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nja7gunU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10396C4CEF7;
	Tue, 17 Feb 2026 14:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771337428;
	bh=8A797m62rD/nAKOqE6V+d+qZTA5vh0xdKp+Yegjy3qw=;
	h=Date:From:To:Cc:Subject:From;
	b=Nja7gunUAX1E0p8+UEQCNKwrBB+BCsVDqMxDfLYf2E9J67Zr3aGreFV0ILpydZCqJ
	 gr4nPwKq+OZoBCdb2Hky72ezF2K7Rd8uAr1vEd0RKgqX005lAJGJdBFXjaoXmjBFyL
	 LRDUEW2tnGcldjAEOnQ3gfeaIaheX3ubhFlP9ZD/Ydp/Td0JfYmC/p1mQBLrsdtBfp
	 201GDWPtmIdiO9FxE4TUZr5+dhEwcxhJ0MfqVI4DvoyYjaOus3q6J8GjfmOj/CMo2z
	 ejI8ndMBXYob1ezcMYDkZLPNRBc025wSg7hTqvqYhJDXlf8/IMDJo2f6I4k+AyJvl2
	 cuAKmK5mjqTgw==
Date: Tue, 17 Feb 2026 14:10:24 +0000
From: Mark Brown <broonie@kernel.org>
To: Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <davidgow@google.com>, Rae Moar <raemoar63@gmail.com>
Cc: linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com
Subject: RCU stalls running KUnit on mainline
Message-ID: <b537dc5a-f7e2-4daa-bff1-d07c5852ece5@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EOBEXUh5Qbr0bafl"
Content-Disposition: inline
X-Cookie: I'm into SOFTWARE!


--EOBEXUh5Qbr0bafl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

When running KUnit via qemu on current mailine I'm seeing random
lockups, frequently but not always reporting an RCU stall.
Unfortunately these don't seem to happen in a consistent place which
makes it hard to figure out exactly what's going on, they started in
-next at some point shortly before or early in the merge window but I've
never managed to drill down and investigate them.  I don't imagine
they're due to KUnit specifically, though it seems likely some test is
triggering them.  Has anyone else seen this, or do you have any leads?

Thanks,
Mark

--EOBEXUh5Qbr0bafl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmUds8ACgkQJNaLcl1U
h9DNtwf8CTVkAo3uWWPgJ4T0RaIAAyVQ5XCD5Frg9HvVKBaec+aclcws46OMVUsV
nJdm1bfC99E37/cg9Ve47ddH4PN5S8TtNkyzpVLzDPS4SUSdDWdohcNlnd5xP94m
5H5fgR5GBVf9gotA6aPk/VUrzvPi0YVJx30tl07O3to/TXcPqr4k8cG5GIhOLqA3
tr+c+yV48x3I08XyGUtcpT6xX/22Wr97OlH4qKQHJ+7bUfCzWKNon5+gzH57Cxo5
ZdW+zbysatqZ7q0aLJcaSPAhbIEY7Tos7a9NJEf9HUbbqIrTR/03aRdwj1fyGEKX
bNIX8VL7i2/AMSE3ZtAhSH8n6sDjdw==
=NpNu
-----END PGP SIGNATURE-----

--EOBEXUh5Qbr0bafl--
