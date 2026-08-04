Received: from mail-wm2-f11.google.com (mail-wm2-f11.google.com [74.125.225.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39BCC41378B
	for <linux-kselftest@vger.kernel.org>; Tue,  4 Aug 2026 18:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785867680; cv=none; b=LgqopL5t+YWatP6MNBqXTxIrP4qc2Pq4Y8CQTSqDGY7EX0wtsw6aWxE+punEjU+gXVsZo+KkLGZ4eVzVA3D8oXxYFURv2NRAHXYuJdgaRdMB04JbXD09DEQBEFT371oU0DRRtJlr7/dvTAIDLhmseSDK+uz9MgOlPz3wGZVO/h8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785867680; c=relaxed/simple;
	bh=wcSb3K/k15u+UVe7tC1mdNd8EoACds8Qbrbv2Hx8Aw4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LSbEp4pVNMiVsjKxF5xAyW1giLrBWE+cuGzdNhbypLVyINWeDoMyRxdarAfsZwJTAozAncLl9A5BofNU43j8vD64wk0pcwkmquQwvpHxtFzUccFk6j5Cp03pwf03RT1Tn883eJ9A4vOcg9Ld6VCABLsy2/JMFehUjVxWoHMqAuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ovn.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.225.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ovn.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm2-f11.google.com with SMTP id 5b1f17b1804b1-4994d67d2e7so225575e9.0
        for <linux-kselftest@vger.kernel.org>; Tue, 04 Aug 2026 11:21:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785867676; x=1786472476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ma4Ldq9UjxOPbQexWFI1LZ8qoNpbcnRDyoCVpCSFXuo=;
        b=Q0ZuyjEr/VCNlCuw8h9ZvVSWAe5j74lh3Idl9ye+eZ63dMniy8soyqtbKpl+KgWQID
         N3MqHgIJF1EXpMNb4c19wr69IYAfMtrXsACeiF+A5PR+CCuCF02eIe3WPxy+864GBI4n
         hg7mdJkn/Bb7oj0lBkXGBLMjjZOO1mItbTfNVQniEZ++ADeu/O9lbDqSSgTWMJ6Mzu3I
         RhrPa0a6C2SiFIZyS96zGJGhSTmuFsRXThky4sgfbqK597dDXMGEMx7sKSsHxX9x8ym4
         fuqMRGVChFX8gVk+vywLFy7YqeyTxc3Hzxrz9WqPOOATTesNOlbx83qQhbUkqsTFSBsS
         zG9g==
X-Forwarded-Encrypted: i=1; AHgh+Ro7XTnx9RMppCrYAuMDPby5eGiir69exwCnoO/Cpk/IqS+lSzKf7alPE0J5oUgHY3cM1jR9c/4U05dNnF86Uh8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAIGnii9ASq1+b2+tf0qjIj/wo6mm3wN9961nr3S661JXZ7rL1
	LbvTUwe5f/HfYEvNcHdBgnLNEw5RcN5TVpA+V/Q+QGN8v9fsBiyqqt8x
X-Gm-Gg: AR+sD13Mx54/immMgNisKn6CZG9QeHZGMrks66+bDnN+d6X5BCjupZdvsF0j/Repl2K
	WMPVfDI3DK0sHe2gJdqNIUDD1ap+VkOjlKEADEmZi5dulhZ95qIinmlJdP6N4g6HCb+e9zSGUA2
	ADPMJFaS8afmuxAa0FioqARUyHmifRVa64BPOsHnpBay0aRJM8EMHm3DOodv8DA42HtIxLqJkxC
	zMOwoNtWLTbxTEchPzUChLX4jU8HukykZkqNRBwuBPNcSlv+YWGPLD/fkjP6NetN7hx+kZMCxq3
	QdjbAMq6mrOcPeiSBykYRjLC46KfTcETh8qYcRuM3MNduAVKoD5YY3f0EM3zvmklPMNmvKeoqzh
	vMGkX71JgPKn7lfGgIrKIVH0FE9IV7GPi9cNICfESWvWywHZFO4rb8LEsXqlBiafy98lweHrtv7
	BGUURk+JDe1i7YBkzyXeogKMUwvtsyXCoYq2qbqEkvpDBXDCT7bV7aA/SrqtFF8lBpt+5ZbfuXO
	pUjs5/9W2YeQz5zRQ8vMWjQ7AOcww==
X-Received: by 2002:a05:600c:5251:b0:499:4dd6:3cc6 with SMTP id 5b1f17b1804b1-4994e73207amr3320315e9.5.1785867676079;
        Tue, 04 Aug 2026 11:21:16 -0700 (PDT)
Received: from im-t490s.redhat.com (78-80-108-129.customers.tmcz.cz. [78.80.108.129])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4994e4bf5c1sm4946925e9.2.2026.08.04.11.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 11:21:15 -0700 (PDT)
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
Subject: [PATCH net-next 4/6] net: geneve: remove unused geneve_dev_create_fb
Date: Tue,  4 Aug 2026 20:20:38 +0200
Message-ID: <20260804182049.2289754-5-i.maximets@ovn.org>
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

The only user was vport-geneve in openvswitch and now it is gone.

This also removes the last exported function in geneve module,
significantly reducing complexity of the locking analysis.

Signed-off-by: Ilya Maximets <i.maximets@ovn.org>
---
 drivers/net/geneve.c | 49 --------------------------------------------
 include/net/geneve.h |  5 -----
 2 files changed, 54 deletions(-)

diff --git a/drivers/net/geneve.c b/drivers/net/geneve.c
index a6a8978e3b81..0ab729f055ea 100644
--- a/drivers/net/geneve.c
+++ b/drivers/net/geneve.c
@@ -2670,55 +2670,6 @@ static struct rtnl_link_ops geneve_link_ops __read_mostly = {
 	.fill_info	= geneve_fill_info,
 };
 
-struct net_device *geneve_dev_create_fb(struct net *net, const char *name,
-					u8 name_assign_type, u16 dst_port)
-{
-	struct nlattr *tb[IFLA_MAX + 1];
-	struct net_device *dev;
-	LIST_HEAD(list_kill);
-	int err;
-	struct geneve_config cfg = {
-		.df = GENEVE_DF_UNSET,
-		.use_udp6_rx_checksums = true,
-		.ttl_inherit = false,
-		.collect_md = true,
-		.dualstack = true,
-		.port_min = 1,
-		.port_max = USHRT_MAX,
-	};
-
-	memset(tb, 0, sizeof(tb));
-	dev = rtnl_create_link(net, name, name_assign_type,
-			       &geneve_link_ops, tb, NULL);
-	if (IS_ERR(dev))
-		return dev;
-
-	init_tnl_info(&cfg.info, dst_port);
-	err = geneve_configure(net, dev, NULL, &cfg);
-	if (err) {
-		free_netdev(dev);
-		return ERR_PTR(err);
-	}
-
-	/* openvswitch users expect packet sizes to be unrestricted,
-	 * so set the largest MTU we can.
-	 */
-	err = geneve_change_mtu(dev, IP_MAX_MTU);
-	if (err)
-		goto err;
-
-	err = rtnl_configure_link(dev, NULL, 0, NULL);
-	if (err < 0)
-		goto err;
-
-	return dev;
-err:
-	geneve_dellink(dev, &list_kill);
-	unregister_netdevice_many(&list_kill);
-	return ERR_PTR(err);
-}
-EXPORT_SYMBOL_GPL(geneve_dev_create_fb);
-
 static int geneve_netdevice_event(struct notifier_block *unused,
 				  unsigned long event, void *ptr)
 {
diff --git a/include/net/geneve.h b/include/net/geneve.h
index 5c96827a487e..ba2c14d61e90 100644
--- a/include/net/geneve.h
+++ b/include/net/geneve.h
@@ -68,9 +68,4 @@ static inline bool netif_is_geneve(const struct net_device *dev)
 	       !strcmp(dev->rtnl_link_ops->kind, "geneve");
 }
 
-#ifdef CONFIG_INET
-struct net_device *geneve_dev_create_fb(struct net *net, const char *name,
-					u8 name_assign_type, u16 dst_port);
-#endif /*ifdef CONFIG_INET */
-
 #endif /*ifdef__NET_GENEVE_H */
-- 
2.55.0

