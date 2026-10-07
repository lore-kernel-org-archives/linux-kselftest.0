Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3E4494815
	for <linux-kselftest@vger.kernel.org>; Wed,  7 Oct 2026 11:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791374350; cv=none; b=eUygg2GwsYrInB93QRelTPDL5kvulItHi5zC1mYxAMVHYo7RWr9MRlDMVdARapIltnX22Tkl86zmtNkdag3o1sra/TzK3CaPX1RVCjs1NcmRdY34MD8YKhoz9yIIB8QjwXOGZS6piVIzCu/LcjLKfrq5GlJe8j0IXg89bZnz240=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791374350; c=relaxed/simple;
	bh=pYjPDdmqtPqTUsQvlld8kJWcpuK8/0jAPxiNEbSU+zc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bwNBF7bxuc7CfoiRpy4okdLwEoWdFb3iAz7E1EjBEL8wp35yf/zYmG/15SoclNeuqVvCHW2uuFHOA4mXae183518Wy87vG0wz813QM1Vhk/9RMhEh368E2V6p9psz7+y5LodDyn0m43elKzrL4PN4ERBsHsVGtCi8zVCF20g958=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=srytrBQe; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="srytrBQe"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3a8a2df4f93so402975a91.3
        for <linux-kselftest@vger.kernel.org>; Wed, 07 Oct 2026 04:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791374337; x=1791979137; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zzk1xuGmNLJRy8EZzUthsARN5hY+nZLxQla/IZwG/6o=;
        b=srytrBQeM9V5GxDHRtuDj6EF32BbupkM49VDAPIfhIYubjhc1FE9DyMxOgeNMmsMRH
         hKDVVd/rXHHRo8dXeAgmnE/kaSB5kwr2kYB9AS8berAdGQbwLDIVZqNPewLJ69DaT8XP
         12FUHefHNcf3VJgbdrLZ8GwmGKu8DNELlpAwsSLz4IczrjPUag9FQjUarbfDvyDfPtS8
         WVUJT8lNnGY6U3N3fAP8Dixc0DNJEqTCiYIMexLJgVB8f6CgPQmboFe2PCNSfKEE70rd
         IfiZxAk3FSye4QnMRfzbscyGariClpzNxr+2L2wTP9bIHEpjQuwocKZSxdaXwsbHnmhz
         n83w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791374337; x=1791979137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zzk1xuGmNLJRy8EZzUthsARN5hY+nZLxQla/IZwG/6o=;
        b=xY7LSXs9Ohpg301LsyOx1rVc0gUexpGL0lAnqL/9YpI7U2kgeEc9pDecNgF/yeiGsP
         bkelsWoz430ExH41C2PTRCEkSrDIYABm+VbivIIBqCQUAXy27QKwIzM8ZqK8uLaqAmJp
         8qrLTG97jl/d8+VcR7jyl6gZQQi6R32om6zw4ZCPnf7bAz2d+pzS/Hy5wQHguDgS+UbG
         MMGUqNt+CmexCiK3rK7uq8w2N9DECSc2imsyzYBbfczZb1J0nNn8mQ5C3doxl9+PanxT
         sIdUUfv4jqDmgKPVQo11EoNuKkSxfv8+qvNVs3fjpOzjNyHnR9+jroEAYQ4EKn7m+RV8
         hU5Q==
X-Forwarded-Encrypted: i=1; AKwUvBysae8yPcahyibtY6M5rmYhEIr8TUTh5ts/HckN110Xp1ZmeRgz5hYVf6JjdCAxTRgrcBYwJmsxO2DpFZIatec=@vger.kernel.org
X-Gm-Message-State: AFq9FYKh94BJaO4jbMJmv8686L1tmIs979CWe9vkjrWg8MSLoRleVaPe
	iOD0FxpTLO/muso0QMr2k/mhIW9bY8qWwvwt++SPoUbnePuuHjqC4y6U
X-Gm-Gg: AYBFou1OlyrSlT2B/e4Rtnoz421R9yBuwxwrK/bon4rxVm3vq/nuBe6qJwAp/f6S0Rr
	2Gy4Cmq8OF6g2ShZi6vGt3Kwn4zJ9+txfqM3o0OD6B5IyW1MWqMNeEm7MKRm2xF4f2AX6Yma8pl
	LFpg9qIAeM63v/1M6K9MU8UxSCQrnQAIjE6IRMFhYi6s8DnUyihvAu+X0jfoG0X2UgevxCFbS3X
	nQsUhEPbb+wLKCTilMGZwcz1xfo2sh4QH/ci0zKt+vnOmGDqaqEyfHkMecGZXkNSrj2v7fEsh56
	R7BURIEO3TiBsAcVnb1l/ql75SZK84D2K2QLlhK7U6u3AGB6omrB0NfjpHf5HW+E7S1a7opCWA1
	JoKntHBlk/1UkZlGbLOjZq4RSGKx58NIczJfGBDQn3e/+Rv+SKN9J/rGJUQQcUPjF8hc0cMBUtf
	PwQYRyKKhfIfecGhXEAiFy1pVVcm3gRqCu+DiW5+MmYfeZ+Yy+ZP1M4kOnWicGvaz0ArP8DUzVr
	izFE/2dtAKUp3+9hEDs6wRYHlH2SbsbJNlYPPK/OmBa0Du0iVlkQKRiaPa6jzY9MC/mBZVFKkmq
	jDgI6gr/EX4=
X-Received: by 2002:a17:90a:fc47:b0:3a4:9859:9749 with SMTP id 98e67ed59e1d1-3a8a1b425e3mr1592100a91.38.1791374337435;
        Wed, 07 Oct 2026 04:58:57 -0700 (PDT)
Received: from m-upc-A520M-HDV.lan (oki-109-236-14-10.jptransit.net. [109.236.14.10])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8987b09e2sm4456582a91.2.2026.10.07.04.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 04:58:56 -0700 (PDT)
Sender: Yuyang Huang <uyoko90@gmail.com>
From: Yuyang Huang <sigefriedhyy@gmail.com>
To: Yuyang Huang <sigefriedhyy@gmail.com>
Cc: Ajay Singh <ajay.kathat@microchip.com>,
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	"David S. Miller" <davem@davemloft.net>,
	David Ahern <dsahern@kernel.org>,
	Donald Hunter <donald.hunter@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Ido Schimmel <idosch@nvidia.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Johannes Berg <johannes@sipsolutions.net>,
	Kees Cook <kees@kernel.org>,
	Kory Maincent <kory.maincent@bootlin.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Nicolas Dichtel <nicolas.dichtel@6wind.com>,
	Nikolaos Gkarlis <nickgarlis@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Shuah Khan <shuah@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Stanislav Fomichev <sdf.kernel@gmail.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Willem de Bruijn <willemb@google.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH net-next v10 4/6] net: add AF_PACKET multicast dumps
Date: Wed,  7 Oct 2026 20:58:19 +0900
Message-ID: <20261007115821.11332-5-sigefriedhyy@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261007115821.11332-1-sigefriedhyy@gmail.com>
References: <20261007115821.11332-1-sigefriedhyy@gmail.com>
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
and only if the driver uses it, vxlan for example does not, and it has
no users count or global_use bit. Extending it would change "bridge fdb
show" output and add NDA_* attributes.

Requests are always validated, there are no legacy users: prefixlen,
flags and scope must be zero, ifa_index selects one device and
IFA_TARGET_NETNSID is the only attribute accepted. The dump runs under
RCU and netif_addr_lock_bh() without RTNL. After each round cb->seq is
set from the dev->mc generation counter and dev_base_seq and checked
like rtnl_dump_ifinfo() does, so an entry added or removed since the
previous round sets NLM_F_DUMP_INTR.

Signed-off-by: Yuyang Huang <sigefriedhyy@gmail.com>
---
 include/linux/netdevice.h    |   1 +
 include/uapi/linux/if_addr.h |   1 +
 net/core/dev_addr_lists.c    | 186 +++++++++++++++++++++++++++++++++++
 net/core/rtnetlink.c         |   2 +
 4 files changed, 190 insertions(+)

diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index 6c837ea34748e..296eef148ef63 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -5171,6 +5171,7 @@ int dev_mc_sync_multiple(struct net_device *to, struct net_device *from);
 void dev_mc_unsync(struct net_device *to, struct net_device *from);
 void dev_mc_flush(struct net_device *dev);
 void dev_mc_init(struct net_device *dev);
+int dev_mc_dump(struct sk_buff *skb, struct netlink_callback *cb);
 
 /**
  *  __dev_mc_sync - Synchronize device's multicast list
diff --git a/include/uapi/linux/if_addr.h b/include/uapi/linux/if_addr.h
index 7fb630b7fe311..0a1ad9ebb47be 100644
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
index 3ab053cbf8b99..7b9abeca431f6 100644
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
@@ -1215,6 +1219,188 @@ void dev_mc_init(struct net_device *dev)
 }
 EXPORT_SYMBOL(dev_mc_init);
 
+static int dev_mc_fill_addr(struct sk_buff *skb, const struct net_device *dev,
+			    const struct netdev_hw_addr *ha, u32 portid,
+			    u32 seq, unsigned int flags, int netnsid)
+{
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
+	ifm->ifa_flags = 0;
+	ifm->ifa_scope = RT_SCOPE_LINK;
+	ifm->ifa_index = dev->ifindex;
+
+	if ((netnsid >= 0 &&
+	     nla_put_s32(skb, IFA_TARGET_NETNSID, netnsid)) ||
+	    nla_put(skb, IFA_MULTICAST, dev->addr_len, ha->addr) ||
+	    nla_put_u32(skb, IFA_MC_USERS, ha->refcount) ||
+	    nla_put_u32(skb, IFA_FLAGS, ha->global_use ? IFA_F_GLOBAL : 0)) {
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
+	netdev_for_each_mc_addr(ha, dev) {
+		if (addr_idx < *s_addr_idx) {
+			addr_idx++;
+			continue;
+		}
+		err = dev_mc_fill_addr(skb, dev, ha, NETLINK_CB(cb->skb).portid,
+				       cb->nlh->nlmsg_seq, flags, netnsid);
+		if (err < 0)
+			break;
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
+		if (dev)
+			err = dev_mc_dump_dev(dev, skb, cb, &ctx->addr_idx,
+					      flags, filter.netnsid);
+		else
+			err = -ENODEV;
+	} else {
+		s_ifindex = ctx->ifindex;
+		for_each_netdev_dump(filter.tgt_net, dev, ctx->ifindex) {
+			/* The device the dump stopped at is gone, do not
+			 * skip entries of the next one.
+			 */
+			if (dev->ifindex != s_ifindex)
+				ctx->addr_idx = 0;
+			err = dev_mc_dump_dev(dev, skb, cb, &ctx->addr_idx,
+					      flags, filter.netnsid);
+			if (err < 0)
+				break;
+		}
+	}
+	cb->seq = dev_mc_base_seq(filter.tgt_net);
+	nl_dump_check_consistent(cb, nlmsg_hdr(skb));
+
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
index 5bbebce0c2f50..1ec59b439986f 100644
--- a/net/core/rtnetlink.c
+++ b/net/core/rtnetlink.c
@@ -7282,6 +7282,8 @@ static const struct rtnl_msg_handler rtnetlink_rtnl_msg_handlers[] __initconst =
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

