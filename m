Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE8C1A683C;
	Tue,  7 Apr 2026 12:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775565123; cv=none; b=VmYig0LBIyBF9bdglJ85AV9Alurs4kaRwJ+QXqT1zWXezezNB+ZlJVP2AWZtwlrJVy2vHoreIBSuabezI8+bvvuT4fWKspkT/81GvYCVL1vGi6PDePmPCjuy9ZDIWl0vKQaUdp5JgswYc3I/0qVSE0IMsORCzpWNQ9t/zG8er7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775565123; c=relaxed/simple;
	bh=E3V/mC4oz9GJDgxzY0OoQ1w+qOnILhdk7/LORFd17jU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d36qycAGfgzR41+YMDl3K/LIAYPxCH8JZBpHb88fj6btUj0CdDbIfi02Vsqgbu7yFNaCYG0Ms7mhCkrmqRV/dgRFVJgEE/uG4WdTGCc5ZyJA17ryl79zRuavw/dQ/+T9jWSpQejJetT0A1Pf2YWsFQC0EXJoNbhS666RjkrlVFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FbCml44R; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FbCml44R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FAC2C116C6;
	Tue,  7 Apr 2026 12:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775565123;
	bh=E3V/mC4oz9GJDgxzY0OoQ1w+qOnILhdk7/LORFd17jU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FbCml44R5kyvcb1qhy4ev90hWUk4djZ8TUrfXthivSW3tQzehmMzHzHMQtR6z0XEy
	 R8r9ACjTb2QtMFeiEC3+1KNPkhd9NLm724l1ahX1EkjD23c3Vm5AsnvcDQuVlzFcVf
	 lo8KLwiaWkBr0ddMS9b6lCwvCT4y3jsruVqC4TyyV4iSahUQ6rYERdlFhMonSK0FCV
	 DJTFhrCnIE2/U0qamATWOQIrr0MNifGt+XxwxA7aCdwMU5Qb77G7RN5toDXM6hMGjF
	 qk6tpRUoojYAczUUq4ri9mikcZOcxZWxSeiROcu8ynfrQ32g92J5c+xT4ZoyyjrjFT
	 HGmUkhjpeBSng==
Date: Tue, 7 Apr 2026 13:31:56 +0100
From: Mark Brown <broonie@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Barry Song <baohua@kernel.org>, Dev Jain <dev.jain@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
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
Subject: Re: [PATCH 17/53] selftests/mm: uffd-stress: use kselftest framework
Message-ID: <013a8bc7-722a-4d50-8a7f-d6e48a70792d@sirena.org.uk>
References: <20260406141735.2179309-1-rppt@kernel.org>
 <20260406141735.2179309-18-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xv739QkPGomL9e4F"
Content-Disposition: inline
In-Reply-To: <20260406141735.2179309-18-rppt@kernel.org>
X-Cookie: Now, let's SEND OUT for QUICHE!!


--xv739QkPGomL9e4F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 06, 2026 at 05:16:59PM +0300, Mike Rapoport wrote:

> -		printf("bounces: %d, mode:", bounces);
> -		if (bounces & BOUNCE_RANDOM)
> -			printf(" rnd");
> -		if (bounces & BOUNCE_RACINGFAULTS)
> -			printf(" racing");
> -		if (bounces & BOUNCE_VERIFY)
> -			printf(" ver");
> -		if (bounces & BOUNCE_POLL)
> -			printf(" poll");
> -		else
> -			printf(" read");
> -		printf(", ");
> -		fflush(stdout);
> +		ksft_print_msg("bounces: %d, mode:%s%s%s%s, ",
> +			       bounces,
> +			       bounces & BOUNCE_RANDOM ? " rnd" : "",
> +			       bounces & BOUNCE_RACINGFAULTS ? " racing" : "",
> +			       bounces & BOUNCE_VERIFY ? " ver" : "",
> +			       bounces & BOUNCE_POLL ? " poll" : " read");

This is going to result in the output of a nested line start "# " at
every print, is that desirable?  I think it might work out OK given that
there's a stats report each line which will print a newline but the
whole thing is kind of hard to follow.  Some comments might help.

--xv739QkPGomL9e4F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnU+TsACgkQJNaLcl1U
h9CZXwf+J2YrNrVT4p52lqejfuS/3b6Zy++BrtXR8nKcyiouVov9y48jsqwl/dfy
sv09vtmbtb00shlFbawnMzLZZ47c18p9sxXZcIZBiXtgOItUehI5LdAV1wpC9K2K
4AF59vBgfbLOXT3MvNvv5v320WRZExc7fOuT0SId+hCYs7FNb9nOzW9DDDjn5Hke
wtMW2lKe+Zw1eZiFVlb3b5SdsCAvA35P8GF7yewHZBSdw6RG7oh2EH65QsySz4BP
HFuR0pTneH0H81YU0MVDjd52KrLojI7OUfkvy8tlzMhhP8YDXJ65KySbK14pklrW
jodMVXPx/2C0319Go+dXY4hw7Nks1g==
=nkoY
-----END PGP SIGNATURE-----

--xv739QkPGomL9e4F--
