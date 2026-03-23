Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17EE73AB276;
	Mon, 23 Mar 2026 13:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774272500; cv=none; b=GDfDuhT8ZC/K4gfT8vYxjbE50SJw8p+J3oFweIprard/Lc2hPBo1qOhyRyUaSW/pooBnIWpacLeRbLC2O9CMqqN0psgjYTP92ddJjK7vCpkgRfvZkby+hmnirGqHCkF8ZWzOuYvWhTDygslaE7dPhP4XYlHPT4q57HyGudIE3DI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774272500; c=relaxed/simple;
	bh=ym0AwYcAOXJMdEMrjJNCKzEkdHnadzKFcycDIAqquPM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WcMW3uywS9HM+W4SBvUmcCzSq4+Yhfyi0o1erhLwaOfX7SAutTNKpYsyw3RNQq5+gfQq5qLVqul88i+SA1QSckIjoGXtjnnrF6rm8SDlKDfM3TBrZWYmt5SLXfHJDNuu+p2Iy83hrH3aXv6SNnW7auZpMmO4AdMugZ5vFXba5YQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hm3Lba8K; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hm3Lba8K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58979C4CEF7;
	Mon, 23 Mar 2026 13:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774272499;
	bh=ym0AwYcAOXJMdEMrjJNCKzEkdHnadzKFcycDIAqquPM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hm3Lba8KN0/+eBcK1zQbt52J6R0AYq4ORLL2dQ7tZ/RvrD0qbiDDBiXoyNVyq0/13
	 Iv6MmQ5q1A6cHSOtnDH+1RlRQQYPqfgXmweGMhY1C2TpW4JuoPZX31KL9WG1kJFBZb
	 pvjW14qcFX3x2bmfPL+OK8KsoIiGaMIaZV2PJRw6MUov3zB4EYazW9eiH7wcOJQ704
	 6EwKCZN4Wm0XwuPGpY/9Xl8cdbYaTHv9fmQpHMb4JPN2Hy28sKRxdLb/4MhH/6QnTF
	 Nj5XVT8SI7ErtJV8KUOeZmef0dW2r7rGrWylTYx/Paw5iHmU+o2HVq8BjeQl3aTbyD
	 +hA9smcv/v5DA==
Date: Mon, 23 Mar 2026 13:28:15 +0000
From: Mark Brown <broonie@kernel.org>
To: Emanuele Rocca <emanuele.rocca@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Clint George <clintbgeorge@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	Christian Brauner <brauner@kernel.org>
Subject: Re: [PATCH] kselftest/coredump: reintroduce null pointer dereference
Message-ID: <95c1f633-a4ac-4ebc-9594-9d96223a0a5c@sirena.org.uk>
References: <ab2kI0PI_Vk6bU88@NH27D9T0LF>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rW2v6CcB3qkbr4Lq"
Content-Disposition: inline
In-Reply-To: <ab2kI0PI_Vk6bU88@NH27D9T0LF>
X-Cookie: Avoid gunfire in the bathroom tonight.


--rW2v6CcB3qkbr4Lq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 20, 2026 at 08:46:43PM +0100, Emanuele Rocca wrote:

> behavior of __builtin_trap is architecture-dependent. On x86 it yields SIGILL,
> on aarch64 SIGTRAP. Given that neither of those signals are SIGSEGV, both
> coredump_socket_test and coredump_socket_protocol_test are currently failing:

>  get_pidfd_info: mask=0xd7, coredump_mask=0x5, coredump_signal=5
>  socket_coredump_signal_sigsegv: coredump_signal=5, expected SIGSEGV=11

> Qualify the pointer with volatile instead of calling __builtin_trap to fix the
> tests.

Reviewed-by: Mark Brown <broonie@kernel.org>

--rW2v6CcB3qkbr4Lq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnBP+4ACgkQJNaLcl1U
h9A3fQf/RC1uXf8G7q+WmYnWehsbxJLSviQBxMHY5KjBYpu3GR8mo+sdP62jgLGK
h7MHBMQEzyc/iyTVmmvVZZtSqyUF+dfgfujsoO/BefNVs/u1yxsDO443legi6YPr
3gOu+jqu3o5ZjyDCdyPLrN+WSYZo6nZKggjT1sTE5AgQvqbloCMzkweCUqdursqi
UbnF9hox1noq9kdtwp54dTwftCU73bRa8vlcjhYTP6WSUq3sMl8G1GYcy2aY2hQD
P7efAgZ+s7IBOMh6nRiFdiR00ov2HPfG6ClGPG7Noxpb7/Al1Qc/RvNQDm/X2HKi
SUTgOU54PvYIZGaPAe2qIPePFJKWSw==
=A7tJ
-----END PGP SIGNATURE-----

--rW2v6CcB3qkbr4Lq--
