Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793866687;
	b=HuVdwZ6IpXxhUUQdR3Np8+ZfTLojGiTRC4FXUF+BFlzbC8dxGEnEO/DnA+8JaS/6xDEC
	 HIw0TokK843jDLjhZMz4hsFhpqhVdpWeU5IkhphOaRd6E5wN84f1Zf/yyF7nhzy4ORmCj
	 OlksIbzMiDmKuXzp1Y8P/FfNxjwbtNEtIrOQFQPlcmJjERSUmBgVL9SKyUH6Ff7XgyPKI
	 40Hbm/bUJM6CE3uCKGKuuEMpGvBWBKnoyZNtOVqsdcokv2NKfjb2yp1AheBckxgyJCfRf
	 XsZfrFTIoMA6nM/dldzqIuaJEgVkSLkykAQYh2lAOpaf6iuW/GXKd0og+Hfa63ANnfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793866687;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=mkeKijkZJAb32Xidxy1cWIRtF5ltLYzkBnezIwTR2i8=;
	b=4q5zjbs5RKcmm9d5oIfSAy7syNSeoO9G7eMeixlztRDC99ihdf6aYTmTPsv0XAdNlsqD
	 bkhZAXwiFRu5qGiQq/TVVx5DGp6IWS88Xcyzxnw33laKC+e+O6RNzwqwaHOyJvpxTzplc
	 SHM3D+qIojx3VmwT7qzs+ukdTGE/WAk9/7ZMRdbpVZcKIKw7kLZY6rZi2h5BUwVMIIReh
	 /kzS7mioTGtyMoARWL5qZpv1RtWsIr1ChSlyYrGyEfGu/2LFDaaeJkQ6bcmhS791JtP3h
	 Bhj8CAPKAUQzn7/GyAnR83ubIC35A+EiMyafebffQPhq+SNLM8/pTcUfkfVJBzXhHtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=fMfgocFw;
	arc=none smtp.remote-ip=95.215.58.163
Received: from mta1.migadu.com (out-163.mta1.migadu.com [95.215.58.163])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EFF3606A32C
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Nov 2026 08:18:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EFF3606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=fMfgocFw
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=qwrMdxVPnM+5ZppQDh0ezd2BTYb3+ptUjf9aMMr/HGQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793866684; v=1; x=1794471484;
 b=fMfgocFwzY6akGVpgl5ADZEuP5nOW+JyLD/ib5wT6AvwmFalE4CDGtIN+ydzyFu/pHtqGvLG
 Sf4PAjnLLSPgElJVT0yBoh5UpnX/nmU4ZeQ4BE1uw38V+L/E8F69KYPRinqn/u4mMWEba3zopnu
 /LvtkxJ2uXW7tq3iQ/rCErsQ=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 292388bdccba3920;
	Thu, 05 Nov 2026 08:18:04 +0000
X-Mizu-Trace-ID: 292388bdccba3920
X-Migadu-Flow: FLOW_OUT
Date: Thu, 5 Nov 2026 16:17:46 +0800
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
Subject: Re: [PATCH net-next v2 5/5] selftests: seg6: add tests for PSP with
 a consumed SRH
Message-ID: <auw7qq8vayCbOWMM@fedora>
References: <20261105015715.57-1-andrea.mayer@uniroma2.it>
 <20261105015715.57-6-andrea.mayer@uniroma2.it>
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
In-Reply-To: <20261105015715.57-6-andrea.mayer@uniroma2.it>

On Thu, Nov 05, 2026 at 02:57:15AM +0100, Andrea Mayer wrote:
> Extend srv6_end_flavors_test.sh with tests for the SRv6 End behavior
> with the PSP flavor, alone and together with NEXT-C-SID, on packets that
> carry a consumed SRH in front of the SRH to process.
> 
> Each test sends a ping along an existing SRv6 Policy, and a router on
> the path inserts an extra SRH in front of the Policy's SRH. An End
> behavior on another router consumes the extra SRH, and the router
> connected to the host must then remove only the Policy's SRH.
> 
> These tests set seg6_enabled to 1 on the hosts, which must accept the
> extra SRH, and set it back to 0 at the end. With seg6_enabled set to 1,
> a host also accepts the packet when the Policy's SRH is not removed, or
> when the extra SRH is removed in its place. For this reason, the
> receiving host accepts the echo request only when its first SRH is the
> extra SRH, with Segments Left 0 and followed by the ICMPv6 header. Any
> other echo request is dropped, including one without any SRH. The extra
> SRH is recognized by its last segment, which is the SID that triggered
> its insertion.
> 
> The check on the receiving host uses the ip6tables srh match. Without
> it, these tests are skipped. A test fails if the route that inserts the
> extra SRH, or the rules on the receiving host, cannot be added.
> 
> Signed-off-by: Andrea Mayer <andrea.mayer@uniroma2.it>
> ---
>  tools/testing/selftests/net/config            |   1 +
>  .../selftests/net/srv6_end_flavors_test.sh    | 280 +++++++++++++++++-
>  2 files changed, 279 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/testing/selftests/net/config b/tools/testing/selftests/net/config
> index 7a89e2618d4c..d5d2382b0b01 100644
> --- a/tools/testing/selftests/net/config
> +++ b/tools/testing/selftests/net/config
> @@ -27,6 +27,7 @@ CONFIG_IP6_NF_IPTABLES=m
>  CONFIG_IP6_NF_IPTABLES_LEGACY=m
>  CONFIG_IP6_NF_MANGLE=m
>  CONFIG_IP6_NF_MATCH_RPFILTER=m
> +CONFIG_IP6_NF_MATCH_SRH=m
>  CONFIG_IP6_NF_NAT=m
>  CONFIG_IP6_NF_RAW=m
>  CONFIG_IP6_NF_TARGET_REJECT=m
> diff --git a/tools/testing/selftests/net/srv6_end_flavors_test.sh b/tools/testing/selftests/net/srv6_end_flavors_test.sh
> index 0355149bb7d6..157baa8ecb0b 100755
> --- a/tools/testing/selftests/net/srv6_end_flavors_test.sh
> +++ b/tools/testing/selftests/net/srv6_end_flavors_test.sh

[...]

> +# In a network namespace, accept the echo requests whose first SRH has the given
> +# SID as last segment (Segment List[0]), SL=0 and the ICMPv6 header after it,
> +# and drop any other echo request, including one without any SRH.
> +# args:
> +#  $1 - network namespace in which the rules are added
> +#  $2 - expected last segment of the first SRH
> +add_srh_check_rules()
> +{
> +	local nsname="$1"
> +	local sid="$2"
> +
> +	ip netns exec "${nsname}" ip6tables -A INPUT \
> +		-p ipv6-icmp --icmpv6-type echo-request \
> +		-m srh --srh-lsid "${sid}" --srh-segs-left-eq 0 \
> +		--srh-next-hdr 58 -j ACCEPT &&
> +	ip netns exec "${nsname}" ip6tables -A INPUT \
> +		-p ipv6-icmp --icmpv6-type echo-request -j DROP
> +}
> +
> +# On a host, check that the echo requests carry the extra SRH alone.
> +# args:
> +#  $1 - host on which the rules are added
> +#  $2 - expected last segment of the first SRH
> +setup_hs_srh_check()
> +{
> +	local hs="$1"
> +	local sid="$2"
> +	local hsname
> +
> +	hsname="$(get_hsname "${hs}")"
> +
> +	add_srh_check_rules "${hsname}" "${sid}"
> +}
> +
> +cleanup_hs_srh_check()
> +{
> +	local hs="$1"
> +	local hsname
> +
> +	hsname="$(get_hsname "${hs}")"
> +
> +	ip netns exec "${hsname}" ip6tables -F INPUT
> +}
> +
> +# Test a Policy with a consumed SRH: a router inserts the extra SRH on the
> +# packets towards a SID, and another router consumes it. The destination host
> +# accepts only the echo requests that carry the extra SRH alone.
> +# args:
> +#  $1 - router that inserts the extra SRH
> +#  $2 - SID that triggers the insertion
> +#  $3 - router with the SRv6 End behavior that consumes the extra SRH
> +#  $4 - source host
> +#  $5 - destination host
> +#  $6 - suffix of the address on the loopback of the destination host
> +#       (i.e. cafe::<host>:<suffix>), if any
> +check_and_log_consumed_srh()
> +{
> +	local rt="$1"
> +	local sid="$2"
> +	local end_rt="$3"
> +	local hssrc="$4"
> +	local hsdst="$5"
> +	local suffix="$6"
> +	local msg
> +
> +	if ! ${HAS_SRH_MATCH}; then
> +		msg="IPv6 Hosts connectivity: hs-${hssrc} -> hs-${hsdst}"
> +		if [ -n "${suffix}" ]; then
> +			msg="${msg} (${IPv6_HS_NETWORK}::${hsdst}:${suffix})"
> +		fi
> +		log_test_skipped "${msg}"
> +		return
> +	fi
> +
> +	if ! setup_rt_consumed_srh "${rt}" "${sid}" "${end_rt}"; then
> +		log_test 1 0 "Extra SRH on rt-${rt} for ${sid}"
> +		return
> +	fi
> +
> +	if ! setup_hs_srh_check "${hsdst}" "${sid}"; then
> +		log_test 1 0 "SRH check on hs-${hsdst} for ${sid}"
> +	elif [ -n "${suffix}" ]; then
> +		check_and_log_hs_lo_addr_connectivity "${hssrc}" "${hsdst}" \
> +			"${suffix}"
> +	else
> +		check_and_log_hs_connectivity "${hssrc}" "${hsdst}"
> +	fi
> +
> +	cleanup_hs_srh_check "${hsdst}"
> +	cleanup_rt_consumed_srh "${rt}" "${sid}"
> +}
> +
> +host_srv6_end_flv_consumed_srh_tests()
> +{
> +	local sid
> +
> +	log_section \
> +		"SRv6 connectivity test hosts (h1 <-> h2, PSP with a consumed SRH)"
> +
> +	if ! ${HAS_SRH_MATCH}; then
> +		echo "SKIP: ip6tables srh match not available"
> +	fi
> +
> +	set_hs_seg6_enabled 1
> +
> +	# Policy (i.a): rt-4 inserts the extra SRH consumed by rt-3
> +	sid="${LOCATOR_SERVICE}:2::${END_PSP_FUNC}"
> +	check_and_log_consumed_srh 4 "${sid}" 3 1 2
> +
> +	# Policy (i.b): rt-2 inserts the extra SRH consumed by rt-3
> +	sid="${LOCATOR_SERVICE}:1::${END_PSP_FUNC}"
> +	check_and_log_consumed_srh 2 "${sid}" 3 2 1
> +
> +	# Policy (i.c): rt-4 inserts the extra SRH consumed by rt-3
> +	sid="$(build_csid_container 2 "${END_CSID_PSP_FUNC}")"
> +	check_and_log_consumed_srh 4 "${sid}" 3 1 2 "${END_CSID_PSP_FUNC}"
> +
> +	# Policy (i.d): rt-3 inserts the extra SRH consumed by rt-4
> +	sid="$(build_csid_container 1 "${END_CSID_PSP_FUNC}")"
> +	check_and_log_consumed_srh 3 "${sid}" 4 2 1 "${END_CSID_PSP_FUNC}"
> +
> +	set_hs_seg6_enabled 0
> +}
> +
>  test_iproute2_supp_or_ksft_skip()
>  {
>  	local flavor="$1"
> @@ -1102,6 +1354,28 @@ test_kernel_supp_or_ksft_skip()
>  	ip netns del "${test_netns}"
>  }
>  
> +# Before enabling the tests with a consumed SRH, make sure that the rules they
> +# use can be added.
> +check_srh_match_support()
> +{
> +	local srhm_ns
> +
> +	if [ ! -x "$(command -v ip6tables)" ]; then
> +		return
> +	fi
> +
> +	if ! setup_ns srhm_ns; then
> +		return
> +	fi
> +
> +	if add_srh_check_rules "${srhm_ns}" "${IPv6_TESTS_ADDR}" \
> +		&>/dev/null; then
> +		HAS_SRH_MATCH=true
> +	fi
> +
> +	cleanup_ns "${srhm_ns}"
> +}
> +
>  test_dummy_dev_or_ksft_skip()
>  {
>  	local test_netns
> @@ -1145,6 +1419,7 @@ test_dummy_dev_or_ksft_skip
>  # supports PSP also supports NEXT-C-SID.
>  test_iproute2_supp_or_ksft_skip psp
>  test_kernel_supp_or_ksft_skip psp
> +check_srh_match_support
>  
>  set -e
>  trap cleanup EXIT
> @@ -1156,5 +1431,6 @@ router_tests
>  host2gateway_tests
>  host_srv6_end_flv_psp_tests
>  host_srv6_end_flv_next_csid_psp_tests
> +host_srv6_end_flv_consumed_srh_tests
>  
>  print_log_test_results
> -- 
> 2.43.0
> 

Tested-by: Hangbin Liu <liuhangbin@kylinos.cn>
Reviewed-by: Hangbin Liu <liuhangbin@kylinos.cn>
