Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FAE71A9FBD;
	Mon, 20 Apr 2026 17:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776707679; cv=none; b=HEXSUlcm0n89CdWctp8JWaezd4f7pojtRhDwpq67Xbd4IMQLyvew5GdhP7Uuo7r50weFxc5wiqeZm5UT4Q3ek8VX1+edmb9aMjFH7tg3JHZARx0mWBnn2+TNdUKhR0ta+3WuSsOV3tMCM6PExm4ZuTuTdsUj/Fz532Fx2pTXsFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776707679; c=relaxed/simple;
	bh=/PTY/lSJ4AnUpE+6mNiwqTVFEKR9IIn3jhHdLt38EGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k3ELINaC7WVYU1ylXKOEscpr7/6Xl9PBbw9Zk9ucB02SVfAOFBfJyYbKnG0peSNwv0isulTPcdZd5PfTQnLk5ONJuu88gtbdiefYJXG38l9crgcejiO+p8aWJFwvzBZzmvjs+cMLq6eOfq8JJszM3bRQdx0jbzKFCCZgcPb8gMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XYyq7Urs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XYyq7Urs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D4DEC19425;
	Mon, 20 Apr 2026 17:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776707679;
	bh=/PTY/lSJ4AnUpE+6mNiwqTVFEKR9IIn3jhHdLt38EGU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XYyq7UrsOAk/ikjgVF5gze/LKuQxVSsfzr3Onb2kpZGk6vSZTdgL9MuTOmSR+DlVp
	 VSkH/X0+HFWLlTyuYvGBxSv+/GgPUlHRYOYwEW6NAIfCfP5tFZ8nW1/SsCgyX9cX/S
	 gY5DaP4CKVPpYHkDvnmZ887pvy0KvQQGpF/0RkM+rCoMWl7A84aYwngN94C/U9wS7V
	 Odslmf4asslolVSPISYKbqyjqq3ClHrlyqxsyNuNph9fh86ayAWQVkUfWQpRDRVCFS
	 5EjCliuT7X/qAZKc1+KaqfoCGuKrMOfj6tKGdYm6a/KeNkFKnFpaN0CIF6E16k2zun
	 NqR0dFAu3FNlA==
Date: Mon, 20 Apr 2026 18:54:31 +0100
From: Mark Brown <broonie@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
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
	Sarthak Sharma <sarthak.sharma@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>, Zi Yan <ziy@nvidia.com>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v2 16/53] selftests/mm: protection_keys: use kselftest
 framework
Message-ID: <f8495e44-a34a-4289-90f8-0faa71bf1a71@sirena.org.uk>
References: <20260418105539.1261536-1-rppt@kernel.org>
 <20260418105539.1261536-17-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="29heIyJRxGSTWNY2"
Content-Disposition: inline
In-Reply-To: <20260418105539.1261536-17-rppt@kernel.org>
X-Cookie: Sales tax applies.


--29heIyJRxGSTWNY2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Apr 18, 2026 at 01:55:01PM +0300, Mike Rapoport wrote:

> Adjust dprintf0() printouts to use "#" in the beginning of the line for
> TAP compatibility and add fflush(stdout) in the end of the test to
> ensure all the ksft_print_*() messages are really output.

> +	ksft_finished();
> +	fflush(stdout);

If that fflush() is needed it should go into the helper, particularly
since ksft_finshed() calls exit() so the fflush() will never be reachd.

--29heIyJRxGSTWNY2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnmaFcACgkQJNaLcl1U
h9D1+gf/T1VhynP67CeAWJAgnjzi0T3T5BQSGX89RfuIHrIdW1Lna3akEq4kWhjv
V65lhtVN3EPwrGvnjgCpSjIllnnC7+Pusbasj47MV0NUHrPRbmkmn3nV2OMUrZ0G
/1OXsr4xIDQtIBt+vfqMqfsKeIWaxzNJ31AS8Yl5bX2rdqTlH8VwrCkVnUEL4Fsb
CC/ynssUdslOo1AM/t+N5x/d3ee7cNY1M8jHlywz/j/BPNbzChVFZbaEkAhGnyIT
A+aeDd+a9JfNN6MhX5F0Pp8xV++jbl4ufOWQUcn+zh9e/DX3BF49SxqVDRRYj27J
WEw6gPPxWN1ChiiWh7/3nLVKbYBsOQ==
=I9o2
-----END PGP SIGNATURE-----

--29heIyJRxGSTWNY2--
