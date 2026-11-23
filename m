Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795463216;
	b=ojCzEoNoK5A2iRcCMKmvvtYznQFTWNREMmR0sXaTW+/jgANakUbBK2f9P01RpbniY1QI
	 Nzw/6xHNxeq8n4mKsE+QvtrHCXS98pbYzlbmbFdq+Mrl/WnqTT5ddMM3how/EiNu7MKie
	 F0fWmKc1GjyxLQtzVyp4eZGwSQcytRcfHaTWXIHaHYY4u5MRF6HtN7FyLsim83CZPe4bZ
	 euXelegW9N9PSrPRKV2vbscCNGlFe3Xw2IrtwpcEGxhwHph2d5WIi9D4c1g65ML338gc3
	 uph1y8sqdn9nDmWCozwcHS79FMUoffp3dNJfHzyWkCi1oEGuErdK5SkY0ez2C7/vAyg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795463216;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version;
	bh=68msumE9ER+DmiSRosq40jxym27XxyiCjqWMWovmiXU=;
	b=WvAtTMd2Z6AjRYhd5Gj0LGB7QWBBinsMJ4qGka7ggawEpyf19atqJrkIlkaayd/vSXmH
	 0fvs2yRfDk+uvmaJkA1/1KQhHSf1OYGCRGW8NBn1zaOtiK+if6AQAoHIBKbGkNzq3s6/Y
	 6kdYhL09jxdhmBWqj/zt0DM3Hc747NS7JxofHhgt0wb5BdRpcD+Zex0h1SWM1ai0IdJmm
	 6BZTdUO9nbymZ18RVh8NuUdjknAniL0YI+OR2xz8G15Pf3IgA2lGyhAhzZ8Wyx6Bb6C+1
	 Sy4XLAfzQP13Bn/HsbeBjZDqX0Vydx+77C/bJz8yx+dv3Zwuq+bE6hPtJeXrf/RzP0Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=NxH5C50a;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA2B606A32D
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 19:46:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AA2B606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=NxH5C50a
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
	by m0001303.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6ANGJ1Fn3718580
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 11:46:55 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps82601-s2048-2026-q3; bh=68msumE9ER+
	DmiSRosq40jxym27XxyiCjqWMWovmiXU=; b=NxH5C50am/nw4X0MHjqFCQfQQj4
	A2bOT7e7cLabU4X+Sd7THNtQ0jl6lvyPzgQ8aOft1isWuisGo+XJ7aIXM51vLROc
	qpPpnDmrvZlB8yc0yB5YrixgG5RHYMlIFX3nTm0V5JBI7PU/MIOOByEkhJAKUVFE
	xX1gXF3waa+WEhGm7iKHLHJZFkp1lLYYn9mdCJt0+YUM1GX8VUH5jmf31nNw7S/w
	SpQlGDrlIaO9LC8fxFlZXyX7bNpQpgNXsQ+ra+V5OEhX0O0WIXkynG53BtDhqIBb
	CzlqPIM8Xakrj0S2g1MP02M7rJZAtx5Csz52FYEb/yWEZbOe7LdyHCAJxCw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by m0001303.ppops.net (PPS) with ESMTPS id 4j37uduvny-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 11:46:54 -0800 (PST)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b3b4208826so2479377a91.1
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 11:46:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795463214; cv=none;
        d=google.com; s=arc-20260327;
        b=oxlVRE2Jeo2smJbXYZBLguCLQh1DzYYA8WB/O6cP7Bs9ca1pNCXqUEe/sljYcPPNPk
         BIsNbHAYbuKEVf+9klKJ2gpbH1vNuxGUfgpjig00IszK8NOh7mmcxbVpM+PqYpiu9fBo
         U+9Y9pq7Vfan8BvsXBhweBV+5Qd40+oF034P5FJSSX2tKCXr0Vm8sOXAAKAjJE/kFPrM
         X7zKkGLsZqhpHCZOkgVXpF6y9ecC6BzQ6LuqL55A6Gt8WH0ogKcEU/OpWX/CaB3jMjHM
         b70X/tVhm9/H5WkIHCe18rVHOqDLP67YTh2vscSoZmJLOUEbQTf9X7z0zJct/EpYo0Pc
         yYGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=68msumE9ER+DmiSRosq40jxym27XxyiCjqWMWovmiXU=;
        fh=/an4NtJzup3pdGOhjYWXh5yI5L/7rRvpYYYyb5937DA=;
        b=PFN7C21sQQSfd5H3sdwjyjlWdH7xQ90NMRcsDvSbpeYs/RfTQmk+8TGV9f095s+bMg
         baKWmu9VGxn7qoBiH4I/aHND2/8Wpuhdn+loe17moP+wK9qB8YT2G8rF15zQPvl7JduE
         LoULYTzDl5I6HKMEnzcYYQtRkxxxc4xC0fculXjSqh9r1a3Qmgs3riae9G+6tXmkUpya
         vSSK2lFsDZ984h0tS7xKjtGiQKjT8yXp0IE4XiNVQ8cZa5cqeNoZTkOlVxViv1kZZ8sZ
         3sJqz6spUvODcZX1RAL5IwuLgabUNYPLWS8l/vPRIRHq1kxXkAX6SzkdZbryozzgeyuR
         ho8A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795463214; x=1796068014;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=68msumE9ER+DmiSRosq40jxym27XxyiCjqWMWovmiXU=;
        b=lG1c1lA7liQpK52zinGgslmXLVQGoo60BUB1cCOh8w+SJ0ARl3+4Jem+ckiDwX+vm+
         UMC7odS1fb7iB4vx4WGC9M3Dx+bt/5VqGVKGV27rs+u3KmVawRE5eVXlGxftjsEkTsVb
         cxZgJcXZA6I6U1s3kcKgD92vpPsGNp5F+P/i2+XUOmVArmQWuMn8d21jNZ0AGUTxo5o8
         ktPQVIR4K5p6jcDVDIQOxSoPJRMenuf54FpoO7C2znFH0f6AkXg6AyOOYrmkuzsNMwNn
         wJ32t8wJxAVd0hZ0geLxt09ySs6W8qVRSsEpMVX9ZgHbDYJnAH+s9PK6mWZw7a63lmnJ
         Tq+Q==
X-Forwarded-Encrypted: i=1; AL+hErEiLS2nT1hhRAyK3dL9cZo+AlcNyr89jeaKA2xw14KneJMltrfIMcQWr9K9r36ElYBIi+wYA/5lFYRqR7WcbSM=@vger.kernel.org
X-Gm-Message-State: APuU4Z98FqESzvPpfSwwGAsk7Y+hkNr9tR9MY6m7Ir8GFsW3llzDRxK2
	fxKtHdesdHxFtCw6nbmYKkSdjW7K5ocXWHaaioVhmm0CRfbD3yKWIyXN11Pglyv3Irsm5CaWQFM
	n42DFaR0ELn/VWVA2PihCtqfv4L1rU2jUau3vp+7DbW72wu5rv/dMxWNcKfhBYzodcb8OB60nJx
	CRIt8QdW82snv1vT9sh0QFxen3IFCgSjWTLnFsYmFN388=
X-Gm-Gg: AZFdTZe/iOBUZ/hKXMMbSRYsYsQMJuf5opi6OTWpY/NXTZFx4UWHvbUcjT59TYy/uVE
	00ZdcoQnNwaqLPf3dULhko2QSwNkPD6lAtoSufSoyERkHBZ3Mq3T9SWbHbULE/6FuXYrQj/TXk7
	Nb44LmpOvZu8dGR+0f2dBy2OFA9fq0hN+Ojb2/9+VYP5jDusAAce6U9Thu2g+qgzEgpdNzSlXLi
	XVJAk0ySGNsZqFwlxu6P+hu69TJOs/LFgyY7vv4RIqiExEtyQY=
X-Received: by 2002:a17:90b:4483:b0:3a4:b509:88bd with SMTP id 98e67ed59e1d1-3b41c7bc7ccmr7276207a91.2.1795463213830;
        Mon, 23 Nov 2026 11:46:53 -0800 (PST)
X-Received: by 2002:a17:90b:4483:b0:3a4:b509:88bd with SMTP id
 98e67ed59e1d1-3b41c7bc7ccmr7276167a91.2.1795463213335; Mon, 23 Nov 2026
 11:46:53 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117203137.804424-6-toddfreed@meta.com> <179529586258.3135.12190616828136497053@kernel.org>
In-Reply-To: <179529586258.3135.12190616828136497053@kernel.org>
From: Todd Bert Freed <toddfreed@meta.com>
Date: Mon, 23 Nov 2026 11:46:40 -0800
X-Gm-Features: Aa3M54qNBs9m9dMGH-6cVdsrK_G87ANBZo0TyGs0hmoTzNiwaEmGoS1Z8U9eLXY
Message-ID: <CADh2yMys__9M11pgtxkMQHuhjvM8DzZr20t7W0aEVNqEmABEnQ@mail.gmail.com>
Subject: Re: [PATCH net v6 5/8] ipv6: icmpv6: don't quote decrypted payload in
 icmpv6 errors
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, davem@davemloft.net, andrew+netdev@lunn.ch,
        bjorn@kernel.org, borisp@nvidia.com, cratiu@nvidia.com,
        daniel.zahka@gmail.com, dsahern@kernel.org, dtatulea@nvidia.com,
        edumazet@kernel.org, idosch@nvidia.com, kuba@kernel.org,
        john.fastabend@gmail.com, leon@kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-rdma@vger.kernel.org, mbloch@nvidia.com, pabeni@redhat.com,
        raeds@nvidia.com, rrameshbabu@nvidia.com, sd@queasysnail.net,
        saeedm@nvidia.com, shuah@kernel.org, horms@kernel.org,
        tariqt@nvidia.com, weiwan@google.com, willemdebruijn.kernel@gmail.com,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX+5PMbHSeKepT
 OuximRcJMDrJU/dzRL0fuTLiLXOxjY8R/lvGi8M26zHP+SAWhjr3soAbce2SCRxquVVgqZ6CugH
 LhjIyt62Cqs70tBNSjbXh14sHOxJAOOxLxcMgT1HC7TcsQrEzEswlFff5+UvXiYlHZZkdvHblBI
 k3R8AFiSadgFjbYKN3/7emlRdb9gdKs+/S1DB3JQW3Nh2W7I/83yAlMCmGOYb6mcT+jkYRQa48D
 PsLnv1WZc7lpfXOzQSaSVv36ny1MWiK54CplBESa2CCLx+9cJNem0Pac3ZHU+/7BnHDMAyMoCpY
 +FrTqV+XoNbwnFOhevW4oDKI5eEtCyR4pke2egzFh7pBrU9kPEXknrm80wu7VLgxpGatlYyCHvc
 VOE3fxXh9soIRv3/JCQofZgqlAcVsWJ8dKEk9mq1yQP0DYhpz4Z8dKAJxNTEa5hDJKB+ITGf33i
 mc6uSUBEI9XSPTycNfw==
X-Proofpoint-ORIG-GUID: A8L8CtVf2Lm_ude2TQn9l-LUc8MClHRe
X-Proofpoint-GUID: A8L8CtVf2Lm_ude2TQn9l-LUc8MClHRe
X-Authority-Analysis: v=2.4 cv=VK5IDNPX c=1 sm=1 tr=0 ts=6b04982e cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=_78whYxrdx1mplLwxq1U:22
 a=-7il3XB7buBOucKm-QsA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX3IsWZb6ydp89
 ONpaBEko0aKWxGnAw+18dAzouZQRUu24CJircjf8LhhHFKVq58i0SR/8s62yHeIg+ow3hgpHHIp
 2gVqKkTK7Sz2OAlAAfbNzESrWezZxTo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01

> [Severity: High]
> Does this cover the NDISC Redirect sent from ip6_forward()? That path also
> quotes the invoking packet, but it never goes through icmp6_send():
>
> None of these conditions look at skb->decrypted.
>
> With
> forwarding enabled, a PSP packet sent to a non-local IPv6 address would be
> decrypted and then forwarded.
>
> kTLS RX offload can also produce a decrypted skb whose destination is no
> longer local. One example is when the local address is removed while the
> offload is still active.
>
> The !skb_sec_path() condition already keeps redirects from quoting frames
> decapsulated by IPsec.

I reproduced this on CX7, with both psp and ktls offload sockets. It
only affects
ipv6 (or rather, this path is already addressed by patch 4, the icmp fix).

* server enables forwarding (force_forwarding=1)
* client connects to an on-link address using the server as gateway, so
  the server forwards the packet back out and sends a redirect
* the forwarded packet itself is dropped because of skb->decrypted
* the redirect quotes the invoking packet which had been decrypted and
  goes out

I will post a v7 with one additional patch that addresses this.

-Todd

pw-bot: cr
