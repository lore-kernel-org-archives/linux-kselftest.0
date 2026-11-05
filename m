Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793862440;
	b=1ALj86ybCHc8AadYbZpGi88qf/TdGRUocmy+tfOe6tgY2+KUaxwim6XhIi/UBQ7P408R
	 RwZJp1c6dtuS54ve0BDERWCV6m/hfy7HpqHF/BeukViBrX+u0aPYuq49h1NDHbDjURNvZ
	 8hP0/5SV2z0dTv6m7u3NsLXzLaX/Eu5nZMUshUufZhEEKHuB0FdfE3w5nxFijQbHer0nj
	 jUku+caP+gt3JZX1MNIkDPGVLTvYkGh4QAUhvkux9O/X/W1vZVNYS+6iJ/b91rBXv5jsh
	 Yc1dfas11xNiRRqrhqGhfz2U9Wcd6utMcF2vibP8TEV/EJoizAlEgbEpKmJbimYTRWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793862440;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=eTX+apBNSHjB36HJeuZSOIEoVx8WD2g+V4cf9uYb7TA=;
	b=ozBYHamLquqoKLTyhWe/JOe0v3oyY7EQTE6iBj+v1q7+b1JzvSO+TuGHGn1OEcfGCNSx
	 OHMOduorp9kJ0wJvvr8E64/q9eyMMcuLDtOr5XXSK9YAct84hlfVfJURn6jqLalgvRIOU
	 u+bvgKyGSbGJER6KEWUGz8p98l+utniWmQvMtpd4+ctz7PbOZlM2bri6HA61dPsPWEI4w
	 1z5mnStK0PCcx0tzF0N5JCdFuPdLrUhihPXhjpU/RdVIvAwkPrl5c+0vdlmMbrGihbKDX
	 ks7Mpk+72K1WDE0/waoCAM0ZP7BbAniJuySCdJjsBiH4EF5yNFQ66ovb1Ime06z7rFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=JOJO016L;
	arc=none smtp.remote-ip=95.215.58.181
Received: from mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C05606A328
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Nov 2026 07:07:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8C05606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=JOJO016L
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=grC8tyP5y51k9yvkO/N4IigyD3R/9TxoO5X7Np5fX8w=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793862437; v=1; x=1794467237;
 b=JOJO016LlfZmlQTwYyKsoJ0BBjg12wicuHsbO6/cmGs6+jPfGBY3XOeJP9cIt30RddiWe4Qw
 X1k/JMlqX5o+40tVZMC+6VApg6UYydK7DVoEZ2Nc0z6mcj9gA5wY+Vkfb9JqKQVadfjPvCt8W30
 T+7JXQkce7ScKEN7Znath97w=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 04e950e0fabfc400;
	Thu, 05 Nov 2026 07:07:17 +0000
X-Mizu-Trace-ID: 04e950e0fabfc400
X-Migadu-Flow: FLOW_OUT
Date: Thu, 5 Nov 2026 15:07:07 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Andrea Mayer <andrea.mayer@uniroma2.it>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	David Ahern <dsahern@kernel.org>, Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
	Justin Iurman <justin.iurman@gmail.com>,
	Nicolas Dichtel <nicolas.dichtel@6wind.com>,
	Ahmed Abdelsalam <ahabdels@cisco.com>,
	Stefano Salsano <stefano.salsano@uniroma2.it>,
	andrea@common-net.org
Subject: Re: [PATCH net-next v2 4/5] selftests: seg6: add tests for PSP
 together with NEXT-C-SID
Message-ID: <auwrG1zT_BH3Mose@fedora>
References: <20261105015715.57-1-andrea.mayer@uniroma2.it>
 <20261105015715.57-5-andrea.mayer@uniroma2.it>
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
In-Reply-To: <20261105015715.57-5-andrea.mayer@uniroma2.it>

On Thu, Nov 05, 2026 at 02:57:14AM +0100, Andrea Mayer wrote:
> Extend srv6_end_flavors_test.sh with tests for the SRv6 End behavior
> with both the NEXT-C-SID and PSP flavors.
> 
> The tests use two SRv6 Policies with C-SID containers, where every
> router after the ingress one applies End with the NEXT-C-SID and PSP
> flavors. To check PSP, set net.ipv6.conf.all.seg6_enabled to 0 on the
> hosts in setup_hs(). The hosts then drop any packet that still carries
> an SRH, and a ping to an address on the loopback of a host succeeds
> only if the router connected to that host has removed the SRH. The tests
> fail when PSP is not applied together with NEXT-C-SID.
> 
> Signed-off-by: Andrea Mayer <andrea.mayer@uniroma2.it>
> ---
>  .../selftests/net/srv6_end_flavors_test.sh    | 344 +++++++++++++++++-
>  1 file changed, 326 insertions(+), 18 deletions(-)
> 
> diff --git a/tools/testing/selftests/net/srv6_end_flavors_test.sh b/tools/testing/selftests/net/srv6_end_flavors_test.sh
> index 30a939392eea..0355149bb7d6 100755
> --- a/tools/testing/selftests/net/srv6_end_flavors_test.sh
> +++ b/tools/testing/selftests/net/srv6_end_flavors_test.sh
> @@ -16,8 +16,9 @@
>  #
>  # The End, End.X, and End.T behaviors can support these flavors either
>  # individually or in combinations.
> -# Currently in this selftest we consider only the PSP flavor for the SRv6 End
> -# behavior. However, it is possible to extend the script as soon as other
> +# Currently in this selftest we consider the PSP flavor for the SRv6 End
> +# behavior, both alone and combined with the NEXT-C-SID flavor defined in
> +# RFC9800 [2]. However, it is possible to extend the script as soon as other
>  # flavors will be supported in the kernel.
>  #
>  # The purpose of the PSP flavor consists in instructing the penultimate node
> @@ -47,7 +48,20 @@
>  #    "standard" End packet processing, ignoring the configured PSP flavor at
>  #    all.
>  #
> +# The NEXT-C-SID flavor (referred to as NEXT-CSID in RFC9800 [2]) and the
> +# C-SID containers are described in srv6_end_next_csid_l3vpn_test.sh, which
> +# also tests this flavor for the SRv6 End behavior.
> +#
> +# When the NEXT-C-SID flavor is combined with the PSP, USP or USD flavors, these
> +# flavors are left unchanged [2]. The NEXT-C-SID processing comes first: with a
> +# non-zero Argument, the IPv6 DA is updated with the next C-SID and the packet
> +# is forwarded without changing the SRH, if any. The packet goes through the End
> +# behavior with the other flavors only when the Argument is zero, i.e. when the
> +# IPv6 DA carries no further C-SID. For example, the PSP operation takes place
> +# only for a C-SID container with a zero Argument and SL=1.
> +#
>  # [1] RFC8986: https://datatracker.ietf.org/doc/html/rfc8986
> +# [2] RFC9800: https://datatracker.ietf.org/doc/html/rfc9800
>  #
>  # Network topology
>  # ================
> @@ -115,12 +129,35 @@
>  #   +---------------------------------------------------------------------+
>  #   |fcff:x::e is associated with the SRv6 End behavior                   |
>  #   |fcff:x::ef1 is associated with the SRv6 End behavior with PSP flavor |
> +#   |fcbb:0:xpyy::/48 is associated with the SRv6 behavior and flavors    |
> +#   |   given by the Function yy, and with parameter p of the behavior    |
>  #   +---------------------------------------------------------------------+
>  #
>  # The fcff::/16 prefix is reserved by the operator for the SIDs. Reachability of
>  # SIDs is ensured by proper configuration of the IPv6 operator's network and
>  # SRv6 routers.
>  #
> +# Similarly, the fcbb:0::/32 prefix is reserved by the operator for the C-SID
> +# containers and it is used as their Locator-Block.
> +# A C-SID (16 bits) is written as xpyy, where:
> +#  - x is the Locator-Node (4 bits), i.e. the ID of the router;
> +#  - p is a parameter of the behavior (4 bits), 0 for End, which has none;
> +#  - yy is the Function (8 bits). Its first digit selects the SRv6 behavior
> +#    (e for End, as in fcff:x::e). Its second digit is the set of flavors, as
> +#    a bit mask: 1 for PSP, 2 for USP, 4 for USD and 8 for NEXT-C-SID (as the
> +#    f1 of fcff:x::ef1 for PSP).
> +# In the terms of RFC9800 [2], p and yy together are the Function of the C-SID
> +# (12 bits), and p is not part of the Argument:
> +#
> +#   +----------+----------+--------------------+
> +#   | Function | behavior | flavors            |
> +#   +----------+----------+--------------------+
> +#   | e9       | End      | NEXT-C-SID and PSP |
> +#   +----------+----------+--------------------+
> +#
> +# For example, fcbb:0:40e9:20e9:: is a C-SID container carrying the C-SID of
> +# rt-4 followed by the C-SID of rt-2, both with the NEXT-C-SID and PSP flavors.
> +#
>  #
>  # SRv6 Policies
>  # =============
> @@ -193,6 +230,39 @@
>  # set with the last SID; iii) the SRH is removed from the extension headers
>  # after the IPv6 header. At this point, the packet with IPv6 DA=cafe::1 is sent
>  # to the destination, i.e. hs-1.
> +#
> +# Traffic to the loopback addresses of the hosts
> +# ----------------------------------------------
> +#
> +# Each host has an address on its loopback, cafe::x:e9. The traffic from the
> +# other host towards this address is steered with C-SID containers: after the
> +# ingress router, every router crossed applies the SRv6 End behavior with the
> +# NEXT-C-SID and PSP flavors. The following SRv6 Policies are applied by rt-1
> +# to the traffic towards cafe::2:e9 (i.c) and by rt-2 to the traffic towards
> +# cafe::1:e9 (i.d):
> +#
> +#   i.c) IPv6 traffic, SID List=fcbb:0:30e9::,fcbb:0:40e9:20e9::,cafe::2:e9
> +#   i.d) IPv6 traffic, SID List=fcbb:0:40e9:30e9:10e9::,cafe::1:e9
> +#
> +# In the Policy (i.c), rt-3 receives a zero Argument with SL=2 and applies the
> +# "standard" End processing. rt-4 receives a non-zero Argument with SL=1: it
> +# advances to the next C-SID and does *NOT* apply the PSP operation. rt-2
> +# receives a zero Argument with SL=1 and applies the PSP operation.
> +#
> +# In the Policy (i.d), a single C-SID container carries three C-SIDs. rt-4 and
> +# rt-3 receive a non-zero Argument with SL=1: they advance to the next C-SID and
> +# do *NOT* apply the PSP operation. rt-1 receives a zero Argument with SL=1
> +# and applies the PSP operation.
> +#
> +# The hosts use cafe::x as the source address, not the loopback address. The
> +# replies are sent to cafe::x and follow the Policies (i.a) and (i.b), which
> +# are tested first. This way, each ping checks a single Policy with the
> +# NEXT-C-SID flavor, and a failure points directly to that Policy.
> +#
> +# The hosts drop the packets that carry an SRH (seg6_enabled is set to 0 on
> +# the hosts). The loopback address of a host is reached only through the
> +# router connected to that host: the ping succeeds only if the SRH is removed
> +# by that router.
>  
>  # shellcheck source=lib.sh
>  source lib.sh
> @@ -207,6 +277,20 @@ readonly IPv6_TESTS_ADDR=2001:db8::1
>  readonly LOCATOR_SERVICE=fcff
>  readonly END_FUNC=000e
>  readonly END_PSP_FUNC=0ef1
> +readonly END_CSID_PSP_FUNC=e9
> +
> +readonly LCBLOCK_ADDR=fcbb:0
> +readonly LCBLOCK_BLEN=32
> +# do not add ':' as separator. The Locator-Node is followed by the parameter
> +# of the behavior, 0 for End.
> +readonly LCNODE_FMT="%x0"
> +readonly LCNODE_BLEN=4
> +readonly LCNODEFUNC_BLEN=16
> +
> +readonly LCBLOCK_NODE_BLEN=$((LCBLOCK_BLEN + LCNODE_BLEN))
> +readonly LCBLOCK_NODEFUNC_BLEN=$((LCBLOCK_BLEN + LCNODEFUNC_BLEN))
> +# lengths of Locator-Block and C-SID of the NEXT-C-SID flavor
> +readonly CSID_CFG="lblen ${LCBLOCK_BLEN} nflen ${LCNODEFUNC_BLEN}"
>  
>  PING_TIMEOUT_SEC=4
>  PAUSE_ON_FAIL=${PAUSE_ON_FAIL:=no}
> @@ -397,6 +481,45 @@ __get_srv6_rtcfg_op()
>  		xargs | sed 's/ /,/g'
>  }
>  
> +# Return the C-SID of a router: the Locator-Node (4 bits), i.e. the ID of the
> +# router, followed by the parameter of the behavior (4 bits, 0) and the
> +# Function (8 bits).
> +# args:
> +#  $1 - router
> +#  $2 - Function (e.g. "e9")
> +# e.g. input: "4" "e9"
> +#      output: "40e9"
> +build_csid()
> +{
> +	local nodeid="$1"
> +	local func="$2"
> +
> +	printf "${LCNODE_FMT}%s" "${nodeid}" "${func}"
> +}
> +
> +# Return the C-SID container with the C-SIDs of the routers listed in a
> +# "next-csid,<flavors>" element, in the same order.
> +# args:
> +#  $1 - <nodeid> of the element: a comma-separated list of routers
> +#  $2 - Function (e.g. "e9")
> +# e.g. input: "4,2" "e9"
> +#      output: "fcbb:0:40e9:20e9::"
> +build_csid_container()
> +{
> +	local nodeids="$1"
> +	local func="$2"
> +	local csids=''
> +	local nodes
> +	local node
> +
> +	nodes="$(echo "${nodeids}" | sed 's/,/ /g')"
> +	for node in ${nodes}; do
> +		csids="${csids}:$(build_csid "${node}" "${func}")"
> +	done
> +
> +	echo "${LCBLOCK_ADDR}${csids}::"
> +}
> +
>  # Setup the basic networking for the routers
>  setup_rt_networking()
>  {
> @@ -439,6 +562,7 @@ setup_rt_local_sids()
>  	local devname
>  	local nsname
>  	local neigh
> +	local csid
>  
>  	nsname="$(get_rtname "${rt}")"
>  
> @@ -452,6 +576,15 @@ setup_rt_local_sids()
>  			add "${LOCATOR_SERVICE}:${neigh}::/32" \
>  			table "${LOCALSID_TABLE_ID}" \
>  			via "${net_prefix}::${neigh}" dev "${devname}"
> +
> +		# set underlay network routes to reach the C-SID containers
> +		# that start with a C-SID of the neighbor, for any parameter and
> +		# Function.
> +		csid="$(build_csid "${neigh}" 00)"
> +		ip -netns "${nsname}" -6 route \
> +			add "${LCBLOCK_ADDR}:${csid}::/${LCBLOCK_NODE_BLEN}" \
> +			table "${LOCALSID_TABLE_ID}" \
> +			via "${net_prefix}::${neigh}" dev "${devname}"
>  	done
>  
>  	# Local End behavior (note that "dev" is a dummy interface chosen for
> @@ -461,30 +594,135 @@ setup_rt_local_sids()
>  		table "${LOCALSID_TABLE_ID}" \
>  		encap seg6local action End dev "${DUMMY_DEVNAME}"
>  
> -
>  	# all SIDs start with a common locator. Routes and SRv6 Endpoint
>  	# behavior instances are grouped together in the 'localsid' table.
>  	ip -netns "${nsname}" -6 rule \
>  		add to "${LOCATOR_SERVICE}::/16" \
>  		lookup "${LOCALSID_TABLE_ID}" prio 999
>  
> +	# the C-SID containers use their own Locator-Block. Their routes and
> +	# SRv6 Endpoint behavior instances are in the 'localsid' table too.
> +	ip -netns "${nsname}" -6 rule \
> +		add to "${LCBLOCK_ADDR}::/${LCBLOCK_BLEN}" \
> +		lookup "${LOCALSID_TABLE_ID}" prio 999
> +
>  	# set default routes to unreachable
>  	ip -netns "${nsname}" -6 route \
>  		add unreachable default metric 4278198272 \
>  		dev "${DUMMY_DEVNAME}"
>  }
>  
> +# Return success if the operation <op> of an element contains the NEXT-C-SID
> +# flavor, i.e. the SIDs of the element are C-SIDs.
> +# e.g. input: "next-csid,psp" -> success; "psp" -> failure
> +op_has_next_csid()
> +{
> +	local op_type="$1"
> +
> +	case ",${op_type}," in
> +	*,next-csid,*)
> +		return 0
> +		;;
> +	esac
> +
> +	return 1
> +}
> +
> +# Return the SID to which the SRv6 Endpoint behavior of a router is bound.
> +# With NEXT-C-SID, it is the C-SID of the router as a prefix: on rt-4,
> +# fcbb:0:40e9::/48 also matches the DA fcbb:0:40e9:20e9::.
> +# args:
> +#  $1 - router
> +#  $2 - operation <op> of the element (e.g. "next-csid,psp")
> +#  $3 - Function (e.g. "0ef1", or "e9" with NEXT-C-SID)
> +# e.g. input: "4" "psp" "0ef1"
> +#      output: "fcff:4::0ef1"
> +#      input: "4" "next-csid,psp" "e9"
> +#      output: "fcbb:0:40e9::/48"
> +get_rt_sid()
> +{
> +	local rt="$1"
> +	local op_type="$2"
> +	local func="$3"
> +	local csid
> +
> +	if op_has_next_csid "${op_type}"; then
> +		csid="$(build_csid "${rt}" "${func}")"
> +		echo "${LCBLOCK_ADDR}:${csid}::/${LCBLOCK_NODEFUNC_BLEN}"
> +		return
> +	fi
> +
> +	echo "${LOCATOR_SERVICE}:${rt}::${func}"
> +}
> +
> +# Add an SRv6 Endpoint behavior to a router, bound to a SID. Nothing is added
> +# if the router already has a route for that SID.
> +# args:
> +#  $1 - router
> +#  $2 - SID, or C-SID of the router as a prefix
> +#  $3 - SRv6 Endpoint behavior and flavors (e.g. "End flavors psp")
> +setup_rt_endpoint()
> +{
> +	local rt="$1"
> +	local sid="$2"
> +	local behavior_cfg="$3"
> +	local nsname
> +
> +	nsname="$(get_rtname "${rt}")"
> +
> +	# the prefix length is part of the SID: two SIDs can have the same
> +	# address and different lengths.
> +	if [ -n "$(ip -netns "${nsname}" -6 route show \
> +		table "${LOCALSID_TABLE_ID}" exact "${sid}")" ]; then
> +		return
> +	fi
> +
> +	ip -netns "${nsname}" -6 route \
> +		add "${sid}" table "${LOCALSID_TABLE_ID}" \
> +		encap seg6local action ${behavior_cfg} \
> +		dev "${DUMMY_DEVNAME}"
> +}
> +
> +# Add an SRv6 Endpoint behavior to each router of a Policy element <nodeid:op>.
> +# args:
> +#  $1 - <nodeid> of the element: one router, or a comma-separated list
> +#  $2 - operation <op> of the element (e.g. "next-csid,psp")
> +#  $3 - Function (e.g. "0ef1", or "e9" with NEXT-C-SID)
> +#  $4 - SRv6 Endpoint behavior and flavors (e.g. "End flavors psp")
> +# e.g. input: "4,2" "next-csid,psp" "e9"
> +#             "End flavors next-csid,psp lblen 32 nflen 16"
> +#      result: the behavior is added on rt-4, bound to fcbb:0:40e9::/48, and
> +#              on rt-2, bound to fcbb:0:20e9::/48
> +setup_rt_endpoints()
> +{
> +	local node="$1"
> +	local op_type="$2"
> +	local func="$3"
> +	local behavior_cfg="$4"
> +	local sid
> +	local rt
> +
> +	for rt in $(echo "${node}" | sed 's/,/ /g'); do
> +		sid="$(get_rt_sid "${rt}" "${op_type}" "${func}")"
> +		setup_rt_endpoint "${rt}" "${sid}" "${behavior_cfg}"
> +	done
> +}
> +
>  # This helper function builds and installs the SID List (i.e. SRv6 Policy)
>  # to be applied on incoming packets at the ingress node. Moreover, it
>  # configures the SRv6 nodes specified in the SID List to process the traffic
>  # according to the operations required by the Policy itself.
>  # args:
> -#  $1 - destination host (i.e. cafe::x host)
> +#  $1 - destination host x (i.e. the cafe::x host), or x:yy for the address
> +#       cafe::x:yy on the loopback of the host (e.g. 2:e9)
>  #  $2 - SRv6 router configured for enforcing the SRv6 Policy
>  #  $3 - compact way to represent a list of SRv6 routers with their operations
>  #       (i.e. behaviors) that each of them needs to perform. Every <nodeid:op>
>  #       element constructs a SID that is associated with the behavior <op> on
>  #       the <nodeid> node. The list of such elements forms an SRv6 Policy.
> +#       For "next-csid,psp", <nodeid> is a comma-separated list of node IDs.
> +#       The element constructs a C-SID container with the C-SIDs of these
> +#       nodes, e.g. "4,2:next-csid,psp" gives fcbb:0:40e9:20e9::.
>  __setup_rt_policy()
>  {
>  	local dst="$1"
> @@ -492,10 +730,9 @@ __setup_rt_policy()
>  	local policy_rts="$3"
>  	local behavior_cfg
>  	local in_nsname
> -	local rt_nsname
>  	local policy=''
> +	local container
>  	local function
> -	local fullsid
>  	local op_type
>  	local node
>  	local n
> @@ -505,7 +742,6 @@ __setup_rt_policy()
>  	for n in ${policy_rts}; do
>  		node="$(__get_srv6_rtcfg_id "${n}")"
>  		op_type="$(__get_srv6_rtcfg_op "${n}")"
> -		rt_nsname="$(get_rtname "${node}")"
>  
>  		case "${op_type}" in
>  		"noflv")
> @@ -520,22 +756,22 @@ __setup_rt_policy()
>  			behavior_cfg="End flavors psp"
>  			;;
>  
> +		"next-csid,psp")
> +			container="$(build_csid_container "${node}" \
> +				"${END_CSID_PSP_FUNC}")"
> +			policy="${policy}${container},"
> +			function="${END_CSID_PSP_FUNC}"
> +			behavior_cfg="End flavors next-csid,psp ${CSID_CFG}"
> +			;;
> +
>  		*)
>  			break
>  			;;
>  		esac
>  
> -		fullsid="${LOCATOR_SERVICE}:${node}::${function}"
> -
> -		# add SRv6 Endpoint behavior to the selected router
> -		if ! ip -netns "${rt_nsname}" -6 route get "${fullsid}" \
> -			&>/dev/null; then
> -			ip -netns "${rt_nsname}" -6 route \
> -				add "${fullsid}" \
> -				table "${LOCALSID_TABLE_ID}" \
> -				encap seg6local action ${behavior_cfg} \
> -				dev "${DUMMY_DEVNAME}"
> -		fi
> +		# add SRv6 Endpoint behavior to the selected routers
> +		setup_rt_endpoints "${node}" \
> +			"${op_type}" "${function}" "${behavior_cfg}"
>  	done
>  
>  	# we need to remove the trailing comma to avoid inserting an empty
> @@ -571,6 +807,7 @@ setup_hs()
>  
>  	ip netns exec "${hsname}" sysctl -wq net.ipv6.conf.all.accept_dad=0
>  	ip netns exec "${hsname}" sysctl -wq net.ipv6.conf.default.accept_dad=0
> +	ip netns exec "${hsname}" sysctl -wq net.ipv6.conf.all.seg6_enabled=0
>  
>  	ip -netns "${hsname}" link add veth0 type veth \
>  		peer name "${RT2HS_DEVNAME}" netns "${rtname}"
> @@ -590,6 +827,32 @@ setup_hs()
>  		sysctl -wq net.ipv6.conf."${RT2HS_DEVNAME}".proxy_ndp=1
>  }
>  
> +# Set up an address on the loopback of a host, and the route towards it on the
> +# router connected to the host.
> +# args:
> +#  $1 - host
> +#  $2 - router connected to the host
> +#  $3 - suffix of the address (i.e. cafe::<host>:<suffix>)
> +setup_hs_lo_addr()
> +{
> +	local hs="$1"
> +	local rt="$2"
> +	local suffix="$3"
> +	local hsname
> +	local rtname
> +	local addr
> +
> +	hsname="$(get_hsname "${hs}")"
> +	rtname="$(get_rtname "${rt}")"
> +	addr="${IPv6_HS_NETWORK}::${hs}:${suffix}"
> +
> +	ip -netns "${hsname}" addr add "${addr}/128" dev lo nodad
> +
> +	ip -netns "${rtname}" -6 route \
> +		add "${addr}" \
> +		via "${IPv6_HS_NETWORK}::${hs}" dev "${RT2HS_DEVNAME}"
> +}
> +
>  setup()
>  {
>  	local i
> @@ -622,6 +885,11 @@ setup()
>  	setup_hs 1 1
>  	setup_hs 2 2
>  
> +	# set up the loopback addresses of the hosts used by the Policies (i.c)
> +	# and (i.d).
> +	setup_hs_lo_addr 1 1 "${END_CSID_PSP_FUNC}"
> +	setup_hs_lo_addr 2 2 "${END_CSID_PSP_FUNC}"
> +
>  	# set up default SRv6 Endpoints (i.e. SRv6 End behavior)
>  	setup_rt_local_sids 1 "2 3 4"
>  	setup_rt_local_sids 2 "1 3 4"
> @@ -645,6 +913,21 @@ setup()
>  	setup_rt_policy_ipv6 2 1 "3:noflv 4:psp 2:psp"
>  	setup_rt_policy_ipv6 1 2 "1:psp"
>  
> +	# Direction hs-1 -> hs-2 (cafe::2:e9, NEXT-C-SID and PSP flavors)
> +	#  - rt-1 (SRv6 H.Insert policy)
> +	#  - rt-3 (Argument=0 and SL>1, acting as an End behavior)
> +	#  - rt-4 (Argument!=0 and SL=1, advancing the C-SID)
> +	#  - rt-2 (Argument=0 and SL=1, PSP)
> +	#
> +	# Direction hs-2 -> hs-1 (cafe::1:e9, NEXT-C-SID and PSP flavors)
> +	#  - rt-2 (SRv6 H.Insert policy)
> +	#  - rt-4 (Argument!=0 and SL=1, advancing the C-SID)
> +	#  - rt-3 (Argument!=0 and SL=1, advancing the C-SID)
> +	#  - rt-1 (Argument=0 and SL=1, PSP)
> +	setup_rt_policy_ipv6 "2:${END_CSID_PSP_FUNC}" 1 \
> +		"3:next-csid,psp 4,2:next-csid,psp"
> +	setup_rt_policy_ipv6 "1:${END_CSID_PSP_FUNC}" 2 "4,3,1:next-csid,psp"
> +
>  	# testing environment was set up successfully
>  	SETUP_ERR=0
>  }
> @@ -710,6 +993,20 @@ check_and_log_hs_connectivity()
>  	check_and_log_hs_ipv6_connectivity "${hssrc}" "${hsdst}"
>  }
>  
> +check_and_log_hs_lo_addr_connectivity()
> +{
> +	local hssrc="$1"
> +	local hsdst="$2"
> +	local suffix="$3"
> +	local dst
> +
> +	dst="${IPv6_HS_NETWORK}::${hsdst}:${suffix}"
> +
> +	check_hs_ipv6_connectivity "${hssrc}" "${hsdst}:${suffix}"
> +	log_test $? 0 \
> +		"IPv6 Hosts connectivity: hs-${hssrc} -> hs-${hsdst} (${dst})"
> +}
> +
>  router_tests()
>  {
>  	local i
> @@ -747,6 +1044,14 @@ host_srv6_end_flv_psp_tests()
>  	check_and_log_hs_connectivity 2 1
>  }
>  
> +host_srv6_end_flv_next_csid_psp_tests()
> +{
> +	log_section "SRv6 connectivity test hosts (h1 <-> h2, NEXT-C-SID,PSP)"
> +
> +	check_and_log_hs_lo_addr_connectivity 1 2 "${END_CSID_PSP_FUNC}"
> +	check_and_log_hs_lo_addr_connectivity 2 1 "${END_CSID_PSP_FUNC}"
> +}
> +
>  test_iproute2_supp_or_ksft_skip()
>  {
>  	local flavor="$1"
> @@ -836,6 +1141,8 @@ test_command_or_ksft_skip sort
>  test_command_or_ksft_skip xargs
>  
>  test_dummy_dev_or_ksft_skip
> +# NEXT-C-SID is not checked: every kernel and iproute2 version that
> +# supports PSP also supports NEXT-C-SID.
>  test_iproute2_supp_or_ksft_skip psp
>  test_kernel_supp_or_ksft_skip psp
>  
> @@ -848,5 +1155,6 @@ set +e
>  router_tests
>  host2gateway_tests
>  host_srv6_end_flv_psp_tests
> +host_srv6_end_flv_next_csid_psp_tests
>  
>  print_log_test_results
> -- 
> 2.43.0
> 

Tested-by: Hangbin Liu <liuhangbin@kylinos.cn>
Reviewed-by: Hangbin Liu <liuhangbin@kylinos.cn>
