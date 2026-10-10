Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4464A49A6;
	Sat, 10 Oct 2026 12:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791636095; cv=none; b=ek1Ya6rGLISrf367TcXtpiSFBantcZL1vVBdPWbICDnipTuPkC98MCvscqe9XdBpffZhXAKMdgnLzT0HTepVgxrAjWt/V0eplkkG59eMCWHD97/ntjqJfbohv4yuUIeW4rfQ18ks/AzAIWETB0vqbfeez8W6xZHAitWX8zyI1DE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791636095; c=relaxed/simple;
	bh=PMz3ndj/dYnL6Gkz5thUnJr47r+WeegaHAqu4y/FaSY=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EY4/m5SyVHLGvyn/iUNfB3VE0Z8P8Ak2tre/Delr7RE2SQKtv9YOQXTgF74z8Utx1Of0/ndWz8Sc830NXw09nx+5BSDK/WcAU6XKxB11Dz4OvG8WG/wiWrfa5SFVvvmWFX67HCdN4x/Hun/Yiq4X2WtWNPNSJwxpFFD60WTO2HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YMvLE3GN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YMvLE3GN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 161131F00893;
	Sat, 10 Oct 2026 12:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791636092;
	bh=+Sg476JVCrbPcGPS/k7VULk5EVY8Y9jYGQn/AErUnFg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=YMvLE3GNrPwXDDgnK5HS1YIwHdnNH/4P7pNvFIXBbRfciE5fjaEMBuF0H70n6m7UF
	 OPGE+qHhRsnmM/GAZSYi9bFwWfnxRJLn09rH/K4MrtxjTCkcl6oNuYo1mY4+zq8FZ8
	 al05fPN3tvtcEoDE6ugLWYw3V7HtXY6BkNT3lRtRfqBP+VUSLxU2ssTqygwTPlpApy
	 TJmZt2OxfDXn5PW1oMSe08T3qkSERE+Rb/A8QSTM5PaEfce/PB78ICbp+Sv7+9fU7k
	 N92ltGSH4F3c/ifXVf+FA7FVMhmAjg4EhK6YhWdRPQPVoLLFfwKV2C2S09/hgJKiDA
	 NlVNLhUGnYM3A==
Subject:
 Re: [PATCH net-next 08/13] amt: send the AMT gateway control plane over IPv6
From: netdev-bot+sashiko@kernel.org
To: omar@blockcast.net
Cc: ap420073@gmail.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, shuah@kernel.org,
 horms@kernel.org, netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Sat, 10 Oct 2026 12:41:31 +0000
Message-ID: <179163609160.434549.7351587240997160050@kernel.org>
In-Reply-To: <20261009122426.551178-9-omar@blockcast.net>
References: <20261009122426.551178-9-omar@blockcast.net>
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

- [Low] Commit-message concern for "amt: send the AMT gateway control
  plane over IPv6": none of the new IPv6 gateway sender code can run at…
- [Low] At this commit the new IPv6 gateway senders use discovery_ipv6
  and remote_ipv6, but the receive side is still IPv4-only.

--

amt: send the AMT gateway control plane over IPv6

This commit adds amt_send_discovery_v6() and amt_send_request_v6(). They
send the gateway Relay Discovery and Request over an IPv6 outer header
through amt_send_ctrl_v6(). It also changes amt_send_membership_update() to
size its headroom for the outer family and send through amt_udp_xmit(), and
adds discovery_ipv6, remote_ipv6 and the remote_ipv6_lock seqlock to struct
amt_dev.

> Send the Discovery and the Request of a gateway with an IPv6 local
> address from amt_send_discovery_v6() and amt_send_request_v6(). Both
> messages are a few bytes with no payload, so they are built on the stack
> and sent with amt_send_ctrl_v6(), the helper that already sends the
> relay's IPv6 Advertisement, rather than with a copy of the IPv4 skb
> construction. The Membership Update carries the gateway's IGMP or MLD
> report, so amt_send_membership_update() keeps building on that skb: it
> sizes the headroom for the outer family and sends through
> amt_udp_xmit(), like the relay's Membership Query and Multicast Data,
> which avoids an IPv6 copy of the function.

[Severity: Low]
This isn't a bug, but could the commit message say that none of the new
IPv6 sender code can run yet?

At this commit nothing writes local_ipv6, so amt_v6() is always false:

drivers/net/amt.c:amt_v6() {
	return IS_ENABLED(CONFIG_IPV6) && !ipv6_addr_any(&amt->local_ipv6);
}

Nothing writes discovery_ipv6 or remote_ipv6 here either. Later patches
fill them in: "amt: receive the AMT gateway control plane over IPv6" and
"amt: add netlink attributes for an IPv6 outer transport".

Earlier patches in the series include a line like "No functional change:
amt_v6() is still false for every device". The first patch also says
"Nothing sets local_ipv6 until the netlink attribute added at the end of
this series". Would a similar line fit here?

The message also leaves out that the IPv4 path of
amt_send_membership_update() now goes through amt_udp_xmit(). As far as I
can tell the behaviour is the same:

- With data=false, amt_udp_xmit() builds the same flowi4 as the removed
  code and calls udp_tunnel_xmit_skb() with the same arguments.
- amt_ip_hlen() still reserves sizeof(struct iphdr).
- amt_dev_xmit() frees the skb on a true return, whether the route lookup
  fails before or after the skb_push().

Could this be described as a refactor with no IPv4 behaviour change?

> diff --git a/drivers/net/amt.c b/drivers/net/amt.c
> index 969ecfe81d7ad..148d1fb369154 100644
> --- a/drivers/net/amt.c
> +++ b/drivers/net/amt.c
> @@ -715,6 +715,50 @@ static int amt_send_ctrl_v6(struct amt_dev *amt, const struct in6_addr *saddr,
>  	return err;
>  }
>  
> +/* The learned IPv6 relay address is written in process context and read
> + * on transmit and receive. A struct in6_addr is not read in one access, so
> + * readers take a snapshot under the seqlock.
> + */

[Severity: Low]
Is the "read on transmit and receive" part accurate at this commit?

The only readers added here are amt_send_request_v6() and the IPv6 branch
of amt_send_membership_update(). In gateway mode, amt_rcv() still checks
the outer source against the IPv4 addresses only:

drivers/net/amt.c:amt_rcv() {
    ...
	if (saddr != amt->discovery_ip) {
    ...
	if (saddr != remote_ip) {
    ...
}

amt_advertisement_handler() also learns only the IPv4 relay address:

	WRITE_ONCE(amt->remote_ip, amta->ip4);

So nothing writes remote_ipv6 yet, and nothing on the receive side reads
it.

The next patch, "amt: receive the AMT gateway control plane over IPv6",
adds amt_from_relay() and amt_set_remote_ipv6(). After that patch the
comment is accurate.

amt_v6() stays false until the netlink patch, which comes after the
receive patch. So this can't be hit in any bisectable state. The comment
just describes code that arrives one commit later. Would it be clearer to
add the receive part of the comment in the next patch?

> +static struct in6_addr amt_get_remote_ipv6(const struct amt_dev *amt)
> +{
> +	struct in6_addr addr;
> +	unsigned int seq;

[ ... ]

> +/* IPv6-outer variant of amt_send_request(); @v6 is the inner family. */
> +static void amt_send_request_v6(struct amt_dev *amt, bool v6)
> +{
> +	const struct in6_addr remote = amt_get_remote_ipv6(amt);

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261009122426.551178-1-omar%40blockcast.net
