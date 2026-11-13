Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794531646;
	b=CXAqVJFQkWlPNzavXQOM3tA6JpymVWD8Merot7nkt0bxFa02ISrA5k67XtSHMeY7x03c
	 MgRKW69mbZu1WVgK2HaSTARWMm4z2Z9rjoBa2k2CImKUkHFVFRzLNfjVBFR1MzVoPQWI4
	 1JAOU7HLKVk2npqWytg9RFrx5nBB7hQbs+JPyPat/cM7fmdQkMaDO3YMgg95IakpDSjOw
	 KLTAClEeiLp23WdY14lkIfdE0o4DIUPKISOgO7zsKZO/E72LGpiAxigpZ9gU4vaSghrvx
	 mg1A7ACswvlvYhXi4GSxcFstAslWFxGnBmt+lJedQpE/9bJIcLUb+nr4UJXOMjIPHcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794531646;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=tmxNwd2FIpFrYYh/VXNA1Bo9YalF0nsEXQAielTnSqE=;
	b=0LOqKXAJ3TmSzBD1iQxKpVDQTIpawA1DRn3Vc0jxZQRi8M0eL+CzWKOl1gbWGwVS8cHx
	 +kq7C6qTk1l1QgR9ifeQM8ga2uo2ZdPBpqLsbHFjBDkqEVd0hxQXbzJ5s2vPaoiJCNQLH
	 9UszlsmBk1CGW3izV97o2iC5/xnTO07ee6p/dBcxIR3C6iwd4nL5DBAVA9Fp6rEVP8pjw
	 awsxwyvkp+7cTNeF18MUbvNPXw+YWP9vN9T+zo0GRqDF3tXQ0qDX+3owdtBLzc1cdgoZo
	 VWWaVIQ0drVCOfCQWPBK5wEb+K5fb6QQbcqc1//l5//PYMmdUH/iHSulquK3HTdFyBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=he4J2CzQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62342606A895;
	Fri, 13 Nov 2026 01:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=he4J2CzQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D0D11F000CA;
	Fri, 13 Nov 2026 01:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794531646;
	bh=tmxNwd2FIpFrYYh/VXNA1Bo9YalF0nsEXQAielTnSqE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=he4J2CzQD4FdV/I9gcXrpp63tA+LzkYqssGPu9mOcqxJd3y6b8NqfYjUnF4eBqn4H
	 7oEKWNZMyf4EXm1PWnRwKEJieY4fnXfJmZmrtbOu/yd1ZQR8u2M3j+Y3szKGXO8hkE
	 CSaTG+imraUeD+4cSvP0QdldG4ta7LVSVsqrRVMINwayLvEXAU3ZgDRoaDZdjz8/o3
	 Cdy+3sJ2CAeE/IzWA8L0AltVEYEaaQn/jUjtqvoEoEXhCLBoW/Z4OBm3X/oATBE4ay
	 N7+WAEKvDRt3eCQofY7w0U9xzKa+MjVfVQ4l8u0QefED4pGnCRQQbjvPdLoK2WsUdd
	 GMgnMmg9ZNndA==
Subject: Re: [PATCH net-next v2 3/3] selftests: net: pmtu: Add IPv6 and
 asymmetric multipath tests
From: netdev-bot+sashiko@kernel.org
To: deliran@verdict.gg
Cc: dsahern@kernel.org, idosch@nvidia.com, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 shuah@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Date: Fri, 13 Nov 2026 01:00:44 +0000
Message-ID: <179453164495.2199510.14113458326176853537@kernel.org>
In-Reply-To: <20261110095903.84813-4-deliran@verdict.gg>
References: <20261110095903.84813-4-deliran@verdict.gg>
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

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 2 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] In test_pmtu_ipvX_mp_asym_exceptions()
  (tools/testing/selftests/net/pmtu.sh, IPv4 branch), the return routes…
- [Medium] In the IPv6 branch, mp_flow_via()
  (tools/testing/selftests/net/pmtu.sh) depends on `ip route get ${dst}…
- [Low] mp_flow_via() returns a decimal flow label (`flow="${i}"`, i in
  1..32).

--

selftests: net: pmtu: Add IPv6 and asymmetric multipath tests

This patch makes pmtu_ipv4_mp_exceptions family agnostic and adds an IPv6
variant. It also adds IPv4 and IPv6 multipath tests with asymmetric MTUs
(1400 behind R1, 1300 behind R2). These pick a flow through each router,
using a source address for IPv4 and a flow label for IPv6, and check that
the PMTU exceptions on both paths get updated.

> diff --git a/tools/testing/selftests/net/pmtu.sh b/tools/testing/selftests/net/pmtu.sh
> index c7cd271714ef7..6eb79cb76db71 100755
> --- a/tools/testing/selftests/net/pmtu.sh
> +++ b/tools/testing/selftests/net/pmtu.sh

[ ... ]

> @@ -2395,18 +2487,126 @@ test_pmtu_ipv4_mp_exceptions() {

[ ... ]

> +mp_flow_via() {
> +	family="${1}"
> +	dst="${2}"
> +	oif="${3}"
> +
> +	for i in $(seq 1 32); do
> +		if [ ${family} -eq 4 ]; then
> +			flow="${host4_a_net}.${i}"
> +			${ns_a} ip addr add ${flow}/32 dev lo 2>/dev/null
> +			out="$(${ns_a} ip route get ${dst} from ${flow} 2>/dev/null)"
> +		else
> +			flow="${i}"
> +			out="$(${ns_a} ip route get ${dst} from ${host6_a_addr} \
> +				ipproto 58 flowlabel ${flow} 2>/dev/null)"

[Severity: Medium]

What happens here if the installed iproute2 doesn't support the flowlabel
keyword for ip route get? stderr goes to /dev/null, so every iteration
returns empty output. The " dev ${oif} " pattern never matches, and
mp_flow_via() returns 1 after 32 iterations.

test_pmtu_ipvX_mp_asym_exceptions() then runs:

    err "  no flow through veth_A-R1 found"; return 1;

So pmtu_ipv6_mp_asym_exceptions would be reported as a failure instead of
$ksft_skip. The error message also points away from the real cause.

Other selftests check for this first. For example, fib_rule_tests.sh runs:

    fib_check_iproute_support "flowlabel" "flowlabel"

before it uses flowlabel. Could a similar check go here, returning
$ksft_skip when the keyword isn't supported?

> +		fi
> +		case "${out}" in
> +		*" dev ${oif} "*)
> +			echo "${flow}"
> +			return 0
> +			;;
> +		esac
> +	done
> +
> +	return 1
> +}
> +
> +test_pmtu_ipvX_mp_asym_exceptions() {

[ ... ]

> +	if [ ${family} -eq 4 ]; then
> +		# Routes back to the source addresses mp_flow_via() picks
> +		run_cmd ${ns_r1} ip route add ${host4_a_net}.0/24 via ${prefix4}.${a_r1}.2
> +		run_cmd ${ns_r2} ip route add ${host4_a_net}.0/24 via ${prefix4}.${a_r2}.2
> +	fi

[Severity: Medium]

Are these gateways right? The addressing comment in pmtu.sh gives ID 1 to
hosts and ID 2 to routers. That makes ${prefix4}.${a_r1}.2 R1's own address
on veth_R1-A, not host A's.

In this same patch, setup_multipath() routes the routers back to host A
through the .1 address:

    nh_r1_a=${prefix4}.${a_r1}.1
    ...
    nh_r2_a=${prefix4}.${a_r2}.1

The kernel still accepts a local address as the gateway.
fib_check_nh_v4_gw() allows RTN_LOCAL and sets the nexthop scope to
RT_SCOPE_HOST. rt_set_nexthop() only uses the gateway when the scope is
RT_SCOPE_LINK. So the route acts as an on-link route, and R1/R2 send ARP
requests for 192.168.97.N directly.

That address is on host A's lo, not on veth_A-R1 or veth_A-R2. Host A only
answers the ARP when arp_ignore is 0. pmtu.sh never sets arp_ignore, and new
namespaces inherit the IPv4 devconf from init_net by default.

On a host with net.ipv4.conf.all.arp_ignore >= 1, wouldn't the ICMP
fragmentation needed from R1 and the echo replies both be dropped? The test
would then fail with "PMTU exception wasn't created after exceeding MTU via
R1 (veth_A-R1)", and the R2 step would hit the same problem.

Should these be ${prefix4}.${a_r1}.1 and ${prefix4}.${a_r2}.1 instead?

[ ... ]

> +	flow_r1="$(mp_flow_via ${family} ${dst} veth_A-R1)" || {
> +		err "  no flow through veth_A-R1 found"; return 1; }
> +	flow_r2="$(mp_flow_via ${family} ${dst} veth_A-R2)" || {
> +		err "  no flow through veth_A-R2 found"; return 1; }
> +	if [ ${family} -eq 4 ]; then
> +		ping_r1="${ping} -I ${flow_r1}"
> +		ping_r2="${ping} -I ${flow_r2}"
> +	else
> +		ping_r1="${ping} -I ${host6_a_addr} -F ${flow_r1}"
> +		ping_r2="${ping} -I ${host6_a_addr} -F ${flow_r2}"
> +	fi

[Severity: Low]

mp_flow_via() returns a decimal flow label (flow="${i}", with i from 1 to
32), and that string goes unchanged to ping -F here. ping documents -F as
the flow label in hex, and older iputils ping6 builds parse it as base 16.

If the first matching label is 10 or higher, wouldn't the label on the wire
differ from the one probed with ip route get? For example, "10" becomes
0x10. The IPv6 multipath hash includes the flow label, so the echo request
could take the other nexthop, and the 1400/1300 checks would fail.

This depends on how the installed iputils and iproute2 parse the value. The
multipath hash seed is also random per boot, so failures would be
intermittent.

Would passing the label with a 0x prefix to both tools remove the ambiguity?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261110095903.84813-1-deliran%40verdict.gg
