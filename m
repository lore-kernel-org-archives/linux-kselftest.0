Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795543173;
	b=nm6YRO6bd60U5Bum5P99bEGRIiUooIH7AiiB+VIdIrnEb9QtVKbmDTcW5Dd2jyyaIcsL
	 H2sI1FjwwkoRE+CvTyiHh/btZ00VZYV+7a3uwFQXJ48MRtDKRKw199DSmBItqCFUj2i0u
	 g7LV+p5N55ZVrANRGBDp1S38Sqg4KUf+3IWcBAN5B+6QVVk8Imar+H47pevWM2nL3d9T5
	 7eHPcP/UYk89xQkUdVMPI5uytrtV6jU+GgZe1QK0N0bGi771QiDTO++tpBx9JxWjvWMsr
	 7/jlZ/yAnE0K7Nj9ogWwRyY82X1IJQMbkbR78xyW03/s44arDnDCRvXqI56JGE6h3Jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795543173;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VstwBcVMyFIpXX/g8y4uvl7osWjH+5lZKKsPgtW24Oc=;
	b=CeWwDAHvjkeIGncA0c1bytmGUwdIzCSELuIwfOLmQMKNt1M936xY956Pn3udxlAFdHsV
	 ZyaG8nd730mxR2DPnSEvDs/r5w6xruy1Bd1TBWECypDwsS9gDRtluvVYZeDImct1IUaqi
	 gMBO26kRDDkxvqUk0N9gRxnphhJ5iHS6WRSENnvNAxAlOOWT3AGPdMx3d0uxrrbQ+Ok3k
	 rEX9dBtRuWEJBbVbaz1cVqTVsTBwWud6lHdL74or4Gzm5sorKsktsMouUpA1Z95y4CvdI
	 BDTs3IoX7Nx22g2XddOKO52Faqge2Muc/NMmndJ737Rn4QxPY8apBbva1GtFmyors3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=Jrr002Km;
	arc=none smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92209606A31E
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 17:59:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92209606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=Jrr002Km
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6ae305e3bd9so8217470a12.0
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 09:59:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1795543171; x=1796147971; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VstwBcVMyFIpXX/g8y4uvl7osWjH+5lZKKsPgtW24Oc=;
        b=Jrr002KmZMdjmj84UDe2P0H7GbLpNHFvoTA1wnEQ7c9pgiAZ1SZ0l3cbfYhBCB7LJ3
         fplxaTNGi73FiLhUHANqUifOA+wK/1+BfHxDb70iH3tqlY568hSPfTpSHaosctnTYZSj
         oNKaulN4KG2nyP9MIVLBzomPgdG+DwroARfjl7szX1wNIi8+s6vSA+HGUdnMZmjQ+YtY
         1ZliiDyJJoHHxCQ8a5DnytA2Nx40aBdXtlpvai9K2CH103KNbQhCPL8R3wnA06tPTh2h
         e++7Mo8NH2rgA6uG69VEmdjXOYB6/pnwGnvAQQkTr/dmKMwKqHJ6FwIu+TNUTutQgO4p
         xLyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795543171; x=1796147971;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VstwBcVMyFIpXX/g8y4uvl7osWjH+5lZKKsPgtW24Oc=;
        b=1Gk0v5qyTRjQlYw0kyKxysTTyKh1zmReOyG7Q3ExS7fdQOcHQvoWa2vjviU/tiZHVF
         bTL5dNLdL8hPIf+Xu1mQscG73Gdh8pYs8wHNA2K/OqzJUmJTlbh+Dz1vHe2T0An/d/Pd
         rbBwf7Hjr0dWMAJbn3+ltlxl2BbTmoYVbBqbaijQDZJ3+YXGRF6i5UfSWkzGMDioaH1l
         yiLSdvRsKcCq7n28WpRXOKT5ZatdcXqJjGvEy3uajhV4MeplsPxhNELV9NzJPxBdlrTe
         oiqmVcKoU5rBlfq0a07FE7xri1tYSbidn0Gx+cNaVb5BSxGAGP2x6JcKnRYJy3OjBIcR
         4Dlw==
X-Forwarded-Encrypted: i=1; AL+hErEBa0fbjoOI+3KiNxxutz8Cywi+dCgE/8SwRe9oYt5pkorh8EmNBcqbdxoGd3KNW1BFC+QMSefop/QgKgYpXc4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Acnb39P8dKUdh6jOR/3hpAe2y/oErIGCk9kqP+reXFTjVPBAV
	XFauWt7yg6YLsJfbYmPe9ITxx5XzgSb9VBoLHy/FsLJb+tqOe9+14fHTeU0jiDhyvDg=
X-Gm-Gg: AZFdTZe68DUXM4zfYEba7Ntzs3f31wDRoD8KH2aohJKuw8LCp6poXmz5xXzPZ8Xrg2M
	5ppY1jf19wVjYCraiUhRVnbsdS2LUJfRJJyRJhu859gS5JamCrPAVW3w/2YTv60lYXcdkyg/NJ2
	WTW5zL9ZmeGuoge/VlKUdOWuKL3P+8X4hvO3Ubq8Xjq9vCdXKUz1ab6tPJXZH3E6ciiUyXBGw49
	yLqMRLJMKYeCxQxsvU4MLdeEVuNGhQpI+u84CAQvbNIUaDFKiiLhVnsyxYTLIYI/UP00rupWKZk
	NvExU0JFW59L5PTw6kvc1LUCRr2gmnOcC1IM+WF6ATf/qR4Nk28qJ3ZoPmFQw+JjSf+g/amiTwb
	OnQcRkE0siJVo3EFEG5DTnQDEYlbOEHoC8CpxFbJJFTbTI351j0mSKWhOGK6sal5+NsjT+4UBYo
	tayjX6ArCrVWHSqSIxkaTBIaC6xUOoDGQjWZ4g7jio/jB+Uo4zXEj8TqrXYReNWzJm2aI5AauxM
	2Mt5My2US/MA0b9FuIRVyv1+TmgqpiU9e/npPlLm3s6MpqHTF/DQ5lMjv/0S2eCNDW8bITJnRzN
	VRwk9i8udqnJafsmIhIs6PXEvhb8sTrMNrX5forShi67jA0=
X-Received: by 2002:a05:6402:15c3:b0:6b5:9133:309f with SMTP id 4fb4d7f45d1cf-6ba37c7a619mr8952583a12.2.1795543170978;
        Tue, 24 Nov 2026 09:59:30 -0800 (PST)
Received: from L9JK9NPFH9 ([2a09:bac6:37ad:1e5a::306:5])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba3711ad52sm7205762a12.35.2026.11.24.09.59.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 24 Nov 2026 09:59:29 -0800 (PST)
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
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Jeff Layton <jlayton@kernel.org>,
	Tianyi Gao <tianyi.gao@linux.dev>,
	Tianyi Gao <tianyi@cloudflare.com>
Subject: [PATCH net-next v3 09/11] veth: add VETH_INFO_TX_EXTRA_HEADROOM
Date: Tue, 24 Nov 2026 17:58:22 +0000
Message-ID: <20261124175824.60470-10-tianyi@cloudflare.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261124175824.60470-1-tianyi@cloudflare.com>
References: <20261124175824.60470-1-tianyi@cloudflare.com>
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

Packets that a namespace sends through a veth pair can be encapsulated
on another device, for example by a program at TC egress of the host
uplink. The veth device cannot see this, so the packets are reallocated
on the uplink.

Add VETH_INFO_TX_EXTRA_HEADROOM, so that the CNI plugin can set the
headroom for both devices when it creates the pair. It cannot be changed
later, like IFLA_NETKIT_HEADROOM.

Store the value in struct veth_priv, and add ndo_get_tx_extra_headroom
so that the core reads it whenever it recalculates tx_extra_headroom.
The value cannot be written to tx_extra_headroom itself, because the
core recalculates tx_extra_headroom from scratch when XDP on the peer
or a program at tcx egress is attached or detached. A new field in
struct net_device would also work, but it would grow struct net_device.

IFLA_NETKIT_HEADROOM, added by commit b9ed315d3c4c ("netkit: Allow for
configuring needed_{head,tail}room"), is similar but differs in two
ways:

- it is the total headroom of the device and sets needed_headroom;
- it is a u16. The new attribute is a uint, as commit 374d345d9b5e
  ("netlink: add variable-length / auto integers") recommends.

Signed-off-by: Tianyi Gao <tianyi@cloudflare.com>
---
The iproute2 patch for VETH_INFO_TX_EXTRA_HEADROOM will be posted after
this series is accepted.

v2:
- New patch, replaces IFLA_TX_EXTRA_HEADROOM for headers pushed on
  another device (Willem, Stephen).
---
 Documentation/networking/netdevices.rst |  5 +++
 drivers/net/veth.c                      | 44 +++++++++++++++++++++++++
 include/linux/netdevice.h               |  5 +++
 include/uapi/linux/veth.h               |  1 +
 net/core/dev.c                          |  3 ++
 5 files changed, 58 insertions(+)

diff --git a/Documentation/networking/netdevices.rst b/Documentation/networking/netdevices.rst
index 280ad3bf5559..a427e445ba35 100644
--- a/Documentation/networking/netdevices.rst
+++ b/Documentation/networking/netdevices.rst
@@ -464,6 +464,7 @@ values:
 * ``XDP_PACKET_HEADROOM`` (256 bytes) minus ``needed_headroom``, when the
   peer of a veth or netkit device has an XDP program
 * the headroom that the programs at tcx egress of the device declare
+* ``VETH_INFO_TX_EXTRA_HEADROOM`` of a veth device
 
 The kernel updates ``tx_extra_headroom`` when an XDP program is attached
 to or detached from the peer, to reserve the headroom that XDP needs.
@@ -485,6 +486,10 @@ tail call targets, freplace programs and programs at tcx ingress are
 ignored. Loading a program whose tag is above 512 or does not parse fails
 with ``-EINVAL``. Loading a program with two tags fails with ``-EEXIST``.
 
+``VETH_INFO_TX_EXTRA_HEADROOM`` is for headers that are pushed on another
+device, for example at TC egress of the uplink. It is set for both
+devices of a veth pair when the pair is created.
+
 NETDEV_INTERNAL symbol namespace
 ================================
 
diff --git a/drivers/net/veth.c b/drivers/net/veth.c
index 2051f6e04432..973040c371dc 100644
--- a/drivers/net/veth.c
+++ b/drivers/net/veth.c
@@ -77,6 +77,7 @@ struct veth_priv {
 	struct bpf_prog		*_xdp_prog;
 	struct veth_rq		*rq;
 	unsigned int		requested_headroom;
+	unsigned int		tx_extra_headroom;
 	netdevice_tracker	peer_tracker;
 };
 
@@ -1548,6 +1549,13 @@ static void veth_set_rx_headroom(struct net_device *dev, int new_hr)
 	rcu_read_unlock();
 }
 
+static unsigned int veth_get_tx_extra_headroom(const struct net_device *dev)
+{
+	const struct veth_priv *priv = netdev_priv(dev);
+
+	return priv->tx_extra_headroom;
+}
+
 static int veth_xdp_set(struct net_device *dev, struct bpf_prog *prog,
 			struct netlink_ext_ack *extack)
 {
@@ -1699,6 +1707,7 @@ static const struct net_device_ops veth_netdev_ops = {
 	.ndo_set_features	= veth_set_features,
 	.ndo_features_check	= passthru_features_check,
 	.ndo_set_rx_headroom	= veth_set_rx_headroom,
+	.ndo_get_tx_extra_headroom = veth_get_tx_extra_headroom,
 	.ndo_bpf		= veth_xdp,
 	.ndo_xdp_xmit		= veth_ndo_xdp_xmit,
 	.ndo_get_peer_dev	= veth_peer_dev,
@@ -1800,6 +1809,7 @@ static int veth_newlink(struct net_device *dev,
 	struct net *peer_net = rtnl_newlink_peer_net(params);
 	struct nlattr **data = params->data;
 	struct nlattr **tb = params->tb;
+	unsigned int tx_extra_headroom = 0;
 	int err;
 	struct net_device *peer;
 	struct veth_priv *priv;
@@ -1822,6 +1832,10 @@ static int veth_newlink(struct net_device *dev,
 		tbp = tb;
 	}
 
+	if (data && data[VETH_INFO_TX_EXTRA_HEADROOM])
+		tx_extra_headroom =
+			nla_get_uint(data[VETH_INFO_TX_EXTRA_HEADROOM]);
+
 	if (ifmp && tbp[IFLA_IFNAME]) {
 		nla_strscpy(ifname, tbp[IFLA_IFNAME], IFNAMSIZ);
 		name_assign_type = NET_NAME_USER;
@@ -1843,6 +1857,9 @@ static int veth_newlink(struct net_device *dev,
 
 	netif_inherit_tso_max(peer, dev);
 
+	priv = netdev_priv(peer);
+	priv->tx_extra_headroom = tx_extra_headroom;
+
 	err = veth_init_queues(peer, tbp);
 	if (err)
 		goto err_register_peer;
@@ -1876,6 +1893,9 @@ static int veth_newlink(struct net_device *dev,
 	else
 		snprintf(dev->name, IFNAMSIZ, DRV_NAME "%%d");
 
+	priv = netdev_priv(dev);
+	priv->tx_extra_headroom = tx_extra_headroom;
+
 	err = veth_init_queues(dev, tb);
 	if (err)
 		goto err_register_dev;
@@ -1898,6 +1918,8 @@ static int veth_newlink(struct net_device *dev,
 	rcu_assign_pointer(priv->peer, dev);
 	netdev_hold(dev, &priv->peer_tracker, GFP_KERNEL);
 
+	netdev_update_tx_extra_headroom(dev);
+
 	veth_disable_gro(dev);
 	/* update XDP supported features */
 	veth_set_xdp_features(dev);
@@ -1940,9 +1962,29 @@ static void veth_dellink(struct net_device *dev, struct list_head *head)
 }
 
 static const struct nla_policy veth_policy[VETH_INFO_MAX + 1] = {
+	[VETH_INFO_UNSPEC]	= { .strict_start_type =
+				  VETH_INFO_TX_EXTRA_HEADROOM },
 	[VETH_INFO_PEER]	= { .len = sizeof(struct ifinfomsg) },
+	[VETH_INFO_TX_EXTRA_HEADROOM] =
+		NLA_POLICY_MAX(NLA_UINT, NETDEV_TX_EXTRA_HEADROOM_MAX),
 };
 
+static size_t veth_get_size(const struct net_device *dev)
+{
+	return nla_total_size(sizeof(u64)); /* VETH_INFO_TX_EXTRA_HEADROOM */
+}
+
+static int veth_fill_info(struct sk_buff *skb, const struct net_device *dev)
+{
+	const struct veth_priv *priv = netdev_priv(dev);
+
+	if (nla_put_uint(skb, VETH_INFO_TX_EXTRA_HEADROOM,
+			 priv->tx_extra_headroom))
+		return -EMSGSIZE;
+
+	return 0;
+}
+
 static struct net *veth_get_link_net(const struct net_device *dev)
 {
 	struct veth_priv *priv = netdev_priv(dev);
@@ -1971,6 +2013,8 @@ static struct rtnl_link_ops veth_link_ops = {
 	.policy		= veth_policy,
 	.peer_type	= VETH_INFO_PEER,
 	.maxtype	= VETH_INFO_MAX,
+	.get_size	= veth_get_size,
+	.fill_info	= veth_fill_info,
 	.get_link_net	= veth_get_link_net,
 	.get_num_tx_queues	= veth_get_num_queues,
 	.get_num_rx_queues	= veth_get_num_queues,
diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index 2486b0d10474..94acbf3ea581 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -1416,6 +1416,9 @@ struct netdev_net_notifier {
  *	appropriate rx headroom value allows avoiding skb head copy on
  *	forward. Setting a negative value resets the rx headroom to the
  *	default value.
+ * unsigned int (*ndo_get_tx_extra_headroom)(const struct net_device *dev);
+ *	Return the headroom that the device adds to tx_extra_headroom.
+ *	The caller must hold RTNL and be under RCU read context.
  * int (*ndo_bpf)(struct net_device *dev, struct netdev_bpf *bpf);
  *	This function is used to set or query state related to XDP on the
  *	netdevice and manage BPF offload. See definition of
@@ -1688,6 +1691,8 @@ struct net_device_ops {
 						       struct sk_buff *skb);
 	void			(*ndo_set_rx_headroom)(struct net_device *dev,
 						       int needed_headroom);
+	unsigned int		(*ndo_get_tx_extra_headroom)(
+					const struct net_device *dev);
 	int			(*ndo_bpf)(struct net_device *dev,
 					   struct netdev_bpf *bpf);
 	int			(*ndo_xdp_xmit)(struct net_device *dev, int n,
diff --git a/include/uapi/linux/veth.h b/include/uapi/linux/veth.h
index 52b58e587e23..04cb408e5b3a 100644
--- a/include/uapi/linux/veth.h
+++ b/include/uapi/linux/veth.h
@@ -5,6 +5,7 @@
 enum {
 	VETH_INFO_UNSPEC,
 	VETH_INFO_PEER,
+	VETH_INFO_TX_EXTRA_HEADROOM,
 
 	__VETH_INFO_MAX
 #define VETH_INFO_MAX	(__VETH_INFO_MAX - 1)
diff --git a/net/core/dev.c b/net/core/dev.c
index dd34daf5f3b4..76007f788bdf 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -10693,6 +10693,9 @@ static void __netdev_update_tx_extra_headroom(struct net_device *dev,
 	    needed_headroom < XDP_PACKET_HEADROOM)
 		tx_extra_headroom = XDP_PACKET_HEADROOM - needed_headroom;
 	tx_extra_headroom += tcx_tx_extra_headroom(dev);
+	if (dev->netdev_ops->ndo_get_tx_extra_headroom)
+		tx_extra_headroom +=
+			dev->netdev_ops->ndo_get_tx_extra_headroom(dev);
 
 	WRITE_ONCE(dev->tx_extra_headroom,
 		   min(tx_extra_headroom, NETDEV_TX_EXTRA_HEADROOM_MAX));
-- 
2.56.0

