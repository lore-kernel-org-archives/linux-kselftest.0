Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6131F47ECE8;
	Tue, 25 Aug 2026 14:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787666448; cv=none; b=DKeuzWQ4IvHzbep3+RZnViQWE9Xj/u0e7/IJDCPXG4DgPHxIPottBM3DndHVCYlZ/8JN7Tg28debIjqpikpkjvNKpn4Lotp3X35EtN278I3ycDSeMc7PJMtrBg6jMMkf7Fz+4kS0rUCgWPVsltF4uJFUQrR6VLSCXqv6jHK0Lsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787666448; c=relaxed/simple;
	bh=NBHdR/XKw+ncRBOTsEiR5P0jDNGwmge63wqxa7fnTpE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ROrpVEx9gh0M3JySKWK0XRq4lprKiPMfcYOXjcKQ/mtPFox2+OVNZPAVMSnCWbNxaiIvD79jmWVp2D+QyaeWAljiocOtUp+OHX2RMn7fGCBarBzgi9YGnzg+TW6a3ZsHmhTwwZNU5bsvGsBsL/320KM+9TdfqLjm5jDfhMMAOZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iXEQRgt4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iXEQRgt4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9B421F00A3D;
	Tue, 25 Aug 2026 14:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787666447;
	bh=NBHdR/XKw+ncRBOTsEiR5P0jDNGwmge63wqxa7fnTpE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iXEQRgt4rDbLlY6oHy2hGkfrveHcvS6Oz+xVum88PAu3VlI7EwRWHzIYB3dK7Ummq
	 feiD+1FVpx67xZjNDZx0qGHmSDcTj1O9eMlLo5+XLxQuHdDwko5Vd/Rs4fB5SeMgxU
	 ZC05gzKtLH881s3xELKgW7i6EYcJ6Yrex/P9TpHNL/nRS39QEreapTcPjLlujkKq31
	 glT+Z6eyo1D2bEuvs9A1Zpy5NxMJa1OLes+zu3Z4nLV4l208yEsgTXZfotmAfbMv1F
	 w+LH8ddftMwh0NBhCtS+fHqgjHzuNK1dk6MWiJuSK2NrbwCI/H9+/P+cS99FREhE+Z
	 Ok6qxr8mFjOJQ==
Date: Tue, 25 Aug 2026 15:00:42 +0100
From: Mark Brown <broonie@kernel.org>
To: Muhammad Usama Anjum <usama.anjum@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Amit Daniel Kachhap <amit.kachhap@arm.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	open list <linux-kernel@vger.kernel.org>,
	"moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)" <linux-arm-kernel@lists.infradead.org>,
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH v3 2/4] selftests/arm64: Treat KSM merge_across_nodes as
 optional
Message-ID: <958fbe2e-5e92-4109-a495-5398b5f3962e@sirena.org.uk>
References: <20260825111929.2882324-1-usama.anjum@arm.com>
 <20260825111929.2882324-3-usama.anjum@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GpWg8yZJ/4P394v7"
Content-Disposition: inline
In-Reply-To: <20260825111929.2882324-3-usama.anjum@arm.com>
X-Cookie: Exact change only.


--GpWg8yZJ/4P394v7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 25, 2026 at 12:18:35PM +0100, Muhammad Usama Anjum wrote:
> The MTE KSM test requires write access to KSM sysfs but does not check
> that it is running as root. It also unconditionally saves, enables and
> restores the merge_across_nodes attribute. The kernel only creates this
> attribute when CONFIG_NUMA=y, so a non-NUMA kernel prints the following
> message three times even though every KSM subtest passes:

Reviewed-by: Mark Brown <broonie@kernel.org>

--GpWg8yZJ/4P394v7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqNoAkACgkQJNaLcl1U
h9BJMwf9GsxMO6gf7tHBaM7W1iZyGFsovU2OcihEdyKoM3Ay2cIVXqJHbEDT3kAi
hnJxIeyWPrzPLjJlS/DiWWRY1bdv+KwfH5uv4NwEHqqrVJmgF5rAwdzIE8oACoTs
yqtNpIGDUaEqkB4lwzBeSbZDEZgxYO7hBtF3qUF80NbQewSrk83AiA8079xhUJyJ
UFBQtx4fEl3NpRKrzvZ9Byht9d/AQ6A8wGTmIst3/mD9AwaSGRlxEB9q03Z4tjWX
uiLu1krdxiWYLDjAS4HLTbJwigjDP3hJN0VoSj+l5dcvReEJ6ho/8v4GkbpDteFe
0iTvpujt0GSaKEnLvPDBti4oH5EWYg==
=zHh/
-----END PGP SIGNATURE-----

--GpWg8yZJ/4P394v7--
