Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C96FC279903;
	Mon, 27 Apr 2026 22:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777330001; cv=none; b=r6/4s07spiueWGMVteQOFMknzSpWLt58s+nzVSL5Lg43bNXD+9LjmeF2l99ZfsfOGA66fuW6V65S2XJ8V24YlTdKwfXOYqMQ+MqsiCTiOLwIalbh7ggPr2WJOhYfEhZf8FC8PPr0oK71e7pI7bSUvSEHxjISjt5RTB7wK7DPOtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777330001; c=relaxed/simple;
	bh=n5gFq9q37eYKpFEcXLpgRDH09jgbIoc4l89TWPtZg0s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kmOFhr8m653+s00Z7QgNP20hauA3vYftp8EeK0U4C53XlPvDDmwyU4O/TNlSnn9wZB8TqaIrnAySKlmF/fZRsScQXv2fHsrlTD6HfAsTGUvt7hzBGjzJcdGwHJHJsy8MpY364yO2whfR4DeQZ7a6kXVmeLGZNTUlFQO2fUhvTEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OQu9oUYs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OQu9oUYs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E033C19425;
	Mon, 27 Apr 2026 22:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777330001;
	bh=n5gFq9q37eYKpFEcXLpgRDH09jgbIoc4l89TWPtZg0s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OQu9oUYsYCA5E4F2chgkBhPx7BhwwQvWhe7SkkMd8nN9Jp2nQZYBy5Mp7TZL7su7l
	 QIhmn/x0nDaH+g8x9rzR2pXfNCE4+W/vkz5f5hqMz6eRoBAHNgQ9oLfpom1md0J1L2
	 7Z8UDRvHteltaywJQMHCXLQDkXUhVCOa1CId1e0lpF4rsaKO7fWYKC0ACqilL0Ru21
	 3clRUMWEFImj9oGoaz1pUK5o1/apmrBAOuuBJw7xkje/103APz4S4LBfkr9xbzdKTt
	 eLEMHQKQVyELeh8Q0t0Ph6ESjvnZ52sCNjhTzzW7sP75xVOQ6+Abvp0kIgaTw37UYp
	 krv+IGQJ5QFIg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 17CD21AC583E; Mon, 27 Apr 2026 23:46:39 +0100 (BST)
Date: Tue, 28 Apr 2026 07:46:39 +0900
From: Mark Brown <broonie@kernel.org>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>, Shuah Khan <shuah@kernel.org>,
	Will Deacon <will@kernel.org>, linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/5] selftests/mm: Fix resv_sz when parsing arm64
 signal frame
Message-ID: <ae_nTynMI26GV0PN@sirena.co.uk>
References: <20260427-poe_signal-v2-0-2bd9d6f16ab4@arm.com>
 <20260427-poe_signal-v2-2-2bd9d6f16ab4@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WzzMpVDZUqWGuynT"
Content-Disposition: inline
In-Reply-To: <20260427-poe_signal-v2-2-2bd9d6f16ab4@arm.com>
X-Cookie: Victory uber allies!


--WzzMpVDZUqWGuynT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 27, 2026 at 01:03:34PM +0100, Kevin Brodsky wrote:
> get_header() wants the size of the reserved area in struct
> sigcontext, but instead we pass it the size of the entire struct.
> This could in theory result in an out-of-bounds read (if the signal
> frame is malformed).

> Fix this using one of the existing macros from
> tools/testing/selftests/arm64/signal/testcases/testcases.h.

Oh, good to know this is peering inside the arm64 selftests - it'd be
good to document that on the arm64 side to avoid unpleasant suprirses.

>  {
>  	struct _aarch64_ctx *ctx = GET_UC_RESV_HEAD(uctxt);
> +	size_t resv_size = GET_UCP_RESV_SIZE(uctxt);
>  	struct poe_context *poe_ctx =
>  		(struct poe_context *) get_header(ctx, POE_MAGIC,
> -						sizeof(uctxt->uc_mcontext), NULL);
> +						  resv_size, NULL);

Reviewed-by: Mark Brown <broonie@kernel.org>

--WzzMpVDZUqWGuynT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnv504ACgkQJNaLcl1U
h9A1aQf+L6+uuz3D6N7BR58qAnQN3BS2/tl81soQVMBU56wRidU7GVgf/AtWw2jW
/LVlvMuB8Ap2uzlr5zjxrd3ZTM5XbOcB81WKJIxyhN7hGmivevjwwXvx2suhJhHV
qz196HjM076yvXa4/Rp6AhzjnAfVC6TpxRr6fZEemMOuX9sVnn4DB5dwXI0UQlgj
Rzg/gYKPM8IAAqeXxH+m4sICwgXYfC4WQSn8WsCJMb96EGM5ar84/c1PRqYFAryU
TWLt9PgfB7B0vWGgMWVkLbnx925WhvoD8T1fDz7jOUUURkn9nxrDKSRsHfJG/toR
HUA8Boacpswt9EXt56PfWIC5mySyhA==
=Khap
-----END PGP SIGNATURE-----

--WzzMpVDZUqWGuynT--
