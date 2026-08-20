Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70BF747CA63;
	Thu, 20 Aug 2026 16:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787242169; cv=none; b=aXaeRxDd0zeM7uAVecCd/VN7OKiLUywGHe+/Nktv+05RSmn9XpiB/GpHZgP65xUV6bRqgxlV5tjc1ONLjfp6jbH4wOcXfJteN/A0TaiP2TrnO7PEZR8ngE4SSXBZO7bMy3BeOwX22ew7DfYswZSYCHAIQaF9dU1CXIwX8//Tth8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787242169; c=relaxed/simple;
	bh=4f7yPT695gHLxj2PEiS/W1bX0WaCWv0tHF/DlAd01+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HDNwDIsGYesqraBJrk0foV5y2qJy71LfwmscBoh50mkzVS2PYn9bWsXXV0zRK3mE2++2t52yFJYjlgIWe4ivHYzayenQpA86WpBXHJVWsjnpeU3Ctzzq2EaofC6vB2HSbzaeuYLkDdD5RYXOQDv8jzssm10/57kTB2me61QvbwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QWEeK6OF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QWEeK6OF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71F3E1F000E9;
	Thu, 20 Aug 2026 16:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787242166;
	bh=zw2vC5Q/OGeFngLQZkC3/XHGX6rR7B7IZZRUR38X1v4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QWEeK6OFYRoTZ5+N6bouaDAR+gAApbpTt0poSx0vQYHfnxa/kvBm7QvgL8FlogoG3
	 31Uke4I1VPxPqKxlifx3OkAuTLnmAhU5P7ONBtIoQbhhGgk6s3t/pbe2FklOnnZEVd
	 2h0tmsvisYeftZT3N85f+7Dq8eer8gEHmQ63ijCIIBLzbEta147DHPAJzFkKqirewh
	 3gS9W/gekBEEwJbul3+POd7l0O+ZDnMTdAj5NrxeSpDd8EDxkGl3EvgduIhcGaGHIA
	 +XezFr1GE5zQXLrNuf6OJ+fNFJYjFHchdgqrXfO0u097o1Wx8DEE4wLR/SJF4ZPK+z
	 n2bIDaWVwEDfg==
Date: Thu, 20 Aug 2026 17:09:21 +0100
From: Mark Brown <broonie@kernel.org>
To: Muhammad Usama Anjum <usama.anjum@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Amit Daniel Kachhap <amit.kachhap@arm.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	open list <linux-kernel@vger.kernel.org>,
	"moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)" <linux-arm-kernel@lists.infradead.org>,
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH 2/4] selftest/arm64: Treat KSM merge_across_nodes as
 optional
Message-ID: <0ae60fab-49e3-4a8c-a007-a6439ae10991@sirena.org.uk>
References: <20260820153331.2448875-1-usama.anjum@arm.com>
 <20260820153331.2448875-3-usama.anjum@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="p5YuwvEi+VPHeciq"
Content-Disposition: inline
In-Reply-To: <20260820153331.2448875-3-usama.anjum@arm.com>
X-Cookie: Happiness is a hard disk.


--p5YuwvEi+VPHeciq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 20, 2026 at 04:33:24PM +0100, Muhammad Usama Anjum wrote:
> The MTE KSM test unconditionally saves, enables and restores the
> merge_across_nodes sysfs attribute. The kernel only creates this
> attribute when CONFIG_NUMA=y. A non-NUMA kernel consequently prints the
> following message three times even though all KSM subtests pass:

>  static void mte_ksm_setup(void)
>  {
> -	ksm_sysfs[0] = read_sysfs(PATH_KSM "merge_across_nodes");
> -	write_sysfs(PATH_KSM "merge_across_nodes", 1);
> +	has_merge_across_nodes = !access(PATH_KSM "merge_across_nodes", F_OK);

Don't we need the file to be readable and writable, not just extant?
Looking quickly at the test I'm actually not spotting where it checks
that it's running as root which I think it needs in general.

--p5YuwvEi+VPHeciq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqHJrEACgkQJNaLcl1U
h9CRtAf/dyOLasDZacxDjlmySBh2HEYjNXwXJeIGcQ8gG9GMFwXWGrxOVczxxSAv
mqf+XwBC9/i0Xzz5JFO5siZtAAOCk6b738U8MIgtDrIRGsZWvyTus+8NSEfe/3VY
SC50yUo4Wrn+gukRlg+KXu02ICnaNE2I0pXuvz2lVVF7TUXPFPqi7xg8IAHQp55p
xAQV7Jm6TqNb5jxysQCAu0pQrOECafJ1eSwynrBmrVWL96SB+uNy/zrD5QaUj5MG
CwPFnP8j+yk3PicAyblJ7YZXKGVpED+CWFik7KVqqwDbZ6WcMvU0C2M7h3MkKtDL
DpA9SeO0GAKiQtggMv+VAKxrKER9yQ==
=ONOg
-----END PGP SIGNATURE-----

--p5YuwvEi+VPHeciq--
