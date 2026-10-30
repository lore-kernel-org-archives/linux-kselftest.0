Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793360830;
	b=BKdFxha1DxZXVugQLiQ5A/gmtIsqy09XJFBP3USxE8JMBgf9cHc2AxBKBaYn3dG2GSgR
	 6VJxVenONEM27JKYqcN3skjAyG9WrS0MD1IN6B/pXqQIZhKRKWYrGcKaUcPV/5dCV5irP
	 +p+njSfaTrL6GAn7vAwSsQdw8erLtcB6SY4we0dXMLPqDPv60nX1TxU37xWuE4KLkZNIN
	 x2xLN6rvOvh6aKUYIdWVb7ibmO8YYLenHZ9KowqN89Dmh8rOir4XgCIDPcU5HU19w1sef
	 KMEdQWCaKdtcmyZu7NpDy31DcbQtliO7lbj3nMidTTRlWXXPJDA7e7o8+Ru2IkXyeSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793360830;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=bTRePxoUjak0eijJFB471LMpNq/VaGSQo1sU1mVSCbU=;
	b=aoBcrTZG2bwKq/0Yt0vxwgVSXqfJjUKCqvmu7PY64ONi2R0SlHGhcTnF6nXnSUGmJSKd
	 x8nJjcXhuTp7V0rzSg7pJGiecIbY7mQoMlBKndWKsqwkmRV2vUcmvlUniW5Q7vZDHv0i2
	 /Pcqqc2M31Ab7cpCUqW26GGI/Nlr9eDgNl+XWJtRCLTjsWmFOglv2MB+zJLcddADHvAUc
	 o/0aKqLLmxjoVHqaYE52X9io2uMHwCTv8Po+LmBGj7SQ6aQ1yMAhhEnw6xsIRVwY6tT+Z
	 lbGivAtS0NdKAEOJpeCv1KH032lRmO97FsrafoEG9mm+3guNCCsKI3lSMF12KGZxn8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LlpGgHa5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E8DB606A32E;
	Fri, 30 Oct 2026 11:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LlpGgHa5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCA1D1F00A16;
	Fri, 30 Oct 2026 11:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793360829;
	bh=bTRePxoUjak0eijJFB471LMpNq/VaGSQo1sU1mVSCbU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=LlpGgHa55EM63wRvlBRDUbID7rGkg3bwb68yN9d8oJe/TpX6Klp+Bq+W5EF1aQ7CE
	 9naEy9TVELlQLc3KtmeNc6c5krsVyU8wdCdy7FumHB7aLFyTbN29x2cwp9oaASoWCr
	 y0sM0W4zmWpdF+xBKZldGxYNRhelDp4KieIbwbaiTHSez9aMrQrsjuswzWtYWwQPLH
	 LIreZAgp98LZAZ86hjfxFGythTONbtBHYaQ+qLkJ5hmNrcFwVv72YcQHgAqEeASBUl
	 oECgVNrrJ9Eq/PsOyUBfuHUDBDu2grgXXvsaTZfjD66RCI7luu/bcqq65VFkkWbaO2
	 H7zmuZzOXW2kA==
Subject: Re: [PATCH 2/3] ipv6: ioam6: use transformed packet nexthdr for ECMP
 re-lookup
From: netdev-bot+sashiko@kernel.org
To: hangbin.liu@linux.dev
Cc: dsahern@kernel.org, idosch@nvidia.com, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 justin.iurman@gmail.com, shuah@kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 liuhangbin@kylinos.cn
Date: Fri, 30 Oct 2026 11:47:08 +0000
Message-ID: <179336082844.3134.1265197633714491521@kernel.org>
In-Reply-To: <20261028-ipv6_ioam_ecmp-v1-2-9b6715b6f4c0@kylinos.cn>
References: <20261028-ipv6_ioam_ecmp-v1-2-9b6715b6f4c0@kylinos.cn>
X-sashiko-severity: High
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

Thank you for your contribution! Sashiko AI review found 8 potential
issue(s) to consider.

Critical: 0 · High: 2 (1) · Medium: 3 · Low: 3

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] In ioam6_output() (net/ipv6/ioam6_iptunnel.c:416-417), the
  inline-mode re-lookup does not keep ICMPv6 errors hashed on their…
- [High] For locally generated packets that ioam6_output() handles in
  INLINE mode (or AUTO mode with !skb->dev), orig_dst came from…
- [Medium] ioam6_output() (ioam6_iptunnel.c:416) reads the per-route
  shared template field ilwt->tuninfo.eh.nexthdr into fl6.flowi6_proto…
- [Medium] The commit message credits the policy-0 fix to using
  eh.nexthdr as fl6.flowi6_proto in the re-lookup.
- [Medium] ipv6: route: wrong skb offset in ip6_nexthdr_without_ioam()
  via icmp6_send()
- [Low] Because mp_hash is precomputed from the skb, the main user-
  visible effect of changing fl6.flowi6_proto from hdr->nexthdr…
- [Low] fib6_select_path() (route.c:464-469) treats fl6->mp_hash == 0 as
  'not computed'.
- [Low] ipv6: ioam6: duplicate ip6_route.h include in ioam6_iptunnel.c

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but the patch
  relies on the same racy template.

--

ipv6: ioam6: use transformed packet nexthdr for ECMP re-lookup

On a dst_cache miss, the ioam6 output path re-looks up the route. This
patch changes that lookup to use the Hop-by-Hop nexthdr stored in the
tunnel template (eh.nexthdr) as flowi6_proto instead of NEXTHDR_HOP. It
also precomputes fl6.mp_hash from the transformed skb with
rt6_multipath_hash(), so that the ECMP hash matches RFC 9486 (C2).

> diff --git a/net/ipv6/ioam6_iptunnel.c b/net/ipv6/ioam6_iptunnel.c
> index cfb2c41634a0b..713e625bfa3aa 100644
> --- a/net/ipv6/ioam6_iptunnel.c
> +++ b/net/ipv6/ioam6_iptunnel.c

[ ... ]

> @@ -412,7 +413,8 @@ static int ioam6_output(struct net *net, struct sock *sk, struct sk_buff *skb)
>  		fl6.saddr = hdr->saddr;
>  		fl6.flowlabel = ip6_flowinfo(hdr);
>  		fl6.flowi6_mark = skb->mark;
> -		fl6.flowi6_proto = hdr->nexthdr;
> +		fl6.flowi6_proto = ilwt->tuninfo.eh.nexthdr;

[Severity: Medium]
Is ilwt->tuninfo.eh.nexthdr guaranteed to still belong to this packet
when it is read here?

The template is shared per route. Every CPU sending through it writes
this field with plain stores:

ioam6_do_inline():
	tuninfo->eh.nexthdr = hdr->nexthdr;

ioam6_do_encap():
	tuninfo->eh.nexthdr = NEXTHDR_IPV6;

Nothing serializes the lwtunnel output path. Between the return of
ioam6_do_inline()/ioam6_do_encap() and this read, another CPU may have
stored a different packet's nexthdr. In inline mode that could be
TCP, UDP or ICMPv6. In auto mode the inline and encap values alternate.

The protocol read here is used by fib6_rule_match() for ipproto
selectors. fib6_select_path() also falls back to it when the
precomputed mp_hash is 0. The resulting dst is then cached in
ilwt->cache.

Could the value come from a local instead, for example
ipv6_hdr(skb)->nexthdr saved before ioam6_do_inline(), or NEXTHDR_IPV6
for encap? KCSAN would probably also flag this plain read/write pair.

[Severity: High]
This isn't a bug introduced by this patch, but the new read depends on
the same shared template, and the write side of it already looks racy.

ioam6_do_inline() stores to the template and then copies it into the
packet:

	tuninfo->eh.nexthdr = hdr->nexthdr;

	skb_set_transport_header(skb, sizeof(*hdr));
	skb_postpush_rcsum(skb, hdr, sizeof(*hdr) + hdrlen);

	memcpy(skb_transport_header(skb), (u8 *)tuninfo, hdrlen);

ioam6_do_encap() does the same with NEXTHDR_IPV6:

	tuninfo->eh.nexthdr = NEXTHDR_IPV6;
	memcpy(skb_transport_header(skb), (u8 *)tuninfo, hdrlen);

There is no locking here. Can another CPU's store land between this
CPU's store and its memcpy()? If so, the packet goes out with an HBH
nexthdr that does not describe its payload.

With mixed-protocol inline traffic, a TCP segment could be labelled
as UDP, and the receiver would drop it.

In auto mode, a local packet could be labelled nexthdr=41. The receiver
would then parse the UDP header and payload as an inner IPv6 header,
so UDP payload bytes 0-31 become the inner saddr/daddr. If the
destination runs an ip6ip6 decap tunnel, this might allow spoofed inner
packets to be injected there. That part depends on how the receiver is
configured.

[Severity: Low]
mp_hash is now precomputed from the skb. So the main visible effect of
this flowi6_proto change seems to be on policy routing, not on the
ECMP hash. fib6_rule_match() does:

	if (rule->ip_proto && (rule->ip_proto != fl6->flowi6_proto))
		return 0;

Before this patch, "ip -6 rule ... ipproto X" never matched the ioam6
re-lookup. Now it matches the inner L4 protocol in inline mode and
IPPROTO_IPV6 in encap mode. IOAM traffic can therefore be routed
through a different table than before.

This is arguably more consistent with the original lookup. Could the
commit message mention this routing behaviour change?

> +		fl6.mp_hash = rt6_multipath_hash(net, &fl6, skb, NULL);

[Severity: Medium]
This isn't introduced by this patch. It is in the helper added by the
earlier patch in this series, which this re-lookup now depends on, so
I am raising it here.

ip6_nexthdr_without_ioam() looks for the Hop-by-Hop header at
off = sizeof(*iph). It passes that offset to skb_header_pointer(),
which indexes from skb->data. That only works when skb->data points
at the IPv6 header. It does in ioam6_output(), but not for every
caller of rt6_multipath_hash().

icmp6_send() also calls rt6_multipath_hash() with the offending skb.
For locally delivered packets, ip6_protocol_deliver_rcu() has already
done:

	pskb_pull(skb, skb_transport_offset(skb))

After that, skb->data sits at the transport header and
skb_network_offset(skb) is negative. Two cases reach the helper with
such an skb when the packet carries a Hop-by-Hop header:

- udpv6_rcv() sends ICMPV6_PORT_UNREACH
- ip6_protocol_deliver_rcu() reports an unknown nexthdr

In both, ip6_multipath_l3_keys() calls ip6_nexthdr_without_ioam(),
which then parses L4 payload bytes as a Hop-by-Hop header and walks
them as options.

skb_header_pointer() keeps the reads bounds-checked. The problem is
the ip_proto fed into the policy 0 hash for the ICMPv6 error. It is
no longer the real HBH nexthdr. It is either derived from
remote-supplied payload bytes, or it falls back to NEXTHDR_HOP when
the payload is short. So the precomputed mp_hash in icmp6_send() no
longer reflects the offending flow, and the sender can influence which
ECMP sibling the error takes.

Should the helper start at skb_network_offset(skb) + sizeof(*iph), or
derive the offset from iph? That would match the rest of
ip6_multipath_l3_keys(), which works from the header offsets rather
than assuming skb->data is the network header.

[Severity: High]
Does this keep ICMPv6 errors hashed on their quoted flow in inline mode,
as the commit message says?

ioam6_do_inline() leaves the transport header pointing at the inserted
Hop-by-Hop header:

	skb_set_transport_header(skb, sizeof(*hdr));
	...
	memcpy(skb_transport_header(skb), (u8 *)tuninfo, hdrlen);

Under policy 0 and the policy 2 fallback, rt6_multipath_hash() calls
ip6_multipath_l3_keys(). That function gets IPPROTO_ICMPV6 back from
ip6_nexthdr_without_ioam(), but then reads the ICMPv6 header at the
transport offset:

	icmph = skb_header_pointer(skb, skb_transport_offset(skb),
				   sizeof(_icmph), &_icmph);
	...
	if (!icmpv6_is_err(icmph->icmp6_type))
		goto out;

Those bytes are the HBH header, so icmp6_type is eh.nexthdr (58) and
icmpv6_is_err() returns false. The outer addresses and flowlabel are
hashed instead of the quoted flow.

orig_dst was chosen on the quoted flow. For forwarded errors that was
done by ip6_route_input(). For local errors, icmp6_send() precomputes
fl6.mp_hash from the offending skb.

On a dst_cache miss, can this re-lookup pick a different ECMP sibling
and cache it for this lwtstate?

Also, this comment in ip6_nexthdr_without_ioam() does not hold for the
new output-path caller:

	/* The Hop-by-Hop header was already pulled and validated by
	 * ipv6_parse_hopopts() before routing, so this walk is safe.
	 */

Would it work to compute the hash before the HBH is inserted, or to
find the ICMPv6 header past the IOAM HBH?

[Severity: High]
Locally generated packets take inline mode, or auto mode with
!skb->dev. For them, orig_dst came from ip6_route_output() with no
skb, so fib6_select_path() used the fl6 branch of
rt6_multipath_hash(). This re-lookup uses the skb branch instead. For
the same flow, the two branches hash different keys:

Policy 0 with default sysctls: the socket lookup hashes
flowi6_get_flowlabel(fl6), which is 0 unless a label was set. The skb
branch hashes ip6_flowlabel(hdr), which is the auto flowlabel written
by ip6_make_flowlabel(). auto_flowlabels is on by default.

Policy 1: skb_set_hash_from_sk() sets skb->l4_hash from sk_txhash, so
the skb branch returns early instead of hashing the fl6 5-tuple:

	if (skb->l4_hash)
		return skb_get_hash_raw(skb) >> 1;

Policy 3: the skb branch uses rt6_multipath_custom_hash_skb(), while
the original lookup used rt6_multipath_custom_hash_fl6().

Each nexthop has its own lwtstate. A different sibling would fail the
orig_dst->lwtstate check, and its dst would be cached in ilwt->cache
for later packets.

In the default configuration, is the policy 0 divergence described in
the commit message still reachable for local traffic? Closing it seems
to need the re-lookup to reproduce the original lookup's hash. Changing
flowi6_proto alone would not do that.

[Severity: Medium]
The commit message credits the policy 0 fix to using eh.nexthdr as
flowi6_proto. With a non-NULL skb, though, no rt6_multipath_hash()
policy reads fl6->flowi6_proto:

- policy 0 and the policy 2 fallback use ip6_multipath_l3_keys()
- policy 1 uses the flow dissector
- policy 3 uses rt6_multipath_custom_hash_skb()

fib6_select_path() only recomputes when the precomputed value is zero:

	if (!fl6->mp_hash &&
	    (!match->nh || nexthop_is_multipath(match->nh)))
		fl6->mp_hash = rt6_multipath_hash(net, fl6, skb, NULL);

So the policy 0 behaviour comes entirely from
ip6_nexthdr_without_ioam(), which the earlier patch "ipv6: route:
consider IOAM options in ECMP hash policy 0" added. This commit still
carries its own tag:

    Fixes: 8cb3bf8bff3c ("ipv6: ioam: Add support for the ip6ip6 encapsulation")

If this commit is backported alone, ip6_multipath_l3_keys() would hash
outer_iph->nexthdr == NEXTHDR_HOP, and the stated bug would not be
fixed.

Could the commit message describe this dependency, and say which change
actually affects the hash?

[Severity: Low]
fib6_select_path() treats mp_hash == 0 as "not computed". Its comment
assumes that only ICMPv6 errors precompute, and that the value is
always non-zero:

	/* We might have already computed the hash for ICMPv6 errors. In such
	 * case it will always be non-zero. Otherwise now is the time to do it.
	 */

rt6_multipath_hash() returns mhash >> 1, and __flow_hash_from_keys()
maps 0 to 1, so the result can be 0. The policy 1 path,
skb_get_hash_raw(skb) >> 1, can also return 0. When that happens,
fib6_select_path() recomputes from fl6 with no skb, and the skb-based
hash is lost.

This is rare, and icmp6_send() already has the same sentinel collision.
Since ioam6_output() now precomputes too, should the comment be
updated, and is the zero case worth handling?

>  
>  		dst = ip6_route_output(net, NULL, &fl6);
>  		if (dst->error) {

[ ... ]

> @@ -13,6 +13,7 @@
>  #include <linux/ioam6.h>
>  #include <linux/ioam6_iptunnel.h>
>  #include <net/dst.h>
> +#include <net/ip6_route.h>
>  #include <net/sock.h>
>  #include <net/lwtunnel.h>
>  #include <net/ioam6.h>

[Severity: Low]
This has no runtime effect, but ioam6_iptunnel.c already includes
<net/ip6_route.h> further down, after <net/dst_cache.h>. The new
include at the top is a duplicate of it.

rt6_multipath_hash() was already visible through the existing
include. Could this hunk be dropped?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261028-ipv6_ioam_ecmp-v1-0-9b6715b6f4c0%40kylinos.cn
