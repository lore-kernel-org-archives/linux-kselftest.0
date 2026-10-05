Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67084DF4AD;
	Mon,  5 Oct 2026 17:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791221594; cv=none; b=W+D3SJahEfukVPUuI8yIDHFwPbobGtxynR6+MxmgohBtmqRNBXMQxD2KZISXUiK7n+t5gDh+wxBdmOCoBOajkA/FS+sMs4mHwBAzI/eTC0ejcgGO+QwCACSQ47zIRDAqqaP5caUWpSeWZl6AQJbrjmRJjgYoDWBbeNMrJ9OtP0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791221594; c=relaxed/simple;
	bh=NyO1MpEEqV2oCEgWZd7PHPfMsNhT/6F2ZNA85eJrmgQ=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=s+zVYM/xji6L9MHhdUpJuOjn/peSCPHJS6U442iX6Yt/qQ/6ZZk7lTC72Hwwzp04eCobJxgp5JlPR+P7hUZScXELWYc65n2GdB6QxnV3+VY+MQIQiCCgPg1zT0ORUUqgF4K2p4e89BCDzZRFEncikG/MmIbgUuZxSWcaOjESGYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bghpwev5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bghpwev5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30AF71F00898;
	Mon,  5 Oct 2026 17:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791221591;
	bh=EJwOVxDYhCW0ntc+ZXEHjunm1wwV81N7DoLgu6RBB4Y=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=bghpwev5Tkssw8OLXR11YtaAQAAlhFxSkfosn6XIl/Vpkl+s7YKXZmJx6qtaTRdpO
	 1mXvphFICJtf2NkQ/TLJY149OLbqXgnplwHqvpEFIHa1FvEs2N4hjON4gp/woNwwnG
	 sOImMHYuj8NPOZVp0Sm/NCvmVWMniLAkk1jyH4X80tfNXeyc5ovOUCqvap+jVgJ60u
	 pGEbd5odq8WtYdOEY5ITMs45X01dCfg5XUOuTCKIvge7IdAU8BeYtw10olsBxCP2C5
	 qcCo3oLICqDrwAG/eM2YRUi5EbUOYn94vMsafcmzOwSq0pOQPtfMyoy7HHuDM25Du+
	 rAigFuJFWq6/w==
Subject: Re: [PATCH net-next 1/2] amt: mark relay data as a UDP tunnel packet
 before sending it
From: netdev-bot+sashiko@kernel.org
To: omar@blockcast.net
Cc: ap420073@gmail.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, shuah@kernel.org,
 horms@kernel.org, netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Mon, 05 Oct 2026 17:33:10 +0000
Message-ID: <179122159070.434549.6113316880609579101@kernel.org>
In-Reply-To: <20261001171016.88208-2-omar@blockcast.net>
References: <20261001171016.88208-2-omar@blockcast.net>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] Fraglist GSO skbs that reach amt_dev_xmit() are still dropped
  after this patch, and each attempt hits a WARN_ON_ONCE.
- [Low] The commit is a bug fix but has no Fixes: tag.
- [Low] The commit message presents a branch change in udp_set_csum() as
  a result of the patch, but that change does not happen.

--

amt: mark relay data as a UDP tunnel packet before sending it

This patch calls udp_tunnel_handle_offloads() on the copy made in
amt_send_multicast_data(). GSO relay traffic then has skb->encapsulation
and SKB_GSO_UDP_TUNNEL_CSUM set before udp_tunnel_xmit_skb() gets it. It
also resets the mac header of the copy so that inner_mac_header points at
the inner IP header, and it replaces an earlier patch that stopped offering
software GSO on the amt device.

> The call also changes what a plain, non-GSO datagram looks like when it
> leaves amt. iptunnel_handle_offloads() sets skb->encapsulation on every
> skb and clears it again only if ip_summed is not CHECKSUM_PARTIAL. A
> CHECKSUM_PARTIAL datagram, which is what the stack hands to the driver
> with tx checksum offload on, now has encapsulation set where it had
> none before, so netif_skb_features() limits the features available for
> it to those in hw_enc_features, and udp_set_csum() takes the local
> checksum offload branch, which leaves the inner checksum to the lower
> device.

[Severity: Low]
Is the udp_set_csum() part of this paragraph accurate? udp_set_csum()
chooses its branch from nocheck, skb_is_gso() and ip_summed only. It never
looks at skb->encapsulation:

net/ipv4/udp.c:udp_set_csum() {
	...
	} else if (skb->ip_summed == CHECKSUM_PARTIAL) {
		uh->check = 0;
		uh->check = udp_v4_check(len, saddr, daddr, lco_csum(skb));
	...
}

lco_csum() doesn't read encapsulation either. amt passes nocheck=false to
udp_tunnel_xmit_skb(), so a non-GSO CHECKSUM_PARTIAL datagram already went
through the lco_csum() branch before this patch. The inner checksum was
already left to the lower device.

The real change seems to be that skb->encapsulation is now set and
inner_mac_header has moved. As a result, the lower device's
hw_enc_features now decide whether that checksum is offloaded.

Could the message say only that?

> Assisted-by: LLM
> Signed-off-by: Omar Ramadan <omar@blockcast.net>

[Severity: Low]
Should this have a Fixes: tag? The relay data path that never calls
udp_tunnel_handle_offloads() came in with:

Fixes: cbc21dc1cfe9 ("amt: add data plane of amt interface")

The commit message says every GSO datagram is dropped on an unpatched
kernel once tx checksum offload is on for the amt device. amt_link_setup()
allows that because it puts NETIF_F_HW_CSUM in hw_features.

The previous amt fix in this tree, eb0c18404c89, has the same Fixes: tag.
This patch also replaces an earlier [PATCH net] submission. Without the
tag, stable backporters have nothing that tells them which kernels are
affected.

> diff --git a/drivers/net/amt.c b/drivers/net/amt.c
> index 0277e4cac39bd..1f0afc11ea0c1 100644
> --- a/drivers/net/amt.c
> +++ b/drivers/net/amt.c
> @@ -1078,7 +1078,18 @@ static void amt_send_multicast_data(struct amt_dev *amt,
>  	if (!skb)
>  		return;
>  
> +	/* amt_dev_xmit() pulled the Ethernet header without moving the mac
> +	 * header, so the copy's mac header sits 14 bytes before the inner IP
> +	 * header. Make it coincide with it, as the inner segmentation code
> +	 * expects for a device without a link-layer header.
> +	 */
> +	skb_reset_mac_header(skb);
>  	skb_reset_inner_headers(skb);
> +	if (udp_tunnel_handle_offloads(skb, true)) {
> +		kfree_skb(skb);
> +		return;
> +	}

[Severity: Medium]
Are fraglist GSO skbs still dropped after this patch? They never reach
this new call.

amt_link_setup() advertises NETIF_F_GSO_SOFTWARE, and that mask includes
NETIF_F_GSO_FRAGLIST. It also lets the user turn on NETIF_F_HW_CSUM and
NETIF_F_FRAGLIST:

	dev->features		|= NETIF_F_GSO_SOFTWARE;
	dev->hw_features	|= NETIF_F_SG | NETIF_F_HW_CSUM;
	dev->hw_features	|= NETIF_F_FRAGLIST | NETIF_F_RXCSUM;

When rx-gro-list is on for the ingress device, udp_gro_complete() builds
forwarded SKB_GSO_FRAGLIST | SKB_GSO_UDP_L4 skbs with
CHECKSUM_UNNECESSARY. Suppose multicast routing forwards one of them to an
amt relay that has tx checksum and fraglist turned on. skb_gso_ok()
passes, so the skb arrives at amt_dev_xmit() unsegmented.

The copy made just above this hunk then fails:

amt_dev_xmit()
  amt_send_multicast_data()
    skb_copy_expand()
      if (WARN_ON_ONCE(skb_shinfo(skb)->gso_type & SKB_GSO_FRAGLIST))
          return NULL;

amt_send_multicast_data() returns before udp_tunnel_handle_offloads(), so
nothing is relayed and the WARN_ON_ONCE fires.

The earlier approach ("amt: do not offer software GSO on the amt device")
would have handled this case. The commit message lists
NETIF_F_GSO_FRAGLIST as untested, and the selftest patch that follows does
not touch drivers/net.

Would it close the gap to drop NETIF_F_GSO_FRAGLIST from the advertised
features (for example NETIF_F_GSO_SOFTWARE & ~NETIF_F_GSO_FRAGLIST)? The
core would then segment these skbs before ndo_start_xmit.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261001171016.88208-1-omar%40blockcast.net
