Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.68
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793950708;
	b=l/yvwacRMYfBfL2R0/VODRT547Bg4KpaKy7+WddogwUI4OtX7ZkrjVcp6FXZD3W/Nl1G
	 2U7lZ57mAAdYVwYoFckQzqbynOdobWSxtGHzx1FnmZLUbEAu2anP/6FhmcNXWBdFoh9ZN
	 9uvJ3iLtw6qz8jd5m7aCHWyo9hrwiDbBirZ3C//ijj3MTQWeYa4n3tehY6rvTLv4LTgpv
	 INwhQh9ibZWvITGo4l9KHbAf/KLKUI3n1O+8inb9AtSvBx5lvBMOp64j02kzIAmkvxsB8
	 iZNwqzruuf+HYhOTbwPG+kajuz2JL6qm6NInUa1/t2BnmM0CvL4zn8OhuS79BWkus0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793950708;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=yqj2X60t6GkEB0Hd3slamrcdw7uuMt8wIZvLf0iaHgw=;
	b=QOOsCv1mE8a4y4YAKyxgs25fnAUEHx9sA5/yqBrHz3s0N75NtR+Oy4NyVP+aM7oVpByL
	 LyajF6M/oLiG5OlxOaX4rDeNn0fMyJRT8GbDX2EmIJMvAT9vGUfIv5tcN+cI6/7nr3XyV
	 uf/p71qUkYEkI+kKA5GUBRZY0Sse9KBzVNzfgVTaVkDebXQcHi1UQmXNqqYw3TQQwpHf6
	 YgOpD7zC5gkJGxhOtuj1/Q6qECvS2thcfY7oR3tUsyy6KvN2GvOFW8jiL9i63Vnay9B77
	 Py/4HzzevAb1TP4ZKseocUzWW16d/jw4sDl7wLN03uhHfyGrjiuwEewMd9N2xnZZRNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=tH0ObvQ3;
	arc=none smtp.remote-ip=91.218.175.68
Received: from mta0.migadu.com (out-68.mta0.migadu.com [91.218.175.68])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6C5606A334
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Nov 2026 07:38:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED6C5606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=tH0ObvQ3
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=vxGWNLncSlcQs4swV+6nfyQ5Qh5FfXbxSfHWmDFVw98=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793950705; v=1; x=1794555505;
 b=tH0ObvQ3DbFZNgYhD58A1r3joh7DYzbyq4OiGkSuCFTqclMOsVruo3MDEVMb/Zo26y+DDasD
 LtuQLIAhVuby9stJeel9e+Q8keyCsV2cULbgZ+u2eH6trynM1duQEfE0ICZs7OoFyrZ1JngDrtA
 OmoEorLIQV2H9Gy/q8A/vQeA=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 288db3607269e5ae;
	Fri, 06 Nov 2026 07:38:24 +0000
X-Mizu-Trace-ID: 288db3607269e5ae
X-Migadu-Flow: FLOW_OUT
Date: Fri, 6 Nov 2026 15:38:14 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: netdev-bot+sashiko@kernel.org
Cc: dsahern@kernel.org, idosch@nvidia.com, davem@davemloft.net,
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
	horms@kernel.org, justin.iurman@gmail.com, shuah@kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org, liuhangbin@kylinos.cn
Subject: Re: [PATCH net v2 2/3] ipv6: ioam6: use transformed packet nexthdr
 for ECMP re-lookup
Message-ID: <au2D5hjp0U1ilXEI@fedora>
References: <20261103-ipv6_ioam_ecmp-v2-2-6ef0318bdb5e@kylinos.cn>
 <179388135485.488856.15442544337186327982@kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <179388135485.488856.15442544337186327982@kernel.org>

On Thu, Nov 05, 2026 at 12:22:34PM +0000, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 2 · Medium: 1 · Low: 0
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [High] The encap cache-miss path in ioam6_output()
>   (net/ipv6/ioam6_iptunnel.c:439) now sets `fl6.mp_hash =…
> - [High] In IOAM6_IPTUNNEL_MODE_AUTO, local packets (inline, !skb->dev)
>   and forwarded packets (encap, skb->dev set) share one per-CPU…
> - [Medium] The new call `rt6_multipath_hash(net, &fl6, skb, NULL)` in
>   ioam6_output() (net/ipv6/ioam6_iptunnel.c:439) passes an output-path…
> 
> --
> 
> ipv6: ioam6: use transformed packet nexthdr for ECMP re-lookup
> 
> This commit changes the dst_cache miss path in ioam6_output(). For inline
> insertion it now reuses orig_dst and caches the fake null_rt. For
> encapsulation it re-looks up the route with flowi6_proto taken from the
> HBH next header and with fl6.mp_hash precomputed from the skb, so that
> the ECMP hash matches the identical packet without IOAM (RFC 9486 C2).
> 
> > diff --git a/net/ipv6/ioam6_iptunnel.c b/net/ipv6/ioam6_iptunnel.c
> > index cfb2c41634a0b..246533276be82 100644
> > --- a/net/ipv6/ioam6_iptunnel.c
> > +++ b/net/ipv6/ioam6_iptunnel.c
> > @@ -405,34 +405,61 @@ static int ioam6_output(struct net *net, struct sock *sk, struct sk_buff *skb)
> >  
> >  	if (unlikely(!dst)) {
> >  		struct ipv6hdr *hdr = ipv6_hdr(skb);
> > -		struct flowi6 fl6;
> 
> [ ... ]
> 
> > +		if (ilwt->mode == IOAM6_IPTUNNEL_MODE_INLINE ||
> > +		    (ilwt->mode == IOAM6_IPTUNNEL_MODE_AUTO && !skb->dev)) {
> > +			dst = orig_dst;
> > +			dst_hold(dst);
> > +
> > +			local_bh_disable();
> > +			dst_cache_set_ip6(&ilwt->cache, &ilwt->null_rt.dst,
> > +					  &hdr->saddr);
> > +			local_bh_enable();
> 
> [Severity: High]
> In AUTO mode, can local and forwarded packets end up using each other's
> cached dst? The miss path is now mode aware. The hit path at the top of
> ioam6_output() still reads one per-CPU cache, whatever the mode:
> 
> 	dst = dst_cache_get(&ilwt->cache);
> 	...
> 	if (dst == &ilwt->null_rt.dst) {
> 		dst_release(dst);
> 
> 		dst = orig_dst;
> 		/* keep refcount balance: dst_release() is called at the end */
> 		dst_hold(dst);
> 	}
> 
> Suppose a local packet misses first, so null_rt is cached. A later
> forwarded packet on that CPU then gets dst = orig_dst and is encapsulated
> with daddr = tundst. Because dst is non-NULL, it skips the tundst
> re-lookup. Because the lwtstates match, it leaves through
> orig_dst->lwtstate->orig_output(). That uses the inner destination's
> route and nexthop, not the route for tundst.
> 
> Now suppose a forwarded packet misses first. The encap branch caches the
> tundst route:
> 
> 	dst_cache_set_ip6(&ilwt->cache, dst, &fl6.saddr);
> 
> Later local packets on that CPU hit this entry and are processed inline.
> They are then sent through the tundst route instead of orig_dst:
> 
> 	if (orig_dst->lwtstate != dst->lwtstate) {
> 		skb_dst_drop(skb);
> 		skb_dst_set(skb, dst);
> 		return dst_output(net, sk, skb);
> 	}
> 
> The shared cache existed before this patch. However, the commit message
> says inline will "reuse orig_dst and cache the fake null_rt, keeping the
> sibling from the original lookup", and that encapsulation "still
> re-looks up". In AUTO mode with mixed traffic, neither seems to hold.
> null_rt is DST_OBSOLETE_NONE, so the stale entry stays until the cache is
> reset.
> 
> Does the hit path need to be mode aware too, for example with separate
> caches for the inline and encap cases?
> 
> > +		} else {
> > +			/* Encapsulation may change the destination (tundst);
> > +			 * re-lookup with the transformed packet keys so the
> > +			 * outer hash matches the identical packet without IOAM.
> > +			 */
> > +			const struct ipv6_opt_hdr *hhdr;
> > +			struct flowi6 fl6;
> > +
> > +			hhdr = (const struct ipv6_opt_hdr *)skb_transport_header(skb);
> > +
> > +			memset(&fl6, 0, sizeof(fl6));
> > +			fl6.daddr = hdr->daddr;
> > +			fl6.saddr = hdr->saddr;
> > +			fl6.flowlabel = ip6_flowinfo(hdr);
> > +			fl6.flowi6_mark = skb->mark;
> > +			fl6.flowi6_proto = hhdr->nexthdr;
> > +			fl6.mp_hash = rt6_multipath_hash(net, &fl6, skb, NULL);
> 
> [Severity: High]
> Does computing mp_hash from the skb break the C2 equivalence that the
> comment above claims? When fl6->mp_hash is non-zero, fib6_select_path()
> uses it as is, so this skb-based value chooses the sibling.
> 
> The comment says the outer hash "matches the identical packet without
> IOAM". A plain ip6ip6 tunnel, ip6_tnl_xmit(), routes with
> ip6_route_output(net, NULL, fl6) and no skb, so it hashes the outer fl6
> keys. With an skb, rt6_multipath_hash() behaves differently for each
> policy.
> 
> Policy 1 returns the inner flow's hash early. ioam6_do_encap() never
> clears that hash:
> 
> 	if (skb->l4_hash)
> 		return skb_get_hash_raw(skb) >> 1;
> 
> Policy 2 dissects through the ip6ip6 header and hashes the inner
> addresses, flowlabel and proto:
> 
> 	skb_flow_dissect_flow_keys(skb, &keys, 0);
> 
> Policy 3 calls rt6_multipath_custom_hash_skb(), which returns
> jhash_2words(mhash, mhash_inner, 0). Plain ip6ip6 goes through
> rt6_multipath_custom_hash_fl6() instead.
> 
> For policy 0 with flowi6_proto = 41, the skb result looks the same as
> the fl6-only hash, so the precompute appears to do nothing there.
> Without the companion patch "ipv6: route: consider IOAM options in ECMP
> hash policy 0", it would hash ip_proto = NEXTHDR_HOP and undo the
> flowi6_proto = 41 change. That matters for backports of this
> Fixes:-tagged patch.
> 
> Setting fl6.flowi6_proto = hhdr->nexthdr on its own, without the
> precompute, seems to match plain ip6ip6 under every policy. Would it be
> better to drop the mp_hash precompute?
> 
> The commit message also says:
> 
>     precompute fl6.mp_hash from the packet, since ip6_route_output()
>     carries no skb and would otherwise drop ICMPv6 quoted-flow and L4
>     keys.
> 
> Can the ICMPv6 quoted-flow case happen here? ioam6_do_encap() always sets
> tuninfo->eh.nexthdr = NEXTHDR_IPV6, so the header after the HBH is
> always 41.

Thanks for the report. This part touch all the policies. I need to think
if I should drop this patch until there is a better fix.

pw-bot: cr
