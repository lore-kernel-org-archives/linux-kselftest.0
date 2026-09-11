Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F0643F4B5
	for <linux-kselftest@vger.kernel.org>; Fri, 11 Sep 2026 10:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789123885; cv=none; b=Lay+KytM2o3Awp7UKvuD/4K1mrJ+8udZ6H0AEBidW/KpFNEkZp/m7w0ScgRoV8hKPoprqWXIT9Y+4K+9OzsifOWZVmFGFsewXWKs86b/Y0+JqD47ip2N+jN+HF7ntXWQNEIPrQQ0cox16lPyXztrj8FsVb0fuutIjkdv6xf88zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789123885; c=relaxed/simple;
	bh=I5XpAezKwqA0a7OLMPF1mSa/Cc9/aDIf4fy/99/q+e8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fDhoc2lCy5ubnLlzgAEouEyCoBFayQn85Gvz9dps1B15mMf2515cxcLLPXt4tfFPhM+dp9Bk9sQxzk7mPWcOYm2qEdR2Y6zqLaYoRWRnIuDhbBIqgZG0S+tH9wkBK87rINsv4LVtKU6fUPIjRagQJ2yUmiP8XCeYtW7DnKa63n8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BeLsNWLK; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BeLsNWLK"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39b9184fa80so733625a91.2
        for <linux-kselftest@vger.kernel.org>; Fri, 11 Sep 2026 03:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789123882; x=1789728682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3taA9yuwOT/Ujh4g8T032qUOZDTcFedGxflnlAzpYYk=;
        b=BeLsNWLKJuC+BVHmU2GiDZGlA4yBiqYmedP0arNWOzS9xhEbr4FJekpm8z9keV3yoC
         v3d/VVWhsHIgAYC8Nh2hU8MeChktB6QJNa9/H9c7bIdYAN4PlgsK5vBWKDTEbSZr2C3Y
         1Rd4mBfiuMd6giab331aYsjxbvGvxJ2vYUku0rSy/uMPUDhm10QtzsjXjinmdiDSkh0U
         ZrNzSnPc2e1A6AVe+B3Qzlw0G23NV+McoVjUfwqIqnScfkvLLQUMYEwW96du1dJy+de2
         Ocx013pRM+0sgeYcFrraMVDEDYLCYQRxDl/zEeRkiMn6Sm4S8yoRYkHFa0eu0HeteU+O
         7UHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789123882; x=1789728682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3taA9yuwOT/Ujh4g8T032qUOZDTcFedGxflnlAzpYYk=;
        b=eDjKyAKUAM3SKZJc2Wvi/+4DNSXuGp7Ke+MedTHrZ1eMEsSjrDD9gTK00Wm0eeEZiX
         +QqXP06H2OgZVMKiojxdDTBIXUU5YX9fzALcMe84LiskSuJHI2IaH+Eh98r1AsweFTZ/
         Lbw05wePpDMSAprvZYB2K+a8ZRe/O82Ufiu9VP0LmzHel3MSZWiXVg9bn/Pe+DWGHxZs
         cCyPXTp15cZt1WlZbijzo1RDmzlxMcceqlAarHGXweN2WXV6QHK0B1XsWLh8JWjB+xuk
         ISJqn7zxgDqDnJmUDPq81ebXTml6l6tXdZ43aZuvC1E92cCnHlqoCAcgoMqH3EbQnnWw
         LYiQ==
X-Forwarded-Encrypted: i=1; AKwUvByg6dWLsTG5M/NYOl8C9aZzXf2iNPxuYaoiZqPW2VEv1AmKqi9A/pKNiORRqXQY5jRGWGumBbmAvtMHxhJhmyQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lxC9rap5hiMlLnK4FQK/Oj+tZCj/3doCANVzJ7HQ/Eg3lrdBC8
	0D+gjEOj2AJ58kov+/hy70KKFFk39y4xrWY0vfhH3FIT6IibsTTfeEXh
X-Gm-Gg: AYBFou09dYrjX1qS+1p3tM/KiCrmVVKvjckxNinuYKjX6+hDFXG8pW3Vc5WKBXWiAr0
	tos36b00/8unvF2GMC9ErIiMQjsMrfB1tKq95+2gPWOlLqCht4VufYEpwwNuDx/z4FDT3eb3SZN
	lKjlUMoaZPmGNBJrV6ybhrsi7+lrWEA8QhmZ2IshtMilf6hFZxS82MPTw0WsejN0m3mkOnyNld9
	APrS+lweHTREqVVPuBgxUU8XMW2fvVNR/2m0dJKpAlr8x/D0nUFGZPH5NbjHnu5cYP2EDhpG1Yq
	0pZxXY2t80uwV+bacMSsFAucv1grq7UUhpw5T+4THvbyCCfY8navyjclgRbKjv6Sovz4cTevO7d
	uwq2RM9hqPO+cPGMAuRT/DBG9JzgV2mddoL88o3rDcMGigk0YfuEO3NFPUKkruxcATCAlvr4Z4z
	mT7iNDWT0w9OTaCioShHHAuXBzoMj/+zaz4Dh9lFxDP+dNVJnCFBA9mMYrZOBwag7w78tNEo1Jo
	8HtWR5QOcj+wG3114Iz22blr9eNvKskTAj/XsUMCjdLUT8QPUlSuG3HNzc32JK1ka53ZTsz
X-Received: by 2002:a17:90b:380a:b0:36d:9e0b:3801 with SMTP id 98e67ed59e1d1-39d9bd63e1bmr5508392a91.8.1789123881561;
        Fri, 11 Sep 2026 03:51:21 -0700 (PDT)
Received: from m-upc-A520M-HDV.flets-east.jp ([2400:2410:3f60:500:f7e5:8b43:47c8:5245])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d94bafb3bsm4876004a91.1.2026.09.11.03.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 03:51:20 -0700 (PDT)
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
Subject: [PATCH net-next v4 2/4] rtnetlink: add AF_PACKET multicast dumps
Date: Fri, 11 Sep 2026 19:51:01 +0900
Message-ID: <20260911105103.7771-3-sigefriedhyy@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260911105103.7771-1-sigefriedhyy@gmail.com>
References: <20260911105103.7771-1-sigefriedhyy@gmail.com>
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
index 81c5a6104dea..d51d773b93c6 100644
--- a/net/core/rtnetlink.c
+++ b/net/core/rtnetlink.c
@@ -4566,6 +4566,178 @@ static int rtnl_dump_all(struct sk_buff *skb, struct netlink_callback *cb)
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
@@ -7251,6 +7423,8 @@ static const struct rtnl_msg_handler rtnetlink_rtnl_msg_handlers[] __initconst =
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

