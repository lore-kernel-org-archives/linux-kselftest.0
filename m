Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 052782F7F00;
	Thu, 24 Sep 2026 00:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790210420; cv=none; b=T9H09g/2Lqv2bcO3WimSDgjEEX1y+XRGepDtg8ThBFt1hUxK+ABy6GtVCAEb4wASre4qaDIp8LAbrLWUrhRG3KKIE2290zw2QzsqoXVwXAJYkW1H8Nn7u22LBaY+7/gnW+30PSW9NrM0Vwf1wk1gY5fC4XmhbyqyiowfNIzIi8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790210420; c=relaxed/simple;
	bh=PCgXYv1pH2IoUq1fV221m4MwCZ45Q68sFCoZOWrcf9k=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FwcRJ1y+jsxw6Kdsh/lBtwMELRQrjG8Fh8mbg9iWWXW8/tnwtvQsQHr7gQbhMBtgLBCkpg7fQbUs2dGbjMr+0LkJ5KprIZT1lraWjTURCGzWuCwIvpGGN5otWy5eYc0k/heeXNg/zpb6I66QsK4i9cBjOlU+t28k2+pe3bBCciQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U3E0oBpG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U3E0oBpG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28E241F000FF;
	Thu, 24 Sep 2026 00:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790210418;
	bh=iWeJIz6tY4qxHuxh3VhllSj2/KgSAcS6kffc8QbZogg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=U3E0oBpGaFb/q1tz964I0HqQfOOBXbHFr27IrpydDU/FM5y8jlL0vDqtUJOV0wvcX
	 mYijrPPKa+/ZrSNUW0fLo6fBmz6zF5vxmK4hGHf9HWEHLKZ6wX8DN3G9BqY5AGnab7
	 HXDKXHSOLCG4ZE/bdYaHy15RvOWm7I4IdFEoX2BpHlJ7UmdeUDH6/HqzNLrrLksjX1
	 2keVFdP0+i/YD9fb1Bx9qojwGANM256oO/yIw7XffxZtrY988h5/bYDy4RPguvArmS
	 L00hQ7YP/PhQvk5XjAF7UGLlxBgEONzn3TrcSA0AXL3RFkXE+JGLl9Kgl0XXH+Bmvf
	 XhU+4H1BgnMaA==
Subject: Re: [PATCH net-next v4] selftests: net: move log_test to lib file and
 remove duplicate code
From: netdev-bot+sashiko@kernel.org
To: hangbin.liu@linux.dev
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, shuah@kernel.org, dsahern@kernel.org,
 idosch@nvidia.com, andrea.mayer@uniroma2.it, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 liuhangbin@kylinos.cn
Date: Thu, 24 Sep 2026 00:40:17 +0000
Message-ID: <179021041767.2160803.17788389754543951970@kernel.org>
In-Reply-To: <20260922-self_log_test-v4-1-4c656801f8dc@kylinos.cn>
References: <20260922-self_log_test-v4-1-4c656801f8dc@kylinos.cn>
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

- [Medium] Loop-variable corruption in fcnal-test.sh via bash dynamic
  scoping: the new shared helper `log_test_expected()` in…

--

selftests: net: move log_test to lib file and remove duplicate code

This adds a shared log_test_expected() helper to
tools/testing/selftests/net/lib.sh and replaces the near-identical
per-script log_test() implementations in 31 net selftests with a call
into it.  The new helper also gains PAUSE_ON_FAIL and PAUSE handling for
scripts that previously had none.

Link: https://lore.kernel.org/r/20260915-self_log_test-v3-1-a17728176334@kylinos.cn
Link: https://lore.kernel.org/r/20260831-self_log_test-v2-1-eda2e8490cf9@kylinos.cn
Link: https://lore.kernel.org/r/20260813-self_log_test-v1-1-f88b1107842e@kylinos.cn

> diff --git a/tools/testing/selftests/net/fcnal-test.sh b/tools/testing/selftests/net/fcnal-test.sh
> index 890c3f8e51bb8..a50609535fedc 100755
> --- a/tools/testing/selftests/net/fcnal-test.sh
> +++ b/tools/testing/selftests/net/fcnal-test.sh
> @@ -97,34 +97,7 @@ fi
>
>  log_test()
>  {
> -	local rc=$1
> -	local expected=$2
> -	local msg="$3"
> -	local ans
> -
> -	[ "${VERBOSE}" = "1" ] && echo
> -
> -	if [ ${rc} -eq ${expected} ]; then
> -		nsuccess=$((nsuccess+1))
> -		printf "TEST: %-70s  [ OK ]\n" "${msg}"
> -	else
> -		nfail=$((nfail+1))
> -		printf "TEST: %-70s  [FAIL]\n" "${msg}"
> -		echo "    expected rc $expected; actual rc $rc"
> -		if [ "${PAUSE_ON_FAIL}" = "yes" ]; then
> -			echo
> -			echo "hit enter to continue, 'q' to quit"
> -			read ans
> -			[ "$ans" = "q" ] && exit 1
> -		fi
> -	fi
> -
> -	if [ "${PAUSE}" = "yes" ]; then
> -		echo
> -		echo "hit enter to continue, 'q' to quit"
> -		read ans
> -		[ "$ans" = "q" ] && exit 1
> -	fi
> +	log_test_expected "$1" "$2" "$3"
>
>  	kill_procs
>  }

[Severity: Medium]
The old fcnal-test.sh log_test() declared "local ans" and used "read ans"
in both pause branches.  Was that deliberate?  Many fcnal-test.sh test
functions use "a" as their address loop variable, for example
ipv4_ping_novrf():

	local a
	...
	for a in ${NSB_IP} ${NSB_LO_IP}
	do
		log_start
		run_cmd ping -c1 -w1 ${a}
		log_test_addr ${a} $? 0 "ping out"

		log_start
		run_cmd ping -c1 -w1 -I ${NSA_DEV} ${a}
		log_test_addr ${a} $? 0 "ping out, device bind"

The new shared helper in lib.sh reads into an undeclared "a" instead, and
bash dynamic scoping makes that assignment land in the caller's "local a".
The call chain is:

	ipv4_ping_novrf() -> log_test_addr() -> log_test() ->
		log_test_expected() -> read -r a
	ipv4_ping_novrf() -> log_test_addr() -> log_test() ->
		log_test_expected() -> pause_on_fail() -> read a

Neither log_test_addr(), log_test(), log_test_expected() nor
pause_on_fail() declares "local a".  With "-p" (PAUSE_ON_FAIL=yes) or "-P"
(PAUSE=yes) from the fcnal-test.sh getopts handling, does pressing plain
enter set a="" and leave the remaining subtests in the same loop iteration
pinging no destination and logging an empty address?

> diff --git a/tools/testing/selftests/net/lib.sh b/tools/testing/selftests/net/lib.sh
> index d46d2cec89e45..f6f8b100a70c7 100644
> --- a/tools/testing/selftests/net/lib.sh
> +++ b/tools/testing/selftests/net/lib.sh
> @@ -454,6 +454,39 @@ log_test_xfail()
>  	RET=$ksft_xfail retmsg= log_test "$@"
>  }
>
> +# Log test result with expected return value
> +log_test_expected()
> +{
> +	local rc=$1
> +	local expected=$2
> +	local msg="$3"
> +
> +	if [ "${rc}" -eq "${expected}" ]; then
> +		nsuccess=$((nsuccess+1))
> +		printf "    TEST: %-60s  [ OK ]\n" "${msg}"
> +	else
> +		ret="$ksft_fail"
> +		nfail=$((nfail+1))
> +		printf "    TEST: %-60s  [FAIL]\n" "${msg}"
> +		if [ "$VERBOSE" = "1" ]; then
> +			echo "    rc=$rc, expected $expected"
> +		fi
> +
> +		pause_on_fail

[Severity: Medium]
pause_on_fail() in lib.sh also reads without declaring the variable:

	pause_on_fail()
	{
		if [[ $PAUSE_ON_FAIL == yes ]]; then
			echo "Hit enter to continue, 'q' to quit"
			read a
			[[ $a == q ]] && exit 1
		fi
	}

Would adding "local a" to log_test_expected() (and to pause_on_fail())
keep the caller's "a" intact?

> +	fi
> +
> +	if [ "${PAUSE}" = "yes" ]; then
> +		echo
> +		echo "hit enter to continue, 'q' to quit"
> +		read -r a
                     ^^^^^^^^^

[Severity: Medium]
This is the PAUSE=yes path that fcnal-test.sh reaches with "-P".  Since
the pause fires after every test there, does every fcnal-test.sh function
that declares "local a" lose its loop value here, including
ipv4_ping_vrf(), the ipv4_tcp_* and ipv6_* helpers, and the netfilter_*
helpers?

> +		[ "$a" = "q" ] && exit 1
> +	fi
> +
> +	[ "$VERBOSE" = "1" ] && echo
> +
> +	return 0
> +}
> +
>  log_info()
>  {
>  	local msg=$1

[ ... remaining per-script log_test() conversions snipped ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260922-self_log_test-v4-1-4c656801f8dc%40kylinos.cn
