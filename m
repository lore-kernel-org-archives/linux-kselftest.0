Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793881356;
	b=huyklPqbbFGkaGvJjHAiaPjC3t2ljlgxVzSoa3iqZFejd3MJ7VBuwvM/z6urcDhw2nC2
	 uMyiPuE07NchrPzIIXyLtJoHtdCn1IhXiZBr9IumXVnV9Q5SwRKLkKgfFsWx3EcFVbkjX
	 a9FQUXYQv6c2qDbz4lpeyiLX78oMYgR69PanO4yLuDPL3a3tHbhQu2Uche9myAFG9INes
	 hOr//f/IRAlIb+k6v+IEXQttK5s52QL1eLFAINYgn0FBbqEimiw/wb8nKzC9B8t9+Tdmm
	 ed4nUvZ2zEq+izsRdCfcrGrmJXWeL1nSpRWRiXyZN0GeZN5dF+p9D0A0im5PI0mBXog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793881356;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=51XuEKp7AvViCgMvOr9QbMagrxSSSGv9BFPwFm9pL4U=;
	b=QR6S5GvN+Bwdvqg/9VOkU2EGav4geeNzHFUwiel2XyJrlSuHHl8Oje/kjNXUVUyniKSs
	 /Cm/gcfabaLZGoU4OvJtTO43i/gtBgSe2LbeIjox4XKbrJTPI3TWRBgwQwdI8TeOc6UTl
	 3ZWkbOk8grDBYEiKE4T/0rjVwQKh81z3iS2JpHjsiR3doRpodSZnM4yLsmZ59EzmSiKax
	 Ai/nr8FUtHqHEvPquZty7BeO5xYkg2UW9FnerD7Ew55SjTvkG0Nw2Z/bm1EFt2Tepdhvc
	 TWM6cS49lhyRC9fn54Wr/cvhWjNkhFn8iMq4vBmtxnjJAzcmw/5IOsDle/3Ug2t6CyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lQcXh16L;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504F0606A33A;
	Thu,  5 Nov 2026 12:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lQcXh16L
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52C8A1F0093A;
	Thu,  5 Nov 2026 12:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793881356;
	bh=51XuEKp7AvViCgMvOr9QbMagrxSSSGv9BFPwFm9pL4U=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=lQcXh16Lpg0844yiIjRtLPM4PEXa9WWGQvf0+lRRHdF/9GXkCv4RXgFGvVYYtpSRl
	 /mHhTjEKdVNupz+11bj1o+CofU6DYK0IcSOOVbDuwSc/jTh5VLKz58R40kXrwc9j62
	 a/fXGwSJm+GZzOLO68tBVJBURMxZyIUC2LeHBD1H6KXmLSWH2J4CMCD2H8b3KmlBds
	 pLdICoTiHpYQEkuCwUbjwJQuk8l5Jxi41jtREFtGrzCRPXBoLss8Mrazu0JmpUUwax
	 XkhZbaRP1cEgddxa2Oi5fBe0iFyxECKQpKzCMgXiSbnTlj0NvVPsQI2GEpXAweK2+I
	 3UQKF9pAYukkA==
Subject: Re: [PATCH net v2 2/3] ipv6: ioam6: use transformed packet nexthdr
 for ECMP re-lookup
From: netdev-bot+sashiko@kernel.org
To: hangbin.liu@linux.dev
Cc: dsahern@kernel.org, idosch@nvidia.com, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 justin.iurman@gmail.com, shuah@kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 liuhangbin@kylinos.cn
Date: Thu, 05 Nov 2026 12:22:34 +0000
Message-ID: <179388135485.488856.15442544337186327982@kernel.org>
In-Reply-To: <20261103-ipv6_ioam_ecmp-v2-2-6ef0318bdb5e@kylinos.cn>
References: <20261103-ipv6_ioam_ecmp-v2-2-6ef0318bdb5e@kylinos.cn>
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

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 2 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The encap cache-miss path in ioam6_output()
  (net/ipv6/ioam6_iptunnel.c:439) now sets `fl6.mp_hash =…
- [High] In IOAM6_IPTUNNEL_MODE_AUTO, local packets (inline, !skb->dev)
  and forwarded packets (encap, skb->dev set) share one per-CPU…
- [Medium] The new call `rt6_multipath_hash(net, &fl6, skb, NULL)` in
  ioam6_output() (net/ipv6/ioam6_iptunnel.c:439) passes an output-path…

--

ipv6: ioam6: use transformed packet nexthdr for ECMP re-lookup

This commit changes the dst_cache miss path in ioam6_output(). For inline
insertion it now reuses orig_dst and caches the fake null_rt. For
encapsulation it re-looks up the route with flowi6_proto taken from the
HBH next header and with fl6.mp_hash precomputed from the skb, so that
the ECMP hash matches the identical packet without IOAM (RFC 9486 C2).

> diff --git a/net/ipv6/ioam6_iptunnel.c b/net/ipv6/ioam6_iptunnel.c
> index cfb2c41634a0b..246533276be82 100644
> --- a/net/ipv6/ioam6_iptunnel.c
> +++ b/net/ipv6/ioam6_iptunnel.c
> @@ -405,34 +405,61 @@ static int ioam6_output(struct net *net, struct sock *sk, struct sk_buff *skb)
>  
>  	if (unlikely(!dst)) {
>  		struct ipv6hdr *hdr = ipv6_hdr(skb);
> -		struct flowi6 fl6;

[ ... ]

> +		if (ilwt->mode == IOAM6_IPTUNNEL_MODE_INLINE ||
> +		    (ilwt->mode == IOAM6_IPTUNNEL_MODE_AUTO && !skb->dev)) {
> +			dst = orig_dst;
> +			dst_hold(dst);
> +
> +			local_bh_disable();
> +			dst_cache_set_ip6(&ilwt->cache, &ilwt->null_rt.dst,
> +					  &hdr->saddr);
> +			local_bh_enable();

[Severity: High]
In AUTO mode, can local and forwarded packets end up using each other's
cached dst? The miss path is now mode aware. The hit path at the top of
ioam6_output() still reads one per-CPU cache, whatever the mode:

	dst = dst_cache_get(&ilwt->cache);
	...
	if (dst == &ilwt->null_rt.dst) {
		dst_release(dst);

		dst = orig_dst;
		/* keep refcount balance: dst_release() is called at the end */
		dst_hold(dst);
	}

Suppose a local packet misses first, so null_rt is cached. A later
forwarded packet on that CPU then gets dst = orig_dst and is encapsulated
with daddr = tundst. Because dst is non-NULL, it skips the tundst
re-lookup. Because the lwtstates match, it leaves through
orig_dst->lwtstate->orig_output(). That uses the inner destination's
route and nexthop, not the route for tundst.

Now suppose a forwarded packet misses first. The encap branch caches the
tundst route:

	dst_cache_set_ip6(&ilwt->cache, dst, &fl6.saddr);

Later local packets on that CPU hit this entry and are processed inline.
They are then sent through the tundst route instead of orig_dst:

	if (orig_dst->lwtstate != dst->lwtstate) {
		skb_dst_drop(skb);
		skb_dst_set(skb, dst);
		return dst_output(net, sk, skb);
	}

The shared cache existed before this patch. However, the commit message
says inline will "reuse orig_dst and cache the fake null_rt, keeping the
sibling from the original lookup", and that encapsulation "still
re-looks up". In AUTO mode with mixed traffic, neither seems to hold.
null_rt is DST_OBSOLETE_NONE, so the stale entry stays until the cache is
reset.

Does the hit path need to be mode aware too, for example with separate
caches for the inline and encap cases?

> +		} else {
> +			/* Encapsulation may change the destination (tundst);
> +			 * re-lookup with the transformed packet keys so the
> +			 * outer hash matches the identical packet without IOAM.
> +			 */
> +			const struct ipv6_opt_hdr *hhdr;
> +			struct flowi6 fl6;
> +
> +			hhdr = (const struct ipv6_opt_hdr *)skb_transport_header(skb);
> +
> +			memset(&fl6, 0, sizeof(fl6));
> +			fl6.daddr = hdr->daddr;
> +			fl6.saddr = hdr->saddr;
> +			fl6.flowlabel = ip6_flowinfo(hdr);
> +			fl6.flowi6_mark = skb->mark;
> +			fl6.flowi6_proto = hhdr->nexthdr;
> +			fl6.mp_hash = rt6_multipath_hash(net, &fl6, skb, NULL);

[Severity: High]
Does computing mp_hash from the skb break the C2 equivalence that the
comment above claims? When fl6->mp_hash is non-zero, fib6_select_path()
uses it as is, so this skb-based value chooses the sibling.

The comment says the outer hash "matches the identical packet without
IOAM". A plain ip6ip6 tunnel, ip6_tnl_xmit(), routes with
ip6_route_output(net, NULL, fl6) and no skb, so it hashes the outer fl6
keys. With an skb, rt6_multipath_hash() behaves differently for each
policy.

Policy 1 returns the inner flow's hash early. ioam6_do_encap() never
clears that hash:

	if (skb->l4_hash)
		return skb_get_hash_raw(skb) >> 1;

Policy 2 dissects through the ip6ip6 header and hashes the inner
addresses, flowlabel and proto:

	skb_flow_dissect_flow_keys(skb, &keys, 0);

Policy 3 calls rt6_multipath_custom_hash_skb(), which returns
jhash_2words(mhash, mhash_inner, 0). Plain ip6ip6 goes through
rt6_multipath_custom_hash_fl6() instead.

For policy 0 with flowi6_proto = 41, the skb result looks the same as
the fl6-only hash, so the precompute appears to do nothing there.
Without the companion patch "ipv6: route: consider IOAM options in ECMP
hash policy 0", it would hash ip_proto = NEXTHDR_HOP and undo the
flowi6_proto = 41 change. That matters for backports of this
Fixes:-tagged patch.

Setting fl6.flowi6_proto = hhdr->nexthdr on its own, without the
precompute, seems to match plain ip6ip6 under every policy. Would it be
better to drop the mp_hash precompute?

The commit message also says:

    precompute fl6.mp_hash from the packet, since ip6_route_output()
    carries no skb and would otherwise drop ICMPv6 quoted-flow and L4
    keys.

Can the ICMPv6 quoted-flow case happen here? ioam6_do_encap() always sets
tuninfo->eh.nexthdr = NEXTHDR_IPV6, so the header after the HBH is
always 41.

[Severity: Medium]
Can this call run the flow dissector without a netns? Under policy 2,
policy 3, and policy 1 when skb->l4_hash is clear, rt6_multipath_hash()
calls skb_flow_dissect_flow_keys(), which passes net = NULL.
__skb_flow_dissect() then takes the netns only from skb->dev or skb->sk:

	if (skb) {
		if (!net) {
			if (skb->dev)
				net = dev_net_rcu(skb->dev);
			else if (skb->sk)
				net = sock_net(skb->sk);
		}
	}

	DEBUG_NET_WARN_ON_ONCE(!net);

In ENCAP mode, locally generated packets can reach this branch with both
fields NULL. One example is an RST sent for a closed port:

tcp_v6_send_reset(NULL, ...)
  tcp_v6_send_response()
    ip6_xmit(ctl_sk, buff, ...)
      NF_HOOK(..., dst_output)
        lwtunnel_output()
          ioam6_output()
            rt6_multipath_hash(net, &fl6, skb, NULL)

When sk is NULL, buff comes from alloc_skb() with no socket attached.
ip6_xmit() sets skb->dev only on the EMSGSIZE path, after NF_HOOK has
returned.

On CONFIG_DEBUG_NET kernels this warns on the first cache miss on each
CPU. On all kernels, an attached netns BPF flow dissector is skipped for
these packets. Before this patch, ioam6_output() never passed an skb to
the multipath hash.

> +
> +			dst = ip6_route_output(net, NULL, &fl6);

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261103-ipv6_ioam_ecmp-v2-0-6ef0318bdb5e%40kylinos.cn
