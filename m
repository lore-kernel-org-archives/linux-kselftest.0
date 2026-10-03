Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E1C13AF2;
	Sat,  3 Oct 2026 21:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791064164; cv=none; b=OwKNE4iAcQR77TD1Z3zVPdFM66hpqvoFfkuggPIZRPShpEGVkGC2eOXMThflJYAuYAVj2vCn0t+bidibZRfqXQt7k9bhWvloqtdw6xW9dAHN31Et7nzsNS0iWOAuM4MICBJv1mk2+ol0fcFJGkEfSVnsznI1uETv/HipvsInpO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791064164; c=relaxed/simple;
	bh=4TG97MM+3gRs48QCT/rp3cfJxvQuycSAgP7Phi9j8sQ=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=k3+8WbDPGM/g4kMDu0hB6dPUNHrJq3ZJ50HS+oMw8h1z+Dm2zwbpu0vn2Gn/OJOhc4Nepm82l+R4IZbNhjA670GdTVnkuTpCr+gTDNYo9nzSV/96RajZ1vSXKOgCweh4CzIUeqOYxLcLsh2/OIqkvvD0IHgdPFTkH9UwGF3J0ZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=haMufA1n; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="haMufA1n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 629121F0089B;
	Sat,  3 Oct 2026 21:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791064163;
	bh=bo70h+3LGgIRjJuSL+jQlrh0XcLtNjAdhKi74Dy7L/I=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=haMufA1nCwNhx4wUjRXR0a3mH0gHKdjUsxV5hcsYwiyAhu1RvjCXlUEyBOAxtmxVy
	 5iXgcweMNssXO7k4lqSUDqUbQ4+HMVYg7u7srXTYD+ObJCenBKbEPLSZIcb+MkHr+G
	 eUcSpFE2CiGdvlVnCfTwnxGgZATquzCinHuluqWY1QZtav5lKhy2cN2Re/1rb7fXqk
	 5RhxLIR/rmHPsb0Dk9hTpWcBoJ3fP3UJyV/xwgeKS/2fGHzOi+BOcOEIqHhE7PydRM
	 K3nXS9AaIN2y4bb33aNsX7yXQMDeDp9Y6SHvCteRotsTjbc1f9Q42T0eqIULxpKRTL
	 VO06ISwt1ZKHA==
Subject: Re: [PATCH net-next v2 1/2] amt: mark relay data as a UDP tunnel
 packet before sending it
From: netdev-bot+sashiko@kernel.org
To: omar@blockcast.net
Cc: ap420073@gmail.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, shuah@kernel.org,
 horms@kernel.org, netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Sat, 03 Oct 2026 21:49:21 +0000
Message-ID: <179106416186.434549.2202047416681649119@kernel.org>
In-Reply-To: <20261002212458.34247-2-omar@blockcast.net>
References: <20261002212458.34247-2-omar@blockcast.net>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The commit fixes a user-visible bug but has no Fixes: trailer.

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but fraglist GSO
  skbs that reach the AMT relay unsegmented, the same situation the…

--

amt: mark relay data as a UDP tunnel packet before sending it

This patch makes amt_send_multicast_data() call
udp_tunnel_handle_offloads(skb, true), so GSO packets relayed with tx
checksum offload enabled are marked as UDP tunnel packets. It also resets
the mac header of the copied skb before recording the inner headers, so
inner_mac_header lines up with the inner IP header.

> Suggested-by: Eric Dumazet <edumazet@kernel.org>
> Assisted-by: LLM
> Signed-off-by: Omar Ramadan <omar@blockcast.net>

[Severity: Low]
Should this have a Fixes: tag?

The send path being fixed was added by commit cbc21dc1cfe9 ("amt: add data
plane of amt interface"). That commit introduced amt_send_multicast_data()
with skb_copy_expand(), skb_reset_inner_headers() and
udp_tunnel_xmit_skb(), but no udp_tunnel_handle_offloads().

Suggested trailer:

Fixes: cbc21dc1cfe9 ("amt: add data plane of amt interface")

The notes say this was tested on net-next. Since it fixes packet loss
that users can see, should it target net instead?

> diff --git a/drivers/net/amt.c b/drivers/net/amt.c
> index 0277e4cac39bd..a8236d40c2e70 100644
> --- a/drivers/net/amt.c
> +++ b/drivers/net/amt.c
> @@ -1078,7 +1078,17 @@ static void amt_send_multicast_data(struct amt_dev *amt,
>  	if (!skb)
>  		return;
>  

[Severity: High]
This is a pre-existing issue, but it is closely related to this patch.
Fraglist GSO skbs can reach the relay unsegmented in the same way, yet they
never get to the new udp_tunnel_handle_offloads() call. The
skb_copy_expand() just above rejects them first:

net/core/skbuff.c:skb_copy_expand() {
    ...
	if (WARN_ON_ONCE(skb_shinfo(skb)->gso_type & SKB_GSO_FRAGLIST))
		return NULL;
    ...
}

amt_link_setup() advertises fraglist GSO:

	dev->features		|= NETIF_F_GSO_SOFTWARE;
	dev->hw_features	|= NETIF_F_SG | NETIF_F_HW_CSUM;
	dev->hw_features	|= NETIF_F_FRAGLIST | NETIF_F_RXCSUM;
	dev->hw_features	|= NETIF_F_GSO_SOFTWARE;

NETIF_F_GSO_SOFTWARE includes NETIF_F_GSO_FRAGLIST and
NETIF_F_GSO_UDP_L4.

Suppose the relay's ingress device has rx-gro-list enabled. For
forwarded multicast there is no local socket, so udp_gro_receive() sets
is_flist. The result is an skb with gso_type
SKB_GSO_UDP_L4 | SKB_GSO_FRAGLIST and a frag_list.

ipmr then forwards it to the amt vif. ipmr_prepare_xmit() only drops
oversized skbs when DF is set, and the sender controls DF.

Now suppose tx-checksumming and tx-scatter-gather-fraglist are enabled on
amt. skb_gso_ok() then returns true, so validate_xmit_skb() leaves the skb
unsegmented, and the path becomes:

amt_dev_xmit()
  amt_send_multicast_data()
    skb_copy_expand()
      WARN_ON_ONCE(... SKB_GSO_FRAGLIST)
      return NULL

The function then returns without any drop accounting. Once those
non-default offloads are on, can ordinary remote multicast traffic trigger
this WARN? With panic_on_warn, that would panic the relay.

The notes list "a forwarded GRO packet as the GSO source" as untested.
Would it make sense to also stop advertising NETIF_F_GSO_FRAGLIST and
NETIF_F_FRAGLIST on amt? Another option is to segment or linearize
fraglist skbs before the copy.

> +	/* amt_dev_xmit() pulled the Ethernet header without moving the mac
> +	 * header. The tunnelled payload has no link-layer header, so the
> +	 * inner mac header must coincide with the inner IP header.
> +	 */
> +	skb_reset_mac_header(skb);
>  	skb_reset_inner_headers(skb);
> +	if (udp_tunnel_handle_offloads(skb, true)) {
> +		kfree_skb(skb);
> +		return;
> +	}
> +

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261002212458.34247-1-omar%40blockcast.net
