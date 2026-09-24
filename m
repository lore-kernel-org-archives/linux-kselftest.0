Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8526A32570D
	for <linux-kselftest@vger.kernel.org>; Thu, 24 Sep 2026 01:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790212578; cv=none; b=aUqXbflvym5vLomABvxS7NHVuflgLIL6q0HKqS985RAeeO7Wwov5A07ZMJnxU97R825QJJSSyHr+EhI03gc6jt7pIAcY4lpaEYGCnLJUQcnuIRsEqTB4hDcHXmZnB+w3rcPN71LTA9HQCeZf1msBSiw9CoWjiTfh1YR1CEWqm2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790212578; c=relaxed/simple;
	bh=11ci6d+PehauJyAnDYY7IHsA0v6i+cSVmVMjquBbxGA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MxlhGKNjWmbbkcuwK0ZoVzp0Td27rMnoxDvU/EDnv7/S2IPUvynR2aqvWcDITlVvO5aXYwfBiesn/5FoWtQFmfVtEevriq6Up82oYwVi2ZxihIQMPNmqonTEZWl9jEZFscFWPRSxzxf5neKSPrlGDpHLQAV9qPZACkgGGz8uSGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OQQxeERA; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OQQxeERA"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85469a34907so1280540b3a.1
        for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 18:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790212575; x=1790817375; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X966xYfqnCqja66bJ7z4Qy1B/6ctiULzRcFdO6WHqEA=;
        b=OQQxeERAKBPa5tR8++Hu5tBXGifRCE/Gi0KtvkvWn727RemdArdfgX58oC9bGVCuPh
         ocLg76RSryrvWBrormWVjncbkMvlx2LnYunZrWlrQzSJlSQfxMlSGrQx9aDGMZ/oZi1v
         n+ufnwkk9jr6j8xod88IOZVF5fkheoVOzOcWiQJU4TBcBAILIZZTyRgmbJs5sGXKDISU
         1eYs28g3wUB4UGUgY6MCu5sADdBkBHLaIR1aNmxu79XzICKm1ODcTALnj6icvxdued5s
         xcKzyksBYh/3sO5NUxwBZ2cdYB4e2pdudB2KAj7UCAkilkA5XmEfN33mt2/HiT0oy+3B
         eHPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790212575; x=1790817375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X966xYfqnCqja66bJ7z4Qy1B/6ctiULzRcFdO6WHqEA=;
        b=E4X/pDxhP+Pn5xHIrFvEecBeP1/vDEUg78hjoGCrDxLqCi/9FGQnbW0d5cpkiko2EE
         dV8sTkRZMqfSFdN53iu1MwxHOcKTZ7ldojAMMhIgme2wk+0jAHUtFzOaaPkM+yohkbug
         RrB6mC8kXaUU1YgmKYP5lGMxTqhij65EdaK793fk2T0VDUm6ITPWJCnxclb0bhz9f8qQ
         ZPaP5foGikroUt4Q1DhGuieSslpXcnTNyVBdXVy9Vu4YSBLu7HtlIsOq1b3KfSCU2u5c
         1gVJ2/3F3tWXeKSLXI+b/aFiUZ7QqeFQhswio7YQvP2oW5ZZKF5AaTDSH8qcxU6W2mqE
         WQJg==
X-Forwarded-Encrypted: i=1; AKwUvBxX1ngZq4Lxc8jC3FGXssgRF1QSZOecjL6/ILhZvHhPqfljZjKyIfEhQ0uceE6HLQJqj92HcYgiuIckSpW+04o=@vger.kernel.org
X-Gm-Message-State: AFuF++mSKxRQxljHO3MAKHgZWecG+uPi/9OQdLTE8WdQ7SvPiATn1OIx
	BFHbmMLTCMd+GGLRckJEPw3i2+u901yLJ10V/xNGA41n9BMhBTrNVlO+
X-Gm-Gg: AYBFou1rsEzI28cBUJLeAPUulcktB9KgemOy0Kv2N1/MpwYCIUw32MIvjy2t5VIqOj8
	2TEM89OMcsfS+axhx8IzeirpQ5cAYZcLDA3If0e0eyN13UQM29pZqGO0f2APKV5C0wFaqW1RwOf
	rLvZjxNtE2rEgxfLdcFrpYX9OIeAhvHRieVucXwJ4xYIbAveXmgxp42D/CwRBD35+r+Z7Zts07B
	0HqiebPRaiVOWp7FmoDOMahscv6MkGReq2RKUt2bKieHH/CfZuKPQ2SZ24amac62C/9LrwIoT1V
	gIq31cuIEYvmItcMW4AX2g3Yh37Oh04UDb4tKfrps7B4MFfB86W3+fZjrtHTUhxWGPHp6kUEiMd
	9/z35onbooCCuV6JROTWey5Tek/4E+bG+gcZVS9AXRrPXjXj/RdTZN73KjD9UIW1SvJp+KdvG3/
	8xeWWCT7JKz6ZsFBwBGtlPhiTFbpBaMUhwK3EfkihfZoJdaXpg2Za8Ilm9FU6C9NjeSCOaft/uj
	XUkYRnXPuiaNiaqVBHaQtFpJq8z8+XEosApzqAth/n+WH9+o3Bb8Gs0Lp9MmmBv56QM6yLXw3ZV
	6tx/x/EQag5B
X-Received: by 2002:a05:6a20:3d19:b0:3dd:85a9:55aa with SMTP id adf61e73a8af0-3de0e9ba79emr985318637.35.1790212574556;
        Wed, 23 Sep 2026 18:16:14 -0700 (PDT)
Received: from m-upc-A520M-HDV.lan (oki-109-236-14-10.jptransit.net. [109.236.14.10])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc75f3d5794sm1741392a12.14.2026.09.23.18.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 18:16:14 -0700 (PDT)
Sender: Yuyang Huang <uyoko90@gmail.com>
From: Yuyang Huang <sigefriedhyy@gmail.com>
To: Yuyang Huang <sigefriedhyy@gmail.com>
Cc: Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	David Ahern <dsahern@kernel.org>,
	Donald Hunter <donald.hunter@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Ido Schimmel <idosch@nvidia.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Nicolas Dichtel <nicolas.dichtel@6wind.com>,
	Nikolaos Gkarlis <nickgarlis@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Shuah Khan <shuah@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Stanislav Fomichev <sdf.kernel@gmail.com>,
	Willem de Bruijn <willemb@google.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH net-next v7 3/5] net: add AF_PACKET multicast dumps
Date: Thu, 24 Sep 2026 10:15:52 +0900
Message-ID: <20260924011554.3494-4-sigefriedhyy@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924011554.3494-1-sigefriedhyy@gmail.com>
References: <20260924011554.3494-1-sigefriedhyy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RTM_GETMULTICAST dumps IPv4 and IPv6 multicast group memberships, but
the device multicast list (dev->mc) is only available through
/proc/net/dev_mcast, so "ip maddr show" still has to parse procfs for
its link-layer entries.

Handle RTM_GETMULTICAST dumps with ifa_family set to AF_PACKET next to
the dev->mc helpers in dev_addr_lists.c and report every entry of
dev->mc in the existing ifaddrmsg format:

  - IFA_MULTICAST carries the raw link-layer address
  - IFA_MC_USERS carries the entry reference count
  - IFA_F_GLOBAL in IFA_FLAGS reports netdev_hw_addr::global_use, set
    by dev_mc_add_global() (SIOCADDMULTI) and dev_mc_add_excl()
    ("bridge fdb add ... self"), i.e. entries added explicitly rather
    than by a protocol join. This is the static column of
    /proc/net/dev_mcast
  - ifa_scope is RT_SCOPE_LINK

This covers every column of /proc/net/dev_mcast. AF_PACKET is the
family iproute2 already uses for link-layer addresses ("ip -0").

The default FDB dump also walks dev->mc, but only for Ethernet devices
without an ndo_fdb_dump of their own, so bridge, vxlan or macvlan
devices never show their multicast filter there, and it has no users
count or global_use bit. Extending it would change "bridge fdb show"
output and add NDA_* attributes.

Requests are always validated, there are no legacy users: prefixlen,
flags and scope must be zero, ifa_index selects one device and
IFA_TARGET_NETNSID is the only attribute accepted. The dump runs under
RCU and netif_addr_lock_bh() without RTNL. cb->seq is sampled from the
dev->mc generation counter and dev_base_seq under the address lock of
each device and again when a round ends, so a change since the previous
device or dump round sets NLM_F_DUMP_INTR, also when the last round
dumps nothing because the device it stopped at is gone.

Signed-off-by: Yuyang Huang <sigefriedhyy@gmail.com>
---
 include/linux/netdevice.h    |   1 +
 include/uapi/linux/if_addr.h |   1 +
 net/core/dev_addr_lists.c    | 195 +++++++++++++++++++++++++++++++++++
 net/core/rtnetlink.c         |   2 +
 4 files changed, 199 insertions(+)

diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index be3804cdbb2d..204d56a19583 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -5165,6 +5165,7 @@ int dev_mc_sync_multiple(struct net_device *to, struct net_device *from);
 void dev_mc_unsync(struct net_device *to, struct net_device *from);
 void dev_mc_flush(struct net_device *dev);
 void dev_mc_init(struct net_device *dev);
+int dev_mc_dump(struct sk_buff *skb, struct netlink_callback *cb);
 
 /**
  *  __dev_mc_sync - Synchronize device's multicast list
diff --git a/include/uapi/linux/if_addr.h b/include/uapi/linux/if_addr.h
index 7fb630b7fe31..0a1ad9ebb47b 100644
--- a/include/uapi/linux/if_addr.h
+++ b/include/uapi/linux/if_addr.h
@@ -57,6 +57,7 @@ enum {
 #define IFA_F_NOPREFIXROUTE	0x200
 #define IFA_F_MCAUTOJOIN	0x400
 #define IFA_F_STABLE_PRIVACY	0x800
+#define IFA_F_GLOBAL		0x1000
 
 struct ifa_cacheinfo {
 	__u32	ifa_prefered;
diff --git a/net/core/dev_addr_lists.c b/net/core/dev_addr_lists.c
index 18acd874fdbd..9de9a90b9a00 100644
--- a/net/core/dev_addr_lists.c
+++ b/net/core/dev_addr_lists.c
@@ -10,8 +10,12 @@
 #include <linux/netdevice.h>
 #include <linux/rtnetlink.h>
 #include <linux/export.h>
+#include <linux/if_addr.h>
 #include <linux/list.h>
 #include <linux/spinlock.h>
+#include <net/netlink.h>
+#include <net/rtnetlink.h>
+#include <net/sock.h>
 #include <kunit/visibility.h>
 
 #include "dev.h"
@@ -1201,6 +1205,197 @@ void dev_mc_init(struct net_device *dev)
 }
 EXPORT_SYMBOL(dev_mc_init);
 
+static int dev_mc_fill_addr(struct sk_buff *skb, const struct net_device *dev,
+			    const struct netdev_hw_addr *ha, u32 portid,
+			    u32 seq, unsigned int flags, int netnsid)
+{
+	u32 ifa_flags = ha->global_use ? IFA_F_GLOBAL : 0;
+	struct ifaddrmsg *ifm;
+	struct nlmsghdr *nlh;
+
+	nlh = nlmsg_put(skb, portid, seq, RTM_GETMULTICAST, sizeof(*ifm),
+			flags);
+	if (!nlh)
+		return -EMSGSIZE;
+
+	ifm = nlmsg_data(nlh);
+	ifm->ifa_family = AF_PACKET;
+	ifm->ifa_prefixlen = 0;
+	/* ifm->ifa_flags holds 8 bits, the full value is in IFA_FLAGS */
+	ifm->ifa_flags = (__u8)ifa_flags;
+	ifm->ifa_scope = RT_SCOPE_LINK;
+	ifm->ifa_index = dev->ifindex;
+
+	if ((netnsid >= 0 &&
+	     nla_put_s32(skb, IFA_TARGET_NETNSID, netnsid)) ||
+	    nla_put(skb, IFA_MULTICAST, dev->addr_len, ha->addr) ||
+	    nla_put_u32(skb, IFA_MC_USERS, ha->refcount) ||
+	    nla_put_u32(skb, IFA_FLAGS, ifa_flags)) {
+		nlmsg_cancel(skb, nlh);
+		return -EMSGSIZE;
+	}
+
+	nlmsg_end(skb, nlh);
+	return 0;
+}
+
+/* Combine dev_mc_genid and dev_base_seq to detect changes, like
+ * inet_base_seq().
+ */
+static u32 dev_mc_base_seq(const struct net *net)
+{
+	u32 res = atomic_read(&net->dev_mc_genid) +
+		  READ_ONCE(net->dev_base_seq);
+
+	/* Must not return 0 (see nl_dump_check_consistent()). */
+	if (!res)
+		res = 0x80000000;
+	return res;
+}
+
+static int dev_mc_dump_dev(struct net_device *dev, struct sk_buff *skb,
+			   struct netlink_callback *cb, int *s_addr_idx,
+			   unsigned int flags, int netnsid)
+{
+	struct netdev_hw_addr *ha;
+	int addr_idx = 0;
+	int err = 0;
+
+	netif_addr_lock_bh(dev);
+	/* Sampled under the lock, see nl_dump_check_consistent() */
+	cb->seq = dev_mc_base_seq(dev_net(dev));
+	netdev_for_each_mc_addr(ha, dev) {
+		if (addr_idx < *s_addr_idx) {
+			addr_idx++;
+			continue;
+		}
+		err = dev_mc_fill_addr(skb, dev, ha, NETLINK_CB(cb->skb).portid,
+				       cb->nlh->nlmsg_seq, flags, netnsid);
+		if (err < 0)
+			break;
+		nl_dump_check_consistent(cb, nlmsg_hdr(skb));
+		addr_idx++;
+	}
+	netif_addr_unlock_bh(dev);
+
+	*s_addr_idx = err < 0 ? addr_idx : 0;
+
+	return err;
+}
+
+struct dev_mc_dump_filter {
+	struct net *tgt_net;
+	netns_tracker ns_tracker;
+	int netnsid;
+	int ifindex;
+};
+
+static const struct nla_policy dev_mc_dump_policy[IFA_MAX + 1] = {
+	[IFA_TARGET_NETNSID]	= { .type = NLA_S32 },
+};
+
+static int dev_mc_valid_dump_req(const struct nlmsghdr *nlh, struct sock *sk,
+				 struct dev_mc_dump_filter *filter,
+				 struct netlink_ext_ack *extack)
+{
+	struct nlattr *tb[IFA_MAX + 1];
+	struct ifaddrmsg *ifm;
+	int err;
+
+	ifm = nlmsg_payload(nlh, sizeof(*ifm));
+	if (!ifm) {
+		NL_SET_ERR_MSG(extack,
+			       "Invalid header for multicast dump request");
+		return -EINVAL;
+	}
+
+	if (ifm->ifa_prefixlen || ifm->ifa_flags || ifm->ifa_scope) {
+		NL_SET_ERR_MSG(extack,
+			       "Invalid values in multicast dump header");
+		return -EINVAL;
+	}
+
+	err = nlmsg_parse(nlh, sizeof(*ifm), tb, IFA_MAX,
+			  dev_mc_dump_policy, extack);
+	if (err < 0)
+		return err;
+
+	if (tb[IFA_TARGET_NETNSID]) {
+		struct net *net;
+
+		filter->netnsid = nla_get_s32(tb[IFA_TARGET_NETNSID]);
+		net = rtnl_get_net_ns_capable(sk, filter->netnsid);
+		if (IS_ERR(net)) {
+			NL_SET_ERR_MSG(extack,
+				       "Invalid target network namespace id");
+			return PTR_ERR(net);
+		}
+		netns_tracker_alloc(net, &filter->ns_tracker, GFP_KERNEL);
+		filter->tgt_net = net;
+	}
+
+	filter->ifindex = ifm->ifa_index;
+
+	return 0;
+}
+
+int dev_mc_dump(struct sk_buff *skb, struct netlink_callback *cb)
+{
+	struct dev_mc_dump_filter filter = {
+		.tgt_net = sock_net(skb->sk),
+		.netnsid = -1,
+	};
+	unsigned int flags = NLM_F_MULTI;
+	struct {
+		unsigned long ifindex;
+		int addr_idx;
+	} *ctx = (void *)cb->ctx;
+	unsigned long s_ifindex;
+	struct net_device *dev;
+	int err;
+
+	err = dev_mc_valid_dump_req(cb->nlh, skb->sk, &filter, cb->extack);
+	if (err < 0)
+		return err;
+
+	rcu_read_lock();
+
+	if (filter.ifindex) {
+		cb->answer_flags |= NLM_F_DUMP_FILTERED;
+		flags |= NLM_F_DUMP_FILTERED;
+		dev = dev_get_by_index_rcu(filter.tgt_net, filter.ifindex);
+		if (!dev) {
+			err = -ENODEV;
+			goto out;
+		}
+		err = dev_mc_dump_dev(dev, skb, cb, &ctx->addr_idx, flags,
+				      filter.netnsid);
+		goto out;
+	}
+
+	s_ifindex = ctx->ifindex;
+	for_each_netdev_dump(filter.tgt_net, dev, ctx->ifindex) {
+		/* The device the dump stopped at is gone, do not skip
+		 * entries of the next one.
+		 */
+		if (dev->ifindex != s_ifindex)
+			ctx->addr_idx = 0;
+		err = dev_mc_dump_dev(dev, skb, cb, &ctx->addr_idx, flags,
+				      filter.netnsid);
+		if (err < 0)
+			break;
+	}
+out:
+	/* A round that dumps no device, e.g. the one it stopped at is gone,
+	 * still needs the NLMSG_DONE check to see the change.
+	 */
+	cb->seq = dev_mc_base_seq(filter.tgt_net);
+	rcu_read_unlock();
+	if (filter.netnsid >= 0)
+		put_net_track(filter.tgt_net, &filter.ns_tracker);
+	return err;
+}
+
 static int netif_addr_lists_snapshot(struct net_device *dev,
 				     struct netdev_hw_addr_list *uc_snap,
 				     struct netdev_hw_addr_list *mc_snap,
diff --git a/net/core/rtnetlink.c b/net/core/rtnetlink.c
index e3444fd24061..204dc9040e3c 100644
--- a/net/core/rtnetlink.c
+++ b/net/core/rtnetlink.c
@@ -7278,6 +7278,8 @@ static const struct rtnl_msg_handler rtnetlink_rtnl_msg_handlers[] __initconst =
 	{.msgtype = RTM_SETSTATS, .doit = rtnl_stats_set},
 	{.msgtype = RTM_NEWLINKPROP, .doit = rtnl_newlinkprop},
 	{.msgtype = RTM_DELLINKPROP, .doit = rtnl_dellinkprop},
+	{.protocol = PF_PACKET, .msgtype = RTM_GETMULTICAST,
+	 .dumpit = dev_mc_dump, .flags = RTNL_FLAG_DUMP_UNLOCKED},
 	{.protocol = PF_BRIDGE, .msgtype = RTM_GETLINK,
 	 .dumpit = rtnl_bridge_getlink},
 	{.protocol = PF_BRIDGE, .msgtype = RTM_DELLINK,
-- 
2.43.0

