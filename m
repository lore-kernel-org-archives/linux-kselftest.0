Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1070041B8E8;
	Mon,  3 Aug 2026 12:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785761105; cv=none; b=Gy6yjTYo4wCo7INQ+q4oPJsw+/gAT20GoAK87ezxGOnR2CW4uasNS1eIKcKawXmjuv1++x+rkQbZcUbxSlDohMor7hB97N6H8R2ctvFxFX5P3ZyGSqoypPlWm23wF8dQQD2xxhJmO8XQubXxw1ga4VTfxHUIPP5hF2B+6trbOgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785761105; c=relaxed/simple;
	bh=HLCj5xwTRyex8jZdnwDMK0YActuPwnD6AwN+TvSUMFw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F6MGYNQnGQVVnndlw4HGp63DKZCSzG/OsoycospcveHP0oYpHhGvqce/t0Wpg5mb4c9EEBddDb20BGh6MyQ8S5tvKyTLPwBFX/LaMheBYQmLDpB5Oqz5KT8GZAnb5RsUtFh0HlLMFgBlCE+IWSe/IAtutQlXLWpJlgTpgn8oM7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eqZwxJrd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eqZwxJrd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BA9C1F000E9;
	Mon,  3 Aug 2026 12:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785761103;
	bh=HLCj5xwTRyex8jZdnwDMK0YActuPwnD6AwN+TvSUMFw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eqZwxJrdOdlQPa3rTnZkA47Gq/L0PaeFNiSJz1c4/XlpmuS3bS6xnG5l87VMHfS9I
	 yjcLzHTl+q+VTapdxsE8dgUi1/hW4FC2ogP91/11Zony0BnBrI2oKX6u/Q28GkEbV/
	 0IOpO/GWFHjs5heWTFmZR/3aMurhG0JoXjdGryUyAOV014k0/HDZRcSJvZwPFN9G+k
	 84Hd69Fr9xMkObH9MTm4zZJO28/RzfW8HRPdOMKtCVYaco10OObbDEPF/96fhka7Q8
	 +u7dPKI4/GVlCGIGChv5RCdaja44tQzIZRexFW21sE2AdQEOmfQur8JO7+EJ1FSQGX
	 OpmYlee+PwrJg==
Date: Mon, 3 Aug 2026 13:44:56 +0100
From: Mark Brown <broonie@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Sarthak Sharma <sarthak.sharma@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>, Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>,
	Leon Romanovsky <leon@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/6] tools/lib/mm: move hugepage_settings out of
 selftests
Message-ID: <58fe5c12-bebc-47a4-957a-ddc27706e2c7@sirena.org.uk>
References: <20260730140825.238130-1-sarthak.sharma@arm.com>
 <20260730140825.238130-4-sarthak.sharma@arm.com>
 <178574760162.1561566.5251738533303087247.b4-review@b4>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mUCfwMo8GRiVCaVh"
Content-Disposition: inline
In-Reply-To: <178574760162.1561566.5251738533303087247.b4-review@b4>
X-Cookie: Prunes give you a run for your money.


--mUCfwMo8GRiVCaVh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 03, 2026 at 12:00:01PM +0300, Mike Rapoport wrote:

> > +#ifndef ARRAY_SIZE
> > +#define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))
> > +#endif

> We already have ~20 of those in tools, so one more won't hurt :)

> But really definition of ARRAY_SIZE() belogs to a header, maybe
> something to cleanup later.

tools/include/linux/kernel.h.

--mUCfwMo8GRiVCaVh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpwjUcACgkQJNaLcl1U
h9Bazgf/cfngbg5pby7Dmm2KlNQ9Z/Bg05gwuy7n/bFSKoqTanPLPUsK2h3toKB/
jpfIOXduwVufNrBBmQuAk6JyRkP7+xWNndv/fGM0rl62lHYSmo8Gf2Ug1TRT97rg
Ky1y3S1B9Wgk9ad+miUVsrt6ApWZbw3pZfOp8B0ZBERSVxuc0FqOmI/1MX2K6Mse
DwdMrkaLMKJNNW5nAM4RRoXQRIOVVQuDFsCNHIHJ8g41t99NS5vaifWGjSzAT3cM
JVn+Y4HnDZgCcpnEIBE+PG14rSBJS4IFwDbGbottbT+McBooSwJgJ8I01uGT+Lph
ES38vtIFI6V/90ilKpcxRYWSzpwzLg==
=I3v/
-----END PGP SIGNATURE-----

--mUCfwMo8GRiVCaVh--
