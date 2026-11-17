Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794921276;
	b=QcT2Zi98wIHYyTdC/w2YoGgPSc780UWKkq9i+3gpG4RsZmeVUK93y3S261tv7w+D/7KQ
	 uRYhxpOAa4VVMtLZuOhE7MXRYgVYU/Viz/nfMzZ1lVJcNchVf9DIoL1jUiJz5i5htnOHE
	 CntH+26ssJyE3IhfQIzLV20KAFliYL/mOLY3RcV1Spych9Czzjo/uMa5o+5Iyf/DeCgzu
	 /ZHT9nMIJ0ggZhEtM1MTMK5ECHYeqqqXdeEp2oBvbpm5OKN1kKv7QsR/q4dbk8eBev0/h
	 4W9qeTpmKzr5QS/oMNbF7BcIkhQ/zuDXwBL+uy2iuFXqEyTOrPyb2qD3oO8It+yn2mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794921276;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=7cgl7yc5iVLhr224nmSrB4Z3hvi64B3G73hI753Om8A=;
	b=RKZtsuEPTxwN4N0HulNyUofAdJGnQP1GGyB1lCPvTFUlXBUKZXLmXj7c51vn1+UGaBzf
	 hhe8uS0SfFijhFcusR3ULmDlijHdaiBuJFtX2ipLuqeEkHQ5D8VqGAfi25hwukMk7xwLa
	 IqaF/lEIzwdYIvuFbl6TIUGH2haX1NS2rNd8lQacSg1sN7M/VwXvsr4qHw0o+BXf4rsuZ
	 lpUWNVnWEqOFbkLSWGTi16Yt5nv+fDLICkZy51yZ4bboscE5YTpEEMlbNMWpp3wzmrTOI
	 LLHkNRYTuZhjm5DhRHVNk9BUg8pmSfqkWLnvRbF+y4vmbnMvAcEwvli9Ky4Dvl3AxXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="YXpwqc3/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E95B606A88A;
	Tue, 17 Nov 2026 13:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YXpwqc3/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1893D1F000CA;
	Tue, 17 Nov 2026 13:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794921275;
	bh=7cgl7yc5iVLhr224nmSrB4Z3hvi64B3G73hI753Om8A=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=YXpwqc3/3iT0EvXEI7bSEqa4FjMeKnipGuuaNjIDLONGkXTbuXvPUyyhDyyBWXcL7
	 /lsWVPX2OslzTnBvOeamsFrSb7taydNZo+tRZOTkUfZ4+D60ZU5NPn7EprvZE39Cib
	 1TGKcAcCk63CnhhJZeFHaruGXUgpa3vU+dMNENz0XOiSa8HvOzUITpkFFCBw1WQp/q
	 CZuaW1rrR/RrMmYMeI7urkMymzzGeUcI+s5klazsjriSOTKkuYEDRF42b2ZI0uH1l3
	 iNAatOX7/wMwvdPLYmXB7A05Prf0pO1Jh0KFOkKOSrOlqa4J7iSPw8F1tvjfq8hrk7
	 LCc1RiPhScJbQ==
Subject: Re: [PATCH net-next v3 3/3] selftests: net: pmtu: Add IPv6 and
 asymmetric multipath tests
From: netdev-bot+sashiko@kernel.org
To: deliran@verdict.gg
Cc: dsahern@kernel.org, idosch@nvidia.com, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 shuah@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Date: Tue, 17 Nov 2026 13:14:34 +0000
Message-ID: <179492127464.3136.16715840375114819070@kernel.org>
In-Reply-To: <20261113122237.88990-4-deliran@verdict.gg>
References: <20261113122237.88990-4-deliran@verdict.gg>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] In tools/testing/selftests/net/pmtu.sh, the new IPv6 variants
  of setup_multipath_new() and setup_multipath_old() add host6_a_addr…

--

selftests: net: pmtu: Add IPv6 and asymmetric multipath tests

This commit makes pmtu_ipv4_mp_exceptions family agnostic and adds an
IPv6 variant of it. It also adds IPv4 and IPv6 asymmetric multipath
tests. These pick a flow through each router and check which paths get
PMTU exceptions.

> diff --git a/tools/testing/selftests/net/pmtu.sh b/tools/testing/selftests/net/pmtu.sh
> index c7cd271714ef7..2bd132991841a 100755
> --- a/tools/testing/selftests/net/pmtu.sh
> +++ b/tools/testing/selftests/net/pmtu.sh

[ ... ]

> @@ -994,49 +1014,112 @@ setup_ovs_bridge() {
>  }
>  
>  setup_multipath_new() {
> -	# Set up host A with multipath routes to host B host4_b_addr
> -	run_cmd ${ns_a} ip addr add ${host4_a_addr} dev lo
> -	run_cmd ${ns_a} ip nexthop add id 401 via ${prefix4}.${a_r1}.2 dev veth_A-R1
> -	run_cmd ${ns_a} ip nexthop add id 402 via ${prefix4}.${a_r2}.2 dev veth_A-R2
> -	run_cmd ${ns_a} ip nexthop add id 403 group 401/402
> -	run_cmd ${ns_a} ip route add ${host4_b_addr} src ${host4_a_addr} nhid 403
> +	family=${1}
> +
> +	if [ ${family} -eq 4 ]; then

[ ... ]

> +	else
> +		host_a_addr=${host6_a_addr}
> +		host_b_addr=${host6_b_addr}

[ ... ]

> +	fi
> +
> +	# Set up host A with multipath routes to host B host_b_addr
> +	run_cmd ${ns_a} ip addr add ${host_a_addr} dev lo
> +	run_cmd ${ns_a} ip nexthop add id ${family}01 via ${nh_a_r1} dev veth_A-R1
> +	run_cmd ${ns_a} ip nexthop add id ${family}02 via ${nh_a_r2} dev veth_A-R2
> +	run_cmd ${ns_a} ip nexthop add id ${family}03 group ${family}01/${family}02
> +	run_cmd ${ns_a} ip route add ${host_b_addr} src ${host_a_addr} nhid ${family}03

[Severity: Medium]
With family 6, can this route add race against DAD on the lo address?

host6_a_addr is added to lo without nodad, so ipv6_add_addr() marks it
IFA_F_TENTATIVE. addrconf_dad_start() only queues dad_work. The flag is
cleared later, once addrconf_dad_work() takes the rtnl lock and reaches the
IFF_LOOPBACK shortcut in addrconf_dad_begin().

The next command uses that address as the prefsrc. In
ip6_route_info_create_nh() the address is checked like this:

    if (!ipv6_chk_addr(net, &cfg->fc_prefsrc, dev, 0)) {
        NL_SET_ERR_MSG(extack, "Invalid source address");
        err = -EINVAL;

ipv6_chk_addr() bans IFA_F_TENTATIVE. If dad_work hasn't run yet, the route
add fails with "Invalid source address".

The same check covers the legacy nexthop route in setup_multipath_old(),
and the host B routes in both helpers.

The run_cmd return values are ignored. The status of setup_multipath()
comes from the last router route add, so setup() still succeeds even when
host A or B has no multipath route.

Would that lead to spurious failures? Examples would be "no flow through
veth_A-R2 found" in test_pmtu_ipvX_mp_asym_exceptions(), or a missing
exception on veth_A-R2 in pmtu_ipv6_mp_exceptions.

IPv4 has no DAD, so the IPv4-only version of these helpers didn't have
this race. Would adding nodad to the IPv6 lo addresses, as other net
selftests do, avoid it?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261113122237.88990-1-deliran%40verdict.gg
