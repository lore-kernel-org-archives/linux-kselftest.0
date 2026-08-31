Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B8D345A2BB;
	Mon, 31 Aug 2026 15:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788188603; cv=none; b=MwF4gIr4mKiQo3SUO8LqJqsmIbLffylcGA5A2rt27m1/y02zG9IMx8DXmcw1R9HxWWHDmovQBpqVbZtlIdr/qALq9DTxgLHFG8Jl0eLRncoFpyS2kV9HDuOuYIyE/aZvU1KnHehHKD2TlXpcm66kxopEJPqEgAXCP2SKHnBKSwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788188603; c=relaxed/simple;
	bh=NuYwYcdTd63Sl4yThSMVv4RTv7iSb05aGjnVKK3RL1M=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b8voGp0VxGOqdD2UmUYxQNMuPMGW4v/bKKXOHhABV/Mw+ldshkqBu/9umaW4qYWucJoOnCK5iPwkPhNnnLU8z3Ls7UZODkVvgmq+KUg4HxfnSCbsYb/90wZZPTYsaOwS4prQb9EW3tXIEAHLFUOqZeWGrR/Kk5OGAssPRe7ZmNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UCzEPP0/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UCzEPP0/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DE421F000E9;
	Mon, 31 Aug 2026 15:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788188602;
	bh=8fSdfrsulu5g0W5w5pyWz0kKJ1qwRHCJ9DqocKCmIgw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=UCzEPP0/9N09l4VxyGThqOiGxHzKMVntjWZXWkV9LvSDJrjHBKjAuLUG2bso9k8gY
	 RQ8eWyimAJwweGhzoF/n6bcXJOqN9zFRKTBg/ekww5t3bHHS9i2+s2f96HWWRCG2GF
	 9Oz/EFfvh5lKhT6fB0RUFG3oLsczmckAByv0TrAfG3bghqI12JVzbUp/JxcTrSujJx
	 yZIJuh1EFQWEtGjAd7cUTM3L+vxn2q9jkBjJE8/XAC696bCJ+be9qam6RGux3IGb9W
	 vVlZOEMlxKoDwNWfoKGfF5B4AYlELti32lsrHpc34YImZvnYm8huCJx+pnnzlJPw2k
	 r0irg62P1FGEw==
Date: Mon, 31 Aug 2026 08:03:21 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Hangbin Liu <hangbin.liu@linux.dev>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
 <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, David Ahern
 <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, Andrea Mayer
 <andrea.mayer@uniroma2.it>, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, Hangbin Liu
 <liuhangbin@kylinos.cn>
Subject: Re: [PATCH net-next v2] selftests: net: move log_test to lib file
 and remove duplicate code
Message-ID: <20260831080321.59cc6af1@kernel.org>
In-Reply-To: <20260831-self_log_test-v2-1-eda2e8490cf9@kylinos.cn>
References: <20260831-self_log_test-v2-1-eda2e8490cf9@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 31 Aug 2026 17:21:28 +0800 Hangbin Liu wrote:
> Many test scripts under tools/testing/selftests/net/ each define their own
> log_test() function with near-identical logic for comparing a return
> code against an expected value and printing OK/FAIL. Add a shared
> log_test_expected() to lib.sh and replace each local definition with a
> thin wrapper that delegates to it.
> 
> The function is named log_test_expected() rather than log_test() because
> lib.sh already exports log_test() with a different signature used by
> the forwarding tests.
> 
> Two tests required special handling:
> 
> - icmp_redirect.sh passed a fourth "xfail" argument to log_test(). The
>   underlying issue has been fixed and the argument is always absent now,
>   so it is simply dropped.
> 
> - fib_nexthops.sh checked for ksft_skip (exit code 4) inside log_test(),
>   but no test in the file produces that code. The check is removed,
>   callers that need to report a skip should use log_test_skip() instead.
>   Two callers compared against exit code 2 are left as-is since code 2
>   correctly counts as a failure in the previous log_test().

still breaks fib_tests.sh
