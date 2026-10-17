Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B992B4477E0
	for <linux-kselftest@vger.kernel.org>; Sat, 17 Oct 2026 23:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792279966; cv=none; b=DLXs3oNG/uClpUd6LNSaSklNqHSwvNc7wo8b2wEo7KNc89lDchgCUb4XOg+Hhl0TtNzMiK68338Al2IsoU4TiNw5uDfeJCZo43vzYhVvH4QBQo+Xm3Y4L34pZtpLf4/MB2cCkvuNFWgqmkjDnsSspDpnM5gDDIOiyJciti+cw6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792279966; c=relaxed/simple;
	bh=L50P2pMw33pTp3sRzxNv0eBE6m4qJyngdUpOBnnDTkc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WLieDprWINSNcSUC9gS+r1TXRIQpGO8hYUAIAxMdLIgrphB/9/tYy2j9ttcLpidCScMPwl9eva4lpfQes/Qdl/n+ku2nuX/Mu6gosqzAXkSC0rUjPMbGXxGFza6OJX1KiNQkxG9YDZPbvmzlHZ3mCcVwhgKyhjJ1Z6wKQ174eMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WwsGwIIy; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WwsGwIIy"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-35943f55c06so1416226eec.0
        for <linux-kselftest@vger.kernel.org>; Sat, 17 Oct 2026 16:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792279964; x=1792884764; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HZoGjmkdHdSYCxVMQUZJAUx+X9gAQBvlPFs22BIjZ94=;
        b=WwsGwIIyiGe0ic4SQYrsZmOcOynscObSSECpOZuTsj9F/YUw1eNns1JVizfk1aatrQ
         HjnVsaDumV4NSTAV96Z1mNdDXtLQ1WaD1T6VGn0DsvMW00N7KFC6uIeoAr1ElcZGsUH+
         MUXpi6sX4tv1MffVTODhIu5+7yvBs8pX2s7vilicycjtIYue8Xg0v8piZfCmOdH0C0Qs
         7+ad/wTjM0puAsN+xtuB5qnPLU0FoHcYJjwNJKEr6Wbmj2+/HNwejcJJB5GzA13N0wIL
         u6afkSRrhGWTMGFq8B386eg06Fdnkg/1QnuXpl29QDkXUiUdpnBedlhN1AQsT9GMkQLs
         ZPJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792279964; x=1792884764;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HZoGjmkdHdSYCxVMQUZJAUx+X9gAQBvlPFs22BIjZ94=;
        b=yDm27V/iIYsBvOOKfcBfEjLObyyJhTyavVvKy73nigfiq7kH3Lcw80c39vEkToyl4g
         29pbFjJShF6VW3202tSmCm9kH+H1EwKJGla0zG6uiIYIki6xFZMSDpz20cn0cHHK3vh3
         vhWvAOA5kn+mXAG/8ck6xaIaFttZgF0U2foKux8tt4ygl3KCMmEy2yz0R0hR6/0qBTzI
         wvkr4XPRsKZs0H577AH77Z83uz+8uiqm3BOuSwgrvHypXB43/3o29GNBZvG/QfDxHeVQ
         A0vyVrZVxReO6+sD3ZfUdg+qvkYEBhk1jH10jq/FKxQ7NVFzC+Fb+6Hb+V65hirKob3y
         BsQg==
X-Forwarded-Encrypted: i=1; AKwUvBztGmx1KeRrQi2uRdn2PmD1EuqSTaDCTWvL1H/k94qGSjMiFgJ+CsWyiJ8eqM74dPcNJ14hNEPcanDkGhBbZDc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLzxwpCeam6Uo+u6gBzaVrFT2SoTvKzDuhBDQx3oXffO8v/vT6b
	3c07xm4lTy+C7EsSaHorWX7kWC+HgKgyx/i/wH3T2AK/6h5SxLT2ixtO
X-Gm-Gg: AYBFou1sPmx6KkUpY1TQDdD5gBgUVVCW1jYQtftdzz50X8hY+Qsjyd65IBuP/ztC6xd
	L4zcqeYo0zwNqU7t6lyWpNorKH4ccbI8Vwr0qj4lyAeEOGrim5JJPcUMrf0SnEJif5IltUORtA0
	bDB8TmlGPiobeLY/jzBlTg/xRmaeBUbQjs9mAczbb2dtg65ZxUXdsYtP5zB3E6RJ8cjullAr7C/
	hKps02ub4n/80EAwTlONflQdpc0DQ9BnKjPVni1vN8qEgA7zlgCXS9+qe8sW08kdUX9ZH/ZmxSi
	QSQORwpoUJpdCxPmK90RsjDP/KW3L0foyxP0Ulf2eToLiwjH/0ydgZbCKUnRCE1lOq+MZD8qNhB
	51QXnss8JfZV13gQi0V0F0Np8YjHBt/b7cJoCjmTlDmpX84a6Qvbw4Z61q3bQVxD3EC94xuydPu
	giaHUZZRqGtSSDKLXVs2oZQNUvjdZHMqtby8Ks5nqlKznN5FTvIJUGHvNUYhEiXK+lQ//LTXTrS
	K7CsaGt9JLsjZkv1P2vH7dOD1EsmbJk/gg8
X-Received: by 2002:a05:7301:5406:b0:355:29c0:9cac with SMTP id 5a478bee46e88-3602dcda842mr9448327eec.10.1792279963653;
        Sat, 17 Oct 2026 16:32:43 -0700 (PDT)
Received: from ?IPV6:2620:10d:c085:21c8::1139? ([2620:10d:c090:400::5:8b32])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b63e1sm20549691eec.8.2026.10.17.16.32.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Oct 2026 16:32:43 -0700 (PDT)
Message-ID: <52539be1-2eeb-410a-83cf-0c79d1ca40ef@gmail.com>
Date: Sat, 17 Oct 2026 16:32:41 -0700
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 1/2] veth: schedule the peer's NAPI after XDP_TX when
 only GRO is enabled
To: Tianyi Gao <tianyi@cloudflare.com>, netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, toke@redhat.com, horms@kernel.org,
 bpf@vger.kernel.org, shuah@kernel.org, hawk@kernel.org,
 kernel-team@cloudflare.com, ast@kernel.org, daniel@iogearbox.net,
 john.fastabend@gmail.com, sdf@fomichev.me, linux-kselftest@vger.kernel.org,
 bochaolucky@gmail.com, toshiaki.makita1@gmail.com, lorenzo@kernel.org
References: <20261016214217.16942-1-tianyi@cloudflare.com>
 <20261016214217.16942-2-tianyi@cloudflare.com>
Content-Language: en-US
From: Mohsin Bashir <mohsin.bashr@gmail.com>
In-Reply-To: <20261016214217.16942-2-tianyi@cloudflare.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/16/26 2:42 PM, Tianyi Gao wrote:
> veth_xdp_xmit() queues XDP_TX frames on the peer's ring if the peer has
> NAPI. A peer with GRO enabled and no XDP program also has NAPI.
> 
> veth_xdp_flush() then schedules the peer's NAPI, but only if the peer's
> xdp_prog is set, so for such a peer the frames are never processed.
> Nothing else schedules that NAPI by default.
> 
> Once the ring is full, every XDP_TX frame is dropped, and so are the
> skbs that veth_xmit() queues on the same ring.
> 
> Commit 0e672f306a28 ("veth: check for NAPI instead of xdp_prog before
> xmit of XDP frame") changed the check in veth_xdp_xmit() but not the one
> in veth_xdp_flush(). Make veth_xdp_flush() check the napi pointer
> instead of xdp_prog, as veth_xdp_xmit() does.
> 
> Fixes: 0e672f306a28 ("veth: check for NAPI instead of xdp_prog before xmit of XDP frame")
> Signed-off-by: Tianyi Gao <tianyi@cloudflare.com>
> ---
>   drivers/net/veth.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/veth.c b/drivers/net/veth.c
> index 643b97dc5245..9405ffac598a 100644
> --- a/drivers/net/veth.c
> +++ b/drivers/net/veth.c
> @@ -612,7 +612,7 @@ static void veth_xdp_flush(struct veth_rq *rq, struct veth_xdp_tx_bq *bq)
>   	rcv_priv = netdev_priv(rcv);
>   	rcv_rq = &rcv_priv->rq[veth_select_rxq(rcv)];
>   	/* xdp_ring is initialized on receive side? */
> -	if (unlikely(!rcu_access_pointer(rcv_rq->xdp_prog)))
> +	if (unlikely(!rcu_access_pointer(rcv_rq->napi)))
>   		goto out;
>   
>   	__veth_xdp_flush(rcv_rq);

Reviewed-by: Mohsin Bashir <hmohsin@meta.com>
