Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795720619;
	b=m+YkzDK+l+a5EYiEU2Z125p2GigOG/xgWaWxl9SGkOy+k9OQ6gfo29ArU8aH8sA5gmuZ
	 sLxCKVOMOAUM6R02HPn+pVUqEZQmbG6FIf4v4s3XYtnDdjcDU2Q2iwYqstQENEYOV2YNY
	 ipi9v6Q3gJEuqNq78XtI+SqtM0UMGvK2c4YMVQmJIBymQnjL8z/NRwuCeoLLgW3ni7N/V
	 LNFsv8aBkCezgHlgF9r1dDQLIX9ieAB+kuRnGIa1/R14KxiMjTOMVG7WYF6wU9ulUnzTH
	 Vb+RbU2u1C3EmydkL4Za7aM9dzoLecQRPVs/7uqg6WnJHBTv6Log+lzFxYYJmlJhMbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795720619;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Au7X9g8S+wRNBldlyzgHg+a+fOYg56MJAjZoJiJYHWI=;
	b=CHhYgKWiBJXfyzFaaYtnefJyXaq0W9pRFeEIPaFGUfmUrk2VDB3n7hGLOm/oHwGzXWiF
	 UqE1b9MlOfzX4zZNJReSBKmSbNLnY5RW09qzUB/99zLJF+QRe9ORj5qVxeK+1ajpcFpiN
	 rSPRsBDlBsEVuLHiP1C1uTGBas4xVU3AgjABWe3ZApeTyqdkIjEfsFpcC/JpgpgeYJY1g
	 YXe3dniXWcoZJWXd/ZGzHMxIgzMzWh5WxAlkW7t3MOWQtnkdtHFNYZS5N/dRrEGQDZsfa
	 rh/rVKzMdTUPQbD03YATeS89kvdoxsBiYrUFvRa0NQ5Yra58WI0wcLsVaGmLSt9X+kA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WjtcyxUL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53445606A333;
	Thu, 26 Nov 2026 19:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WjtcyxUL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41DBE1F000C6;
	Thu, 26 Nov 2026 19:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795720618;
	bh=Au7X9g8S+wRNBldlyzgHg+a+fOYg56MJAjZoJiJYHWI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=WjtcyxULCNS9+GyTSL7Zk2kazdXOngzMnA4InQRhtrcJW3CcIbCCPFc1/UAlDqaO8
	 /fT+ovEqLn8xrI9nMv+QGhByckNA+Zh0C4vyrrq/r9MVegzU8rT11jLtONo20brTXA
	 TaNoT+wOfJzYUH0BgAGTmpE/YI9VDO15rwgAvBW9mH34DwvC3hl+eAxSM7bwag8sH7
	 FF8IUTSmEniZLF/1vg2+2xn5fR9+UM9NSXkGFPCZfJT+DBdNm/bNrMRvXI06IWYVJu
	 k3LwnnR0zGxlfFyCe/nhsrkMHz8/WnnMIku4qccaJIaVX/9ve9yngvbkUHzv7HnFit
	 OIZE7Dfp7u5ig==
Subject:
 Re: [PATCH net-next v2 04/12] amt: send the Membership Query over IPv6
From: netdev-bot+sashiko@kernel.org
To: omar@blockcast.net
Cc: ap420073@gmail.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, shuah@kernel.org,
 horms@kernel.org, netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Thu, 26 Nov 2026 19:16:57 +0000
Message-ID: <179572061781.3135.626653301105013571@kernel.org>
In-Reply-To: <20261125191450.2497936-5-omar@blockcast.net>
References: <20261125191450.2497936-5-omar@blockcast.net>
X-sashiko-severity: Low
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

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] This patch changes `daddr` in amt_send_membership_query()
  (drivers/net/amt.c) from `__be32 daddr` to `const union amt_addr…

--

amt: send the Membership Query over IPv6

This moves the routing and transmit step of amt_send_membership_query()
into a new amt_udp_xmit() helper. The helper sends over IPv4 or IPv6
depending on the device's outer family. amt_send_igmp_gq(),
amt_send_mld_gq() and amt_send_membership_query() now take the gateway's
endpoint as a union amt_addr pointer.

> diff --git a/drivers/net/amt.c b/drivers/net/amt.c
> index 38740e0ace424..7e8219a0cdf9e 100644
> --- a/drivers/net/amt.c
> +++ b/drivers/net/amt.c

[ ... ]

> @@ -1364,13 +1431,12 @@ static void amt_send_multicast_data(struct amt_dev *amt,
>   */
>  static bool amt_send_membership_query(struct amt_dev *amt,
>  				      struct sk_buff *skb,
> -				      __be32 daddr, __be16 dport,
> +				      const union amt_addr *daddr,
> +				      __be16 dport,
>  				      __be32 nonce, u64 mac,
>  				      bool v6)
>  {

[Severity: Low]
This isn't a bug, but should the comment above amt_send_membership_query()
be updated as well? It still says:

/* Send a Membership Query in reply to an unauthenticated Request.
 *
 * No per-source state is read or created: the gateway echoes the nonce and
 * the keyed MAC in its Membership Update, where the MAC is recomputed, so
 * everything this needs is passed by value.
 */

With this change, daddr is passed by reference. It points to the stack
variable saddr in amt_request_handler(), and reaches this function through
amt_send_igmp_gq() and amt_send_mld_gq():

	amt_send_igmp_gq(amt, &saddr, udph->source, amtrh->nonce,
			 mac);

The first half of the comment, that no per-source state is read or created,
still holds. Only the "passed by value" part no longer matches the new
signature.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261125191450.2497936-1-omar%40blockcast.net
