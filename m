Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F2A388E45
	for <linux-kselftest@vger.kernel.org>; Thu,  9 Jul 2026 01:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783560254; cv=none; b=uKUnzxkDg5PlFzHBtu5h6CHtkVw5gPuQOukdiULIrkX89amlcr3rKSaJRVv96AnpyyjqLgdNwB6DnhtZvdJrAMPp63x9Lon1mIuskEVdAkgYTkKg3imGwi2N4PjZwyiao6V04Emt3yOzzS6/ZBJp2DlP3EK/eKk8ARiz+N8Ux54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783560254; c=relaxed/simple;
	bh=RfF1dKAqM2zfQSr+my3zTNccGaaz2PPMX7X5gTI7438=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 Mime-Version:Content-Type; b=V1z6w0lN8c3dRcSijiI41vBB1qO3Ml1o+BeJQUXmHQJKKihcP+IGF+5mSPWH40cG0Cq6m4qE5yugoTQmv1PyZWDf1Qqi0X4P/2Yge0j64OAOCyRSRlMt8zr1Ui2OnPmRbjIOO5uQpFzzwdEMoSMQ7ck7f/3a+fnX8a1zh/airlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y6BrfKTt; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y6BrfKTt"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-804e46366d7so7519147b3.2
        for <linux-kselftest@vger.kernel.org>; Wed, 08 Jul 2026 18:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783560252; x=1784165052; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RAF6gSZL5EYthmH74Z0dkKFhTxVvkytNqNQGquUdHyE=;
        b=Y6BrfKTt5BgaGPNoFfGA2wp450jMu+DHBX+Fm8q5hvbaywwemdqK+xhRTMbvEipk6k
         TUWsgLCxqdt5Z1ziewEg1dav3fX/AmjtrL+g8sFPBYyFnvqttPdRw+dyNzXFoh3xZTES
         CAKhiiarrYXOBFfCMTfVhcHp3EEPCdWtuQtStxWASaTrdIWstgzN8j87faKmGoWEZ/GJ
         ciVZZVWB/Wg66060Jwz3WTYJ4H3avLt28WkIy003DHa2/WcBfg/ZfcySBWuAKvz035Ax
         WHTZLaKN7762pwPhZkIHAhNF8btpi9CL1T6gWfyRjdxylsY98g4IAcLr80yCWmQQCK8g
         XKXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783560252; x=1784165052;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RAF6gSZL5EYthmH74Z0dkKFhTxVvkytNqNQGquUdHyE=;
        b=dAFevLjgkzpWgr0DAOf21AHjNSWK59JPYblbXE6KFsYkGFROHGniCK79oEZV3gtA+N
         3kyzZVCaD2s1pqO5w789mEGpxSEYgsbJwRtQ9XlNZS5zEn/ACt58ITa+QgOqqjxVgwRn
         ++gnP8XrLMe1OsVtQxjCdpyN5kxkWKId6aYvbyTuABmJaQXBccDwtBTJq3DZrS71wmwL
         B+pCrOFwpehDa15yvzP0fHYgR3jEbtNEyte5OPqjFfGnL+uNlODCAACxlGJ2ddIA6NNf
         zyf87i8HH23LPiuN8PQNNGuvfk6rDZDU88v+QnZaoU18LPUsxKnX7GZt06jf2qzemufy
         MwaA==
X-Forwarded-Encrypted: i=1; AHgh+RrRJLG+jHYVb+4k7aHMMcKzPCCjm/e6WP9PpLsZ5+f8Map1TTIdg/VXhZeJ6KgqK0WgkPFLt4P6+Hme+Y8oZho=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpY5gYoac786Neg0jw2D8acawYtRENWYFBERX5ikdz+SVA4fM0
	t5YxG9RqxgCLLc/Xpae+scb6ccaXulXbwgmqmZM+eLqhx0+BcpUqAtdl
X-Gm-Gg: AfdE7ckuItIQaqYooDncsx8GAPAVnkJl5et3ekyyN/X5XEU03Pp5qzinY+mNva/wXOL
	+jmulXOMNedLIKVx4JVx5g/o09Z1UoTjNZAw4c7soLRpXMOc8J2FL1MVL32zXG6WY5P0RlKlOWD
	SsepAUWIid05G8OupZglJOYNSEYmb0ZkN37j/e25swqq6f6IEVxbvZ3wi3Dk1u4zl3fuwpFlDJM
	153M49ANfULnllfmRJmAXS6v0IScgQD3THvrSuPBMF/VF4pXT4/zGQdWqFfLFrvQfbF+DUYYdcf
	c1sqPCSxsj6vK/hLFDAuAoO3VUm8ECVSfwM/IL2PDFHhmIh8EzjPGMCNsDSuB6UVLMwM+lPKbnr
	ayhQDDvckOsql/MI8VVz9IMmrldIhpDL1y787ychKSlNpiln0osSB5fbjh7P9nStSrNnlY8vLtf
	xAmz9DlqANGEW/8Pc0KMTMPkEbKMvE+XrxBXI4zEDyFZHv+3+Cg2ffW6/wP3Hc4EXt3OXXAVdrI
	WXr
X-Received: by 2002:a05:690c:6a82:b0:80c:3848:bde6 with SMTP id 00721157ae682-81dbed5a6f5mr42887607b3.30.1783560251840;
        Wed, 08 Jul 2026 18:24:11 -0700 (PDT)
Received: from gmail.com (172.235.85.34.bc.googleusercontent.com. [34.85.235.172])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6c1e1d12sm5858607b3.33.2026.07.08.18.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 18:24:11 -0700 (PDT)
Date: Wed, 08 Jul 2026 21:24:10 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Anton Danilov <littlesmilingcloud@gmail.com>, 
 netdev@vger.kernel.org
Cc: Willem de Bruijn <willemb@google.com>, 
 "David S . Miller" <davem@davemloft.net>, 
 David Ahern <dsahern@kernel.org>, 
 Eric Dumazet <edumazet@google.com>, 
 Kuniyuki Iwashima <kuniyu@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, 
 Shuah Khan <shuah@kernel.org>, 
 linux-kselftest@vger.kernel.org
Message-ID: <willemdebruijn.kernel.2a3e532d3c28f@gmail.com>
In-Reply-To: <5372ccac062193147e02b991d5328a5c3fa3a85a.1783372173.git.littlesmilingcloud@gmail.com>
References: <cover.1783372173.git.littlesmilingcloud@gmail.com>
 <5372ccac062193147e02b991d5328a5c3fa3a85a.1783372173.git.littlesmilingcloud@gmail.com>
Subject: Re: [PATCH net-next v6 1/2] udp: fix encapsulation packet resubmit in
 multicast deliver
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Anton Danilov wrote:
> When a UDP encapsulation socket (e.g., FOU) receives a multicast
> packet, __udp4_lib_mcast_deliver() and __udp6_lib_mcast_deliver()
> call consume_skb() when udp_queue_rcv_skb() returns a positive value.
> A positive return value from udp_queue_rcv_skb() indicates that the
> encap_rcv handler (e.g., fou_udp_recv) has consumed the UDP header
> and wants the packet to be resubmitted to the IP protocol handler
> for further processing (e.g., as a GRE packet).
> 
> The unicast paths handle this correctly by propagating the return
> value up to ip_protocol_deliver_rcu() / ip6_protocol_deliver_rcu()
> for resubmission. However, the multicast paths destroy the packet
> via consume_skb() instead of resubmitting it, causing silent packet
> loss.
> 
> This affects any UDP encapsulation (FOU, GUE) combined with multicast
> destination addresses.
> 
> Fix this by returning the value from udp_queue_rcv_skb() when it is
> positive, matching the behavior of the corresponding unicast paths.
> Note the sign difference between IPv4 and IPv6:
> 
>   - IPv4: udp_unicast_rcv_skb() returns -ret, and
>     ip_protocol_deliver_rcu() resubmits when ret < 0
>     (using -ret as the protocol number).
>   - IPv6: udp6_unicast_rcv_skb() returns ret, and
>     ip6_protocol_deliver_rcu() resubmits when ret > 0
>     (using ret as the nexthdr).
> 
> Both mcast paths now follow the same convention as their respective
> unicast paths.
> 
> Suggested-by: Kuniyuki Iwashima <kuniyu@google.com>
> Signed-off-by: Anton Danilov <littlesmilingcloud@gmail.com>
> Assisted-by: Claude:claude-opus-4-6
> Reviewed-by: Willem de Bruijn <willemb@google.com>
> ---
>  net/ipv4/udp.c | 6 ++++--
>  net/ipv6/udp.c | 6 ++++--
>  2 files changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/net/ipv4/udp.c b/net/ipv4/udp.c
> index 59248a59358c..d3ddcbfc8477 100644
> --- a/net/ipv4/udp.c
> +++ b/net/ipv4/udp.c
> @@ -2476,6 +2476,7 @@ static int __udp4_lib_mcast_deliver(struct net *net, struct sk_buff *skb,
>  	struct udp_hslot *hslot;
>  	struct sk_buff *nskb;
>  	bool use_hash2;
> +	int ret;
>  
>  	hash2_any = 0;
>  	hash2 = 0;
> @@ -2520,8 +2521,9 @@ static int __udp4_lib_mcast_deliver(struct net *net, struct sk_buff *skb,
>  	}
>  
>  	if (first) {
> -		if (udp_queue_rcv_skb(first, skb) > 0)
> -			consume_skb(skb);
> +		ret = udp_queue_rcv_skb(first, skb);
> +		if (ret > 0)
> +			return -ret;

This helps the case of one encap_rcv socket in the multicast receiver
group, so is a useful fix on its own.

But is Sashiko correct that this would still leave the same issue for
other sockets in the group? If so, something to address in this series
or leave for later?

Might be worthwhile to extend the test to capture that case too.
