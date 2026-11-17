Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794926416;
	b=dqAY6QVeRTD1aXBwAI8glTMfVKfs7wnVstj2Agr+m/XUyLtq5tFpjpv0elnJxIBPjDZt
	 yUwLrrJ/71K0oscmMN6e3YbYHDfsogorDLZjj0AcqMJ0ede1/WvDsTogpmxc39BFjZ1TZ
	 BaFTUvG4yCxysnoCezJQP5bqcJoT9dSZBOsY2pxuktAIk5Gqk3jIBJRTRaVkMF6eeeCJ3
	 JwGr7oAntM9Y8uecU5+SPsruQxawt7lZOvTlQo7zaUm0ShVVMI7ATZFcXCCPuHJu4T1W9
	 X6/bAx1Kzvx/gfc7wrtkHOeOU/cWvNlbbAB37QtPjfFrz4SPvdjIIzGrmUn9jPGV9oQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794926416;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=3q8aNaqxzMqcGk86Iqti4Tv0VuxwT5+cxey3lL/hgjM=;
	b=NkOgG0VyaTdaR4EpZL34/PHavoFeNBGiP9FORaOkZIag+uUfpRAkVp2jflAnk2fIwhA0
	 QfQWi4aCm2JpTkcwxcwbmp4uhmvazvOOsI1sFXp2efwbdPqmWN4CB5PGRELagQusgxYJI
	 1SElSvOLlvXYyA+tmJsCaG4PB/+20D8QrE2xVckpGLoP7zyfBqaGX2Cy0ecooLfoO14Aw
	 Ttcc5fc9waRA+zISL8HRosWZOHVvT/VKeVg/WlMVPWJmTPb4qvJpWeKYUyh70GhD/NSdR
	 lQYQZBybmzf0X45a4bNmflF+SdAe/l7QjzxrUC1NSRCZhU6dAHrN3vXP7Xa8/yWRurg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ikRUpuw3;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=KmuUQcvX;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 595E260A2613
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 14:40:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 595E260A2613
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ikRUpuw3;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=KmuUQcvX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794926415;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3q8aNaqxzMqcGk86Iqti4Tv0VuxwT5+cxey3lL/hgjM=;
	b=ikRUpuw3SHfwGjCTFkYXmu4LQeRpKQAZmdaGtJgDrW5Y55YaC8uHRpuuGKfukJBzBFLTXd
	+vTi5ltcLG54GndvlGPHc3pjDyQv/RcHFr2Xu6RCyfnH0RVx3WCXZ4nAIpkpdwFeDcpHs5
	rMlxW9/bZD1pB35VkG4LtjPGZUoVh74=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-447-hwsn-DZMNwWv6Ro2nXq9RA-1; Tue, 17 Nov 2026 09:40:13 -0500
X-MC-Unique: hwsn-DZMNwWv6Ro2nXq9RA-1
X-Mimecast-MFC-AGG-ID: hwsn-DZMNwWv6Ro2nXq9RA_1794926413
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-492b5408dedso2772718f8f.3
        for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 06:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794926413; x=1795531213; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3q8aNaqxzMqcGk86Iqti4Tv0VuxwT5+cxey3lL/hgjM=;
        b=KmuUQcvXzVjZQyZDZZvXMNioNvXP5M7fIQoXHOaFe+0VLzFz9+mxgzWW82n5Se284g
         ySawX145ISXbOmT1JqS4JJacBlW6My2C6KtdDkK763PjkErXpXi5eRGQs+L2NKPrjQSm
         tVB+tGdsEfCuiv+v8g9KOUONZnLVfiOl50Rj9RXOJsR8XJyvNckWYBuuWt84ULbqx6wK
         9qtW4UKTfs10xwRWzZWiqYijFEggZ856Vv4+j0Ux7kQz+qufE3TncYQbNi1WGtxTn6dI
         8KCCjwZ/FOfMh//xH72/zUP9vZlurT35IMM10M9GOAvJ9uZzHlteXI3SoCm1Tp7Mu2cz
         YM4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794926413; x=1795531213;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3q8aNaqxzMqcGk86Iqti4Tv0VuxwT5+cxey3lL/hgjM=;
        b=v7bphv85rd9lqCsgPrxdfTrIZ/cD7BP6bZXUFbNvCe2YjVBv+eaiRs29oDXaO6XwCM
         xEiZplOppsJh2QWWnPl2/RyaZ5CqDyPt4nkC+nUdN3sJZy0sgRLfy+8nBqIUxeCecniz
         H6sQfeyfe80gkgtxds4RMcpOILUDaeU3ZO/L5vT6jd/wJHBNgoK7gKwX0e1E79qCOwFZ
         ZgL+0PjrUuroxIajlCIWBClcR+wq295zqkd1nAqfP5IZnB437lk5ZDMC42y5jjTpKkfj
         GfoHXSRMpBPdn2cIbddR6Eu4NfGLW++lLwHyk7Erez2NHV3vwPR6ox8HnBYPizEyFClV
         aDSg==
X-Forwarded-Encrypted: i=1; AL+hErG9UWnFjZ4htxXpmmLHxx2YPDFTbKzRCVq2d+0BEALxGIObkBZOv0omBWXL+sOOEHGSS5IMJI9VLHG5oCmsLcA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8FQQoFa4mqRLhgEbZ4ulZPzK3CYwndS5PNPJvFrcVJudoHMwuU
	Mxb1XpylcjmG+gnkrdTH1UKVKejPbPp+XcPliiHx7kXj5jfJ3HKtceB6/hXonfBv5XTLF2d6Y/x
	YEji3a0PnjAx5NoMW+fLcY1U55de1/PGnMXeXcgQSLhRSNQBVNoWxh82SS96Hg8vArrCmyw==
X-Gm-Gg: AZFdTZewSnjmfX4ZWGuLIq2rhNE6Vg0sQ3sKfV41Q4eZlW46+ukaGh11mGSn8/YuHLz
	/DFgIP3hHnU7nHSJ31ItfZVc8duVI0t89OsSJbTjpDVCeA+FqktLbcJtU3XvMzXyCHPI3SGDQup
	sxge28ACnxq+5a66socySPS5A+YBuJCdIUGNPr3Ak0PHeYwqmn0J+kh36BLiiNKB+yjTeh9Pfts
	W0EDH/Qy3tQ8ycEVkG77Jftc1grTAwAy8qykLsQ4NV9yeefwgCmJCa5CnjzmNqV1nfa3H6CPvPT
	j+e3yBhAzpy7W++zkzRHPLIWv6vls7J864B8wQ5lRKTGJTQW0o5AQ51v7ZOPmxi2XVArCy373yf
	BY1lKXhqD/5fu0e6iEX5sEU3/dQ/1SuI9URYlobxu8VbQjvumOOkWN9cMy1Ig3OAd5BA8rWcFyE
	5cXESygkXeJNdDZ872W93JjkQI/eyTFYBigPcguBwUdNb+
X-Received: by 2002:a05:6000:1886:b0:4a4:6f81:ca15 with SMTP id ffacd0b85a97d-4a46f81cae1mr4841214f8f.15.1794926412750;
        Tue, 17 Nov 2026 06:40:12 -0800 (PST)
X-Received: by 2002:a05:6000:1886:b0:4a4:6f81:ca15 with SMTP id ffacd0b85a97d-4a46f81cae1mr4841148f8f.15.1794926412365;
        Tue, 17 Nov 2026 06:40:12 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f1c18b9sm23870977f8f.20.2026.11.17.06.40.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 06:40:11 -0800 (PST)
Message-ID: <10582a05-322c-4fe7-b1aa-b3d8a61fa07d@redhat.com>
Date: Tue, 17 Nov 2026 15:40:10 +0100
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 4/6] net: devmem: always populate bind_dev and
 detach both devices on unregister
To: Mina Almasry <almasrymina@google.com>, netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 Weiming Shi <bestswngs@gmail.com>, Daniel Borkmann <daniel@iogearbox.net>,
 Nikolay Aleksandrov <razor@blackwall.org>, David Wei <dw@davidwei.uk>,
 Stanislav Fomichev <sdf.kernel@gmail.com>,
 Bobby Eshleman <bobbyeshleman@meta.com>, Dragos Tatulea <dtatulea@nvidia.com>
References: <20261115022607.348112-1-almasrymina@google.com>
 <20261115022607.348112-5-almasrymina@google.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261115022607.348112-5-almasrymina@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/15/26 03:26, Mina Almasry wrote:
> @@ -252,21 +254,18 @@ void net_devmem_dev_unregister(struct net_device *dev)
>   
>   	xa_lock(&net_devmem_dmabuf_bindings);
>   	xa_for_each(&net_devmem_dmabuf_bindings, xa_idx, binding) {
> -		if (binding->direction == DMA_FROM_DEVICE) {
> -			if (READ_ONCE(binding->map_dev) != dev ||
> -			    xa_get_mark(&net_devmem_dmabuf_bindings, xa_idx,
> -					NET_DEVMEM_BINDING_LIVE))
> -				continue;
> -		} else {
> -			if (READ_ONCE(binding->bind_dev) == dev)
> -				WRITE_ONCE(binding->bind_dev, NULL);
> -			if (READ_ONCE(binding->map_dev) != dev)
> -				continue;
> -			WRITE_ONCE(binding->bind_dev, NULL);
> +		if (READ_ONCE(binding->bind_dev) == dev) {
>   			__xa_clear_mark(&net_devmem_dmabuf_bindings, xa_idx,
>   					NET_DEVMEM_BINDING_LIVE);
> +			if (xa_empty(&binding->bound_rxqs) ||
> +			    !netif_is_queue_leasee(dev))
> +				WRITE_ONCE(binding->bind_dev, NULL);
>   		}
> +		if (READ_ONCE(binding->map_dev) != dev)
> +			continue;
>   
> +		__xa_clear_mark(&net_devmem_dmabuf_bindings, xa_idx,
> +				NET_DEVMEM_BINDING_LIVE);
>   		xa_unlock(&net_devmem_dmabuf_bindings);

Clashiko note here a synchronize_rcu()/synchronize_net() may be needed:

https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261115022607.348112-1-almasrymina@google.com

even if the lack of it is not catastrophic. Sounded quite
convincing to me.

/P


