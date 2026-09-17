Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61FA9384CD6;
	Thu, 17 Sep 2026 02:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789611845; cv=none; b=G7TLZ0AGIQ4x8qVjQbx2fsIFlZ9fdVEAZlPC+YymCfnX42t168KwwF5QkmU+WSgi+rKNGA/hyfqtzITU8H1MACH25fFj7upi7ojw2bhzWBfaGTqChZrgi5BWoGa+wWOI0NNLloFgkwqCqIveAw/BEhYpajvYI9R7hYfiDmnr7/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789611845; c=relaxed/simple;
	bh=1sI9mPQthMdm9749yZsmI8NI1PBy6Z05H/0ktV7+IA4=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KxahktLLQ/JDngtjbmHaWGimxD+ded2XL5xXovrZwoJZn0HIE4VEA16TgO/mFcKkW+smqgfwn/n8FWxR53yQ1c5de0BhkInm5bDz9D8LvqS1DWsXntGFXs6fW5p933qdZveZ/UN7CPsDikx/v6GB5EINy9zD3p8I7Fh9iqc/fYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mcadgJLw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mcadgJLw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F5A41F000FF;
	Thu, 17 Sep 2026 02:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789611842;
	bh=yiRQCHtSQca7GyLDri25y3Iii3nM/iGI8csNiuSJLE8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=mcadgJLwQAPBCwQGNp1ufiLxQ7RL1Ck/OqFOwxYr9i3cZFPCFyxfypbxynW8HbYK1
	 3GQkU6L1yE9YrQtOxVIqNMYErHY1uU9EgYFOdZ93pTDXivTLzcqmQFHCLzvmQxpLOG
	 h5GJuLnE+uhZJ1r3b1IzSdq7yLdDQ0Z/zyRELrzSrNQJU9NisSrptvhzpQx7aEcDBG
	 S5GHlHXaYTHkbRW2Npv9zKvx1RanP7XeJyYqUJ6x8d3Iyex8/zbg2sclfbqutmJFi1
	 Cj5Fpk8omO3/5u9pOus2sNe5UoH38CGvzgxLwZxIUkzfT5SILE1bjUJ6Aay6nvylIp
	 wB/q5kOgrmppg==
Subject: Re: [PATCH net-next v3] selftests: net: move log_test to lib file and
 remove duplicate code
From: netdev-bot+sashiko@kernel.org
To: hangbin.liu@linux.dev
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, shuah@kernel.org, dsahern@kernel.org,
 idosch@nvidia.com, andrea.mayer@uniroma2.it, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 liuhangbin@kylinos.cn
Date: Thu, 17 Sep 2026 02:24:01 +0000
Message-ID: <178961184152.22033.9267194009793243294@kernel.org>
In-Reply-To: <20260915-self_log_test-v3-1-a17728176334@kylinos.cn>
References: <20260915-self_log_test-v3-1-a17728176334@kylinos.cn>
X-sashiko-severity: High
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 5 potential
issue(s) to consider:

Critical: 0 · High: 1 · Medium: 1 (2) · Low: 3

- [High] SKIP-to-FAIL regression in fib_nexthops.sh, based on a factually
  false claim in the commit message.
- [Medium] log_test_expected() in lib.sh unconditionally executes
  `ret=$(ksft_exit_status_merge "$ret" "$ksft_fail")` on the failure…
- [Low] The commit message states "Two callers compared against exit code
  2 are left as-is since code 2 correctly counts as a failure in the…
- [Low] The migration path advertised in the changelog does not work.
- [Low] The changelog justifies a change with a rationale that cannot
  hold: "On failure, ret is set via ksft_exit_status_merge() instead of…

Pre-existing issues:
- [Medium] fdb_flush.sh, fib-onlink-tests.sh and l2tp.sh can print [FAIL]
  subtests while exiting with status 0, because they never consume the…
- [Medium] fib_tests.sh uses the same global `ret` that the shared helper
  treats as cumulative exit status as per-test scratch storage, so a…

--

selftests: net: move log_test to lib file and remove duplicate code

This adds a shared log_test_expected() helper to
tools/testing/selftests/net/lib.sh and replaces the near-identical
per-script log_test() implementations in 32 net selftests with a thin
wrapper around it. A few scripts also start sourcing lib.sh instead of
defining ksft_skip locally.

Link: https://lore.kernel.org/r/20260831-self_log_test-v2-1-eda2e8490cf9@kylinos.cn
Link: https://lore.kernel.org/r/20260813-self_log_test-v1-1-f88b1107842e@kylinos.cn

A few questions about the conversion below.

> diff --git a/tools/testing/selftests/net/fdb_flush.sh b/tools/testing/selftests/net/fdb_flush.sh
> index 9931a1e36e3db..4965e52d5ef54 100755
> --- a/tools/testing/selftests/net/fdb_flush.sh
> +++ b/tools/testing/selftests/net/fdb_flush.sh
> @@ -67,40 +67,7 @@ run_cmd()
>  
>  log_test()
>  {
> -	local rc=$1
> -	local expected=$2
> -	local msg="$3"
> -	local nsuccess
> -	local nfail
> -	local ret
> -
> -	if [ ${rc} -eq ${expected} ]; then
> -		printf "TEST: %-60s  [ OK ]\n" "${msg}"
> -		nsuccess=$((nsuccess+1))
> -	else
> -		ret=1
> -		nfail=$((nfail+1))
> -		printf "TEST: %-60s  [FAIL]\n" "${msg}"
> -		if [ "$VERBOSE" = "1" ]; then
> -			echo "    rc=$rc, expected $expected"
> -		fi
> -
> -		if [ "${PAUSE_ON_FAIL}" = "yes" ]; then
> -		echo
> -			echo "hit enter to continue, 'q' to quit"
> -			read a
> -			[ "$a" = "q" ] && exit 1
> -		fi
> -	fi
> -
> -	if [ "${PAUSE}" = "yes" ]; then
> -		echo
> -		echo "hit enter to continue, 'q' to quit"
> -		read a
> -		[ "$a" = "q" ] && exit 1
> -	fi
> -
> -	[ "$VERBOSE" = "1" ] && echo
> +	log_test_expected "$1" "$2" "$3"
>  }

[Severity: Medium]
The changelog notes that fdb_flush.sh "used local ret, nsuccess, and nfail,
which are not used outside the function", but this script has no global ret
either.  A grep for '\bret\b' in fdb_flush.sh, fcnal-test.sh,
fib-onlink-tests.sh and l2tp.sh at this commit returns no matches.

The failure path of the new helper reads ret unconditionally:

lib.sh:log_test_expected() {
	...
	ret=$(ksft_exit_status_merge "$ret" "$ksft_fail")

With ret unset, the empty first operand ends up as an associative array
subscript in the merge helper:

lib.sh:__ksft_status_merge() {
	...
	if [[ ${weights[$a]} -ge ${weights[$b]} ]]; then

Does bash not print "bad array subscript" here for every failing subtest in
those four scripts?  The merged value still comes out as 1 because the empty
expansion evaluates as 0, so the visible effect is stderr noise from inside
lib.sh, one line per failure (fcnal-test.sh has a lot of subtests).

Would it make sense for the shared helper to default the variable, e.g.
: "${ret:=0}" before the merge, rather than relying on each caller having
defined it?  Also worth noting the copy of this line that previously lived in
test_bridge_neigh_suppress.sh carried a "# shellcheck disable=SC2154" marker
for exactly this referenced-but-not-assigned case, and that marker was
dropped when the code moved into lib.sh.

> diff --git a/tools/testing/selftests/net/fib-onlink-tests.sh b/tools/testing/selftests/net/fib-onlink-tests.sh
> index e0d45292a2983..a26075abf7d27 100755
> --- a/tools/testing/selftests/net/fib-onlink-tests.sh
> +++ b/tools/testing/selftests/net/fib-onlink-tests.sh
> @@ -85,23 +85,7 @@ PBR_TABLE=101
>  
>  log_test()
>  {
> -	local rc=$1
> -	local expected=$2
> -	local msg="$3"
> -
> -	if [ ${rc} -eq ${expected} ]; then
> -		nsuccess=$((nsuccess+1))
> -		printf "    TEST: %-50s  [ OK ]\n" "${msg}"
> -	else
> -		nfail=$((nfail+1))
> -		printf "    TEST: %-50s  [FAIL]\n" "${msg}"
> -		if [ "${PAUSE_ON_FAIL}" = "yes" ]; then
> -			echo
> -			echo "hit enter to continue, 'q' to quit"
> -			read a
> -			[ "$a" = "q" ] && exit 1
> -		fi
> -	fi
> +	log_test_expected "$1" "$2" "$3"
>  }

[Severity: Medium]
This isn't a bug introduced by this patch, but it is worth noting while the
failure bookkeeping is being centralised: fib-onlink-tests.sh, l2tp.sh and
fdb_flush.sh never consume the status the helper records.

fib-onlink-tests.sh ends with:

	if [ "$TESTS" != "none" ]; then
		printf "\nTests passed: %3d\n" ${nsuccess}
		printf "Tests failed: %3d\n"   ${nfail}
	fi

l2tp.sh ends with the same two printf lines, and fdb_flush.sh ends with:

	for t in $TESTS
	do
		setup; $t; cleanup;
	done

None of the three does exit $ret or derives an exit code from nfail, so can
these scripts print [FAIL] subtests and still report success to the kselftest
runner?  Since this patch is what makes ret the shared failure accumulator,
would adding exit $ret to those scripts fit here?

> diff --git a/tools/testing/selftests/net/fib_nexthops.sh b/tools/testing/selftests/net/fib_nexthops.sh
> index 431d7bed76224..d0d979e8e438b 100755
> --- a/tools/testing/selftests/net/fib_nexthops.sh
> +++ b/tools/testing/selftests/net/fib_nexthops.sh
> @@ -70,44 +70,7 @@ nsid=100
>  
>  log_test()
>  {
> -	local rc=$1
> -	local expected=$2
> -	local msg="$3"
> -
> -	if [ ${rc} -eq ${expected} ]; then
> -		printf "TEST: %-60s  [ OK ]\n" "${msg}"
> -		nsuccess=$((nsuccess+1))
> -	else
> -		if [[ $rc -eq $ksft_skip ]]; then
> -			[[ $ret -eq 0 ]] && ret=$ksft_skip
> -			nskip=$((nskip+1))
> -			printf "TEST: %-60s  [SKIP]\n" "${msg}"
> -		else
> -			ret=1
> -			nfail=$((nfail+1))
> -			printf "TEST: %-60s  [FAIL]\n" "${msg}"
> -		fi

[Severity: High]
The changelog states:

  "this test checked for ksft_skip (exit code 4) inside log_test(),
   but no test in the file produces that code."

Are these two call sites not producing exactly that code?

fib_nexthops.sh:ipv6_grp_fcnal() {
	...
	run_cmd "$IP nexthop add id 103 group 62,1000"
	if [[ $? == 0 ]]; then
		local GRP="id 103 group 62,254/63,255/64,256/65,257/66,65535"
		run_cmd "$IP nexthop replace $GRP"
		check_nexthop "id 103" "$GRP"
		rc=$?
	else
		rc=$ksft_skip
	fi

	$IP nexthop flush >/dev/null 2>&1

	log_test $rc 0 "16-bit weights"
}

ipv6_res_grp_fcnal() has the same shape with "group 62,1000 type resilient
buckets 32".

The else branch is taken whenever iproute2 is too old to accept 16-bit
nexthop group weights.  After this change, log_test_expected() gets rc=4
against expected 0, so both subtests take the failure branch: [FAIL] is
printed, nfail is incremented and ret is merged with $ksft_fail.

Combined with exit $ret at the end of the script, does a run on such a host
change from two [SKIP] lines and exit status 4 to two [FAIL] lines and exit
status 1?

The changelog suggests "callers that need to report a skip should use
log_test_skip() instead", but neither of these two callers was converted.

> -
> -		if [ "$VERBOSE" = "1" ]; then
> -			echo "    rc=$rc, expected $expected"
> -		fi
> -
> -		if [ "${PAUSE_ON_FAIL}" = "yes" ]; then
> -		echo
> -			echo "hit enter to continue, 'q' to quit"
> -			read a
> -			[ "$a" = "q" ] && exit 1
> -		fi
> -	fi
> -
> -	if [ "${PAUSE}" = "yes" ]; then
> -		echo
> -		echo "hit enter to continue, 'q' to quit"
> -		read a
> -		[ "$a" = "q" ] && exit 1
> -	fi
> -
> -	[ "$VERBOSE" = "1" ] && echo
> +	log_test_expected "$1" "$2" "$3"
>  }
>  
>  run_cmd()
> @@ -1258,7 +1221,7 @@ ipv6_fcnal_runtime()
>  		run_cmd "ip netns exec $me ping -c1 -w$PING_TIMEOUT 2001:db8:101::1"
>  		log_test $? 0 "Ping - group blackhole replaced with gateways"
>  	else
> -		log_test 2 0 "Ping - multipath failed"
> +		log_test $rc 0 "Ping - multipath failed"
>  	fi

[Severity: Low]
The changelog says:

  "Two callers compared against exit code 2 are left as-is since code 2
   correctly counts as a failure in the previous log_test()."

These are the two callers in question, in ipv6_fcnal_runtime() and
ipv4_fcnal_runtime(), and they are changed rather than left as-is.  Could the
changelog be updated to describe the substitution?

The change itself looks harmless: run_cmd() assigns rc=$? without declaring
it local, so under bash dynamic scoping it writes into the caller's local rc,
and the else branch is only reached when that value is non-zero, so the
subtest still reports [FAIL] with the same message.

>  
>  	#
> @@ -1915,7 +1878,7 @@ ipv4_fcnal_runtime()
>  		run_cmd "ip netns exec $me ping -c1 -w$PING_TIMEOUT 172.16.101.1"
>  		log_test $? 0 "Ping - group blackhole replaced with gateways"
>  	else
> -		log_test 2 0 "Ping - multipath failed"
> +		log_test $rc 0 "Ping - multipath failed"
>  	fi
>  
>  	#
> @@ -2729,7 +2692,6 @@ done
>  if [ "$TESTS" != "none" ]; then
>  	printf "\nTests passed: %3d\n" ${nsuccess}
>  	printf "Tests failed: %3d\n"   ${nfail}
> -	printf "Tests skipped: %2d\n"  ${nskip}
>  fi
>  
>  exit $ret

[Severity: High]
With the skip counter line removed and no skip branch left in the shared
helper, is there any remaining way for this script to report a skipped
subtest?  The two 16-bit weight probes above are the only producers of
ksft_skip and they are now counted in nfail.

> diff --git a/tools/testing/selftests/net/fib_tests.sh b/tools/testing/selftests/net/fib_tests.sh
> index b338bfb196a27..7df967a2d6697 100755
> --- a/tools/testing/selftests/net/fib_tests.sh
> +++ b/tools/testing/selftests/net/fib_tests.sh
> @@ -24,31 +24,7 @@ which ping6 > /dev/null 2>&1 && ping6=$(which ping6) || ping6=$(which ping)
>  
>  log_test()
>  {
> -	local rc=$1
> -	local expected=$2
> -	local msg="$3"
> -
> -	if [ ${rc} -eq ${expected} ]; then
> -		printf "    TEST: %-60s  [ OK ]\n" "${msg}"
> -		nsuccess=$((nsuccess+1))
> -	else
> -		ret=1
> -		nfail=$((nfail+1))
> -		printf "    TEST: %-60s  [FAIL]\n" "${msg}"

[Severity: Medium]
This is a pre-existing issue, but it interacts with making ret a shared
cumulative status in lib.sh: fib_tests.sh also uses the same global ret as
per-test scratch storage.

fib_carrier_unicast_test() starts with an unconditional:

	ret=0

and fib6_notify_test()/fib_notify_test() do:

	if [ -z "$err" ];then
		ret=0
	else
		ret=1
	fi

	log_test $ret 0 "ipv6 route add notify"

None of these declare ret local, and the script finishes with exit $ret.  If
an earlier subtest failed and a later function assigns ret=0 and then passes,
does the script exit 0 despite the printed [FAIL] lines?  Should these
functions use a local variable now that the helper owns ret?

> -		if [ "${PAUSE_ON_FAIL}" = "yes" ]; then
> -		echo
> -			echo "hit enter to continue, 'q' to quit"
> -			read a
> -			[ "$a" = "q" ] && exit 1
> -		fi
> -	fi
> -
> -	if [ "${PAUSE}" = "yes" ]; then
> -		echo
> -		echo "hit enter to continue, 'q' to quit"
> -		read a
> -		[ "$a" = "q" ] && exit 1
> -	fi
> +	log_test_expected "$1" "$2" "$3"
>  }
>  
>  setup()

[ ... ]

> diff --git a/tools/testing/selftests/net/lib.sh b/tools/testing/selftests/net/lib.sh
> index d46d2cec89e45..f698fa3d2bd5f 100644
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

[Severity: Low]
The changelog points callers at log_test_skip() as the replacement for the
removed ksft_skip handling.  Can that helper work in the converted scripts?
It dispatches through log_test:

lib.sh:log_test_skip() {
	RET=$ksft_skip retmsg= log_test "$@"
}

and every script touched here defines its own log_test() after sourcing
lib.sh:

fib_nexthops.sh:log_test() {
	log_test_expected "$1" "$2" "$3"
}

so the local definition shadows lib.sh's log_test().  A call like
log_test_skip "16-bit weights" would then reach log_test_expected with
rc="16-bit weights", expected="" and msg="", i.e.:

	[ "16-bit weights" -eq "" ]

which is an "integer expression expected" error landing in the failure
branch and printing [FAIL] with an empty test name.  There are no callers
today, so nothing breaks right now, but should the wrapper names be
reworked so the suggested migration actually works?

> +		ret=$(ksft_exit_status_merge "$ret" "$ksft_fail")

[Severity: Low]
The changelog gives this as the reason for the change:

  "On failure, ret is set via ksft_exit_status_merge() instead of ret=1,
   so we can propagate ksft_xfail status correctly."

Is that achievable here?  ksft_exit_status_merge() orders the operands as:

lib.sh:ksft_exit_status_merge() {
	...
	__ksft_status_merge "$a" "$b" \
		$ksft_xfail $ksft_pass $ksft_skip $ksft_fail
}

so xfail=0, pass=1, skip=2, fail=3, and the operand with the higher weight
wins.  Since $ksft_fail is always passed as the second operand and carries
the maximum weight, doesn't the result come out as $ksft_fail regardless of
the previous value of ret, including $ksft_xfail?  That makes this line
equivalent to the old ret=1.

> +		nfail=$((nfail+1))
> +		printf "    TEST: %-60s  [FAIL]\n" "${msg}"
> +		if [ "$VERBOSE" = "1" ]; then
> +			echo "    rc=$rc, expected $expected"
> +		fi
> +
> +		pause_on_fail
> +	fi
> +
> +	if [ "${PAUSE}" = "yes" ]; then
> +		echo
> +		echo "hit enter to continue, 'q' to quit"
> +		read -r a
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

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260915-self_log_test-v3-1-a17728176334%40kylinos.cn
