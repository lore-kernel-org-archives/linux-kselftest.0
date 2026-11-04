Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793753085;
	b=s5q8/eaSKeW8+WY2qKVolhjAZulZx892WBe64tUPWXuHxec1ZtU1J8JNS0oYqYtW18de
	 KfZHGiEkCmq0me9bVIWxr2CSddzPXqWnAFLESrk1aQzOeAOyAxmhrjo5R+8sHkfQPq/nG
	 bz/SWCdmsDX21Dvp6qvs0dSRWfebzog7WHHz4aib2HZ4Bw4fucWdRqy+KmmOJmORGqGZw
	 EpTTCcf4I0/H3pBNaeZRV4JQIdI1oT1WNQucuDZsjDu7mDKBjQTH86I9/cRNfUk6oEgas
	 hT3j446FaUmLJfpqvAWdKp1T8t6cpIVLAtMr/1B3NyVW03HnfPU5Lxoo8Eor1IamSOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793753085;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Jre6mNlia4lO0vOgzXU982il6damrPS9ITgvm+XnwMk=;
	b=oKgpmUX2w31uHqicG0eZGwMH8JBUO1fLEsDFg8rOAObKaiHdv5Vfoha2kZ8AzGkGmbRg
	 p379DqlalYt110qS8Dxj5pdgcZmzEvLeEoDBVZGnyjCZEMMQLkyUl2VUIXzc3ufPbjPzn
	 64p5QES7Znp4TAofOzGmFHoVRVADKA5gkKsx/+jAaOiG/XFRxQV+q1SVWfjel5Q+2jh4y
	 KScXC+Ov5PZvvb+N1SO4kqoYuWfuS4HLarbfnSc8Z6Oict6tlucUYZYMdsA8vNwt4Zcl+
	 nLKBs76aIYBMB+i0NTaFxUozESkcC2VssXHGiiUc1SI74Wib7t1MkgghX67AB8+So1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TDxA0ZLg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C203B606A328;
	Wed,  4 Nov 2026 00:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TDxA0ZLg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 133171F000C1;
	Wed,  4 Nov 2026 00:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793753084;
	bh=Jre6mNlia4lO0vOgzXU982il6damrPS9ITgvm+XnwMk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=TDxA0ZLgZvMhZGIe4+NRxPSflwTeRfXZmIkAoBASu5bFwd1qoY5Hl8WNfB/VgAa6u
	 uc25kIjyq8JMVAfVEd6l79mr57XA39BV/LXCRIZty71u/SYS60BZh5R3WZwZIuCXYr
	 MsqTqSM1Gd2UsCMuds5/MShl8ImO7R/22yO2TaraWj5GoBXba8tAUCHC1HGjMy2cqh
	 d1h3nERtJIeusUFylsjfB1MrqX9hg8Vq+PJ4i7dLD6O1Amu1ElU+Pww4kh91nYmd90
	 p22lulppZKAHoBvq0weQ/KBmugS0yMFZ+q+/COmfSdBy15vrjOjMUL0FFHVfxOT8ZL
	 QwDp8X1M2CnKg==
Subject: Re: [PATCH net v4 2/7] net: don't fragment decrypted skbs
From: netdev-bot+sashiko@kernel.org
To: toddfreed@meta.com
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 sashiko-bot@kernel.org, kuba@kernel.org, bjorn@kernel.org
Date: Wed, 04 Nov 2026 00:44:43 +0000
Message-ID: <179375308359.488856.7259635335257893530@kernel.org>
In-Reply-To: <20261103001143.246081-3-toddfreed@meta.com>
References: <20261103001143.246081-3-toddfreed@meta.com>
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 0 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The patch is titled "net: don't fragment decrypted skbs", but
  the check it adds lives only in the IPv4 fragmenter, ip_do_fragment()…

--

net: don't fragment decrypted skbs

This patch makes ip_do_fragment() drop skbs that have skb->decrypted set
and return -EMSGSIZE. Without it, fragments of a kTLS offload or PSP
packet lose the decrypted mark and can be sent unencrypted. The commit
message says IPv6 needs no change, because ip6_fragment() refuses
oversized skbs unless ignore_df is set.

> diff --git a/net/ipv4/ip_output.c b/net/ipv4/ip_output.c
> index eaa6fabda347e..415bc4d524b58 100644
> --- a/net/ipv4/ip_output.c
> +++ b/net/ipv4/ip_output.c
> @@ -770,6 +770,14 @@ int ip_do_fragment(struct net *net, struct sock *sk, struct sk_buff *skb,
>  	struct ip_frag_state state;
>  	int err = 0;
>  
> +	/* psp and tls offload need the packet's l4 header, which non-initial
> +	 * fragments do not have
> +	 */
> +	if (unlikely(skb_is_decrypted(skb))) {
> +		err = -EMSGSIZE;
> +		goto fail;
> +	}
> +

[Severity: High]
Does ip6_fragment() need the same check? The commit message says:

  an ipv6 tcp socket does not ever emit fragments. ip6_fragment() refuses
  skbs bigger than the mtu unless ignore_df is set, which tcp doesn't set.

TCP doesn't set ignore_df itself, but IPVS sets it on locally generated
IPv6 skbs, for example in ip_vs_bypass_xmit_v6() and ip_vs_dr_xmit_v6():

net/netfilter/ipvs/ip_vs_xmit.c:ip_vs_dr_xmit_v6() {
    ...
	/* Another hack: avoid icmp_send in ip_fragment */
	skb->ignore_df = 1;
    ...
}

When ignore_df is set, the only size check in ip6_fragment() does not
fire:

net/ipv6/ip6_output.c:ip6_fragment() {
    ...
	mtu = ip6_skb_dst_mtu(skb);
    ...
	if (unlikely(!skb->ignore_df && skb->len > mtu))
		goto fail_toobig;
    ...
}

IPVS has its own MTU check in __ip_vs_get_out_rt_v6() ->
ensure_mtu_is_adequate(), but that check uses dst_mtu(&rt->dst).

ip6_skb_dst_mtu() switches to the device MTU when the socket has
IPV6_PMTUDISC_PROBE or higher set:

	if (np && READ_ONCE(np->pmtudisc) >= IPV6_PMTUDISC_PROBE) {
		mtu = READ_ONCE(dst_dev(dst)->mtu);

ip_metrics_convert() caps RTAX_MTU at 65520, not at the device MTU, so a
route MTU above the device MTU is accepted.

That seems to open this path for an IPv6 kTLS offload or PSP socket that
uses IPV6_PMTUDISC_PROBE, INTERFACE or OMIT and connects to an IPVS
service over such a route:

ip6_xmit()
  NF_INET_LOCAL_OUT hook
    ip_vs_dr_xmit_v6()          /* passes dst_mtu() check, sets ignore_df */
      ip_vs_send_or_cont()
        ip6_output()
          __ip6_finish_output() /* skb->len > dev->mtu */
            ip6_fragment()
              ip6_frag_next()   /* alloc_skb() + ip6_copy_metadata() */

ip6_copy_metadata() doesn't copy ->decrypted, so every fragment reaches
the device with decrypted == 0.

Wouldn't the TLS or PSP payload then go out in cleartext, as it does in
the IPv4 case without this patch?

The setup is similar to the IPv4 reproducer in the commit message: a
manipulated route MTU plus a PMTU socket option. Later patches in the
series don't touch net/ipv6/ip6_output.c.

Could the same skb_is_decrypted() check be added at the top of
ip6_fragment(), and the ipv6 paragraph of the commit message updated?

>  	/* for offloaded checksums cleanup checksum before fragmentation */
>  	if (skb->ip_summed == CHECKSUM_PARTIAL) {
>  		err = ip_check_csum_start(skb);

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261103001143.246081-1-toddfreed%40meta.com
