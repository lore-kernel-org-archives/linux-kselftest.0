Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=160.80.4.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795574274;
	b=yjP8fhEnXF/rnMLmkhUmM++Oj98ayfAcrT72XqH+6LwcQotneAEdVBWyqH+yo4/rHV4g
	 0eEVLv9romkhqFPSfUmy5eLuLq0xCXitI3zP0JKIPmkoSswsLsqoJ/88uWv8w/rs2ONOQ
	 tkZ4W4b5ypfGJaUJLcm2zGjEVfdK4VS0XHPG0raTj/kKB6IK2T65sZOCeOT3AccwRiYEz
	 YqxLd4x8LYFwAOSdEB+RdIf+2PKOMjBQNrb0DrcGpf//BqK6d6s4k8xMNw8qnBXOmkCkh
	 kaZRroJDSzyu+Ng1WRFLp4x4N3RkoosLFHhcrzj8r24Av1DRhpSzxMEiIuWMZyCe9Cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795574274;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:Date:
	 From:To:Cc:Subject:Message-Id:In-Reply-To:References:X-Mailer:
	 Mime-Version:Content-Type:Content-Transfer-Encoding:X-Virus-Scanned:
	 X-Virus-Status;
	bh=yJmvTEU3nNq7h11f5fmJF+pToRotl3L0Q/2BG+vSC7k=;
	b=Y6cHsjZ2SR+MpidPhGMhTUui512GVRojdr4p3BTRFqHPf3W7D8E9CxGnkTsxFS9nKjl6
	 A1dpp/pZMyzdIro7YiKmjLMDF4+yf3bC2wNXCb4fotdqGRBrVUjhtyYf4car+if2GqiuQ
	 i9RRDZ0DOkCMHKfy55OqMjTUCcjVo5YNkqktwd3HKmjvB7CD0Ds1xoPZsU+77t2WK2+xw
	 wM9rEMPM32JyGNGqJShQnHwHU/LjB51xHo7WFXhOcQuNHjL9E+s9+rpuuQL21jkbxF/NL
	 SqLHp8lL4gWdqMxG4X1RfABfeC8GRJpSx4Ohcm2ebd8KdriQkSAVf7xR0qoqyt6YGzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=uniroma2.it;
	spf=pass smtp.mailfrom=uniroma2.it;
	dkim=pass header.d=uniroma2.it header.i=@uniroma2.it header.a=ed25519-sha256 header.s=ed201904 header.b=4HuzLRW2;
	dkim=pass header.d=uniroma2.it header.i=@uniroma2.it header.a=rsa-sha256 header.s=rsa201904 header.b=WhXd40dW;
	arc=none smtp.remote-ip=160.80.4.34
Received: from smtp.uniroma2.it (smtp-2015.uniroma2.it [160.80.4.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0602D606A31E;
	Wed, 25 Nov 2026 02:37:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0602D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniroma2.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniroma2.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass header.d=uniroma2.it header.i=@uniroma2.it header.a=ed25519-sha256 header.s=ed201904 header.b=4HuzLRW2;
	dkim=pass (2048-bit key, unprotected) header.d=uniroma2.it header.i=@uniroma2.it header.a=rsa-sha256 header.s=rsa201904 header.b=WhXd40dW
Received: from smtpauth-2019-1.uniroma2.it (smtpauth.uniroma2.it [160.80.5.46])
	by smtp-2015.uniroma2.it (8.14.4/8.14.4/Debian-8) with ESMTP id 6AP2b0Ge009728;
	Wed, 25 Nov 2026 03:37:05 +0100
Received: from lubuntu-18.04 (unknown [160.80.103.126])
	by smtpauth-2019-1.uniroma2.it (Postfix) with ESMTPSA id C5435120065;
	Wed, 25 Nov 2026 03:36:54 +0100 (CET)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=uniroma2.it;
	s=ed201904; t=1795574215; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yJmvTEU3nNq7h11f5fmJF+pToRotl3L0Q/2BG+vSC7k=;
	b=4HuzLRW2AQeB+oapeQlKxMV/kIGOqYLPt06KM2QzeavXTrWVpEdwfyyESjHt0qDf0t8Pl2
	Rm3zAj/ULfzxvCAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniroma2.it; s=rsa201904;
	t=1795574215; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yJmvTEU3nNq7h11f5fmJF+pToRotl3L0Q/2BG+vSC7k=;
	b=WhXd40dWj6laZ+hVpXYyArqfE79JPmMUyzLqqaum8HP9ucYJQ4dlRUVuhfH/usOG0WVW6h
	JoaoDJIJuepRpi4F2nREmXYWFohvarcDkHBE4azHPPBZnknzUkzUjIvd3rv7NJUtLaX3dQ
	pnkRWQzlJIrC83cMLezr453lzu6dvwS+JwmqYKOPm8jOdJiL+BGrVXK8EgT/hYjgu5zrRU
	oB08Wl1P2oPH8ac3KhXSxH3m8O6+0el+ltfZFdYFNaQNPLC6wpYXP4nqWgzyQQ5t44vb8k
	f+JKhdTnqvi2c4s00Lfu4XdbugqRB70Khfsw6aYxa/+UdG2FMHaBDxnCbm74gQ==
Date: Wed, 25 Nov 2026 03:36:49 +0100
From: Andrea Mayer <andrea.mayer@uniroma2.it>
To: Hangbin Liu <hangbin.liu@linux.dev>
Cc: "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet
 <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni
 <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Shuah Khan
 <shuah@kernel.org>, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        Hangbin Liu <liuhangbin@kylinos.cn>,
        Stefano Salsano <stefano.salsano@uniroma2.it>,
        Justin Iurman
 <justin.iurman@gmail.com>,
        Andrea Mayer <andrea@common-net.org>,
        Andrea
 Mayer <andrea.mayer@uniroma2.it>
Subject: Re: [PATCH net-next v4 5/5] selftests: seg6: add PSP flavor testing
 for SRv6 End.X
Message-Id: <20261125033649.b15d6071421a730269d64735@uniroma2.it>
In-Reply-To: <20261123100908.GA11364@Liu-laptop>
References: <20261119-srv6_flavors_endx-v4-0-284cdb484eee@kylinos.cn>
 <20261119-srv6_flavors_endx-v4-5-284cdb484eee@kylinos.cn>
 <20261123050952.21dc46abdf5fe4fa235bb68d@uniroma2.it>
 <20261123100908.GA11364@Liu-laptop>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.100.0 at smtp-2015
X-Virus-Status: Clean

On Mon, 23 Nov 2026 18:09:08 +0800
Hangbin Liu <hangbin.liu@linux.dev> wrote:

Hi Hangbin,
thanks for going through all the comments.

> On Mon, Nov 23, 2026 at 05:09:52AM +0100, Andrea Mayer wrote:
> > > [snip]
> > > +# Given the description of a router as an input, the function returns its
> > > +# adjacent route id, or 0 if a host adjacent.
> > > +# i.e. input: "1", output: ""
> > > +#      input: "1>2", output: "2"
> > > +#      input: "1>h", output: "0"
> > > +__get_srv6_adjacent_id()
> > > +{
> > > +	local adjacent="${1#*>}"
> > > +
> > > +	[[ "${adjacent}" == "${1}" ]] && return
> > > +	[[ "${adjacent}" == "h" ]] && adjacent=0
> > 
> > Nit, a style preference: I would use if blocks here, as in the rest
> > of the selftest. With cut -s -d'>' -f2, this function could also read
> > the ">" as you already do in __get_srv6_node_id().
> 
> I plan to use
> 
> 	echo "${element}" | cut -s -d'>' -f2 | sed 's/h/0/'

Makes sense to me. A malformed node would be refused first by the regex
check below.

> [snip]
> > 	for node in $(echo "${nodes}" | sed 's/,/ /g'); do
> > 		rt="$(__get_srv6_node_id "${node}")"
> > 		param="$(__get_srv6_param "${act}" "${node}")"
> > 
> > 		case "${act}" in
> > 		"End")
> > 			if [ "${node}" != "${rt}" ]; then
> > 				echo "${element}: End takes no parameter"
> > 				return 1
> > 			fi
> > 			;;
> > 		"End.X")
> > 			if [ -z "${param}" ]; then
> > 				echo "${element}: End.X needs an adjacency"
> > 				return 1
> > 			fi
> > 			;;
> 
> This check seems not enough with error config like "4>2h:psp:End.X".
> Should we limit the param to 0-4?

Good point. My check was for the structure of the element, node by node,
not for a typo like "2h". Catching it widens the scope, and that is fine
with me. Instead of a limit on the param, the check could look at the
syntax of each node, with a regex for each behavior. Just as an idea,
__check_srv6_rtcfg() could keep its first part, up to the NEXT-C-SID
check, and the loop could become:

	local node_re
	...

	case "${act}" in
	"End")
		node_re='^[1-4]$'
		;;
	"End.X")
		node_re='^[1-4]>([1-4]|h)$'
		;;
	*)
		echo "${element}: ${act} is not a behavior"
		return 1
		;;
	esac

	for node in $(echo "${nodes}" | sed 's/,/ /g'); do
		if [[ ! "${node}" =~ ${node_re} ]]; then
			echo "${element}: ${node} is not valid for ${act}"
			return 1
		fi
	done

With cut -f2, "4>2>3" gives "2", as "4>2" does, and a limit on the
param would accept it. The regex refuses it before __get_srv6_node_id()
and __get_srv6_adjacent_id() read it.

A case like "2>2" would still pass, but that is more a check of the
topology than of the syntax. I think the regex is enough for now, but
other ideas are welcome.

> [snip]
> > > [snip]
> > > @@ -1031,6 +1187,25 @@ setup_end_flv_psp()
> > >  	SETUP_ERR=0
> > >  }
> > >  
> > > +setup_endx_flv_psp()
> > > +{
> > > +	SETUP_ERR=1
> > > +
> > > +	setup_hs_lo_addr 1 1 "${ENDX_CSID_PSP_FUNC}"
> > > +	setup_hs_lo_addr 2 2 "${ENDX_CSID_PSP_FUNC}"
> > > +
> > > +	# The same SRv6 policies with setup_end_flv_psp except using End.X
> > > +	setup_rt_policy_ipv6 2 1 "3>4:noflv:End.X 4>2:psp:End.X 2>h:psp:End.X"
> > > +	setup_rt_policy_ipv6 1 2 "1>h:psp:End.X"
> > > +
> > > +	setup_rt_policy_ipv6 "2:${ENDX_CSID_PSP_FUNC}" 1 \
> > > +		"3>4:next-csid,psp:End.X 4>2,2>h:next-csid,psp:End.X"
> > > +	setup_rt_policy_ipv6 "1:${ENDX_CSID_PSP_FUNC}" 2 \
> > > +		"4>3,3>1,1>h:next-csid,psp:End.X"
> > > +
> > > +	SETUP_ERR=0
> > > +}
> > 
> > On v3, Sashiko asked whether the End.X tests would pass with End.X
> > working as End. In this topology, the nh6 of each End.X is also the
> > next hop that a lookup of the new DA gives, and the tests pass in both
> > cases. An unreachable route in table 90 for the next SID, on rt-4 for
> > (i.a) and on rt-3 for (i.c), would make End fail and leave End.X
> > working. This is close to what Sashiko suggested on v3. What do you
> > think about adding these two routes to the End.X scenario, each with
> > its defer?
> 
> Hmm, we add the SIDs with End.X action, and the address also has parameters.
> e.g. for (1.a) we add fcff:4::2af1, which unreachable route should we add
> then? Cause we don't use fcff:2::ef1 at all.
> 
> BTW, is there any reason we add the unreachable route on rt-4 for (i.a) and on
> rt-3 for (i.c)? In the consumed SRH testing, we can only add the extra on
> ingress route. e.g.
> 
> #   (i.a) hs-1 -> hs-2: on the packets with DA=fcff:3::400a, rt-1 inserts the   
> #         extra SRH with SID List=fcff:4::e,fcff:3::400a, and rt-4 consumes
> #         it. 
> #         Path: hs-1 -> rt-1 [ -> rt-4 ] -> rt-3 -> rt-4 -> rt-2 -> hs-2        
> #   (i.c) hs-1 -> hs-2: on the packets with DA=fcbb:0:34a9::, rt-1 inserts the  
> #         extra SRH with SID List=fcff:4::e,fcbb:0:34a9::, and rt-4 consumes
> #         it.
> #         Path: hs-1 -> rt-1 [ -> rt-4 ] -> rt-3 -> rt-4 -> rt-2 -> hs-2  
> 
> Which means we need the end action on rt-4.

I meant the End.X Policies (i.a) and (i.c) themselves, not the consumed
SRH tests. The End on rt-4 that consumes the extra SRH is not affected.
It sets the DA back to the End.X SID of rt-3, fcff:3::400a or
fcbb:0:34a9::, and looks up this SID, while the route on rt-4 is for
fcff:2::0af1.

The idea is to make End fail and leave End.X working. Each route is for
the new DA that an End.X sets, on the router of that End.X. End looks up
this DA, while End.X looks up its nh6. The routes would be:

  (i.a) rt-3, End.X 3>4 without flavors
        [DA fcff:3::400a -> fcff:4::2af1]
        unreachable fcff:4::2af1 in table 90
        End.X: looks up its nh6 fcf0:0:3:4::4 -> rt-4         OK
        End:   looks up the DA fcff:4::2af1   -> unreachable  FAIL

  (i.a) rt-4, End.X 4>2 with PSP
        [DA fcff:4::2af1 -> fcff:2::0af1]
        unreachable fcff:2::0af1 in table 90
        End.X: looks up its nh6 fcf0:0:2:4::2 -> rt-2         OK
        End:   looks up the DA fcff:2::0af1   -> unreachable  FAIL

  (i.c) rt-3, End.X 3>4 with NEXT-C-SID and PSP
        [DA fcbb:0:34a9:: -> fcbb:0:42a9:20a9::]
        unreachable fcbb:0:42a9:20a9:: in table 90
        End.X: looks up its nh6 fcf0:0:3:4::4     -> rt-4         OK
        End:   looks up the DA fcbb:0:42a9:20a9:: -> unreachable  FAIL

Without the routes, from what I can see, End would reach the same router
through the underlay, and the tests would pass in both cases. The route
on rt-3 for (i.a) is the idea of your other mails, with an exact route
in place of the /32. My other reply explains why. The three routes could
go in setup_endx_flv_psp(), each with its defer.

> > > [snip]
> > >  test_kernel_supp_or_ksft_skip()
> > > [snip]
> > >  	if ! ip -netns "${test_netns}" -6 route \
> > >  		add "${IPv6_TESTS_ADDR}" encap seg6local \
> > > -		action End flavors "${flavor}" dev "${DUMMY_DEVNAME}"; then
> > > -		echo "SKIP: ${flavor} flavor not supported in kernel"
> > > +		"${policy[@]}" dev "${DUMMY_DEVNAME}"; then
> > > +		echo "SKIP: ${action} flavor ${flavor} not supported in kernel"
> > 
> > A note on this probe. On older kernels this add can succeed without
> > the flavor, and the tests then fail instead of being skipped. This
> > happens with End.X on v6.5, and with End on v6.0. I was thinking of
> > sending a separate patch that reads the route back, for the End and
> > the End.X probe. There is no need to wait for it. Does it work for
> > you?
> 
> OK, I will add a checking for the added route.

OK, thanks.

> > > [snip]
> > > +if test_kernel_supp_or_ksft_skip End.X psp; then
> > > +	test_endx_flv
> > > +fi
> > 
> > When the probe finds no End.X PSP, the End.X tests do not show up in
> > the summary. The v4 skips only that scenario, as suggested on v3,
> > which is good. On my patch that added the consumed SRH tests, you
> > suggested to return at once when the srh match is missing. I kept the
> > check in each test because log_test_skipped() then logs each test and
> > counts it in "Tests skipped". IMHO the End.X scenario could do the
> > same, to be consistent. Does it sound reasonable to you?
> 
> Sorry, I didn't get what you mean here. Do you want to run
> the check before each end.x testing and report skip one by one?
> 
> e.g.
> 
> 	if test_kernel_supp_or_ksft_skip End.X psp; then
>         	host_srv6_end_flv_psp_tests "End.X"
> 	else
> 		echo "SKIP..."
> 	fi
> 
> 	if test_kernel_supp_or_ksft_skip End.X psp; then
> 	        host_srv6_end_flv_next_csid_psp_tests "End.X"
> 	else
> 		echo "SKIP..."
> 	fi
> 
> 	if test_kernel_supp_or_ksft_skip End.X psp; then
> 	        host_srv6_endx_flv_consumed_srh_tests
> 	else
> 		echo "SKIP..."
> 	fi

Sorry, my comment was not clear. The probe would still run only once.
Looking at it again, for the End.X tests one skip for the whole scenario
fits better. Without the srh match, only the consumed SRH tests are
skipped, and check_and_log_consumed_srh() already skips each one.
Without End.X PSP, the End.X scenario cannot pass, because each End.X
Policy has End.X SIDs with PSP. A skip for each test would need more
code (such as a flag in the helpers that the End tests use too).

The v4 already skips only that scenario, as suggested on v3, but an echo
"SKIP..." is not counted in "Tests skipped". log_test_skipped() counts
the skip and prints a [SKIP] line with the name of the scenario.

To avoid the exits after the trap that Sashiko reports, the End.X probe
could run next to the End probe, before "trap cleanup EXIT", in a
function like check_srh_match_support(), for example:

	HAS_ENDX_PSP=false

	check_endx_psp_support()
	{
		if test_kernel_supp_or_ksft_skip End.X psp; then
			HAS_ENDX_PSP=true
		fi
	}

	test_kernel_supp_or_ksft_skip End psp
	check_endx_psp_support
	check_srh_match_support

test_endx_flv() can then skip the scenario with one log_test_skipped(),
for example:

	test_endx_flv()
	{
		if ! ${HAS_ENDX_PSP}; then
			log_section "SRv6 connectivity test hosts (h1 <-> h2, End.X)"
			log_test_skipped "SRv6 End.X tests, no End.X PSP in the kernel"
			return
		fi

		defer_scope_push
		...
	}

What do you think?

Thanks,
Andrea
