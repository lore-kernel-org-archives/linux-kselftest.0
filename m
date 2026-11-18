Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795044510;
	b=uHEg4SBDo4pezoMHOZBZSzrw47OUpEDiFjX7gRhYWkf1BLiZhDUjWrkqUvJ5jmo4BW/w
	 z3T+Xq3WeubC6KgwOfhzzlpQbGagYWLCrvGHnF5Mto0PrZ6fRYitvtJgFAhApdeuGuVOW
	 ZFB17oNqEel/Aa9x/Rs9k9wB5/ZXI3U9buTDpE8CoM/AK64+B4I77xu+QQRf1wDXmVxjF
	 NjgIhjC1RZsZtRtC8aiBDsrz6VY3xeVZHQ4Zi1gtT71ODRqw9teP6VdN5nsQR7eN9g+0c
	 EDkw+sF1cMFhde60fZgZA3wNprElbFnfMCcf9OuSgAv5OgfcWwh2vfCE/QCtU5vsKVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795044510;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=42eS24J/wdes5NYfE1ICdoKblrDN9TrgTc0Is0Cp4uw=;
	b=dADMa6gaPUwWGPHgJl+XrQAlPudptmg5R1TqNkf9DE8NPH+YhyI9tCEIwasP8cbpSwUy
	 ouevh1cVGD7DpTSmQPu43cRgR+SCkLeiiaqOtJ2qmI+y/cwMBzHkp2RcqL+Xb1SgFmsgp
	 YIXGGXn0mo+6awogVqWWIPo2r8vyvI97DF8qZwPHJ8g8trDX2L1FizLY1PnBTmJy7XR/q
	 eojvbNSnr19XtpBuSHv4fuRJVcUebnaFI0YdT9h4838AQDcpGsmyy0LXTQV/NBV1IqwXC
	 Iiv5B5007bn79qVG20Ym2bhLMtFh+O/gk6M40PmVCX5bg6gkKbzcHv39xBWR/RIiLcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oGHORxXh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90459606A33A;
	Wed, 18 Nov 2026 23:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oGHORxXh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1FB11F000C9;
	Wed, 18 Nov 2026 23:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795044510;
	bh=42eS24J/wdes5NYfE1ICdoKblrDN9TrgTc0Is0Cp4uw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=oGHORxXhsNglBHxlleB8Sy4Rv5a7tzEyUpnMp3aIhGHQsVf+FxNTSLDnJrIJQyRNO
	 Vpe+PBq3KlZ+Uz92SZiClKA8HqIu6gDN0DR32YrFHAgtxVxkDl/R9GeFCWHPw/o/N2
	 c/2s47t8O4xwpXT7V1orqWvbOCLJJxDHHm+LxeXjXi6JxSjQCzLCPRN3O0vdC+w/d7
	 E/m2ZcZQ/QZHvGYG1NjwjSitc0Cpo5/67TxHlIO8Bm+K1/Ay2QHAusmY9QiPXw9X1F
	 /OA2lvMs919CPH/VQB78zi02YBmHHd7nl4/BjEVkgnHi7EoibJVpLbZyvKOAW0vFJp
	 nHG6urZXJ8FGA==
Subject:
 Re: [PATCH net-next v5 3/4] selftests: net: test restricted on-link fallback
From: netdev-bot+sashiko@kernel.org
To: liamsmith827@grapheneos.org
Cc: netdev@vger.kernel.org, dsahern@kernel.org, idosch@nvidia.com,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, shuah@kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, liamsmith827@proton.me
Date: Wed, 18 Nov 2026 23:28:29 +0000
Message-ID: <179504450937.3136.13748294351728905758@kernel.org>
In-Reply-To: <20261116202741.13106-4-liamsmith827@grapheneos.org>
References: <20261116202741.13106-4-liamsmith827@grapheneos.org>
X-sashiko-severity: Low
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

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The updated fcnal-test.sh does not exercise much of the behaviour
  that the commit message and the preceding kernel patch claim.
- [Low] The patch says it adjusts the IPv4 tests to the new behaviour,
  but a stale hint is left in ipv4_tcp_novrf().
- [Low] In ipv4_ping_novrf(), the new case "ping out, device bind,
  blocked by unreachable rule" (lines 659-663) adds `ip rule add pref 49…

--

selftests: net: test restricted on-link fallback

This commit updates the IPv4 tests in fcnal-test.sh for the kernel change
that skips the on-link fallback when the FIB lookup hits an unreachable,
blackhole or prohibit route or rule. It changes the expected return codes
for device bound pings and UDP sends to loopback addresses. It also adds
route miss and unreachable rule variants, and re-enables the device bind
cases that had been commented out.

> diff --git a/tools/testing/selftests/net/fcnal-test.sh b/tools/testing/selftests/net/fcnal-test.sh
> index a50609535fedc..7d51fdcc8fdad 100755
> --- a/tools/testing/selftests/net/fcnal-test.sh
> +++ b/tools/testing/selftests/net/fcnal-test.sh

[ ... ]

> @@ -643,10 +656,15 @@ ipv4_ping_novrf()
>  	run_cmd ping -c1 -w1 ${a}
>  	log_test_addr ${a} $? 2 "ping out, blocked by rule"
>  
> -	# NOTE: ipv4 actually allows the lookup to fail and yet still create
> -	# a viable rtable if the oif (e.g., bind to device) is set, so this
> -	# case succeeds despite the rule
> -	# run_cmd ping -c1 -w1 -I ${NSA_DEV} ${a}
> +	log_start
> +	setup_cmd ip rule add pref 49 to ${NSB_LO_IP} unreachable
> +	run_cmd ping -c1 -w1 -I ${NSA_DEV} ${a}
> +	log_test_addr ${a} $? 2 "ping out, device bind, blocked by unreachable rule"
> +	setup_cmd ip rule del pref 49 to ${NSB_LO_IP} unreachable

[Severity: Low]
Does this case show that the unreachable rule blocks the ping by itself?

The rule from earlier in ipv4_ping_novrf() is still installed here:

	setup_cmd ip rule add pref 50 to ${NSB_LO_IP} prohibit

It is only removed after the "blocked by route" block. ping exits with 2
for both ENETUNREACH and EACCES.

Suppose a later change made the pref 49 rule non-terminating, for example
by returning -EAGAIN so that fib_rules_lookup() moves on to the next rule.
The pref 50 prohibit rule would then return -EACCES. Since that is not
-ESRCH, the fallback would not run and the test would still pass.

The test does catch -ENETUNREACH being remapped to -ESRCH. Would it be
cleaner to run this case before the pref 50 rule is added, or to drop
pref 50 while it runs? That would make it self-contained, as the test
name and item 3 of the commit message suggest.

> +
> +	log_start
> +	run_cmd ping -c1 -w1 -I ${NSA_DEV} ${a}
> +	log_test_addr ${a} $? 2 "ping out, device bind, blocked by rule"

[Severity: Low]
Should the coverage here be wider? The commit message says:

  the on-link fallback is no longer taken when the FIB lookup hits an
  unreachable, blackhole or prohibit route/ rule.

The device bind cases added or re-enabled in this patch cover only an
unreachable route, an unreachable default route, a prohibit rule and an
unreachable rule. All of them go through ping -I (SO_BINDTODEVICE).

fcnal-test.sh has no blackhole route or rule anywhere, and no prohibit
route. The only prohibit cases use ip rule.

The IP_UNICAST_IF and IP_PKTINFO loopback cases in ipv4_udp_novrf() also
expected 1 before this patch and still do:

		run_cmd nettest -D -r ${a} -d ${NSA_DEV} -C
		log_test_addr ${a} $? 1 "Global server, device send via cmsg, local connection"
		...
		run_cmd nettest -D -r ${a} -d ${NSA_DEV} -S
		log_test_addr ${a} $? 1 "Global server, device client via IP_UNICAST_IF, local connection"

So they pass whether or not the fallback runs. The preceding kernel patch
names IP_UNICAST_IF and IP_PKTINFO as the paths used to get around a
prohibit rule VPN kill switch.

Could cases for blackhole, a prohibit route, and IP_UNICAST_IF/IP_PKTINFO
against a prohibit rule be added? Without them, the suite would not fail
if the fallback came back on any of those paths.

[ ... ]

> @@ -1613,7 +1625,7 @@ ipv4_udp_novrf()
>  		run_cmd nettest -D -s &
>  		wait_local_port_listen ${NSA} 12345 udp
>  		run_cmd nettest -D -r ${a} -d ${NSA_DEV}
> -		log_test_addr ${a} $? 2 "Global server, device client, local connection"
> +		log_test_addr ${a} $? 1 "Global server, device client, local connection"

[Severity: Low]
Item 5 of the commit message says:

  5. ipv4_udp_novrf(): Connecting to a loopback address while bound to a
  device now fails with an error instead of timing out.

This nettest call has no -U, so it never calls connect(). In nettest.c,
connectsock() returns early for datagram sockets:

	if (args->type != SOCK_STREAM && !args->datagram_connect)
		goto out;

The failure therefore comes from sendto(). Could the wording be made more
precise?

Also, is the hint in ipv4_tcp_novrf() now out of date?

tools/testing/selftests/net/fcnal-test.sh:ipv4_tcp_novrf() {
    ...
	for a in ${NSA_LO_IP} 127.0.0.1
	do
		log_start
		show_hint "Should fail 'No route to host' since addresses on loopback are out of device scope"
		run_cmd nettest -s &
		wait_local_port_listen ${NSA} 12345 tcp
		run_cmd nettest -r ${a} -d ${NSA_DEV}
    ...
}

With the kernel change, the lookup hits the unreachable default metric
8192 route and the fallback is skipped. connect() then fails with
"Network is unreachable" rather than "No route to host". The expected
return code is still 1, so only the verbose mode hint is affected.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261116202741.13106-1-liamsmith827%40grapheneos.org
