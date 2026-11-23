Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=160.80.4.36
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795407052;
	b=S7z6ln4Wd4wvCwauDMXx7uAVBTHKEPJ7gdy3t3uf7U40ofJWnIBg9gKhwWypzxOg6P/T
	 kR/WmMZPKyDqeMV7SRA/PR1lCgNRMPlcuSbClyv/CTomn/Y31CmtioOTpllWS6yDtRwlc
	 rlO/DE+cdTUpUsa1M5gJDKaEWF9lveQUPw9qEtReP1YsbwaJghkwR2aCkKesP7KW16PUK
	 SLZ5jD6kqQXJi21AVoJpkP+HSQaRZUHVieQlWvhKZBnxhqgmMRrewxxjz5FY0Gw7XIywY
	 0xx/MGlqwbXP6dNEHfsbAIGtUhdjgrwUPy1jkLGGGpB4Ehrl3/56L7dpHHn8bMVajCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795407052;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:Date:
	 From:To:Cc:Subject:Message-Id:In-Reply-To:References:X-Mailer:
	 Mime-Version:Content-Type:Content-Transfer-Encoding:X-Virus-Scanned:
	 X-Virus-Status;
	bh=UOH2L6eiOSDIHhDCl0q0Cf4GPweTeH+Wgsj2Qgs3tLg=;
	b=vd9gCFyGRU0J7GpEqkJQetnNsps/saUmgMrXZnCgtQhHeSh3QeUOexoBgtIwFpjPU12v
	 lQhktDAjO3N5Z7s7UASZeuxvYuNTdPvDvsdRvdI9i/QGmB5vwDWDeYwb0kImJ0aYnx/Hg
	 0lk2idzMv+vJnLb2yBgG+UEhHVbZRr4UJOr9jfcz6oX1Qw+Lr52dXcLco33lQhMYBnQoM
	 wWzTeYE2LvW88punIm3w1SGCTtBn+QiSNoh4LU2Q8nzIHAfmIRwWxx/Kk+jtRe2XhSt2E
	 KJB1BX7YqfVsvKg4Q7LzczmZ/9M3E7lONZKwlZs3vdysErL3u5hZ9uqkhdPkLnkCWUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=uniroma2.it;
	spf=pass smtp.mailfrom=uniroma2.it;
	dkim=pass header.d=uniroma2.it header.i=@uniroma2.it header.a=ed25519-sha256 header.s=ed201904 header.b=MImwC5ff;
	dkim=pass header.d=uniroma2.it header.i=@uniroma2.it header.a=rsa-sha256 header.s=rsa201904 header.b=kDwFVIhK;
	arc=none smtp.remote-ip=160.80.4.36
Received: from smtp.uniroma2.it (smtp-2015.uniroma2.it [160.80.4.36])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCE1A606A31A;
	Mon, 23 Nov 2026 04:10:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCE1A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniroma2.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniroma2.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass header.d=uniroma2.it header.i=@uniroma2.it header.a=ed25519-sha256 header.s=ed201904 header.b=MImwC5ff;
	dkim=pass (2048-bit key, unprotected) header.d=uniroma2.it header.i=@uniroma2.it header.a=rsa-sha256 header.s=rsa201904 header.b=kDwFVIhK
Received: from smtpauth-2019-1.uniroma2.it (smtpauth-2019-1.uniroma2.it [160.80.5.46])
	by smtp-2015.uniroma2.it (8.14.4/8.14.4/Debian-8) with ESMTP id 6AN4A3J0009411;
	Mon, 23 Nov 2026 05:10:08 +0100
Received: from lubuntu-18.04 (unknown [160.80.103.126])
	by smtpauth-2019-1.uniroma2.it (Postfix) with ESMTPSA id 40395120628;
	Mon, 23 Nov 2026 05:09:58 +0100 (CET)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=uniroma2.it;
	s=ed201904; t=1795406999; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UOH2L6eiOSDIHhDCl0q0Cf4GPweTeH+Wgsj2Qgs3tLg=;
	b=MImwC5ff4RhTrfFtZRQJ5eIU/YjA2sg9fhvMPVJ95gE6/vXkt2NmIkwIIqx6HGasMjbHiy
	t5RlPKyEg2bBuFBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniroma2.it; s=rsa201904;
	t=1795406999; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UOH2L6eiOSDIHhDCl0q0Cf4GPweTeH+Wgsj2Qgs3tLg=;
	b=kDwFVIhKfJdXbOxbnq1zqexSBbijigLXETbYtzTDAzVC0HKjI4X8uBBULjLrJjfMOxEc3e
	HaT1gqc2ivnwW4FjOoqmVsifUK4i5n7L8mSEXmudZQM6RRWA88NCdIb7hGoLJpxc5iMbSi
	0x3jwAWXT86vqodXuMS75zBt0EHvz+8kOP9wsgIeBs9SCNEUfOdK49VoB30dHHLta2MWeB
	ZlnfIVojo4Kgcv3Ko4lWQU3ShRxWUnyJGAwv2Llrp3taiEZnAEBb5AXgAOSYwdwpUlMoLA
	X0XQ7OJRAA+oQIjrw0vp0cjTQ/1oU4nwu4O+RNT9yXIZDDZ/l4i2l/Y8RjADcQ==
Date: Mon, 23 Nov 2026 05:09:52 +0100
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
Message-Id: <20261123050952.21dc46abdf5fe4fa235bb68d@uniroma2.it>
In-Reply-To: <20261119-srv6_flavors_endx-v4-5-284cdb484eee@kylinos.cn>
References: <20261119-srv6_flavors_endx-v4-0-284cdb484eee@kylinos.cn>
 <20261119-srv6_flavors_endx-v4-5-284cdb484eee@kylinos.cn>
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

On Thu, 19 Nov 2026 21:55:21 +0800
Hangbin Liu <hangbin.liu@linux.dev> wrote:

Hi Hangbin,
thanks for the v4. I really appreciate your work on the v3 comments.

> Add an End.X flavor scenario to srv6_end_flavors_test.sh that applies
> the same PSP policies as the End scenario, alone and combined with
> NEXT-C-SID, with every node bound through its adjacency (e.g. 4>2 for
> rt-4 towards rt-2, 2>h towards the host).
>
> Teach the policy helpers about <nodeid:op:act> elements:
>   - __get_srv6_node/adjacent_id return the node and adjacent id
>   - __get_srv6_rtcfg_act() extracts the action
>   - __get_srv6_act_cfg() derives the End.X next hop
>   - __get_func() picks the correct function
>   - build_csid()/get_rt_sid() encode the adjacency into the C-SIDs
>     (e.g. fcbb:0:34a9:: is End.X on rt-3 towards rt-4).

Nit: the adjacency also goes into the SIDs without NEXT-C-SID, e.g.
fcff:3::400a, not only into the C-SIDs.

>
> Reuse the existing psp and next-csid,psp helpers, and add a new
> consumed-SRH test that inserts the extra SRH on the ingress router,
> since the End.X policy forces the next hop.
>
> Extend test_kernel_supp_or_ksft_skip() to check kernel support for
> End.X psp, iproute2 already supports the PSP flavor with End.X.
>
> Add the packet path to each test section so the route taken by the
> traffic is clear.
>
> Signed-off-by: Hangbin Liu <liuhangbin@kylinos.cn>
> [snip]
> diff --git a/tools/testing/selftests/net/srv6_end_flavors_test.sh b/tools/testing/selftests/net/srv6_end_flavors_test.sh
> index 9d6b7de648da..d7fdc4e19da9 100755
> --- a/tools/testing/selftests/net/srv6_end_flavors_test.sh
> +++ b/tools/testing/selftests/net/srv6_end_flavors_test.sh
> [snip]
> +#      input: "1,2:psp", output: "1,2"
> +#      input: "1>2:psp", output: "1>2"
> +#      input: "1>2,2>3:psp:End.", output: "1>2,2>3"
>  __get_srv6_rtcfg_id()

Typo: "End.". A list of nodes is also only for next-csid, which builds
a C-SID container, and ">" only for End.X. "1,2:psp" above needs
next-csid, and "1>2:psp" needs End.X. The last one could be e.g.
"1>2,2>3:next-csid,psp:End.X".

> [snip]
> +# Given the description of a router as an input, the function returns its
> +# id with the ">" and the adjacent route id dropped.
> +# i.e. input: "1", output: "1"
> +#      input: "1>2", output: "1"
> +__get_srv6_node_id()

"router" I think, here, in "adjacent route id" of
__get_srv6_adjacent_id() below, and in "current route" of
__get_srv6_act_cfg().

> [snip]
> +# Given the description of a router as an input, the function returns its
> +# adjacent route id, or 0 if a host adjacent.
> +# i.e. input: "1", output: ""
> +#      input: "1>2", output: "2"
> +#      input: "1>h", output: "0"
> +__get_srv6_adjacent_id()
> +{
> +	local adjacent="${1#*>}"
> +
> +	[[ "${adjacent}" == "${1}" ]] && return
> +	[[ "${adjacent}" == "h" ]] && adjacent=0

Nit, a style preference: I would use if blocks here, as in the rest
of the selftest. With cut -s -d'>' -f2, this function could also read
the ">" as you already do in __get_srv6_node_id().

> [snip]
>  # Return the C-SID of a router: the Locator-Node (4 bits), i.e. the ID of the
> -# router, followed by the parameter of the behavior (4 bits, 0) and the
> -# Function (8 bits).
> +# router, followed by the parameter of the behavior (the adjacent router for
> +# End.X, and 0 for End and towards the host, 4 bits) and the Function (8 bits).
>  # args:
> -#  $1 - router
> +#  $1 - router with or without adjacent router (e.g. "4", "4>2")
>  #  $2 - Function (e.g. "e9")
> -# e.g. input: "4" "e9"
> -#      output: "40e9"
> +# e.g. input: "4" "e9", output: "40e9"
> +#      input: "4>2" "a9", output: "42a9"
>  build_csid()
>  {
>  	local nodeid="$1"
>  	local func="$2"
> +	local node
> +	local adj
>  
> -	printf "${LCNODE_FMT}%s" "${nodeid}" "${func}"
> +	node="$(__get_srv6_node_id "${nodeid}")"
> +	adj="$(__get_srv6_adjacent_id "${nodeid}")"
> +	adj=${adj:-0}
> +	printf "%s%s%s" "${node}" "${adj}" "${func}"
>  }

The comment says the parameter is the adjacent router for End.X and 0
for End, but build_csid() takes it from the ">", not from the
behavior. "4>2" with e9, an End Function, gives 42e9, as in the second
example of build_csid_container() below. To avoid this, the callers of
build_csid() could set the parameter from the behavior, as suggested
on v3. One new helper could return it for each behavior and node. Just
as an idea, something like this in a __get_srv6_param() that takes the
behavior and the node:

	# End: 0, End.X: the adjacent router (0 for the host)
	case "${act}" in
	"End.X")
		__get_srv6_adjacent_id "${node}"
		;;
	*)
		echo 0
		;;
	esac

build_csid() would then only print the three parts it gets. Its
callers, given the behavior, would do for a node:

	rt="$(__get_srv6_node_id "${node}")"
	param="$(__get_srv6_param "${act}" "${node}")"
	csid="$(build_csid "${rt}" "${param}" "${func}")"

setup_rt_local_sids() also calls build_csid(), for the underlay routes,
with no behavior. It would pass the 0 itself, e.g. build_csid
"${neigh}" 0 00.

This way, as suggested on v3, the nodes would be read in one place.
Only __get_srv6_node_id() and __get_srv6_adjacent_id() would read the
">", and the behavior would decide the rest. Today get_rt_sid() and
the check in __setup_rt_policy() read the ">" too, and decide from it.

> [snip]
> @@ -584,8 +710,8 @@ build_csid()
>  # args:
>  #  $1 - <nodeid> of the element: a comma-separated list of routers
>  #  $2 - Function (e.g. "e9")
> -# e.g. input: "4,2" "e9"
> -#      output: "fcbb:0:40e9:20e9::"
> +# e.g. input: "4,2" "e9", output: "fcbb:0:40e9:20e9::"
> +#      input: "4>2,2>1" "e9", output: "fcbb:0:42e9:21e9::"
>  build_csid_container()

The second example gives End (e9) a parameter, which End does not
have. An End.X example would fit in its place, e.g. "4>2,2>h" with
a9, giving fcbb:0:42a9:20a9::.

> [snip]
>  #  $1 - router
>  #  $2 - operation <op> of the element (e.g. "next-csid,psp")
>  #  $3 - Function (e.g. "0ef1", or "e9" with NEXT-C-SID)
> -# e.g. input: "4" "psp" "0ef1"
> -#      output: "fcff:4::0ef1"
> -#      input: "4" "next-csid,psp" "e9"
> -#      output: "fcbb:0:40e9::/48"
> +# e.g. input: "4" "noflv" "e", output: "fcff:4::e"
> +#      input: "4>2" "noflv" "a", output: "fcff:4::2a"
> +#      input: "4" "psp" "0ef1", output: "fcff:4::0ef1"
> +#      input: "4>2" "psp" "af1", output: "fcff:4::2af1"
> +#      input: "4" "next-csid,psp" "e9", output: "fcbb:0:40e9::/48"
> +#      input: "4>2" "next-csid,psp" "a9", output: "fcbb:0:42a9::/48"

The comment still says "$1 - router", but $1 can also have an
adjacency here, as in "4>2". The two noflv examples use "e" and "a",
while the script passes 000e and 00a, and "3>4" with 00a gives
fcff:3::400a.

>  get_rt_sid()
>  {
>  	local rt="$1"
>  	local op_type="$2"
>  	local func="$3"
>  	local csid
> +	local node
> +	local adj
>  
>  	if op_has_next_csid "${op_type}"; then
>  		csid="$(build_csid "${rt}" "${func}")"
>  		echo "${LCBLOCK_ADDR}:${csid}::/${LCBLOCK_NODEFUNC_BLEN}"
> -		return
> +	elif echo "${rt}" | grep -q ">"; then
> +		node="$(__get_srv6_node_id "${rt}")"
> +		adj="$(__get_srv6_adjacent_id "${rt}")"
> +		echo "${LOCATOR_SERVICE}:${node}::${adj}${func}"
> +	else
> +		echo "${LOCATOR_SERVICE}:${rt}::${func}"
>  	fi

Without NEXT-C-SID, get_rt_sid() could also take the behavior, and
drop the grep on ">". With a case on the behavior, End would keep its
SIDs as they are, e.g. fcff:3::e, and End.X would put the parameter in
front of its Function, e.g. fcff:3::400a.

> [snip]
> @@ -771,24 +904,33 @@ setup_rt_endpoint()
>  # args:
>  #  $1 - <nodeid> of the element: one router, or a comma-separated list
>  #  $2 - operation <op> of the element (e.g. "next-csid,psp")
> -#  $3 - Function (e.g. "0ef1", or "e9" with NEXT-C-SID)
> -#  $4 - SRv6 Endpoint behavior and flavors (e.g. "End flavors psp")
> -# e.g. input: "4,2" "next-csid,psp" "e9"
> -#             "End flavors next-csid,psp lblen 32 nflen 16"
> +#  $3 - <act> of the element (e.g. "End" or "End.X")
> [snip]
>  setup_rt_endpoints()

The first line of this comment, just above the hunk, still says "each
router of a Policy element <nodeid:op>", while the element is now
<nodeid:op:act>.

> [snip]
> @@ -819,33 +964,44 @@ __setup_rt_policy()
>  	local function
>  	local op_type
>  	local node
> +	local act
> +	local sid
>  	local n
>  
>  	in_nsname="$(get_rtname "${encap_rt}")"
>  
>  	for n in ${policy_rts}; do
> +		# Abort if policy format is incorrect:
> +		# 1. "1>h:psp" that has ">" but not "End.X"
> +		# 2. "1:psp:End.X" that has "End.X" but no ">"
> +		if [[ "${n}" == *">"* && "${n}" != *"End.X"* ]] || \
> +			[[ "${n}" != *">"* && "${n}" == *"End.X"* ]]; then
> +			echo "Incorrect operation format: ${n}" && false
> +		fi

The check is there, but ret is not set. With "1>h:psp", the End tests
pass and then the run ends as SKIP:

    Incorrect operation format: 1>h:psp
    SKIP: Setting up the testing environment failed

Could it set ret to ksft_fail? Also, the check looks at the element as
a whole, while the parameter and the nh6 are computed for each node.
For example, "4>2,2:next-csid,psp:End.X" passes it although the node
"2" has no adjacency, and the setup then fails in ip, on the nh6. A
function that checks each node, called in place of this check, would
cover both:

	if ! __check_srv6_rtcfg "${n}"; then
		ret="${ksft_fail}"
		return 1
	fi

It would take the nodes and the behavior from the parsers that
__setup_rt_policy() already uses, not from the text of the element.
Just as an idea, something like this in __check_srv6_rtcfg():

	nodes="$(__get_srv6_rtcfg_id "${element}")"
	op_type="$(__get_srv6_rtcfg_op "${element}")"
	act="$(__get_srv6_rtcfg_act "${element}")"

	if ! op_has_next_csid "${op_type}" && \
	   echo "${nodes}" | grep -q ","; then
		echo "${element}: only NEXT-C-SID takes more than one node"
		return 1
	fi

	for node in $(echo "${nodes}" | sed 's/,/ /g'); do
		rt="$(__get_srv6_node_id "${node}")"
		param="$(__get_srv6_param "${act}" "${node}")"

		case "${act}" in
		"End")
			if [ "${node}" != "${rt}" ]; then
				echo "${element}: End takes no parameter"
				return 1
			fi
			;;
		"End.X")
			if [ -z "${param}" ]; then
				echo "${element}: End.X needs an adjacency"
				return 1
			fi
			;;
		esac
	done

IMO a case per behavior would also make End.T easier to add, both for
the flavor core that your 1/5 mentions for End.X/T and for NEXT-C-SID,
which I am working on.

> [snip]
> @@ -1031,6 +1187,25 @@ setup_end_flv_psp()
>  	SETUP_ERR=0
>  }
>  
> +setup_endx_flv_psp()
> +{
> +	SETUP_ERR=1
> +
> +	setup_hs_lo_addr 1 1 "${ENDX_CSID_PSP_FUNC}"
> +	setup_hs_lo_addr 2 2 "${ENDX_CSID_PSP_FUNC}"
> +
> +	# The same SRv6 policies with setup_end_flv_psp except using End.X
> +	setup_rt_policy_ipv6 2 1 "3>4:noflv:End.X 4>2:psp:End.X 2>h:psp:End.X"
> +	setup_rt_policy_ipv6 1 2 "1>h:psp:End.X"
> +
> +	setup_rt_policy_ipv6 "2:${ENDX_CSID_PSP_FUNC}" 1 \
> +		"3>4:next-csid,psp:End.X 4>2,2>h:next-csid,psp:End.X"
> +	setup_rt_policy_ipv6 "1:${ENDX_CSID_PSP_FUNC}" 2 \
> +		"4>3,3>1,1>h:next-csid,psp:End.X"
> +
> +	SETUP_ERR=0
> +}

On v3, Sashiko asked whether the End.X tests would pass with End.X
working as End. In this topology, the nh6 of each End.X is also the
next hop that a lookup of the new DA gives, and the tests pass in both
cases. An unreachable route in table 90 for the next SID, on rt-4 for
(i.a) and on rt-3 for (i.c), would make End fail and leave End.X
working. This is close to what Sashiko suggested on v3. What do you
think about adding these two routes to the End.X scenario, each with
its defer?

> [snip]
>  host_srv6_end_flv_psp_tests()
>  {
> -	log_section "SRv6 connectivity test hosts (h1 <-> h2, PSP flavor)"
> +	local act=${1:-"End"}
> +
> +	log_section "SRv6 connectivity test hosts (h1 <-> h2, ${act} PSP flavor)"
> [snip]
>  host_srv6_end_flv_next_csid_psp_tests()
>  {
> -	log_section "SRv6 connectivity test hosts (h1 <-> h2, NEXT-C-SID,PSP)"
> +	local act=${1:-"End"}
> +	local csid_psp_func
>  
> -	check_and_log_hs_lo_addr_connectivity 1 2 "${END_CSID_PSP_FUNC}"
> -	check_and_log_hs_lo_addr_connectivity 2 1 "${END_CSID_PSP_FUNC}"
> +	log_section "SRv6 connectivity test hosts (h1 <-> h2, ${act} NEXT-C-SID,PSP)"

Nit: NIPA's checkpatch warns on these two lines (81 and 85 columns).
It does not warn on a line that holds only a string, as in
host_srv6_end_flv_consumed_srh_tests().

> [snip]
>  test_kernel_supp_or_ksft_skip()
> [snip]
>  	if ! ip -netns "${test_netns}" -6 route \
>  		add "${IPv6_TESTS_ADDR}" encap seg6local \
> -		action End flavors "${flavor}" dev "${DUMMY_DEVNAME}"; then
> -		echo "SKIP: ${flavor} flavor not supported in kernel"
> +		"${policy[@]}" dev "${DUMMY_DEVNAME}"; then
> +		echo "SKIP: ${action} flavor ${flavor} not supported in kernel"

A note on this probe. On older kernels this add can succeed without
the flavor, and the tests then fail instead of being skipped. This
happens with End.X on v6.5, and with End on v6.0. I was thinking of
sending a separate patch that reads the route back, for the End and
the End.X probe. There is no need to wait for it. Does it work for
you?

> [snip]
> +if test_kernel_supp_or_ksft_skip End.X psp; then
> +	test_endx_flv
> +fi

When the probe finds no End.X PSP, the End.X tests do not show up in
the summary. The v4 skips only that scenario, as suggested on v3,
which is good. On my patch that added the consumed SRH tests, you
suggested to return at once when the srh match is missing. I kept the
check in each test because log_test_skipped() then logs each test and
counts it in "Tests skipped". IMHO the End.X scenario could do the
same, to be consistent. Does it sound reasonable to you?

> [snip]

Thanks,
Andrea
