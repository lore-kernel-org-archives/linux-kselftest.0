Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C8557D204
	for <linux-kselftest@vger.kernel.org>; Wed,  9 Sep 2026 13:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788960788; cv=none; b=SMlJCmMsKhT+H9kSSoMHZtQ62/7oSqvp/0ka8hGj5PmmaT/Qp3iNo92ywJF7phPHjE7BuCYT6wmcADayTS7sujTXbMwaIKEzo8OxgFXt47fNEyYqrAPQJBuPcIYQEyWADOYEDRjCd0+aix9WSTcC3Wzaf+33yorReyq6+jw8AJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788960788; c=relaxed/simple;
	bh=d0JN3CPY+wwbclt55K3zNyF0YPxBkBKtEyaiVDMzDT0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AXXfQEVDmQUC/BiwF4PRrHteHQ41oiTnsi5AyEUeFdwLFsdxbvIGNw75upyDKK5Z+zobKCkgp7QBLyKu8X10xaY+ZBBa2rddfik4DIEmsC+4+g8tlmZIX7FBI248yepjr5+ARIZkk/CE+r3bKdscCBHDg05YZcFOibNmdBoRyVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kIdhTG2n; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kIdhTG2n"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ce98cb8165so55802725ad.1
        for <linux-kselftest@vger.kernel.org>; Wed, 09 Sep 2026 06:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788960786; x=1789565586; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DKI8rDmA6EtYV/uNKWMFCp8uKMhJUcgA3sH9u1D+As4=;
        b=kIdhTG2nbM4ZVlxVEmvTjyuomuxTq5OO2Q0mT0Eiw8/kx6gnmezGRL9aKTPV0KWTW4
         O6HPcl37RucjOAm0ffmVoutSfroeXHJmEg+dJTgBVsTSQHpQUfNW3dcnQjTS6kzgRP1X
         LxdkIbmWVVsCfxzvekvvQYDoZfEP/065KRCU4QBESYapR0VTBkH9tzvqKEkUduEtr9qe
         mxO2D0oWp6NAFhgLB/8tF09Ie+Q+klkJykxIHNKARSKllI7QCIqZPvJ2fkrK91R1dNYN
         tcPPPg41eeWOR3eZ/l+ihuukXgLn2iN5i+X0+bVfKpAsp7fPyGuu6b7GGYDAMo+E10sd
         etuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788960786; x=1789565586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DKI8rDmA6EtYV/uNKWMFCp8uKMhJUcgA3sH9u1D+As4=;
        b=PKcHzzZe5oGGUAXJAFe0uao6kTQnChiLd/RTz5pgc+0eqicLmRSggce50mkoVbF1HA
         apNKjcvTYfuCtez/AGN0cULmqEzlCVDA2Pu+8DhuyXDJH76dDex1GtdXmYTVvHG6r/OH
         hEEHZSHE+s8JHMXsTQb4a5GW9JKG49FT9M5QcByQfHxBXEwh5uuszMrmZzPi4nq3N93O
         /pnOO9YB6G37xnEQWrSNdUpAZ8sqrUdgRIBeKTJKlSjiDyWYpU6VDzP78tT54Eiyt41O
         xrmkPFLv2LyFfSOZrOSdQQGvL8+uhTv+g+E27rneyVJ+7WABURAu8oZEDyFlm85SXn9O
         iioA==
X-Forwarded-Encrypted: i=1; AKwUvByc62ovCF0O9SH1X85No4XYWDKvNuiCEExKkWbWEPZxoZBXlZGSev4TA44d5jTgsEoq/kgO34+1M3u263RFq60=@vger.kernel.org
X-Gm-Message-State: AFuF++kj1qffHhd/pljqQHofuwuNk6SwgOfwoUyNH6UwuU0Vn0oIsU04
	x/7qsfolg4fS0b7qo6cgNRuowZXyLJe+6RCHSgcrwNuyf3upnadBCSFR
X-Gm-Gg: AYBFou2DXgzV8Bx6EhIFWntJ7szqsBi+j3DF45cfEbr4BaSLgAL5LgrIOHGU10M/lEo
	LIYqOr7n4lnsRkpMgSFlW8KBx6Gg/mQp3DQe0UlO+mmvNavARFusKeDor9pE/xu2TotuWqgiaEy
	UKOAzwIRk0JBI2peK2MPPNyyNVaLEGNl48U6aMMjjJQT8uCwAY6Q8u4IM5INy15qCO7rsHIMCYb
	fjwVUvnAIPKYzCd/jiYmzCvkJYHA67zHDvoOd6SJi1I2nPN9KmZjQHxuVLgWsDjC5ihyoZPNfaT
	/KU46OBOFbfuhoUBE4s69tpTnZA2ab9k+smrMFNYhwFnsLjt1HLtOVAoZKLK3+VX8lvTx6l2uH+
	VsNc/+kLpQY/v6y1lulopPrDmGciIRyraiuxlQGIgfcxjYFFbn1PIY+AULzi3e9lfegQAci0jOW
	zJYQ/Nf7Yi89+Ik1+uoHkJkRLwm5YUjWRl52cRWmdcTVd7xVLUHDR918JuPWhLK2c8EEpNCuOD4
	04eFt1/yAgkhjVX99eWgFYKgoA8rWwoyv2cPFDlGgyAusszMWY3QceWhSTlfQ==
X-Received: by 2002:a17:903:19e4:b0:2d7:1cbd:9ceb with SMTP id d9443c01a7336-2dafb0af1f3mr365604135ad.12.1788960785785;
        Wed, 09 Sep 2026 06:33:05 -0700 (PDT)
Received: from m-upc-A520M-HDV.flets-east.jp ([2400:2410:3f60:500:574b:e1a5:307b:15c5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14ae8af3sm72564185ad.80.2026.09.09.06.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 06:33:05 -0700 (PDT)
Sender: Yuyang Huang <uyoko90@gmail.com>
From: Yuyang Huang <sigefriedhyy@gmail.com>
To: Yuyang Huang <sigefriedhyy@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	David Ahern <dsahern@kernel.org>,
	Donald Hunter <donald.hunter@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Ido Schimmel <idosch@nvidia.com>,
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
Subject: [PATCH net-next v3 2/4] rtnetlink: add AF_PACKET multicast dumps
Date: Wed,  9 Sep 2026 22:32:45 +0900
Message-ID: <20260909133247.113923-3-sigefriedhyy@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909133247.113923-1-sigefriedhyy@gmail.com>
References: <20260909133247.113923-1-sigefriedhyy@gmail.com>
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
family iproute2 already uses for link-layer addresses ("ip -0"), and
AF_UNSPEC keeps its "all families" meaning from RTM_GETADDR.

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
 net/core/rtnetlink.c         | 165 +++++++++++++++++++++++++++++++++++
 2 files changed, 166 insertions(+)

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
index 81c5a6104dea..f54e9cb3bf30 100644
--- a/net/core/rtnetlink.c
+++ b/net/core/rtnetlink.c
@@ -4566,6 +4566,169 @@ static int rtnl_dump_all(struct sk_buff *skb, struct netlink_callback *cb)
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
+	for_each_netdev_dump(filter.tgt_net, dev, ctx->ifindex) {
+		err = rtnl_dump_mcaddr_dev(dev, skb, cb, &ctx->addr_idx, flags,
+					   filter.netnsid);
+		if (err < 0)
+			break;
+	}
+out:
+	rcu_read_unlock();
+	if (filter.netnsid >= 0)
+		put_net(filter.tgt_net);
+	return err;
+}
+
 struct sk_buff *rtmsg_ifinfo_build_skb(int type, struct net_device *dev,
 				       unsigned int change,
 				       u32 event, gfp_t flags, int *new_nsid,
@@ -7251,6 +7414,8 @@ static const struct rtnl_msg_handler rtnetlink_rtnl_msg_handlers[] __initconst =
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

