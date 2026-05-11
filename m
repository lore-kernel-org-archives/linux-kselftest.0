Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0351A43DA39;
	Mon, 11 May 2026 17:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778518869; cv=none; b=JkAqb3GGuHgpyoeAVzRdnuE/CeT8r3TDEiT86AcKmOXTH0n3N3tZq8OOkCxRwgIbb1F0tObu1rvrY2je0j9G9u5CtRJj3ZS7TYBP88hC6hmNMti/k/9EwQpurLygV3tGp1MYr4dNmiVHjvB1zX4BbXD0d94HdHwcjDRZR81zzJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778518869; c=relaxed/simple;
	bh=wKGeZ0Nop1wSGOlsNGEAE45FijcZcu5Se/bdA0P/Wgk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aO8DwCLTtJnFXut1oCOSFTu+ZaAyMTmPQqY7Kf7Ngpu2bu/7SaNL7wEh0imNf8zjMVotaguwCid6/X7K2n2EbfijdIWR29FfH2aoYhuYxSjM0SBFkqhYp3FgRSIb0A1aDvsQkf/RgqIHDGsPAQBNstK01P4TXGQdEvF9RAwmt4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=eL465Lrr; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="eL465Lrr"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=aFtsHVC/6TRth3Uw59YFiPg/UrRnQ2u+G8ngzZnxZMs=; b=eL465Lrrm+j+xfjTnlKMdZ/DAa
	geoWQSm8MENk7VBAVb93m/9hh2vTFsOYfx7JbDv7o4+Yg4Bab7ojvNGeG7aflMg6CQvuNBZTmU9MX
	ClR6ipU7jfpNZNXeLaVLZzdgtRAZox35QlGfkYHEf98Vh0+BIsiudZ/RdaXRQ8j4bAyl9yXH8u67F
	S/w/XCr9os++i5uwzCP0Ck5O2UyX6x0HmA/bwgjs9v7WWhEwV38Rus49KmtxJOXh9qsP0um8zKyJJ
	7JkmjUfeZPokXbDDdKKrIcvq1+l5Y5GMir/tlYiicLNYT4YmqzAIXD7ZOU79c+8AHUwhcmsgVO+8O
	JN6My3Ew==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wMU09-001kOh-1w;
	Mon, 11 May 2026 17:01:05 +0000
Date: Mon, 11 May 2026 10:01:00 -0700
From: Breno Leitao <leitao@debian.org>
To: Fernando Fernandez Mancera <fmancera@suse.de>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	horms@kernel.org, pabeni@redhat.com, kuba@kernel.org, edumazet@google.com, 
	dsahern@kernel.org, davem@davemloft.net
Subject: Re: [PATCH 2/2 net v4] selftests: fib_tests: add temporary IPv6
 address renewal test
Message-ID: <agIKdx3q9ewyhq7r@gmail.com>
References: <20260511122645.6233-2-fmancera@suse.de>
 <20260511122645.6233-3-fmancera@suse.de>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511122645.6233-3-fmancera@suse.de>
X-Debian-User: leitao

On Mon, May 11, 2026 at 02:26:46PM +0200, Fernando Fernandez Mancera wrote:
> Add a test to check that temporary IPv6 address is regenerated properly
> after the base prefix is deprecated and restored.
> 
> Fib6 temporary address renewal test
>     TEST: IPv6 temporary address cleanly deprecated and regenerated     [ OK ]
> 
> Signed-off-by: Fernando Fernandez Mancera <fmancera@suse.de>
> ---
> v2: adjusted the sleep so there is enough time for the issue to trigger,
> added cleanup at the end
> v3: no changes
> v4: no changes
> ---
>  tools/testing/selftests/net/fib_tests.sh | 59 +++++++++++++++++++++++-
>  1 file changed, 58 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/net/fib_tests.sh b/tools/testing/selftests/net/fib_tests.sh
> index af64f93bb2e1..8f10de0eb985 100755
> --- a/tools/testing/selftests/net/fib_tests.sh
> +++ b/tools/testing/selftests/net/fib_tests.sh
> @@ -12,7 +12,7 @@ TESTS="unregister down carrier nexthop suppress ipv6_notify ipv4_notify \
>         ipv4_route_metrics ipv4_route_v6_gw rp_filter ipv4_del_addr \
>         ipv6_del_addr ipv4_mangle ipv6_mangle ipv4_bcast_neigh fib6_gc_test \
>         ipv4_mpath_list ipv6_mpath_list ipv4_mpath_balance ipv6_mpath_balance \
> -       ipv4_mpath_balance_preferred fib6_ra_to_static"
> +       ipv4_mpath_balance_preferred fib6_ra_to_static fib6_temp_addr_renewal"
>  
>  VERBOSE=0
>  PAUSE_ON_FAIL=no
> @@ -1611,6 +1611,62 @@ fib6_ra_to_static()
>  	cleanup &> /dev/null
>  }
>  
> +fib6_temp_addr_renewal() {
> +	setup
> +
> +	echo
> +	echo "Fib6 temporary address renewal test"
> +	set -e
> +
> +	# ra6 is required for the test. (ipv6toolkit)
> +	if [ ! -x "$(command -v ra6)" ]; then
> +	    echo "SKIP: ra6 not found."
> +	    set +e
> +	    cleanup &> /dev/null
> +	    return
> +	fi

Should you check for ra6 before the "setup" above?

Also, kselftest convention is to exit with $ksft_skip (4) rather than just
return so that the framework reports SKIP rather than PASS with 0 tests.

A bare return here will make the test silently disappear from CI on hosts
without ipv6toolkit.

