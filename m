Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793889244;
	b=Hi62AoSSjxzXkHJ6gRamEc3s9t/TeGijBTUQc39K/yN1CRXVszCwWGVPHGmSMbS3srWU
	 rrlxU+H9pbYg3y5gLEBQ6X4XAwDA6r6YQBnJbzlcAaS6w9mzbHPZtITaTvQzjkCULRv0B
	 QF+Bp2b9QHQum1sFMLuQEuHVY3TBuff+1JH2xM6rdU+bTvFsS4YyhyNrHylOWtQHR5USP
	 41uehzbgfz/JSIuD/zkdICG7mLaobOEicPtf3LJDs0gsvYuKMz50FGFIiQflXqFZuIQw5
	 I3VaRC8qcIyuXe+cvW9Frk2lRxF8IXRQqFL6AWxLOQK9NiXx156Ybq3XAl62h4vmY3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793889244;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=IhDYLVk74KLE+6uqmnSquzwjdzarIeNlcvxoecJwRDc=;
	b=yFOSZG+HOHaOW0lT+DU4W10OHCvl1iAwYB2kx51rHkciaGLETFbuF4+0EoCSwn3CgsnX
	 3CuQPiNemElBTNX4L6nz17cJHrnRQUmaaVorSoK7Orp51oLJlUtoEAIlLhIsuZ6ot2VTo
	 6ktzgGvMd1MWMgz9W2ccrVoK4in6hrppCoe6EJdza3r3vJ9xXA0eV44tXJsmTvJ0QVl1u
	 S/Z+t30b3U2ckosuYCa0Z2I3b0s5GwwxXU1JofDzqxnmWOMbBVEeAwMEfRyT4d+2mQQzJ
	 vTgGhAq3vloVubG8oZU8f2wQHnlbmElWVxngsaR/7sJqf9X35ri8sdnmNonuF+11/YQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=fI7YdUxn;
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1411B606A330
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Nov 2026 14:34:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1411B606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=fI7YdUxn
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c4697404c2bso19846766b.2
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Nov 2026 06:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1793889242; x=1794494042; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IhDYLVk74KLE+6uqmnSquzwjdzarIeNlcvxoecJwRDc=;
        b=fI7YdUxn5VVBV4gj6rQ1cryJGapHcjKNUi4OfPse3RV0xiY58lbw36dK8j3VxJOmg+
         hf1pBxhWTSCnVZ65APXcKDbZ4kVyq8yqyH2D5tUHc1z5Erq4rRDvqS/4vXXOmkUmPlDc
         LPvkbhN2Y/z7uXHGXqinekWGW5Fkg/qgO7jfnWKcbjsKE2k2BPZXPnyj3AT7JRkO0dSk
         VD2oVvau6hzh9+X20J7oRzTomCYuA6oGgtgSHogRD5Q5w2bgvC3V4ZEfJpfAIDtWZ2OT
         TU4pnrSkVqebHisq1NuFFY5YaLnT1xXklB4Q7uaO0TUaWDiDUtbQaF7OOGyGTI0ltp7f
         68Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793889242; x=1794494042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IhDYLVk74KLE+6uqmnSquzwjdzarIeNlcvxoecJwRDc=;
        b=UlljAcB9mG+fabglGxY33zlCuFWdnd2rLgd+uK4NtuRCMUfmf0WFa4ILzQfc3i6goT
         +IB6MT1FXm2j9RvY7/n5+UXUfv/snpAylg4UUCgAd5oW2FOfTXvN9zcoKcKCrCMj8560
         RlNh8Wtm9xr09FSvODy37vXLZobdJ8k2udcqQbZpT1OKiENfpd+0oXdtG1hHNnstTUuz
         5OnDY2H4F7tHb2jLKR+Ps6ZOyGc+5OwmlJlgwbc7y7SisJbkw//d1mucdOBD8SuykLbh
         sgjsh4LZuEBdBlRT8PepozuFlxBabLG1QpnjlnxuOAbRNkh3PuOMpCQXsxO7IfVPhJf7
         cxFA==
X-Forwarded-Encrypted: i=1; AKwUvBwtRYvlTpFFmU87XFumLbQhammw5ynHsfIQ+0Z7YEBwwAOwp1ZcmXyV/PIVk9Ie/jtvALbo9DEXemDZz+ePPNo=@vger.kernel.org
X-Gm-Message-State: APuU4Z94hAR3LUEJNEG1t8uYeA9/Mmy+OCklOdAQ9CGt2fZBmpMxudqs
	UrnJfJbxoI3MRcG04B5NfH5cqdtt8uiP/J8jksb3kCqcDj1dvfXFSz6nuja7RQzgL5I=
X-Gm-Gg: AYBFou10nW3ywpKGJ9QJNJpWQth6s51N+cT/bMgQ7g8LjBm1GDSTpKrwgGQrd3+v7b4
	R/VpbmSApzNt/9bSNkI+gfQu4VgHUt6qLV7o1YRGdlm/7PuS6ZuoZVIye6UjULOGD1LsEYVQs3J
	o4NIAoOKHBz6xxY4vy7t+SW/mbe9HZ+LHPTxFwwV0gldYwIDtuEUk9FkU3kNoayQiyaCTYtmoP5
	BLkmrqCO381yH6pw0IgYYCs+gpIFYefbpsGxj4SfEbGER9ekGuOdMJ9hghL1FT42L4b68hjAvj4
	49D0QauFsVLGzBdSzxIhFmR1Xnyf83aPNUS5ipkHN8gUMH2EAVWmdYuKKyJtHy232Z9Ju/uARZ3
	molX5VeVmmNbmUGSqts3ZpGBKZ6uC+k/cfBngzSztGxJMFvnP6sGAKMe08ChdTzLWULLW/fPqMw
	ulQ3EnZykxUs7aQief6i+roNb94WC6BBeqr/hUvU9yXkC4r2fQxazn/NFgy3URDvI9SoDoVb42e
	J/HwJEVyCHF6S+g91QTwL2/weTvmazn9Vje1REEszn4V6EVSdY5VqI+m6dFMbka6X5BkPItUAJ1
	I2tpmPRZM7wD6yhYGWDoQ8r1zxPgycbTzd3280htfqsHXFCIZSkliyOkl5uUveHkE1Sc
X-Received: by 2002:a17:907:a890:b0:c46:9ca9:f522 with SMTP id a640c23a62f3a-c4ca7a69782mr1644438966b.26.1793889242456;
        Thu, 05 Nov 2026 06:34:02 -0800 (PST)
Received: from L9JK9NPFH9 ([2a09:bac6:37ad:1e5a::306:b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d0e466be0sm178671066b.54.2026.11.05.06.34.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 05 Nov 2026 06:34:02 -0800 (PST)
From: Tianyi Gao <tianyi@cloudflare.com>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	toke@redhat.com,
	lorenzo@kernel.org,
	horms@kernel.org,
	bpf@vger.kernel.org,
	shuah@kernel.org,
	hawk@kernel.org,
	kernel-team@cloudflare.com,
	ast@kernel.org,
	daniel@iogearbox.net,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	linux-kselftest@vger.kernel.org,
	jiayuan.chen@linux.dev,
	Tianyi Gao <tianyi@cloudflare.com>
Subject: [PATCH net-next 2/3] veth: link RX queues to their NAPI instances
Date: Thu,  5 Nov 2026 14:33:55 +0000
Message-ID: <20261105143356.17062-3-tianyi@cloudflare.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105143356.17062-1-tianyi@cloudflare.com>
References: <20261105143356.17062-1-tianyi@cloudflare.com>
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

veth does not link its RX queues to their NAPI instances. queue-get
therefore reports no napi-id for them. napi-get lists the NAPI instances
of a veth, and their thread PIDs when NAPI is threaded. It does not show
which RX queue each instance polls. Userspace cannot tell which NAPI
thread to pin for a given queue, or which NAPI to change with napi-set.

There is also no way to busy poll an AF_XDP socket bound to a veth
queue. Since commit b95ed5517354 ("xsk: Bring back busy polling support
in XDP_COPY"), xsk_bind() takes the NAPI ID of a copy-mode socket from
rxq->napi. veth never sets rxq->napi, so the socket gets no NAPI ID.

Call netif_queue_set_napi() after napi_enable(), which assigns the NAPI
ID. Call it again with NULL before napi_disable(). veth is not ops
locked, so netif_queue_set_napi() requires RTNL. veth enables and
disables NAPI only in ndo_open, ndo_stop, ndo_bpf, ndo_set_features and
ethtool's set_channels. All of them are called under RTNL.

Suggested-by: Jesper Dangaard Brouer <hawk@kernel.org>
Signed-off-by: Tianyi Gao <tianyi@cloudflare.com>
---
 drivers/net/veth.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/veth.c b/drivers/net/veth.c
index a3570547ee99..c00ebc5b96c7 100644
--- a/drivers/net/veth.c
+++ b/drivers/net/veth.c
@@ -1062,6 +1062,8 @@ static int veth_napi_enable_range(struct net_device *dev, int start, int end)
 		netif_napi_add(dev, &rq->xdp_napi, veth_poll);
 		rcu_assign_pointer(rq->xdp_prog, priv->_xdp_prog);
 		napi_enable(&rq->xdp_napi);
+		netif_queue_set_napi(dev, i, NETDEV_QUEUE_TYPE_RX,
+				     &rq->xdp_napi);
 		rcu_assign_pointer(priv->rq[i].napi, &priv->rq[i].xdp_napi);
 	}
 
@@ -1094,6 +1096,7 @@ static void veth_napi_del_range(struct net_device *dev, int start, int end)
 		struct veth_rq *rq = &priv->rq[i];
 
 		rcu_assign_pointer(priv->rq[i].napi, NULL);
+		netif_queue_set_napi(dev, i, NETDEV_QUEUE_TYPE_RX, NULL);
 		napi_disable(&rq->xdp_napi);
 		rcu_assign_pointer(rq->xdp_prog, NULL);
 		__netif_napi_del(&rq->xdp_napi);
-- 
2.56.0

