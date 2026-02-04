Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A73389459;
	Wed,  4 Feb 2026 11:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770204422; cv=none; b=mrh6dgYitbwgJ5tcDZ9rYd/IeUApxGaZb3HvWxfP2q6Pm/6tZrm/Pd/dofB2Sw5qj3TMNRPQsD5rEG5rmyOWtKdSykXeRvKto4gK3I6xj0RNp1H//XXKP2hfLU4nGyskTiWzE4Lp8NaE7QMoTAuoksowYaficxt7PRFZcW8bHpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770204422; c=relaxed/simple;
	bh=67+xiOhUAy8ZHXdYxyV0ZxTN94Teb/rCt2o03FasqGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uhRz0QZkueqEHnnE186CKVjikz3pFsnPHhZwA1yH4Ov3KXaq3OnGpuumvp7rr46VMdpHD6zl03B8/y+W/4QrRjzry4FZdjPf/Ex431/mkyb/6eFWq/WlwkKQqxLVBsvaAknbqfXAp2o1Fze+xdnDfFTPK/Hu1K30hDqZlo/5LlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GqnineN8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GqnineN8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBC00C4CEF7;
	Wed,  4 Feb 2026 11:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770204422;
	bh=67+xiOhUAy8ZHXdYxyV0ZxTN94Teb/rCt2o03FasqGU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GqnineN8A0U5/3483dusTDdxv5M41AfF1XwayjJyq75iO/hnIVQEsi/EJnLJfvV4B
	 ZtIJzMvcfzz6aPLrEKPFKQaEB9I2b4J+2rWJzzbyowNVEM7gacY9S9cazBWutVr7K3
	 eXdoYVdVy8c48r+9EUTTns6qvbJm5HANuc7OqYqGaQrObUXt7xB6a6tMnLGGdZKWOU
	 9KH+kNBKK3dQ2JE9Vq/bP2xOyTJRE8mBZLxL2Y55OnK/vArZR7w/IlUhlYcmHanAQg
	 ZN0w/QQaRgsxApteE8kndm5ZTaUq3yWYTBEjNcyG02Oqa9x3ZF+m+lD/5n0KzXZepm
	 8oDK8/oJt7Sng==
Date: Wed, 4 Feb 2026 11:26:57 +0000
From: Mark Brown <broonie@kernel.org>
To: Miaohe Lin <linmiaohe@huawei.com>
Cc: akpm@linux-foundation.org, shuah@kernel.org, david@kernel.org,
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
	rppt@kernel.org, surenb@google.com, mhocko@suse.com,
	nao.horiguchi@gmail.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v3 1/3] selftests/mm: add memory failure anonymous page
 test
Message-ID: <2028f5e1-e032-4909-8240-15fe0b3c82a5@sirena.org.uk>
References: <20260204073331.899406-1-linmiaohe@huawei.com>
 <20260204073331.899406-2-linmiaohe@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="abbEY5s8WnurDw/O"
Content-Disposition: inline
In-Reply-To: <20260204073331.899406-2-linmiaohe@huawei.com>
X-Cookie: Are you having fun yet?


--abbEY5s8WnurDw/O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 04, 2026 at 03:33:29PM +0800, Miaohe Lin wrote:

> +TEST_HARNESS_MAIN
> diff --git a/tools/testing/selftests/mm/run_vmtests.sh b/tools/testing/selftests/mm/run_vmtests.sh
> index 29be9038bfb0..afdcfd0d7cef 100755
> --- a/tools/testing/selftests/mm/run_vmtests.sh
> +++ b/tools/testing/selftests/mm/run_vmtests.sh
> @@ -91,6 +91,8 @@ separated by spaces:
>  	test VMA merge cases behave as expected
>  - rmap
>  	test rmap behaves as expected
> +- memory-failure
> +	test memory-failure behaves as expected

In -next I added a hack with wrapper scripts per category to improve the
integration of the mm selftests with the kselftest framework, could you
please wire things up into that, see:

  6ce964c02f1c (selftests/mm: have the harness run each test category separately)

for details.  It's rather dumb and simple but gets the job done.

--abbEY5s8WnurDw/O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmDLQAACgkQJNaLcl1U
h9Djpgf+PbySdJPMTJ001ksm8zd44+zqROSj/FgWNpwp8wtHVquGpsqIVpo0rIVN
4CdxpVHlKfsSbq468aJ4PLYruyVwdyzpId9R3RZjaFs4ISEidAE4jAvZajoHKBLU
Bk1RStR2Myefw46L0Zow4K8d6vTV/8RHRvfjQxLSN7T6FOJXFhMAbVX1O2nCst6R
6pqU/YtDBnErDWP0G8jaSM8eKmQwfzW/X9OR4oJnYD2tsUFuyVH69Sq3vrL3ZUUE
AGLo9lhqlRO1zkod5MfLNNigq3idf97jgKFPHU+8f3XzKyzypk6XrNpPFNQRCdaG
rBRMukNS95sCTkzUyFtvTI6h1FJKfQ==
=m9hf
-----END PGP SIGNATURE-----

--abbEY5s8WnurDw/O--
