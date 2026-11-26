Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795720617;
	b=hNj5O0cbBF9SlM3sqSYrLSSbvXTnHbmnyUOj9zWLkmNc5rrnpSh9ADLJK/tn+ujN75DO
	 bB1+UZDhg9s3NbLJh4XK4dniXvLkjrDRd5ngYJIVShqwO8cPuoOdmCx7RSUl4fARcyn+F
	 NanIfqAM0VVDUW/KfNjHCo/f7B7MUjMEPR0FI7CNL7founNZT5mih4xyqAO62O7WOOuzZ
	 +0snu3MZLEpaO6ES7+BZ4YEYxeZJJuIP0V3vExu8WoX0pRS5uzVFsMcDOCnFNHMp29AjX
	 1H9wP7oRQcoZggqMH7bboKyHe0loYvnqwZgFrQYSS07V690WlpK26gx90BRfye3ZAMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795720617;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=NZtY45FGkTmV1jsVONpLrGSZDkTyzaPfcIcXdwBvd8s=;
	b=bmKtDjOWFoVNdnlNhmlun31C4zvHjg6c4Q/+qThYhNj+RIA0rs60Ph3GPPGR+N2tjMOv
	 3+BbxRJP9Cu06GDgUg4iXKHOhkHVLKA+64SCfqNbx8M7782HJn4KZW1pIbn72U1oWUXOw
	 HxunEQWqTjVZ9/zHw80Gli1TQHJHRHo5A4UIY31Z2NEPmniZ+qK9DCsa/HhipVgRScCQb
	 dmtg90HUiBI+Ir0wmAKmVoLhlIlwVIS/8kdpPNUfw2AArXouhueyh7f16Tjyy1amA41vy
	 RnsVsLcOCScRA2rbyL+pQ9sKleFzA8uB8AD+BnsZoPZs0HhfYsr+ubJzidwkuKy7EaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GS5FAyek;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9F1606A684;
	Thu, 26 Nov 2026 19:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GS5FAyek
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CA4E1F000D0;
	Thu, 26 Nov 2026 19:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795720617;
	bh=NZtY45FGkTmV1jsVONpLrGSZDkTyzaPfcIcXdwBvd8s=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=GS5FAyek4rmsv/62JCIZEzjSMYL2joihLtthb/bFtY62xEkM0QkdKgUcfNaDYjqAK
	 2hfY2W17dPdVAj123g2fjv2gLBZtwkakLvtpSovjYwtfX04GuM0tQVR+Vs9bCdoGNf
	 mTWoqz48jpVl7YL1Z02r+8lmPXGB4hlQykYw6y/x8YseCdzxFsI+Sej6vAQEz6yF14
	 6a5F8vpc2ndE6ELGofmCk4/xfBN8urN40iZfUGSlyLw3ViE0vsuE591YBzi3uAwkSj
	 aDQ19FFwT/jisDSPErge6K7zACBLEtNhLnHFhoHOSXE1KfUquFmsyHRu0CuOF7leR9
	 Qd8YYZfXYJ1Bg==
Subject: Re: [PATCH net-next v2 03/12] amt: key relay tunnels on a union
 amt_addr endpoint
From: netdev-bot+sashiko@kernel.org
To: omar@blockcast.net
Cc: ap420073@gmail.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, shuah@kernel.org,
 horms@kernel.org, netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Thu, 26 Nov 2026 19:16:56 +0000
Message-ID: <179572061610.3135.16297939691113808529@kernel.org>
In-Reply-To: <20261125191450.2497936-4-omar@blockcast.net>
References: <20261125191450.2497936-4-omar@blockcast.net>
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

- [Medium] This patch makes the per-source tunnel cap compare the full
  16-byte union amt_addr endpoint with memcmp() (amt_addr_equal()).
- [Low] The commit message says 'amt_request_handler() and
  amt_update_handler() take that snapshot on entry, before…

--

amt: key relay tunnels on a union amt_addr endpoint

This commit stores the relay tunnel endpoint as a union amt_addr instead
of a __be32 and matches endpoints with amt_addr_equal(). It adds
amt_outer_saddr() to snapshot the outer source address and amt_relay_mac()
to compute the Membership Update MAC over the full endpoint.

> amt_outer_saddr() copies the outer source address of a received message
> by value into a zeroed union amt_addr. amt_request_handler() and
> amt_update_handler() take that snapshot on entry, before
> pskb_may_pull() and iptunnel_pull_header() can reallocate the header,

[Severity: Low]
Is this description accurate for amt_request_handler()?

It holds for amt_update_handler(), where amt_outer_saddr() runs before
both pskb_may_pull() and iptunnel_pull_header().

In amt_request_handler(), though, the snapshot is taken after the
function's only pskb_may_pull(), and that handler never calls
iptunnel_pull_header():

	if (!pskb_may_pull(skb, sizeof(*udph) + sizeof(*amtrh)))
		return true;

	amt_outer_saddr(amt, skb, &saddr);

The code itself looks fine. ip_hdr() and ipv6_hdr() are derived again after
the pull, and nothing pulls after the snapshot.

Could the commit message be changed to describe the ordering in
amt_request_handler() correctly?

> diff --git a/drivers/net/amt.c b/drivers/net/amt.c
> index 52ccaca08b5ec..38740e0ace424 100644
> --- a/drivers/net/amt.c
> +++ b/drivers/net/amt.c

[ ... ]

> @@ -3198,7 +3231,8 @@ static bool amt_request_handler(struct amt_dev *amt, struct sk_buff *skb)
>  	 */
>  	rcu_read_lock();
>  	list_for_each_entry_rcu(tunnel, &amt->tunnel_list, list) {
> -		if (tunnel->ip4 != iph->saddr || READ_ONCE(tunnel->dead))
> +		if (!amt_addr_equal(&tunnel->addr, &saddr) ||
> +		    READ_ONCE(tunnel->dead))
>  			continue;
>  		per_src++;
>  		if (tunnel->source_port == udph->source)

[ ... ]

> @@ -3210,15 +3244,12 @@ static bool amt_request_handler(struct amt_dev *amt, struct sk_buff *skb)
>  	if (!have && (full || per_src >= amt_max_tunnels_per_src(amt)))
>  		return true;
>  

[Severity: Medium]
Does an exact 16-byte compare still make the per-source cap work on an
IPv6 relay?

amt_tunnel_get_or_create() uses the same exact match before it allocates
a tunnel:

	list_for_each_entry(tunnel, &amt->tunnel_list, list) {
		if (!amt_addr_equal(&tunnel->addr, saddr) ||
		    READ_ONCE(tunnel->dead))
			continue;
	...
	if (amt->nr_tunnels >= amt->max_tunnels ||
	    per_src >= amt_max_tunnels_per_src(amt)) {

amt_max_tunnels_per_src() caps the count at
clamp(max_tunnels / 8, 1, AMT_MAX_TUNNELS_PER_SRC). Its comment says it
limits "the tunnels one verified source address may hold".

On IPv6 this counts per /128. The MAC return-routability check only shows
that the sender can receive at one /128. An ordinary host usually has at
least a /64 routed to it (SLAAC or prefix delegation).

The defaults are a max_tunnels of 128 and 16 tunnels per source. Could one
host run Request -> Query -> Update from eight addresses in its /64, fill
the table, and keep it full by refreshing last_seen? After that, full
would be true here and every legitimate gateway would be refused a Query.
Over IPv4 the same attack needs eight separate IPv4 addresses.

This can't be reached at this commit, since amt_v6() is false. It becomes
reachable later in the series, when "amt: add netlink attributes for an
IPv6 outer transport" adds IFLA_AMT_LOCAL_IP6.

The selftest in "selftests: net: add amt_v6.sh for an IPv6 outer
transport" only checks that two gateways in the same /64 are kept apart.

The commit message only says that the per-source count "compares the
same way".

Would counting per /64 for IPv6 (or per a configurable prefix) keep the
cap doing its job? The cap allows up to 16 tunnels per source, so
separate gateways in one /64 would still be kept apart.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261125191450.2497936-1-omar%40blockcast.net
