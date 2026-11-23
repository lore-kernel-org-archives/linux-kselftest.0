Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.159
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795428561;
	b=1M4WyjF9vl0yvppxurkKi7/1TWeAFYUQr4Y6xkCvSJP12K/BXh2K2UCtqEZ6wJHqdew6
	 TDgoU/paKCKMgiq/Yf9xcoRpHWdKVcqhl819rCW3Lq6yJ/QXnOf9hHtZwj/0bCpfQ4GmT
	 WfMAZU6PrjayGnpf+EamHsWvmH+pLgU8En1s+nQr+m1DDmA6Z9W4UWLTe6IlR5zq6H2ZD
	 0+B5tQzxiIW+ECVVMciPXHMf3V0o4LhS3ygopUSFpDK5O15qovpagxYhALIIfEfpOjhQz
	 /8bU+AwxkBnX5UmXHP+iVZ4nhJVxI/y22KiWfZWSvCfXfMuux7IYFFUqMI5d5mpK8lA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795428561;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=UzDd0SmU9JGmt2OnzA2QPSIsnM/OhlSQ1LdpomQPeVc=;
	b=LiR+uqbAsRscJt792CU1MY0Uko8YjcoZW1iO6A2Cra509DHWA5CIMZN9oGQpj8rEgG7I
	 k6cl+HQkfMmPKkwuVgYHyP/QrbtsMo58He0fJJWebRuTboQdcN3yo6NErC8ZLVwnl3uTa
	 ktdVjagVylUENsNzlEqbbnU0EWjQC/NFdq7UBSgLqnqrWiS9aJsHjiLnNeA0/ExH0BEi9
	 60kGtlXfMMJeEXqFUdfhrtaavX+XL0TITrTSXkcGdDOOuKxv+gbaqIsMVvJACt7Jd3Xsl
	 EpFAgYZhYzKXizTtgl4MCHbJMwifJKFvpD1j0VNYU/JcVZ5IrEUAhBiyh+S6TixAw9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=euJdA8EB;
	arc=none smtp.remote-ip=91.218.175.159
Received: from mta0.migadu.com (out-159.mta0.migadu.com [91.218.175.159])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD760606A31F
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 10:09:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD760606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=euJdA8EB
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=GRIGe4MYSmcamc/GomLgN/fYZ1+yWn5x99Cm2Hh0m+E=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795428557; v=1; x=1796033357;
 b=euJdA8EBP4mOaNaki4eFa/6T3fp6J77vej0S8q4+PFeFckVlaATHyoLSCcWVaWdqTJJBh7Hw
 D/RDs7PoFiGRh0TsHq5NF40pzKOtQKy5BG3w4kLtF+FbSIYTns0Jd1P0IVcuFOPNmNEVfze7csX
 64BRkMRElTCPc025BYOs9n5U=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 7fd23bef945703c4;
	Mon, 23 Nov 2026 10:09:17 +0000
X-Mizu-Trace-ID: 7fd23bef945703c4
X-Migadu-Flow: FLOW_OUT
Date: Mon, 23 Nov 2026 18:09:08 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Andrea Mayer <andrea.mayer@uniroma2.it>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Hangbin Liu <liuhangbin@kylinos.cn>,
	Stefano Salsano <stefano.salsano@uniroma2.it>,
	Justin Iurman <justin.iurman@gmail.com>,
	Andrea Mayer <andrea@common-net.org>
Subject: Re: [PATCH net-next v4 5/5] selftests: seg6: add PSP flavor testing
 for SRv6 End.X
Message-ID: <20261123100908.GA11364@Liu-laptop>
References: <20261119-srv6_flavors_endx-v4-0-284cdb484eee@kylinos.cn>
 <20261119-srv6_flavors_endx-v4-5-284cdb484eee@kylinos.cn>
 <20261123050952.21dc46abdf5fe4fa235bb68d@uniroma2.it>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123050952.21dc46abdf5fe4fa235bb68d@uniroma2.it>

Hi Andrea,

Thanks a lot for you detailed review. I will fix all of them in next version.
I just have some questions about a few comments.

On Mon, Nov 23, 2026 at 05:09:52AM +0100, Andrea Mayer wrote:
> > [snip]
> > +# Given the description of a router as an input, the function returns its
> > +# adjacent route id, or 0 if a host adjacent.
> > +# i.e. input: "1", output: ""
> > +#      input: "1>2", output: "2"
> > +#      input: "1>h", output: "0"
> > +__get_srv6_adjacent_id()
> > +{
> > +	local adjacent="${1#*>}"
> > +
> > +	[[ "${adjacent}" == "${1}" ]] && return
> > +	[[ "${adjacent}" == "h" ]] && adjacent=0
> 
> Nit, a style preference: I would use if blocks here, as in the rest
> of the selftest. With cut -s -d'>' -f2, this function could also read
> the ">" as you already do in __get_srv6_node_id().

I plan to use

	echo "${element}" | cut -s -d'>' -f2 | sed 's/h/0/'

> 
> > [snip]
> > @@ -819,33 +964,44 @@ __setup_rt_policy()
> >  	local function
> >  	local op_type
> >  	local node
> > +	local act
> > +	local sid
> >  	local n
> >  
> >  	in_nsname="$(get_rtname "${encap_rt}")"
> >  
> >  	for n in ${policy_rts}; do
> > +		# Abort if policy format is incorrect:
> > +		# 1. "1>h:psp" that has ">" but not "End.X"
> > +		# 2. "1:psp:End.X" that has "End.X" but no ">"
> > +		if [[ "${n}" == *">"* && "${n}" != *"End.X"* ]] || \
> > +			[[ "${n}" != *">"* && "${n}" == *"End.X"* ]]; then
> > +			echo "Incorrect operation format: ${n}" && false
> > +		fi
> 
> The check is there, but ret is not set. With "1>h:psp", the End tests
> pass and then the run ends as SKIP:
> 
>     Incorrect operation format: 1>h:psp
>     SKIP: Setting up the testing environment failed
> 
> Could it set ret to ksft_fail? Also, the check looks at the element as
> a whole, while the parameter and the nh6 are computed for each node.
> For example, "4>2,2:next-csid,psp:End.X" passes it although the node
> "2" has no adjacency, and the setup then fails in ip, on the nh6. A
> function that checks each node, called in place of this check, would
> cover both:
> 
> 	if ! __check_srv6_rtcfg "${n}"; then
> 		ret="${ksft_fail}"
> 		return 1
> 	fi
> 
> It would take the nodes and the behavior from the parsers that
> __setup_rt_policy() already uses, not from the text of the element.
> Just as an idea, something like this in __check_srv6_rtcfg():
> 
> 	nodes="$(__get_srv6_rtcfg_id "${element}")"
> 	op_type="$(__get_srv6_rtcfg_op "${element}")"
> 	act="$(__get_srv6_rtcfg_act "${element}")"
> 
> 	if ! op_has_next_csid "${op_type}" && \
> 	   echo "${nodes}" | grep -q ","; then
> 		echo "${element}: only NEXT-C-SID takes more than one node"
> 		return 1
> 	fi
> 
> 	for node in $(echo "${nodes}" | sed 's/,/ /g'); do
> 		rt="$(__get_srv6_node_id "${node}")"
> 		param="$(__get_srv6_param "${act}" "${node}")"
> 
> 		case "${act}" in
> 		"End")
> 			if [ "${node}" != "${rt}" ]; then
> 				echo "${element}: End takes no parameter"
> 				return 1
> 			fi
> 			;;
> 		"End.X")
> 			if [ -z "${param}" ]; then
> 				echo "${element}: End.X needs an adjacency"
> 				return 1
> 			fi
> 			;;

This check seems not enough with error config like "4>2h:psp:End.X".
Should we limit the param to 0-4?

> 		esac
> 	done
> 
> IMO a case per behavior would also make End.T easier to add, both for
> the flavor core that your 1/5 mentions for End.X/T and for NEXT-C-SID,
> which I am working on.
> 
> > [snip]
> > @@ -1031,6 +1187,25 @@ setup_end_flv_psp()
> >  	SETUP_ERR=0
> >  }
> >  
> > +setup_endx_flv_psp()
> > +{
> > +	SETUP_ERR=1
> > +
> > +	setup_hs_lo_addr 1 1 "${ENDX_CSID_PSP_FUNC}"
> > +	setup_hs_lo_addr 2 2 "${ENDX_CSID_PSP_FUNC}"
> > +
> > +	# The same SRv6 policies with setup_end_flv_psp except using End.X
> > +	setup_rt_policy_ipv6 2 1 "3>4:noflv:End.X 4>2:psp:End.X 2>h:psp:End.X"
> > +	setup_rt_policy_ipv6 1 2 "1>h:psp:End.X"
> > +
> > +	setup_rt_policy_ipv6 "2:${ENDX_CSID_PSP_FUNC}" 1 \
> > +		"3>4:next-csid,psp:End.X 4>2,2>h:next-csid,psp:End.X"
> > +	setup_rt_policy_ipv6 "1:${ENDX_CSID_PSP_FUNC}" 2 \
> > +		"4>3,3>1,1>h:next-csid,psp:End.X"
> > +
> > +	SETUP_ERR=0
> > +}
> 
> On v3, Sashiko asked whether the End.X tests would pass with End.X
> working as End. In this topology, the nh6 of each End.X is also the
> next hop that a lookup of the new DA gives, and the tests pass in both
> cases. An unreachable route in table 90 for the next SID, on rt-4 for
> (i.a) and on rt-3 for (i.c), would make End fail and leave End.X
> working. This is close to what Sashiko suggested on v3. What do you
> think about adding these two routes to the End.X scenario, each with
> its defer?

Hmm, we add the SIDs with End.X action, and the address also has parameters.
e.g. for (1.a) we add fcff:4::2af1, which unreachable route should we add
then? Cause we don't use fcff:2::ef1 at all.

BTW, is there any reason we add the unreachable route on rt-4 for (i.a) and on
rt-3 for (i.c)? In the consumed SRH testing, we can only add the extra on
ingress route. e.g.

#   (i.a) hs-1 -> hs-2: on the packets with DA=fcff:3::400a, rt-1 inserts the   
#         extra SRH with SID List=fcff:4::e,fcff:3::400a, and rt-4 consumes
#         it. 
#         Path: hs-1 -> rt-1 [ -> rt-4 ] -> rt-3 -> rt-4 -> rt-2 -> hs-2        
#   (i.c) hs-1 -> hs-2: on the packets with DA=fcbb:0:34a9::, rt-1 inserts the  
#         extra SRH with SID List=fcff:4::e,fcbb:0:34a9::, and rt-4 consumes
#         it.
#         Path: hs-1 -> rt-1 [ -> rt-4 ] -> rt-3 -> rt-4 -> rt-2 -> hs-2  

Which means we need the end action on rt-4.

> 
> > [snip]
> >  test_kernel_supp_or_ksft_skip()
> > [snip]
> >  	if ! ip -netns "${test_netns}" -6 route \
> >  		add "${IPv6_TESTS_ADDR}" encap seg6local \
> > -		action End flavors "${flavor}" dev "${DUMMY_DEVNAME}"; then
> > -		echo "SKIP: ${flavor} flavor not supported in kernel"
> > +		"${policy[@]}" dev "${DUMMY_DEVNAME}"; then
> > +		echo "SKIP: ${action} flavor ${flavor} not supported in kernel"
> 
> A note on this probe. On older kernels this add can succeed without
> the flavor, and the tests then fail instead of being skipped. This
> happens with End.X on v6.5, and with End on v6.0. I was thinking of
> sending a separate patch that reads the route back, for the End and
> the End.X probe. There is no need to wait for it. Does it work for
> you?

OK, I will add a checking for the added route.

> 
> > [snip]
> > +if test_kernel_supp_or_ksft_skip End.X psp; then
> > +	test_endx_flv
> > +fi
> 
> When the probe finds no End.X PSP, the End.X tests do not show up in
> the summary. The v4 skips only that scenario, as suggested on v3,
> which is good. On my patch that added the consumed SRH tests, you
> suggested to return at once when the srh match is missing. I kept the
> check in each test because log_test_skipped() then logs each test and
> counts it in "Tests skipped". IMHO the End.X scenario could do the
> same, to be consistent. Does it sound reasonable to you?

Sorry, I didn't get what you mean here. Do you want to run
the check before each end.x testing and report skip one by one?

e.g.

	if test_kernel_supp_or_ksft_skip End.X psp; then
        	host_srv6_end_flv_psp_tests "End.X"
	else
		echo "SKIP..."
	fi

	if test_kernel_supp_or_ksft_skip End.X psp; then
	        host_srv6_end_flv_next_csid_psp_tests "End.X"
	else
		echo "SKIP..."
	fi

	if test_kernel_supp_or_ksft_skip End.X psp; then
	        host_srv6_endx_flv_consumed_srh_tests
	else
		echo "SKIP..."
	fi

Thanks
Hangbin
