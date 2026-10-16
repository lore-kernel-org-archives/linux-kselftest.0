Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86DC13ED5A1
	for <linux-kselftest@vger.kernel.org>; Fri, 16 Oct 2026 21:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792186950; cv=none; b=qvcDk7PyTjqBfxZVnVBQCwxKoIt/5vPY1RPF13+sQWYjYEdmHcDG3/b/87d4HPV4p3gUOIHvJWyVbqL+bjN1DBj3YvYyvIYruThPKZxV1BExkW/4ifmeuiQ3Cfh2C+zVL76kbtm/02lsyXuinoBUCS/ufI4XaHzXH40+QPvmejA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792186950; c=relaxed/simple;
	bh=cRk62IXda5uswUNfWyJKtpQk+IUO0CMGpvz/RtOq/48=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VqW2y7dqRtDHOzwUSHFCGrCbJCcVICA13c84VyTps1XmjoS+FyTOqmvGEw9ACQcxZIQeKZ6CGshbpoLX6HNC3lcWXtmwDuJq/N0qbptLY8mS2tILwoHCQF2ZYOtCSYS3X2mNfnmvc+m3fxcHJd4vrEMAGApZKaV9LjcVcU35IfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=TI9pjIOO; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="TI9pjIOO"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48dd33a7bd4so106467f8f.3
        for <linux-kselftest@vger.kernel.org>; Fri, 16 Oct 2026 14:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1792186946; x=1792791746; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UPEvAm5BD4qdGQ/byj1NqbzTLMKiUg8kVp/CFRsEQdc=;
        b=TI9pjIOOH8D/xZcai98/MNaAB4CkNadbDB4xQg8ITwsWOr2A8CXjUzH98u3fyInJ0W
         ZWhmMSQXhQlQ96RGeg7o189PHPKUDwWiZUxvZn+MdgX97GMLsM+TcWOiG58KmMeWOhW1
         KhKKOaJP5c3ywXBwimsZrJXuPHahIJX8fvmOdluLxRizyRKzdC5Yoc4t0GQN/IwOyybk
         VdXbN+umruHzAFVTQ532+G7FpClgaDLYmWJoXXQJA3kFd1UtNEIO9P+ouKueJpRAx/oV
         g16RDLoAFwJ2xpU47kUwFLKhuZBA+ecWwmlIa8dUooRGuTsW7J/HjmNqPLil6rjvlJYm
         5OFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792186946; x=1792791746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UPEvAm5BD4qdGQ/byj1NqbzTLMKiUg8kVp/CFRsEQdc=;
        b=0O6pTJC7GfH68U2J8O7o7k1Yeo/fEF2+xWeSr2Twt01oGNQyW0zBoOKRA9OjaWPoRe
         P/COokI4/Zrypk8KwxdwluMW8EjaC2Jx9gopudovjdG2ex6Hcs47zkEozu3AdemroQgA
         4+bHP9xee0ySvp2tGrBuxehTEqsxwrXDynyLWyB/kp9u6u1yCuby7CGSVhq1yR1EfNpM
         T4H11juNwmZ6+utrds4UiPsJTaytsgR3wTxD3QpltOECavoUIFICHxjMmULYkbepTUNp
         liuU8aN03jm0p7pGLB1NPh2K96PjPByid1qjcHqD9Lk/V/a8gv4DE6RyVERv7eOOtYOt
         2Lsg==
X-Forwarded-Encrypted: i=1; AKwUvBxIvEOKKCyGaxjXSe5MRi6ENEC5xw2VlJhfMqdBZ71W4fq4KWnfmPzswb+ll4BKtp5fUxN+H61erm8HAHSb1/E=@vger.kernel.org
X-Gm-Message-State: AFq9FYKbNdKiIkRCIW3WgBIQXV9kiecPptR4ZgeelkNhrNGDhGfCWYnp
	TLOwM5MypIosOnVoJZYOHwa5CXAetmadWoyMBTZL+RG1UN4FYWJ9425xWiAe8uzWRe4=
X-Gm-Gg: AYBFou2JRs8YVuCbjyZksMJekWhbxSBKf8/pG7DEn743heT6s031RBmJ/XmH5IWJ83K
	WvfPyAnFhL8EnX3h3Wz3QgJoIGcsiJ11O9Fz2ic7uyAB0ZI3l3u6+dpWL7kQrnsJoJKlNKg8BZG
	t7CP+X9TJQ6EOEseDanpryAspJYu3B8y0eiYKqRPP2rz8Ir4ZbbMMoZ0Q3w9Nq1Zsdp9U4fGMx6
	D5KTC1jyD5yA6TrAel0r9AQXuHPvYwlyxk7XGLBluFX7gmlSFM+oAgX+LhWtW0JUgoP+CaV8TNr
	5vN78DEUxXFFWTefUoPrA+DYw1FrtxwjpJIYHIHH+YgXPXU4iZzYziAKkteRv0cSQcG7S+9Q4/A
	ojKiwkWxKgBNqJ/SpaN/rnc9w1oXSHO4P8VY6vjpdfBsGEtr//lmoeqBLJCV6f1OmqOgo5WwWP+
	5yvabHgOvgd6x/Q2i8TcEUqylnbsHxCci6X9u/1S68LCMULQOUUDiu3N424bTAELdzUXQLELXBq
	NVTBRwOT8C9V51LAg==
X-Received: by 2002:a5d:53c6:0:b0:48e:37e:470f with SMTP id ffacd0b85a97d-48e07fbbe8cmr1143983f8f.51.1792186945722;
        Fri, 16 Oct 2026 14:42:25 -0700 (PDT)
Received: from D90XRJJJNQ ([2a09:bac6:37af:ec8::179:190])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4f8bb6sm7975417f8f.34.2026.10.16.14.42.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 16 Oct 2026 14:42:24 -0700 (PDT)
From: Tianyi Gao <tianyi@cloudflare.com>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	toke@redhat.com,
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
	bochaolucky@gmail.com,
	toshiaki.makita1@gmail.com,
	lorenzo@kernel.org,
	Tianyi Gao <tianyi@cloudflare.com>
Subject: [PATCH net 1/2] veth: schedule the peer's NAPI after XDP_TX when only GRO is enabled
Date: Fri, 16 Oct 2026 22:42:16 +0100
Message-ID: <20261016214217.16942-2-tianyi@cloudflare.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261016214217.16942-1-tianyi@cloudflare.com>
References: <20261016214217.16942-1-tianyi@cloudflare.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

veth_xdp_xmit() queues XDP_TX frames on the peer's ring if the peer has
NAPI. A peer with GRO enabled and no XDP program also has NAPI.

veth_xdp_flush() then schedules the peer's NAPI, but only if the peer's
xdp_prog is set, so for such a peer the frames are never processed.
Nothing else schedules that NAPI by default.

Once the ring is full, every XDP_TX frame is dropped, and so are the
skbs that veth_xmit() queues on the same ring.

Commit 0e672f306a28 ("veth: check for NAPI instead of xdp_prog before
xmit of XDP frame") changed the check in veth_xdp_xmit() but not the one
in veth_xdp_flush(). Make veth_xdp_flush() check the napi pointer
instead of xdp_prog, as veth_xdp_xmit() does.

Fixes: 0e672f306a28 ("veth: check for NAPI instead of xdp_prog before xmit of XDP frame")
Signed-off-by: Tianyi Gao <tianyi@cloudflare.com>
---
 drivers/net/veth.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/veth.c b/drivers/net/veth.c
index 643b97dc5245..9405ffac598a 100644
--- a/drivers/net/veth.c
+++ b/drivers/net/veth.c
@@ -612,7 +612,7 @@ static void veth_xdp_flush(struct veth_rq *rq, struct veth_xdp_tx_bq *bq)
 	rcv_priv = netdev_priv(rcv);
 	rcv_rq = &rcv_priv->rq[veth_select_rxq(rcv)];
 	/* xdp_ring is initialized on receive side? */
-	if (unlikely(!rcu_access_pointer(rcv_rq->xdp_prog)))
+	if (unlikely(!rcu_access_pointer(rcv_rq->napi)))
 		goto out;
 
 	__veth_xdp_flush(rcv_rq);
-- 
2.55.0

