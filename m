Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7F83B52E1
	for <linux-kselftest@vger.kernel.org>; Wed, 13 May 2026 18:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778697393; cv=none; b=dQRmWbxPSvtA6lLtr+fOWYQin9xA2aDedv9yttHtnzu/uiqUuRgzdfHyV02vSbONH3oJVyecFKlmxYaqClyucUir+ZZlGOBJraAgLE7tF03NhhmB/pSEGnCEFJ85Y+dEMZAmztdAxj5ZCh8bIIH2pKImDoHpfFiU2rqcqO8MaT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778697393; c=relaxed/simple;
	bh=bbNVFjVByescbxlWSooR9HsipPYLdQ+oaSNYna3xljo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M/qLUKoSXwjlnsBDgy/OAIwl/fao42dh7fjvRXlRv3Memd8eB04itlT0Jm7nb0GDrnMznrnGt1I4DR3Uy8dV37KVmJKZ5iEz7G+hb4s3livt5603j70HMCFyIU5l0W/N3ekXMsBJ2X+V6g76cGWfIJ0DT35EcefZ8x31LHU8Pfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ovn.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ovn.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f66.google.com with SMTP id ffacd0b85a97d-45562c41ec7so3497277f8f.1
        for <linux-kselftest@vger.kernel.org>; Wed, 13 May 2026 11:36:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778697389; x=1779302189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RFryEAJj/MmmFRvFqgOL8R9VRzL/GvvXFVwI7R7pOfI=;
        b=KX/kGf3hmqWfNNZEKC5Tdr+qgfqvBQgO//lDHG9fbSbFczy24teTjNauoqFnNl5JVZ
         kysaEseNoLy3cM+WRqts62CjA2pHKyoQBkjHaOt4EZoaS6yToRblobdqbLv8/1Bbg6Id
         FOcLCev/VCY69FIpEpr5XaZl+G5fhgYJjQZxostRXy7hfbrem5kOV1al8Aoujt8C96AW
         32FSm4cNT2fL/OmCxfciLL7Z61Tst3BRTiozUMzq1lrxAkJ0OEGmz6AW5C2igECl6g0y
         a9h0ZPby9Vu5bD98T65Vay2+flA1wrxVh4diihcjxFcycq4Qy3lawirbzSATgWZ/InKf
         PtWw==
X-Forwarded-Encrypted: i=1; AFNElJ9vdXdu5S18sObbNecQ2tcA2r+XdhoAomRsECBwQLuPF49c9JIBYUCcUXJQL8lHEIP4XtnHkqaqOcJeW4V3TRs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzmu1xD3vylVHBMxdFihvRZR/3FtC62Bkqtwibobd+Jn1Ji+lXz
	rvBvIv2e3Uw7Kh7ThQSegz9G+Zh5AsnVRzOtL4VOAwszGKt2kbOG/wcI
X-Gm-Gg: Acq92OE2q8pPa10jCqHNuQahRuCro4FthXEIFu4pjX8rgkY0qC6XRw8y7HKd3zYiNbO
	F/camo6rV8H7M9AYsjP56wo5hCZCGjL3Sjkzh8hQNJ+DlxZMuqpZPoCIkpImg/V4M+wWJ81jxzi
	32tGLV82NqRuAtdQCK+mD1tGHxEY0Pw0xlkP+j92i9krsAbVnohvkc5o7y5dEiPI25bPjwFF6B9
	DaPjC/dBE0teBKIY0p6mjJ5UULaOOqJex2mvjLWShxeYV7PB1iR3tceWDZ6e5tuU9KyJoMwXBL7
	gI7HCw7ojGZSxi+KgvL3UfRGKdJpAxjUAo4LOjjJFhvyR9wCxLDO6FBIfMoD6z2lT795jvnOma1
	DtxEWR+8MdnqrtMfZlnDoziAGSGP+asIBmJE4u0On60msSc0y0Y4w69GHZbuc5X4kIbtjYgNGrc
	JrQh+C/PV9/2ey+87siu9meTVjgEUti2elsjn+zJkprGtJWoBrJL1lw0qis/w=
X-Received: by 2002:a05:6000:2902:b0:43d:3004:5fef with SMTP id ffacd0b85a97d-45c57de8025mr7061742f8f.7.1778697389364;
        Wed, 13 May 2026 11:36:29 -0700 (PDT)
Received: from im-t490s.redhat.com (37-48-40-237.nat.epc.tmcz.cz. [37.48.40.237])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a6454sm720609f8f.34.2026.05.13.11.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 11:36:29 -0700 (PDT)
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
Subject: [RFC net-next 5/6] net: gre: remove unused gretap_fb_dev_create
Date: Wed, 13 May 2026 20:35:25 +0200
Message-ID: <20260513183559.2141010-6-i.maximets@ovn.org>
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

The only user was vport-gre in openvswitch and now it is gone.

Note: since it's an exported symbol, there is a possibility that some
out-of-tree module is using it.  So, alternative is to deprecate it
instead by adding a warning if it is ever called.

Signed-off-by: Ilya Maximets <i.maximets@ovn.org>
---
 include/net/gre.h |  2 --
 net/ipv4/ip_gre.c | 47 -----------------------------------------------
 2 files changed, 49 deletions(-)

diff --git a/include/net/gre.h b/include/net/gre.h
index ccd2932032844..b55f67ecd2fc4 100644
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
index 169e2921a851d..a1dd833ea1cad 100644
--- a/net/ipv4/ip_gre.c
+++ b/net/ipv4/ip_gre.c
@@ -1710,53 +1710,6 @@ static struct rtnl_link_ops erspan_link_ops __read_mostly = {
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
2.53.0

