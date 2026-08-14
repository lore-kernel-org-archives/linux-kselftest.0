Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A15D298CAB;
	Fri, 14 Aug 2026 01:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786670862; cv=none; b=dQDBUgqWgJMmPPi+t3fKA+1kV96I6pDd3fui7YRfZ9RZt31wIDrCa8iyRBjMsu7I/8pnPulPlBeFemycKHP5+CUtxJ/NG30fvI2ROT7nBFGE6AElUDd0g6G6Us87MymbiOSjiFPS4aImwj6Lpn2ZBV+dx2mRWCnRNMJB+JKQUkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786670862; c=relaxed/simple;
	bh=sjN7iYiIHtWKttB7hI44kZxqyj62IVm4YP4bJFZUS2s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ivmgccfoCeDf8LBSy+M1lON72q88O5bBHP2uQ1uA1flOR9hm+sCT/Kf2Q4JuU1GGMFUe1Hwp+bTMhOVGceUyDSzuevz2+dT8gD5uTfbjpL5HUhzi+XgV+zozByeBcNCRlmipwnxmhokMVqEL+jhUerCr0nPrFykqsZFVeJZkmNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UD2cenGu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UD2cenGu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7082B1F00A3A;
	Fri, 14 Aug 2026 01:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786670859;
	bh=XMT9ODI8CAgq9T5aUkHEupFIq5bist2KMZUqLNGDrAY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=UD2cenGuHT4Q3J3Cvprv7dr/FAAgG5me4NfFUZ+g2K7Hy5BhVfrNs0DjCp/QnKTua
	 ap5txr31uts/gxeZaMOGI03cAJlj5IZpYlgKbh0SxiJaaCY1jSQmS4t4xBCwjBxcBe
	 WsIolvhFp0+l97e0MmWMSQoh7RDq5Emu2Qvs1AEa+Azq+pkrzciacs85TZIs6ImHZP
	 VQeHUjpKncmQi8/JtcIOjshrpQma6HvSQHxk6vMzRoADUfFr00WhP4wNrDkr90iDBM
	 Pr05YDe68bwDwfWBwRGuQdJsAkt4H+JUz/q6rKR6YRl7//2cx2aP9ud6BXs7XN72Ct
	 z9UUI+edrGskw==
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
Subject: Re: [PATCH net v3 2/3] net: hsr: return private clones from the tagged-frame helpers
Date: Thu, 13 Aug 2026 18:27:38 -0700
Message-ID: <20260814012738.2806035-1-kuba@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260808004525.1551-3-xiexinet@gmail.com>
References: <20260808004525.1551-3-xiexinet@gmail.com>
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
net: hsr: return private clones from the tagged-frame helpers

This adds hsr_clone_private() (skb_clone() followed by skb_cow()) and uses
it in hsr_create_tagged_frame() and prp_create_tagged_frame(), including
both NETIF_F_HW_HSR_TAG_INS branches, so that per-egress path/LAN id writes
land in private linear data. Tag and trailer pointers are reacquired after
the copy.

> diff --git a/net/hsr/hsr_forward.c b/net/hsr/hsr_forward.c
> index 67aaf5a8622b..efcbf3cf26f9 100644
> --- a/net/hsr/hsr_forward.c
> +++ b/net/hsr/hsr_forward.c
> @@ -325,8 +325,29 @@ static struct sk_buff *hsr_fill_tag(struct sk_buff *skb,
>  	return skb;
>  }
>  
> -/* If the original frame was an HSR tagged frame, just clone it to be sent
> - * unchanged. Otherwise, create a private frame especially tagged for 'port'.
> +/* Clone an skb and make the clone's data private, so that per-egress
> + * writes cannot corrupt the original skb or other clones of it.
> + * Returns NULL on allocation failure.
> + */
> +static struct sk_buff *hsr_clone_private(struct sk_buff *skb)
> +{
> +	struct sk_buff *clone;
> +
> +	clone = skb_clone(skb, GFP_ATOMIC);
> +	if (!clone)
> +		return NULL;
> +	if (skb_cow(clone, 0)) {
> +		kfree_skb(clone);
> +		return NULL;
> +	}
> +
> +	return clone;
> +}
> +
> +/* If the original frame was an HSR tagged frame, return a private clone
> + * of it with the path id updated for 'port'. Otherwise, return a private
> + * clone for hardware tag insertion, or create a private frame especially
> + * tagged for 'port'.
>   */
>  struct sk_buff *hsr_create_tagged_frame(struct hsr_frame_info *frame,
>  					struct hsr_port *port)
> @@ -336,14 +357,18 @@ struct sk_buff *hsr_create_tagged_frame(struct hsr_frame_info *frame,
>  	int movelen;
>  
>  	if (frame->skb_hsr) {
> -		struct hsr_ethhdr *hsr_ethhdr =
> -			(struct hsr_ethhdr *)skb_mac_header(frame->skb_hsr);
> +		struct hsr_ethhdr *hsr_ethhdr;
> +
> +		skb = hsr_clone_private(frame->skb_hsr);
> +		if (!skb)
> +			return NULL;
>  
>  		/* set the lane id properly */
> +		hsr_ethhdr = (struct hsr_ethhdr *)skb_mac_header(skb);
>  		hsr_set_path_id(frame, hsr_ethhdr, port);
> -		return skb_clone(frame->skb_hsr, GFP_ATOMIC);
> +		return skb;
>  	} else if (port->dev->features & NETIF_F_HW_HSR_TAG_INS) {
> -		return skb_clone(frame->skb_std, GFP_ATOMIC);
> +		return hsr_clone_private(frame->skb_std);
>  	}
>  
>  	/* Create the new skb with enough headroom to fit the HSR tag */

[Severity: High]
This isn't a bug introduced by this patch, but should the sibling
get_untagged_frame() callbacks be privatized the same way?

hsr_get_untagged_frame() and prp_get_untagged_frame() still end with:

	return skb_clone(frame->skb_std, GFP_ATOMIC);

and their consumer writes into that still-shared linear data:

net/hsr/hsr_forward.c:hsr_deliver_master() {
	was_multicast_frame = (skb->pkt_type == PACKET_MULTICAST);
	hsr_addr_subst_source(node_src, skb);
	skb_pull(skb, ETH_HLEN);
	...
}

net/hsr/hsr_framereg.c:hsr_addr_subst_source() {
	...
	memcpy(&eth_hdr(skb)->h_source, node->macaddress_A, ETH_ALEN);
}

Since that clone shares data with frame->skb_std, can the substituted
source address leak into the ring egress built later in the same
hsr_forward_do() loop?  For an untagged frame frame->skb_hsr is NULL, so
the slave iterations take either

	skb = __pskb_copy(frame->skb_std,
			  skb_headroom(frame->skb_std) + HSR_HLEN, GFP_ATOMIC);

or, with NETIF_F_HW_HSR_TAG_INS, the new hsr_clone_private(frame->skb_std)
above, both of which copy the already-mutated bytes.

Port order looks like it puts master first: hsr_dev_finalize() calls
hsr_add_port() for MASTER, then SLAVE_A/SLAVE_B (and INTERLINK), and
hsr_add_port() uses list_add_tail_rcu().

The substitution is only a no-op when node->macaddress_A already equals
h_source.  hsr_get_node() also matches on macaddress_B:

net/hsr/hsr_framereg.c:hsr_get_node() {
	...
		if (ether_addr_equal(node->macaddress_B, ethhdr->h_source)) {
	...
}

and hsr_handle_sup_frame() populates macaddress_B from a supervision
frame's source, so macaddress_A and h_source can differ.

The comment this series added to hsr_xmit() states the rule:

	/* An interlink-bound skb from get_untagged_frame() can still alias
	 * another live consumer: ...
	 * Privatize before any address mutation.
	 */

but the skb_cow() there is applied only for port->type == HSR_PT_INTERLINK,
which leaves the master delivery path out.  Would it be simpler to make
the get_untagged_frame() callbacks return private clones too, so the
contract holds for every consumer?

One more consumer of the same bytes: an AF_PACKET listener on the slave
device gets its clone in packet_rcv() before hsr_handle_frame() runs, so
does it also observe the rewritten h_source?
