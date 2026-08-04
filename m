Received: from mail-wm2-f9.google.com (mail-wm2-f9.google.com [74.125.225.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B312416875
	for <linux-kselftest@vger.kernel.org>; Tue,  4 Aug 2026 18:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785867682; cv=none; b=r1zl+GbroybRUpQciwYgQw4Bxr38stQx3w8y+d88LiR/QvuNaZSOTWONPQMIBaa+0kyUf40k6/rZI7M0bQiE3i/vujmomaM5ooP6CBqub4AjG1x/XFMzD9kUcFqNDlGtsp3d7slHUsq4DPs7Ul9IlANfXd1ePsuxpmKkeLECUFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785867682; c=relaxed/simple;
	bh=aR5Dqx7nLV6UJhWsi7R0KVezBsxZxoIrE8c2wQhRRGg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KXESo0CFnaBwWXnc4KcGJIFTwqMSQuoGAxoR2+8LA0AI81x9OOIs/t4CT/AYLTkT3mql935umwB+SJycMvof1In+DxFqbCteoQkYPb/w8+Rh9+QaieMOd5/P+OoSJ7GkTWLEFjiqLVg78oQ60S+KkGBoHp3sNRRKSKahCSPuR4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ovn.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.225.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ovn.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm2-f9.google.com with SMTP id 5b1f17b1804b1-49553b57612so201985e9.1
        for <linux-kselftest@vger.kernel.org>; Tue, 04 Aug 2026 11:21:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785867679; x=1786472479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VE80QWO3LvitUueRxl7+6P4HbTH8bsnyr7DnSj9J2KY=;
        b=JY5JKMEaGJQsGB58EezaHom9ng0054abek/RyNllcr73aqdvx/voXEBDpIBgBZ5rSu
         agHpNLLN3zih34hEEzEibN6QrdYFN2BGoHyvyoTwDTxZMtgQainx+cDhJ9E6py/U3AK2
         DRMAFlMmWgynmmP3z7u4naCDPN5cjSg4CDXnl9AbWMvNWMICZT5utQqlaueOy28b+kYu
         svdS8DprMsnmFzUDhx2LF6b03zVhJyuaPZZMqWpJW0TNqiqJqehX0VRDPy/RfqjA+33R
         rLUtnB3Q0tfvFAStcrOdDX40DNW8nmFHelpak5vCeqpKfBWeDUO9cqUHpW8yP6hzcO3H
         zduQ==
X-Forwarded-Encrypted: i=1; AHgh+RqU/Y/yvNRwhGigWvMFBIgygjzpOeOLRTvni+zb8Bp8WP4TNRjYYAdjBWO5CJFyMcvpnU6+Q6NlKfyVZMJH3RU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIysVHxaIMYQjS78jQVXtvDrZrkBCITeUopnEKCRDE8ATUKQpx
	8DtZFciiFNqpa3AVRhmDTy9KvWD4tcZPbxfdQLF27UnbQyb78uMl7rxr
X-Gm-Gg: AR+sD11bmnTiDEfb5BE0eBmD2s7PpqEFF+5AZUbQMFk19tV8J1AtkSUvFECW5nkiGPX
	zKmmIaB08l7gydDkT/EXP3nj7WqskjODbhUyBQ1blwJbHv9a9RRtXU2D3pJvJ6S+KgYklSrAuhb
	Hy8QiX/SeaQ3pn9vD/4fgLiGHXILpKnzRgkuJZngeL8Q3CleMq/gkx3oScvppmmMS+4uaty/Kpc
	4MNH41jMIQkmUfVkhVTqEd7xVdwOxMS0kcVctg4Igp4ADtC7mO5U2BIbY+IkQZN/tqjN1j4Djuh
	2ii/xL+5qt3D9+y2ZDgQvvzsyiM3UnlMs22bvsSOZWal4oBAwx8y1btfDuz/meLbQSOVoWCLfx2
	uKI2aGWuARPLvtnkYcGJBFBozuUzB6y50T+r873yKcpo3pM9ufERPurvwzWs4GgRNujbRdD9L7U
	ug7bj7C8XiD9fZJ0WR4GecO/4XPPR85DsGAKckxMNcdyrDLdFKjsoWTNx6i3bYb4XY5GPC0ELy/
	r2nO2GIo3iqhM5LF+TNc5H+OjEOSw==
X-Received: by 2002:a05:600c:3422:b0:496:c18c:f9a1 with SMTP id 5b1f17b1804b1-4994e7cb6abmr1227515e9.14.1785867678731;
        Tue, 04 Aug 2026 11:21:18 -0700 (PDT)
Received: from im-t490s.redhat.com (78-80-108-129.customers.tmcz.cz. [78.80.108.129])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4994e4bf5c1sm4946925e9.2.2026.08.04.11.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 11:21:18 -0700 (PDT)
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
Subject: [PATCH net-next 5/6] net: gre: remove unused gretap_fb_dev_create
Date: Tue,  4 Aug 2026 20:20:39 +0200
Message-ID: <20260804182049.2289754-6-i.maximets@ovn.org>
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

The only user was vport-gre in openvswitch and now it is gone.

Signed-off-by: Ilya Maximets <i.maximets@ovn.org>
---
 include/net/gre.h |  2 --
 net/ipv4/ip_gre.c | 47 -----------------------------------------------
 2 files changed, 49 deletions(-)

diff --git a/include/net/gre.h b/include/net/gre.h
index ccd293203284..b55f67ecd2fc 100644
--- a/include/net/gre.h
+++ b/include/net/gre.h
@@ -32,8 +32,6 @@ struct gre_protocol {
 int gre_add_protocol(const struct gre_protocol *proto, u8 version);
 int gre_del_protocol(const struct gre_protocol *proto, u8 version);
 
-struct net_device *gretap_fb_dev_create(struct net *net, const char *name,
-				       u8 name_assign_type);
 int gre_parse_header(struct sk_buff *skb, struct tnl_ptk_info *tpi,
 		     bool *csum_err, __be16 proto, int nhs);
 
diff --git a/net/ipv4/ip_gre.c b/net/ipv4/ip_gre.c
index 0ba1e94e9012..6a92607401e8 100644
--- a/net/ipv4/ip_gre.c
+++ b/net/ipv4/ip_gre.c
@@ -1716,53 +1716,6 @@ static struct rtnl_link_ops erspan_link_ops __read_mostly = {
 	.get_link_net	= ip_tunnel_get_link_net,
 };
 
-struct net_device *gretap_fb_dev_create(struct net *net, const char *name,
-					u8 name_assign_type)
-{
-	struct rtnl_newlink_params params = { .src_net = net };
-	struct nlattr *tb[IFLA_MAX + 1];
-	struct net_device *dev;
-	LIST_HEAD(list_kill);
-	struct ip_tunnel *t;
-	int err;
-
-	memset(&tb, 0, sizeof(tb));
-	params.tb = tb;
-
-	dev = rtnl_create_link(net, name, name_assign_type,
-			       &ipgre_tap_ops, tb, NULL);
-	if (IS_ERR(dev))
-		return dev;
-
-	/* Configure flow based GRE device. */
-	t = netdev_priv(dev);
-	t->collect_md = true;
-
-	err = ipgre_newlink(dev, &params, NULL);
-	if (err < 0) {
-		free_netdev(dev);
-		return ERR_PTR(err);
-	}
-
-	/* openvswitch users expect packet sizes to be unrestricted,
-	 * so set the largest MTU we can.
-	 */
-	err = __ip_tunnel_change_mtu(dev, IP_MAX_MTU, false);
-	if (err)
-		goto out;
-
-	err = rtnl_configure_link(dev, NULL, 0, NULL);
-	if (err < 0)
-		goto out;
-
-	return dev;
-out:
-	ip_tunnel_dellink(dev, &list_kill);
-	unregister_netdevice_many(&list_kill);
-	return ERR_PTR(err);
-}
-EXPORT_SYMBOL_GPL(gretap_fb_dev_create);
-
 static int __net_init ipgre_tap_init_net(struct net *net)
 {
 	return ip_tunnel_init_net(net, gre_tap_net_id, &ipgre_tap_ops, "gretap0");
-- 
2.55.0

