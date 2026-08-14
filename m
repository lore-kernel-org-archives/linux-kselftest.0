Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A7B1A0BD0;
	Fri, 14 Aug 2026 01:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786670860; cv=none; b=GdeG+kWPSmBZ/pRA0Kfp6cas2XPdxkYGGTXteBxf8vZ/1rKUFWxZdx3bjkbHOV0ptqw2AFAAnYwJJeh4iRm2Od5yD3/zrGxtoz+GU0MWFkkt9wofCi5wsvB51imwEOj+kzEqGbEvff+iXaqm/H46vRCbM9jgimMXiSxfN3hoH7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786670860; c=relaxed/simple;
	bh=9ht/Gs1Wi1jhOcU07V/4EiIyXLEVHPpB7193teXI8Hg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vcy8zChANjsEZxfBEXol8fZXDglgmge/px8S0OSqk3RE59S6B+aehOi55ksjaRc3NVNj2POYlLJtpPUUW3V06NF6gEs4P5ISGf/3clkFvYftbl2dE1Un+6Yg0+IsYCNudy60dQI5WpetKcNxIJM1vIINv4OnkL5HpL34fEx6e8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jXj+sOwv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jXj+sOwv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34CAE1F000E9;
	Fri, 14 Aug 2026 01:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786670858;
	bh=NKp5nj67sIIjXrFCnJ/FaG40rXKWNZFO3HsQurLj9Ww=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jXj+sOwvOLxSr3K1vwlw4xkrtxrSJh0K9DNXHmiQkd6HJHZwsYZVBouv66k6dvVRf
	 gRpLYDlNtCMAaA3T5akum3B8WwCOLuZhAZiO1Wj/QEBZdLCOwVM6GtTrOllEuifhtQ
	 wcyU58X+yM2jVhFA8NkuZo+0D/1i+ayd2tXugEl8+lnPqzbL9IsBCIQJkAVB6PqEWg
	 YE31AQRPaVh4oUWUu6LCeXLWJ6hZ+cHrvLyKBf6sLQKPdUxU07W+4HgOZwL/S+dHGc
	 fQPhzDPxr0OKjAt5mpbDzSmCQn1nLEldGvqudhfiYigrw3WJfpZt3/h3veS07AWbXF
	 ygfWHlwn3txiQ==
From: Jakub Kicinski <kuba@kernel.org>
To: xiexinet@gmail.com
Cc: Jakub Kicinski <kuba@kernel.org>,
	davem@davemloft.net,
	pabeni@redhat.com,
	edumazet@google.com,
	horms@kernel.org,
	shuah@kernel.org,
	lukma@denx.de,
	m-karicheri2@ti.com,
	fmaurer@redhat.com,
	luka.gejak@linux.dev,
	bigeasy@linutronix.de,
	ali@iusegentoo.com,
	qingfang.deng@linux.dev,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net v3 1/3] net: hsr: privatize interlink-bound skbs before address mutation
Date: Thu, 13 Aug 2026 18:27:36 -0700
Message-ID: <20260814012736.2805965-1-kuba@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260808004525.1551-2-xiexinet@gmail.com>
References: <20260808004525.1551-2-xiexinet@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
---
net: hsr: privatize interlink-bound skbs before address mutation

This adds an skb_cow() call in hsr_xmit() for interlink egress when the
frame either came in on the master port or is locally destined without
being local-exclusive, dropping the egress if the copy fails. The stated
goal is to stop hsr_deliver_master() and hsr_xmit() from writing
different source addresses into shared data.

> diff --git a/net/hsr/hsr_forward.c b/net/hsr/hsr_forward.c
> index 0774981a65c1..67aaf5a8622b 100644
> --- a/net/hsr/hsr_forward.c
> +++ b/net/hsr/hsr_forward.c
> @@ -420,6 +420,22 @@ static void hsr_deliver_master(struct sk_buff *skb, struct net_device *dev,
>  static int hsr_xmit(struct sk_buff *skb, struct hsr_port *port,
>  		    struct hsr_frame_info *frame)
>  {
> +	/* An interlink-bound skb from get_untagged_frame() can still alias
> +	 * another live consumer: for master-originated frames the clone
> +	 * shares the original TX skb (which taps or the TX path may still
> +	 * hold); for ring frames the master also consumes them when they
> +	 * are destined to the local node without being exclusive to it.
> +	 * Privatize before any address mutation.
> +	 */
> +	if (port->type == HSR_PT_INTERLINK &&
> +	    (frame->port_rcv->type == HSR_PT_MASTER ||
> +	     (frame->is_local_dest && !frame->is_local_exclusive)) &&
> +	    skb_cow(skb, 0)) {
> +		frame->port_rcv->dev->stats.rx_dropped++;
> +		kfree_skb(skb);
> +		return NET_XMIT_DROP;
> +	}
> +

[Severity: Medium]
Is the enumeration in this comment complete?  The unconditional interlink
source-address rewrite is pre-existing and was not introduced by this
patch, but the new guard and the commit message claim ("Other interlink
traffic keeps its zero-copy behavior") assert that the uncovered cases are
safe, and there looks to be one that isn't.

For an untagged ring frame, handle_std_frame() keeps the received skb:

net/hsr/hsr_forward.c:handle_std_frame() {
	frame->skb_hsr = NULL;
	frame->skb_prp = NULL;
	frame->skb_std = skb;
	...
}

and hsr_get_untagged_frame() hands the interlink a plain clone of that
skb.  So the interlink egress skb shares the receive head with any clone
already taken by a ptype_all tap, since __netif_receive_skb_core() runs
the deliver_skb() loop over skb->dev->ptype_all before it dereferences
skb->dev->rx_handler, and packet_rcv() then queues its skb_share_check()
clone on sk_receive_queue where the bytes are copied to userspace only
later.

For a remote unicast frame addressed to a SAN behind the RedBox,
check_local_dest() leaves frame->is_local_dest false (pkt_type is
PACKET_OTHERHOST) and frame->port_rcv->type is SLAVE_A or SLAVE_B, so the
new predicate is false, no copy happens, and the rewrite lower down in
hsr_xmit() still touches the shared data:

	if (port->type == HSR_PT_INTERLINK)
		ether_addr_copy(eth_hdr(skb)->h_source,
				port->hsr->macaddress_redbox);

Would the tap consumer on the ring slave then read the RedBox MAC instead
of the real source MAC?  Reaching this needs an HSR RedBox whose ring
slave advertises NETIF_F_HW_HSR_TAG_RM, so that untagged ring ingress is
forwarded rather than passed up:

net/hsr/hsr_slave.c:hsr_handle_frame() {
	if (!(port->dev->features & NETIF_F_HW_HSR_TAG_RM) &&
	    port->type != HSR_PT_INTERLINK &&
	    hsr->proto_ops->invalid_dan_ingress_frame &&
	    hsr->proto_ops->invalid_dan_ingress_frame(protocol))
		goto finish_pass;
	...
}

At this patch alone the same case also mutates a real on-wire frame,
because hsr_create_tagged_frame() and prp_create_tagged_frame() return a
bare clone of frame->skb_std for NETIF_F_HW_HSR_TAG_INS devices:

	} else if (port->dev->features & NETIF_F_HW_HSR_TAG_INS) {
		return skb_clone(frame->skb_std, GFP_ATOMIC);
	}

That second aliasing consumer is removed later in the series by "net: hsr:
return private clones from the tagged-frame helpers", which switches those
helpers to hsr_clone_private(), so only the tap aliasing remains at the
end of the series.

Since skb_cow(skb, 0) is a no-op for a non-cloned skb (__skb_cow() only
calls pskb_expand_head() when skb_cloned() or extra headroom is needed),
could the call be keyed on the actual sharing state, or simply made
unconditional for HSR_PT_INTERLINK, instead of on the topology predicate?
-- 
pw-bot: cr
