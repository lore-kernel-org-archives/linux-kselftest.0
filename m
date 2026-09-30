Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 789C2175A89;
	Wed, 30 Sep 2026 18:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790793247; cv=none; b=K/n8v0LH7NDyEVHto+QZ02CI8cSv4oyO1ozQW/ZWtsbLqxS7D96q/KGDnARqHKhGnF+qo/KWoptK8z09h0T9vk02PJz033UapgZ4hSF3xcOxBMUPwXleH47cyUSYqd1Yr7C/qhed6aXHuI+KBV4lyxovPXl1vEI02y8ocNNLQ4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790793247; c=relaxed/simple;
	bh=jgOz9keS3tRgSl0JmDjgntvXeVQ2gnZuHJr1aH5f42w=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eHbdcU8H7K7bcyYXyEkQKWMc7QFMyJj7HUX8stRudjOVRdP/S23I1eybRGJ/ihXKoKMfiP+QJgmBi7gnx82KG8sY3iJ/UFsSe4XJy3b2Fbdg66Cc5Le6q5rtAoeO/U1PjFkLAQ4q06PhkuK33vBGsNDYN9Ijs0jTQzN3Ku/GvZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YNRD1+yK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YNRD1+yK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46F061F000FF;
	Wed, 30 Sep 2026 18:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790793246;
	bh=Q+YKqfQ3/s8F1tcHSL05pBU5RCUSKJAtNCNMVSPjlCc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=YNRD1+yKqXjQvM/W1AjvE4o86Pl+C2aSyPxA0Ao4ThE4Z3zOVOnwOu/NOsbCLTAon
	 esbMu0iC6VafxLeceo92SEb0LfLwFbZsnVu5QdmkNTf7/dLKGuVG6h+hlIwRkrMhQB
	 mFU0HzV0CNHU0nezmtLEgJLnKy17BUtZL+JDGv4AX9iKMpYkmgF8vZPfxgfCpuEsEt
	 Cxe4UaQVBGxR948+oX27SM5G4+73eKYaRqMXXZnQxk5/oKoIOz7bG3GZJdOMsJH1t0
	 qjcs/ep2iJCONHvOxmK7GKvpcdH7LrFsPAPR9qJc5DV+hzxOwmu1oxIKjbtxm3sC/r
	 V2E1390lNCKNQ==
Subject:
 Re: [PATCH 1/2] net: gso: validate TCP headers before segment length checks
From: netdev-bot+sashiko@kernel.org
To: bestswngs@gmail.com
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, jhs@mojatatu.com, jiri@resnulli.us,
 shuah@kernel.org, netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, xmei5@asu.edu, co+1fe9b56e2c61be5e@bugs.sh
Date: Wed, 30 Sep 2026 18:34:04 +0000
Message-ID: <179079324479.434549.5810038850478297945@kernel.org>
In-Reply-To: <20260927163117.746432-2-bestswngs@gmail.com>
References: <20260927163117.746432-2-bestswngs@gmail.com>
X-sashiko-severity: High
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

Critical: 0 · High: 1 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] Over-strict ordering check rejects valid decapsulated TCP GSO
  traffic.
- [Medium] skb_gso_tcp_header_valid() ends with `return sizeof(struct
  tcphdr) <= tail - transport;`, where tail is the linear tail.

--

net: gso: validate TCP headers before segment length checks

This adds skb_gso_tcp_header_valid(). The helper checks TCP transport
header ordering, linear bounds and fixed header presence before
skb_gso_validate_network_len() and skb_gso_validate_mac_len() compute
segment lengths. It targets a KASAN out-of-bounds read of tcp->doff when
malformed TUN-supplied TCP GSO skbs reach TBF or police.

> diff --git a/net/core/gso.c b/net/core/gso.c
> index bcd156372f4df..7c76f721fe24e 100644
> --- a/net/core/gso.c
> +++ b/net/core/gso.c
> @@ -240,6 +240,29 @@ static inline bool skb_gso_size_check(const struct sk_buff *skb,
>  	return true;
>  }
>  
> +/* TCP segment length reads doff, so validate its header offsets first. */
> +static bool skb_gso_tcp_header_valid(const struct sk_buff *skb)
> +{
> +	unsigned int transport = skb->transport_header;
> +	unsigned int tail = skb_tail_pointer(skb) - skb->head;
> +
> +	if (!skb_is_gso_tcp(skb))
> +		return true;
> +
> +	if (!skb_transport_header_was_set(skb) ||
> +	    transport <= skb->network_header || transport > tail)
> +		return false;

[Severity: High]
Can this ordering check reject valid decapsulated TCP GSO skbs on the RX
path?

After UDP tunnel decapsulation, a valid TCP GSO skb can keep a stale
transport_header. This happens when the tunnel device skips GRO, either
because NETIF_F_GRO is off or because an XDP program is attached, so
netif_elide_gro() is true:

ip_rcv_core()
    skb->transport_header = skb->network_header + iph->ihl*4;  <- outer UDP

vxlan_rcv()->__iptunnel_pull_header()->iptunnel_pull_offloads()
    clears the encap GSO bits and encapsulation,
    leaves transport_header alone

gro_cells_receive()
    if (!gcells->cells || skb_cloned(skb) || netif_elide_gro(dev)) {
        res = netif_rx(skb);
    so inet_gro_receive() never refreshes the transport header

__netif_receive_skb_core()
    skb_reset_network_header(skb);
    ...
    if (!skb_transport_header_was_set(skb))
        skb_reset_transport_header(skb);

That leaves gso_type=TCPV4 and encapsulation=0, with transport_header still
pointing at the outer UDP header. That offset comes before both the inner
mac header and the inner network header.

In that case transport <= skb->network_header is true. The extra
skb->transport_header <= skb->mac_header test in skb_gso_validate_mac_len()
is also true. So both validators return false.

Callers read false as "segments do not fit". tcf_police_mtu_check() runs
this for every policed GSO packet:

    if (skb_is_gso(skb))
        return skb_gso_validate_mac_len(skb, limit);

tcfp_mtu defaults to ~0 when no mtu is given. Before this patch, the
unsigned wrapped arithmetic happened to fit and these packets passed.

Would a police action on the tunnel device's ingress now send every such
GSO packet to the exceed action?

tbf_enqueue() would likewise drop the packet with qdisc_drop() instead of
calling tbf_segment(). skb_tunnel_check_pmtu() would treat it as a PMTU
violation, which produces ICMP FRAG_NEEDED on bridge ports.

This patch is tagged for stable. Would it be safer to reject only an unset
transport header or offsets outside the linear head, or to read doff with
skb_header_pointer(), rather than rely on header ordering?

> +
> +	if (skb->encapsulation) {
> +		transport = skb->inner_transport_header;
> +		if (transport <= skb->inner_network_header ||
> +		    transport < skb->transport_header || transport > tail)
> +			return false;
> +	}
> +
> +	return sizeof(struct tcphdr) <= tail - transport;

[Severity: Medium]
Does this reject TCP GSO skbs whose headers are valid but whose fixed TCP
header is partly in paged frags?

tail here is the linear tail, so the whole 20-byte tcphdr has to be in the
linear area.

Take the IFF_TAP path of tun_get_user() without
VIRTIO_NET_HDR_F_NEEDS_CSUM, which is the producer the commit message
describes. __virtio_net_hdr_to_skb() has no network header yet, so it takes
this branch:

    } else if (gso_type) {
        p_off = nh_min_len + thlen;
        if (!pskb_may_pull(skb, p_off))
            return -EINVAL;
    }

That pulls only 40 bytes counted from the MAC header. With a small hdr_len
and a packet larger than a page, tun_alloc_skb() leaves the rest in frags.
After eth_type_trans(), skb_probe_transport_header() sets transport to
network + 20 for a valid IPv4 header. Only 6 TCP bytes are then linear.

Before this patch, such a packet was forwarded, or segmented by
skb_gso_segment(), which pulls headers properly. tcp_hdrlen() did read
stale tailroom bytes on that path.

Now both validators report the packet as too big. For example, in
ip_exceeds_mtu():

    if (skb_is_gso(skb) && skb_gso_validate_network_len(skb, mtu))
        return false;

the packet gets ICMP_FRAG_NEEDED and is dropped. ip6_pkt_too_big(),
skb_tunnel_check_pmtu(), tbf_enqueue(), execute_check_pkt_len() and
tcf_police_act() get the same false result.

The commit message doesn't mention that header linearity failures are now
reported as MTU violations.

The validators take a const skb and cannot pull. Would reading doff through
skb_header_pointer() avoid the out-of-bounds read without rejecting
non-linear but valid headers?

> +}
> +

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260927163117.746432-2-bestswngs%40gmail.com
