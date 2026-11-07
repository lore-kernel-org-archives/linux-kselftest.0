Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794022480;
	b=cbbuuHXxtRaReqarkIg2SXsGI5AKTAhAgk+NNM0reGx08j86UkZbz4L48kP5X3bqd4cU
	 KFkiWdHudfxVOIG3c8YlJSS0CoBSBIo5et3rHwjBCkylRULvxI2w9LhdbxV7X3BBwpl64
	 n1vx+AFVIxImPTM1uRFwJd7Ib4NA4NJ47abn/BgWFn64DO8k8oyhIFv9taxD/Ya1zmDqF
	 cO2cSogjCCHrItMCU/58kC2qAAA3LcaWTxMyaBSusxxGXMYgQViBYYBfnxGYFskYvkZAe
	 BGYc9iPy7n+hdf7B3D98gEi+NGIcK3hdg0TJQMOZpzK8vXDwLUN1BTE+KDCpucHwL+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794022480;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cfMXkh6VTaXtp63tlhgzL63DIj6eSWdYUyNN9TjaTZQ=;
	b=HEpF1MM8gO0h2jLQ3fdANWr69x8l5MayE4t+ZSuKSMpLWvLB/u/bCmC3DqXHWZ+vXdEn
	 RTpn2aXaaMToMuhHXRWR74uFadDs3zFMtu+/0bG/+715t2awo/AJaEiOmCs7EaJNbKvlk
	 2kk5mdDSfDlMEPy8DF9LqLiidFZgJ67ybIys9s82RSy0l2Mf8e2+2a+JhKHVhizaOEBek
	 DcsXa4jSWxynbladZf2L34ORHxkTCrie08AQcaDdEgeARFRs3hQYVd2TtElLmNNAhOKw5
	 ghnDiwL0gcKCa5lpl+gfQ7VSATmxP8LTFeEQ2FXWiAhUrvPjRdcsKhV4pZaTLdMp8bQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b="X4ajpP2/";
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A36606D802
	for <linux-kselftest@vger.kernel.org>; Sat,  7 Nov 2026 03:34:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4A36606D802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=X4ajpP2/
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c40f29667e6so190051766b.0
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Nov 2026 19:34:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1794022478; x=1794627278; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cfMXkh6VTaXtp63tlhgzL63DIj6eSWdYUyNN9TjaTZQ=;
        b=X4ajpP2/qLBu+frbKc6FPCqS5Dx1dI2JHGNFYsBxFHx1v6WLOytP3Fm3OhyxpgltLv
         ySc8L1CAqkrL1RDW0nfumJ9R2s6zuVcr+qVAgLZjYH7ydjYc9Ms+oWjaPfRC5XKS42i6
         dm8Ql/xPk+af76t8B3WDwATSeDBgZU7XikWbgi2d7cbiEdsFrFMrRUjOPg5bSHkzYfBH
         wMVNKC+EzUOXt24LvxW81mxFSRnev3gYrxWLaoPiTkJnp7kjOXbUO6F3etY1BkA0VqYs
         IqSc8So7iCjqwNTsPFMq/7/OOhpi3WI9D0oXjgcfC8BBkdjVGvsUWqSAyW0uLweocIux
         PlVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794022478; x=1794627278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cfMXkh6VTaXtp63tlhgzL63DIj6eSWdYUyNN9TjaTZQ=;
        b=rI4rN4SJe+klEWEoKKmXjIaochY1DDSUCi4pjKtxzi7JgAi5b4c8ugiTZ/EwOt7265
         jpO24hx4/HpqOLTi1zYqk1wexhJhNkOSS+tsd6iBCiT5UqF1453iT5GMY958HcamyTl8
         srfihO+TgWxR+ZFWb58If28LFDNtNwVpTOJGEmIkpdB+nSYcnrQcrxV9ZPOn+tyOYF6C
         /wZAXGk/8jhwAAkmmM/CdFVl8+ILdF194H0vdjvrD5X8NKimu2x45xoVb93B4HATuHjS
         6JiqfpaAVK/ns1uGku3I8LvCgXMJuSaFypuj8dCqFDCr5L/8iWv/AdA8F7g2BjsDPxkt
         adqA==
X-Forwarded-Encrypted: i=1; AKwUvBweQMVzlptVgWm81wKTwNNpciiO6ANmlrdl6dBEdIDuRhVA2CJ85fdyZBChh+FvT4nXdZeVwopeOrcNi8x77zE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+vhS2wxhUYY2U7yKomTa4sxS0ngfVhWh3XUrcCuS3Xjx9kb27w
	D6X51hq6GlfsvzL23ZnJwk+NeHrgmXP3BehAfzW1MFcJNNLCObUKFAUyr4NRFCNfQIM=
X-Gm-Gg: AYBFou0xbkMvq0Ouf0xo5GCaFPdImJGR/Asexvc4C0ZmpofQUPZhUFBUQMF03xWhJzi
	8IFfi8jdO2S9zJSEqFpBj/rSd+rWHa2CEIdpmhPxt4HYvTTeoENFv+2oz1RfmZOUqGWRyl9W70+
	L64txAAVffTCMOA6zdMLSIz6E7rSdBs0zr6JG+yMP0BUaH5+YqZq3MsbgMcHTt3jJwWgQtTk1Jp
	g107sUviesg3jh/HA6Ez4E9FeVS+yMS1pFQJaJX9b8HW1V+m4ET7gLNzDZE4nef0MSFD+eYYJ7k
	GWhLvxScxNswfaBGE2dmia29KKAJ9AHPGl6cZY45BQHOQzqXn7x+SBwhVRjnYJZx5ZiGswsAeDv
	pL5AtZgCyXEKXDLPlbJeVJiXiX3xtqD9ja2BQpKFgjD3dQVmO4RDk3mqm0xWXIm3EwuIkgyZfn9
	WcZHqC9X+NsXYlOrDu5Y8/YGqVr44sGjM0GpkfJXGdLAardzqZ7A+LUMb5sl4DgGdAtxWq8vmjV
	I5EKXu5830dK6yTBAfgYaBLcfg9WeP/tsZG9sGJ04jY5m+R9BY1lagN6ai6SFleFlX5MJHtcP48
	hr2yWkJCkuUmwD5msEe08loQYu1ZYMnJnjoy7dSYrAHKFjGupvbELcrDCcABnWE=
X-Received: by 2002:a17:907:968d:b0:c46:7ec3:fdfb with SMTP id a640c23a62f3a-c4d35261f32mr342883166b.7.1794022478154;
        Fri, 06 Nov 2026 19:34:38 -0800 (PST)
Received: from L9JK9NPFH9.lan ([104.28.20.56])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d3562e00dsm121104166b.21.2026.11.06.19.34.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 19:34:36 -0800 (PST)
From: Tianyi Gao <tianyi@cloudflare.com>
To: netdev@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Eric Dumazet <edumazet@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
	Simon Horman <horms@kernel.org>,
	David Keogh <dkeogh@amazon.com>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	David Woodhouse <dwmw2@infradead.org>,
	Dragos Tatulea <dtatulea@nvidia.com>,
	Nimrod Oren <noren@nvidia.com>,
	Alasdair McWilliam <alasdair@mcwilliam.dev>,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Magnus Karlsson <magnus.karlsson@intel.com>,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	Alexei Starovoitov <ast@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Donald Hunter <donald.hunter@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Shuah Khan <shuah@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Breno Leitao <leitao@debian.org>,
	=?UTF-8?q?Asbj=C3=B8rn=20Sloth=20T=C3=B8nnesen?= <ast@fiberby.net>,
	Danielle Ratson <danieller@nvidia.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	bpf@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	kernel-team@cloudflare.com,
	nh-open-source@amazon.com,
	Tianyi Gao <tianyi@cloudflare.com>
Subject: [PATCH net-next 1/8] net: add tx_extra_headroom and LL_ALLOC_SPACE()
Date: Sat,  7 Nov 2026 03:34:20 +0000
Message-ID: <e90e748e0aefa7cbe1c2b31b8c7902ccf135c3f2.1794020868.git.tianyi@cloudflare.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1794020868.git.tianyi@cloudflare.com>
References: <cover.1794020868.git.tianyi@cloudflare.com>
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

From: David Keogh <dkeogh@amazon.com>

Programs attached at TC egress commonly push additional headers onto a
packet, for example to encapsulate it. When the packet does not carry
enough headroom the BPF helpers reallocate the head, which costs an
allocation and a copy per packet.

Locally generated UDP, raw and AF_PACKET traffic is allocated with
exactly LL_RESERVED_SPACE() of headroom, which only covers the
link-layer header and the driver's needed_headroom. An administrator can
only ask for more headroom at allocation time if the driver supports it,
as netkit does with IFLA_NETKIT_HEADROOM. veth does not.

Add a tx_extra_headroom field to struct net_device for that purpose,
together with LL_ALLOC_SPACE() and LL_ALLOC_SPACE_EX(). These add the
extra reservation to the header length before the HH_DATA_MOD alignment,
so the alignment of the link-layer header does not change.

The new macros are intended only for sites that allocate new packets.
LL_RESERVED_SPACE() keeps its current meaning and remains the threshold
used when checking whether an existing packet must be expanded, so the
extra reservation never forces a reallocation on its own: packets that
already have enough room for the headers being pushed, such as TCP
segments built with MAX_TCP_HEADER, are left alone.

Keep the extra reservation separate from needed_headroom so that driver
updates of their own requirement do not clobber it and so that it can
be cleared independently. Place the field in the padding that follows
needed_headroom, which keeps it in the TX read-mostly cacheline group.

The field is not set anywhere yet. A later patch exposes it through
rtnetlink.

Also remove LL_RESERVED_SPACE_EXTRA(). It has had no user since
commit 6d5431555de0 ("caif: remove CAIF NETWORK LAYER"). It could add
the extra headroom, but it reads dev->hard_header_len itself. AF_PACKET
must use the value that it read once, see commit 03390aa32e66 ("packet:
use consistent hard_header_len in non-ring send paths").
LL_ALLOC_SPACE_EX() takes the header length as an argument instead.

Signed-off-by: David Keogh <dkeogh@amazon.com>
[tianyi: remove LL_RESERVED_SPACE_EXTRA()]
Signed-off-by: Tianyi Gao <tianyi@cloudflare.com>
---
checkpatch --strict reports "Macro argument reuse 'dev'" for
LL_ALLOC_SPACE_EX() and LL_ALLOC_SPACE(). It reports the same for
LL_RESERVED_SPACE().
---
 .../networking/net_cachelines/net_device.rst  |  1 +
 include/linux/netdevice.h                     | 36 +++++++++++++++++--
 net/core/dev.c                                |  2 ++
 3 files changed, 36 insertions(+), 3 deletions(-)

diff --git a/Documentation/networking/net_cachelines/net_device.rst b/Documentation/networking/net_cachelines/net_device.rst
index 8eceaa80b686..a7e311fb7875 100644
--- a/Documentation/networking/net_cachelines/net_device.rst
+++ b/Documentation/networking/net_cachelines/net_device.rst
@@ -35,6 +35,7 @@ unsigned_short                      gflags
 unsigned_short                      hard_header_len             read_mostly         read_mostly         ip6_xmit(tx);gro_list_prepare(rx)
 unsigned_int                        mtu                         read_mostly                             ip_finish_output2
 unsigned_short                      needed_headroom             read_mostly                             LL_RESERVED_SPACE/ip_finish_output2
+unsigned_short                      tx_extra_headroom           read_mostly                             LL_ALLOC_SPACE/__ip_append_data
 unsigned_short                      needed_tailroom
 netdev_features_t                   features                    read_mostly         read_mostly         HARD_TX_LOCK,netif_skb_features,sk_setup_caps(tx);netif_elide_gro(rx)
 netdev_features_t                   hw_features
diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index 435be7880d7e..98d1501d6fee 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -311,9 +311,24 @@ struct hh_cache {
 	  & ~(HH_DATA_MOD - 1)) + HH_DATA_MOD)
 #define LL_RESERVED_SPACE(dev) \
 	LL_RESERVED_SPACE_EX(dev, (dev)->hard_header_len)
-#define LL_RESERVED_SPACE_EXTRA(dev,extra) \
-	((((dev)->hard_header_len + READ_ONCE((dev)->needed_headroom) + (extra)) \
-	  & ~(HH_DATA_MOD - 1)) + HH_DATA_MOD)
+
+/*
+ * Headroom to reserve when allocating a locally generated packet for
+ * transmission through a device. On top of LL_RESERVED_SPACE() this adds
+ * the administrator-configured tx_extra_headroom, folded in before the
+ * alignment so that the link-layer header placement does not change.
+ *
+ * Only use this for new allocations. Code that checks whether an existing
+ * packet has enough headroom must keep using LL_RESERVED_SPACE(), so that
+ * the extra reservation can never force a reallocation by itself.
+ */
+#define LL_ALLOC_SPACE_EX(dev, hlen) \
+	LL_RESERVED_SPACE_EX(dev, (hlen) + READ_ONCE((dev)->tx_extra_headroom))
+#define LL_ALLOC_SPACE(dev) \
+	LL_ALLOC_SPACE_EX(dev, (dev)->hard_header_len)
+
+/* Upper bound for tx_extra_headroom, in bytes. */
+#define NETDEV_TX_EXTRA_HEADROOM_MAX	512
 
 struct header_ops {
 	int	(*create) (struct sk_buff *skb, struct net_device *dev,
@@ -1934,6 +1949,10 @@ enum netdev_reg_state {
  *
  *	@needed_headroom: Extra headroom the hardware may need, but not in all
  *			  cases can this be guaranteed
+ *	@tx_extra_headroom: Additional headroom reserved when allocating
+ *			    locally generated packets for transmission,
+ *			    configured by the administrator. Not a driver
+ *			    requirement; see LL_ALLOC_SPACE()
  *	@needed_tailroom: Extra tailroom the hardware may need, but not in all
  *			  cases can this be guaranteed. Some cases also use
  *			  LL_MAX_HEADER instead to allocate the skb
@@ -2196,6 +2215,7 @@ struct net_device {
 	 */
 	unsigned int		mtu;
 	unsigned short		needed_headroom;
+	unsigned short		tx_extra_headroom;
 	struct netdev_tc_txq	tc_to_txq[TC_MAX_QUEUE];
 #ifdef CONFIG_XPS
 	struct xps_dev_maps __rcu *xps_maps[XPS_MAPS_MAX];
@@ -2772,6 +2792,16 @@ struct netdev_queue *netdev_core_pick_tx(struct net_device *dev,
 					 struct sk_buff *skb,
 					 struct net_device *sb_dev);
 
+/* Same as LL_ALLOC_SPACE() without link-layer header and alignment, for
+ * callers that size the headroom themselves.
+ */
+static inline unsigned int
+netdev_tx_alloc_headroom(const struct net_device *dev)
+{
+	return READ_ONCE(dev->needed_headroom) +
+	       READ_ONCE(dev->tx_extra_headroom);
+}
+
 /* returns the headroom that the master device needs to take in account
  * when forwarding to this dev
  */
diff --git a/net/core/dev.c b/net/core/dev.c
index 3b60b15e2175..95483a132a73 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -13551,6 +13551,8 @@ static void __init net_dev_struct_check(void)
 	CACHELINE_ASSERT_GROUP_MEMBER(struct net_device, net_device_read_tx, num_tc);
 	CACHELINE_ASSERT_GROUP_MEMBER(struct net_device, net_device_read_tx, mtu);
 	CACHELINE_ASSERT_GROUP_MEMBER(struct net_device, net_device_read_tx, needed_headroom);
+	CACHELINE_ASSERT_GROUP_MEMBER(struct net_device, net_device_read_tx,
+				      tx_extra_headroom);
 	CACHELINE_ASSERT_GROUP_MEMBER(struct net_device, net_device_read_tx, tc_to_txq);
 #ifdef CONFIG_XPS
 	CACHELINE_ASSERT_GROUP_MEMBER(struct net_device, net_device_read_tx, xps_maps);
-- 
2.56.0

