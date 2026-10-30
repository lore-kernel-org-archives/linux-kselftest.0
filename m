Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793360829;
	b=UAqurKJL2roJ4sVwgWp8qelgDBjPvadoFHy4uZlhhRaVc9K+wZqZUWEHR9OuLe//x+ia
	 y1M/nZ2loB7Vwp4DLC1KefCYF9MqZCtC6eEzbIhp8/8B/+JLCYT8XhGbyuhIsvfier+UJ
	 PPPZP6SE1TR/qLkTdc0nb2UxgoioodK+AtySM+pvlzyZd72rN1iDvby4YpwuUA/PEgw2e
	 1AX6Y+yKrwdFIJJ/hu8OqDiL2DxYelU5zyJRDqcKv5sXA6iTS5GMpHP6pAZRiJwE4SM93
	 n/U4N4f0wOtDp3wr3ZumPS6Z37QoXh9OxJewtidwOgi96Mi1S/0wu11tIbu9YP/k1cQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793360829;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=xFqGwbDc/ZISyvtgD022O2EhfQ27gF1dVFuSLHm9Ym0=;
	b=Zx8xzxvDHjEhm8h9RkxrlObe9bfrBuqE1x2SAU+gxWb+Hk94otMTaVhvv6lDHJYaq60i
	 N1/kjr0DeRzmDqIhmc+ppU5pXpkRtxayPO6PH2SEt4qjVJB/zl3/wMxkOA5EGBI5234X5
	 RZjPJQ/oQ2RErf9dMyctSuWDBVPKJu+9xk+uvzdtr/aCnWyG16npssxG1AXZxVfQkckXB
	 XiqvvmL/li2AKbClHw85IDr3TWhYEGe8U10YgErq1CM9vtbAiNLfjiutzubfiNTE83Arr
	 dLsiU8SNLCKn6WGBtnQyVm3XcGXW2nMfBPkSR7BkldJXNEmYgNzpnLlOMuf+UPT1UMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R3ZxyzQJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF69B606A322;
	Fri, 30 Oct 2026 11:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R3ZxyzQJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90DE51F0093A;
	Fri, 30 Oct 2026 11:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793360828;
	bh=xFqGwbDc/ZISyvtgD022O2EhfQ27gF1dVFuSLHm9Ym0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=R3ZxyzQJzVYcIUfIAU85w4oX0NmLZ9ezV58yFSQ7zwTJdIHqmOGldxeryGtqXMEJW
	 rYQPCJovfHKfQbcZ84Q2437NvkP4aJVdVn9aibmeuR0TlfpHtCJPtxoddcecjEwCT2
	 SuZuA8QMoqOQlTYwIgIt3s7jWt2F+ilwnTHUxl/H3bbF6mvM69ep0jbR9gtzLMBo0D
	 wYZPT8db+GmYkx80Tg05hiRk0Up4id4x/a7W0W9aCNlT87zIyjMuHEwfcBbmOJ3Lzj
	 KiWK4LJMaj6LGX1mJLxvA4Q8Pt5Eq9J5buXZ8AO/4s5Cd9rk47PXlHDDz0G/BND1X0
	 VyVokG4VHtPgg==
Subject:
 Re: [PATCH 1/3] ipv6: route: consider IOAM options in ECMP hash policy 0
From: netdev-bot+sashiko@kernel.org
To: hangbin.liu@linux.dev
Cc: dsahern@kernel.org, idosch@nvidia.com, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 justin.iurman@gmail.com, shuah@kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 liuhangbin@kylinos.cn
Date: Fri, 30 Oct 2026 11:47:07 +0000
Message-ID: <179336082713.3134.17393085405117332504@kernel.org>
In-Reply-To: <20261028-ipv6_ioam_ecmp-v1-1-9b6715b6f4c0@kylinos.cn>
References: <20261028-ipv6_ioam_ecmp-v1-1-9b6715b6f4c0@kylinos.cn>
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

Thank you for your contribution! Sashiko AI review found 5 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 3 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] ip6_nexthdr_without_ioam() (net/ipv6/route.c) reads the Hop-
  by-Hop header at `off = sizeof(*iph)`.
- [Medium] In ip6_multipath_l3_keys(), the outer header of an IOAM-
  carrying packet is now hashed with the recovered L4 protocol…
- [Medium] On IOAM-enabled ingress with a known namespace,
  ipv6_hop_ioam() calls ip6_route_input() while ip6_parse_tlv() is still…
- [Low] The new comment in ip6_nexthdr_without_ioam() says 'The Hop-by-
  Hop header was already pulled and validated by ipv6_parse_hopopts()…
- [Low] In the ip6_nexthdr_without_ioam() TLV loop,
  `skb_header_pointer(skb, off + i, sizeof(obuf), obuf)` fetches 2 bytes…

--

ipv6: route: consider IOAM options in ECMP hash policy 0

This patch adds ip6_nexthdr_without_ioam(). It walks a Hop-by-Hop header
and, if the header holds only IOAM options and padding, returns the
nexthdr that follows it. ip6_multipath_l3_keys() uses that value for the
policy 0 ip_proto key and for its ICMPv6 error check, so that packets
with and without IOAM hash the same way, as RFC 9486 (C2) requires.

> diff --git a/net/ipv6/route.c b/net/ipv6/route.c
> index 94e5ef1c4f83e..d0761f05d3260 100644
> --- a/net/ipv6/route.c
> +++ b/net/ipv6/route.c
> @@ -2342,6 +2342,60 @@ struct dst_entry *ip6_route_input_lookup(struct net *net,

[ ... ]

> +static u8 ip6_nexthdr_without_ioam(const struct sk_buff *skb,
> +				   const struct ipv6hdr *iph)
> +{

[ ... ]

> +	if (iph->nexthdr != NEXTHDR_HOP)
> +		return iph->nexthdr;
> +
> +	/* The Hop-by-Hop header was already pulled and validated by
> +	 * ipv6_parse_hopopts() before routing, so this walk is safe.
> +	 */

[Severity: Low]
Does this comment hold for every caller of rt6_multipath_hash()?

icmp6_send() also hashes the offending skb:

net/ipv6/icmp.c:icmp6_send() {
    ...
	fl6.mp_hash = rt6_multipath_hash(net, &fl6, skb, NULL);
    ...
}

That skb can be generated locally and never pass through
ipv6_parse_hopopts(). One example is a packet built with IPV6_HOPOPTS
or a raw socket that hits a reject or unreachable route:

ip6_pkt_discard_out()->ip6_pkt_drop()->icmpv6_send()->icmp6_send()->
    rt6_multipath_hash()

On IOAM-enabled ingress, ipv6_hop_ioam() calls ip6_route_input() while
ip6_parse_tlv() is still running. So any TLVs after the IOAM option have
not been validated yet:

net/ipv6/exthdrs.c:ipv6_hop_ioam() {
    ...
		if (!skb_valid_dst(skb))
			ip6_route_input(skb);
    ...
}

Today the walk is memory safe only because every access goes through
skb_header_pointer(). With unvalidated input it can also return
hhdr->nexthdr for a malformed HBH header whose TLV lengths run past the
header.

Could the comment be updated to describe what actually makes the walk
safe?

> +	off = sizeof(*iph);
> +	hhdr = skb_header_pointer(skb, off, sizeof(hbuf), &hbuf);

[Severity: Medium]
Does this offset assume that skb->data sits at the network header?

skb_header_pointer() counts the offset from skb->data. iph is
ipv6_hdr(skb), i.e. skb_network_header(). The two only agree when
skb->data has not been pulled past the network header.

They do not agree when icmp6_send() is called from the L4 receive paths.
By then ip6_protocol_deliver_rcu() has already pulled to the transport
header:

net/ipv6/ip6_input.c:ip6_protocol_deliver_rcu() {
    ...
		if (!pskb_pull(skb, skb_transport_offset(skb)))
    ...
}

icmp6_send() then hashes the offending skb with policy 0:

__udp6_lib_rcv()->icmpv6_send()->icmp6_send()->rt6_multipath_hash()->
    ip6_multipath_l3_keys()->ip6_nexthdr_without_ioam()

icmp6_send() already handles this when it quotes the packet:

	msg.offset = skb_network_offset(skb);

The ICMPV6_UNK_NEXTHDR parameter problem in ip6_protocol_deliver_rcu()
and the tunnel6/xfrm6 errors take the same path. If the offending
packet has nexthdr == NEXTHDR_HOP (even PadN only), the helper treats
the bytes 40 past the L4 header as the HBH header and its TLVs. Those
bytes are payload controlled by the sender.

If the packet has a real IOAM-only HBH header, the locally generated
ICMP error is still hashed with proto 0. That is the mismatch this patch
sets out to fix.

A crafted payload can also make the helper return any nexthdr, including
IPPROTO_ICMPV6. ip6_multipath_l3_keys() then reads the UDP header at
transport offset 0 as an icmp6hdr. If the high byte of the source port
is 1-4, icmpv6_is_err() passes and the UDP payload is used as the inner
ipv6hdr. The payload then picks the addresses, flow label and proto
used as ECMP hash keys.

Before this patch, HBH packets never reached this parsing. All reads are
bounded by skb_header_pointer(), so the result is wrong hash input, not
an out-of-bounds access.

Would using skb_network_offset(skb) + sizeof(*iph) as the base offset
avoid this? The follow-up patch in the series only changes
ioam6_iptunnel.c and the selftests, so route.c is unchanged after it.

> +	if (!hhdr)
> +		return iph->nexthdr;
> +
> +	len = (hhdr->hdrlen + 1) << 3;
> +
> +	for (i = 2; i < len; ) {
> +		opt = skb_header_pointer(skb, off + i, sizeof(obuf), obuf);
> +		if (!opt)
> +			return iph->nexthdr;
> +		if (opt[0] == IPV6_TLV_PAD1) {
> +			i++;
> +			continue;
> +		}

[Severity: Low]
Can a trailing Pad1 make this 2-byte fetch fail?

ip6_parse_tlv() accepts Pad1 as the last byte of the HBH header, because
the Pad1 branch continues before the len < 2 check:

net/ipv6/exthdrs.c:ip6_parse_tlv() {
    ...
		if (nh[off] == IPV6_TLV_PAD1) {
			padlen++;
			if (padlen > 7)
				goto bad;
			off++;
			len--;
			continue;
		}
		if (len < 2)
			goto bad;
    ...
}

Suppose an IOAM-only HBH header ends in Pad1 and nothing follows it in
the skb, e.g. nexthdr is NEXTHDR_NONE with no payload. The fetch at
off + len - 1 needs one byte past skb->len, so it returns NULL. The
function then returns iph->nexthdr (0) even though has_ioam is true.
This packet then hashes differently from the same packet without IOAM.

Would it work to read one byte first and fetch the length byte only for
options other than Pad1?

[ ... ]

> @@ -2353,8 +2407,10 @@ static void ip6_multipath_l3_keys(const struct sk_buff *skb,
>  	const struct icmp6hdr *icmph;
>  	struct ipv6hdr _inner_iph;
>  	struct icmp6hdr _icmph;
> +	u8 nexthdr;
>  
> -	if (likely(outer_iph->nexthdr != IPPROTO_ICMPV6))
> +	nexthdr = ip6_nexthdr_without_ioam(skb, outer_iph);
> +	if (likely(nexthdr != IPPROTO_ICMPV6))
>  		goto out;
>  
>  	icmph = skb_header_pointer(skb, skb_transport_offset(skb),

[Severity: Medium]
On IOAM-enabled ingress, where does skb_transport_offset(skb) point
when this code runs?

For a known namespace, ipv6_hop_ioam() calls ip6_route_input() from
inside ip6_parse_tlv(). ip6_rcv_core() has set transport_header to the
HBH header:

	skb->transport_header = skb->network_header + sizeof(*hdr);

ipv6_parse_hopopts() moves it past the HBH header only after
ip6_parse_tlv() returns:

	skb->transport_header += extlen;

Take an ICMPv6 error with an IOAM-only HBH header.
ip6_nexthdr_without_ioam() now returns IPPROTO_ICMPV6, but icmph is read
from the HBH header itself. icmp6_type is then the HBH nexthdr (58), and
icmpv6_is_err(58) is false.

The error is therefore hashed on its outer addresses with proto 58. The
same error without IOAM would be hashed on the quoted inner header.
ip6_rcv_finish_core() only routes when !skb_valid_dst(skb), so this
early dst stays in place.

On IOAM transit nodes, does this match what the commit message claims?

  "and use it for the policy-0 key and for the ICMPv6-error
  check, so errors that quote a flow keep hashing that flow."

No later patch in the series addresses this.

[ ... ]

> @@ -2383,7 +2439,14 @@ static void ip6_multipath_l3_keys(const struct sk_buff *skb,
>  		keys->addrs.v6addrs.src = key_iph->saddr;
>  		keys->addrs.v6addrs.dst = key_iph->daddr;
>  		keys->tags.flow_label = ip6_flowlabel(key_iph);
> -		keys->basic.ip_proto = key_iph->nexthdr;
> +		/* Only for the outer header: an ICMPv6-quoted inner header
> +		 * is payload, and its (possibly truncated) extension
> +		 * headers must not be walked here.
> +		 */
> +		if (key_iph == outer_iph)
> +			keys->basic.ip_proto = nexthdr;
> +		else
> +			keys->basic.ip_proto = key_iph->nexthdr;

[Severity: Medium]
Does this give flow packets and the ICMPv6 errors that quote them
different ip_proto keys?

Consider a transit router using policy 0. A flow packet carrying IOAM
reaches this code through fib6_select_path() and is hashed with the
recovered proto, e.g. IPPROTO_TCP. An ICMPv6 error that quotes such a
packet takes the inner branch:

	key_iph = inner_iph;
	_flkeys = NULL;

It then hashes the raw nexthdr of the quoted header, which is
NEXTHDR_HOP (0).

Before this patch, when IOAM was present in both directions, both sides
hashed proto 0 and matched. Now they differ, so an error such as Packet
Too Big can go to a different ECMP sibling than the flow. Commit
23aebdacb05d ("ipv6: Compute multipath hash for ICMP errors from
offending packet") hashes ICMP errors on the inner header so that the
two would match.

This seems to contradict the commit message:

  "so errors that quote a flow keep hashing that flow."

The stated reason for not walking the quoted header is truncation.
However, every access in ip6_nexthdr_without_ioam() goes through
skb_header_pointer(), is bounded by skb->len, and falls back on failure.

Could the helper take a base offset and also be used for the quoted
header? No later patch in the series changes this.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261028-ipv6_ioam_ecmp-v1-0-9b6715b6f4c0%40kylinos.cn
