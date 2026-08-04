Received: from mail-wm2-f8.google.com (mail-wm2-f8.google.com [74.125.225.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D663F4835
	for <linux-kselftest@vger.kernel.org>; Tue,  4 Aug 2026 18:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785867676; cv=none; b=b5RlGnUstd+wWZBFqVMIe81G2GsUZ6v7353RGbPVC/g9GGhGviZvV4mx858RTIpIjGPLEfw0hjgk8HOOGkbEx5ZpW2CiddltuKkSvKy2yhzIqn6A7B12iBFzb/82DMTcMOQ96FrrV+5z1FNNoZGbGlo2AQem7ZgZ2J46GQNOljI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785867676; c=relaxed/simple;
	bh=a8SmrdPBOhFaVHGjIGE+nJ9mAE15TX2//Td5MPkPBig=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YoGn1/KqJbVYIaeuUG3M5Sz32gDt9d9/HAEW75HY3s2t3hBV0KfxrqSPHWkgOM7OaZ24Q6y5tWsceQMq050LJcVBIcE2yw3bPe0h7EWqhBjkCbrkjsWH0a1RqK5cDemEKdOIiZQGi+ho1PuyMFr5cnuBsBOlb1ph7QMZpz2T+9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ovn.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.225.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ovn.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm2-f8.google.com with SMTP id 5b1f17b1804b1-4956bc73c0eso335915e9.1
        for <linux-kselftest@vger.kernel.org>; Tue, 04 Aug 2026 11:21:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785867673; x=1786472473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UdazOxfVZCXEswc4NNw89vK46WEsQsXKDlpQ9L9kFsc=;
        b=THVBxRFJ560hynoyN5fHGh4NhYgtZKpwamih8WIRg21SfQTh0TwWWAvVyWMAxOCEPn
         B/FescVKC2XooOAr3tqV8PA7H5qI0HtSQi0wLATK1JkpFoCHfuqhubJbJ34qyAjPnaDn
         46Vsb5mNVBYOsOEHi30soRQ98wJX+Ati7eqby89szmECUcO/jAR3pnRzBit1N+NgThUj
         3XU/e61JwvxmOhPkHhidwAhZuPKgYXwHpAOktXrZcoX2xaecbBuxZLfqPRSrrybQn9Qy
         BNjc5Y6Xnc38ZsxWsL62SOeVrvPIOtPusgKQUW224A3XaX3AG43yjc3Lk2QOGNStABKu
         L5rw==
X-Forwarded-Encrypted: i=1; AHgh+Rrlzm6m/fNSa5tMg4TWY4LiRsPlBKo9VGZt+H5LOGgAnnD8KYEMwdWCXzUZ5+06uBkILLr8kxvQyMcLH3EnkU0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJi57CRVzF9K5QD00qtnqfTvi8kmB8ThmaHuHVXwOBKi4aYboz
	kECr44iFd0mmTZlYW+jTZi1E/rOCPXYjfM5Uk7Gn6ZO/8B9uJ3WpLJx2
X-Gm-Gg: AR+sD112YmpPdYRqkLbHbdnusXEHEqeN94zbr7Gozd7gORrsIMuOiKwoj7msnR2vwEo
	NzCXT1p2aQcMHqifSyGISJH4BYWZNJ4kqqng9bb/nGy798m/EztXzZxkjqBlAaN56hG8kRDi5uK
	2CXi41SFZdn98XhjYFGGuRj87U+0U2EFywwRtwezPhWeaYJCORyCGEsiMbX9R0ot8J59JBkpiy/
	oVgQWGfG/Ln9vdcjjW/ovwzJTGWpVh5TAnoiWAQPjDXah59FThDqYxHEjz4uXo8C5jKjDyXmOyT
	J5WVW3GTshT6oGByN/998kiFwPTG/vPSgm+q5gcFMOOqDe1wKvV2C+P8QPH/RFw41H8nrUDomTS
	hTphX+Hr9wnH/U0xb5wd4r5h8RQTqcu/tyunkSPqbpJWk23doWo7AVQklkNwfui49QxP9qslf3H
	lCmXHRo1b+9NTYyiCNVsQoEzFpddt51hLnDhx3t6oJYao2D2PFpC0fGZVsF7JI7L6ZrBV64pf4p
	qUbJiOWC7UPavznmfIuaHuv7CeJOA==
X-Received: by 2002:a05:600c:4444:b0:493:a438:7f98 with SMTP id 5b1f17b1804b1-4994e7d4057mr1992825e9.18.1785867673003;
        Tue, 04 Aug 2026 11:21:13 -0700 (PDT)
Received: from im-t490s.redhat.com (78-80-108-129.customers.tmcz.cz. [78.80.108.129])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4994e4bf5c1sm4946925e9.2.2026.08.04.11.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 11:21:12 -0700 (PDT)
From: Ilya Maximets <i.maximets@ovn.org>
To: netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Aaron Conole <aconole@redhat.com>,
	Eelco Chaudron <echaudro@redhat.com>,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	Shuah Khan <shuah@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Fernando Fernandez Mancera <fmancera@suse.de>,
	Antoine Tenart <atenart@kernel.org>,
	linux-kernel@vger.kernel.org,
	dev@openvswitch.org,
	linux-kselftest@vger.kernel.org,
	Ilya Maximets <i.maximets@ovn.org>
Subject: [PATCH net-next 3/6] openvswitch: vport: remove infrastructure for separate modules
Date: Tue,  4 Aug 2026 20:20:37 +0200
Message-ID: <20260804182049.2289754-4-i.maximets@ovn.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260804182049.2289754-1-i.maximets@ovn.org>
References: <20260804182049.2289754-1-i.maximets@ovn.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since removal of legacy tunnel vport types only the built-in ones
remain.  So, there is no need for the extra infrastructure for dynamic
module loading.  Can be reinstated in the future if we need a new
vport type.

Note: It is technically possible that someone has an out-of-tree
module named vport-type-N that implements a different vport type.
At this time we're not aware of anyone doing that.  People running
out-of-tree modules normally just have an out-of-tree openvswitch
module as a whole.  And there are actually no supported out-of-tree
implementations of the openvswitch module known to the community.

Signed-off-by: Ilya Maximets <i.maximets@ovn.org>
---
 net/openvswitch/datapath.c |  6 +-----
 net/openvswitch/vport.c    | 25 +++----------------------
 net/openvswitch/vport.h    |  9 +--------
 3 files changed, 5 insertions(+), 35 deletions(-)

diff --git a/net/openvswitch/datapath.c b/net/openvswitch/datapath.c
index 57c83f05fead..34a15ef76a70 100644
--- a/net/openvswitch/datapath.c
+++ b/net/openvswitch/datapath.c
@@ -2331,7 +2331,6 @@ static int ovs_vport_cmd_new(struct sk_buff *skb, struct genl_info *info)
 		return -ENOMEM;
 
 	ovs_lock();
-restart:
 	dp = get_dp(sock_net(skb->sk), ovs_header->dp_ifindex);
 	err = -ENODEV;
 	if (!dp)
@@ -2363,11 +2362,8 @@ static int ovs_vport_cmd_new(struct sk_buff *skb, struct genl_info *info)
 
 	vport = new_vport(&parms);
 	err = PTR_ERR(vport);
-	if (IS_ERR(vport)) {
-		if (err == -EAGAIN)
-			goto restart;
+	if (IS_ERR(vport))
 		goto exit_unlock_free;
-	}
 
 	err = ovs_vport_cmd_fill_info(vport, reply, genl_info_net(info),
 				      info->snd_portid, info->snd_seq, 0,
diff --git a/net/openvswitch/vport.c b/net/openvswitch/vport.c
index ada316a61726..29ebeb164bdc 100644
--- a/net/openvswitch/vport.c
+++ b/net/openvswitch/vport.c
@@ -57,7 +57,7 @@ static struct hlist_head *hash_bucket(const struct net *net, const char *name)
 	return &dev_table[hash & (VPORT_HASH_BUCKETS - 1)];
 }
 
-int __ovs_vport_ops_register(struct vport_ops *ops)
+int ovs_vport_ops_register(struct vport_ops *ops)
 {
 	int err = -EEXIST;
 	struct vport_ops *o;
@@ -73,7 +73,6 @@ int __ovs_vport_ops_register(struct vport_ops *ops)
 	ovs_unlock();
 	return err;
 }
-EXPORT_SYMBOL_GPL(__ovs_vport_ops_register);
 
 void ovs_vport_ops_unregister(struct vport_ops *ops)
 {
@@ -81,7 +80,6 @@ void ovs_vport_ops_unregister(struct vport_ops *ops)
 	list_del(&ops->list);
 	ovs_unlock();
 }
-EXPORT_SYMBOL_GPL(ovs_vport_ops_unregister);
 
 /**
  *	ovs_vport_locate - find a port that has already been created
@@ -210,14 +208,9 @@ struct vport *ovs_vport_add(const struct vport_parms *parms)
 	if (ops) {
 		struct hlist_head *bucket;
 
-		if (!try_module_get(ops->owner))
-			return ERR_PTR(-EAFNOSUPPORT);
-
 		vport = ops->create(parms);
-		if (IS_ERR(vport)) {
-			module_put(ops->owner);
+		if (IS_ERR(vport))
 			return vport;
-		}
 
 		bucket = hash_bucket(ovs_dp_get_net(vport->dp),
 				     ovs_vport_name(vport));
@@ -225,18 +218,7 @@ struct vport *ovs_vport_add(const struct vport_parms *parms)
 		return vport;
 	}
 
-	/* Unlock to attempt module load and return -EAGAIN if load
-	 * was successful as we need to restart the port addition
-	 * workflow.
-	 */
-	ovs_unlock();
-	request_module("vport-type-%d", parms->type);
-	ovs_lock();
-
-	if (!ovs_vport_lookup(parms))
-		return ERR_PTR(-EAFNOSUPPORT);
-	else
-		return ERR_PTR(-EAGAIN);
+	return ERR_PTR(-EAFNOSUPPORT);
 }
 
 /**
@@ -250,7 +232,6 @@ struct vport *ovs_vport_add(const struct vport_parms *parms)
 void ovs_vport_del(struct vport *vport)
 {
 	hlist_del_rcu(&vport->hash_node);
-	module_put(vport->ops->owner);
 	vport->ops->destroy(vport);
 }
 
diff --git a/net/openvswitch/vport.h b/net/openvswitch/vport.h
index 636788b59907..930f1ccc8558 100644
--- a/net/openvswitch/vport.h
+++ b/net/openvswitch/vport.h
@@ -116,7 +116,6 @@ struct vport_parms {
  * before an RCU grace period has elapsed.
  * @send: Send a packet on the device.
  * zero for dropped packets or negative for error.
- * @owner: Module that implements this vport type.
  * @list: List entry in the global list of vport types.
  */
 struct vport_ops {
@@ -127,7 +126,6 @@ struct vport_ops {
 	void (*destroy)(struct vport *);
 
 	int (*send)(struct sk_buff *skb);
-	struct module *owner;
 	struct list_head list;
 };
 
@@ -191,12 +189,7 @@ static inline const char *ovs_vport_name(struct vport *vport)
 	return vport->dev->name;
 }
 
-int __ovs_vport_ops_register(struct vport_ops *ops);
-#define ovs_vport_ops_register(ops)		\
-	({					\
-		(ops)->owner = THIS_MODULE;	\
-		__ovs_vport_ops_register(ops);	\
-	})
+int ovs_vport_ops_register(struct vport_ops *ops);
 
 void ovs_vport_ops_unregister(struct vport_ops *ops);
 void ovs_vport_send(struct vport *vport, struct sk_buff *skb, u8 mac_proto);
-- 
2.55.0

