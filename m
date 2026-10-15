Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26FEA5349DB;
	Thu, 15 Oct 2026 18:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792089008; cv=none; b=TQdf26yi2XRk6dxAynBp9MdCMg/5P7EhzzL2fLtJ1ds5r/MJjLQW+EAvOcmvhZ5wbdmuDLJVDyy8PpaMuTcQ9LZ7xcMvcpouMLW6gZazQrx3/gItIMkUu9zT9dL+Scdqp5Eq2+AtJos08FcNUuUw5TMDVYHymtAdIkllswASJ4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792089008; c=relaxed/simple;
	bh=feDbiWndId3TtvBuUeB1OtNiZ8foJOpazbJ+84U6FVk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EiaYGTi8KDKXSp0JPALiQl4Cz95h4OvTf+og3cvP5G/HkBGctiWx7K34jOnJP9N65llAnCuSxZPSvOevM9AbVC45PY0+ywIB1XVhQKvBJEFhJ6IVnjzTtQSADg43YK/KN36SIe8K3Hp47as0+RtQNNTnrYvLjmrDo4vL0otjfXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bJE9FUP4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bJE9FUP4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 481B81F000C4;
	Thu, 15 Oct 2026 18:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792089006;
	bh=u/qu+1nboXXgRmovuxE9nnlbwXrJITNUPGViGdzyeYY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bJE9FUP4W3cVPp/S/HGuqa4YptCXCKdrrAR68zXqHHilHZfC7p8sTLqWNeodrCH+P
	 wovUbdBrOhKvcanhDyQVg6WhUyNQJoSInIxSvK1anE1WgHyGq0VoYAcF+Yqjd2hynr
	 imCaz54SbgqdJ3rSTph4YjZY95XTIzyhvp/ZqTbsPM8g/D4TNQNYOcDagEmluflOSc
	 eW4GoM6oLgCag5hCY4PtGRMtWJEhPTd2nGgnTeUAK29PWZ8cWXoYatiSwUwjKrKMqd
	 JmrJMDsixyLmgGgUWbrbr7iRYenHOfz++f1jlj4byzPhC+C7VTl2g6ZOOgCmMyJWbx
	 aZWSkHmQGan0g==
Date: Thu, 15 Oct 2026 19:29:59 +0100
From: Mark Brown <broonie@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Shuah Khan <shuah@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kselftest/arm64: signal: copy each test binary only once
Message-ID: <793b97aa-6980-4cdf-8426-34b4f9bd0615@sirena.org.uk>
References: <20261014200140.1364282-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hV3+bZ8AmAs2jgop"
Content-Disposition: inline
In-Reply-To: <20261014200140.1364282-1-sashal@kernel.org>
X-Cookie: Tax and title extra.


--hV3+bZ8AmAs2jgop
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 14, 2026 at 04:01:40PM -0400, Sasha Levin wrote:
> The signal tests are built in testcases/ and then copied to the output
> directory. The copy rule lists every generated program as a target and
> copies all of them in each recipe:

The build stuff for the signal testcases is a menance, it's being far
too cute.

> -$(TEST_GEN_PROGS): $(PROGS)
> -	cp $(PROGS) $(OUTPUT)/
> +$(TEST_GEN_PROGS): $(OUTPUT)/%: testcases/%
> +	cp $< $@

You'd have thought that'd be clearer with two separate rules but the
obvious doesn't work and we're already being so clever I think this is
fine:

Reviewed-by: Mark Brown <broonie@kernel.org>

--hV3+bZ8AmAs2jgop
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrRG6YACgkQJNaLcl1U
h9AWzQf+OU6dIs888s5E7lDGgDCaqEwbWzdiPRypghBp84fZqmPXX7D88/4HscEh
UxccmRKO5ixBfP1JLzOumblG96lYNNAMkkiq/xhEqNZMgIkwdNl46EaIDpWP8moY
6QgDldJOItjV4gs8eUS+kSsB/UkvsMc61oZNYuTeVwwVRe/nX+1Orj9V0p7e/Mgt
AzHVsGpDyoGp8tVlX78gXkk2vwC9iPvqjHwYbJHteGNoGah/P1L1GbqAjBD7TB5t
9zbqDxRalqbIJOjhvIxtIh+1ZiqN9F6uipi43TncHvVtpgz2J0cqTInZhMOSspM/
3tGbP7GJRwZec18k1oWegqYKZ4E89Q==
=Ar76
-----END PGP SIGNATURE-----

--hV3+bZ8AmAs2jgop--
