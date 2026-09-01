Received: from mta1.migadu.com (out-2.mta1.migadu.com [95.215.58.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B396DDA9
	for <linux-kselftest@vger.kernel.org>; Tue,  1 Sep 2026 06:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788243996; cv=none; b=lfMxFk6gSaMpik+xA+Z7ecIPUqRphnAp+CwkoTPmCdn2qNio9LXUvMQtRHt/LXfh3/6JGovrj3U/BMCDrH+MK3vjAlF3vkO0UoC+owCAoRNgtmJczNsKaxrq5u5Z+pB8PinIg2y0oqFVY/24saXXDK6BnqcshyFqajswbPKjicE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788243996; c=relaxed/simple;
	bh=nY/oabUsnL5fxFERwMfqwf4ojTlIZToZ50HB2OBLDSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f2wBtDlalMP7GacebtJ4+TcmMEseNCTLYjBDPXaK0reQBquaGx2Fpcjk8UDvfDvBzXKaHBOhRHbHAAG3a6ioQ0gF/E++eoD3H29gwdougRNavSg/XbljhSlg1G2hSuIUHfKJoyW5b7+x6ryEuVmHyAgWL3BGtuqvgsgc4oPj+yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=hneSvjVg; arc=none smtp.client-ip=95.215.58.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="hneSvjVg"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=nY/oabUsnL5fxFERwMfqwf4ojTlIZToZ50HB2OBLDSQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788243993; v=1; x=1788848793;
 b=hneSvjVgcw76oTyRUpRV6FAdJA127bq/Fi1XLuHRLlE5YgxFQNbpayEb+/FrF8R5zLKzb3q6
 PDq3gtCo+h79waKTod+1hphziWe9Tmi1yyh0xMAdMhRW+9FLoiluhCgjQZNRGjPwXYVj/NK4jm0
 /lGynhIiCQ+EDorMyaOONjXM=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b1f864fda224ca39;
	Tue, 01 Sep 2026 06:26:33 +0000
X-Mizu-Trace-ID: b1f864fda224ca39
X-Migadu-Flow: FLOW_OUT
Date: Tue, 1 Sep 2026 14:26:18 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Jakub Kicinski <kuba@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
	David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>,
	Andrea Mayer <andrea.mayer@uniroma2.it>, netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	Hangbin Liu <liuhangbin@kylinos.cn>
Subject: Re: [PATCH net-next v2] selftests: net: move log_test to lib file
 and remove duplicate code
Message-ID: <apZwCtNbjnHITbC4@fedora>
References: <20260831-self_log_test-v2-1-eda2e8490cf9@kylinos.cn>
 <20260831080321.59cc6af1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831080321.59cc6af1@kernel.org>

On Mon, Aug 31, 2026 at 08:03:21AM -0700, Jakub Kicinski wrote:
> On Mon, 31 Aug 2026 17:21:28 +0800 Hangbin Liu wrote:
> > Many test scripts under tools/testing/selftests/net/ each define their own
> > log_test() function with near-identical logic for comparing a return
> > code against an expected value and printing OK/FAIL. Add a shared
> > log_test_expected() to lib.sh and replace each local definition with a
> > thin wrapper that delegates to it.
> > 
> > The function is named log_test_expected() rather than log_test() because
> > lib.sh already exports log_test() with a different signature used by
> > the forwarding tests.
> > 
> > Two tests required special handling:
> > 
> > - icmp_redirect.sh passed a fourth "xfail" argument to log_test(). The
> >   underlying issue has been fixed and the argument is always absent now,
> >   so it is simply dropped.
> > 
> > - fib_nexthops.sh checked for ksft_skip (exit code 4) inside log_test(),
> >   but no test in the file produces that code. The check is removed,
> >   callers that need to report a skip should use log_test_skip() instead.
> >   Two callers compared against exit code 2 are left as-is since code 2
> >   correctly counts as a failure in the previous log_test().
> 
> still breaks fib_tests.sh

Oh... This patch touches too much tests. I only fixed the [ "$VERBOSE" = "1" ]
checking and return 1 issue in test_bridge_neigh_suppress.sh. I didn't notice
one of fib_test.sh "set -e" and also breaks here.

I think there is no test would expect return 1 for log_test. So I will
fix it by return 0 in the lib function directly.

Thanks
Hangbin
