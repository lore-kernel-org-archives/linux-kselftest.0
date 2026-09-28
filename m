Received: from mta1.migadu.com (out-94.mta1.migadu.com [95.215.58.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B15248FF6E
	for <linux-kselftest@vger.kernel.org>; Mon, 28 Sep 2026 09:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.94
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790586785; cv=none; b=brT0YLuslTG4EHr0l94Ddg5TMIG7i7A7qf2qAeyBDEQRNNP9Q3bB8Q0+CZNQBPjcVTWSHavBBN+sWOw3MzbAkhBvQXsF39BBm1fJw26jqLZ7giklXRx+b2TQeAok5qgIWIYsuxI6r0GVucgmrBJxfpAWckvNFBIZXvuqn1yfBoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790586785; c=relaxed/simple;
	bh=1bOzCH3Nyr1fwARZjRwEUsqAboE4HQvE98idl60rzzc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G0ExYF2dn8eRgXFLCKDO7Zqx39nvAJ/uSO83m311lxPKXDXQz7BfoVFrj6hybVlJzFGvOjzHzcVe+7jyv6lOKSLRjx/nYkCuU4FdkzgjBdjdkivNn4rEEEiBb98Oxu74fqeip0YrQjHNaMjEIrQxxUclXX61YzqxAtQD3IUupDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=eapIhzfc; arc=none smtp.client-ip=95.215.58.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="eapIhzfc"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=1bOzCH3Nyr1fwARZjRwEUsqAboE4HQvE98idl60rzzc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790586781; v=1; x=1791191581;
 b=eapIhzfc8F/eMKe600nvyWOmVHn0zHTfiG1D4e7BbBTyekDqOtPjFaDngrS+9TLNIh0SvUl6
 2rKT2UpAHt5Z0wAaUiGvUnFiXY/+WERC9YCaUoygj3ANtCnMAWenefya1dEeY/S/2aBRo9LfhV7
 lhCDqU90TSS0rNC5xfwSAp9w=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id bfdc705e63280055;
	Mon, 28 Sep 2026 09:13:00 +0000
X-Mizu-Trace-ID: bfdc705e63280055
X-Migadu-Flow: FLOW_OUT
Date: Mon, 28 Sep 2026 17:12:50 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: netdev-bot+sashiko@kernel.org
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, horms@kernel.org, shuah@kernel.org,
	dsahern@kernel.org, idosch@nvidia.com, andrea.mayer@uniroma2.it,
	netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, liuhangbin@kylinos.cn
Subject: Re: [PATCH net-next v5] selftests: net: move log_test to lib file
 and remove duplicate code
Message-ID: <arovkoI5s9K7Kbzz@fedora>
References: <20260924-self_log_test-v5-1-1f00bd383146@kylinos.cn>
 <179058182603.3145.7204688879722696786@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <179058182603.3145.7204688879722696786@kernel.org>

On Mon, Sep 28, 2026 at 07:50:26AM +0000, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 · Medium: 1 · Low: 1
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] In the new log_test_expected()
>   (tools/testing/selftests/net/lib.sh), the failure branch calls the…
> - [Low] The commit message miscounts one output-format change.
> 
> --
> 
> selftests: net: move log_test to lib file and remove duplicate code
> 
> This adds a shared log_test_expected() helper to
> tools/testing/selftests/net/lib.sh. It converts 31 net selftests so their
> local log_test() wrappers call the helper instead of carrying their own
> copies. The output format becomes "    TEST: %-60s" in all of them, and
> PAUSE, PAUSE_ON_FAIL and VERBOSE are handled the same way in every
> converted script.
> 
> > In addition to the above, 13 tests that previously used "TEST:" now use
> > "    TEST:" (4-space prefix), and srv6 tests plus vrf_strict_mode_test.sh
> > that previously used "\n    TEST:" (newline + 4-space prefix) now with no
> > leading newline.
> 
> [Severity: Low]
> Is the count of 13 still right? The patch converts 12 scripts that printed
> an unprefixed "TEST:":

OK...

> 
>   fcnal-test.sh, fdb_flush.sh, fib_nexthop_multiprefix.sh,
>   fib_nexthop_nongw.sh, icmp_redirect.sh, l2tp.sh,
>   test_bridge_backup_port.sh, test_bridge_neigh_suppress.sh,
>   test_vxlan_mdb.sh, test_vxlan_nolocalbypass.sh, vrf-xfrm-tests.sh,
>   vrf_route_leaking.sh
> 
> The 13th looks like fib_nexthops.sh. It was dropped in v4 and still has its
> own log_test() that prints "TEST: %-60s". Could the number be updated?
> 
> > diff --git a/tools/testing/selftests/net/lib.sh b/tools/testing/selftests/net/lib.sh
> > index d46d2cec89e4..b31bd6f6efd8 100644
> > --- a/tools/testing/selftests/net/lib.sh
> > +++ b/tools/testing/selftests/net/lib.sh
> > @@ -454,6 +454,40 @@ log_test_xfail()
> >  	RET=$ksft_xfail retmsg= log_test "$@"
> >  }
> >  
> > +# Log test result with expected return value
> > +log_test_expected()
> > +{
> > +	local rc=$1
> > +	local expected=$2
> > +	local msg="$3"
> > +	local a
> > +
> > +	if [ "${rc}" -eq "${expected}" ]; then
> > +		nsuccess=$((nsuccess+1))
> > +		printf "    TEST: %-60s  [ OK ]\n" "${msg}"
> > +	else
> > +		ret="$ksft_fail"
> > +		nfail=$((nfail+1))
> > +		printf "    TEST: %-60s  [FAIL]\n" "${msg}"
> > +		if [ "$VERBOSE" = "1" ]; then
> > +			echo "    rc=$rc, expected $expected"
> > +		fi
> > +
> > +		pause_on_fail
> > +	fi
> 
> [Severity: Medium]
> Could this call end a caller that runs under set -e? The shared
> pause_on_fail() in lib.sh ends with an && list:
> 
> pause_on_fail()
> {
> 	if [[ $PAUSE_ON_FAIL == yes ]]; then
> 		echo "Hit enter to continue, 'q' to quit"
> 		read a
> 		[[ $a == q ]] && exit 1
> 	fi
> }
> 
> If the user presses Enter, or types anything other than q, the function
> returns 1. Here it is called as a plain command, so errexit applies to it.
> 
> fib6_gc_test() in fib_tests.sh turns on errexit and then calls log_test:
> 
> fib6_gc_test()
> {
> 	...
> 	set -e
> 	...
> 	check_rt_num 0 $($IP -6 route list |grep expires|wc -l)
> 	log_test $ret 0 "ipv6 route garbage collection"
> 
> Take "fib_tests.sh -p -t ipv6_gc" with a wrong route count. Pressing Enter
> at the prompt would then exit the whole script with status 1. The remaining
> tests and the summary are skipped, and the "return 0" at the end of
> log_test_expected() is never reached.
> 
> The old log_test() in fib_tests.sh ran the prompt inline in an if body.
> There the trailing && list is exempt from errexit, so the script kept
> running. The other set -e regions in fib_tests.sh that call log_test
> before set +e look affected in the same way.

Does anyone really want to keep running the test when set *PAUSE_ON_FAIL*
and "set -e", and the test failed somehow?

> 
> This also doesn't match the commit message's statement that "The function
> always returns 0 to avoid influencing later code". Would something like
> "pause_on_fail || true" avoid the early exit?

If someone asked, I can do an update for this.

Thanks
Hangbin
