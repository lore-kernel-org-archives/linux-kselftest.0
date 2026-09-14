Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB849298991
	for <linux-kselftest@vger.kernel.org>; Mon, 14 Sep 2026 01:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789350361; cv=none; b=G8zZYFGwXoY6Ud08+qk/w2KQ2tdCOu0Lz97W4Il/u/ZIav6xsnLdg2uzJTO913suIcGIJRjm8oI6ztQsd8Y2sAPnQk1731nhYKucKVtsJiGo98BGwn16PC8FtsjH6qM2wbzSAF2662DHFUU0n20/iHrva/q/lyVXvI+RQO7PIhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789350361; c=relaxed/simple;
	bh=u0+LHqsRMvkeRcvlOQLQGY6bbii3GrUfYb0QO4VI/wU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iRq7KU4zqI5e4FS3wxQ6dif0AJ129BwWOB8dPwneK2udQ+W1uhQ5XrmXM2s1pDQvK11xTwX8yUTyHGxkEcyQGxTkuE8E3M8Kjvp2xdWN5u4FBPF7YFzny2SGeLPNepj6XOPeKlLH/8JZW7MRQyJHAOkYbQO/qgL8AP6/A76vtyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ie5IfHVs; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ie5IfHVs"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d91ede8035so16081035ad.3
        for <linux-kselftest@vger.kernel.org>; Sun, 13 Sep 2026 18:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789350359; x=1789955159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jps47vrBc3Zp/f3MRaXWhHENFCXI5ZlVx0gprVz2+XM=;
        b=ie5IfHVs+kycFJT1nxXT9cS1k5Do4HuCRB3j/8td+fBHmdJOntYqxLFsHERXq7lSoU
         uTrVd4rCQeCL0npgTTH82s1GKRpbFVR0pNnlvShA4frmpfiLBgiQozb4ltUtgaccTzsX
         Syf2DgjFKbyqSEU46mVQVvkv0Gu0KU3phnKSy8EdpYSBpkqd9VlVjkwqBahtUSTqVyXa
         9laQs4TMjHVlBfN9NIQeq5eiRnc3Fq5WDpJaid4ehawdZtxU4JwHWZAnj+Dgnkp4/lXD
         qmAWtN091ARU7anvvjkZwcBUnWhFW3nb3WR4aaL/B9NqxKisxCUdpsrbXggmCr3v3SqQ
         qJoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789350359; x=1789955159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jps47vrBc3Zp/f3MRaXWhHENFCXI5ZlVx0gprVz2+XM=;
        b=WtPA4Mtq//eRdVXhFc5VOD43N9BBwcoRWIjhYSnJBQ9nxmBb2wZ3go8342chroSscL
         kUCSUHeSK3/3q4NAEyzErg3dd8wffrDpF8UuICMG6lBvzjoSumvudkUEGhmz9Rivmrfa
         VCPJMSPL4jIshqq5qqUDC3uxO+gKmFYuLqRyu4vevf24WX8EOWkSLLLLEBmiHQ/uYg1I
         19ziDMPAYUBE3axciU5YiyBzPmw572Gci/SLAIqs3A4q4Cy7S8T8ECjuqZpkUsME8nkV
         XIZGJbHxaYkGGnjDL05AVk9MITws78eiWiFRsfl9w/xJJfdbRpk0aXrL6qZMlcrRE0I8
         5Wxg==
X-Forwarded-Encrypted: i=1; AKwUvBzUCIsLv+pwpiOOGdIS9/vEywXkbFXW655JcHIbnfkQw+ciTVAEqbWI2rPgSg+y7zCkE48BC6pjbFspwjc3HDw=@vger.kernel.org
X-Gm-Message-State: AFuF++ljB2EEYvvz4nrhQmuY0PbZnUkVfoYJUzk9GK04CxesTKEw3EAu
	qTw9rabUJunaSTNdrVeSs9AXyqSAvSUngURUKNorpjJp/BD3vx6fYp25
X-Gm-Gg: AYBFou3QG0VIJc+Y/0RODitK+n3LPXj8y2P13i0IV9aC19Xuej2Y4OBnhakegDe8APH
	qmwrotqGCcPh6dQCmdhuqwMsyHPOfWdC19koZtqzSwQMduHZGZzpy9ShiPUcDbYoxprBI3oyGqG
	fddbgqYyvxLbixonY2waFNqHombjeEPkgcK9qC/+XRYRRN29ZI3WtXoSaqezK74kUl8ll7ZbFfr
	qGVhYvdfUWY2cRPiBEwFUUIdOduxer41casXeELafnLIE6TXX8H1y3EkPlAxDCN22XFX6famPEw
	KqY6UyVHGySgOc09uTQY0xmON7xTRzbwU8c3rvF1Y91Grrm+qF98Kc4pbfo0daIF2AhzVG4rUNF
	YWTBYo19rbV0ebt6W70GDGeBi4ScTfbie1Lv+yLPLw7JS8Y3izrYWZb4QQKg+SWNuQaCNVtllFf
	lkMSgpqwxeNfFUxv7a2hMzaPy1hsSFuPhHVfIxBetmo1NCPTb2XNVCgdzypxzBe3U09NmNP5yjm
	6wZqzqp5SkpNtFdO800Qdz2lQyDw83VwmlN2zJ0s6QXfybK
X-Received: by 2002:a17:90b:2e84:b0:39b:2b5a:8dc5 with SMTP id 98e67ed59e1d1-39debf8a0bbmr1077890a91.6.1789350359174;
        Sun, 13 Sep 2026 18:45:59 -0700 (PDT)
Received: from m-upc-A520M-HDV.lan ([2400:2410:3f60:500:fd07:4a24:951e:c85])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d951d1056sm17513403a91.7.2026.09.13.18.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 18:45:58 -0700 (PDT)
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
Subject: [PATCH net-next v5 2/4] rtnetlink: add AF_PACKET multicast dumps
Date: Mon, 14 Sep 2026 10:45:37 +0900
Message-ID: <20260914014539.5015-3-sigefriedhyy@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914014539.5015-1-sigefriedhyy@gmail.com>
References: <20260914014539.5015-1-sigefriedhyy@gmail.com>
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

Handle RTM_GETMULTICAST dumps with ifa_family set to AF_PACKET and
report every entry of dev->mc in the existing ifaddrmsg format:

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

There are no legacy users of AF_PACKET requests, so they are always
validated: prefixlen, flags and scope must be zero and a non-zero
ifa_index restricts the dump to that device. IFA_TARGET_NETNSID selects
another netns like the IPv4 and IPv6 dumps and is the only attribute
accepted. The dump runs under RCU and netif_addr_lock_bh() and does not
need RTNL.

Signed-off-by: Yuyang Huang <sigefriedhyy@gmail.com>
Reviewed-by: Nicolas Dichtel <nicolas.dichtel@6wind.com>
---
 include/uapi/linux/if_addr.h |   1 +
 net/core/rtnetlink.c         | 174 +++++++++++++++++++++++++++++++++++
 2 files changed, 175 insertions(+)

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
diff --git a/net/core/rtnetlink.c b/net/core/rtnetlink.c
index be9d1625bac3..5f3e692a828b 100644
--- a/net/core/rtnetlink.c
+++ b/net/core/rtnetlink.c
@@ -4571,6 +4571,178 @@ static int rtnl_dump_all(struct sk_buff *skb, struct netlink_callback *cb)
 	return skb->len ? : ret;
 }
 
+static int rtnl_fill_mcaddr(struct sk_buff *skb, const struct net_device *dev,
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
+static int rtnl_dump_mcaddr_dev(struct net_device *dev, struct sk_buff *skb,
+				struct netlink_callback *cb, int *s_addr_idx,
+				unsigned int flags, int netnsid)
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
+		err = rtnl_fill_mcaddr(skb, dev, ha, NETLINK_CB(cb->skb).portid,
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
+struct rtnl_mcaddr_dump_filter {
+	struct net *tgt_net;
+	netns_tracker ns_tracker;
+	int netnsid;
+	int ifindex;
+};
+
+static const struct nla_policy rtnl_mcaddr_dump_policy[IFA_MAX + 1] = {
+	[IFA_TARGET_NETNSID]	= { .type = NLA_S32 },
+};
+
+static int rtnl_valid_dump_mcaddr_req(const struct nlmsghdr *nlh,
+				      struct sock *sk,
+				      struct rtnl_mcaddr_dump_filter *filter,
+				      struct netlink_ext_ack *extack)
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
+			  rtnl_mcaddr_dump_policy, extack);
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
+static int rtnl_dump_mcaddr(struct sk_buff *skb, struct netlink_callback *cb)
+{
+	struct rtnl_mcaddr_dump_filter filter = {
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
+	err = rtnl_valid_dump_mcaddr_req(cb->nlh, skb->sk, &filter,
+					 cb->extack);
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
+		err = rtnl_dump_mcaddr_dev(dev, skb, cb, &ctx->addr_idx, flags,
+					   filter.netnsid);
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
+		err = rtnl_dump_mcaddr_dev(dev, skb, cb, &ctx->addr_idx, flags,
+					   filter.netnsid);
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
 struct sk_buff *rtmsg_ifinfo_build_skb(int type, struct net_device *dev,
 				       unsigned int change,
 				       u32 event, gfp_t flags, int *new_nsid,
@@ -7256,6 +7428,8 @@ static const struct rtnl_msg_handler rtnetlink_rtnl_msg_handlers[] __initconst =
 	{.msgtype = RTM_SETSTATS, .doit = rtnl_stats_set},
 	{.msgtype = RTM_NEWLINKPROP, .doit = rtnl_newlinkprop},
 	{.msgtype = RTM_DELLINKPROP, .doit = rtnl_dellinkprop},
+	{.protocol = PF_PACKET, .msgtype = RTM_GETMULTICAST,
+	 .dumpit = rtnl_dump_mcaddr, .flags = RTNL_FLAG_DUMP_UNLOCKED},
 	{.protocol = PF_BRIDGE, .msgtype = RTM_GETLINK,
 	 .dumpit = rtnl_bridge_getlink},
 	{.protocol = PF_BRIDGE, .msgtype = RTM_DELLINK,
-- 
2.43.0

