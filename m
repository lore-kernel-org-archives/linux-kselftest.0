Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1EF309F1D
	for <linux-kselftest@vger.kernel.org>; Mon,  4 May 2026 07:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777880541; cv=none; b=isVywLOqArRTRtoTQOYhSoyt5eSj6CU8ANefzcBALLGpeegQhpUV+4R/9o9sE7JcIDi4i9tDoYoCSL17v1ziRsn8e/s1ihiVBJG+YufpNZuYOumZfHE509PKh8w1tKppniJrKcT8q4ZBc/SS5bmGD2duDJU3v0sSOKW7jKYG0oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777880541; c=relaxed/simple;
	bh=hHzDI6EMEZ3+srDe6h4vdcHCJcs8q+VRUhyZDMfJZv0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EWdKhQbn4g1ty4fPrVcU99+1rRDMqNSUPRXBTlFAMowWKoAJSLpFuxmlmpenpf7MsnVGHYugAHa0yzx9YB9PJwFhTixzany9NFb5NgwK9ScVR3cRi2VLPmNzXgXgS1cby7hQZdkmh4NY10oah3vnwLEdmGg92y28D7jfIUt4+ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org; spf=none smtp.mailfrom=blackwall.org; dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.b=WeYFLsZN; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.b="WeYFLsZN"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48d102471a4so2944575e9.2
        for <linux-kselftest@vger.kernel.org>; Mon, 04 May 2026 00:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall.org; s=google; t=1777880537; x=1778485337; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DNrn/1ULknS0mXajard4wubGCARfDXT/OU6gNTwLGDM=;
        b=WeYFLsZNLykqUHyRDgLBoibh9HFqW64z29hoVdecEZdhZ224ktKyvg0tM76GDA3JPp
         hUciyqHp6pD2rOdzI3hikSXeJJsDtZdjtg7qgfWMHOT5IiUM5sHs44+yRw+45Mecx4pB
         LLF6OcY0+uOFmrqztAM0RyulUwzZ4msCLP+DGJ7OjebDy4PZtWrH03YFghOOnRyfMsRW
         +a9FUhInnHPS9Dl59H214Lr/j7KAG77/fJu5SIq/EzswNYedqP9E3P7uHzcp6bjZ0LIV
         lvfwpjdd0LeUKqXclNOspQD670JQdWYW0syIP+cB76TMrzgyJ7a3Nvk4whsxLrGjd/2u
         HrHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777880537; x=1778485337;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DNrn/1ULknS0mXajard4wubGCARfDXT/OU6gNTwLGDM=;
        b=aD/eky3DhAP1bw7jxnTCLEiqx5kNbpDDGqF1DB4IPQZ9WbKl8Hj0jWeG56uI4KkWq4
         dmFK/jFrUbHjwUSkkRB9r0r67oiN5i4vLqBwr9YI6iu3tpPWfEtrKEf3nxOLIG9lXyK/
         SYOFW6ZKyLhHE8vZL4fKciMPunf8FDfkB3gG0NG+2XQDzRh7r6mQBWOpodpQbz9c2swS
         WgabQKpGoLSPtX11/Y6LTAc+thgQcTd0KacQpivyODIC2tf8IzccgDr47xN+AIkj4CId
         u76Kj41PnW8vzGPyeHhnceVvl72ayEkyA2k03mCidydtRq+uK6lc+ISSVmHvYFCELeZP
         DmEw==
X-Forwarded-Encrypted: i=1; AFNElJ/+TPmeMqEtTDo/AeDsTVfGncNCYiVW9gbOQ6bJtHNdzkm4U02ViFAB/YDEHcKZRWdr3o0/x0BX3YDIJV1W6PM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhtgWI7VdsOMcAjDOyILMuLcKUPoiHq6d/VX3V3K04B1Xva6bh
	hflOdjRHeotPIYTNYUB0LNxy/PUWso8Yyv7trqF9pDmD3LRwT+dJglOcVg24+3hYs1w=
X-Gm-Gg: AeBDiesxFNA2bcKn04kTlV3Yds0+BzC1sEISkOxgXAn44KxfHT8DbSTV6A46136IMii
	uadqzoN/DVOO9VPvGVkHTgEoT+ikaJYxMkq4AuW8+kVc9cFRMzskOBEcl2jOTVzd4FcHxx0AbS8
	NzEqnvOcm8b8mczS/UoiYXDB/aMH8R6DNmakAxiLY2aB+JTfjKngnUcoJ+E7jziZ+MAh0HD/5Ql
	RpbyZqLVB+6lyGRgYF+n6/RHGfZB2TA1BkSeGLl+RSG/dHyElgaBpMieTjefYc2Z2cbVpZyj21b
	sm6CO9v4u0ThOPciVuP7FfI8B3tH98tFcTpQr6DjiOfzZsm7326n/C9AzvDwZcVcZJLior4WzKK
	fpSD5DkrhbFiI+Gn9kHoXPi2DwCeSS/0gLlruSsex+47yNHRmkqu7/kBgtg/cZBrK3XeRviaNhX
	dvC3qem66YbCBWEMo4P6dWG9uT49GCm7KwnAIIbJBvnwDqUNxtEG08QzIApzGm7YcpQyI4HjK4n
	Oc=
X-Received: by 2002:a05:600c:4342:b0:485:2a85:e5ec with SMTP id 5b1f17b1804b1-48c6d455f69mr68414675e9.2.1777880537124;
        Mon, 04 May 2026 00:42:17 -0700 (PDT)
Received: from [192.168.0.161] (78-154-15-182.ip.btc-net.bg. [78.154.15.182])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8fe3cae3sm100998215e9.0.2026.05.04.00.42.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 00:42:16 -0700 (PDT)
Message-ID: <ed569c78-129b-4db4-8a73-e1728a6d5032@blackwall.org>
Date: Mon, 4 May 2026 10:42:14 +0300
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 4/6] bridge: Add port-level netlink handling for
 neigh_forward_grat
Content-Language: en-US, bg
To: Danielle Ratson <danieller@nvidia.com>, netdev@vger.kernel.org
Cc: donald.hunter@gmail.com, kuba@kernel.org, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, horms@kernel.org, idosch@nvidia.com,
 andrew+netdev@lunn.ch, shuah@kernel.org, ast@fiberby.net,
 liuhangbin@gmail.com, daniel@iogearbox.net, aroulin@nvidia.com,
 fmaurer@redhat.com, sdf.kernel@gmail.com, sd@queasysnail.net,
 kees@kernel.org, nickgarlis@gmail.com, amorenoz@redhat.com,
 alasdair@mcwilliam.dev, johannes.wiesboeck@aisec.fraunhofer.de,
 petrm@nvidia.com, linux-kernel@vger.kernel.org, bridge@lists.linux.dev,
 linux-kselftest@vger.kernel.org
References: <20260503073532.2138165-1-danieller@nvidia.com>
 <20260503073532.2138165-5-danieller@nvidia.com>
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20260503073532.2138165-5-danieller@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/05/2026 10:35, Danielle Ratson wrote:
> Add netlink handlers for the port-level neigh_forward_grat option via
> IFLA_BRPORT_NEIGH_FORWARD_GRAT attribute.
> 
> The default value of OFF preserves existing behavior, i.e. gratuitous ARP
> and unsolicited NA are suppressed when neigh_suppress is enabled. Users can
> explicitly set it to ON to allow these packets through.
> 
> Example for enabling control via 'bridge link' command:
>   # bridge link set dev eth0 neigh_suppress on
>   # bridge link set dev eth0 neigh_forward_grat on
> 
> Signed-off-by: Danielle Ratson <danieller@nvidia.com>
> Reviewed-by: Ido Schimmel <idosch@nvidia.com>
> Reviewed-by: Petr Machata <petrm@nvidia.com>
> ---
>   net/bridge/br_netlink.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/net/bridge/br_netlink.c b/net/bridge/br_netlink.c
> index 6fd5386a1d64..898326c201ef 100644
> --- a/net/bridge/br_netlink.c
> +++ b/net/bridge/br_netlink.c
> @@ -190,6 +190,7 @@ static inline size_t br_port_info_size(void)
>   		+ nla_total_size(1)	/* IFLA_BRPORT_LOCKED */
>   		+ nla_total_size(1)	/* IFLA_BRPORT_MAB */
>   		+ nla_total_size(1)	/* IFLA_BRPORT_NEIGH_VLAN_SUPPRESS */
> +		+ nla_total_size(1)	/* IFLA_BRPORT_NEIGH_FORWARD_GRAT */
>   		+ nla_total_size(sizeof(struct ifla_bridge_id))	/* IFLA_BRPORT_ROOT_ID */
>   		+ nla_total_size(sizeof(struct ifla_bridge_id))	/* IFLA_BRPORT_BRIDGE_ID */
>   		+ nla_total_size(sizeof(u16))	/* IFLA_BRPORT_DESIGNATED_PORT */
> @@ -282,7 +283,9 @@ static int br_port_fill_attrs(struct sk_buff *skb,
>   	    nla_put_u8(skb, IFLA_BRPORT_LOCKED, !!(p->flags & BR_PORT_LOCKED)) ||
>   	    nla_put_u8(skb, IFLA_BRPORT_MAB, !!(p->flags & BR_PORT_MAB)) ||
>   	    nla_put_u8(skb, IFLA_BRPORT_NEIGH_VLAN_SUPPRESS,
> -		       !!(p->flags & BR_NEIGH_VLAN_SUPPRESS)))
> +		       !!(p->flags & BR_NEIGH_VLAN_SUPPRESS)) ||
> +	    nla_put_u8(skb, IFLA_BRPORT_NEIGH_FORWARD_GRAT,
> +		       !!(p->flags & BR_NEIGH_FORWARD_GRAT)))
>   		return -EMSGSIZE;
>   
>   	timerval = br_timer_value(&p->message_age_timer);
> @@ -902,6 +905,7 @@ static const struct nla_policy br_port_policy[IFLA_BRPORT_MAX + 1] = {
>   	[IFLA_BRPORT_MCAST_MAX_GROUPS] = { .type = NLA_U32 },
>   	[IFLA_BRPORT_NEIGH_VLAN_SUPPRESS] = NLA_POLICY_MAX(NLA_U8, 1),
>   	[IFLA_BRPORT_BACKUP_NHID] = { .type = NLA_U32 },
> +	[IFLA_BRPORT_NEIGH_FORWARD_GRAT] = NLA_POLICY_MAX(NLA_U8, 1),
>   };
>   
>   /* Change the state of the port and notify spanning tree */
> @@ -970,6 +974,8 @@ static int br_setport(struct net_bridge_port *p, struct nlattr *tb[],
>   	br_set_port_flag(p, tb, IFLA_BRPORT_MAB, BR_PORT_MAB);
>   	br_set_port_flag(p, tb, IFLA_BRPORT_NEIGH_VLAN_SUPPRESS,
>   			 BR_NEIGH_VLAN_SUPPRESS);
> +	br_set_port_flag(p, tb, IFLA_BRPORT_NEIGH_FORWARD_GRAT,
> +			 BR_NEIGH_FORWARD_GRAT);
>   
>   	if ((p->flags & BR_PORT_MAB) &&
>   	    (!(p->flags & BR_PORT_LOCKED) || !(p->flags & BR_LEARNING))) {

Acked-by: Nikolay Aleksandrov <razor@blackwall.org>

