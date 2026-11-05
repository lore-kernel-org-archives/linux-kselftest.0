Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793881355;
	b=ObIEtZHfuK3We9D35EMhkejuzH8CeAzI08Iu/rxELIf6lgPvo36NOGvnx940nHs98RKS
	 KudpH5zAQHVVYToKxYuQNn5glUpbD6qmnmb8z6AVDetcOViKc8VP6uLULpOVCaYvDJyxE
	 os4gIacFa8Xe+NbZV4bqFrriPH+QMbNB8ox4l0/1UJH7mTOWF5MM05vYrNhS0gjHrLVqV
	 kEsehUZs3wuCjuJQQ6TsIGCuHJ7MNCpD9PU8ya221x9OLUDNBk9zoUKZ9wqfdBI4dlqvx
	 cq8wPK/c6ePhHGAwAKC1Us/+EDyqS1mmwxC2pq2DIi6eepJE7uQtvS3LiOucQSWpyYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793881355;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=+y7syKe0oBPgFaHnmkZuzr35rU+9iLLgU5WYBQu2MbY=;
	b=suXwPFLnoeWg69FvlT9yEsrrEVi/nUnj+T8KIEH171wIOv8ugrjLIAlngi6XrNfEBIlB
	 uSrPsb8Y3NSYYVExzFUkzrV7KawltcLOV8rpIEvqo96ue+bPs2kzXdH/fGQZEKXa1T26u
	 gqAd+jNh5GPFUmgmzETJK38QGs9ckqeUkdIS8KARL3uSm/CnVqPReLRr/uQh8/AyseHC6
	 YZu33ZiHG4LkxbaQzfpjmbq/zy0rS3IPL5MfZsIEtowX5K/RZ6+SQR+SEUhvUlpUQ8lK8
	 USLYSo9CHiPkjrcGa5bvPnv8C8nc8kYxtXlW1hwax7N0Uw3iO3LwMR7sEqkh6OXUPEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ld5Y5aqD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F059606A32F;
	Thu,  5 Nov 2026 12:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ld5Y5aqD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDFED1F00919;
	Thu,  5 Nov 2026 12:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793881354;
	bh=+y7syKe0oBPgFaHnmkZuzr35rU+9iLLgU5WYBQu2MbY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Ld5Y5aqDf+KGzGxbZyA3C3y/i6FDn8mlvEMKhfR+peBJvrz34A1sQlLe3qOWE+9g3
	 l3/ZnAD/bMpYPbWmbG4DZP2RV/fTS+GSX/W2Yka7Ca6Iq/sqIMkWbBhdLjH9cmiH1M
	 S25lgM3REhY3hmiuYlfSC6cyZzH7QFY5ad8Nbnpyehbf6RHOkagzgEcaT9RsjXCEmV
	 aDG6n0aRyAvmzIJtYSSSj64nra7+ce4PPMDHf9yKP1F6E8zID91IqAJQGRvtfalah+
	 jd/OJydoEPJhqvVNXy8CzFXDnoWivBG7OFtlPZc70BFtwCggK6MADGdCKex2vZH0Kq
	 upoHCMrxDWe+Q==
Subject: Re: [PATCH net v2 1/3] ipv6: route: consider IOAM options in ECMP
 hash policy 0
From: netdev-bot+sashiko@kernel.org
To: hangbin.liu@linux.dev
Cc: dsahern@kernel.org, idosch@nvidia.com, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 justin.iurman@gmail.com, shuah@kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 liuhangbin@kylinos.cn
Date: Thu, 05 Nov 2026 12:22:33 +0000
Message-ID: <179388135331.488856.9718254079530058449@kernel.org>
In-Reply-To: <20261103-ipv6_ioam_ecmp-v2-1-6ef0318bdb5e@kylinos.cn>
References: <20261103-ipv6_ioam_ecmp-v2-1-6ef0318bdb5e@kylinos.cn>
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

Thank you for your contribution! Sashiko AI review found 4 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 3

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] ip6_nexthdr_without_ioam() (net/ipv6/route.c:2372-2405) steps
  through Hop-by-Hop TLVs with no limit on option count or padding.
- [Low] ip6_multipath_l3_keys() (net/ipv6/route.c:2437-2441) guesses
  whether skb->transport_header still points at the Hop-by-Hop header.
- [Low] The patch adds a permanent UAPI constant `#define
  IPV6_TLV_IOAM_DEX 17 /* RFC 9486 */` to include/uapi/linux/in6.h, and…
- [Low] ip6_nexthdr_without_ioam() (net/ipv6/route.c:2353-2408) says it
  recovers the nexthdr only if the HBH 'carried only IOAM options and…

--

ipv6: route: consider IOAM options in ECMP hash policy 0

RFC 9486 (C2) requires the same ECMP hash with and without IOAM options.
To meet it, this patch has the policy-0 IPv6 multipath hash use the next
header the packet would have without a Hop-by-Hop header that holds only
IOAM options and padding. It adds a TLV walker,
ip6_nexthdr_without_ioam(), applies it to both the outer header and the
inner header quoted by ICMPv6 errors, and adds an IPV6_TLV_IOAM_DEX UAPI
define.

> diff --git a/include/uapi/linux/in6.h b/include/uapi/linux/in6.h
> index 5a47339ef7d76..2e66dc37e1e50 100644
> --- a/include/uapi/linux/in6.h
> +++ b/include/uapi/linux/in6.h
> @@ -145,6 +145,7 @@ struct in6_flowlabel_req {
>  #define IPV6_TLV_PADN		1
>  #define IPV6_TLV_ROUTERALERT	5
>  #define IPV6_TLV_CALIPSO	7	/* RFC 5570 */
> +#define IPV6_TLV_IOAM_DEX	17	/* RFC 9486 */
>  #define IPV6_TLV_IOAM		49	/* RFC 9486 */

[Severity: Low]
This isn't a bug, but is IPV6_TLV_IOAM_DEX the right name for a permanent
UAPI constant?

In RFC 9486, IPv6 option types 0x11 and 0x31 are both the IOAM option. They
differ only in the chg bit. DEX is an IOAM-Option-Type carried inside the
option (struct ioam6_hdr->type, the IOAM6_TYPE_* values in
include/uapi/linux/ioam6.h). It is not an IPv6 TLV type.

The only user, ip6_nexthdr_without_ioam(), compares opt[0] against this
value and never looks at the IOAM-Option-Type. So it matches every 0x11
option, not just DEX:

    if (opt[0] != IPV6_TLV_IOAM && opt[0] != IPV6_TLV_IOAM_DEX)
        return nexthdr;

No userspace interface needs this value. Would a kernel-private define, or
a name that describes the chg=0 variant, fit better?

The commit message also doesn't mention that a UAPI define is being added.
It only says "0x11 for DEX".

[ ... ]

> diff --git a/net/ipv6/route.c b/net/ipv6/route.c
> index 616b86f89f637..675cf2e8ed353 100644
> --- a/net/ipv6/route.c
> +++ b/net/ipv6/route.c
> @@ -2342,6 +2342,71 @@ struct dst_entry *ip6_route_input_lookup(struct net *net,
>  }
>  EXPORT_SYMBOL_GPL(ip6_route_input_lookup);
>  
> +/* RFC 9486 (C2) requires that the ECMP hash of a packet carrying IOAM
> + * options is the same as the hash of the identical packet without them.
> + * Recover the nexthdr if its Hop-by-Hop header carried only IOAM options
> + * and padding, every other packet is hashed exactly as before.
> + *
> + * iph_off: offset of the IPv6 header from skb->data
> + * nexthdr: iph->nexthdr (NEXTHDR_HOP or not)
> + */
> +static u8 ip6_nexthdr_without_ioam(const struct sk_buff *skb,
> +				   int iph_off, u8 nexthdr)
> +{

[ ... ]

> +	off = iph_off + sizeof(struct ipv6hdr);
> +	hhdr = skb_header_pointer(skb, off, sizeof(hbuf), &hbuf);
> +	if (!hhdr)
> +		return nexthdr;
> +
> +	len = (hhdr->hdrlen + 1) << 3;
> +
> +	for (i = 2; i < len; ) {
> +		const u8 *type;
> +		u8 type_buf;
> +
> +		/* Always check PAD1 first as ip6_parse_tlv() accepts Pad1
> +		 * as the last byte of the HBH header
> +		 */
> +		type = skb_header_pointer(skb, off + i, 1, &type_buf);
> +		if (!type)
> +			return has_ioam ? hhdr->nexthdr : nexthdr;
> +		if (*type == IPV6_TLV_PAD1) {
> +			i++;
> +			continue;
> +		}

[Severity: Medium]
What limits the number of iterations of this loop?

Pad1 advances i by 1. A zero-length PadN or IOAM option advances it by 2.
The loop runs up to len = (hdrlen + 1) << 3, which can be 2048.

ip6_parse_tlv() limits this with max_hbh_opts_cnt and by rejecting padding
runs longer than 7 bytes. This walk has no such limit.

The walk also runs on headers that ip6_parse_tlv() never validated.
ip6_route_input() computes the hash for every ICMPv6 packet, whether or not
the route is multipath:

ip6_route_input()
    if (unlikely(fl6.flowi6_proto == IPPROTO_ICMPV6))
        fl6.mp_hash = rt6_multipath_hash(net, &fl6, skb, flkeys);

With the default policy 0, this reaches the HBH quoted inside an ICMPv6
error:

rt6_multipath_hash()
  ip6_multipath_l3_keys()
    ip6_nexthdr_without_ioam(skb, inner_off, inner_iph->nexthdr)

The outer HBH is also walked past the IOAM option when ipv6_hop_ioam()
calls ip6_route_input() in the middle of ip6_parse_tlv().

A remote sender can send ICMPv6 errors (type 1-4) whose quoted inner IPv6
header has nexthdr 0, followed by an HBH with hdrlen 255 filled with Pad1.
No IOAM option is needed, so has_ioam stays false and the loop keeps
going.

At a 1500 MTU that is about 1400 iterations per packet. Each one does one
or two skb_header_pointer() calls. These fall back to skb_copy_bits() when
the bytes are in page frags, because only the IPv6 header has been pulled
before ip6_route_input().

Before this patch, ip6_multipath_l3_keys() did a fixed amount of work per
packet. Could the walk stop after a padding run longer than 7 bytes, or
after a small number of TLVs as ip6_parse_tlv() does, and return the
original nexthdr?

> +
> +		opt = skb_header_pointer(skb, off + i, sizeof(obuf), obuf);
> +		if (!opt)
> +			return nexthdr;

[Severity: Low]
Do these truncation exits match the "only IOAM options and padding" rule
in the comment above the function?

When has_ioam is already set, the two exits disagree. If the 1-byte read
fails, the recovered nexthdr is returned:

    type = skb_header_pointer(skb, off + i, 1, &type_buf);
    if (!type)
        return has_ioam ? hhdr->nexthdr : nexthdr;

If the 1-byte read succeeds but the 2-byte read above fails, NEXTHDR_HOP
is returned regardless of has_ioam.

A quoted inner HBH can be truncated. The same IOAM-only flow then hashes
with either proto 0 or the L4 proto, depending on whether zero or one byte
of the next TLV survived the cut.

Now take an original HBH of [IOAM ...][Router Alert] whose quote ends
before the Router Alert type byte. The error hashes with the L4 proto,
while the original flow hashes with proto 0.

The option length is also never checked against the remaining HBH length:

    i += opt[1] + 2;

An IOAM option whose length runs past len ends the loop with has_ioam set,
and the recovered nexthdr is returned. ip6_parse_tlv(), which the Pad1
comment refers to, rejects optlen > len.

icmp6_send() limits the quote, so this needs a quoted HBH longer than
about 1192 bytes, or a crafted error. Even so, the commit message says
"errors that quote a flow keep hashing that flow". Doesn't that now depend
on exactly where the quote was cut?

[ ... ]

> @@ -2349,15 +2414,34 @@ static void ip6_multipath_l3_keys(const struct sk_buff *skb,

[ ... ]

> -	if (likely(outer_iph->nexthdr != IPPROTO_ICMPV6))
> +	nexthdr = ip6_nexthdr_without_ioam(skb, skb_network_offset(skb),
> +					   outer_iph->nexthdr);
> +	if (likely(nexthdr != IPPROTO_ICMPV6))
>  		goto out;
>  
> -	icmph = skb_header_pointer(skb, skb_transport_offset(skb),
> +	/* Outer header has IOAM (NEXTHDR_HOP) and the recovered nexthdr is
> +	 * IPPROTO_ICMPV6. transport_header may still point at the Hop-by-Hop
> +	 * header (e.g. ipv6_hop_ioam() -> ip6_route_input() before
> +	 * ipv6_parse_hopopts() advances it).
> +	 */
> +	if (outer_iph->nexthdr == NEXTHDR_HOP) {
> +		opt_hdr = skb_header_pointer(skb, skb_transport_offset(skb),
> +					     sizeof(_opt_hdr), &_opt_hdr);
> +		if (opt_hdr && opt_hdr->nexthdr == IPPROTO_ICMPV6)
> +			extlen = (opt_hdr->hdrlen + 1) << 3;
> +	}
> +
> +	icmph = skb_header_pointer(skb, skb_transport_offset(skb) + extlen,
>  				   sizeof(_icmph), &_icmph);

[Severity: Low]
Can this check misfire when transport_header has already been advanced
past the HBH?

On the normal forwarding path, ipv6_parse_hopopts() advances it before the
route lookup:

ip6_rcv_core()
  ipv6_parse_hopopts()
    skb->transport_header += extlen;
ip6_rcv_finish_core()
  ip6_route_input()
    fib6_select_path()
      rt6_multipath_hash()
        ip6_multipath_l3_keys()

Here flowi6_proto is NEXTHDR_HOP, so ip6_route_input() leaves mp_hash
unset and fib6_select_path() computes it. At that point, the two bytes
read as opt_hdr are actually the ICMPv6 type and code.

Take a forwarded packet whose HBH holds only IOAM options and padding,
with HBH nexthdr 58 and icmp6_type 58 (unassigned). The check passes and
extlen becomes (icmp6_code + 1) * 8.

The ICMPv6 header is then read from the payload. If that byte is 1..4,
icmpv6_is_err() returns true, and key_iph and ip_proto come from payload
bytes. The same packet without IOAM hashes its outer header with proto 58.

ip6_nexthdr_without_ioam() already knows the HBH length. Could the ICMPv6
offset be computed as skb_network_offset(skb) + sizeof(struct ipv6hdr) +
((hhdr->hdrlen + 1) << 3) instead of being guessed from transport_header?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261103-ipv6_ioam_ecmp-v2-0-6ef0318bdb5e%40kylinos.cn
