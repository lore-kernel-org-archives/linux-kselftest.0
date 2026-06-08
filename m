Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D4C38BF9A;
	Mon,  8 Jun 2026 10:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780915053; cv=none; b=lV+if68sNsuEn9ufT8Dts8BzeE8z/lMHB09wcFt8iLgz6d9C1r3wkn6YD4wRfsyABbuDWOE4aI8t0ivGn4TB6Jin8qCqDPbq5A/uw1oSygiKn30AhnmfHqvafYg8EakPa0M0S6cEfauhSOmHQQnfpbDpUVCQtEyttzu4f9WKIno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780915053; c=relaxed/simple;
	bh=bi6ela1PzKjx+8mELW2MCPCgwE8HURVXok4aZqsq08w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Imv2OaUqOow7iqFwZvDy9bi0vkOBKesfL4bRis9Q75RlK1aH9frdZ4o9KogRMPYoTqrxHODSqqWv+i0DaTqPjBRAfMLhNfzmjsIZgW+YPEQdHc0b2fdeZ/k+Bz0jE9TILYJvRDxb6EOMppiJgjQr77ZDRItQCRkateyO5Eth2Vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ejm8OtTw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ejm8OtTw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5F8A1F00893;
	Mon,  8 Jun 2026 10:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780915052;
	bh=bi6ela1PzKjx+8mELW2MCPCgwE8HURVXok4aZqsq08w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ejm8OtTwRK1IxMRRB2gaW8FKerJb/HjUQOjE+YqwbnZ7GZWKS4mR+EcctpvKDEepV
	 ZRuMVzDnpZHrnnzIzGMHYICj8tNavzox34ngAIGylYMDBRBYT9LO1lMxVNues4WUm6
	 KyFwrSf0Es2fA+Mq20Rs/0u7SJZsskczIbQYnoB7EG4SbTV4QiCwYX/vNlaS1O2O9Q
	 BuT/dJay7Ts4xuszmsFv1jTFzOfWr1eCsyb+MiVsHBUag64oqS8XGs9aAgrZ2Qi7O1
	 Th/RubEtnIRs/tS1BoKtip0bFK/VB16gyJ/rHbsW9nPzlqVBQHwVPgV/9ONOfFfYlR
	 HO4K8GEgRKW7w==
Date: Mon, 8 Jun 2026 11:37:27 +0100
From: Mark Brown <broonie@kernel.org>
To: Sarthak Sharma <sarthak.sharma@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/mm: fix ksft_process_madv.sh test category
Message-ID: <23069ced-21e3-43ea-a338-182f6f861583@sirena.org.uk>
References: <20260608103224.344101-1-sarthak.sharma@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cq+yAeCdDhOAl0L7"
Content-Disposition: inline
In-Reply-To: <20260608103224.344101-1-sarthak.sharma@arm.com>
X-Cookie: We've upped our standards, so up yours!


--cq+yAeCdDhOAl0L7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 08, 2026 at 04:02:24PM +0530, Sarthak Sharma wrote:
> ksft_process_madv.sh currently runs run_vmtests.sh with the
> mmap category. Update it to run the process_madv category,
> since ksft_mmap.sh already runs the mmap category tests.

> -./run_vmtests.sh -t mmap
> +./run_vmtests.sh -t process_madv

Sorry about that, obviously a cut'n'paste error.

Reviewed-by: Mark Brown <broonie@kernel.org>

--cq+yAeCdDhOAl0L7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmomm2YACgkQJNaLcl1U
h9DLXgf9EsUNsYMgg1YbwFjooXAaQP3U0UTcEACKdnwX/Li0OSW+969rU2vjx3NX
hbgrpkCnSf4bl4K5uMgXmiJvA1yBnWRKMZWttgZVhN9GT1u1vZoo3VyohJbqaFEJ
st4GkGvGw1+u/+s736Pa2UvmlU9b0jO6XNq52csGFQAoxL53+2knpND8iGzxQz/E
e7heBbbFkXY73tjeKPgagFlLDDt6bi5ZyIQCwwumLribvsCucmIxnduva2rJt8TA
uBjiuVVGxIAVqRLlpN0biP5wMbu8nY6Uei5cbC3qWOXX7Jx6b2xelBZ2h/fTQqjc
71l1kn0Ud9DICYy2nfzzDnhuvEJ0Hg==
=1EMQ
-----END PGP SIGNATURE-----

--cq+yAeCdDhOAl0L7--
