Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792963846;
	b=rhMOIsPOg4ptPcfR+NP3ad8sjXYTDa7T7WgJvQyNpvxH+lj7Po8313Y0RZTJsQcyghUI
	 70wgYlJdBC1FMwKe5eOGmjzZfCHYbp/Mze/BT4Tq4h3xzkeaOIYa4ca7NUFMzpdZ4GM2r
	 DrEYuHmRTmpkTnLvaoQvNyRBmeacDC+VgOtYXNNM5VpXHxJJxHwmJYtX5OtemDRRzM34q
	 ib/YfmM6/OyyOR0rNBTDs5j6S5+mjyeKNQmO9iELCJmfVGBdJ7d6sVetJFFP1/6V0M2oG
	 W1l1bZyv8lng/Lkn/jfnzzv0g9ueJZ4VUSbnKohW/ajlx0jkq7vWHiToD+RSZAzn0Ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792963846;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=qSpaPsHi0sTzR5rRAFP6eZ3g6QVSlT9VGsn+ctjS2vs=;
	b=w5IMeasmsqAxaapo/p+5Zg4hmzYp1c3rAHs6GlzI+Vz2rHL2h6x2fPVVdE5R7bdrBlqK
	 E5IRTJaGJnmJArA0Uq4U+95b2NlENAuW75S/GqgkboUeT0wddzoeT1VYlVR7Ey+C3Qhkl
	 n6xsFa1oibVs7AguDVs/Yfc9Sa1uOPzmD8YdpeplbiXjQhG8dZ4S806pv1FgmUwNkCIj/
	 J3zWkFg1/Qze5XUbkJWEkbG6RXmSnTjWCHQVyjtDCpS+Ai7Yv5R5ESEuorjqJK3GRE2c/
	 q+vsb0ZYfXdnnYAKexfxe9HAmjPv65Xolkac+h4Hmx4LIT6WaHO7Sq/Ji6DinOsHrzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FYGG6ccD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EBFB606A324;
	Sun, 25 Oct 2026 21:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FYGG6ccD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36C071F01828;
	Sun, 25 Oct 2026 21:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792963846;
	bh=qSpaPsHi0sTzR5rRAFP6eZ3g6QVSlT9VGsn+ctjS2vs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=FYGG6ccDrlMOSy8BTcyZthFFdlW7LLOV9HaxsKJ/KZ0GiVnSmPhdy+b95GvjYqjdc
	 K0U8rho2RxTLa2Jwc4Ng1tvZgtAsXcJy/iSEm1EZ84HnsgsNwdJ/0vK9Bwk6ZodlyE
	 eMzQQ/EpQmKW85x7dsPGCaKmMEy8EoSNwqF543ruAl9nq/1L/PxtQP7mS5964IMKnn
	 ySVshBADfBgAztOnMdUehakTS0/dKcwV9i1zWl2A45iDlW997DAfGszD/0kT1KxFzQ
	 ZemzHPWOqiKoN3RLa46M5yXUs68SmdlqSuN/QfCVhk3S6rnN8OblkrIhlcn+MBMs/4
	 atFQrUm5Tsd6g==
Subject:
 Re: [PATCH net 1/2] psp: drop transport mode packets with extension headers
From: netdev-bot+sashiko@kernel.org
To: toddfreed@meta.com
Cc: netdev@vger.kernel.org, daniel.zahka@gmail.com, kuba@kernel.org,
 willemdebruijn.kernel@gmail.com, davem@davemloft.net, edumazet@kernel.org,
 pabeni@redhat.com, horms@kernel.org, andrew+netdev@lunn.ch, shuah@kernel.org,
 rrameshbabu@nvidia.com, raeds@nvidia.com, cratiu@nvidia.com,
 linux-kselftest@vger.kernel.org
Date: Sun, 25 Oct 2026 21:30:44 +0000
Message-ID: <179296384470.3134.2504953925740909085@kernel.org>
In-Reply-To: <20261021210200.788191-2-toddfreed@meta.com>
References: <20261021210200.788191-2-toddfreed@meta.com>
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

- [High] The new check in psp_dev_encapsulate()
  (net/psp/psp_main.c:260-262) only looks for IPv6 extension headers…

--

psp: drop transport mode packets with extension headers

This adds a check to psp_dev_encapsulate() that rejects IPv6 packets
whose network header length is not sizeof(struct ipv6hdr). Without it,
the nexthdr of the fixed IPv6 header gets rewritten to UDP even when
extension headers sit between it and the TCP header. That produced
malformed packets, and on mlx5 unencrypted ones.

> diff --git a/net/psp/psp_main.c b/net/psp/psp_main.c
> index c9c1a8826b7f9..0d276e2aceff4 100644
> --- a/net/psp/psp_main.c
> +++ b/net/psp/psp_main.c

[ ... ]

> @@ -256,6 +256,11 @@ bool psp_dev_encapsulate(struct net *net, struct sk_buff *skb, __be32 spi,
>  	    skb->protocol != htons(ETH_P_IPV6))
>  		return false;
>  
> +	/* extension headers not supported */
> +	if (skb->protocol == htons(ETH_P_IPV6) &&
> +	    network_len != sizeof(struct ipv6hdr))
> +		return false;
> +

[Severity: High]
Does this check catch the case where a route inserts the extension
headers? The commit message gives that case as the reason for a datapath
check:

  "extension headers can also come from a route, so the datapath check
  is needed either way."

network_len comes from skb_network_header_len(), which is only
transport_header - network_header. The lwtunnel encapsulators that add
IPv6 extension headers on egress insert the extension header and then set
the transport header to the offset right after the fixed header:

net/ipv6/seg6_iptunnel.c:seg6_do_srh() {
    ...
	skb_set_transport_header(skb, sizeof(struct ipv6hdr));
	nf_reset_ct(skb);
    ...
}

rpl_do_srh_inline() in net/ipv6/rpl_iptunnel.c does the same. So do the
ioam6 inline and encap helpers in net/ipv6/ioam6_iptunnel.c, which call
skb_set_transport_header(skb, sizeof(*hdr)).

Take a PSP TCP flow that leaves the PSP netdev through a seg6, rpl or
ioam6 lwtunnel route. Its network_len is exactly sizeof(struct ipv6hdr),
even though a Routing or Hop-by-Hop header sits right after the fixed
header:

seg6_output_core()
  seg6_do_srh()
    skb_set_transport_header(skb, sizeof(struct ipv6hdr))
dev_queue_xmit()
  psp_validate_xmit()
  mlx5e_psp_handle_tx_skb() (or nsim_do_psp())
    psp_dev_encapsulate()
      network_len == sizeof(struct ipv6hdr), so the new check passes

After that, psp_dev_encapsulate() still does:

		ipv6_hdr(skb)->nexthdr = IPPROTO_UDP;

This overwrites NEXTHDR_ROUTING or NEXTHDR_HOP. The UDP and PSP headers
end up in front of the extension header. psp_write_headers() also sets
psph->nexthdr = IPPROTO_TCP, but the next bytes are an SRH or HBH header.

Wouldn't this produce the same kind of malformed packet that this patch
is meant to drop?

The follow-up selftest patch in the series doesn't touch psp_main.c, so
this path still seems reachable at the end of the series.

Could the check look at the header chain itself instead? For example,
rejecting the packet when ipv6_hdr(skb)->nexthdr != IPPROTO_TCP would
cover both the socket option case and the route case.

>  	if (skb_cow_head(skb, PSP_ENCAP_HLEN))
>  		return false;
>

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261021210200.788191-1-toddfreed%40meta.com
