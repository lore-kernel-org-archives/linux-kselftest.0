Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E652222D0
	for <linux-kselftest@vger.kernel.org>; Wed,  9 Sep 2026 01:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788917672; cv=none; b=mygJyODycOf8mfeJibqcHR4WiJkNdjPBXFhYiW2FW7v09IULcc1XeVXQOduplCoTyKTFmmodKbj8n/OVy9gVwbzrdUnxy+U8BZbXj8z4UAepHRhTAvRL5wUuVCLSxSc01u+P5K2DK5dM+52defD08Msw9wTVylTjpwJ4nsLKvTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788917672; c=relaxed/simple;
	bh=MryJzkOFS4Eyctgw5MhZuUjVFzp0WImD/5hkAH4treA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U4zEPrDtx/s/b5aPbvlNuZnbW2IlUtjRqnznNBGpJHd0XEGoReUIBR2ajYED7fqLyHLxXFEYf01jRyWY8YiErLcJht6CSd5YppE95M5RzCahwMGteKDGIjjXUsXINnOylAQl6N+09KG5x/68ChkG1v58uqcwBWxuEQ+1SbjZk0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qsnKTrUA; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qsnKTrUA"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2dcff8f44f2so1449665ad.1
        for <linux-kselftest@vger.kernel.org>; Tue, 08 Sep 2026 18:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788917670; x=1789522470; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pIa3fiUNjaImZ6gnWNLkkYF/uSpKIblbnrtQvAPjzxY=;
        b=qsnKTrUAb1EHhWyJdST78yvQPLL0mx/R5xcdMuIDmQVHXiX3APGr2ik3ZAAVoyJY7l
         VxxUNJcVJUkaYwVWytNx+zI19IbdB+I9P7F0qQwlcaL8/pG+0xLX9FWGOJ5CBM+P5EtS
         gi6k/bCcd5fIKSi7Up6NvJX5FazCVxGjvCkgMLEoNWaTuDZsukyhu/GhMGCeeY+Su30P
         m9lZVA9pSSmv1QE8iB11juB88QI4KlTKO8DsXXVBUDqd7TL1XgNTawuPnkFhfAwIVirl
         ullfnisJNyjZBKUmTFRIxnCz9E8439Cq9q8KM4qEq8Y2dM+l6U6X4oQj6LUSqGmdwQYN
         Ofdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788917670; x=1789522470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pIa3fiUNjaImZ6gnWNLkkYF/uSpKIblbnrtQvAPjzxY=;
        b=gwZuh8zkXi7B0ZMi1R2JsSjsI9vIJ8K9sbWfTJcSL2Ux/gBNVxEtdbF73q5uyxnmuO
         CstZeoA2u/liqj4YJmsQrDKgVoMr9zMY03YHkTtc202E6dgln5yV3+HIobHYRb5e6FKk
         +c3Fauh3NG9Oz730hkN158wKnh4a/FcpjkGL9QJkEUiKBIXU1RCpqxpUsslVz1KucIg+
         z9MuvRzmQlKvRtMbKzV5BPF7ORvR3K08EQFq04efdn1aRPvTLbEF0PGmf6Z4CMxT39mP
         4eeTj3sJc4IJaUahTcHlQuN5EFtmZsgfMhkTVrex3/4KUQQjYmYBWipOxVbLjcxMkxhY
         LieQ==
X-Forwarded-Encrypted: i=1; AKwUvBzIiTbaMvFOPS2Ji/4dt2ln/1JOaWY7t1Uh4O6sHOVsvrQgGG0xoRxUVF8YMcIMwvXi9pe5gNegsrxMqdDHEuk=@vger.kernel.org
X-Gm-Message-State: AFuF++n0MIE4sqmZixRKqOS2ThA3KsPBLfE4nMa+shOVRQALQSEyTqnT
	EM4HOOXLE3yPHAf4NlXA7V4H9+JqW/LoXLL0lMgSvzqCk1UEGKArCAbX
X-Gm-Gg: AYBFou0ZH8Xl8A1GM/WprxSnjksxzu3TSqNV+8KCCPU5XgCVVn6YZFHnUEOBlNnvkFf
	BGUJEfUZFAjdm0X/CVl5UGQLE1Ru1rd83Q2pfYgXG0teeom2g7iCNEpdSlAcTLg9zEr8kEBaLX+
	QVTXuKOo+tRYZfViIzOegdMLYw0hXZqn7nuDTkCHO/q59xtzohG2JpZ0PXKJ5x4OgIYPOCAUz7+
	WRj0brv7/lRx35kVBcY+03Cosixky7TluUNU9J+7xHoBHn8yuHpWTRAinGZu/suCdgwTTUhSf+u
	+LGoKCtOseEi3/p3Cy/IFyRbsE+BnEjwxYNZyjwQM+P56PQjUpRqqdCQG5nMvy1IDh9sRNsE/mQ
	jvomezK29CfY0K3gTk3gkaiav2IyK2CRaYT+2a7RWcvDrtyiCoRGo2XGm1pZQXzMZsit11c79wA
	/HxPQO4TWS2Kt2rASV2iJbn9vrfw07lDM6m4rQqiNj3+6FFKX831dof2Mt8WywbNI9AzPe/d5J1
	v0+Oymg2RjpmKn9TGz0dj3odJaJUM0QPzmXn+jDM2WaD+CNijH33i53tNjXHg==
X-Received: by 2002:a17:902:70cb:b0:2d8:d4cc:5bb2 with SMTP id d9443c01a7336-2db1286c86cmr350159495ad.18.1788917670168;
        Tue, 08 Sep 2026 18:34:30 -0700 (PDT)
Received: from m-upc-A520M-HDV.flets-east.jp ([2400:2410:3f60:500:574b:e1a5:307b:15c5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db63c00837sm27975145ad.40.2026.09.08.18.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 18:34:28 -0700 (PDT)
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
Subject: [PATCH net-next v2 1/3] rtnetlink: add AF_PACKET multicast dumps
Date: Wed,  9 Sep 2026 10:33:59 +0900
Message-ID: <20260909013401.14408-2-sigefriedhyy@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909013401.14408-1-sigefriedhyy@gmail.com>
References: <20260909013401.14408-1-sigefriedhyy@gmail.com>
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
  - IFA_F_PERMANENT marks entries added with SIOCADDMULTI
    (netdev_hw_addr::global_use, "static" in "ip maddr")
  - ifa_scope is RT_SCOPE_LINK

This covers every column of /proc/net/dev_mcast. AF_PACKET is the
family iproute2 already uses for link-layer addresses ("ip -0"), and
AF_UNSPEC keeps its "all families" meaning from RTM_GETADDR.

The default FDB dump also walks dev->mc, but only for Ethernet devices
without an ndo_fdb_dump of their own, so bridge, vxlan or macvlan
devices never show their multicast filter there, and it has no users
count or SIOCADDMULTI bit. Extending it would change "bridge fdb show"
output and add NDA_* attributes, while this dump needs no new uAPI.

There are no legacy users of AF_PACKET requests, so they are always
validated: prefixlen, flags and scope must be zero, no attributes are
accepted, and a non-zero ifa_index restricts the dump to that device.
The dump runs under RCU and netif_addr_lock_bh() and does not need
RTNL.

Signed-off-by: Yuyang Huang <sigefriedhyy@gmail.com>
---
 net/core/rtnetlink.c | 129 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 129 insertions(+)

diff --git a/net/core/rtnetlink.c b/net/core/rtnetlink.c
index 81c5a6104dea..b2febdb6915e 100644
--- a/net/core/rtnetlink.c
+++ b/net/core/rtnetlink.c
@@ -4566,6 +4566,133 @@ static int rtnl_dump_all(struct sk_buff *skb, struct netlink_callback *cb)
 	return skb->len ? : ret;
 }
 
+static int rtnl_fill_mcaddr(struct sk_buff *skb, const struct net_device *dev,
+			    const struct netdev_hw_addr *ha, u32 portid,
+			    u32 seq, unsigned int flags)
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
+	ifm->ifa_flags = ha->global_use ? IFA_F_PERMANENT : 0;
+	ifm->ifa_scope = RT_SCOPE_LINK;
+	ifm->ifa_index = dev->ifindex;
+
+	if (nla_put(skb, IFA_MULTICAST, dev->addr_len, ha->addr) ||
+	    nla_put_u32(skb, IFA_MC_USERS, ha->refcount)) {
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
+				unsigned int flags)
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
+				       cb->nlh->nlmsg_seq, flags);
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
+static int rtnl_valid_dump_mcaddr_req(const struct nlmsghdr *nlh,
+				      struct netlink_ext_ack *extack,
+				      int *pifindex)
+{
+	struct ifaddrmsg *ifm;
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
+	if (nlmsg_attrlen(nlh, sizeof(*ifm))) {
+		NL_SET_ERR_MSG(extack,
+			       "Invalid data after multicast dump header");
+		return -EINVAL;
+	}
+
+	*pifindex = ifm->ifa_index;
+
+	return 0;
+}
+
+static int rtnl_dump_mcaddr(struct sk_buff *skb, struct netlink_callback *cb)
+{
+	struct net *net = sock_net(skb->sk);
+	unsigned int flags = NLM_F_MULTI;
+	struct {
+		unsigned long ifindex;
+		int addr_idx;
+	} *ctx = (void *)cb->ctx;
+	struct net_device *dev;
+	int ifindex;
+	int err;
+
+	err = rtnl_valid_dump_mcaddr_req(cb->nlh, cb->extack, &ifindex);
+	if (err < 0)
+		return err;
+
+	rcu_read_lock();
+
+	if (ifindex) {
+		cb->answer_flags |= NLM_F_DUMP_FILTERED;
+		flags |= NLM_F_DUMP_FILTERED;
+		dev = dev_get_by_index_rcu(net, ifindex);
+		if (!dev) {
+			err = -ENODEV;
+			goto out;
+		}
+		err = rtnl_dump_mcaddr_dev(dev, skb, cb, &ctx->addr_idx, flags);
+		goto out;
+	}
+
+	for_each_netdev_dump(net, dev, ctx->ifindex) {
+		err = rtnl_dump_mcaddr_dev(dev, skb, cb, &ctx->addr_idx,
+					   flags);
+		if (err < 0)
+			break;
+	}
+out:
+	rcu_read_unlock();
+	return err;
+}
+
 struct sk_buff *rtmsg_ifinfo_build_skb(int type, struct net_device *dev,
 				       unsigned int change,
 				       u32 event, gfp_t flags, int *new_nsid,
@@ -7251,6 +7378,8 @@ static const struct rtnl_msg_handler rtnetlink_rtnl_msg_handlers[] __initconst =
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

