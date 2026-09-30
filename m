Received: from mail-pz2-f37.google.com (mail-pz2-f37.google.com [74.125.228.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D574CE693
	for <linux-kselftest@vger.kernel.org>; Wed, 30 Sep 2026 11:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790767762; cv=none; b=D8bodN76w97CWfbdnIQdNpjD7NaHjrFcM8bXkVf5wuoaRv/U25IHhd2kM+VRZeV+5Mo33VQCwI3mZDXKjx1N1y+aNQ6GwVesn/z2AcsO0HWO1yi5k4N9xGtipdbpbLL6BOe2QqgM/3aogqlmPc2vYQoOcE2SCxliu1/AHG5sMfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790767762; c=relaxed/simple;
	bh=GmJNgt3Mpy3bBf0+7ELIpP8xBmqTt3TosuNRBpFlqCM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j44Xe9XYK0bBODv1ryYM6CaWPcOP4Rr5RzwQwI1ZsSBGJdagSDYFOYAV1sRcGQvH5Qv2t3pg2rWKMGF0ls3IoPpZjnBQLSjnV7D0yU58hKZJAQEu0vffqbvdDh7Y9MyGkxskwKgfxjmUkpvw/hSC7Eg0WVva/V0WYZhv4e9FrTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nfrzTSVD; arc=none smtp.client-ip=74.125.228.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nfrzTSVD"
Received: by mail-pz2-f37.google.com with SMTP id 41be03b00d2f7-cc7d7111700so244420a12.1
        for <linux-kselftest@vger.kernel.org>; Wed, 30 Sep 2026 04:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790767760; x=1791372560; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q7dYiR7l2bP5ebNlfly5XdQRmSnDAaklCbnKS3zM4u0=;
        b=nfrzTSVDpghNIdfLC+VDlbj9JI6XLnHZgrTu5iF7etYA20wt8lZgEVDc7SlhXsiZ+l
         xWAzgdACuh8KTxMTGiu+z3ZqkXUIw2spRkBM3LqcqSNz7KOIfpsz03eGG+UYjMW/3LU7
         fqvm20zUVGQ2DUItc80B8XiXmx/wQHFrFYLNvs2tAuaqmQQappJV6qSsqFN0wAedxxOS
         X3AQW/bkFxm8D1fV+tl0mIS/ZBObX8Kz3R9UkUa/eqEN0d92GLjfVsSvKkaOfYOgeMu/
         zImLAekOvQZBlP837e2PQTCUF7ywj/WulBfXaluCGLpArNwQhtiH76FwXOo1rDK7q+XZ
         ZqFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790767760; x=1791372560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q7dYiR7l2bP5ebNlfly5XdQRmSnDAaklCbnKS3zM4u0=;
        b=SoSJTnzZ59/vgCdE3Q2awSrBvlHW1GWBt5oG85Q8nr9LO0sDh4LahJnlG2UNPiVRJg
         c43a590cZHSRn69Uzt5hAeaMvxei7qgFAACmL4pMmW7AvxV2epGFhoJKFMfHUa+0pyUx
         hUwnzyLtEJqsU6TAZuqqiAc1BlFL3kyxUYzi4arjOOnIvQ0T2zi2GSQFfCi44pLyQrvv
         x+hYheOzTfmF7MBi/La9F5J0M5PghfccP210gds/fFDcVMmR/5LC7y6i/HqqnBku3oNe
         +MThmsGYq2Wzq7NtVMyEGQUXjyqqdSFjUuzJE6r2n0gqNhvK+eSVOsIvc0Pj+uIT4TH1
         jT9w==
X-Forwarded-Encrypted: i=1; AKwUvBxAKr35KvapyjMK0QNDPjIdPoxIjVkJGq0Mkxlr2pFXkkRwR5KgsBG7EUaKpS/uquEo/TTVz+skawXQXn+aPNU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKeoyK7pYFikkAtILumC9GjVKrF0AAjKt6tUz22rv7ymw6IBC4f
	TxQe+pkRyvKdB0TPYGii9l748PDC7O4VmcNuz2ghCW3M+FwC2VKSXTEH
X-Gm-Gg: AYBFou07Y5FFYidKNzBhZgLmMhlwHZ3hFvHDX/LBVq84lK55Yw6TXBqMp3a7dMtj7HF
	lJrBd0tZBjhGjbEdr3LPKWSoeiL+SC7DwH5ElkxPokcpVOij+qDh8RssdKIUofG1M48rD8qG/2L
	HRn25hH9hGj05zvgM2LjCaZd4ytaVbIju+a6Wf7qZD3RTionKhLeLO4Cbh81RXtWsVfA50xmwOO
	VatidIs5JMs/cAtMuSmA6B3RgsU08/24rM6xIqngI40REB1m63dYVK6zq/BhH6ny05UR5imVmfA
	j6jvnG6O/gFuzBXlFldsCVdjcyCZ9q8RM+xsIrW/exbz4bYc6jjxcGIqrF0nUb9v4u6Yl++NIn5
	Zto5tHD3qY/NPJCUD50BGq05JujM07F0VIz4Ja/u2BIZXIF9r6qnAlhCDLpFq/Mhp4phMHAXNdW
	dYdLUG5/ai9ucahRwFOunA5LTcaluHSqmPkfA3V5zQqSbprLd7CjrykM+u658dB5fziJ++l7LBJ
	+Q1TI6JxCftiUtIguPI6oOw2kAx2woNRqxWj8araWrH7nMavhtqUFQ=
X-Received: by 2002:a17:90a:ec8e:b0:3a0:cb48:df6b with SMTP id 98e67ed59e1d1-3a4d1778967mr822069a91.34.1790767759486;
        Wed, 30 Sep 2026 04:29:19 -0700 (PDT)
Received: from m-upc-A520M-HDV.lan ([2400:2410:3f60:500:3fb:270c:7df4:18f])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc7dab46db6sm712637a12.31.2026.09.30.04.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 04:29:18 -0700 (PDT)
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
Subject: [PATCH net-next v9 4/6] net: add AF_PACKET multicast dumps
Date: Wed, 30 Sep 2026 20:28:40 +0900
Message-ID: <20260930112842.21323-5-sigefriedhyy@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260930112842.21323-1-sigefriedhyy@gmail.com>
References: <20260930112842.21323-1-sigefriedhyy@gmail.com>
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
Reviewed-by: Nicolas Dichtel <nicolas.dichtel@6wind.com>
---
 include/linux/netdevice.h    |   1 +
 include/uapi/linux/if_addr.h |   1 +
 net/core/dev_addr_lists.c    | 195 +++++++++++++++++++++++++++++++++++
 net/core/rtnetlink.c         |   2 +
 4 files changed, 199 insertions(+)

diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index d409c56a02459..6eabaa0b48e0c 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -5168,6 +5168,7 @@ int dev_mc_sync_multiple(struct net_device *to, struct net_device *from);
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
index 783c62895249b..948dc25635938 100644
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
@@ -1219,6 +1223,197 @@ void dev_mc_init(struct net_device *dev)
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
index e3444fd240615..204dc9040e3cc 100644
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

