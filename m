Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813B923BD06;
	Thu,  1 Oct 2026 04:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790830698; cv=none; b=SpBJQMXRPQJiSNkRmCXPFzLZWwWpkEWYPBYl7ASiCKdMI3SdtxtjF2YZ9zIu3n2epRB/J8mFPw0bbkIfT6V1oPvArZqnQvJCiKLbPI13rC6qoG17JLS+jQtCRofDWuazUTQWtQti/Xn352Qjg/NLMTStSH2QDG0AJPJmDt6c9xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790830698; c=relaxed/simple;
	bh=Mb/l6MdlnUv+ToedgXmh1TdSiP6BX/+taiJniP47WfE=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mOmoM6ryV43AtqeoT+BOh9Yk3UNUGS3V4DUxfCHo+FYxkt5ueEVKm9KZKrjQH5R5hMZHw5ZywlMuY49TBvsXBUu8YHN2qBf6mQR6/l2f36Ez559xUePDjvB2xj59p3clJnDB1FKvVEypwJS+HvWm+hp5nBwLZ/kRre6gO7dT8Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BP1A33E0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BP1A33E0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F22A1F000FF;
	Thu,  1 Oct 2026 04:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790830694;
	bh=fjPIGhc+wki6rbjpccgd1/DrHrcJIdvyJ27p4BzaPWc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=BP1A33E03QtdehBVZF+QtyRCxZ+A7LKujSPpx7irqp7vcg+0YMWIsZYTpNZHawiZb
	 fmXyOm2uJ6lIn1jXYr891cxR0IUNl1VSQS6rwiTMkk48hz2v5hhMvQA+WeW2kmlNZC
	 dfL4XbttQ+n83vB4BL+C7eLV3jaAl9lps8l8plkgNBbn0Qjm40aq+5tbzRP6Wo4aA7
	 1J653tI0pH+ujHa/Os2HdWt/Ich+Bf1mzI4k33wNdgBjZzuo72INI61gLtpQmI5SAP
	 B2fxSVPWP7p0laVctuXHy3EhGnJxgN9NR4qmgHJS5W5HQzWvLbIaxTvjIKBHnMdOA5
	 v/Or7kn2mSPYw==
Subject:
 Re: [PATCH net] selftests: fib_tests: use per-test return value in subtests
From: netdev-bot+sashiko@kernel.org
To: hangbin.liu@linux.dev
Cc: dsahern@kernel.org, idosch@nvidia.com, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 shuah@kernel.org, idosch@mellanox.com, dsahern@gmail.com,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, liuhangbin@kylinos.cn,
 netdev-bot+sashiko@kernel.org
Date: Thu, 01 Oct 2026 04:58:13 +0000
Message-ID: <179083069319.434549.6042480426596220206@kernel.org>
In-Reply-To: <20260929-self_fib_tests-v1-1-0eab6a3c3a3c@kylinos.cn>
References: <20260929-self_fib_tests-v1-1-0eab6a3c3a3c@kylinos.cn>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] In tools/testing/selftests/net/fib_tests.sh, the patch
  converts check_rt_num() from `ret` to `RET`, but the helper still sets…

--

selftests: fib_tests: use per-test return value in subtests

This commit changes fib_tests.sh to use RET, as defined in lib.sh, for the
per-test return value. The global exit code ret is now only set in
log_test(), so a later subtest can no longer clear an earlier failure.

Closes: https://lore.kernel.org/all/178961184152.22033.9267194009793243294@kernel.org

> diff --git a/tools/testing/selftests/net/fib_tests.sh b/tools/testing/selftests/net/fib_tests.sh
> index b338bfb196a27..9ce5623b049c1 100755
> --- a/tools/testing/selftests/net/fib_tests.sh
> +++ b/tools/testing/selftests/net/fib_tests.sh

[ ... ]

> @@ -763,9 +763,9 @@ check_rt_num()
>  
>      if [ $num -ne $expected ]; then
>  	echo "FAIL: Expected $expected routes, got $num"
> -	ret=1
> +	RET=1
>      else
> -	ret=0
> +	RET=0
>      fi
>  }

[Severity: Medium]
check_rt_num() still sets RET=0 when a check passes. Can a later passing
check_rt_num() in the same subtest hide an earlier failure?

lib.sh describes RET as "Per-test return value. Clear at the beginning of
each test." Its helpers only ever raise it. For example,
ret_set_ksft_status() does:

	RET=$(ksft_status_merge $RET $ksft_status)

Several subtests call check_rt_num() more than once before a single
log_test. For example, fib6_ra_to_static() does:

	check_rt_num 1 $($IP -6 route list |grep expires|wc -l)
	...
	check_rt_num 1 $($IP -6 route list |grep expires|wc -l)
	...
	check_rt_num 2 $($IP -6 route list |grep expires|wc -l)

	log_test "$RET" 0 "ipv6 promote RA route to static"

Say the on-link route still has an expiry after the static address is
added. The first check prints "FAIL: Expected 1 routes, got 2". If the
last check then passes, it resets RET to 0. log_test() prints [ OK ],
nfail is not incremented, the global ret stays 0, and the script exits
with 0.

The same pattern shows up in two more places:

- In fib6_gc_test(), for "promote to permanent routes": three check_rt_num
  calls run before the final "check_rt_num 0" on route list cache.

- In fib6_ra_to_static(), for "RA route with nexthop do not merge into
  ECMP with static": the "2001:12::/64 via" check is followed by the
  "nexthop via" check.

This looks like the same symptom the commit message describes, only
inside a single subtest. Could check_rt_num() set RET=1 only on failure,
with RET=0 cleared at the start of each logged subtest?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260929-self_fib_tests-v1-1-0eab6a3c3a3c%40kylinos.cn
