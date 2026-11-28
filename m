Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795859325;
	b=hPsRLj5o9p2lAXj09c1Hu/E7pNWM4qTc8pqe4G4cuPYvCjXkRhbCehwB81qZnC4n6CDH
	 pW8IeRdmcXRfSprA6CU8RHy8TK7GpG4twgUwpOFFjJbU5CVlummzFHADVkVSatCkoGdKw
	 8zIydrYksfDv5t19IjverroHCueWtbB4I/CLsPnO5Za3USrCDwbU6neWX81wpJi46nWe6
	 zn4diAImv8Fgdja6nOmGNS5BSB+Qs17PwJzfQzCNZ9FhgO+f/Zw4rS3HEjpGrfEx2T76o
	 oAGiG/+7WJ88In3d6n1ZC8OKfrLLmlgmXDJNC51IgfoRS11ywoO2Wva8ITy9v9lYnSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795859325;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=AXbs4Y08RfwAdusG9LPgruxTER1AdJ9w1oDDyOdB+wY=;
	b=NIvMAAGIZ/f3ZpDpGbO5J3C1Yz74e1wymsOLnZeXUZ3/CGivdyfMw4ysTsaTaJBSe4UF
	 LeC4X5YYf+rMoejU17yaj1mMal0tDxv0DNvndUSCCc3ORyIOjUfJALKOCHNaFEGpBB4XQ
	 9lQbOL+YQDQ9ZmFOvRtsOioENHYG9uS7c4aH6WO2hstONupHPKMOwq4oGX6be7CiLv4P6
	 pRpJ3Unt5jUV4MZjtwyeoi1oKiJiSDhoA5F+M4nQHCcM3SB8UV1q5Wk8caGhAxKSyz3dc
	 5fSOVjyXpeuWRl+oUwGR3QW3PU5cQLO+02nrnNC4T5JpX7qm2FDa3C47K7Evjurxk8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EjK+TqbK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30414606A68F;
	Sat, 28 Nov 2026 09:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EjK+TqbK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 473B91F00931;
	Sat, 28 Nov 2026 09:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795859325;
	bh=AXbs4Y08RfwAdusG9LPgruxTER1AdJ9w1oDDyOdB+wY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=EjK+TqbKBdErilQiW5SmS7G9BzOd3iZmeaxs453dYf/bMoFwykR/gjilX0eBPNP0v
	 /nDeuzYXulGwZE/NQQASHoCLDFKjcgDdI1pDtkKDGj911SLL+89A/JFio2I2ZMfPh5
	 7r1Y51nFV0ABdA8afZTL4tAMCdf1KnKSTbMcufFsspwNuyu3VbYtXEPtwCkEJcvg/L
	 IQELL9KLxxSgHUTrxmgHysrOWrK/OFZ43f2EkF1bKoC/4idI00VpvwQlpKDLoxO8o0
	 q8CD1YVCbc63beeqXsY7lUXSHsYPLNNSQ0sBiGI0ptgzcUGYBQ59x9mWXMSUS9la1t
	 2xeiqO/o5ZIzg==
Subject: Re: [PATCH net-next v3 12/12] selftests: net: add amt_gw_v6.sh for
 the IPv6 netlink attributes
From: netdev-bot+sashiko@kernel.org
To: omar@blockcast.net
Cc: ap420073@gmail.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, shuah@kernel.org,
 horms@kernel.org, netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, willemb@google.com
Date: Sat, 28 Nov 2026 09:48:43 +0000
Message-ID: <179585932383.3135.977907655234165301@kernel.org>
In-Reply-To: <20261127094703.3025517-13-omar@blockcast.net>
References: <20261127094703.3025517-13-omar@blockcast.net>
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] In tools/testing/selftests/net/amt_gw_v6.sh,
  probe_v6_gateway() exits the whole script with $ksft_skip whenever the…
- [Low] The new selftest tools/testing/selftests/net/amt_gw_v6.sh gives a
  reason for adding the IPv6 address with `nodad` (line 158: "# nodad: a…

--

selftests: net: add amt_gw_v6.sh for the IPv6 netlink attributes

This adds a netlink-only selftest for the AMT IPv6 attributes
IFLA_AMT_LOCAL_IP6 and IFLA_AMT_DISCOVERY_IP6. It checks that gateway and
relay addresses read back through amt_fill_info(), and that invalid
combinations are rejected with the expected extack message. A probe skips
the test when iproute2 or the kernel lacks IPv6 AMT support.

> diff --git a/tools/testing/selftests/net/amt_gw_v6.sh b/tools/testing/selftests/net/amt_gw_v6.sh
> new file mode 100755
> index 0000000000000..38858cbc9d3b8
> --- /dev/null
> +++ b/tools/testing/selftests/net/amt_gw_v6.sh
> @@ -0,0 +1,210 @@

[ ... ]

> +probe_v6_gateway()
> +{

[ ... ]

> +	if ! add_amt amtprobe mode gateway local "$V6_LOCAL" \
> +	     discovery "$V6_DISC"; then
> +		case "$ADD_ERR" in
> +		*"binary attribute size out of range"*)

[ ... ]

> +	fi
> +	got=$(amt_field amtprobe discovery)
> +	ip -n "$GW" link del amtprobe
> +	if [[ "$got" != *:* ]]; then
> +		# The attributes are exactly four bytes, so this is an iproute2
> +		# that truncated the literal to an IPv4 address, or prints the
> +		# IPv6 one under another key. Four truncated bytes cannot be
> +		# told from a real IPv4 address, and the kernel did what it
> +		# should.
> +		echo "SKIP: iproute2 lacks IPv6 AMT support (read back '$got')"
> +		exit "$ksft_skip"
> +	fi
> +}

[Severity: Medium]
Could this check report a regression in amt_fill_info() as a skip?

With this series, amt_policy uses NLA_POLICY_EXACT_LEN(sizeof(__be32)) for
IFLA_AMT_LOCAL_IP and IFLA_AMT_DISCOVERY_IP. The "binary attribute size out
of range" branch above already catches a 16-byte value in an IPv4
attribute. So if add_amt succeeds here, the kernel has received
IFLA_AMT_DISCOVERY_IP6 and built an IPv6 gateway.

Suppose amt_fill_addr6() stopped emitting this attribute, or emitted the
IPv4 IFLA_AMT_DISCOVERY_IP in its place:

drivers/net/amt.c:amt_fill_addr6() {
    ...
	if (amt->mode == AMT_MODE_GATEWAY &&
	    nla_put_in6_addr(skb, IFLA_AMT_DISCOVERY_IP6, &amt->discovery_ipv6))
		return -EMSGSIZE;
    ...
}

Then got would be '' or '0.0.0.0', and the whole script would exit with
$ksft_skip before test_v6_gateway_roundtrip() runs. That function's check:

	[ "$(amt_field amtg6 discovery)" = "$V6_DISC" ]
	check_err $? "discovery did not read back as $V6_DISC"

can therefore never fail because the readback is missing or IPv4. The
commit message says the test checks that the IPv6 discovery address reads
back through amt_fill_info(), and this check does not fully cover that.

The skip is meant for an older kernel that truncates the address, where
2001:db8:a::2 reads back as 32.1.13.184. Could it match that value instead
of any readback without a colon?

[ ... ]

> +trap cleanup_all_ns EXIT
> +setup_ns GW || exit "$ksft_skip"
> +ip -n "$GW" link add gw_dev type dummy
> +ip -n "$GW" link set gw_dev up
> +ip -n "$GW" addr add "$V4_LOCAL/24" dev gw_dev
> +# nodad: a tentative source address would race link creation.
> +ip -n "$GW" addr add "$V6_LOCAL/64" dev gw_dev nodad

[Severity: Low]
Is the reason in this comment accurate?

amt_newlink() checks only the syntax of IFLA_AMT_LOCAL_IP6. It rejects
loopback, any, multicast and v4-mapped values. It never checks whether the
address is assigned to an interface or still tentative.

The encapsulation socket is created only by
amt_dev_open()->amt_socket_create()->amt_create_sock(), and for IPv6 it
binds to :: in any case. This script never brings an amt device up. So
there seems to be no race between DAD and link creation for nodad to avoid.

Separately, the "Not covered" list in the header comment at the top of the
file names only the two duplicate-argument cases: discovery v4 together
with discovery v6, and local v4 together with local v6. The commit message
lists a third case, a 16-byte IFLA_AMT_LOCAL_IP or IFLA_AMT_DISCOVERY_IP.

Should the header comment list that case as well?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261127094703.3025517-1-omar%40blockcast.net
