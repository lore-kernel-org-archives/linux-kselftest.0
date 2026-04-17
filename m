Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B60607262B;
	Fri, 17 Apr 2026 13:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776431434; cv=none; b=EjXU2xQ20oIH1LS7oxorbrc24PldJz7ukbBPQY6pqVy8gssAg5/tZeWyNGuzvfeqteSiCiktG4t46+OglnDtBrxXWk85vRTF0ZwpUSkyIBkI3Lkd+MMSXN/6pR7ut0WFzbnq+ZFaEJ4Sb/F7+82Fpqs6vYwBJa6eTXpTZWeuf2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776431434; c=relaxed/simple;
	bh=S0nMWMkEdOz4BRrhSoV6itAbptEUCdThzYvRAvCodLs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hUDHv/kUvwsCMP34S8CaEw+xU+3YJeJBZa+ejVR/HleHK36L5XJbXHgphA9ES1p+MI3ZyMYR/MLb3bwxf+cphjvs1ffubFCy8Oy3uWFSIwLuyDsFbB2HNTI9IxYSu7KP1dciWbh0UnLktqcYQNz5EUAHEb1lDaFtrD1wYoKkF7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V40DcYvM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V40DcYvM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5B17C19425;
	Fri, 17 Apr 2026 13:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776431434;
	bh=S0nMWMkEdOz4BRrhSoV6itAbptEUCdThzYvRAvCodLs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V40DcYvMWWtmCH+5BwCYDlitfg3hbz+z2m6mnpmXeiMX4St7/Uzh+8L/cXyBE9eN1
	 EsaiLoR99oEwbNkxqmYtmFFSa52g2MedoatY7WSvWBXTtzKgfFJw1oGveYVGAKLdcH
	 zf4X2c4Eoq55mVYoHAQv0gCO/TpWowi0lCXmVNuqv588RkD6rh9xbm0i7+Yh4AednP
	 A1KrsDHervl1QTVqTAgtWbdFg6if8GFbaA8KC9LyrqiMMzMkfieqOMS9PYbT8PcoRU
	 mFaIqeyZsGnx13821FpNj70UzJbUllTIgB3phEkzCwWg2o1lZwig23c4nxhvGcm9F3
	 l4RBYs8jgDHog==
Date: Fri, 17 Apr 2026 14:10:28 +0100
From: Mark Brown <broonie@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>,
	Aishwarya TCV <aishwarya.tcv@arm.com>, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/mm: Specify requirement for
 PROC_MEM_ALWAYS_FORCE=y
Message-ID: <0fef4cd9-e897-4830-9d37-f52ae9a33aa1@sirena.org.uk>
References: <20260416-selftests-mm-proc-mem-always-force-v1-1-3f5865153c67@kernel.org>
 <17ea54b2-d43f-49a9-9dd4-d2330a8daa92@kernel.org>
 <5357ef55-15c0-4c66-867d-898fa7f51414@sirena.org.uk>
 <aeE4XSuXY8RfphVs@kernel.org>
 <aee4e68c-077f-4056-9d40-69bc849d1538@arm.com>
 <aeIqg0m3YL9OAyH5@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="edS2AhsUYP5/qUYR"
Content-Disposition: inline
In-Reply-To: <aeIqg0m3YL9OAyH5@kernel.org>
X-Cookie: Uh-oh!!  I'm having TOO MUCH FUN!!


--edS2AhsUYP5/qUYR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 17, 2026 at 03:41:39PM +0300, Mike Rapoport wrote:

> Yeah, the issue though is that open() succeeds regardless of PROC_MEM_
> setting in Kconfig. With restricted /proc/pid/mem the failure happens in
> write(), and there we don't know what actually went wrong.

> We can try checking errno, but it's fragile and it's better to fail the
> test if write() failed IMO.

Oh, that's unfortunate - you'd have hoped that opening for write would
fail if you can't write.  In that case you're probably right that we
can't do much better, possibly adding a log message about the potential
missing config but not sure that's worth it.

--edS2AhsUYP5/qUYR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmniMUQACgkQJNaLcl1U
h9B8QQf9GBdnFFlhg4G17leX5BmBV6GXASVwvG8Q+tTuwrKGl/PCE1vc7KQY8eCr
4kAO+GSsVwvxnqz56RE1O92/xU99iiUd6wFbIfpc+ATWTN4jxZk9NIt/FasNFc6b
8gd/NYDi1rfRGXGxNwmYJCNh4Cx4XM0xe6VZ5dwhyRIXqE6LG89aC9UWROse3Q7n
TR5nffGMskQ+FhIpjmEHm1UWcKaAj2yIQ9b3HPQBSBMN3nL1jQoH1Q6mjvaOpHOf
1lw3/0h0AfTPMOhiqRRTORBxnelE8WqAt4JwqwA7p4LgCg0JoNCnGtEQmwDznANJ
rgPYZ66U8O5kbvDJMzCWk2bdqPCZNg==
=v96S
-----END PGP SIGNATURE-----

--edS2AhsUYP5/qUYR--
