Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34BE483816
	for <linux-kselftest@vger.kernel.org>; Sat, 17 Oct 2026 23:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792281540; cv=none; b=Vp46/PeSMi+CCG2fGMnYGdAzgEwQ1fV4TcQsqF7NzO+2Ple8XqIfgXWN+2Noaz5ZkFdnOkoXpKECoSfA3zSEx6+NdNszjuyMuD+HfktfNd0fGoGGW66/ZgXz7b5DGTn/oCiZXu4TcTgS/vYuNsfJvfvCD6LplRtRUJnN3nr2/dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792281540; c=relaxed/simple;
	bh=Emh5b857CrjOqv3+Fdv07ite/xNuLPJBHS7D5WX++Co=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sAt5WhfUZ3mDMBE+WnDSUottR4Fj4AHtDgMdCG+ZLdDX8s1Exqo77eurPlBevXXQcS+4En1i4GQYkwhqn4DlPRyKHewIXu6MTXftCZ7MJvoB/zkV5bXCKr3jUmD0oXqPAaZ6ppRQpvMvfRgMvOLT60ylUluZ3DdmiGIHNIHuylc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de; spf=pass smtp.mailfrom=bairaktaris.de; dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b=U00FlIn8; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b="U00FlIn8"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c43373ae89aso14880466b.3
        for <linux-kselftest@vger.kernel.org>; Sat, 17 Oct 2026 16:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1792281537; x=1792886337; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NaeNiuLn1mpaVU6PFYuBQMrVRFDv7j5H7niheq3FrYc=;
        b=U00FlIn8eunj7Uh2AU1L5y4wzkDHvXcGucRnD+hZRtGnebjg1o9++mtBw0szyQD1DX
         VZvmR5fd4rO+VC20oVOET9+E31ZQ+sBTHxjK4WMBjAizdcfgFV5TZCeh3qWOGXaMEeUf
         IahQQx9MI6hfiIOMZ11zEo7vbw5oT2COv8zcs0yKqMwW1z9B3SJy0OuzhV3NdxA2BLa6
         DuYYm7M6C+CuxFQPgBrU8805zzVGPF5JGRvIVF46x7onYYi/gEnj5huW3XkbSLHeBKQR
         H/sXckNIyu93yJIZ2hHQ/61KoARCzFvn5Q2TsDsXzt9sQJqg8ZZnVtatS0WC+n+1K4iP
         8O3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792281537; x=1792886337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NaeNiuLn1mpaVU6PFYuBQMrVRFDv7j5H7niheq3FrYc=;
        b=i0ZDEwuYGH1MwAzWxfEGz3Vjp/tyZc92RY5+eZVTJg1fN1utBqIasfwlrP2POEngxe
         e0F8nQ2JgTQd1Ipd5B1C9UQamJkLhJ5taZV3XeA0Lt6yOKBG9lXzwqzKowXTDA3MyazH
         NcGnKcDwVNe68LC+4Rq7HaNA8kBBOJobbWurID7x6qjNrbbe4hPkdV1owikmh+aCPd4n
         8rWYbs9uZw6e9jhmorQAqPEnkGIP8Ze6pMrUD5oD/l6Fnnmk4cZmW2mwz6T755YyQssq
         8XplyLGfS2ftCOf4ezJzEFMQcX2Nqr7/1WR1+q1mCevRDD+MHSFmPt9ffw11i3CnswM/
         ClYw==
X-Forwarded-Encrypted: i=1; AKwUvBy/nDFa7DO/GYfD6tKJ094y+qy0hA3BGbVr6eNhSf124NrotG/vYM/NyiwOQU/VjV0HHIo8kbot4Y32rPxR5V4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKljiLc46apWho59GgyrS3aGgkOKrYW/qWKUo0VwZWl4XYXYsJB
	1/NqRxOBvvfjVh5XkzZpX/qC6ChgHXPCYUfV+Ie+TF4Nsh9L1WgOW/VCwXsbOpr0bg==
X-Gm-Gg: AYBFou3igSUCN2IlU5fctIfPgx1evMPPD8hutCm1oGhVCBOPDE+gkdLSqMM8Ze4ehYY
	g8byWE3x7eq5hDXpmiM29lmeBO/xPfjqVK9+edP5yNSu0HwpYwMf9DhejSHe5SiRgRYBe5QQUOs
	rclQDLi36LGpqeoI80Pm1bV1JChF4nYAE7ZJA/RcZy2FmgC2RSBYS38pw16M67ScTmA8viqGJiA
	uikLGtJvNDSjVeM32MF9jCQ4DMaD6YjweqZJ5FZ1KVCVuu3QmP1aiVRdMZl+gG+fWpsljoaqyBw
	6vm8oykF84X3CPlD7LtJsWSqAzm1ztMfu373mFUXpNIa46YLogIcsE1I1eZFATp9MfpwP5cj9dl
	0q1fGDO6A2ZzuS4iV8q5ueRckVGlA/8CSgJGACuIa8mRUDedo7mhJLjiPylx51VUiKUM7TshBhZ
	ulm1XI/9iyEgLxNKIzOtSQkdypQKM9JLj2rG8CoQ9yq0UDfe7zBxpazeKYwZV+dubvygb5wl5nA
	yQvQE45/9u7Do2o5dHpPl+NPZQuvoBVZ6/kYi9FofeLtvf2ATh579QvVfs2OD10M5EE8jZhikhS
	d9LYShcGkFZmueaIDYudVnGOZP4HsNiMDA5SOSEobH7GPho4IhhDbnpjMKmd05mog85mGTM0N8n
	F3ejYHhRHtxjItYftS70wOS8JgOqWQeUbOfhlWll5M4ODeByWfGVqMGj2WCd175JbpUC3qQMb4U
	gxQ+C+kCUL+FScc9jI8apZ6bVPpP/+quCA/HRQ+CGabH9M8y42iZLTdQi4GCwFDV9RXUNW
X-Received: by 2002:a17:906:99c4:b0:c3e:e677:5608 with SMTP id a640c23a62f3a-c419da40b84mr241993366b.12.1792281536712;
        Sat, 17 Oct 2026 16:58:56 -0700 (PDT)
Received: from Desktop.fritz.box (p200300f24741261000ca3161c2b9b67f.dip0.t-ipconnect.de. [2003:f2:4741:2610:ca:3161:c2b9:b67f])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c408e328780sm216534166b.6.2026.10.17.16.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 16:58:55 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: netfilter-devel@vger.kernel.org
Cc: pablo@netfilter.org,
	fw@strlen.de,
	kadlec@netfilter.org,
	phil@nwl.cc,
	horms@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	shuah@kernel.org,
	razor@blackwall.org,
	idosch@nvidia.com,
	ericwouds@gmail.com,
	dqfext@gmail.com,
	netdev@vger.kernel.org,
	coreteam@netfilter.org,
	linux-kselftest@vger.kernel.org,
	bridge@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH nf-next v8 1/2] netfilter: flowtable: tear down direct xmit flows when the fdb entry moves
Date: Sun, 18 Oct 2026 01:58:47 +0200
Message-ID: <20261017235849.1066624-2-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261017235849.1066624-1-julius@bairaktaris.de>
References: <20261017235849.1066624-1-julius@bairaktaris.de>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A direct xmit flow that reaches a bridge port keeps sending to that port
when the host moves to another port of the bridge, and packets from the
other side keep the flow from timing out.

The gc now checks the fdb entry next to the dst check, through
nf_br_utils_hook, and tears the flow down when the entry points to
another port. An entry that aged out does not tear it down, because
offloaded packets do not refresh it.

The bridge port is found from out.ifidx through the vlan devices that
the forward path has below the port. The vid is the bridge vlan in the
encap stack, or the pvid of the port for an untagged port of a
vlan_filtering bridge.

Reported-by: Eric Woudstra <ericwouds@gmail.com>
Link: https://lore.kernel.org/netfilter-devel/20250925182623.114045-1-ericwouds@gmail.com/
Co-developed-by: Pablo Neira Ayuso <pablo@netfilter.org>
Signed-off-by: Pablo Neira Ayuso <pablo@netfilter.org>
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
Assisted-by covers my changes on top of Pablo's patch.

 include/linux/netfilter.h             |  7 +++++
 include/net/netfilter/nf_flow_table.h |  8 ++++-
 net/bridge/Makefile                   |  2 ++
 net/bridge/br.c                       |  2 ++
 net/bridge/br_nf_utils.c              | 38 ++++++++++++++++++++++
 net/bridge/br_private.h               | 13 ++++++++
 net/netfilter/core.c                  |  3 ++
 net/netfilter/nf_flow_table_core.c    | 45 +++++++++++++++++++++++++--
 net/netfilter/nf_flow_table_path.c    | 19 +++++++++--
 9 files changed, 132 insertions(+), 5 deletions(-)
 create mode 100644 net/bridge/br_nf_utils.c

diff --git a/include/linux/netfilter.h b/include/linux/netfilter.h
index e99afc1414cd3..be85d8f68b452 100644
--- a/include/linux/netfilter.h
+++ b/include/linux/netfilter.h
@@ -67,6 +67,13 @@ static inline void nf_inet_addr_mask(const union nf_inet_addr *a1,
 #endif
 }
 
+struct nf_br_utils {
+	bool (*fdb_valid_dst)(const struct net_device *dev,
+			      const unsigned char *addr, u16 vid);
+};
+
+extern const struct nf_br_utils __rcu *nf_br_utils_hook;
+
 int netfilter_init(void);
 
 struct sk_buff;
diff --git a/include/net/netfilter/nf_flow_table.h b/include/net/netfilter/nf_flow_table.h
index 5b611efaa3cd1..6865b542eb3be 100644
--- a/include/net/netfilter/nf_flow_table.h
+++ b/include/net/netfilter/nf_flow_table.h
@@ -152,6 +152,9 @@ struct flow_offload_tuple {
 					xmit_type:3,
 					encap_num:2,
 					needs_gso_segment:1,
+					bridge_path:1,
+					bridge_vlan:1,
+					port_vlans:2,
 					tun_num:2,
 					in_vlan_ingress:2;
 	u16				mtu;
@@ -234,7 +237,10 @@ struct nf_flow_route {
 			u32			hw_ifindex;
 			u8			h_source[ETH_ALEN];
 			u8			h_dest[ETH_ALEN];
-			u8			needs_gso_segment:1;
+			u8			needs_gso_segment:1,
+						bridge_path:1,
+						bridge_vlan:1,
+						port_vlans:2;
 		} out;
 		enum flow_offload_xmit_type	xmit_type;
 	} tuple[FLOW_OFFLOAD_DIR_MAX];
diff --git a/net/bridge/Makefile b/net/bridge/Makefile
index 1203dc19e15c9..fc53c332246de 100644
--- a/net/bridge/Makefile
+++ b/net/bridge/Makefile
@@ -14,6 +14,8 @@ bridge-$(CONFIG_SYSFS) += br_sysfs_if.o br_sysfs_br.o
 
 bridge-$(subst m,y,$(CONFIG_BRIDGE_NETFILTER)) += br_nf_core.o
 
+bridge-$(subst m,y,$(CONFIG_NF_FLOW_TABLE)) += br_nf_utils.o
+
 br_netfilter-y := br_netfilter_hooks.o
 br_netfilter-$(subst m,y,$(CONFIG_IPV6)) += br_netfilter_ipv6.o
 obj-$(CONFIG_BRIDGE_NETFILTER) += br_netfilter.o
diff --git a/net/bridge/br.c b/net/bridge/br.c
index d9a39ff98868d..c0618ef6dac5c 100644
--- a/net/bridge/br.c
+++ b/net/bridge/br.c
@@ -458,6 +458,7 @@ static int __init br_init(void)
 		goto err_out6;
 
 	brioctl_set(br_ioctl_stub);
+	br_nf_utils_init();
 
 #if IS_MODULE(CONFIG_BRIDGE_NETFILTER)
 	pr_info("bridge: filtering via arp/ip/ip6tables is no longer available "
@@ -486,6 +487,7 @@ static int __init br_init(void)
 
 static void __exit br_deinit(void)
 {
+	br_nf_utils_fini();
 	stp_proto_unregister(&br_stp_proto);
 	br_netlink_fini();
 	unregister_switchdev_blocking_notifier(&br_switchdev_blocking_notifier);
diff --git a/net/bridge/br_nf_utils.c b/net/bridge/br_nf_utils.c
new file mode 100644
index 0000000000000..300bce6c1b0b8
--- /dev/null
+++ b/net/bridge/br_nf_utils.c
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <linux/netdevice.h>
+#include <linux/netfilter.h>
+
+#include "br_private.h"
+
+static bool nf_br_fdb_valid_dst(const struct net_device *dev,
+				const unsigned char *addr, u16 vid)
+{
+	const struct net_bridge_fdb_entry *f;
+	const struct net_bridge_port *p;
+
+	p = br_port_get_check_rcu(dev);
+	if (!p)
+		return false;
+
+	if (!vid && br_opt_get(p->br, BROPT_VLAN_ENABLED))
+		vid = br_get_pvid(nbp_vlan_group_rcu(p));
+
+	/* Offloaded packets do not refresh the entry, it can age out. */
+	f = br_fdb_find_rcu(p->br, addr, vid);
+
+	return !f || br_fdb_dst_port(f) == p;
+}
+
+static const struct nf_br_utils nf_br_utils = {
+	.fdb_valid_dst	= nf_br_fdb_valid_dst,
+};
+
+void br_nf_utils_init(void)
+{
+	rcu_assign_pointer(nf_br_utils_hook, &nf_br_utils);
+}
+
+void br_nf_utils_fini(void)
+{
+	RCU_INIT_POINTER(nf_br_utils_hook, NULL);
+}
diff --git a/net/bridge/br_private.h b/net/bridge/br_private.h
index 05921192ebda1..22c9e17d76175 100644
--- a/net/bridge/br_private.h
+++ b/net/bridge/br_private.h
@@ -2164,6 +2164,19 @@ struct nf_br_ops {
 };
 extern const struct nf_br_ops __rcu *nf_br_ops;
 
+#if IS_ENABLED(CONFIG_NF_FLOW_TABLE)
+void br_nf_utils_init(void);
+void br_nf_utils_fini(void);
+#else
+static inline void br_nf_utils_init(void)
+{
+}
+
+static inline void br_nf_utils_fini(void)
+{
+}
+#endif
+
 /* br_netfilter.c */
 #if IS_ENABLED(CONFIG_BRIDGE_NETFILTER)
 int br_nf_core_init(void);
diff --git a/net/netfilter/core.c b/net/netfilter/core.c
index 940dea2663e95..914f0934f6da3 100644
--- a/net/netfilter/core.c
+++ b/net/netfilter/core.c
@@ -814,6 +814,9 @@ static struct pernet_operations netfilter_net_ops = {
 	.exit = netfilter_net_exit,
 };
 
+const struct nf_br_utils __rcu *nf_br_utils_hook;
+EXPORT_SYMBOL_GPL(nf_br_utils_hook);
+
 int __init netfilter_init(void)
 {
 	int ret;
diff --git a/net/netfilter/nf_flow_table_core.c b/net/netfilter/nf_flow_table_core.c
index 0d72dc8ae47a1..113580adf10d3 100644
--- a/net/netfilter/nf_flow_table_core.c
+++ b/net/netfilter/nf_flow_table_core.c
@@ -5,6 +5,7 @@
 #include <linux/netfilter.h>
 #include <linux/rhashtable.h>
 #include <linux/netdevice.h>
+#include <linux/if_vlan.h>
 #include <net/ip.h>
 #include <net/ip6_route.h>
 #include <net/netfilter/nf_tables.h>
@@ -139,6 +140,9 @@ static int flow_offload_fill_route(struct flow_offload *flow,
 		memcpy(flow_tuple->out.h_source, route->tuple[dir].out.h_source,
 		       ETH_ALEN);
 		flow_tuple->out.ifidx = route->tuple[dir].out.ifindex;
+		flow_tuple->bridge_path = route->tuple[dir].out.bridge_path;
+		flow_tuple->bridge_vlan = route->tuple[dir].out.bridge_vlan;
+		flow_tuple->port_vlans = route->tuple[dir].out.port_vlans;
 		break;
 	case FLOW_OFFLOAD_XMIT_XFRM:
 	case FLOW_OFFLOAD_XMIT_NEIGH:
@@ -572,6 +576,43 @@ static void nf_flow_table_extend_ct_timeout(struct nf_conn *ct)
 	nf_ct_put(ct);
 }
 
+static bool nf_flow_dst_valid(struct nf_flowtable *flow_table,
+			      struct flow_offload *flow, int dir)
+{
+	struct flow_offload_tuple *other = &flow->tuplehash[!dir].tuple;
+	struct flow_offload_tuple *tuple = &flow->tuplehash[dir].tuple;
+	struct net *net = read_pnet(&flow_table->net);
+	const struct nf_br_utils *br_utils;
+	struct net_device *dev;
+	bool valid = true;
+	u16 vid = 0;
+	int i;
+
+	if (!nf_flow_dst_check(tuple))
+		return false;
+
+	if (!tuple->bridge_path)
+		return true;
+
+	rcu_read_lock();
+	br_utils = rcu_dereference(nf_br_utils_hook);
+	if (!br_utils)
+		goto out;
+
+	dev = dev_get_by_index_rcu(net, tuple->out.ifidx);
+	for (i = 0; dev && i < tuple->port_vlans; i++)
+		dev = __vlan_find_dev_deep_rcu(dev, other->encap[i].proto,
+					       other->encap[i].id);
+	if (tuple->bridge_vlan)
+		vid = other->encap[i].id;
+
+	valid = dev && br_utils->fdb_valid_dst(dev, tuple->out.h_dest, vid);
+out:
+	rcu_read_unlock();
+
+	return valid;
+}
+
 static void nf_flow_offload_gc_step(struct nf_flowtable *flow_table,
 				    struct flow_offload *flow, void *data)
 {
@@ -584,8 +625,8 @@ static void nf_flow_offload_gc_step(struct nf_flowtable *flow_table,
 
 	if (nf_flow_has_expired(flow) ||
 	    nf_ct_is_dying(flow->ct) ||
-	    !nf_flow_dst_check(&flow->tuplehash[FLOW_OFFLOAD_DIR_ORIGINAL].tuple) ||
-	    !nf_flow_dst_check(&flow->tuplehash[FLOW_OFFLOAD_DIR_REPLY].tuple) ||
+	    !nf_flow_dst_valid(flow_table, flow, FLOW_OFFLOAD_DIR_ORIGINAL) ||
+	    !nf_flow_dst_valid(flow_table, flow, FLOW_OFFLOAD_DIR_REPLY) ||
 	    nf_flow_custom_gc(flow_table, flow)) {
 		flow_offload_teardown(flow);
 		teardown = true;
diff --git a/net/netfilter/nf_flow_table_path.c b/net/netfilter/nf_flow_table_path.c
index d90013685bf12..779d1fc0ed994 100644
--- a/net/netfilter/nf_flow_table_path.c
+++ b/net/netfilter/nf_flow_table_path.c
@@ -95,7 +95,10 @@ struct nft_forward_info {
 	u8 ingress_vlans;
 	u8 h_source[ETH_ALEN];
 	u8 h_dest[ETH_ALEN];
-	bool needs_gso_segment;
+	u8 needs_gso_segment:1,
+	   bridge_path:1,
+	   bridge_vlan:1,
+	   port_vlans:2;
 	enum flow_offload_xmit_type xmit_type;
 };
 
@@ -107,7 +110,7 @@ static int nft_dev_path_info(struct net_device_path_stack *stack,
 			     unsigned char *ha, struct nft_flowtable *ft)
 {
 	const struct net_device_path *path;
-	int i;
+	int i, n;
 
 	memcpy(info->h_dest, ha, ETH_ALEN);
 
@@ -148,6 +151,8 @@ static int nft_dev_path_info(struct net_device_path_stack *stack,
 				info->encap[info->num_encaps].proto =
 					path->encap.proto;
 				info->num_encaps++;
+				if (info->bridge_path)
+					info->port_vlans++;
 			}
 			if (path->type == DEV_PATH_PPPOE) {
 				memcpy(info->h_dest, path->encap.h_dest, ETH_ALEN);
@@ -183,6 +188,13 @@ static int nft_dev_path_info(struct net_device_path_stack *stack,
 			case DEV_PATH_BR_VLAN_KEEP:
 				break;
 			}
+			info->bridge_path = 1;
+			n = info->num_encaps;
+			info->bridge_vlan = path->bridge.vlan_id && n &&
+					    info->encap[n - 1].id ==
+					    path->bridge.vlan_id &&
+					    info->encap[n - 1].proto ==
+					    path->bridge.vlan_proto;
 			info->xmit_type = FLOW_OFFLOAD_XMIT_DIRECT;
 			break;
 		default:
@@ -260,6 +272,9 @@ static int nft_dev_forward_path(const struct nft_pktinfo *pkt,
 	if (info.xmit_type == FLOW_OFFLOAD_XMIT_DIRECT) {
 		memcpy(route->tuple[dir].out.h_source, info.h_source, ETH_ALEN);
 		memcpy(route->tuple[dir].out.h_dest, info.h_dest, ETH_ALEN);
+		route->tuple[dir].out.bridge_path = info.bridge_path;
+		route->tuple[dir].out.bridge_vlan = info.bridge_vlan;
+		route->tuple[dir].out.port_vlans = info.port_vlans;
 		route->tuple[dir].xmit_type = info.xmit_type;
 	}
 	route->tuple[dir].out.needs_gso_segment = info.needs_gso_segment;
-- 
2.53.0

