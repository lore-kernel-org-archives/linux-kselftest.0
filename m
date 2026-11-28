Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795859319;
	b=s64nE01pn3zwsrIdcpIcUhBIvRrjbLS1Yq8dYSePraIo8Qs70QTIO6jzUom91NxGNdGC
	 LHdpdzZzXbGegvcObRQ11+EYyi2SyIZ6TVTJXbBzJs0/F7Ac6dm1duHXBWJzHSWcwR8ib
	 zB8rLgqABW2YyIQhrLA0VPegkPoi1r92TGnOYTRx829eP/T/fBDKW6GSmaFjJJVwkLAeK
	 euosimBBRlbjhfEoYEPnLi5b3JV+RDAtV5OQo/zMrcpXlOqp3LB9/qRkidmpfmm9IhIZB
	 UQ6K+ExqXicnUo5vg6YDcjU9X/tmi9oXknxyH+Q1FaDRtC1Hy+Ejssrg+0xMjcDzmPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795859319;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=peDuo8KNEVBcdI8E+gPsxdnnPdvbQr+1LsXUi0LobRw=;
	b=XQvM00YzQuQrEphrCuNYx/Z41yJBdgqvMzcicEPWCMciuWhj5rQsE9JfurOmAX1NRwVf
	 dvrd6S9vmaRReD2VDEdqg/EhCxTgzy+klteOvlfgv46PHl6tME+v0nTk4yGReCYlJHeyW
	 YTYMraOKi1zRxvI+e51PDBoWbdvtL1pmIkDLVXRGBfTF+PmwvBIEvR/G9y5VJ0lpvVpUh
	 e+sT0RiQnRR+QEx4X92WgsUrCLF1leoJy0pCRnmQcuz3EjgSqctpDMrsohnCrCahe1N4t
	 C3ymYWQB518hO87VIw6zn6wzh1lHcS3xtEG/y2zwrzBeDZRs5/4FjLgY4AQJvKU63gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kyt1oVfq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5507D606A33A;
	Sat, 28 Nov 2026 09:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kyt1oVfq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A0411F00898;
	Sat, 28 Nov 2026 09:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795859318;
	bh=peDuo8KNEVBcdI8E+gPsxdnnPdvbQr+1LsXUi0LobRw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=kyt1oVfqdcrBku58M+drPcFrcDS4rH2J1cyUz6qQ6MljhScytr46wvPEPoQlGhYRQ
	 4WmcE9L7YCB199ERQ+VvM6FeH3DrUhFHXgII7+uR0BYGY8ez+BOuBEcQFEJ/PMJ5Y5
	 W699euacYfjsFSup+6i+0s+8FQSoiBCv3jccX/JCrsQmbjbKvEP7YD4OOva6GLVnlF
	 Hfm4+wcwwwKV0TnLWzjUUxDwPJN6t3b41CayGp91bmsU8VuBcsfCuco4L0jCADsqVz
	 s8q9q2BJXkdDSbSMezgXT5KPOmIrp36X9jESzeZXZB34L5ARLr2pPTO5NNSrgiSHYc
	 2HR94qqkqndGQ==
Subject:
 Re: [PATCH net-next v3 04/12] amt: send the Membership Query over IPv6
From: netdev-bot+sashiko@kernel.org
To: omar@blockcast.net
Cc: ap420073@gmail.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, shuah@kernel.org,
 horms@kernel.org, netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, willemb@google.com
Date: Sat, 28 Nov 2026 09:48:37 +0000
Message-ID: <179585931782.3135.13213241218675519335@kernel.org>
In-Reply-To: <20261127094703.3025517-5-omar@blockcast.net>
References: <20261127094703.3025517-5-omar@blockcast.net>
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

- [Low] The commit message of "amt: send the Membership Query over IPv6"
  describes several things this patch does not do.
- [Low] The comment above amt_send_igmp_gq() in drivers/net/amt.c still
  says "The destination is passed by value rather than as a tunnel".

--

amt: send the Membership Query over IPv6

This moves the routing and transmit step of amt_send_membership_query()
into a new amt_udp_xmit() helper. The helper sends over IPv4 or IPv6
depending on the device's outer family. amt_send_igmp_gq() and
amt_send_mld_gq() now take the gateway endpoint as a const union amt_addr
pointer.

> udp_tunnel_xmit_skb() scrubs the skb in iptunnel_xmit(),
> but udp_tunnel6_xmit_skb() does not, so the IPv6 path calls
> skb_scrub_packet() itself. Otherwise the conntrack entry and extensions
> of the inner packet would stay on the outer one, which conntrack would
> then pass as an already tracked flow.

[ ... ]

> The v6 argument keeps its meaning: it selects the inner protocol, IGMP
> or MLD, which is independent of the outer family, so an IPv6 relay
> queries for both. The relay's General Query, which amt_send_igmp_gq()
> and amt_send_mld_gq() now send directly through
> amt_send_membership_query(), takes the IPv6 path.

[Severity: Low]
A few parts of this commit message don't seem to match what the patch
does.

Is "now send directly" accurate? Before this patch, amt_send_igmp_gq()
and amt_send_mld_gq() already called amt_send_membership_query()
directly:

	if (amt_send_membership_query(amt, skb, daddr, dport, nonce, mac,
				      false)) {

The only change to them here is the type of daddr, from __be32 to
const union amt_addr *.

On skb_scrub_packet() in amt_udp_xmit(): its only caller in this patch
is amt_send_membership_query(). That skb is a query built locally by
amt_build_igmp_gq() or amt_build_mld_gq(), and it has not passed a
netfilter hook. Is there any inner conntrack to scrub yet? The scrub
looks like it only matters for later callers of the helper in the
series (multicast data and the Membership Update), and the message
doesn't mention them.

Also, nothing sets amt->local_ipv6 at this commit. There is no
assignment and no IFLA_AMT_LOCAL_IP6 handling in drivers/net/amt.c, so
amt_v6() is always false and the IPv6 branch of amt_udp_xmit() can't
run yet. The only change that takes effect is that the IPv4 route
lookup now runs after the AMT header push.

Earlier patches in the series say that amt_v6() is still false for
every device, so there is no functional change. Could this one say the
same? The subject suggests IPv6 queries work as of this commit, which
could mislead someone bisecting.

> diff --git a/drivers/net/amt.c b/drivers/net/amt.c
> index 83e666a023c12..70be70ed5ce03 100644
> --- a/drivers/net/amt.c
> +++ b/drivers/net/amt.c

[ ... ]

> @@ -1022,8 +1029,8 @@ static bool amt_send_membership_query(struct amt_dev *amt,
>   * unauthenticated, so no tunnel state is created or changed for it - see
>   * amt_request_handler().
>   */
> -static void amt_send_igmp_gq(struct amt_dev *amt, __be32 daddr, __be16 dport,
> -			     __be32 nonce, u64 mac)
> +static void amt_send_igmp_gq(struct amt_dev *amt, const union amt_addr *daddr,
> +			     __be16 dport, __be32 nonce, u64 mac)
>  {
>  	struct sk_buff *skb;
>  

[Severity: Low]
The first line of the comment above amt_send_igmp_gq(), just outside
this hunk, still reads:

/* The destination is passed by value rather than as a tunnel: a Request is

Should this be updated? daddr is now a pointer to the caller's on-stack
saddr in amt_request_handler().

This same patch rewrites the matching comment above
amt_send_membership_query() to say "the nonce and the MAC by value, the
endpoint as a pointer to the caller's copy", so the two comments now
disagree. The stale wording is still there at the end of the series.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261127094703.3025517-1-omar%40blockcast.net
