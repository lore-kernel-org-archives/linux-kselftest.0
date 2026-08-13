Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB2E3F39FB
	for <linux-kselftest@vger.kernel.org>; Thu, 13 Aug 2026 20:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786652735; cv=none; b=BqvPjEkubhlRM18wQbJCY1Uk+pWtSC9uA09IM3RMy2pGOSMU22X+sF0gLhdJlZIm5A8ULALBNPsX6fE5fkqyCI1xCh2izU/l3qdnCSJrOiVmdmD5iD17+8Cm+tRAlMKOvsRqU6h36TTyemXv8dK6y2F5NYPWqTD52e/ddaeJ0dE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786652735; c=relaxed/simple;
	bh=Wo2R99YxUF+IaLWHq6ZzjiYe36L7yDpPulu7D9fbkmw=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 Mime-Version:Content-Type; b=PrR4Zvzuz5DXAd7HdYPZOGVi0SR3tKIYanSQ+AQmEHcpQPHqUss0SHxdbTVlrBWNMYtXNmhM5T6tDg2XSXdSy7iWiU2aQ8Pa9OxUCO5bECe//JPcWEnwkkgx5LRcvDLwucUUryEwey0fQDgHZUCEtwbvDkobXaiA/6bAi2AVB/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=adnIaiXu; arc=none smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="adnIaiXu"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-664e3ed58bcso2025329d50.1
        for <linux-kselftest@vger.kernel.org>; Thu, 13 Aug 2026 13:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786652731; x=1787257531; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0qFSsIp/BSogxEOZHNXJYT5oX0PNIdy9cvBqT8qcKoQ=;
        b=adnIaiXujKzPaZptKODs4ylm1JeGhExa8L6R+5L1eEU52J71usHBNkhhY3Wd5Or95h
         kWyxBIxgBW8BFcToyDp36okDRhgT/dX3GfwrH4DYznDaefrIzYw5/IsAzBgNXtsKUz+G
         QMX9xBJv34MBr5RVPvcrqJcCVmbLxp4SnIvnjcqYdFKhZnCS2iNP7HSl59MokRxIhWH3
         L/3qP8p7ECCGnaAHGqbNmairSEQCemlFdUSIR+j7UULOVRWnz8LRIS8zsmJrfVL0l1P2
         oCDknRNy3DKybC8zxmZLNXFeVQIpq+IMHgw2MrFwGs0jncQnPllQyAggFfWuaD/+sO2J
         n1+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786652731; x=1787257531;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0qFSsIp/BSogxEOZHNXJYT5oX0PNIdy9cvBqT8qcKoQ=;
        b=Wvt0d+bzQGtIYUyLs1cY8u+DKw2GFUaGdkLEygPY7Pt6psEgxfI5DoKroSuT0bfMX0
         Nnb9F5LUqXqQiZRUTxhj9BvKRmYYwpPW173Ofneam/yx3sXw2kucHpzce0dRU+wUNi3d
         iJzbo8YR6vvfCZliNRJ4uoNrizDC2r3Ei/isMZ6DGbnOvlmc8d/IQ4CSHiRDMvuqLUVF
         up9Ccr5y3+tJ4oY77sTV8P3oTGd0jlmwY/U+s2+qljWv8BijTsAZPMmq10GUgqrCoqkc
         CWd6gQRd6nanibxPU5eAQxiVNqsSsN3kHRjzWi2IY64jX17YdR855QpQZaL7L8een1hN
         MaVA==
X-Forwarded-Encrypted: i=1; AHgh+RpdwvVapVADz/3oiVKyI8Qwt1ekDXjxfVqZu01b7593y1qLNr5hnkt/ERxUmaFLIgxzlC6o3j9H2NV/meKwolY=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywh9LH1+71W++zJxdz8gtmHnHfpi+4hvOKQgnzNGBC+Xrip2QLK
	BN3lAGbbTlIoKFa2isovezqnximSF34Ra/3S0Lzfru1HyEM0uyz1jLMW
X-Gm-Gg: AR+sD13K6ykqbHLUh3UvGqBiEXmCbgnAkzJQz+ndqA1wVKQ+hI5lFT4x3ReLSm9jEr5
	LXr46fcAMDHd2zOXI/KfSjcaH/xCeYmNQqqGvRwdbs6jixNzvOR/ZDmAxn27k9svonVCK9GY6If
	UgH5FXW43SWDs3CpLDqlDGy3xuF0MHY2ArDNsJniFXr+gxjn7uiOVggHOUQnY0fUdOZyIw5ycvi
	N7E3yfz2mytSaJoOPm31+ahSzNSHeeyQdBJUCw1V4xJaY6MdaFhic7BGFauEv+E7xLKmCRJDJhx
	zho4f03rTspZ3uEkI8znQJzmT/SIn8+zALiwDQQIUPIIb+ddipIsGhg7Uzw6zUsbh3aXO/MhKU1
	jizExMJGRdvLi00SnS/6jvV0KCaePEBeciUeqqUZMQWph2RcRtuxUyGWfmX/5kYYrFzRLtyy4r8
	xbCe/j//cdHycxdmFmPRP1enaEyb3wwxM1rwhmq7Uu4eO3OvNg2d2E6ILd0xgg5S1k8ACYkdCDV
	w6veVY1a9jeeuzx74HxReBSURyybIs2w8HR
X-Received: by 2002:a53:a50e:0:b0:664:d5ff:2856 with SMTP id 956f58d0204a3-66c54bb56d5mr2593566d50.14.1786652731192;
        Thu, 13 Aug 2026 13:25:31 -0700 (PDT)
Received: from gmail.com (250.4.48.34.bc.googleusercontent.com. [34.48.4.250])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66c573c46d3sm1373542d50.10.2026.08.13.13.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 13:25:30 -0700 (PDT)
Date: Thu, 13 Aug 2026 16:25:29 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Alice Mikityanska <alice.kernel@fastmail.im>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 David Ahern <dsahern@kernel.org>, 
 Ido Schimmel <idosch@nvidia.com>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>
Cc: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, 
 Simon Horman <horms@kernel.org>, 
 Shuah Khan <shuah@kernel.org>, 
 Hannes Frederic Sowa <hannes@stressinduktion.org>, 
 Vadim Fedorenko <vadim.fedorenko@linux.dev>, 
 netdev@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, 
 Alice Mikityanska <alice@isovalent.com>
Message-ID: <willemdebruijn.kernel.22c7d90c91d06@gmail.com>
In-Reply-To: <20260813120351.2807829-3-alice.kernel@fastmail.im>
References: <20260813120351.2807829-1-alice.kernel@fastmail.im>
 <20260813120351.2807829-3-alice.kernel@fastmail.im>
Subject: Re: [PATCH net v2 2/2] net: ipv6: Clamp to IP6_MAX_MTU in
 ip6_dst_mtu_maybe_forward
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Alice Mikityanska wrote:
> From: Alice Mikityanska <alice@isovalent.com>
> 
> Commit 427faee167bc ("net: ipv6: introduce ip6_dst_mtu_maybe_forward")
> dropped the IP6_MAX_MTU clamp that used to be present in ip6_mtu(). A
> similar IPv4 commit ac6627a28dbf ("net: ipv4: Consolidate ipv4_mtu and
> ip_dst_mtu_maybe_forward") preserves the IP_MAX_MTU clamp.
> 
> Restore the upper bound in the IPv6 flow to avoid potential 16-bit
> overflows in forwarding paths.
> 
> Fixes: 427faee167bc ("net: ipv6: introduce ip6_dst_mtu_maybe_forward")
> Signed-off-by: Alice Mikityanska <alice@isovalent.com>
> Suggested-by: Willem de Bruijn <willemdebruijn.kernel@gmail.com>

Reviewed-by: Willem de Bruijn <willemb@google.com>

> ---
>  include/net/ip6_route.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/include/net/ip6_route.h b/include/net/ip6_route.h
> index 09ffe0f13ce7..fb59a5885faa 100644
> --- a/include/net/ip6_route.h
> +++ b/include/net/ip6_route.h
> @@ -382,6 +382,8 @@ static inline unsigned int ip6_dst_mtu_maybe_forward(const struct dst_entry *dst
>  	rcu_read_unlock();
>  
>  out:
> +	mtu = min_t(unsigned int, mtu, IP6_MAX_MTU);
> +
>  	return mtu - lwtunnel_headroom(dst->lwtstate, mtu);
>  }

It appears IPv4 only clamps device MTU, not route MTU:

        mtu = dst_metric_raw(dst, RTAX_MTU);
        if (!mtu)
                mtu = min(READ_ONCE(dst->dev->mtu), IP_MAX_MTU);

I don't think that was necessarily intentional. Perhaps route MTU
itself is already bounds checked on configuration. The device MTU
min() was added after a syzbot report, in commit c780a049f9b.

Current IPv6 proposal is arguably more robust, covering both. There
just remains a difference between IPv4 and IPv6 code paths.
