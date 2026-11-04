Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793753087;
	b=2xncOOY+CYhZ/6eV8/7HbtgTZrzCpWOEtVEZKPC6UgzlpegqrRwIVib6ptCDY6b5wr85
	 KL5lxVfhZtV5cPwOagjECA2n+f90+QBsoR3wAkrq6QHoXdb92AGcBmIj8IgIMrVidhmFF
	 zPkkKSFxqrlrukYWk5sS2Dj809mLFZo3VgsWVfvZUVKA/7TDBqE3ujCsBxc4VtB5EEk7a
	 PJSAx/52j3QzDp/hQz7cEaGIYfuJWn+zkh9ZiAlNheHJd0v/ufhBtA1WcBEEccO/28sZM
	 msiZwOG1eRN8SX3XsCDan0rXznd6vBikWK7fUatrLkxKIzoyNfNfkeNliZD9SVr+wpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793753087;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=9W6m7b6jujG55hqdSy8n9h8hTOdYKRzDblOYhIcp/64=;
	b=XI1ggPxLWViZPgXwkkPf5kawC/CO12clunrZormuTiFtiT8v3X9LnwaqwygWCEnV4uO/
	 +MT0clMkUehkYwtGm6wpphdp6UWm8IkcR9xUqrQJKGKqVDpavPXhWGWW7gJo125zfZMeG
	 mKFknLIfpA02ZXXgQ2PtSuQgAWhljgYW03RbrHKpW36zTwtqOKJWq2mSkIVU2pXQOhYmW
	 9Jn+cTDKcdd0nIKmTcwrtYh7TlxdWe9v9o0bPWojYYwtBuj3yJowvTydLtSUcD73a7eEw
	 CkVe+keWvJhkdMqOBvw9V/d0qY/QNEC1sWLoW7tWkTY9u5veg3Uq3tqxpg/rguUfFNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T2vJZ1ec;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6361606A32C;
	Wed,  4 Nov 2026 00:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T2vJZ1ec
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04D361F00A16;
	Wed,  4 Nov 2026 00:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793753086;
	bh=9W6m7b6jujG55hqdSy8n9h8hTOdYKRzDblOYhIcp/64=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=T2vJZ1ecF2G0l2D3l0WgSlczsLx2AJl6EGMikUWvY4E/s6FA04VAm24a7oOgp5lLn
	 1HAD+KM1l+uttFM1S+8pMfVBUQJZu0ebQENek8kCvpW6bhshOHN5tinpSSbKEVAPK8
	 atDg4Vg96S4wQtYEPnn61PM95tyCZqCB6KnRslEzDeLV4puSWIVIThRDtm2DMzi7pA
	 d1S9jl5G7lwXTTlHPy3B2qUy0dvB/DvBUQOWwxc6epDEpTcECW59J2PFzHbVEehPR8
	 kaJXUg4aHx7BSzXdiOdHei3UrRpULYMViE2nzz2v629//ViptT1/PBIt/xtCQmdZua
	 0KDbJsm4Fcbtg==
Subject: Re: [PATCH net v4 4/7] ipv6: icmpv6: don't quote decrypted payload in
 icmpv6 errors
From: netdev-bot+sashiko@kernel.org
To: toddfreed@meta.com
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 sashiko-bot@kernel.org, kuba@kernel.org, bjorn@kernel.org
Date: Wed, 04 Nov 2026 00:44:45 +0000
Message-ID: <179375308556.488856.12437639871728515108@kernel.org>
In-Reply-To: <20261103001143.246081-5-toddfreed@meta.com>
References: <20261103001143.246081-5-toddfreed@meta.com>
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

Critical: 0 · High: 1 · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The fix covers icmp6_send() only.
- [Medium] icmp6_send() tells PSP and kTLS apart only by whether
  SKB_EXT_PSP is present (psp_skb_is_decrypted() == skb_ext_find(skb,…
- [Low] In icmp6_send() (net/ipv6/icmp.c), the new TX-side suppression
  check runs after icmpv6_xrlim_allow() has already used up rate-limit…

--

ipv6: icmpv6: don't quote decrypted payload in icmpv6 errors

This patch changes icmp6_send() so that ICMPv6 errors no longer quote
device-decrypted data. For a received kTLS skb, the quote is cut off at
the end of the TCP header and the RFC 4884 extension is dropped. For a
received PSP skb, no error is sent. A locally originated decrypted skb
is only quoted when its source address is local.

> diff --git a/net/ipv6/icmp.c b/net/ipv6/icmp.c
> index a95b0351824f3..4a064e3089cd6 100644
> --- a/net/ipv6/icmp.c
> +++ b/net/ipv6/icmp.c

[ ... ]

> @@ -773,6 +775,23 @@ void icmp6_send(struct sk_buff *skb, u8 type, u8 code, __u32 info,
>  
>  	np = inet6_sk(sk);
>  
> +	/* Don't send the decrypted part of a received skb onto the network */
> +	if (unlikely(skb_is_decrypted(skb)) && skb->skb_iif) {

[Severity: High]
Does this cover all the places that build ICMPv6 errors from a decrypted
skb? nf_reject_skb_v6_unreach() in net/ipv6/netfilter/nf_reject_ipv6.c
builds its own Destination Unreachable and never goes through
icmp6_send():

net/ipv6/netfilter/nf_reject_ipv6.c:nf_reject_skb_v6_unreach() {
    ...
	len = min_t(unsigned int, 1220, oldskb->len);
    ...
	skb_put_data(nskb, skb_network_header(oldskb), len);
    ...
}

It has no skb_is_decrypted() check. Two live callers use it:

nft_reject_netdev_send_v6_unreach()
    nf_reject_skb_v6_unreach()
    nft_reject_queue_xmit()
        dev_queue_xmit()

nft_reject_br_send_v6_unreach()
    nf_reject_skb_v6_unreach()
    br_forward()

Say a PSP or kTLS RX decrypted skb hits a netdev or bridge reject rule.
Could the error then carry up to 1220 bytes of the decrypted TCP header
and payload in cleartext? nskb is a fresh allocation without ->decrypted
set, so sk_validate_xmit_skb() would not drop it.

The IPv4 patch in this series also seems to leave
nf_reject_skb_v4_unreach() unchanged. No later patch in the series
touches net/ipv6 or net/netfilter.

Should these builders be handled here as well, or in a companion fix?

> +		/* PSP encrypts the transport header too, so it should not be
> +		 * quoted. But an error whose quote is truncated to fewer than
> +		 * 8 bytes of the transport header won't be processed on the
> +		 * receive side, so just skip it.
> +		 */
> +		if (psp_skb_is_decrypted(skb))
> +			goto out_unlock;
> +		/* TLS offload leaves the tcp header in the clear and so can be
> +		 * quoted up to its end. A psp skb whose inner tunnel was
> +		 * decapsulated also ends up here, since skb_scrub_packet()
> +		 * drops SKB_EXT_PSP.
> +		 */
> +		decrypted = true;
> +	}

[Severity: Medium]
The commit message covers the inner tunnel decap case. Can plain
transport-mode PSP packets also lose SKB_EXT_PSP before reaching this
check? With bpf_redirect_peer into another netns:

net/core/filter.c:skb_do_redirect() {
    ...
		skb_scrub_packet(skb, false);
    ...
		skb->dev = dev;
		dev_sw_netstats_rx_add(dev, skb->len);
		return -EAGAIN;
}

__netif_receive_skb_core() then goes back to another_round, which sets
skb->skb_iif again. skb_scrub_packet() calls skb_ext_reset() but leaves
skb->decrypted set.

An error about that packet in the peer netns, for example from a reject
rule via nf_send_unreach6()->icmpv6_send(), would take the kTLS branch
here. The quote would then include the full TCP header: ports, seq/ack,
window and options, up to doff * 4 bytes. With PSP transport mode those
bytes were encrypted on the wire.

kTLS RX device offload is tied to the socket's offload netdev, so a
decrypted skb seen after a scrub is most likely PSP. Would it be safer
to use the PSP behaviour in that case?

> +
>  	if (!icmpv6_xrlim_allow(sk, type, &fl6, apply_ratelimit))
>  		goto out_unlock;
>  
> @@ -794,6 +813,15 @@ void icmp6_send(struct sk_buff *skb, u8 type, u8 code, __u32 info,
>  	if (IS_ERR(dst))
>  		goto out_unlock;
>  
> +	/* A locally originated skb to be encrypted. Permit the packet to be
> +	 * quoted if the packets source address is local.
> +	 */
> +	if (unlikely(skb_is_decrypted(skb)) && !skb->skb_iif &&
> +	    !(dst_rt6_info(dst)->rt6i_flags & RTF_LOCAL)) {
> +		dst_release(dst);
> +		goto out_unlock;
> +	}

[Severity: Low]
This check runs after icmpv6_xrlim_allow(). When apply_ratelimit is
true, that function has already taken an inet_peer token and called
icmp_global_consume():

net/ipv6/icmp.c:icmpv6_xrlim_allow() {
    ...
			peer = inet_getpeer_v6(net->ipv6.peers, &fl6->daddr);
			res = inet_peer_xrlim_allow(peer, tmo);
    ...
		icmp_global_consume(net);
    ...
}

So an error that is suppressed here still uses up per-peer and global
ICMPv6 credit. One trigger is a locally originated kTLS/PSP skb with a
non-local source (freebind, or a deleted address) hitting DEST_UNREACH.

The IPv4 patch in this series makes the same skb_iif / RTCF_LOCAL
decision in __icmp_send() before icmpv4_xrlim_allow(). There, a
suppressed error costs no credit.

IPv6 already spends credit when icmpv6_route_lookup() fails after
xrlim, so this is a small effect. Is the difference between the two
families intended?

> +
>  	ipc6.hlimit = ip6_sk_dst_hoplimit(np, &fl6, dst);
>  
>  	msg.skb = skb;

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261103001143.246081-1-toddfreed%40meta.com
