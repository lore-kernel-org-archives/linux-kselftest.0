Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5DE226CFE;
	Thu, 16 Apr 2026 19:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776366659; cv=none; b=VIFcNgeLXf6CbJH81q21I/yBtOhxdgD2ZLMsjb/zxY6E9K7R9swSzhPBfVuet2/abhboJ6cH7LuW6Ac7t9LuWIFnQP39pViFAAiZuBG/wMAvxiJvOy1CCcTYXLmBUFpRdgAZN4W2mPGa7lxHA78nBX7Dg5+LeYyHf1/PDCOk/EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776366659; c=relaxed/simple;
	bh=CvSW1KMGTGHws0iC4zpjF+GxD72r6mU2H2BGcWbBFzE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oygLfutziZx4FNoSmasGNP6IgPxo9rhweOJC8DTgmvw34ju2jtCNwFjeFiyeJWxJqfXlGuNzDwIkF6FRD6/K1XWJUldN9sXluCr7jYlNTAij1XJC/lZHLwiCZc4WclvqhKxW9AQ3ij/UY2syYyAOMzUrWc1vEZ53fUU2h1ur/A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AdDG2SEq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AdDG2SEq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B0D5C2BCB0;
	Thu, 16 Apr 2026 19:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776366658;
	bh=CvSW1KMGTGHws0iC4zpjF+GxD72r6mU2H2BGcWbBFzE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AdDG2SEq7V1073NS6t85buzovap8euRUdz2Esw+6qwP14aD3sGgTpoHPKqECwi0JF
	 cHReHR8B3J1Np6Plvx7s7cwFj7KhN952g1+qDbcsPr9Mzsb/kH85VGJzk5531JaK4u
	 cO75R2/LxszuxB0eKh8h+ifU2Ttw5MFcjcGCyAvIWO4VBWnF6hOr5IeE7uaB515fx6
	 Y2bP/5XuEpCmJhbMT+EGQPIaccJ43rP8xB2cV7tSQMD0KeezJfHWL5gpGwpSfU1eu9
	 vWMldU/LJlM6MyudCm0CEUnTI3+Rktap4uKv/dIR0GfkPZ3L05WM9v1Xyiy9Y+6vX+
	 DhwDW3YcUNljg==
Date: Thu, 16 Apr 2026 20:10:53 +0100
From: Mark Brown <broonie@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>,
	Aishwarya TCV <aishwarya.tcv@arm.com>, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/mm: Specify requirement for
 PROC_MEM_ALWAYS_FORCE=y
Message-ID: <5357ef55-15c0-4c66-867d-898fa7f51414@sirena.org.uk>
References: <20260416-selftests-mm-proc-mem-always-force-v1-1-3f5865153c67@kernel.org>
 <17ea54b2-d43f-49a9-9dd4-d2330a8daa92@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HEiFX0I1YfdPL4ri"
Content-Disposition: inline
In-Reply-To: <17ea54b2-d43f-49a9-9dd4-d2330a8daa92@kernel.org>
X-Cookie: Process promptly.


--HEiFX0I1YfdPL4ri
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 16, 2026 at 09:05:11PM +0200, David Hildenbrand (Arm) wrote:
> On 4/16/26 20:40, Mark Brown wrote:

> > Several of the mm selftests made use of /proc/pid/mem as part of their
> > operation but we do not specify this in the config fragment for them, at
> > least mkdirty and ksm_functional_tests have this requirement.

> I guess we could teach most tests to SKIP if /proc/pid/mem is unusable.

That would be nicer, yes.  I imagine some of these will predate there
being a configuration option here at all, it's possible there's newer
tests that skip cleanly - I didn't look at the skips.

> Acked-by: David Hildenbrand (Arm) <david@kernel.org>

Thanks.

--HEiFX0I1YfdPL4ri
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnhNDwACgkQJNaLcl1U
h9CO5wf/ROdoUF0dztd3ovGRimBdfS51befOuahPx/FYaDWmtZQ6iCaEO2RaNiUV
Dy9zPJA/FtqH7R38JcoWWx1yORMifNLjPYn1lQLm2ZiIvoOt91vElmVBP/U1qidb
Khrp0gGkyCSA2umNehEbJD+iI86+WxdBsOOJmQX8kTB4f5I4w0vSAKNiAzg5VXnQ
+fbDnSTsAU5LS2b/weVz2bMTUOZjyHeMdYix+2FcIIo+3HLbZ8LqXD2i52W85dyT
utRCzoKjQ4G6BUzTHhm59qfIX1WRf6jfY3OG0Hq10Xj9CLjv3BLEdUuFYX+x6dzr
KsPvSE6cSmX6jp+ThYUUBH9J5smtqA==
=Z+Yj
-----END PGP SIGNATURE-----

--HEiFX0I1YfdPL4ri--
