Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904783B38BE;
	Tue,  7 Apr 2026 12:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775566697; cv=none; b=hkgU5MW87UPSeyX+/1lTktS9xH8qB+RzrDbg3Zbtl6UfXUa7fWjxaXwlM+6Kr9rS4kJ/wJhrorIVvTF84Yj18CgOFmAmZyreRv5Bw1oCq87GhPrrLzrkviV/8rwYxBT0uJtcZHykH3iWJVJWx7E5gDepKkGqqWHFM6Ecjz05N2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775566697; c=relaxed/simple;
	bh=Vuo8khsjxbN2TIURS/5kdF2MhqjcznQQ2wx/2ImFzvc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A5oUlDA5lwuDdurqmTbTn0xrQarAFr9uEkeQss5aqCQ3WD5Q2qPc9sW12WptcPxPFwU2yAwFCrNRQ0AfSWq08w+XpDuQpUuJEXXbh+o08uP34fdW4jzuKagICbzygJMWpt3dtq8XWuyHIQzPUHC6D/6bFvbjXwVzvoYdAqqNCV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L7glko9a; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L7glko9a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D4B5C116C6;
	Tue,  7 Apr 2026 12:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775566697;
	bh=Vuo8khsjxbN2TIURS/5kdF2MhqjcznQQ2wx/2ImFzvc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L7glko9aAohDzvAn7OqsI+J4uDM2pUX3oJQTUL3L9iPAE8bEACZR/wFPmeVFnMSbR
	 97baR5iGmZbOiCGtwp8nv83FX75zrcNoDStHgR3YKejPU1hhULTn/8gUz0gaqBUFXf
	 d9DlHtCR92PKVmymj7Lalmk4VOklwWWA0vPnZ5QfoejbQtgFrkgp6vzG58rP3pO2iv
	 PujV58T2UXEcDOaNnxEz5BqGS7v/M2nGXYIuIQSsoMxlg3NG/+DX6Vnu4yWoJQc1ND
	 25dQvmkMmmNB6IBLiGbLmcpJ7zubOPGKE3d4aYcIxXt1efPbqcIevg79ncUIULDJt+
	 KNGlW5P3nPcfA==
Date: Tue, 7 Apr 2026 13:58:10 +0100
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
Subject: Re: [PATCH 18/53] selftests/mm: uffd-unit-tests: use kselftest
 framework
Message-ID: <f07f4e35-227f-4dab-8e05-b6d20f38c60d@sirena.org.uk>
References: <20260406141735.2179309-1-rppt@kernel.org>
 <20260406141735.2179309-19-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ikVDHGOE2eekYHG+"
Content-Disposition: inline
In-Reply-To: <20260406141735.2179309-19-rppt@kernel.org>
X-Cookie: Now, let's SEND OUT for QUICHE!!


--ikVDHGOE2eekYHG+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 06, 2026 at 05:17:00PM +0300, Mike Rapoport wrote:

>  static void uffd_test_skip(const char *message)
>  {
> -	printf("skipped [reason: %s]\n", message);
> -	ksft_inc_xskip_cnt();
> +	ksft_test_result_skip("%s (%s)\n", current_test, message);
>  }

Parsers are just going to take the entire line after the test as an
otherwise unstructured test name so get confused here.  The usual thing
is to print the reason as a separate print.

--ikVDHGOE2eekYHG+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnU/2EACgkQJNaLcl1U
h9AMTQf/Tjoyf2v7TI04cRn0gqsSlJNBuwtdBCBJwY8oUBwToDrVM1CY1f6Tr8t7
GWz1fwqJYEoES7UgyunaglPklV1xmSwIAJuLsvQmW32dWP1P2kfSpwHfxe1fvKqp
IzRu8dHdFV2BXcIHXttGfXJkQSG7YDu+WEnTkwt3T7mOb8ReEjz9n2Zr97uiN9pr
2lSYRVO+s2LTgff3qpjBU4UJ0J5Jt18E2vUJm8qI1iBbyHqdAsoPmazLI4EDXG6p
a2BLjsoTK2Gy6Rt6/5JcrUQNt1o/3RzyVbCgOrYRbkw+4O4sJOdn3psgY5ESZmKn
XoVkNn07wuBfDleIpCP8uGXD3NG8cQ==
=johM
-----END PGP SIGNATURE-----

--ikVDHGOE2eekYHG+--
