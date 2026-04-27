Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31BB935C184;
	Mon, 27 Apr 2026 09:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777283156; cv=none; b=NNvd8om2CF8IuBG3yM3S5b9lqz3b6iZdRfRTypyR1+6G4g9aXuY9AyYs1ILUB9FozgguzGwTRCLOj/jSYiXlvU1IhDGvq2Vz3Zdr5nwXFgoM7ZaY5If2V+CFIHIHqYc8RGLTOmv1mD0I7K+jWSqzQgXhSoW5lSesJqtjb26AQVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777283156; c=relaxed/simple;
	bh=isjUBm9ZnfeVq00beWsqNNEypGwAPQWGomwp/CzhDoY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ARFLqwt+F+J9bdXaWW+PBY/h6W1xvMkLY4eov2FGVH/Z5Bh/dBPwAGtUwA+V1YQHzbvmYlAFfEtavQbDyp0qhcUvR/oWePwdm+iQyB0z/NLEd9Dya121Lrcjg7XHTluEo6f+m9ZBo8p6UMFd/XLWJlGaQJFoaVKpT50rQ32TVw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BD99g3MZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BD99g3MZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E387EC19425;
	Mon, 27 Apr 2026 09:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777283156;
	bh=isjUBm9ZnfeVq00beWsqNNEypGwAPQWGomwp/CzhDoY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BD99g3MZltYvFYIuAtPBr1bwuBD6/DRlleri4FEj/6kcy8u9Pf3/4xq/mP4sFVhzg
	 adrtCIie4RyXwYvAnV0XJkvP/DzKsT0BYkRjmCYF0P4LFNscYjV1QecA1hA0+8LbPJ
	 N1WtprZ2Wd5KybcAzmPjZ0vlBGiq5JLsO/oSbwEO1U0COPTy5k7y+AP4X686H+3ZJO
	 u4FHOGz/euk4/rCcpx3ZFTGu6bX96Xdsqfh/2b9LIt5nbt0wtXrjTAFLJRJgEsLiFH
	 LhgL96Fi8l2DFhQlqd49cUhyNozBbE6GxB/fQPjCYv7Q0la4LkxKVTkcyeg/kbPict
	 sDThFTXQG2JSA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 597991AC583B; Mon, 27 Apr 2026 10:45:53 +0100 (BST)
Date: Mon, 27 Apr 2026 18:45:53 +0900
From: Mark Brown <broonie@kernel.org>
To: Sarthak Sharma <sarthak.sharma@arm.com>
Cc: Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Barry Song <baohua@kernel.org>, Dev Jain <dev.jain@arm.com>,
	Donet Tom <donettom@linux.ibm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lance Yang <lance.yang@linux.dev>,
	Leon Romanovsky <leon@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
	Michal Hocko <mhocko@suse.com>, Nico Pache <npache@redhat.com>,
	Peter Xu <peterx@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>, Zi Yan <ziy@nvidia.com>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v2 10/53] selftests/mm: hugetlb_madv_vs_map: use
 kselftest framework
Message-ID: <ae8wUSJusD1u_grJ@sirena.co.uk>
References: <20260418105539.1261536-1-rppt@kernel.org>
 <20260418105539.1261536-11-rppt@kernel.org>
 <4d25a566-1e37-4e31-b304-8fa6ce7e3ec4@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iLNEbpoW8iVFtLSb"
Content-Disposition: inline
In-Reply-To: <4d25a566-1e37-4e31-b304-8fa6ce7e3ec4@arm.com>
X-Cookie: Victory uber allies!


--iLNEbpoW8iVFtLSb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 27, 2026 at 02:19:25PM +0530, Sarthak Sharma wrote:

> Seems like there is something wrong in ksft_exit_skip(). Should we
> change this ksft_exit_skip() to ksft_test_result_skip() followed by
> ksft_finished()?

If it's causing issues we should probably just fix ksft_exit_skip()
rather than open coding a fix - I think nobody bothered because it's
mostly used during setup before having planned anything properly.

--iLNEbpoW8iVFtLSb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnvMFAACgkQJNaLcl1U
h9CX3wf9Fu2krEJ+4z8cXiWjKnTbj4KknBX1P0yHSPUmkgJc8rdAqgrLt337LbKE
YkaadqkiEWoI8HHlpARfFxAdlTw8XgmACpe0obuj5wUnNKYg5Ksg6E9kvMjEF3lB
RrKI2v0LOq8FXvWXSwsMakAp63VXyPiob5/0fKD0D7qOZnQhy394KMAOuRASpHKG
z3OBxXhvrZp6kF/XUNtV1QeWPrgzb5RBA8OQeI91cstutpVmeMSvV4ROFJiEeq1b
l7p192srFB4288+DOD4pakxNVoNnz4QzTwHMNk3ZcN9ehja++g3S2vbpjBuz3EE2
l3cRfr1D6RoxuVoSukaAO5QdCSBZ3g==
=5Yit
-----END PGP SIGNATURE-----

--iLNEbpoW8iVFtLSb--
