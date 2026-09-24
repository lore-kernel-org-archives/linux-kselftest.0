Received: from mail-pz2-f27.google.com (mail-pz2-f27.google.com [74.125.228.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34FEE32570D
	for <linux-kselftest@vger.kernel.org>; Thu, 24 Sep 2026 01:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790212574; cv=none; b=uxkXjGGOxFnmjeAKNay+4QWeNlDIetqY/ZRCkvr1zCgfPIXtq2PVVztW7Q2t3JGeC/OLFhcvS3kFxI0ohCO/mPJqnZQE9rX2Gy/62RlG+Gqylik0E3k89sLyKj8+RDMw1a25s/GS9aCqMHUAU2aWqQIa4mtgvH2Yo9pSyMVW1kQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790212574; c=relaxed/simple;
	bh=pUzIHe6PKdCyli8y/P+wHHn1T5uzUMBGKjqLmyj7yE4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cq188B02XS+fZDVAGPua6tX39oYG+IT3nGUCaxiKE8mGUueJDCbS3R5OqjmyRXR1iqCc45tE7nM0w+49F+BTBPHJaQhpEOcKXuKgAyEjF2ITuQKcuyQdlb5inUzJ01ZndZzXido1N31DTNx+h30Ksj2SCxAD/9j4K9KqxUblGcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VnsetaLA; arc=none smtp.client-ip=74.125.228.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VnsetaLA"
Received: by mail-pz2-f27.google.com with SMTP id 41be03b00d2f7-cc1cea50dc3so910363a12.3
        for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 18:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790212570; x=1790817370; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wTPtQHvracLD7v1fqRm5jaARHw5wOo55iDL/UXkgA5k=;
        b=VnsetaLA3m+JGSJcrYHtUoNVQdU/UV0skb1KA0cVVGDHK6qjgwNf8/UB/NseZ7/BpW
         agYr32+4lwqJZREJVQzZdSEF++SvK7nQGWylzkmrDfsAOR/UFsFI6WvX8aO1/ZRi7idy
         BA3aQ7W3Vw4oPaRMEJ3Cn54qc4i92NVgKgoo9UeplERoWaUzR5byxMnSw7QQVwk5oqE6
         8tfL+q4PF8FbSGaJcxIlhRifOCxZUphV+tjJTIRUr3qI3OpBhmti+cuM/L/+neKd47V+
         UXU2JHRYTtbkLrcc9V1wmtL812nhQjdN4QO2bHNB4mK7UHvubDNMG1vsCDnfDUmbRXsM
         Ucxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790212570; x=1790817370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wTPtQHvracLD7v1fqRm5jaARHw5wOo55iDL/UXkgA5k=;
        b=AP5Wn4n8Q9h9L200GmhBkIgNYyxGuKy60cg+fzmic56470i9vDCLfPt1nNvYORGznn
         IL/vhfX+45qjNKCFmml+rIzKXPSl4zqsHAHPOIVojDcsXHusfqQ5h0vs4pXvuUVHEmpW
         Xm3uwKXObHSBjLT7GQ680LuOQ+JrCwnf0XPTKz9irJQQ4Wq5dPwGsN5jiZe2BoaJH1uO
         8ZkR+8EpgMri3bfgMnn2lr1EgyJgq7d2QZns3FtlWFmDZVl4x7kSzuu9JTIANrFz/BNt
         /fAKaiXz2A0nuqyCroNzkE3xxfFMFUO/9kharhwqWcOK35t6MkftRljkiq27Tei83qWr
         lvcQ==
X-Forwarded-Encrypted: i=1; AKwUvBwggb0YYv2A3uT1Ayo/VMT55DAkovZRK47Uop95Rj5Nb7G2VGYCSgrNDGrv1XOCeLhlO3zvbDUovx7R+Ir/NWE=@vger.kernel.org
X-Gm-Message-State: AFuF++mSIkthOxJMrB326nqa2RazZFz0Xk/rf+adqLIQdJCm71vOAYHw
	IYi/LdcTnG6tB9Poa7zYuQjWoBz0jZxqtf3/CfQcyHS/d1SI/PZyy0Rj
X-Gm-Gg: AYBFou1gXETQTGG6yFbWZ4ulW6yEDYSa7WGVrluZcu4g3YHNPmb3zH4KhDf0UHbSfAD
	km4NBnECHAa+8iYbJ0gNKfCYwDYadzcdSo84GB7jOK7EbpIgsL0wglv5BaxBf5zhj0bR/9ZUsjG
	KnIfOMy3wfNi6UgaFl5FQyFjPLNVHiTXi34aZKz/49ImghoTi0jNQ9OF0b9mPsUGUQymUlJ1U6Q
	GcX2i3M3B+ajRlrkt4+eOu5tivyhk0OmNegdGTaBZT7tweoqnPTAr4sSSb4MIQJ8B1ukbUhCiTG
	1lvm2tE24U1dMzOL/vhbH6KrOviJ9jkwphCLSCRIrB/EepHhQbsM/8B+IwFbnwhwyDoqSAj40xz
	60LjEMY//3Obdd2wcvvCxd3Un6j2LtDnqXxvgbEuUhuf0FnMvm55TcMX2Ge3DcSMNlBGQKysSKb
	vzmGcD9CslzLzzLK+agZHJtmcCYiX4HmRAVPML63b4B4eOVi/OuzcV8QZpTfyuKqITLDL+cFEsf
	jl7Y8WVBdPMx3FBZ77haiY2wPmq3Z3YxXY24OHnWcm1e6gaI2OO31RHYg0n7e/FAMcr8NHTqvaV
X-Received: by 2002:a05:6a21:112:b0:3dd:a008:dc43 with SMTP id adf61e73a8af0-3de0e8ec1c6mr951256637.49.1790212570453;
        Wed, 23 Sep 2026 18:16:10 -0700 (PDT)
Received: from m-upc-A520M-HDV.lan (oki-109-236-14-10.jptransit.net. [109.236.14.10])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc75f3d5794sm1741392a12.14.2026.09.23.18.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 18:16:09 -0700 (PDT)
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
Subject: [PATCH net-next v7 2/5] net: add a generation counter for dev->mc changes
Date: Thu, 24 Sep 2026 10:15:51 +0900
Message-ID: <20260924011554.3494-3-sigefriedhyy@gmail.com>
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

A multi-part RTM_GETMULTICAST dump of dev->mc resumes by position, so
entries added or removed between two dump rounds can be skipped or
repeated. The IPv4 and IPv6 dumps report that with NLM_F_DUMP_INTR by
stamping cb->seq from a per netns generation counter combined with
dev_base_seq, see inet_base_seq().

Add the equivalent for the device multicast lists: a per netns counter
bumped whenever an entry is added to or removed from any dev->mc. The
list helpers do not know which device a list belongs to, so give
netdev_hw_addr_list an owner set for dev->mc only and bump the counter
of dev_net(owner) where entries are created and freed. That covers the
dev_mc_* helpers, both lists of a sync, the hardware sync helpers
drivers call from their rx mode callbacks or their own workers and the
reconciliation after an asynchronous rx mode update, while snapshot
and other lists have no owner and are not tracked. It is atomic since
the writers only hold the address lock of their own device.

Used by the following patch for the AF_PACKET multicast dump.

Signed-off-by: Yuyang Huang <sigefriedhyy@gmail.com>
---
 include/linux/netdevice.h   |  3 +++
 include/net/net_namespace.h |  1 +
 net/core/dev_addr_lists.c   | 21 +++++++++++++++++++++
 3 files changed, 25 insertions(+)

diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index 5d16737167ee..be3804cdbb2d 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -256,6 +256,9 @@ struct netdev_hw_addr_list {
 
 	/* Auxiliary tree for faster lookup on addition and deletion */
 	struct rb_root		tree;
+
+	/* Set for dev->mc, the owning device of a tracked list */
+	struct net_device	*owner;
 };
 
 #define netdev_hw_addr_list_count(l) ((l)->count)
diff --git a/include/net/net_namespace.h b/include/net/net_namespace.h
index 46b4c67e2966..d8c681ab5c74 100644
--- a/include/net/net_namespace.h
+++ b/include/net/net_namespace.h
@@ -71,6 +71,7 @@ struct net {
 	spinlock_t		rules_mod_lock;
 
 	unsigned int		dev_base_seq;	/* protected by rtnl_mutex */
+	atomic_t		dev_mc_genid;	/* bumped on dev->mc changes */
 	u32			ifindex;
 
 	spinlock_t		nsid_lock;
diff --git a/net/core/dev_addr_lists.c b/net/core/dev_addr_lists.c
index 08528ca0a8b3..18acd874fdbd 100644
--- a/net/core/dev_addr_lists.c
+++ b/net/core/dev_addr_lists.c
@@ -16,6 +16,19 @@
 
 #include "dev.h"
 
+/**
+ * __hw_addr_changed - account a change of a tracked address list
+ * @list: the address list an entry was added to or removed from
+ *
+ * Bumps the netns generation counter RTM_GETMULTICAST dumps use to detect
+ * changes of dev->mc between dump rounds. Untracked lists have no owner.
+ */
+static void __hw_addr_changed(struct netdev_hw_addr_list *list)
+{
+	if (list->owner)
+		atomic_inc(&dev_net(list->owner)->dev_mc_genid);
+}
+
 /*
  * General list handling functions
  */
@@ -126,6 +139,7 @@ static int __hw_addr_add_ex(struct netdev_hw_addr_list *list,
 
 	list_add_tail_rcu(&ha->list, &list->list);
 	list->count++;
+	__hw_addr_changed(list);
 
 	return 0;
 }
@@ -162,6 +176,7 @@ static int __hw_addr_del_entry(struct netdev_hw_addr_list *list,
 	list_del_rcu(&ha->list);
 	kfree_rcu(ha, rcu_head);
 	list->count--;
+	__hw_addr_changed(list);
 	return 0;
 }
 
@@ -487,6 +502,8 @@ void __hw_addr_flush(struct netdev_hw_addr_list *list)
 {
 	struct netdev_hw_addr *ha, *tmp;
 
+	if (list->count)
+		__hw_addr_changed(list);
 	list->tree = RB_ROOT;
 	list_for_each_entry_safe(ha, tmp, &list->list, list) {
 		list_del_rcu(&ha->list);
@@ -501,6 +518,7 @@ void __hw_addr_init(struct netdev_hw_addr_list *list)
 	INIT_LIST_HEAD(&list->list);
 	list->count = 0;
 	list->tree = RB_ROOT;
+	list->owner = NULL;
 }
 EXPORT_SYMBOL(__hw_addr_init);
 
@@ -612,6 +630,7 @@ void __hw_addr_list_reconcile(struct netdev_hw_addr_list *real_list,
 				__hw_addr_insert(real_list, ref_ha,
 						 addr_len);
 				real_list->count++;
+				__hw_addr_changed(real_list);
 			}
 			continue;
 		}
@@ -623,6 +642,7 @@ void __hw_addr_list_reconcile(struct netdev_hw_addr_list *real_list,
 			list_del_rcu(&real_ha->list);
 			kfree_rcu(real_ha, rcu_head);
 			real_list->count--;
+			__hw_addr_changed(real_list);
 		}
 	}
 
@@ -1177,6 +1197,7 @@ EXPORT_SYMBOL(dev_mc_flush);
 void dev_mc_init(struct net_device *dev)
 {
 	__hw_addr_init(&dev->mc);
+	dev->mc.owner = dev;
 }
 EXPORT_SYMBOL(dev_mc_init);
 
-- 
2.43.0

