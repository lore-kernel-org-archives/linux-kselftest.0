Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D4348EC74
	for <linux-kselftest@vger.kernel.org>; Tue, 22 Sep 2026 00:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790035207; cv=none; b=eUV0NvxpxEXUuCiQrSkp9/PYvh/cAwGKaaiQXqs3D2zRY6/pMWnYkR343iywKl9F8tLp/sdqUercKWNrrzucC4XytkxzDcib6qKB3S/kUE8ComqqXPF9zIfw8l/GD/2fLI9Z9BXBTm6vyZdeSHXBNEODUu9YjuQcl+VLUvAhqok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790035207; c=relaxed/simple;
	bh=aeVxrR44d3OBC1CrnTg9XVytsuQ4VhF0kpHb6r8j5B4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XSRfzMN8ZaWMzH61vuT1IvpN8RhVit7oiHChGJ0xo/TZzbrk2GaK7FzF/Z07IimGCM4iFTSBSftWdJPlWy/OefAinqLGSv8XDHp0gaz3hbVage1i4+H1AyAGHI4NtAmW6C0rDmqKdpL8EJyfnB2Hk232Z6vbyIxzlEooKnzeOZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OE6ruv/w; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OE6ruv/w"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d90ba1d807so43262335ad.3
        for <linux-kselftest@vger.kernel.org>; Mon, 21 Sep 2026 17:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790035205; x=1790640005; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mt9wRmaeFZ6BQdXUF40E4zMHIP9v2IyikCaROT4utsI=;
        b=OE6ruv/wvH/iEPBdOWhSZH80yice462PNYTS5+1IjuHu7LXc2bRQp8VxE0HpM4otsQ
         P+N2vTGsphQ1l7ettar8BayGwDPX1hmhz+z9Jo6oxWWnyDyx/uMj38L9V+h4c8xpAWje
         YD2kIwkVmU2zTyd787EqUDxwKzXUzHuvkt1hcdlesageo7CBbo/sLBuoRltPWKzWggwi
         e2jRy1Wnuz/cfCycC6MD/bs+sVqSdmDQz3DVRi+klAsioFP5qWPHFhCiRnJUuWdgGXWY
         TXzM7VKBVqNGF/8/fG+T9S70GH8+PIy9AfGYa79uTNpBkhOosThtTgIQTuUVesaP77O+
         lxCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790035205; x=1790640005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mt9wRmaeFZ6BQdXUF40E4zMHIP9v2IyikCaROT4utsI=;
        b=z9kkboCCbL3N9cebyMDLf3pnBj6WxPdwei8QMESCCnEpoXxKx/2jfnXnL3rg8bUBQl
         c47e3V0Dc/LB2evng5fY2yQmhrESzjMenauFMTWq6UDfyTqhToIqDA8CAGa0ntr/oIjz
         +SkfNplI2KiFqF+d8KU7jVXzHWS5j/cj605wo6uRGQPUyWkJ89RN63Jl8C3v1eKhrjMn
         IQx3OFAfF0xJ9vwVv+AB7nq0h2VB9G5jnexmu0iZigM66H2+KMdE6/VmQYYJWALBwHYk
         yYAqBvZe6aaSEg68z3VBHNwP78XR578UEXOrecyOmDuy3Q7krOag0e6ks7mc/yyBm9BC
         nmJw==
X-Forwarded-Encrypted: i=1; AKwUvBw6SWDCvg2XufyqNFxaGMNQ8n2+1bB3DqvwYl6hEKumwWXia1wGtsVGzvBcxEV+RvdqaZ+fSkm+MXaEUFmcXDI=@vger.kernel.org
X-Gm-Message-State: AFuF++k65L4r4m993PivaST4Imehzklwv7NLvfy5EU6AAYoF53MMEWOX
	ZnBKU/K1R1xrL2RSx2cbxIS2uYblTpKv5teGUU+kEmcsZE+Oi20YpEw8
X-Gm-Gg: AYBFou3bZajZUr42covDHSySNKGCcl0l+oNQrvwbR1RSG0QVbBKCAaxuiL3xSneDBh3
	CbdSKb+HDOKAyphzXFosExPn198NJWUsbE1DOC3Eg7h9u1KmUvmbjIkCbJKMjVU7kmK0lNJPnbL
	CEbFvmTbS5QrSfZNo5vc2/wCWMPMCx6WRaYW5n1M4fBNdoz/6h19AZ8m7aCUxrRVapUQs1RNS8s
	+ovygwK+MyNbnpvf66L++3WMzcMArBX8/FrQ94MuA0Ci3K/2767nbAuQf7aqQIjAtqUrICtCE24
	yxeO+dicghyeBzXmc7zzmLK76envL4c6FRpAb/CFLZbfW5HyJUQ0R4AD+g/zZITI8c6XZcRKv0e
	VCExM2EV/Cdj3aSYw8AzFXgIHGYQJ8cPT7I/CZ22OeRnGsDYje3HV1BpT8sXO7jcYIBY1Kjtsyk
	a+5EHWtE5twaVvPD35mW5Dvi3UjVeqFEdDgnvbEhHvmRcQMK9T2m0DmJpCUyUEByLrWLW2N/JTJ
	v325IPMFh/4u/IqPbBNDfgtlx1uWmIYOL5nBCnYnjUQ3vH6WzG9Wwqg1EfS5XQ016uQxuAZlYyf
	/Q==
X-Received: by 2002:a17:903:3b8b:b0:2dd:c100:a5e1 with SMTP id d9443c01a7336-2ddc100a6f0mr114751315ad.53.1790035204818;
        Mon, 21 Sep 2026 17:00:04 -0700 (PDT)
Received: from m-upc-A520M-HDV.lan (oki-109-236-14-10.jptransit.net. [109.236.14.10])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df5d045e78sm386135ad.51.2026.09.21.17.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 17:00:03 -0700 (PDT)
Sender: Yuyang Huang <uyoko90@gmail.com>
From: Yuyang Huang <sigefriedhyy@gmail.com>
To: Yuyang Huang <sigefriedhyy@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
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
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH net-next v6 2/4] net: add AF_PACKET multicast dumps
Date: Tue, 22 Sep 2026 08:59:49 +0900
Message-ID: <20260921235951.3214-3-sigefriedhyy@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260921235951.3214-1-sigefriedhyy@gmail.com>
References: <20260921235951.3214-1-sigefriedhyy@gmail.com>
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
RCU and netif_addr_lock_bh() without RTNL, and stamps cb->seq from
dev_base_seq so a device added or removed between dump rounds sets
NLM_F_DUMP_INTR.

Signed-off-by: Yuyang Huang <sigefriedhyy@gmail.com>
Reviewed-by: Nicolas Dichtel <nicolas.dichtel@6wind.com>
---
 include/linux/netdevice.h    |   1 +
 include/uapi/linux/if_addr.h |   1 +
 net/core/dev_addr_lists.c    | 177 +++++++++++++++++++++++++++++++++++
 net/core/rtnetlink.c         |   2 +
 4 files changed, 181 insertions(+)

diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index 1f0710eef185..d469aba057c7 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -5169,6 +5169,7 @@ int dev_mc_sync_multiple(struct net_device *to, struct net_device *from);
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
index 08528ca0a8b3..b69565f8ff05 100644
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
@@ -1180,6 +1184,179 @@ void dev_mc_init(struct net_device *dev)
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
+	cb->seq = READ_ONCE(filter.tgt_net->dev_base_seq);
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

