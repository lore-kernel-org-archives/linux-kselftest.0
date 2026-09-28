Received: from mta1.migadu.com (out-53.mta1.migadu.com [95.215.58.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6219E43E06C
	for <linux-kselftest@vger.kernel.org>; Mon, 28 Sep 2026 06:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790576803; cv=none; b=ta6pfy9hgI5M3FFiEXwwQSE5dGu5RryTiDjjQr/DMSelUxECuIcYX1yEP2j2C9DrLeI7C2qjQ/JpZn1Cemg/pID4PsDQCK/62Z2t5uwjtr0GolQGKdLB8bmJemSnS+efG2FB8BhPXI9QC35QXLmoqRQN4pG0OT+KgUB9k/bjNMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790576803; c=relaxed/simple;
	bh=NkzURNoV5IsQG2K2rc3ZLHxvbgasq40uRSu34G2EpOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sVGX2oJfscRUZFjivsarVIKWpUwXgtliqRpCl+CltxUj5GXwp6xmrnjmgaNXU1Aby8RI9hmV539ZoiwKWVgGvAygmX4g/rzjt0geQg70q65s7IllPul1+OPNsw55zCNeEAp58Phi/1Zmg6S9IhTgDt7e9Ypq80pyY/rnL1tiQdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=rQ/3lLNo; arc=none smtp.client-ip=95.215.58.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="rQ/3lLNo"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=NkzURNoV5IsQG2K2rc3ZLHxvbgasq40uRSu34G2EpOQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790576796; v=1; x=1791181596;
 b=rQ/3lLNoVWSTdo+ZQZAPyrJNACT1hQ2izeNwJ04woM5b3wsqPjiQz8xi/LcJRaICqvIvjOyE
 LHjmUduRRg7+LyWFXxlmczUgiYyoiTr9rDNRrioQaDGoK9hzf+ZJP7rCj5u9S43aAfh6u1w6gqd
 GO42EXWolbBW5lzFt8bv9/t0=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 565be971f620d08b;
	Mon, 28 Sep 2026 06:26:36 +0000
X-Mizu-Trace-ID: 565be971f620d08b
X-Migadu-Flow: FLOW_OUT
Date: Mon, 28 Sep 2026 14:26:29 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: netdev-bot+sashiko@kernel.org
Cc: andrea.mayer@uniroma2.it, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
	shuah@kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	liuhangbin@kylinos.cn
Subject: Re: [PATCH net-next 3/5] selftests: seg6: move SRv6 End PSP setup
 into its own helper
Message-ID: <aroIlffAyMRLsJPD@fedora>
References: <20260922-srv6_flavors_endx-v1-3-4d01c05c47b7@kylinos.cn>
 <179025107823.2160803.7801303260933899523@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <179025107823.2160803.7801303260933899523@kernel.org>

On Thu, Sep 24, 2026 at 11:57:58AM +0000, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found more severe
> issue(s) in other patches of this series. This mail is only an FYI, in case
> you want to address the nit picks below when you respin.
> 
> Low priority / nit picks for your consideration:
> 
> - [Low] Mid-run re-arming of the SETUP_ERR latch converts already-
>   recorded test FAILures into an overall SKIP.

OK, I will update the commit description.

> - [Low] setup_end_flv_psp()
>   (tools/testing/selftests/net/srv6_end_flavors_test.sh:651-670) is…

ack, I will move the ret guard to this patch.

Thanks
Hangbin
> 
> --
> 
> selftests: seg6: move SRv6 End PSP setup into its own helper
> 
> This moves the End PSP policy installation out of setup() into a new
> setup_end_flv_psp() helper, and calls that helper from
> host_srv6_end_flv_psp_tests() with errexit enabled around it. The intent
> is to decouple the base topology setup from the flavor-specific test case.
> 
> > diff --git a/tools/testing/selftests/net/srv6_end_flavors_test.sh b/tools/testing/selftests/net/srv6_end_flavors_test.sh
> > index 318487eda671b..56a1c5f865a77 100755
> > --- a/tools/testing/selftests/net/srv6_end_flavors_test.sh
> > +++ b/tools/testing/selftests/net/srv6_end_flavors_test.sh
> > @@ -645,6 +645,12 @@ setup()
> >  	setup_rt_local_sids 3 "1 2 4"
> >  	setup_rt_local_sids 4 "1 2 3"
> >  
> > +	# testing environment was set up successfully
> > +	SETUP_ERR=0
> > +}
> > +
> > +setup_end_flv_psp()
> > +{
> >  	# set up SRv6 policies
> >  	# create a connection between hosts hs-1 and hs-2.
> >  	# The path between hs-1 and hs-2 traverses SRv6 aware routers.
> 
> [ ... ]
> 
> >  	#  - rt-1 (SRv6 End flavor PSP with SL=1)
> >  	setup_rt_policy_ipv6 2 1 "3:noflv 4:psp 2:psp"
> >  	setup_rt_policy_ipv6 1 2 "1:psp"
> > -
> > -	# testing environment was set up successfully
> > -	SETUP_ERR=0
> >  }
> 
> [Severity: Low]
> The commit message says the split lets "each PSP test case can setup and
> later cleanup independently", but this commit only adds the setup half.
> setup_end_flv_psp() installs the localsid seg6local routes, the cafe::<dst>
> H.Insert route and the proxy NDP entries through __setup_rt_policy(), and
> nothing releases them except the global EXIT trap cleanup(), which just
> does:
> 
> 	for i in ${ROUTERS}; do
> 		nsname="$(get_rtname "${i}")"
> 		ip netns del "${nsname}" &>/dev/null || true
> 	done
> 
> Would it make sense to mention in the commit message that the matching
> cleanup_end_flv_psp() arrives in the following patch ("selftest: seg6: add
> explicit cleanup for SRv6 End PSP test")? As it stands the description
> promises a teardown path that does not exist yet at this commit. There is no
> functional problem here, since the two PSP policies are the only flavor
> state installed and netns deletion reclaims everything.
> 
> >  
> >  check_rt_connectivity()
> > @@ -758,7 +761,13 @@ host2gateway_tests()
> >  
> >  host_srv6_end_flv_psp_tests()
> >  {
> > -	log_section "SRv6 connectivity test hosts (h1 <-> h2, PSP flavor)"
> > +	set -e
> > +	SETUP_ERR=1
> > +	setup_end_flv_psp
> > +	SETUP_ERR=0
> > +	set +e
> 
> [Severity: Low]
> Can re-arming SETUP_ERR here turn already-recorded failures into a skip?
> 
> By the time host_srv6_end_flv_psp_tests() runs, router_tests() and
> host2gateway_tests() have already executed and may have set ret=1 and
> incremented nfail:
> 
> 	setup
> 	set +e
> 
> 	router_tests
> 	host2gateway_tests
> 	host_srv6_end_flv_psp_tests
> 
> 	print_log_test_results
> 
> If any ip command inside setup_end_flv_psp() fails, for example the
> "encap seg6local action End flavors psp" route add, errexit aborts the
> script while SETUP_ERR is still 1, and the EXIT trap takes this path in
> cleanup():
> 
> 	if [ "${SETUP_ERR}" -ne 0 ]; then
> 		echo "SKIP: Setting up the testing environment failed"
> 		exit "${ksft_skip}"
> 	fi
> 
> 	exit "${ret}"
> 
> so the script exits 4 (skip) instead of reaching exit ${ret} with ret=1, and
> print_log_test_results is never reached, meaning the tests passed/failed
> summary is lost too.
> 
> The final patch of this series ("selftests: seg6: add End.X PSP selftest")
> changes the guard to also require [ "$ret" -ne "$ksft_fail" ], which removes
> the fail-to-skip masking. Could that guard change be moved earlier in the
> series, so the intermediate commits do not carry the masking behaviour?
> 
> > +
> > +	log_section "SRv6 connectivity test hosts (h1 <-> h2, End flavor PSP)"
> >  
> >  	check_and_log_hs_connectivity 1 2
> >  	check_and_log_hs_connectivity 2 1
> 
> -- 
> Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260922-srv6_flavors_endx-v1-0-4d01c05c47b7%40kylinos.cn
