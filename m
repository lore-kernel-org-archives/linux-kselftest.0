Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0077471272;
	Fri, 14 Aug 2026 17:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786728520; cv=none; b=rccHqIVbXE+9DQcb03xOxKnrVHUzDIl3sxy18zLYbqbx94ekef+ekn3YtdaTXciEA5El2ElM4j9x7zI2GZCETe2x9ToEHE3sSqSHNXNeArL/tp93+7U5gWRqioEF6Qfv26xHouXH6ZDnt2AWeeIjDvp0tbbBwRLAdiYTiEAVPhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786728520; c=relaxed/simple;
	bh=7ydO/+TeWUCwWo03dgVnvjgpq6oWZtizZ1V73IuDL3A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gKdLONBILKZxnN8NPJ3ylzb5ZWL5hy6cdKDkuxknzTR/cVjdcYg3vLFJERiUKhzkmBKgONaVfBLplEwD5CoHBAkHLLf5UfMz3fh7Kgnoh92bMkPBJUd0oLUpVLGe4d3jiJZ8A3QxmhBh3GjFCzKfb5E0GkY4jCx1uF2J8cJY7q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ro0BWIkx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ro0BWIkx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10C001F000E9;
	Fri, 14 Aug 2026 17:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786728517;
	bh=huQvDTnRpL3m6ulG6CgWUOiOoYsJwpw6a60z8DCcmao=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Ro0BWIkxXaMEFoVOLwIZucdP9aB4nXiKE+FgGO7GNQFEJ7qgSNISYJcOluP9f2sg2
	 +LV7Bhu25ZwphsJjKb2GzcWtISq1afgyYrX+Q/gqcUj8xH0h8W2Pjruq4nd8MvpVVF
	 Zvn9w5CxtqcfSlxDoJA3xTyRvEIgRgfQwRqKUxIJTAp8+xaidFs7qPOS5TV5357Wis
	 vp7W7TAE+l8picpnDzLTX5kfYZibAlN3vuoN1tvBt7koliNUCQ4dKOmpLNuUDBwWOv
	 djgcAlmcV8kjZr6rgFC4AUpoyFo5hdgkLCp3p0j3LE6x1blxePM7C+0wCjIMvJva7R
	 PbzDGFm6gZFRw==
From: Jakub Kicinski <kuba@kernel.org>
To: liuhangbin@gmail.com
Cc: Jakub Kicinski <kuba@kernel.org>,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	dsahern@kernel.org,
	idosch@nvidia.com,
	andrea.mayer@uniroma2.it,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	liuhangbin@kylinos.cn
Subject: Re: [PATCH net-next] selftests: net: move log_test to lib file and remove duplicate code
Date: Fri, 14 Aug 2026 10:28:35 -0700
Message-ID: <20260814172836.3099522-1-kuba@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260813-self_log_test-v1-1-f88b1107842e@kylinos.cn>
References: <20260813-self_log_test-v1-1-f88b1107842e@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
---
selftests: net: move log_test to lib file and remove duplicate code

This moves the various open coded log_test() helpers from 33 net selftest
scripts into a single log_test_expected() in tools/testing/selftests/net/lib.sh,
leaving a thin log_test() wrapper in each script. The fourth (xfail)
argument of icmp_redirect.sh's log_test() is dropped, while the xfail
handling is kept in the new helper.

A couple of questions about the new shared helper below.

> diff --git a/tools/testing/selftests/net/drop_monitor_tests.sh b/tools/testing/selftests/net/drop_monitor_tests.sh

[ ... ]

> diff --git a/tools/testing/selftests/net/fib_nexthops.sh b/tools/testing/selftests/net/fib_nexthops.sh
> index 3d347126730a9..16fe92775ae0a 100755
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

[ ... ]

> diff --git a/tools/testing/selftests/net/icmp_redirect.sh b/tools/testing/selftests/net/icmp_redirect.sh
> index b13c89a99ecba..0107af73aef4d 100755
> --- a/tools/testing/selftests/net/icmp_redirect.sh
> +++ b/tools/testing/selftests/net/icmp_redirect.sh
> @@ -61,28 +61,7 @@ log_section()
>  
>  log_test()
>  {
> -	local rc=$1
> -	local expected=$2
> -	local msg="$3"
> -	local xfail=$4
> -
> -	if [ ${rc} -eq ${expected} ]; then
> -		printf "TEST: %-60s  [ OK ]\n" "${msg}"
> -		nsuccess=$((nsuccess+1))
> -	elif [ ${rc} -eq ${xfail} ]; then
> -		printf "TEST: %-60s  [XFAIL]\n" "${msg}"
> -		nxfail=$((nxfail+1))
> -	else
> -		ret=1
> -		nfail=$((nfail+1))
> -		printf "TEST: %-60s  [FAIL]\n" "${msg}"
> -		if [ "${PAUSE_ON_FAIL}" = "yes" ]; then
> -			echo
> -			echo "hit enter to continue, 'q' to quit"
> -			read a
> -			[ "$a" = "q" ] && exit 1
> -		fi
> -	fi
> +	log_test_expected "$1" "$2" "$3"
>  }
>  
>  log_debug()

[ ... ]

> diff --git a/tools/testing/selftests/net/lib.sh b/tools/testing/selftests/net/lib.sh
> index d46d2cec89e45..e02a6a91ff913 100644
> --- a/tools/testing/selftests/net/lib.sh
> +++ b/tools/testing/selftests/net/lib.sh
> @@ -454,6 +454,44 @@ log_test_xfail()
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
> +		printf "TEST: %-60s  [ OK ]\n" "${msg}"
> +	elif [ "${rc}" -eq "${ksft_skip}" ]; then
> +		[[ "$ret" -eq 0 ]] && ret="$ksft_skip"
> +		nskip=$((nskip+1))
> +		printf "TEST: %-60s  [SKIP]\n" "${msg}"
> +	elif [ "${rc}" -eq "${ksft_xfail}" ]; then
> +		nxfail=$((nxfail+1))
> +		printf "TEST: %-60s  [XFAIL]\n" "${msg}"

[Severity: High]
Can these two arms turn real failures into [XFAIL] or [SKIP]?

The callers pass a raw exit status from ip, bridge, ping or grep, and the
new arms only look at that raw value, never at "expected".  With
ksft_xfail=2 and ksft_skip=4, any command that exits 2 or 4 is reclassified
even when 0 was expected.

fib_nexthops.sh has two unconditional hard-failure calls:

tools/testing/selftests/net/fib_nexthops.sh:ipv6_fcnal_runtime() {
	...
	else
		log_test 2 0 "Ping - multipath failed"
	fi
	...
}

and the same in ipv4_fcnal_runtime().  Before this patch these reached the
FAIL arm (nfail++ and ret=1); now they hit the XFAIL arm, which touches
neither nfail nor ret.  The summary in that script prints only
nsuccess/nfail/nskip and it ends with "exit $ret", so does this failure now
disappear from both the output and the exit status?

The same concern applies to ordinary positive checks written as
"log_test $? 0 ...".  iproute2 returns 2 for kernel-reported errors and ping
returns 2 for local errors such as "Network is unreachable", for example in
fcnal-test.sh:

	run_cmd ping -c1 -w1 -I br0 ${NSB_IP}
	log_test $? 0 "Bridge into VRF - IPv4 ping out"

and fcnal-test.sh decides its verdict from nfail alone:

	if [ $nfail -ne 0 ]; then
		exit 1 # KSFT_FAIL

Would it be safer to only take the SKIP/XFAIL arms when "expected" itself is
ksft_skip/ksft_xfail?

Two related observations: the SKIP arm also rewrites ret from 0 to
ksft_skip, and the srv6 scripts then normalize that away in
print_log_test_results():

	if [ "${ret}" -ne 1 ]; then
		ret=0
	fi

In the other direction, icmp_redirect.sh's checks are grep pipelines that
only produce 0 or 1, so after dropping the fourth argument its nxfail
counter and the "Tests xfailed" line can no longer be reached.

> +	else
> +		ret=$(ksft_exit_status_merge "$ret" "$ksft_fail")
> +		nfail=$((nfail+1))
> +		printf "TEST: %-60s  [FAIL]\n" "${msg}"
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
> +}
> +
>  log_info()
>  {
>  	local msg=$1

[ ... ]

> diff --git a/tools/testing/selftests/net/test_bridge_neigh_suppress.sh b/tools/testing/selftests/net/test_bridge_neigh_suppress.sh
> index e9ed0d7509962..9d2dc0faf741d 100755
> --- a/tools/testing/selftests/net/test_bridge_neigh_suppress.sh
> +++ b/tools/testing/selftests/net/test_bridge_neigh_suppress.sh
> @@ -72,39 +72,7 @@ PAUSE=no
>  
>  log_test()
>  {

[ ... ]

> -	[ "$VERBOSE" = "1" ] && echo
> -	return 0
> +	log_test_expected "$1" "$2" "$3"
>  }

[Severity: Medium]
Is dropping this "return 0" safe here?

The last command of log_test_expected() in lib.sh is:

	[ "$VERBOSE" = "1" ] && echo

so with the default VERBOSE=0 the helper, and therefore this wrapper,
returns 1.  In this script the test functions end with a
"log_test $? 0 ..." call, and the driver loop merges their status into ret:

	setup
	$t
	ret=$(ksft_exit_status_merge "$ret" $?)
	cleanup

with "exit $ret" at the end.  Since ksft_exit_status_merge 0 1 yields 1,
does the script now exit 1 on every run while still printing
"Tests failed:   0"?  The removed "return 0" looks like it existed for
exactly this reason.

[ ... ]
-- 
pw-bot: cr
