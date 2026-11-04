Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793753086;
	b=qmdkJok+LBzNrcWtO+k0OT436dHlEudbEfeTtAo7E4R01xfF31uXPIHTkQOt4VO3zOrM
	 X5WdQyVyqycMubhW74REgC0AffsFTFP756M2T5mXcMJqot7V5qo5owl6wX+udm47J/yyw
	 qDzOu8h5fiif/F1rGhpLmt0bPz3zCca9ViT87TgSEfRhu4xvqUStcBzy5+on9/lpx3bR7
	 8M+9qLFhNkm8Gsc9DH+ei+LdXMLTLI9uja08m27oncSVx4v5uoXwUN7tFp2DOwQUC9RgK
	 MvInqyiPv5tYyYb0fC8o0NbuX+A5S4b/jbe2H0kJp4OSfkNHSGKeu/U6IXf1CmGsWgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793753086;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=PsrR4FNwWm2q0q+FvHbe5ukz7x1WrcxMmzLcTOmpAuk=;
	b=TA0H+7Sc2QBNU+0T6tO5WMrQ0CiOXlXrRt6USHi2dtJ6Y5zQ5OAjdVyWhkZfYDAMGVqh
	 a0i4DzKOP+eGi2DkltC5tEa50Amh65d6tO5NR8swtl2B8RCFgp1CB6HpjRJjuReHgW/G4
	 lpIDNAqnXPustl4+FANPDY0Bh+LIdaRS8RnYARTXsaMmxlkGb/XZE5nvECTX/ECkxXvhk
	 ks+C4iSgxE+80ZD9jCjfA77wsPZ+1X2Z2y34GgnxWFDB4+lSAQ5XsUVxxZeYVtTM7eNpT
	 KWjL5RksGNQ7hvnrN46DmwJ6hAbmHLpTjzFQpJvln/aLz+ffGmjfIYjqAsIadA++1FQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D1TVuWUY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF4A606A333;
	Wed,  4 Nov 2026 00:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D1TVuWUY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ECC61F00919;
	Wed,  4 Nov 2026 00:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793753085;
	bh=PsrR4FNwWm2q0q+FvHbe5ukz7x1WrcxMmzLcTOmpAuk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=D1TVuWUYLFQPh1wsmnj80WFmV4A4YU7pSShUEpnkp5ttEiK8nA8XAMPIzqnXNowoO
	 gmSscsGS+bh/MqBzV1JTx9QTDKM7uxC/7vSrhhFPPziZz4dxWSL1nTVzS4Vv2B840X
	 +xWAC2YqkyHLsTt4SrffX/wEec13Qe24KG8tS07S+6hqBus+2WsXuzECDkpQHJS90k
	 UpSH/n3GIyajyHXe7oblci0IqFc6uvN+LOYezzskSviwjnh4NobLSGadfiI171QVBD
	 bxZC8jk9PX3izfx2T6ADtqbQAv9v6wR+9EiZPW1NQT7/xEOKp58rLj18URpAKwowdF
	 /OjWFsGyqeHUQ==
Subject: Re: [PATCH net v4 3/7] ipv4: icmp: don't quote decrypted payload in
 icmp errors
From: netdev-bot+sashiko@kernel.org
To: toddfreed@meta.com
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 sashiko-bot@kernel.org, kuba@kernel.org, bjorn@kernel.org
Date: Wed, 04 Nov 2026 00:44:44 +0000
Message-ID: <179375308460.488856.510323858739771391@kernel.org>
In-Reply-To: <20261103001143.246081-4-toddfreed@meta.com>
References: <20261103001143.246081-4-toddfreed@meta.com>
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] In net/ipv4/icmp.c:__icmp_send(), the PSP-vs-kTLS check fails
  open.
- [Low] Concern: icmp6_send() in net/ipv6/icmp.c has no
  skb_is_decrypted()/SKB_EXT_PSP handling, so ICMPv6 errors would still…

--

ipv4: icmp: don't quote decrypted payload in icmp errors

This patch changes __icmp_send() so it no longer quotes device-decrypted
data in ICMP errors. For kTLS rx offload skbs, the quote is cut off at the
end of the TCP header and the RFC 4884 extension is skipped. For received
skbs with SKB_EXT_PSP, no error is sent at all.

> diff --git a/net/ipv4/icmp.c b/net/ipv4/icmp.c
> index 90c0e22c29bea..d522488475b61 100644
> --- a/net/ipv4/icmp.c
> +++ b/net/ipv4/icmp.c

[ ... ]

> @@ -979,6 +981,32 @@ void __icmp_send(struct sk_buff *skb_in, int type, int code, __be32 info,
>  	if (rt->rt_flags & (RTCF_BROADCAST | RTCF_MULTICAST))
>  		goto ende;
>  
> +	/* Don't send the decrypted part of an skb onto the network */
> +	if (unlikely(skb_is_decrypted(skb_in))) {

[Severity: Low]
This only covers IPv4. In this patch, icmp6_send() in net/ipv6/icmp.c
still has no skb_is_decrypted() or SKB_EXT_PSP check. An ICMPv6 error
about a kTLS or PSP decrypted skb would still quote the decrypted payload
and the RFC 4884 extension.

The next patch in the series, "ipv6: icmpv6: don't quote decrypted
payload in icmpv6 errors", seems to add the same handling to icmp6_send().
So the series as a whole closes this gap.

If this patch is backported to stable without the IPv6 one, ICMPv6 stays
uncovered. Should the two be kept together for backports, or should this
commit mention the IPv6 follow-up?

> +		if (!skb_in->skb_iif) {
> +			/* A locally originated skb to be encrypted. Permit
> +			 * the packet to be quoted, if its source address is
> +			 * local. otherwise skip.
> +			 */
> +			if (!(rt->rt_flags & RTCF_LOCAL))
> +				goto ende;
> +		} else if (psp_skb_is_decrypted(skb_in)) {
> +			/* PSP encrypts the transport header too, so it should
> +			 * not be quoted. But an error whose quote is truncated
> +			 * to fewer than 8 bytes of the transport header won't
> +			 * be processed, so just skip it.
> +			 */
> +			goto ende;
> +		} else {
> +			/* TLS offload leaves the tcp header in the clear and
> +			 * so can be quoted up to its end. A psp skb whose inner
> +			 * tunnel was decapsulated also ends up here, since
> +			 * skb_scrub_packet() drops SKB_EXT_PSP.
> +			 */
> +			decrypted = true;
> +		}
> +	}

[Severity: Medium]
Can PSP traffic fall through to the kTLS branch in more cases than the
tunnel decap case named in the comment?

psp_skb_is_decrypted() only checks for SKB_EXT_PSP. skb_scrub_packet()
resets the extensions but leaves skb->decrypted set:

net/core/skbuff.c:skb_scrub_packet() {
	skb->pkt_type = PACKET_HOST;
	skb->skb_iif = 0;
	skb->ignore_df = 0;
	skb_dst_drop(skb);
	skb_ext_reset(skb);
	...
}

bpf_redirect_peer() at tc ingress goes through skb_scrub_packet() in
skb_do_redirect():

net/core/filter.c:skb_do_redirect() {
	...
	if (flags & BPF_F_PEER) {
		...
		skb_scrub_packet(skb, false);
		...
		skb->dev = dev;
		dev_sw_netstats_rx_add(dev, skb->len);
		return -EAGAIN;
	}
	...
}

Receive then runs again in the peer netns, so skb_iif is non-zero again.
An ingress bpf_redirect() looks similar:

__bpf_rx_skb()->____dev_forward_skb()->skb_scrub_packet()

On those paths, a PSP decrypted skb reaches __icmp_send() with skb_iif
set but without SKB_EXT_PSP. It takes the decrypted = true branch. The
quote then holds the IP header plus max(th->doff * 4, 8) bytes of L4
header.

That is up to 60 bytes of TCP header (ports, seq/ack, window, options)
that PSP encrypted on the wire, sent back in a cleartext ICMP error. For
a non-TCP inner protocol it is 8 bytes of L4 header.

A netfilter REJECT, TTL exceeded or frag needed in the target netns could
trigger this. Host routed or bridged forwarding doesn't seem affected,
because sk_validate_xmit_skb() drops decrypted skbs that have no socket.
The BPF redirect and tunnel decap paths skip that check.

The commit message says "don't send the error at all for psp", but these
paths still quote the encrypted transport header. Would it be safer to
fail closed, for example by quoting only when the skb is known to be
kTLS, instead of whenever SKB_EXT_PSP is missing?

The IPv6 patch later in the series appears to have the same fallback.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261103001143.246081-1-toddfreed%40meta.com
