Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC61C3B6362
	for <linux-kselftest@vger.kernel.org>; Wed, 13 May 2026 18:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778697391; cv=none; b=LYQlh7gukGrGVZyUtf55UteCTzY5pxXhvcARaE2ItUJljC5kLcwuvJyEqNaBEf7BkwqoF1RtFIdipMlGlD7QkVMY1KQYkgRpgcIVEQV8evvqxJajUZ1PttDCJKcK0LDYHMJzhYeoBNu6PgXiKf+yaTeIy2BNKHUWNPNdt+K9gbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778697391; c=relaxed/simple;
	bh=kkNx7pBIe4lTrSygNXIC+r7fP19o5wlqxg31cX6buFg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WFekEZzEkiBrJh5/pQIaz21HcAILJK8AzpGAfCHxxviAOJ7esCUb35MaqhaCJNhC4kWFJOqyW0oc3M5ykW2MT+xA+8Sz1wg/TNDFsk1vtXNrX+/xjgDnkCXI++jvYpcyxUkaaTofJJyi35Gq+ZOVwHC8amVoHze2XXSqIzOgH5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ovn.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ovn.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f68.google.com with SMTP id ffacd0b85a97d-449de065cb3so6533441f8f.2
        for <linux-kselftest@vger.kernel.org>; Wed, 13 May 2026 11:36:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778697387; x=1779302187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j17dyAXjVQ5kVJZNPUptY+dBBjRJ1RjAOk+0kE7NMQ4=;
        b=c1cZavbBP1U4m/Q8QNFM2fzKhgy1aZ1au44AvM1A9jA4LXGuSExGdCwTC3kKXXQwmO
         Tgn3CLOS3ieGvwOtdKORcI8kG/hVX6n54oIOwZBgEbYqXad83PKsdmdng+dUq4hRoBua
         Z20H1qhwVdJ9nTUE57F6hs43hbsiVbARu4LzdAX5yVCr1j2pRLlfzMwUs3dOb7ElerpR
         m2QYpK/RdPeuMuoNZICPx6W0bSW7J9Sl8JJ6/0sbSSn/1bL/HTd8LSORXjNBKGcd7G/I
         i0TQ5678fgq4kmtJ+zGbpEKuyL3/oAxwmOOPYOhdKnHubY5j6SUkQcQx3PX10j6FAPcB
         AO/w==
X-Forwarded-Encrypted: i=1; AFNElJ/lppHtVgGN4KOwmQ7FgqksfmoufMyYBhh7Dv4GUHFv08DBSnCji74z9HqyZb6s9R4W8N+AiU1SGRx0a9J/gwA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjJ9QRyTjwAH7PGRwJZjxN3HLFe6v2taYkPu88TcG0BRUCG6lU
	VcHk7wArM43mUHYkZSEVJn1f8QmmIxteUeEFQEF2GDJ1a4xFRDdkt8e7
X-Gm-Gg: Acq92OFc2LHVyktMWRoSQvQ9EM/Thnzhy5FrMKqlyOc1ErvEQ28FLW3V6mYUZ4aEwwy
	yHIK1xZH5BQvEsKH/3OWocLx+0JsBXmGk5I1lvGEHSIwoY5R9dDJLxWsw4sqSq2VdiCDdwjMV8A
	FDZiNOJDPd8ouH2A35xuW1NF7hvHoUB0VSBOITiJ21Ahmrcvc94QmSBeDvLKbJd0P/tdPf4hup0
	dUdKC2khv5RuXojF2TxcWHExyDTv6kZTCDMi+H0awsP2SNfo71zvFm/0fIHpiocd2jGAnjjeQ8r
	lGoCP8NEeFI+05GKA2PzIre8aXa2fENuj7cyzr3cWWBnCscHoUmOz6ye5hPmEzjUOyzdU2z1l9B
	osaRQbCd5hhppUB/NQ5YxxzAgMy6Xc67ypFDqHrdhOdeCHRbi/eJlt2Dtto451hont0GjL0NEVk
	JuLql86vo2piaokaj1AN2GoZv9qZ10MGQy82U6leWlyM660hGaMKZtTl6m/yC5/OjGOgRsWw==
X-Received: by 2002:a05:6000:1787:b0:452:d03a:7aad with SMTP id ffacd0b85a97d-45c7b7630famr6803975f8f.36.1778697387064;
        Wed, 13 May 2026 11:36:27 -0700 (PDT)
Received: from im-t490s.redhat.com (37-48-40-237.nat.epc.tmcz.cz. [37.48.40.237])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a6454sm720609f8f.34.2026.05.13.11.36.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 11:36:26 -0700 (PDT)
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
Subject: [RFC net-next 4/6] net: geneve: remove unused geneve_dev_create_fb
Date: Wed, 13 May 2026 20:35:24 +0200
Message-ID: <20260513183559.2141010-5-i.maximets@ovn.org>
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

The only user was vport-geneve in openvswitch and now it is gone.

Note: since it's an exported symbol, there is a possibility that some
out-of-tree module is using it.  So, alternative is to deprecate it
instead by adding a warning if it is ever called.

Signed-off-by: Ilya Maximets <i.maximets@ovn.org>
---
 drivers/net/geneve.c | 48 --------------------------------------------
 include/net/geneve.h |  5 -----
 2 files changed, 53 deletions(-)

diff --git a/drivers/net/geneve.c b/drivers/net/geneve.c
index b36fad8337245..153b15e4ef569 100644
--- a/drivers/net/geneve.c
+++ b/drivers/net/geneve.c
@@ -2364,54 +2364,6 @@ static struct rtnl_link_ops geneve_link_ops __read_mostly = {
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
index 5c96827a487e7..ba2c14d61e904 100644
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
2.53.0

