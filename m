Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795543121;
	b=DVf7FlRaoOBSXvwefiBp1fLVUji2eLTMdWZf64ijZHWOZVXTFd1bSnnlmCpo/u6Ei7pq
	 n74O1uvipNX58VIwc0vbtGHXjaQxZ9cFOjA0+ZY5OFkhWQHRcjk63sTofli3G85vy4Rws
	 SuXqgKgiOvydazOLzhWiOiLuVTwl/tFFuNBnZeOOHpk5La69MXkoZrOR/pnyetT+RJ2BN
	 IWq736WltSdCX21AD7DHWgy25zGf7+CsKvqozwMwaaAW21zJ0QdP8jNR4APuuIvPK9LpD
	 0qGcVjLpt59l9B/aDEbOPxbkU4pubAyl4nb7yMvapiwrsIHKwWtWRSTsjgFxnM+yL0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795543121;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uYFhxYXaLHyvLA2HFvOhHxAG9OdPY0r3MXoDmLfLilE=;
	b=OrhKRzmcX7wFfvRky/H0IbkXoQuwx+jRgar3Q7spzBwNV7/CokcPd5FkiWP8Y5N1AR50
	 FHvfgxuM1AvJcO/FF560OAifdIC8j31dxQUmxpb3ZchiJ/uYBN5AtggF9XBDmbVAroOk7
	 CdZmXqH88zKS63dzgpig4O1e+WT9hxqF1318KQrWyca0Q/5zx0DcJwoD4GlpuPpPWKyzn
	 eKs7Z836Y0tE3ZKgpNts9SqRK8oPqgNutM4tkuddpBmScDGXnhtBramxXF8AulOivCMtM
	 Mw6xpzHyYfQZwfhQORxwajFC6tcZ743L+KU5+oI1W5QDQon8gPj9K+y4ZtpzIsj2omQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=ekZojnqu;
	arc=none smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 334A2606A326
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 17:58:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 334A2606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=ekZojnqu
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b87a240de3so6028270a12.1
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 09:58:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1795543119; x=1796147919; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uYFhxYXaLHyvLA2HFvOhHxAG9OdPY0r3MXoDmLfLilE=;
        b=ekZojnquVemWEnOB4xWHkpW586odso2c5pilToX3EAaQFDA8PN8YM76c61cI7KHYaW
         XsRTbHfUe8vbWyVe4BT1mRwl39IhvZZf4HzcqPrQYm+kA0AfuxX3/lxSrPaKX4ywe2CK
         yzlcXWJVMwy8db7FvIuz8pKrRiUJXaON2wuyNjjNRQMh6bbR1EX6NAmu7T3rNpG/oJyE
         +FACvdEsYpCX2y3EZY6AhPFO3eODeInku+0M5XtASRhO0PvwvQjV/J0NKrV7kCf6FKrC
         Cp9WU+Z6P3r1651hNwzRMDzVadgg9NE//3xIcUtapvWm96kTK5xt+gvPYCIk/UyG1XeQ
         MssA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795543119; x=1796147919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uYFhxYXaLHyvLA2HFvOhHxAG9OdPY0r3MXoDmLfLilE=;
        b=xJhfAG7ebPSH3b2lbetcOpeN6WAhwfs0gPydMHrIcePCFVjsJrpRTp6V0p/oESgM9A
         UD+m7O25t2QPSpAffRM9aWrf+ar9BvYj4gjaxfHX2AVWcWwepvKJ4FAKU+z3qMnmX7vm
         n+MaVrN2Vxdw9N74gIUdb4AQN19tBj/b0IJ9RwcuBwFY8/6E8Bv6//NprMBsj3sDBaY8
         5lwFhd7hif3MYTZ0Y47SWTo9z7HDfvBaqyF9qHsTuXTnaM0u64a0XFLVhwtiJjdyZHqo
         630NylN4jADgK8feBCNMZONKX9YnRTeBBDEG1Nh2C3c+qZo26G7rGyNSIVPM9iBCD/uu
         eebw==
X-Forwarded-Encrypted: i=1; AL+hErH6cp22lwJxIXe8VBxvxHf72Vc8H7vgu9VrKNY68Yo48oO5d1lIAakQ5NV9USJGMG7qWhPkf8byHT9IblPsujA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9oNLzKNLG7tlD9hFRdRcXyD5UKr9o1R8TjnQCShBp9LsII7sx8
	JtawQg5UwaVOubYfGK9KT3veHu8VGInvkUiA4ucjtqr9cseFlOJe9bb3lRrqjQk8gxs=
X-Gm-Gg: AZFdTZfZ1L2ElUURXNMdqcRBvkZ1TpV2VLYdkGhjbyqRB4Ry91JrUnu9L6Z0g3iXQbr
	rzKQhxjc8Q00SOFdM3VWRUsAcAh9zk12Fsru17sRszHQyV22mjfOREZsdjaCRT9IBUq5gk2OWb6
	mMKQ/WBKZh4AjlQxMTiFOaEfreg2USaFnS0bCZ55ykf9hiL2Z0EFGVhUIvFHvBnX3MtLOuaMP18
	dCbLRxw2WyV8N8jPGJBzMiglMpJ0COHvSP2lK0fvrw2u3cojoCJV6WFb+YN3LjMqwFfuuIh/1qx
	96O/Wf3QTSpZ2xWSGktXltDXBupQUDhtJGcFa+L9/Gzvp3udIMwnlenyl4/nsy9Gd8VJZepdL2U
	y+mjCRsO8Y/6QtlLb+ZK69qEgr8RNhS4/mmDJwq7JKjl33GIV/uJQUQtdY6Jl6tGFNVuoTyA+f9
	VsO5vkedvJvYzA9KDRU7CBTGydD4cUiAg7SvbVfkLEQn8JVgHWdLD0gQS+snV36HyHXsAloltfI
	sX5R5wEpxn1u/Eo1GEYsjjQosB9kFYu2SDAnGoYr3W++JXbmIzh8kDVPSHjU96chgSi3UKe5jiE
	PNVxMkT7b63v3ldxNNLSVWlJ9goBWJxuCSeDHKPzYpXYBPY=
X-Received: by 2002:aa7:c710:0:b0:6b8:e848:d004 with SMTP id 4fb4d7f45d1cf-6ba37e8dec5mr8356702a12.29.1795543119473;
        Tue, 24 Nov 2026 09:58:39 -0800 (PST)
Received: from L9JK9NPFH9 ([2a09:bac6:37ad:1e5a::306:5])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba3711ad52sm7205762a12.35.2026.11.24.09.58.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 24 Nov 2026 09:58:38 -0800 (PST)
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
Subject: [PATCH net-next v3 01/11] net: add tx_extra_headroom and netdev_get_alloc_headroom()
Date: Tue, 24 Nov 2026 17:58:14 +0000
Message-ID: <20261124175824.60470-2-tianyi@cloudflare.com>
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

From: David Keogh <dkeogh@amazon.com>

Programs attached at TC egress commonly push additional headers onto a
packet, for example to encapsulate it. When the packet does not carry
enough headroom the BPF helpers reallocate the head, which costs an
allocation and a copy per packet.

Locally generated UDP, raw and AF_PACKET traffic is allocated with
exactly LL_RESERVED_SPACE() of headroom, which only covers the
link-layer header and the driver's needed_headroom.

Add a tx_extra_headroom field to struct net_device for that purpose,
together with netdev_get_alloc_headroom() and
netdev_get_alloc_headroom_hlen(). These add the extra reservation to the
header length before the HH_DATA_MOD alignment, so the alignment of the
link-layer header does not change. netdev_get_alloc_needed_headroom()
returns needed_headroom plus the extra reservation, for callers that do
their own alignment.

The new functions are intended only for sites that allocate new packets.
LL_RESERVED_SPACE() keeps its current meaning and remains the threshold
used when checking whether an existing packet must be expanded, so the
extra reservation never forces a reallocation on its own: packets that
already have enough room for the headers being pushed, such as TCP
segments built with MAX_TCP_HEADER, are left alone.

Keep the extra reservation separate from needed_headroom so that driver
updates of their own requirement do not clobber it. Place the field in
the padding that follows needed_headroom, which keeps it in the TX
read-mostly cacheline group.

The field is not set anywhere yet. Later patches set it from XDP on a
veth peer, from TC egress programs and from a veth attribute.

Also remove LL_RESERVED_SPACE_EXTRA(). It has had no user since
commit 6d5431555de0 ("caif: remove CAIF NETWORK LAYER"). It could add
the extra headroom, but it reads dev->hard_header_len itself. AF_PACKET
must use the value that it read once, see commit 03390aa32e66 ("packet:
use consistent hard_header_len in non-ring send paths").
netdev_get_alloc_headroom_hlen() takes the header length as an argument
instead.

Signed-off-by: David Keogh <dkeogh@amazon.com>
Co-developed-by: Tianyi Gao <tianyi@cloudflare.com>
Signed-off-by: Tianyi Gao <tianyi@cloudflare.com>
---
v2:
- Turn LL_ALLOC_SPACE() and LL_ALLOC_SPACE_EX() into the static inline
  functions netdev_get_alloc_headroom() and
  netdev_get_alloc_headroom_hlen(), and rename
  netdev_tx_alloc_headroom() to netdev_get_alloc_needed_headroom()
  (Willem).
- Move the netdevices.rst section here from v1 3/8, without the IFLA
  part.
---
 .../networking/net_cachelines/net_device.rst  |  1 +
 Documentation/networking/netdevices.rst       | 13 +++++++
 include/linux/netdevice.h                     | 34 +++++++++++++++++--
 net/core/dev.c                                |  1 +
 4 files changed, 46 insertions(+), 3 deletions(-)

diff --git a/Documentation/networking/net_cachelines/net_device.rst b/Documentation/networking/net_cachelines/net_device.rst
index 7620d3fcb8dc..4341e9e443ba 100644
--- a/Documentation/networking/net_cachelines/net_device.rst
+++ b/Documentation/networking/net_cachelines/net_device.rst
@@ -35,6 +35,7 @@ unsigned_short                      gflags
 unsigned_short                      hard_header_len             read_mostly         read_mostly         ip6_xmit(tx);gro_list_prepare(rx)
 unsigned_int                        mtu                         read_mostly                             ip_finish_output2
 unsigned_short                      needed_headroom             read_mostly                             LL_RESERVED_SPACE/ip_finish_output2
+unsigned_short                      tx_extra_headroom           read_mostly                             netdev_get_alloc_headroom/__ip_append_data
 unsigned_short                      needed_tailroom
 netdev_features_t                   features                    read_mostly         read_mostly         HARD_TX_LOCK,netif_skb_features,sk_setup_caps(tx);netif_elide_gro(rx)
 netdev_features_t                   hw_features
diff --git a/Documentation/networking/netdevices.rst b/Documentation/networking/netdevices.rst
index 6a87f09e7015..f593b242da9c 100644
--- a/Documentation/networking/netdevices.rst
+++ b/Documentation/networking/netdevices.rst
@@ -441,6 +441,19 @@ from a notifier.
 
 Drivers **must not** generate nested notifications of the ops-locked types.
 
+TX headroom reservation
+=======================
+
+``tx_extra_headroom`` is extra headroom for locally generated packets. The
+stack adds it when it allocates such a packet for the device, so that
+headers pushed later, for example at TC egress, fit without a
+reallocation. It is at most 512 bytes.
+
+Unlike ``needed_headroom``, it is not a driver requirement and stacked
+devices do not inherit it. It is not part of ``LL_RESERVED_SPACE()``, so a
+packet that reaches the device with less headroom, such as a forwarded
+packet, is not reallocated because of it.
+
 NETDEV_INTERNAL symbol namespace
 ================================
 
diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index 694b6d29f680..c55a1cf42498 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -311,9 +311,6 @@ struct hh_cache {
 	  & ~(HH_DATA_MOD - 1)) + HH_DATA_MOD)
 #define LL_RESERVED_SPACE(dev) \
 	LL_RESERVED_SPACE_EX(dev, (dev)->hard_header_len)
-#define LL_RESERVED_SPACE_EXTRA(dev,extra) \
-	((((dev)->hard_header_len + READ_ONCE((dev)->needed_headroom) + (extra)) \
-	  & ~(HH_DATA_MOD - 1)) + HH_DATA_MOD)
 
 struct header_ops {
 	int	(*create) (struct sk_buff *skb, struct net_device *dev,
@@ -1934,6 +1931,8 @@ enum netdev_reg_state {
  *
  *	@needed_headroom: Extra headroom the hardware may need, but not in all
  *			  cases can this be guaranteed
+ *	@tx_extra_headroom: Extra headroom for locally generated packets, for
+ *			    headers pushed after the allocation
  *	@needed_tailroom: Extra tailroom the hardware may need, but not in all
  *			  cases can this be guaranteed. Some cases also use
  *			  LL_MAX_HEADER instead to allocate the skb
@@ -2196,6 +2195,8 @@ struct net_device {
 	 */
 	unsigned int		mtu;
 	unsigned short		needed_headroom;
+#define NETDEV_TX_EXTRA_HEADROOM_MAX	512
+	unsigned short		tx_extra_headroom;
 	struct netdev_tc_txq	tc_to_txq[TC_MAX_QUEUE];
 #ifdef CONFIG_XPS
 	struct xps_dev_maps __rcu *xps_maps[XPS_MAPS_MAX];
@@ -2778,6 +2779,33 @@ struct netdev_queue *netdev_core_pick_tx(struct net_device *dev,
 					 struct sk_buff *skb,
 					 struct net_device *sb_dev);
 
+/* Headroom to reserve when allocating a locally generated packet for dev.
+ * Code that checks the headroom of an existing packet keeps using
+ * LL_RESERVED_SPACE(), so tx_extra_headroom never forces a reallocation.
+ */
+static inline unsigned int
+netdev_get_alloc_headroom_hlen(const struct net_device *dev, unsigned int hlen)
+{
+	return LL_RESERVED_SPACE_EX(dev,
+				    hlen + READ_ONCE(dev->tx_extra_headroom));
+}
+
+static inline unsigned int
+netdev_get_alloc_headroom(const struct net_device *dev)
+{
+	return netdev_get_alloc_headroom_hlen(dev, dev->hard_header_len);
+}
+
+/* Same as netdev_get_alloc_headroom() without hard_header_len and alignment,
+ * for callers that size the headroom themselves.
+ */
+static inline unsigned int
+netdev_get_alloc_needed_headroom(const struct net_device *dev)
+{
+	return READ_ONCE(dev->needed_headroom) +
+	       READ_ONCE(dev->tx_extra_headroom);
+}
+
 /* returns the headroom that the master device needs to take in account
  * when forwarding to this dev
  */
diff --git a/net/core/dev.c b/net/core/dev.c
index a44b314f387b..4fedd5765867 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -13697,6 +13697,7 @@ static void __init net_dev_struct_check(void)
 	CACHELINE_ASSERT_GROUP_MEMBER(struct net_device, net_device_read_tx, num_tc);
 	CACHELINE_ASSERT_GROUP_MEMBER(struct net_device, net_device_read_tx, mtu);
 	CACHELINE_ASSERT_GROUP_MEMBER(struct net_device, net_device_read_tx, needed_headroom);
+	CACHELINE_ASSERT_GROUP_MEMBER(struct net_device, net_device_read_tx, tx_extra_headroom);
 	CACHELINE_ASSERT_GROUP_MEMBER(struct net_device, net_device_read_tx, tc_to_txq);
 #ifdef CONFIG_XPS
 	CACHELINE_ASSERT_GROUP_MEMBER(struct net_device, net_device_read_tx, xps_maps);
-- 
2.56.0

