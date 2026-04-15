Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF3FC2D0C9A
	for <linux-kselftest@vger.kernel.org>; Wed, 15 Apr 2026 20:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776285388; cv=none; b=CdW0U5uW0srRDdVheZ9onzwpTMiJ/9nc8wHgtIcO0HpGXdTxUM5Zb/5Ss9VRkmvHSPZ5VRuhtcUL1VRuGfTBkwP5jR8VKe21CB2YGVeVAYrqh/ZRqBaimthPweV+WHd+s2Lruc/jKBSMb9W2k6ZISd4IdXxvZT0g0h+uwrDZymI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776285388; c=relaxed/simple;
	bh=CI5ZTX+bBtTjfbbLwRpn7vD2FyhUOiVq9HnLwJehUAo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=PSzpEZE+gFNQsyk7t9GU9liL14/PpAa5UEAfvv/Mc7FQc1zg7fPlF/av8GuQjRw02IE4Fbf9Q6cH0nrTNpj++ppRS1lBQXujlE/UrGtIMNfMCLLewblV1A2bN7Wza0wOnk3edilaKE4AhCdRemWB7TDCxQGXgez1ejwyab/5rCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lDIYuDi3; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lDIYuDi3"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-82f6a5b4f88so1498789b3a.2
        for <linux-kselftest@vger.kernel.org>; Wed, 15 Apr 2026 13:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776285386; x=1776890186; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ENPaL1UuptyEfLWpqNKRZ0uQH1QnfOeS4ONhM5Zt8kQ=;
        b=lDIYuDi32Tk/DE1/yEISxe5tPY70qsn8DOLJyazB//aunCbP0On/T6khG8prgTW6/i
         ILwxq289aQlp71XKHCxABP/JvtZX+pxxKql567mqXm4qDQI7cwMYHWVQFwvY5YfraWqQ
         uM2L1f/5FUASnX6HguBtBMGRMCsFrYalsxBFYe8FRXDdWWV0g4AHUtaFgJIa6G4Hlm8c
         kQXN+3fqaqAoyN/OCtYuD9y8SnEJALsWx6Cc2zq1cys1WzHF2tfVLsXDKdcIq7s3R0fb
         qbX6JopQIGAtPVqITQxRjRHQmmWAubj7gYjvqsONmwRF3+MJVOXtti905MpoE9HXID5J
         m7rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776285386; x=1776890186;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ENPaL1UuptyEfLWpqNKRZ0uQH1QnfOeS4ONhM5Zt8kQ=;
        b=Wwa6NpU+bzuo4TduslkcOgzF0UYamIRmRXYf9gXwr81KlKGrPelFhW5MzRPtdKjIhp
         03SbXb1tXFRFQePC6e5h0GkrPNM7yENiLxlRfpRCEmyOwddnQet1Yk1Zj4HoUxHvX+SJ
         zUhuqpnRdB42DEVbPTgJ9KNp5QRXs9zKyWF78HDWjvzLMD/OeltkpJIobJ/NK2f89/fB
         9gByiE8hXRSPQa+i4XRZdkwuCZKD+feg4pfNFM93oWQZxoArdtUMyCMx5Y/NFcjQcHa7
         XUg7HzF/6qp8aj7hj68GxxaUXG2PBTj2iWeWj1hPSJGcH4OUnjhwUj25p5nUrZYrR/vq
         Eo4g==
X-Forwarded-Encrypted: i=1; AFNElJ+wTCG4Rk03EG6tfkl63JNlV1IV4NTGEV0UWSFidpyCLT+UmbLLB+2OQDS4+KOwHcErUwk7DhPm2BwVEvMJpeE=@vger.kernel.org
X-Gm-Message-State: AOJu0YytuIXYHGFWGA9h4n/gofZqzRGrwG/Bl6zfhCi6E5ctlRskzM6P
	d9W7iufN/G5qwrAllpekIN8DcuQv/lnX+XzBYBBfYGP58Tzwf65uRDraVtNNcZiViAYQsv4ChcC
	49jDPgA==
X-Received: from pfbjw38.prod.google.com ([2002:a05:6a00:92a6:b0:82c:65fb:8f03])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:a21b:b0:82f:5051:f024
 with SMTP id d2e1a72fcca58-82f5051f6f7mr11000976b3a.27.1776285385961; Wed, 15
 Apr 2026 13:36:25 -0700 (PDT)
Date: Wed, 15 Apr 2026 20:35:13 +0000
In-Reply-To: <ad_eD6CjMOBSXQVm@dau-home-pc>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <ad_eD6CjMOBSXQVm@dau-home-pc>
X-Mailer: git-send-email 2.54.0.rc1.513.gad8abe7a5a-goog
Message-ID: <20260415203624.4057135-1-kuniyu@google.com>
Subject: Re: [RFC PATCH net-next v2 1/2] udp: fix encapsulation packet
 resubmit in multicast deliver
From: Kuniyuki Iwashima <kuniyu@google.com>
To: littlesmilingcloud@gmail.com
Cc: davem@davemloft.net, dsahern@kernel.org, edumazet@google.com, 
	horms@kernel.org, kuba@kernel.org, linux-kselftest@vger.kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, shuah@kernel.org, 
	willemdebruijn.kernel@gmail.com
Content-Type: text/plain; charset="UTF-8"

From: Anton Danilov <littlesmilingcloud@gmail.com>
Date: Wed, 15 Apr 2026 21:50:55 +0300
> When a UDP encapsulation socket (e.g., FOU) receives a multicast
> packet, __udp4_lib_mcast_deliver() and __udp6_lib_mcast_deliver()
> incorrectly call consume_skb() when udp_queue_rcv_skb() returns a
> positive value. A positive return value from udp_queue_rcv_skb()
> indicates that the encap_rcv handler (e.g., fou_udp_recv) has
> consumed the UDP header and wants the packet to be resubmitted to
> the IP protocol handler for further processing (e.g., as a GRE
> packet).
> 
> The unicast path in udp_unicast_rcv_skb() handles this correctly by
> returning -ret, which propagates up to ip_protocol_deliver_rcu() for
> resubmission. The GSO path in udp_queue_rcv_skb() also handles this
> correctly by calling ip_protocol_deliver_rcu() directly. However, the
> multicast path destroys the packet via consume_skb() instead of
> resubmitting it, causing silent packet loss.
> 
> This affects any UDP encapsulation (FOU, GUE) combined with multicast
> destination addresses. In practice, it causes ~50% packet loss on
> FOU/GRETAP tunnels configured with multicast remote addresses, with
> the exact ratio depending on the early demux cache hit rate (packets
> that hit early demux take the unicast path and are handled correctly).
> 
> Fix this by calling ip_protocol_deliver_rcu() (IPv4) or
> ip6_protocol_deliver_rcu() (IPv6) instead of consume_skb() when the
> return value is positive, matching the behavior of the GSO path.
> 
> Signed-off-by: Anton Danilov <littlesmilingcloud@gmail.com>
> Assisted-by: Claude:claude-opus-4-6
> ---
>  net/ipv4/udp.c | 13 +++++++++----
>  net/ipv6/udp.c | 13 +++++++++----
>  2 files changed, 18 insertions(+), 8 deletions(-)
> 
> diff --git a/net/ipv4/udp.c b/net/ipv4/udp.c
> index e9e2ce9522ef..8c2d4367cba2 100644
> --- a/net/ipv4/udp.c
> +++ b/net/ipv4/udp.c
> @@ -2467,6 +2467,7 @@ static int __udp4_lib_mcast_deliver(struct net *net, struct sk_buff *skb,
>  	struct udp_hslot *hslot;
>  	struct sk_buff *nskb;
>  	bool use_hash2;
> +	int ret;
>  
>  	hash2_any = 0;
>  	hash2 = 0;
> @@ -2500,8 +2501,10 @@ static int __udp4_lib_mcast_deliver(struct net *net, struct sk_buff *skb,
>  			__UDP_INC_STATS(net, UDP_MIB_INERRORS);
>  			continue;
>  		}
> -		if (udp_queue_rcv_skb(sk, nskb) > 0)
> -			consume_skb(nskb);
> +		ret = udp_queue_rcv_skb(sk, nskb);
> +		if (ret > 0)
> +			ip_protocol_deliver_rcu(dev_net(nskb->dev), nskb,
> +						ret);

Is this path reachable in the first place ?

Maybe I'm missing something, but UDP tunnel sockets
should not have SO_REUSEADDR/SO_REUSEPORT.


>  	}
>  
>  	/* Also lookup *:port if we are using hash2 and haven't done so yet. */
> @@ -2511,8 +2514,10 @@ static int __udp4_lib_mcast_deliver(struct net *net, struct sk_buff *skb,
>  	}
>  
>  	if (first) {
> -		if (udp_queue_rcv_skb(first, skb) > 0)
> -			consume_skb(skb);
> +		ret = udp_queue_rcv_skb(first, skb);
> +		if (ret > 0)
> +			ip_protocol_deliver_rcu(dev_net(skb->dev), skb,
> +						ret);

If the above is true, we can simply return -ret here
to avoid possible stack overflow with too many FOU
encapsulation that syzbot is fond of.


Please wait 24h before next submission.
https://docs.kernel.org/process/maintainer-netdev.html


>  	} else {
>  		kfree_skb(skb);
>  		__UDP_INC_STATS(net, UDP_MIB_IGNOREDMULTI);
> diff --git a/net/ipv6/udp.c b/net/ipv6/udp.c
> index 15e032194ecc..f74935d9f7d7 100644
> --- a/net/ipv6/udp.c
> +++ b/net/ipv6/udp.c
> @@ -949,6 +949,7 @@ static int __udp6_lib_mcast_deliver(struct net *net, struct sk_buff *skb,
>  	struct udp_hslot *hslot;
>  	struct sk_buff *nskb;
>  	bool use_hash2;
> +	int ret;
>  
>  	hash2_any = 0;
>  	hash2 = 0;
> @@ -987,8 +988,10 @@ static int __udp6_lib_mcast_deliver(struct net *net, struct sk_buff *skb,
>  			continue;
>  		}
>  
> -		if (udpv6_queue_rcv_skb(sk, nskb) > 0)
> -			consume_skb(nskb);
> +		ret = udpv6_queue_rcv_skb(sk, nskb);
> +		if (ret > 0)
> +			ip6_protocol_deliver_rcu(dev_net(nskb->dev), nskb,
> +						 ret, true);
>  	}
>  
>  	/* Also lookup *:port if we are using hash2 and haven't done so yet. */
> @@ -998,8 +1001,10 @@ static int __udp6_lib_mcast_deliver(struct net *net, struct sk_buff *skb,
>  	}
>  
>  	if (first) {
> -		if (udpv6_queue_rcv_skb(first, skb) > 0)
> -			consume_skb(skb);
> +		ret = udpv6_queue_rcv_skb(first, skb);
> +		if (ret > 0)
> +			ip6_protocol_deliver_rcu(dev_net(skb->dev), skb,
> +						 ret, true);
>  	} else {
>  		kfree_skb(skb);
>  		__UDP6_INC_STATS(net, UDP_MIB_IGNOREDMULTI);
> -- 
> 2.47.3
> 
