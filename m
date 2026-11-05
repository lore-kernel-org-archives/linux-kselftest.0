Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793917277;
	b=nsvl7yRvDBltAyjNOs44Z9gXms48N0n68sjhOUkmYBdSHuNuuP1wAG0LYlLcUX4McqHb
	 IzuwTAVQ1P2oii8Ns8AyVcFKWqIzdmRf2VlTNFzsUmWdPI0ztsWmeIep1tmhmc15E7lmq
	 Jh8Cw9SIEOWOF5x/dZ/SVELctkKFOLxniEXKNlw8Jd3b//Ml+NFsx61l1gHuA4y/fm10A
	 59HckW4B0Y+Oa+h1NKPMBc3ztehdHJ/LGbb0pxOyF5rlPI676W4/90K4Yh6U+J/GGLZKc
	 wvuChvaPHLOinsJBraGxQv18wpCZP5D0M4DMoc52eyljugYe5ivJAkhQpn/dV5LtpAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793917277;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=Ppas129PwuUiw2Xw8Lcjz7A3XE0ezJjL976wMeb8fos=;
	b=Dqb1Ezqu0dRnle/1Zi8LSd3vQ62iAClwjEctCsYbT25J3JifbK/Hd/743d3pgDXKRciT
	 Eb11EBRApEJy9xClNfmSxS7OiX52SruAL605emh+TlViQIVbxe5BNZaHvNQH4frQD09yS
	 4uqAMyD/NSoKfKc2pyOK+Qf8fk+pywHgZSY5cTqFatwGutqwjWDYkwJG6mZhxXZOaopfa
	 iGu5lEHLOg+1Em0TaUeddJhnt0+TAfTUCYe6PW6sqFaOVVJ7OqDB9ZRcKSHUs2Er22N6r
	 u3jhmSqiXZcD9mHoQxNdz+/VQKNE4GycCnKUlyw/Kz2m0YYyGHhJd9zXqmNGi5th4Ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ei07+fDw;
	arc=none smtp.remote-ip=74.125.229.8
Received: from mail-dy2-f8.google.com (mail-dy2-f8.google.com [74.125.229.8])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E227606A331
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Nov 2026 22:21:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E227606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ei07+fDw
Received: by mail-dy2-f8.google.com with SMTP id 5a478bee46e88-36a6ce64b95so606eec.1
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Nov 2026 14:21:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793917262; x=1794522062; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ppas129PwuUiw2Xw8Lcjz7A3XE0ezJjL976wMeb8fos=;
        b=ei07+fDwVksjzCrwDH10oAlXvu/ahqITqWe8qoe1bC7FXoipcduGF83vODfy+8RG4b
         DbJWVQXwdB8brnziFnLnjzrcg9QWK4kPPYyKAZ55quymum6L0ksay1Ps7FWvjzzcqX6y
         iPpt9MF0fN3iMWibQtwcW8leLr/v9+sxjVep6so4TwLRDz/waR4liSB62fLaVAULBsxB
         vBS2pJJ88SsioL4u5X+jvRzJJaX6RUJXayEyJt6FRrYKh+tUjeZ/AoxNcxveEWC7KdWS
         xoK/Oz1eVOUEi5dzMcZ/k51F48eIQEgec2XnG++AmLK0zNN6LcPEuHcRO877EwUyaikp
         Z71g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793917262; x=1794522062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ppas129PwuUiw2Xw8Lcjz7A3XE0ezJjL976wMeb8fos=;
        b=sLgu9htfC9jz4F8DSBQg5fYI9mKgcG6gvqsVqg/MEJYcIB/OxqpZL0PoIFuCguYSPU
         VMhApzNItkisdTb0/0x7I+NEEHjRVQx/9H9M9Ngr85v5IwZtPRFyHFPRGwQoCa8+Qc4b
         K37D0FSUvwyrECq13pAKfbOZWH/aWwyw7QW/NPfGWM6jba0p9rr6bhb1/nQB3w2k6XF5
         dFW2RhXUe1XDpKhJiLQqXmDJq+XMCn8YL1W3VauIuP9x2mnWngkzj5xqvmMZueFmePYj
         EO2D034YwvjdaikyZVtwPMUpzuWRhqpumpfh3YpxlK9HfVHbj03/qB20tpz2qo1wbyUG
         WouQ==
X-Forwarded-Encrypted: i=1; AKwUvByTkZP9u3wUL6b/gtTM8OyN88L7cCMTjrXW1z2qccFTKNYgNBDGEvaohlAZbAmQJkz7yjB344aAzWLnwN8y0G0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+efGqprQhkCAR/C26S05/mV3N6LKcFmcC8Zur6JTiEi2rm7S9M
	SfoYuJWPqx33kUu5bq4K0565btV0LKam0EFRXzht+VRJUVnPbMTHUBKN
X-Gm-Gg: AYBFou1ue+nY23genQLif/KEFWgwvy4PT9uz/rqOS1K6DXHiTZNCZ1FFHMh1O8/uRGi
	KUzumDfmQWTPukAPb2EwB1PESvj6qi6PCRMJ6nsOA/89pRjpkH4+wK9SLUI/k+jy/yDKnImZH0u
	HKAesu5ozCJT4K/3Ox5bZ2vbWrwa1p2POS73wUmokLpJgRiLoYJiUfV0trPs4UehbPcHGeq9S1x
	a24I7+sjE9r7G0kN9wwH/5wEJb9cQd4RZre2NEv/+H+FM5zwvAgjn58F3urCJAf/d+/qggtecS7
	wOSThVngv4iasT6vMhd7URh+9BDyccXym4h22m1p6iiYcmvGbUIB2FRpEv8NWaDDU7yPmDCrMhX
	FUvqI39IOGl/f0J783n8UeM/oGgLrbTkWPKXajBTfSYWdXsoDWOnHyBUGv8CFBBd08jRNHlca/B
	ery8aS4RQxFXzdoNBl7XbUjHMUFAP3uHTQ4+cq/5UUhSAR/tTn6Vs/GCnssPwc3+Q+/50Dr++t9
	Wgy6GMmvR4HPduq0A7gxGt33ncDD7YIbGLasBMsxZBD+IG2fGKa2h8vg7UFKPadkZQFBbfzFGm2
	2vPQZjTFwW6tKV92pcjsHT7rBEVxJEPcGnUPFwhCcZ59
X-Received: by 2002:a05:7301:1808:b0:36e:f2f2:37fa with SMTP id 5a478bee46e88-36f75443f3emr684024eec.8.1793917262361;
        Thu, 05 Nov 2026 14:21:02 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:61::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa8e3a718sm39021eec.4.2026.11.05.14.21.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 14:21:01 -0800 (PST)
From: Stanislav Fomichev <sdf.kernel@gmail.com>
X-Google-Original-From: Stanislav Fomichev <sdf@fomichev.me>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	edumazet@kernel.org,
	horms@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com,
	saeedm@nvidia.com,
	tariqt@nvidia.com,
	mbloch@nvidia.com,
	alexanderduyck@fb.com,
	kernel-team@meta.com,
	sdf@fomichev.me,
	dimitri.daskalakis1@gmail.com,
	almasrymina@google.com,
	dtatulea@nvidia.com,
	bobbyeshleman@meta.com,
	asml.silence@gmail.com,
	daniel@iogearbox.net,
	razor@blackwall.org,
	leitao@debian.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	leon@kernel.org
Subject: [PATCH net-next v3 2/9] net: devmem: charge the frag length to TX skb truesize
Date: Thu,  5 Nov 2026 14:20:51 -0800
Message-ID: <20261105222058.944293-3-sdf@fomichev.me>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105222058.944293-1-sdf@fomichev.me>
References: <20261105222058.944293-1-sdf@fomichev.me>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Devmem TX charges each frag the net_iov size, PAGE_SIZE today:
zerocopy_fill_skb_from_devmem() adds PAGE_SIZE to skb->truesize per
frag and __zerocopy_sg_from_iter() charges it to sk_wmem_queued. TCP
uncharges in bytes as acked data is trimmed from the skb
(tcp_trim_head()) and uncharges the rest when the skb is freed. A frag
shorter than a page leaves the difference charged until then, which is
small with PAGE_SIZE net_iovs.

TX net_iovs are about to grow up to 2MB, while frags stay bounded by
the skb and many frags share a net_iov. Charging the net_iov size would
charge up to 2MB per frag: a 64KB skb with two frags would charge 4MB
and fill the default 4MB send buffer on its own.

Charge the frag length instead, which also matches what TCP uncharges.

Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
Reviewed-by: Mina Almasry <almasrymina@google.com>
Reviewed-by: Dragos Tatulea <dtatulea@nvidia.com>
---
 net/core/datagram.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/core/datagram.c b/net/core/datagram.c
index ecc30a6f8302..489d92fe6dae 100644
--- a/net/core/datagram.c
+++ b/net/core/datagram.c
@@ -737,7 +737,7 @@ zerocopy_fill_skb_from_devmem(struct sk_buff *skb, struct iov_iter *from,
 
 		netmem_inc_ref(net_iov_to_netmem(niov));
 		skb_add_rx_frag_netmem(skb, i, net_iov_to_netmem(niov), off,
-				       size, PAGE_SIZE);
+				       size, size);
 		iov_iter_advance(from, size);
 		length -= size;
 		i++;
-- 
2.53.0-Meta

