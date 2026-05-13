Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606953B3BE3
	for <linux-kselftest@vger.kernel.org>; Wed, 13 May 2026 18:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778697388; cv=none; b=KzuXpPvgGvQGN2zEdUrQGb8gNpsCIelzfgd0ikUjKoxunlk3cEf4guDrBcxvtoyRcCUuOBLLfGHxQKH1PUw2/0+/OBJrifKeagdNaMijkkziIFyusaITRPvW/OBt6EGan7szqkSmLDfweUUj6i5mdV0A+R71GMvOan9EVZrrXQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778697388; c=relaxed/simple;
	bh=+5u5jJ60v1xjveGW2ChiPGnJYtxZ0kG5T3OCYSA6QtY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cB7YLwNUptZ5O9yCGG0/bcHVCno9O3mz7bh338c6tvBMAuanw/Ky7r9LfWNGt7NnyGz03Zj+msD20SLURA/pZQRnERMejf8FIHS/tK6FouiBXAp/AAINVJMxvjU+SF5VmRcieuZZCgoZIAktjACxH0YqCtKm+gGdbmZqCS/iCpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ovn.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ovn.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-488ff90d6c7so63610295e9.2
        for <linux-kselftest@vger.kernel.org>; Wed, 13 May 2026 11:36:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778697385; x=1779302185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lFrGXmGkGqSJhTRhqyzlGScwr6w06YpxqqRUHTQ9L1A=;
        b=IY+G4WeMPK/gSEMYEJXVVtajx7qNb1BYPF0vBnO43rZs+uX1E5XdRxok+Ghlh3wo1b
         JwNB6cvst0kWVhdRE4S7B4Wrlzfv9v2q8Ft02Pg0onJh4JRPkN9ZNFFQSbX9iPsQnAkp
         hnOrLen0HQWs4tJ4bZWM4RLSrPIJ+UQEWWelkeM/xdPqszNaY6ybf8d5Dwjs+i4HGxsl
         s9k+h3qVAN/OGya08OHYcKdzGDD+DEx5xLQNLm0JrIFHm158phXh7rwI39cikSw6P3Ya
         ewAvChw0jGyQ53BOf6YJiPPR1qU7uAmfubWhjlrg8r0i6DNnAVO09OxMJ8AGQ4mMu3V+
         MnTw==
X-Forwarded-Encrypted: i=1; AFNElJ8uFGBq9pSN42heU683bbdlpbG0OmbGx+hhw37WbegnGK++vclDydaUoR86z0bUSCDUsk01TUXAz9tkna2G8TA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhyCw7H3/pD9PUHki3KEDlx3napNwJPHNrZrCJ003is1N3wtmM
	SZ6FgbhsN5JEpEmRLtbn1MnvpPXmUATEknso5h7RQ+5N40gaOvlt1fT5
X-Gm-Gg: Acq92OFMB5aNOGKQI0VCHwLI9Wj4wPdM61wvh/hWhd0n+2DZcXC8kEW99tCwmj2O9+x
	sufJbZhr5ZtKH6O55+51cd4dFj1kIRLSJ819yutPbcyVSRtr8AlyDTx0X484ddMuzE6F5E69VPQ
	oE8/DBOMggE54VQ1gTWNaS+cVWZzbqtIiyhbTW2mQmmhU/+DuDThmBuqMxtPS6eAY2W8kWML6mq
	VZwuGEXM2S5AKFL4ciEIS9necy7wpRebBrIQuYGyqK1/LInk4Ih98/acp6ZPhbfYdLDDkklvEYe
	lg/pHdkMr39eT3c9baEFO8RnLSlQfyL4UeTicRhdOYVLnjEEa1XKZP+Q+NxJ53gdpck145y9/gS
	qPT8wVQUk2j1SpO23aPgHN4EJjtB9wy2PUlGjuUHasOa/jiV0YTO1fHQ8mvymIeF3x/gdVPYFU8
	XI0KeWWJdTabgqLKPOOabMK+FeRSI6RRwYpwC+ilmoo5sr3YynUW3P6iZYCXY=
X-Received: by 2002:a05:600d:18:b0:48a:5574:3a5d with SMTP id 5b1f17b1804b1-48fce9bd5d1mr49631725e9.7.1778697384382;
        Wed, 13 May 2026 11:36:24 -0700 (PDT)
Received: from im-t490s.redhat.com (37-48-40-237.nat.epc.tmcz.cz. [37.48.40.237])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a6454sm720609f8f.34.2026.05.13.11.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 11:36:24 -0700 (PDT)
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
	Nikolay Aleksandrov <razor@blackwall.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Petr Machata <petrm@nvidia.com>,
	Fernando Fernandez Mancera <fmancera@suse.de>,
	Antoine Tenart <atenart@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	linux-kernel@vger.kernel.org,
	dev@openvswitch.org,
	linux-kselftest@vger.kernel.org,
	Ilya Maximets <i.maximets@ovn.org>
Subject: [RFC net-next 3/6] openvswitch: vport: remove infrastructure for separate modules
Date: Wed, 13 May 2026 20:35:23 +0200
Message-ID: <20260513183559.2141010-4-i.maximets@ovn.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260513183559.2141010-1-i.maximets@ovn.org>
References: <20260513183559.2141010-1-i.maximets@ovn.org>
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
Alternative to immediate removal would be printing out a deprecation
warning whenever a vport module is loaded, but I'm not sure if we
need it at this time.

Signed-off-by: Ilya Maximets <i.maximets@ovn.org>
---
 net/openvswitch/vport.c | 22 ++--------------------
 net/openvswitch/vport.h |  9 +--------
 2 files changed, 3 insertions(+), 28 deletions(-)

diff --git a/net/openvswitch/vport.c b/net/openvswitch/vport.c
index 7a9caacfd6ac2..ef2fff4353c0a 100644
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
@@ -210,12 +208,8 @@ struct vport *ovs_vport_add(const struct vport_parms *parms)
 	if (ops) {
 		struct hlist_head *bucket;
 
-		if (!try_module_get(ops->owner))
-			return ERR_PTR(-EAFNOSUPPORT);
-
 		vport = ops->create(parms);
 		if (IS_ERR(vport)) {
-			module_put(ops->owner);
 			return vport;
 		}
 
@@ -225,18 +219,7 @@ struct vport *ovs_vport_add(const struct vport_parms *parms)
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
@@ -250,7 +233,6 @@ struct vport *ovs_vport_add(const struct vport_parms *parms)
 void ovs_vport_del(struct vport *vport)
 {
 	hlist_del_rcu(&vport->hash_node);
-	module_put(vport->ops->owner);
 	vport->ops->destroy(vport);
 }
 
diff --git a/net/openvswitch/vport.h b/net/openvswitch/vport.h
index 636788b59907c..930f1ccc85581 100644
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
2.53.0

