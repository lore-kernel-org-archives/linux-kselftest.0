Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC96037B01E;
	Mon, 28 Sep 2026 07:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790581829; cv=none; b=JpbqDeEMDphOAEyuDiyj8jXqS7Id+7RyPTuAbqWHsq+vR/1PZTdhECOaAfp3fA5I5AQTgZOzKoUE6nBogbEgprJDsbqJkUfR84MZIYbt6lanJ0wsBF0m8w7TmGOkE6gycU/4foI6aVaJ3duL0u+9ygU8DN/P8OixJImf4eKDzLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790581829; c=relaxed/simple;
	bh=R91UUIGxGdUUal1Fjt/Fda413UziiCKSUMl+y9Z8ltc=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nYLK2tHZFXvg82Wx+IadDl6ugVxn1vqR5jLgDL+Y8+dhyLvGhOtxv17etEowOuB1qkRbKOwmJIRHtH0orOhRBVMIcWQBGuBEJghc4AXHyC/I5pXdnNzISNxWjMt2IN/PTegz8uPuXtbej2zkhDlyOz5F1C8svdOv4Nnbli08HYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E75x7JfB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E75x7JfB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 884751F000FF;
	Mon, 28 Sep 2026 07:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790581827;
	bh=dDbHCVi7NQDvGZJMX6z09Gx0Mb5wxCotL+4xFXUjdcM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=E75x7JfBLkSCIx80JCNO6MZo2TQgY+pNlojZ34G6ZaHgAAKzJbuMxy/1YjOYjPM5H
	 noKREW2DboSoBxqre4h+80rXReD4ygomZdavRBGKL0x/q2xRnZbtY38ppqgQevCpgV
	 JU2uSa47P2w3ui2X1w1qhfHWGjh8ldi3MjbE/2UKttRFYiTZZT60eaVUVD85E+uFXL
	 wyEgrAvTaan3IQOhFPorA8Sp9EoJXlI9rBBNW+N3XulSwUBidMs6QbEGUW+q5FRfqm
	 klN3lF9VxWcB91FRjspjbEYzl55P+atD5yVDGPSK6Tg9xfdFKLd6DaqkW/MK088VS3
	 1vVvRpgoQ4btQ==
Subject: Re: [PATCH net-next v5] selftests: net: move log_test to lib file and
 remove duplicate code
From: netdev-bot+sashiko@kernel.org
To: hangbin.liu@linux.dev
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, shuah@kernel.org, dsahern@kernel.org,
 idosch@nvidia.com, andrea.mayer@uniroma2.it, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 liuhangbin@kylinos.cn
Date: Mon, 28 Sep 2026 07:50:26 +0000
Message-ID: <179058182603.3145.7204688879722696786@kernel.org>
In-Reply-To: <20260924-self_log_test-v5-1-1f00bd383146@kylinos.cn>
References: <20260924-self_log_test-v5-1-1f00bd383146@kylinos.cn>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] In the new log_test_expected()
  (tools/testing/selftests/net/lib.sh), the failure branch calls the…
- [Low] The commit message miscounts one output-format change.

--

selftests: net: move log_test to lib file and remove duplicate code

This adds a shared log_test_expected() helper to
tools/testing/selftests/net/lib.sh. It converts 31 net selftests so their
local log_test() wrappers call the helper instead of carrying their own
copies. The output format becomes "    TEST: %-60s" in all of them, and
PAUSE, PAUSE_ON_FAIL and VERBOSE are handled the same way in every
converted script.

> In addition to the above, 13 tests that previously used "TEST:" now use
> "    TEST:" (4-space prefix), and srv6 tests plus vrf_strict_mode_test.sh
> that previously used "\n    TEST:" (newline + 4-space prefix) now with no
> leading newline.

[Severity: Low]
Is the count of 13 still right? The patch converts 12 scripts that printed
an unprefixed "TEST:":

  fcnal-test.sh, fdb_flush.sh, fib_nexthop_multiprefix.sh,
  fib_nexthop_nongw.sh, icmp_redirect.sh, l2tp.sh,
  test_bridge_backup_port.sh, test_bridge_neigh_suppress.sh,
  test_vxlan_mdb.sh, test_vxlan_nolocalbypass.sh, vrf-xfrm-tests.sh,
  vrf_route_leaking.sh

The 13th looks like fib_nexthops.sh. It was dropped in v4 and still has its
own log_test() that prints "TEST: %-60s". Could the number be updated?

> diff --git a/tools/testing/selftests/net/lib.sh b/tools/testing/selftests/net/lib.sh
> index d46d2cec89e4..b31bd6f6efd8 100644
> --- a/tools/testing/selftests/net/lib.sh
> +++ b/tools/testing/selftests/net/lib.sh
> @@ -454,6 +454,40 @@ log_test_xfail()
>  	RET=$ksft_xfail retmsg= log_test "$@"
>  }
>  
> +# Log test result with expected return value
> +log_test_expected()
> +{
> +	local rc=$1
> +	local expected=$2
> +	local msg="$3"
> +	local a
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
> +	fi

[Severity: Medium]
Could this call end a caller that runs under set -e? The shared
pause_on_fail() in lib.sh ends with an && list:

pause_on_fail()
{
	if [[ $PAUSE_ON_FAIL == yes ]]; then
		echo "Hit enter to continue, 'q' to quit"
		read a
		[[ $a == q ]] && exit 1
	fi
}

If the user presses Enter, or types anything other than q, the function
returns 1. Here it is called as a plain command, so errexit applies to it.

fib6_gc_test() in fib_tests.sh turns on errexit and then calls log_test:

fib6_gc_test()
{
	...
	set -e
	...
	check_rt_num 0 $($IP -6 route list |grep expires|wc -l)
	log_test $ret 0 "ipv6 route garbage collection"

Take "fib_tests.sh -p -t ipv6_gc" with a wrong route count. Pressing Enter
at the prompt would then exit the whole script with status 1. The remaining
tests and the summary are skipped, and the "return 0" at the end of
log_test_expected() is never reached.

The old log_test() in fib_tests.sh ran the prompt inline in an if body.
There the trailing && list is exempt from errexit, so the script kept
running. The other set -e regions in fib_tests.sh that call log_test
before set +e look affected in the same way.

This also doesn't match the commit message's statement that "The function
always returns 0 to avoid influencing later code". Would something like
"pause_on_fail || true" avoid the early exit?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260924-self_log_test-v5-1-1f00bd383146%40kylinos.cn
