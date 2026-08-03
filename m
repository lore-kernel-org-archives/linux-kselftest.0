Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B1434EEEE
	for <linux-kselftest@vger.kernel.org>; Mon,  3 Aug 2026 22:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785795739; cv=none; b=fqNrNWLuRZ2F6RFsRlTcoNGuYbvf5v/lwnNxBlHuQ4GaJ+fpEOCMMMiExjkZ7WNuhgEz0mrTeDcHf1Z2rMFeY36sDBJ4RQyjmfpe/FeRHIvb6J6Yo3wu6ztT+d74ah6OxvE96dX9v59tFoBPu37amDKDP9YYSzheuYy1VnX0qn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785795739; c=relaxed/simple;
	bh=2mtwsZnBWcBamwUChkhFW4fWi6Ue37VU5u6ER8FoQBg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XqS0kOe5fKq3aF5Vn+ZAJuwoLtjxZCD3wAqBnY286RumjU0AoFM9hupbYdHAFR7ACrsLAXyDWBFAK3EO4kqQvHamgXxTGxpLjYwqcuTUf2rOKRSCq795IU/r17CJT8ck4brD0r967FFJXlGab71XUZ+pwMHRX0jIV5RQxB5P0Bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IWnMUF/d; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IWnMUF/d"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47fe45db360so156552f8f.2
        for <linux-kselftest@vger.kernel.org>; Mon, 03 Aug 2026 15:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785795736; x=1786400536; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gefTegpE8rsUQOeWJ5th3V/xI+OSspzBtM2w9vJy2Dk=;
        b=IWnMUF/dxetL/VdopkUV89QqxPxuJy6k+wcT3I47LCI0DiBgMxdQoU6JwSeEx4VfJv
         G2fGlwXSKPFxgMAkmtmz0RxfnQXb2lOQ/3MTrszKfiSn3+BjshfONxjKIyBqyscQ2s7o
         9DSO8QLJfwRxkUjKo39TuxmBEdUVU3SZnJe1GcczPV2jm7+fRdg98UGXk3ARGBjujvaR
         HlMNQ3rhakrO+Kc5XBotj63KAn1NS1tT048XVQCsZ2GHlDN2M5IXKzjP/qS0EqYK+cJh
         m7GZwDdOm+R0lvHiuOhAZp5f4Gn+b2TdT+BGRFKmukGGHDYcHWcrY1wO0O9+N0Ss+6jL
         ewog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785795736; x=1786400536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gefTegpE8rsUQOeWJ5th3V/xI+OSspzBtM2w9vJy2Dk=;
        b=O6PYizAmuMPl5u7bei886zLcoFi2vsOgGYUsseOqAv646xcGtSiv5BXAf/ZCENMrq0
         r/DZmn7PVRK/6V0g0hiAKjsbNyIqQz6eepOPruQpzDJfyjhp2nt8ZK2dSEmXCdfE38T6
         kPREeZTZxq577QXVD83KtLjPlln6LNFNzJ2spxUfdfjD4gQpuz3SJmQ7wqB1L7Xrt2oY
         WUyJtD/PU8/fSJfqXorFcschOaF1UmPHhOOvmaB99oA4Kr5XCgrf7TN/Zv9FAzUA/8Hg
         ga+S7NbdD5iGt9/vhGJxi2XxtIHtBFz/339rHCs88b9D/7z3vKcmjK7mOIBGiUIsreS8
         CaQg==
X-Forwarded-Encrypted: i=1; AHgh+RqyvPFWISpzcE64Bo1zyJkL+7utpc/TrabURHMzu4Q3nyu3SDnTvOTIyHH1dvvTWd+kl9VBz3XqE3T79gVhzfE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyG+aYxmnoDDUAxd7WOTEdo+e4GAPBxWB0PfBbpG/8L3+EvHBs8
	Fp4wQE2Vb2HO5L9am3sT48kKyG7Ka3hfntzio1XWM7JLk1DbNmhPsXOE
X-Gm-Gg: AR+sD11fqv3oiQD5gnoW0xCzsFq/Sg5Ky9qvftNwmL42MXI31aYVHTPicfN81e8jCzM
	cQRRRxS5PDrgWHv9p7FBkSOdRmz9sncLeffi/dC8LKJ/2JB1aukNUUWiMkmIUlf/YpJw4s1tiQj
	AK5J9r+hO/QLkIPIP5A8YKiRMmOOmtigM1uWRv0U+G7kVXUeQlGutHadOA0b6ixPWdGInB7qZFX
	xeDqgtHipheexq5reiI4IbbG72sHoLwJLr30lsD3bHxQhU4/kFcfwr4y+Od3yzIE4rdNQEhqY/M
	DBTO0ZH5yi8yrPCz899FhTmWMuJdURzl8DjUCnc/rQYHJFbYgkOa5esOWlITsfjJMX58El/eh4D
	Nc1SAcq3Dh3ZbU2fAVOFu4E4NrPeuw/MKaLm9iwhSG4Dfy9ERA78mtsH6mlSed523xQBbSkFKKD
	LwYSkGYGp9qoJwRhzeETAdnadDa4lv0MvfZfg+sNg33ppWF40OtiHPAoJGkeSwvTZ5q4PjPSsaJ
	xXaxXk+bnb8WVvwNnQ8KM8ozLhVoeM1zCgOXeswrvzOjhr8dEECIrslT8J3IEzKr0s6HUHTC4uV
	ceqM7YEt2TZF7OcQBZc=
X-Received: by 2002:a05:600c:1c21:b0:496:c249:ddb1 with SMTP id 5b1f17b1804b1-4980c694674mr131501185e9.4.1785795736026;
        Mon, 03 Aug 2026 15:22:16 -0700 (PDT)
Received: from L-022584.energy.envision.com (dynamic-077-012-149-099.77.12.pool.telefonica.de. [77.12.149.99])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49949fc2da2sm31668145e9.3.2026.08.03.15.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 15:22:15 -0700 (PDT)
From: Xin Xie <xiexinet@gmail.com>
To: netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	andrew+netdev@lunn.ch,
	shuah@kernel.org,
	kees@kernel.org,
	petr.wozniak@gmail.com,
	qingfang.deng@linux.dev,
	fmaurer@redhat.com,
	luka.gejak@linux.dev,
	bigeasy@linutronix.de,
	xiaoliang.yang_1@nxp.com,
	skhawaja@google.com,
	stable@vger.kernel.org,
	sdf.kernel@gmail.com,
	Xin Xie <xiexinet@gmail.com>,
	Ali Ahmet Memis <ali@iusegentoo.com>
Subject: [PATCH net v4 1/4] net: hsr: fix packet drops caused by GRO superpackets
Date: Tue,  4 Aug 2026 00:22:08 +0200
Message-ID: <20260803222211.877-2-xiexinet@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260803222211.877-1-xiexinet@gmail.com>
References: <20260803222211.877-1-xiexinet@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

HSR/PRP append a 6-byte tag/RCT to every forwarded frame and process
each frame individually (sequence numbering, duplicate discard). When
a lower device aggregates received frames into a GRO super-packet --
in software, or in hardware on GRO_HW-capable NICs -- the HSR
receive/forward path sees a single skb instead of the individual
frames. Depending on the lower device, that super-skb is then either
rejected outright (for example when it exceeds the lower MTU at
egress), or forwarded without valid per-wire-frame HSR/PRP
processing: its single trailing tag/RCT cannot represent the
per-frame trailers and sequence numbers of the aggregated frames. On
memory-constrained devices, processing super-skbs in softirq context
can also pressure atomic memory allocation.

The HSR/PRP stack already disables LRO on enslaved devices for the
same reason. Extend that treatment to GRO: add netif_disable_gro()
and dev_disable_gro() mirroring netif_disable_lro()/dev_disable_lro(),
and call dev_disable_gro() from hsr_portdev_setup() so enslavement to
an HSR/PRP master automatically strips NETIF_F_GRO and NETIF_F_GRO_HW
on the lower device (recursively on its own lowers, as with LRO).

This is a setup-time default, not an immutable feature policy: a
later privileged feature override, or a lower newly attached below a
stacked slave, can re-enable GRO without re-walking the HSR
enslavement path. Patch 3 is the fail-safe for that case: a GSO skb
that nevertheless reaches the forward entry is segmented on the
plain master/interlink paths or rejected on the LAN/tagged paths, so
invalid aggregates are never forwarded as-is -- though a later
override can still cost traffic on a LAN ingress.

Fixes: f421436a591d ("net/hsr: Add support for the High-availability Seamless Redundancy protocol (HSRv0)")
Cc: stable@vger.kernel.org
Reviewed-by: Ali Ahmet Memis <ali@iusegentoo.com>
Tested-by: Ali Ahmet Memis <ali@iusegentoo.com>
Signed-off-by: Xin Xie <xiexinet@gmail.com>
---
 include/linux/netdevice.h |  2 ++
 net/core/dev.c            | 18 ++++++++++++++++++
 net/core/dev_api.c        | 16 ++++++++++++++++
 net/hsr/hsr_slave.c       |  1 +
 4 files changed, 37 insertions(+)

diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index 9981d637f8b5..eba2c26a49ba 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -3434,6 +3434,8 @@ void dev_close(struct net_device *dev);
 void netif_close_many(struct list_head *head, bool unlink);
 void netif_disable_lro(struct net_device *dev);
 void dev_disable_lro(struct net_device *dev);
+void netif_disable_gro(struct net_device *dev);
+void dev_disable_gro(struct net_device *dev);
 int dev_loopback_xmit(struct net *net, struct sock *sk, struct sk_buff *newskb);
 u16 dev_pick_tx_zero(struct net_device *dev, struct sk_buff *skb,
 		     struct net_device *sb_dev);
diff --git a/net/core/dev.c b/net/core/dev.c
index 5933c5dab09e..a6cf2adc8625 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -1840,6 +1840,24 @@ void netif_disable_lro(struct net_device *dev)
 	}
 }
 
+void netif_disable_gro(struct net_device *dev)
+{
+	struct net_device *lower_dev;
+	struct list_head *iter;
+
+	dev->wanted_features &= ~(NETIF_F_GRO | NETIF_F_GRO_HW);
+	netdev_update_features(dev);
+
+	if (unlikely(dev->features & (NETIF_F_GRO | NETIF_F_GRO_HW)))
+		netdev_WARN(dev, "failed to disable GRO!\n");
+
+	netdev_for_each_lower_dev(dev, lower_dev, iter) {
+		netdev_lock_ops(lower_dev);
+		netif_disable_gro(lower_dev);
+		netdev_unlock_ops(lower_dev);
+	}
+}
+
 /**
  *	dev_disable_gro_hw - disable HW Generic Receive Offload on a device
  *	@dev: device
diff --git a/net/core/dev_api.c b/net/core/dev_api.c
index 437947dd08ed..02fb21629512 100644
--- a/net/core/dev_api.c
+++ b/net/core/dev_api.c
@@ -269,6 +269,22 @@ void dev_disable_lro(struct net_device *dev)
 }
 EXPORT_SYMBOL(dev_disable_lro);
 
+/**
+ * dev_disable_gro() - disable Generic Receive Offload on a device
+ * @dev: device
+ *
+ * Disable Generic Receive Offload (GRO) on a net device.  Must be
+ * called under RTNL.  This is needed if received packets may be
+ * forwarded to another interface.
+ */
+void dev_disable_gro(struct net_device *dev)
+{
+	netdev_lock_ops(dev);
+	netif_disable_gro(dev);
+	netdev_unlock_ops(dev);
+}
+EXPORT_SYMBOL(dev_disable_gro);
+
 /**
  * dev_set_promiscuity() - update promiscuity count on a device
  * @dev: device
diff --git a/net/hsr/hsr_slave.c b/net/hsr/hsr_slave.c
index 01c73b4b50dd..da06b21cdf51 100644
--- a/net/hsr/hsr_slave.c
+++ b/net/hsr/hsr_slave.c
@@ -170,6 +170,7 @@ static int hsr_portdev_setup(struct hsr_priv *hsr, struct net_device *dev,
 	if (res)
 		goto fail_rx_handler;
 	dev_disable_lro(dev);
+	dev_disable_gro(dev);
 
 	return 0;
 
-- 
2.43.0

