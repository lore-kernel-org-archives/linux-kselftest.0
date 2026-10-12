Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DABC037B41E;
	Mon, 12 Oct 2026 19:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791833194; cv=none; b=kOltEfqw6T9A1/fjF95lmQy32uVOYDtyIbE+7Ff/P5witonDpG5Q9f8M6j33as8uJpMJlL7aHTmd/dt5oUv3REtHEj6tmmUwAVfcHmjKTIyL3WCwqJ9a1T5yxpn8doyrXLcIP2V6aWU9NSjntUPWlszMzBO92YIU3O3GNvIZMUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791833194; c=relaxed/simple;
	bh=MI8FBv3ZLeAWsD3GgiB7oP7eDzEv714+Cesghwwu6lw=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=M5DWeEvyjxNAKDb+RGyZ4Z5gcau00TJHPNDT+A0JGI25xwDBsS4jLWCU+qbU1BJx7wINu3b64CqXo+v7npVAAe1QBezItHAvCJa6CKMjA+NlxPrkGp60N4lO8+Tvu4Yw9lLtxjE0W2w2bsCY/XV1Dwv9792ZIDK7ebjmv2nIu/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KZfYx/Yb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KZfYx/Yb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6BDD1F0089B;
	Mon, 12 Oct 2026 19:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791833192;
	bh=0020vnQWwqXZ2vQ5kKSIywm1OiEyD3J0aXV405czT4c=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=KZfYx/YbUBwW/L7fQm/QxGdzuXlDR+BmJRN/VF1VBBy3uhyVj8BPTeyJpkEfswSb2
	 KjgFa570gRl9o1a6O052x3XBWXAvTxWbDV8UlMkxaD+iOzSSz2vToTfsHXuE10w+FM
	 cyxIkgsG4gpblpFwLhvRD4thyW6y2dYPnsr1akZI2TJFFy5REy388chM9Z/qTzuSNU
	 /rgzHsWEmMj8T0RWAsmydQR51F0UpcNTeu0K/00/NebtQdNDXC91j5qFcQ0T+Yt6o0
	 NLhAZuYKFfN4OonXRMRByHpOiCuHtwg9ELL7ot1sAIh9any0LcYN6KqbPNJufN7Fc0
	 jWSXcOGtyr2aQ==
Subject: Re: [PATCH net-next 5/5] selftests: seg6: add tests for PSP with a
 consumed SRH
From: netdev-bot+sashiko@kernel.org
To: andrea.mayer@uniroma2.it
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, dsahern@kernel.org, horms@kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, shuah@kernel.org, hangbin.liu@linux.dev,
 justin.iurman@gmail.com, nicolas.dichtel@6wind.com, ahabdels@cisco.com,
 stefano.salsano@uniroma2.it
Date: Mon, 12 Oct 2026 19:26:31 +0000
Message-ID: <179183319121.434549.16235006579764445540@kernel.org>
In-Reply-To: <20261011192310.55-6-andrea.mayer@uniroma2.it>
References: <20261011192310.55-6-andrea.mayer@uniroma2.it>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The consumed-SRH tests in
  host_srv6_end_flv_consumed_srh_tests()…
- [Low] setup_rt_consumed_srh() runs `ip -netns ... -6 route add "${sid}"
  table 90 encap seg6 mode inline segs ... dev dum0` and does not check…

--

selftests: seg6: add tests for PSP with a consumed SRH

This extends srv6_end_flavors_test.sh with tests for the SRv6 End behavior
with the PSP flavor, alone and with NEXT-C-SID, on packets that carry a
consumed SRH in front of the SRH to process. A router on the path inserts an
extra SRH through a seg6 inline route, and another router consumes it. A test
passes if the ping succeeds while seg6_enabled is set to 1 on the hosts.

> diff --git a/tools/testing/selftests/net/srv6_end_flavors_test.sh b/tools/testing/selftests/net/srv6_end_flavors_test.sh
> index baa1b09a1aab3..b5dbf53a7f238 100755
> --- a/tools/testing/selftests/net/srv6_end_flavors_test.sh
> +++ b/tools/testing/selftests/net/srv6_end_flavors_test.sh

[ ... ]

> @@ -258,6 +257,60 @@

[ ... ]

> +#  - rt-2 (End with PSP) skips the extra SRH, processes the Policy's SRH and
> +#    removes it:
> +#      IPv6 DA=cafe::2 | extra SRH, SL=0 | Payload
> +#
> +# The extra SRH reaches hs-2, which skips it as its SL is 0. The other
> +# Policies work in the same way:

[ ... ]

> +# The hosts need seg6_enabled set to 1 to accept the extra SRH, and it is set
> +# back to 0 at the end. These tests only check that the ping succeeds: PSP
> +# itself is checked by the PSP flavor and NEXT-C-SID,PSP tests, which run with
> +# seg6_enabled set to 0.

[Severity: Medium]
If rt-2 removes the wrong SRH, or no SRH at all, would these tests notice?

The commit message says the router connected to the host "must then remove
only the Policy's SRH". The comment above expects
"IPv6 DA=cafe::2 | extra SRH, SL=0 | Payload" to reach hs-2.

However, in host_srv6_end_flv_consumed_srh_tests(), set_hs_seg6_enabled 1
enables both all.seg6_enabled and veth0.seg6_enabled on the hosts. Ping
success is the only pass condition.

With seg6_enabled set, the host skips any SRH whose SL is 0:

net/ipv6/exthdrs.c:ipv6_srh_rcv() {
    ...
	if (hdr->segments_left == 0) {
		...
		opt->srcrt = skb_network_header_len(skb);
		...
		skb->transport_header += (hdr->hdrlen + 1) << 3;
		...
		return 1;
	}
    ...
}

So two possible kernel regressions on the multi-SRH path would still pass:

  - end_flv8986_core() takes srhoff from the first routing header instead of
    the one found with IP6_FH_F_SKIP_RH. seg6_pop_srh() then removes the
    consumed SRH at offset 40 and leaves
    "IPv6 | Policy's SRH, SL=0 | ICMPv6".

  - PSP falls back to plain End without calling seg6_pop_srh(), which leaves
    "IPv6 | extra SRH, SL=0 | Policy's SRH, SL=0 | ICMPv6".

In both cases ipv6_srh_rcv() skips each SL=0 SRH, the echo request is
delivered, and the ping succeeds.

The comment and the commit message say "PSP itself is checked by the PSP
flavor and NEXT-C-SID,PSP tests". Those tests only carry a single SRH, so
srhoff is always sizeof(struct ipv6hdr). They never pick an SRH at
srhoff > 40, and they never run the positional nexthdr fix-up in the else
branch of seg6_pop_srh():

	if (srhoff == sizeof(*iph)) {
		iph->nexthdr = srh_nexthdr;
	} else {
		...

Could a host-side check of what is left in the packet close this gap? One
option is an ip6tables "-m srh" match on the host's veth0. It would accept
only a first SRH with --srh-last-entry-eq 1 and --srh-next-hdr 58.

[ ... ]

> @@ -967,6 +1020,92 @@ host_srv6_end_flv_next_csid_psp_tests()

[ ... ]

> +setup_rt_consumed_srh()
> +{
> +	local rt="$1"
> +	local sid="$2"
> +	local end_rt="$3"
> +	local nsname
> +
> +	nsname="$(get_rtname "${rt}")"
> +
> +	ip -netns "${nsname}" -6 route \
> +		add "${sid}" table "${LOCALSID_TABLE_ID}" \
> +		encap seg6 mode inline \
> +		segs "${LOCATOR_SERVICE}:${end_rt}::${END_FUNC}" \
> +		dev "${DUMMY_DEVNAME}"
> +}

[Severity: Low]
Should setup_rt_consumed_srh() check the exit status of this ip route add?

The test body runs with set +e, so a failure here is ignored. Without the
route, the extra SRH is never inserted.

The packet would then follow the plain Policy path that the earlier PSP and
NEXT-C-SID tests already cover. The ping would succeed, since the hosts have
seg6_enabled=1. log_test would then record a pass for the consumed SRH case
without running that path.

I could not find a way for this route add to fail in the current topology.
setup() already uses the same features under set -e, so this is a
robustness question more than a confirmed failure.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261011192310.55-1-andrea.mayer%40uniroma2.it
