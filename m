Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795052328;
	b=Dz+WET8wA6X0/betlUGCVq9wh9cglu7wCSaNu047TJ0KvaOud7VRz9yGOpSNXb4uAi47
	 qxXd9s9nuSyKZ+nYl3ld4qzP+vcbhp3IdVVwg6cxZHcbKDHbLv7DRK5jMfmWlTIbYIOlT
	 W2Z6eUphB73bgfCFCvYlXQlU0z5QkvUCuOL3arpEs7c2Vu+kQIyf+jkAakXE6aiA96oRW
	 n3egd+WQJvlje4q2v1CPiRdahxPM2T1KZQxs1GxjRLpBdUj6Kz3qDFp4Q101KQ5ib0UW9
	 A2lWFglZeZwHbuHwe9K3GUzRAk2fRi0QH6WlRgnm/j6L4G3AqJ/d6lBSj1Bdqb2sL0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795052328;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SPQlmHY4zyewM/5GeaUABznsUsxTpbSiCVxtUkYNvlo=;
	b=BVH46Jb20DasRAYjD0pNYQ0CLegj9HdH495RAyspfKDlIyuYTV+IhDfp3L61zW9WfPpm
	 HgyUv1Ys9ZqO0n/exFBwq4M/mbvK1cSo0GZxsu+ZMgAfWhh+Km2NOUhPht1GTgXFxz0l+
	 OF+xYY6u6nLwTuA1f3cFf/xGOmmQJGn3bWLsiDrj5fo6Q4BqsphwX679mQH8j4djHiLkg
	 ZHTcRhELYCYEq5fDqIKmguaeTruzEUS2cICiuIm9RmDKX90g/lZbClHrngbiJXVHSvwrf
	 CnD/mdHudipWeg340YIkm9gRdCPWutcAgNe4ZD01NEB2VZ9+XZlPci/QSil6F5qHxPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=UqdiWGAu;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12804606A333
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 01:38:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12804606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=UqdiWGAu
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c4d581da0aaso206753866b.2
        for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 17:38:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1795052326; x=1795657126; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SPQlmHY4zyewM/5GeaUABznsUsxTpbSiCVxtUkYNvlo=;
        b=UqdiWGAuCoul1iCw7nr8t/payAfm5BvLnhLBgehnlDT3A9dt48vI4BUPgW13AkFnOx
         7u/575cu0jVfin+WKiF84P8XjSrr6Ni7nrIJEBGUx3wpl/tn/a0DlWH0BsWz0SCR++tD
         ThuhyJ3qMDRJQz6flh/nQ9goelfWrW2w/em7fbUf1rw6ZTfPdNDlePKdxsvNT8Y/iv41
         MgB3PNaa2xHjJl4PtuPeKWZRu/uc5IsG4zwaVrdAEdN+7oWMrTZwOheiQtCUQwCYI88M
         UZVvcyRBV5qHF51WgEMT9RT9amdi8rCBTd0qa3w3gWYutXtuDa2GlODvLI61agArrlFl
         5R3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795052326; x=1795657126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SPQlmHY4zyewM/5GeaUABznsUsxTpbSiCVxtUkYNvlo=;
        b=NMT2/m58ZbGUJqberSe1VWM3FiS4TWlmMCoesp08pWuIL5yToKnythhINYEw4oJ2+B
         WvcDDKU1DnKoneGO/p3MX2bZtBhrF4KLT0noG3r1LODdrcJb6gC8J1Sje6LoqZZniHdi
         cvggyVgBfv9AU/2PLWPyiHKZLeJfX2oDXvlrvUDtEouXM6dMA+tKevsRzbsiQVZZi8GF
         dSM+yFpUjnMGK5QiqBqv4ENXSvPeayXKPtC6qpnsNcO7RiX8+L3x4DKUVzGPyu8XUl56
         zo0oJIHrALs0YgJxDJcrFIv2JNsTY9UeYTZWuPIRItkeXuzCV8Uq/tdcI5FgFgr9sCa+
         L5bQ==
X-Forwarded-Encrypted: i=1; AL+hErF8/gGHzCP6nvSDsYnavAB21bMJSetmkmCfYmfOw8UFEdFrFUUJQr7Wqig3Ui15DjcviJ5KAyOI9IcDI6XNppA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8/4Z0BwjDMyUybhOsbmZB6ZwKqnakv0BZk+g51yWk1p7ihZzSZ
	dQOnp8hAsNOWJgjUZ/TNZI/DvKkECb/Y5KcnWHaINyRWc+ig0Q6goyacmGYMZhkQbNs=
X-Gm-Gg: AYBFou15Xl8WZ12cDy1LfgshHb0IArhy4A04ocg6hwulAONXQAndpPb9A9Z/UkUM0lF
	vtjDrTWk9EgskMX5hrpHc3dBBiH0q6FAWesxYCVJ2X7NSkeqQmvwMjbA9ITiO6sj7nxFl1Ar0yt
	sNHDaVEaDB43pkT1sHPoSJHiziIPOvDzN8opvaOXxMOfyyP5yqAUUFNJlaHyizfo0pn9bPi4WrR
	MWFLU5Z6f6H2VeZ29vSOCkRxx7I2rxeo/vK+TK1BafMEUqr58HPXGqF1qhJShCCbhJaMOUrnox6
	Oq7qvCaccTu8K+B8nOezQxpGDEVzsgHJIuIbKfV7n8UNmYT3Ng9Q5WhCuVQmZxmDnhJ3iAd/vLR
	WexCi0GqNsnZfJfjkXfa/fjuy+u/gRxmK2/GKlUo2nhfZVA116jHScaotO+8vJhxoWG56fX4sU9
	1YUSH+QKh3R5/S+lg7zDpEPeNBIV9rnH1WsCLnPbImls+lz06HyQ1IT1ik5368jTSP3Z4W/yyoA
	kpcmm4Cc2WLQtd+h7cBBzw4AyWIVcR2mTs87T9m/0RzwYj+5PHazXmjI9jwYlrD1lUq1WmavRPG
	HFP/AuNghrivQy21sMs+2l2vezt97OugLW/6+kHNny5o/Dpyz4OZgPOOEg==
X-Received: by 2002:a17:907:c13:b0:c50:8d2b:4391 with SMTP id a640c23a62f3a-c510e3919e5mr367615466b.37.1795052326486;
        Wed, 18 Nov 2026 17:38:46 -0800 (PST)
Received: from L9JK9NPFH9 ([104.28.20.56])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c51233c4080sm59785966b.16.2026.11.18.17.38.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 17:38:45 -0800 (PST)
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
	Stephen Hemminger <stephen@networkplumber.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	"Remy D. Farley" <one-d-wide@protonmail.com>,
	Amery Hung <ameryhung@gmail.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Andy Roulin <aroulin@nvidia.com>,
	Anil Kaushik <anilkaushikwireless@gmail.com>,
	Demos Ra <demosthenes.ra@gmail.com>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Hangbin Liu <hangbin.liu@linux.dev>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Jiayuan Chen <jiayuan.chen@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Joe Damato <joe@dama.to>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Li RongQing <lirongqing@baidu.com>,
	Louis Scalbert <louis.scalbert@6wind.com>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Martin Karsten <mkarsten@uwaterloo.ca>,
	Matt Bobrowski <mattbobrowski@google.com>,
	Michael Bommarito <michael.bommarito@gmail.com>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Runyu Xiao <runyu.xiao@seu.edu.cn>,
	Song Liu <song@kernel.org>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	Wang Zhan <wang.zhan@smartx.com>,
	Yonghong Song <yonghong.song@linux.dev>,
	Zhou Qiuyue <n0ps1edzz@gmail.com>,
	Tianyi Gao <tianyi.gao@linux.dev>,
	Tianyi Gao <tianyi@cloudflare.com>
Subject: [PATCH net-next v2 03/11] net: set tx_extra_headroom of the peer on XDP attach
Date: Thu, 19 Nov 2026 01:38:22 +0000
Message-ID: <20261119013830.36935-4-tianyi@cloudflare.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261119013830.36935-1-tianyi@cloudflare.com>
References: <20261119013830.36935-1-tianyi@cloudflare.com>
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

XDP needs XDP_PACKET_HEADROOM (256 bytes), but locally generated packets
only get needed_headroom. XDP on the peer of a veth or netkit device
then copies every packet. Generic XDP copies it in
netif_skb_check_for_xdp(), and native XDP on veth in
veth_convert_skb_to_xdp_buff().

While the peer has an XDP program, set tx_extra_headroom of the device
to XDP_PACKET_HEADROOM minus needed_headroom.
netdev_update_tx_extra_headroom() recalculates it when an XDP program
is attached or detached, also when an upper device such as a bond
propagates its program to the peer with netif_xdp_propagate(). It does
not recalculate it:

- for IFLA_NETKIT_HEADROOM, which cannot change after the netkit
  device is created,
- in dev_xdp_uninstall(), because veth and netkit unregister both ends
  together,
- when bridge or openvswitch change needed_headroom later.

openvswitch changes needed_headroom under ovs_mutex, without RTNL.
There are three ways to handle a later change of needed_headroom:

- Recalculate tx_extra_headroom in netdev_set_rx_headroom(). This
  races with an XDP attach or detach under RTNL. The last write can
  leave tx_extra_headroom at 0 while XDP is attached.
- Do not subtract needed_headroom. This always reserves needed_headroom
  bytes more than XDP needs.
- Subtract needed_headroom only when tx_extra_headroom is recalculated.

This patch uses the last one, because it does not race and reserves
only what XDP needs. If needed_headroom shrinks later, XDP on the peer
copies packets again until the next recalculation.

tx_extra_headroom is used rather than needed_headroom, because raising
needed_headroom can regress the performance of other paths.

Signed-off-by: Tianyi Gao <tianyi@cloudflare.com>
---
For native XDP on veth, this patch removes one of two copy
conditions, the missing headroom. The other condition is a head that is
not a page fragment. A follow-up veth series will fix that.

v2:
- New patch, replaces IFLA_TX_EXTRA_HEADROOM for XDP on the peer
  (Stephen).
---
 Documentation/networking/netdevices.rst | 11 +++++++
 include/linux/netdevice.h               |  1 +
 net/core/dev.c                          | 38 +++++++++++++++++++++++++
 3 files changed, 50 insertions(+)

diff --git a/Documentation/networking/netdevices.rst b/Documentation/networking/netdevices.rst
index f593b242da9c..53ca8439f73b 100644
--- a/Documentation/networking/netdevices.rst
+++ b/Documentation/networking/netdevices.rst
@@ -454,6 +454,17 @@ devices do not inherit it. It is not part of ``LL_RESERVED_SPACE()``, so a
 packet that reaches the device with less headroom, such as a forwarded
 packet, is not reallocated because of it.
 
+The kernel sets ``tx_extra_headroom`` of a device to the sum of these
+values:
+
+* ``XDP_PACKET_HEADROOM`` (256 bytes) minus ``needed_headroom``, when the
+  peer of a veth or netkit device has an XDP program
+
+When the peer has an XDP program, locally generated UDP, raw and
+AF_PACKET packets and AF_XDP packets in copy mode have enough headroom
+for it. ``tx_extra_headroom`` is not recalculated when a bridge or
+openvswitch changes ``needed_headroom`` later.
+
 NETDEV_INTERNAL symbol namespace
 ================================
 
diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index 392e6fc81e34..786b63f21d4f 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -4484,6 +4484,7 @@ int netif_xdp_propagate(struct net_device *dev, struct netdev_bpf *bpf);
 int dev_xdp_propagate(struct net_device *dev, struct netdev_bpf *bpf);
 u8 dev_xdp_sb_prog_count(struct net_device *dev);
 u32 dev_xdp_prog_id(struct net_device *dev, enum bpf_xdp_mode mode);
+void netdev_update_tx_extra_headroom(struct net_device *dev);
 
 u32 dev_get_min_mp_channel_count(const struct net_device *dev);
 
diff --git a/net/core/dev.c b/net/core/dev.c
index 85b7c61015c7..6e053f612d72 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -10666,6 +10666,7 @@ int netif_xdp_propagate(struct net_device *dev, struct netdev_bpf *bpf)
 	if (old_prog)
 		bpf_prog_put(old_prog);
 
+	netdev_update_tx_extra_headroom(dev);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(netif_xdp_propagate);
@@ -10677,6 +10678,41 @@ u32 dev_xdp_prog_id(struct net_device *dev, enum bpf_xdp_mode mode)
 	return prog ? prog->aux->id : 0;
 }
 
+static void __netdev_update_tx_extra_headroom(struct net_device *dev,
+					      struct net_device *peer)
+{
+	unsigned int needed_headroom = READ_ONCE(dev->needed_headroom);
+	unsigned int tx_extra_headroom = 0;
+
+	if (peer && dev_xdp_prog_count(peer) &&
+	    needed_headroom < XDP_PACKET_HEADROOM)
+		tx_extra_headroom = XDP_PACKET_HEADROOM - needed_headroom;
+
+	WRITE_ONCE(dev->tx_extra_headroom, tx_extra_headroom);
+}
+
+/**
+ *	netdev_update_tx_extra_headroom - recalculate tx_extra_headroom
+ *	@dev: the device to check
+ *
+ *	Recalculate tx_extra_headroom of @dev and its peer. Should be called
+ *	after conditions that influence tx_extra_headroom might have changed.
+ *	The caller must hold the RTNL lock.
+ */
+void netdev_update_tx_extra_headroom(struct net_device *dev)
+{
+	struct net_device *peer = NULL;
+
+	rcu_read_lock();
+	if (dev->netdev_ops->ndo_get_peer_dev)
+		peer = dev->netdev_ops->ndo_get_peer_dev(dev);
+	__netdev_update_tx_extra_headroom(dev, peer);
+	if (peer)
+		__netdev_update_tx_extra_headroom(peer, dev);
+	rcu_read_unlock();
+}
+EXPORT_SYMBOL_GPL(netdev_update_tx_extra_headroom);
+
 static int dev_xdp_install(struct net_device *dev, enum bpf_xdp_mode mode,
 			   bpf_op_t bpf_op, struct netlink_ext_ack *extack,
 			   u32 flags, struct bpf_prog *prog)
@@ -10887,6 +10923,7 @@ static int dev_xdp_attach(struct net_device *dev, struct netlink_ext_ack *extack
 	if (cur_prog)
 		bpf_prog_put(cur_prog);
 
+	netdev_update_tx_extra_headroom(dev);
 	return 0;
 }
 
@@ -10913,6 +10950,7 @@ static int dev_xdp_detach_link(struct net_device *dev,
 	bpf_op = dev_xdp_bpf_op(dev, mode);
 	WARN_ON(dev_xdp_install(dev, mode, bpf_op, NULL, 0, NULL));
 	dev_xdp_set_link(dev, mode, NULL);
+	netdev_update_tx_extra_headroom(dev);
 	return 0;
 }
 
-- 
2.56.0

