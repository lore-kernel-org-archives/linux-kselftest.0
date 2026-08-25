Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9782E06E4;
	Tue, 25 Aug 2026 13:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787666318; cv=none; b=nkh7ESXV5JO8iQm1yNUhKFDngobq3J4gPJ7wO8DAWIjF0CxZa32tH1Nb3pcP8Vmz18vXuyt2jaJyiVDrsR9Ct/eyNygYFs7rEiq+sm7Un2yAG7O7C7CggEbLnQ8cLEyEHy+HESDUcrJcqFE6jE1hUHh1/OJXiDGA+tRYS54RwT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787666318; c=relaxed/simple;
	bh=bjY8nihSa+14PYvQpMxpTs0m3kf0MoEea4JV54XPQY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YJrO3YTi9JtLo62QByGtDQYEcS6sScTaDaWA2mqjoq4XUE9GDGJw9WRMS9wUMmyqGlraPvL3ut2AHQKPgGbz/HvBuO8ykBrUirvUhJcEN/p6vnJcBEim6KZWA1lRimwWLfAAlIAPaJ+8gbY+RpRhMw7gsaxToDzdN+UMIfLukAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ggZV74Cz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ggZV74Cz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2862A1F00A3A;
	Tue, 25 Aug 2026 13:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787666316;
	bh=bjY8nihSa+14PYvQpMxpTs0m3kf0MoEea4JV54XPQY4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ggZV74CzysRLzkvXdqoL33TiYoBioJRkxGdThUYBXfTwRjYL9fSP0lYjJMjp1pNOY
	 NhQsSorURrAkau2/oLfr5en++cOyWiXXmofla/l9CjWUHURmIwWrScbA3fM2qXwBcw
	 ENNp3iOYziT7q8xU+QhuyDfbH5YhB+/T+aHBniAoU7G3uPoqyJ8D79KKJzZ/Ju1c3e
	 NLJFTysNJFh3jyXptOJ+LhxN4SX9UDHkJ0MbwD/rKpDbHnUAMvXT9jzixeH6xnYVOF
	 Z0T6OhvPA4/dqGegtXXooob6mZYU0h0/cxxBUau6G/6S+wwktSW+s1vwqMrmqZf4zv
	 hLcdb2pZaPm3g==
Date: Tue, 25 Aug 2026 14:58:31 +0100
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
Subject: Re: [PATCH v3 1/4] selftests/arm64: Print missing MTE TAP headers
Message-ID: <7eb6dd48-dc45-4c94-a4bb-cd09c6ac4045@sirena.org.uk>
References: <20260825111929.2882324-1-usama.anjum@arm.com>
 <20260825111929.2882324-2-usama.anjum@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BgV6j/ngKs/TWJZq"
Content-Disposition: inline
In-Reply-To: <20260825111929.2882324-2-usama.anjum@arm.com>
X-Cookie: Exact change only.


--BgV6j/ngKs/TWJZq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 25, 2026 at 12:18:34PM +0100, Muhammad Usama Anjum wrote:
> Most MTE tests set a TAP plan and emit results without first printing
> the TAP version header. Direct execution therefore starts with a plan
> such as "1..20" instead of "TAP version 13".

Reviewed-by: Mark Brown <broonie@kernel.org>

--BgV6j/ngKs/TWJZq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqNn4YACgkQJNaLcl1U
h9C1KAf/TOSuU7iQfwTN5kCkWjoopdtHlE7OYSYpBiZTvOzRy4epYZUkl4rgFnWh
bkHUiGgc0c1jp9tuoPncOHVI5u/wpKGEwQ7m1AGUFBMkielIqMzgwe3Q+EK73B3i
L8wT24DbIYy1jHHuq9n3QSjUbbXIWQxtiN92EC/invE6XMixPNiflB/fl1lstFtA
/LI00EDzBABXvy05IloMYzY2KyGTGZdU3S7TboE61KhnZsUBF10I88wWx7oOKZdn
JSaWPRZ4JjFivqH7zTQ1HUNEG3Rf9IoodD+V7j9pR8OPAootdfl8iXvgOkAc2drl
sZdztaQV67FJcMw9XT9iWQyTAYj6iw==
=k/nT
-----END PGP SIGNATURE-----

--BgV6j/ngKs/TWJZq--
