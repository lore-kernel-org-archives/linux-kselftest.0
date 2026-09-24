Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2DE8472079;
	Thu, 24 Sep 2026 11:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251081; cv=none; b=Kgm4eDH8xzb1GLDvT1xVDUU+j6c/VeivGWA6W+cAldnB2j5V+6jd4PEz0yJCm7sQAocfuXDqbrOdlBxE3eH4+aiacYDwGXB0k/k5841ul8t54lV9/P3z8VUVJcbZn5Yq06GPXp5p6/QV1heCIGekTk5q8NDbMTTdf/z5UunjlGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251081; c=relaxed/simple;
	bh=WYRdwmjOE4EdofXjyjYssWNA404SQFqhrdLjsrijNdc=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Cs7FEz20+NdY8mA7mvr5aisxCxPPb1wrAtPZLLwMiTnPMSI1W5K7OL8vXLgjXIiIgBnLdgOvRtky23H4zhZDdPVdz7tycfzZrT+OgahDwFEWBv4DAVjDA1GrAZIKUg5VxCrkAt7l0Uxm9zveQGwtUbovAG/d1EsF2+LMtSDSCP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OY/OiSF8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OY/OiSF8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8C4B1F00898;
	Thu, 24 Sep 2026 11:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790251079;
	bh=duuiQ04qyD34i7KB1Tb8+L5FCvvWnLuj6fBo5yAyNm8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=OY/OiSF8/lp8/o8T+q0MeFjEBgMUQvpoBNkdKGKAmk6rnZw78ajl7UymIGyt7RSgI
	 G/96VCYSqbrkvT2lOhZ7jUldbiDXXkHx+cNTlMxwalCDKTZ3URWkJZotMhG+OSG64h
	 E8aJj+W7IfM8WcSg6aIvBvtL+PPY0oJmS4U3SRgg/BfLbleCWYCR7DOJGrb4XKKvcF
	 CkQdCwlF2y/795dmTPlioxaL61J7RfhjfijZiDfIVE6YH3ze99RcrzD42KrWGPZazb
	 RLVXK2VmqkuN01fiyQlfv61RSVOQFpza4rnFlIXIN1Hh4Joz16zGQzgZq6D+u3UO09
	 gflY4D33SSodw==
Subject: Re: [PATCH net-next 3/5] selftests: seg6: move SRv6 End PSP setup
 into its own helper
From: netdev-bot+sashiko@kernel.org
To: hangbin.liu@linux.dev
Cc: andrea.mayer@uniroma2.it, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, shuah@kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, liuhangbin@kylinos.cn
Date: Thu, 24 Sep 2026 11:57:58 +0000
Message-ID: <179025107823.2160803.7801303260933899523@kernel.org>
In-Reply-To: <20260922-srv6_flavors_endx-v1-3-4d01c05c47b7@kylinos.cn>
References: <20260922-srv6_flavors_endx-v1-3-4d01c05c47b7@kylinos.cn>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] Mid-run re-arming of the SETUP_ERR latch converts already-
  recorded test FAILures into an overall SKIP.
- [Low] setup_end_flv_psp()
  (tools/testing/selftests/net/srv6_end_flavors_test.sh:651-670) is…

--

selftests: seg6: move SRv6 End PSP setup into its own helper

This moves the End PSP policy installation out of setup() into a new
setup_end_flv_psp() helper, and calls that helper from
host_srv6_end_flv_psp_tests() with errexit enabled around it. The intent
is to decouple the base topology setup from the flavor-specific test case.

> diff --git a/tools/testing/selftests/net/srv6_end_flavors_test.sh b/tools/testing/selftests/net/srv6_end_flavors_test.sh
> index 318487eda671b..56a1c5f865a77 100755
> --- a/tools/testing/selftests/net/srv6_end_flavors_test.sh
> +++ b/tools/testing/selftests/net/srv6_end_flavors_test.sh
> @@ -645,6 +645,12 @@ setup()
>  	setup_rt_local_sids 3 "1 2 4"
>  	setup_rt_local_sids 4 "1 2 3"
>  
> +	# testing environment was set up successfully
> +	SETUP_ERR=0
> +}
> +
> +setup_end_flv_psp()
> +{
>  	# set up SRv6 policies
>  	# create a connection between hosts hs-1 and hs-2.
>  	# The path between hs-1 and hs-2 traverses SRv6 aware routers.

[ ... ]

>  	#  - rt-1 (SRv6 End flavor PSP with SL=1)
>  	setup_rt_policy_ipv6 2 1 "3:noflv 4:psp 2:psp"
>  	setup_rt_policy_ipv6 1 2 "1:psp"
> -
> -	# testing environment was set up successfully
> -	SETUP_ERR=0
>  }

[Severity: Low]
The commit message says the split lets "each PSP test case can setup and
later cleanup independently", but this commit only adds the setup half.
setup_end_flv_psp() installs the localsid seg6local routes, the cafe::<dst>
H.Insert route and the proxy NDP entries through __setup_rt_policy(), and
nothing releases them except the global EXIT trap cleanup(), which just
does:

	for i in ${ROUTERS}; do
		nsname="$(get_rtname "${i}")"
		ip netns del "${nsname}" &>/dev/null || true
	done

Would it make sense to mention in the commit message that the matching
cleanup_end_flv_psp() arrives in the following patch ("selftest: seg6: add
explicit cleanup for SRv6 End PSP test")? As it stands the description
promises a teardown path that does not exist yet at this commit. There is no
functional problem here, since the two PSP policies are the only flavor
state installed and netns deletion reclaims everything.

>  
>  check_rt_connectivity()
> @@ -758,7 +761,13 @@ host2gateway_tests()
>  
>  host_srv6_end_flv_psp_tests()
>  {
> -	log_section "SRv6 connectivity test hosts (h1 <-> h2, PSP flavor)"
> +	set -e
> +	SETUP_ERR=1
> +	setup_end_flv_psp
> +	SETUP_ERR=0
> +	set +e

[Severity: Low]
Can re-arming SETUP_ERR here turn already-recorded failures into a skip?

By the time host_srv6_end_flv_psp_tests() runs, router_tests() and
host2gateway_tests() have already executed and may have set ret=1 and
incremented nfail:

	setup
	set +e

	router_tests
	host2gateway_tests
	host_srv6_end_flv_psp_tests

	print_log_test_results

If any ip command inside setup_end_flv_psp() fails, for example the
"encap seg6local action End flavors psp" route add, errexit aborts the
script while SETUP_ERR is still 1, and the EXIT trap takes this path in
cleanup():

	if [ "${SETUP_ERR}" -ne 0 ]; then
		echo "SKIP: Setting up the testing environment failed"
		exit "${ksft_skip}"
	fi

	exit "${ret}"

so the script exits 4 (skip) instead of reaching exit ${ret} with ret=1, and
print_log_test_results is never reached, meaning the tests passed/failed
summary is lost too.

The final patch of this series ("selftests: seg6: add End.X PSP selftest")
changes the guard to also require [ "$ret" -ne "$ksft_fail" ], which removes
the fail-to-skip masking. Could that guard change be moved earlier in the
series, so the intermediate commits do not carry the masking behaviour?

> +
> +	log_section "SRv6 connectivity test hosts (h1 <-> h2, End flavor PSP)"
>  
>  	check_and_log_hs_connectivity 1 2
>  	check_and_log_hs_connectivity 2 1

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260922-srv6_flavors_endx-v1-0-4d01c05c47b7%40kylinos.cn
