Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 280A348C8B0;
	Tue, 12 May 2026 08:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778573306; cv=none; b=aXVjWygZsUoExdAHGdwBJ4IapA6Z95IDIMBk70ro1XjtqVdMp1ci8mjyjWSYpbDJya+2lZMXS8T9lentsPbNPSVHQ0eqS45+m2+kdsTgVEp7TFaV+/weAJZvzv9GTSualBXLzv4u9usXy1IyT/wiytUqkDEIqgNO2TylwIxaSKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778573306; c=relaxed/simple;
	bh=9iv8M8NMqcO1i4WisbiYd6QCESQN6Xr8lqgWxUscNIA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RObMcTDuicaDaaJhJcQe588xsJploAeL9K950m/qT8D+XJsLQlpdcLmF5J6yEkXfvvQNcr3S5FTleR89vHjvbwiTqOqR21/YienubHb7d2OsiyR5l7AWveNdIJt2Lva4JIkvNFpwkVyfmDg/x48EIgaB8ZmIPRkYt3fx4CMbw4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=CTivWa84; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="CTivWa84"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=o2HR+k0aK2TG6oa5kngAI2VUFrIVp9uFjKEf9DAE8Nc=; b=CTivWa84th+mlSCvSghq+l5pwk
	1UhmAWUTQo5jNToYKriuqSv3aszIdASgdtXj6y2Ns1uV3I8F+CPTNeP09SA/5boLIrUVSFxZ47Upu
	Y017JvQcIWpDls8VlGlQw72C8k/ALa5fRMA4O3r/I5/Xy2LxZPs20KVogm1YE7N/MhcS2oAqngOic
	icJ/Z+L0NxAphEAXxBTXpFJxu9IU6Op6UJBcDwo3rxCSChExqJvlQibqQp9D7JcVfvviPY0sCcw8P
	OBBk/2VyflnMC/OqzGxez5bVf2KkoUDgbtJ2tTzKn9QCmq/0A1WoOc3HTUquPPzBYOyESv3mreLtq
	MdPyOw3w==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wMiA8-002Ef4-1r;
	Tue, 12 May 2026 08:08:20 +0000
Date: Tue, 12 May 2026 01:08:15 -0700
From: Breno Leitao <leitao@debian.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Fernando Fernandez Mancera <fmancera@suse.de>, netdev@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, horms@kernel.org, pabeni@redhat.com, edumazet@google.com, 
	dsahern@kernel.org, davem@davemloft.net
Subject: Re: [PATCH 2/2 net v4] selftests: fib_tests: add temporary IPv6
 address renewal test
Message-ID: <agLenteVpazkwn0j@gmail.com>
References: <20260511122645.6233-2-fmancera@suse.de>
 <20260511122645.6233-3-fmancera@suse.de>
 <agIKdx3q9ewyhq7r@gmail.com>
 <20260511170848.756e9347@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511170848.756e9347@kernel.org>
X-Debian-User: leitao

On Mon, May 11, 2026 at 05:08:48PM -0700, Jakub Kicinski wrote:
> On Mon, 11 May 2026 10:01:00 -0700 Breno Leitao wrote:
> > Should you check for ra6 before the "setup" above?
>
> Not really. AI bots love to complain about this. But "ra6 command
> not found" is as good of a message as the explicit skip, honestly.

Right, but why call setup() before checking if ra6 is available?

Running setup() performs unnecessary work if the test will be skipped anyway.
It would be cleaner to:

1) Check for required tools (ra6) and skip early if missing
2) Run setup() to create namespace and configure the environment
3) Proceed with the test

Rather than:

1) Run setup() to configure namespace and network interfaces
2) Check for tool availability
3) Clean up when tools are missing

If you look at netcons_basic.sh for instance, it has the following
lines, which seems saner:

	# Check for basic system dependency and exit if not found
	check_for_dependencies

	# Remove the namespace, interfaces and netconsole target on exit
	trap cleanup EXIT

	<Do the test>
