Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB4DB39281B
	for <linux-kselftest@vger.kernel.org>; Fri, 17 Jul 2026 06:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784270738; cv=none; b=MUK4RDQxhEb11suwJJ6yMxb8UFQmuCfci2WXzqVjjoFhEnoQ5ZfpUx262pObjydSgB/t92l2OlgNmBQKuodUOEKejpIGM7LMbM7+4u/gip/Ivss6JxxAwg7E4lbxH1FXDBrclhn9BjwFZfSwL6X0S8E7kYeVXx4nCLsmnSvD9BU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784270738; c=relaxed/simple;
	bh=sl8mscsoPTPSyi+19hbwFh+F3vzBp+hyHWcG3uotCtE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EtoF6nUwfEwtrg5EsZ8DBFzGSpI9Ehk+VlMYfqKSR1msk1hdoNfR2X4hI75j5AZ2kfeK+oQ1Du5FP4QTMrUrLIrUTzX0YM5qb5I0aCwGuLkVCxQVnSlVZsm61ILNg9y/+X/CTD03wHX/y1cuOl7M3RV7gsiyeJsRrQafNiKs4zU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YLsmSDRA; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YLsmSDRA"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8485ef63b68so6960190b3a.1
        for <linux-kselftest@vger.kernel.org>; Thu, 16 Jul 2026 23:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784270726; x=1784875526; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eHqB+0XtN75taQRaVYwBwvw8FBQBWfUPu65PH2IoQnQ=;
        b=YLsmSDRAsprxiUQKmPwTnu/74GufZrN1wqK8+HDkoZ+/5ht+a0y0JMso5paTn8kubr
         XkUCi1DiNi5gtGoUemA8Cut6maC1ZLmNo8G+omcoG/kYUuE0Shb0S1/8XGagZF+vl/Tk
         /bDEjNH+HtSCS2sGNpaykDHEfv6Sdc5AIr7qUVLj2Z1NMt57yOM+pZabpQCTad1UTOWS
         7uR3gmUUMl1RJdKyJENYeIcLIcvOz3ShACXz0D411ITpA0ugUX2E0tsw/tSPetgyC/ec
         tIvw+k2P2g8D7JsO9zMpeyK7x8pdGm8XD24e4T9uPAnrt0dASgUE9aiiSF5J+aQ4v0L1
         K5tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784270726; x=1784875526;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eHqB+0XtN75taQRaVYwBwvw8FBQBWfUPu65PH2IoQnQ=;
        b=bxYC6Cw4LRnocQIfrcyrm40ft+R3zkT2JaVVNYmeNT0mf6/DZCP0PbYY5WPoqYi6Vg
         WSkXFWSco398ztWW6+QCAh/xGx1Y6cMtaA5dMOjbCazL9i7Y39VBNjxEpYqrqgfL52Kk
         Ua3Vr9YfGZXsbixUnLe7CfkGYG3+4s4w++vBhNXX+xrL/owO8yuZV7jhDU/IVE7em8e6
         c9BBWNXKZtWxKtzyjIk+BB5HTWW3H+Ctl+joMpHMqdSVxEUoYBlgjeBj2x2BMX3gkRlN
         pcVVrBaWlKrMtm1UDVfY3k25q6dg9lCAlb31EdenhMW80L2CDhnyD75BPJJYWQoNSciK
         nlAQ==
X-Forwarded-Encrypted: i=1; AHgh+RpYZXTNA6vQgOYalS25A5KlQBBgDgHz0nxHLvWR9tBqrIC+QVNoIHOIYgs6kEUqJ1egAZleYRv44pqmP1hv3PQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzldKTIpDXv7AwI7Exaa4MMjBgFxI0Gw4262eNa66+/hgWAu+C0
	nFOWvXCYaW6vV6VyinifOpMAhrZAxDPdOMaTzCP4b395kXFxe3qtxY08
X-Gm-Gg: AfdE7cmbnzZkakmnN+Ww0WsopCUxPj7I21u8c6EK2cM2eiU/fsn4fms6Bc0EFquRQcl
	Fd6zGffIBmjodog5WuXMoUOsS4vkhWKcl51w4sx3ZuIAm9euHaI+Cm4mdEL1UZhJMj0HR/9aad+
	qOsvDyXeGu80EkuFeDpAC6X2vacAqZYhIprC7LTpgSb28r2kRyPXPpA8XWH1o/fR4o51lDEZnld
	M2UqhWIleZvXUFVF0c5hDtUDcJGxdEkIaCdMN9yQXNUVGFPTbbEj74LkcaXCEWu43rAABlme0Ha
	zBlLOf3l99ttDysz584vxVt144/B6EqSQqyNGj/EMSJlO/ln4/Robnjs1NRNLKCyX0fX9V+Umty
	gxpsXoF5LTEgUXblCiMS95CHRChJBT0H/ARQWaGbR1WT6sgLZBuHPBMenReLI49D/rQTcdZ+HU2
	dF2ShYIfI1/UYUjbZjjq+YM6QDuA==
X-Received: by 2002:a05:6a00:3c8a:b0:847:973b:3cf6 with SMTP id d2e1a72fcca58-84c290c3bd0mr1280242b3a.0.1784270725719;
        Thu, 16 Jul 2026 23:45:25 -0700 (PDT)
Received: from CPC-mjac-HKWGEZ.localdomain ([70.37.26.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2ad8855fsm430531b3a.12.2026.07.16.23.45.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 23:45:25 -0700 (PDT)
From: Jack Ma <jack4it@gmail.com>
Date: Fri, 17 Jul 2026 06:45:16 +0000
Subject: [PATCH net-next v2 1/3] net: nexthop: add NHA_FDB_PORT for fdb
 nexthops
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-b4-vxlan-fdb-port-v2-1-f4862e8fe867@gmail.com>
References: <20260717-b4-vxlan-fdb-port-v2-0-f4862e8fe867@gmail.com>
In-Reply-To: <20260717-b4-vxlan-fdb-port-v2-0-f4862e8fe867@gmail.com>
To: David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Jack Ma <jack4it@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784270724; l=4085;
 i=jack4it@gmail.com; s=20260712; h=from:subject:message-id;
 bh=sl8mscsoPTPSyi+19hbwFh+F3vzBp+hyHWcG3uotCtE=;
 b=sc8SDB/wC4m7QG+mGDlCeq1eYouPQl1BtyZZ/UqB+9s4ZrHKBorsmm5oDEUMw0T1p6lSkpH3D
 eUWbyx9x1DyBJmgDaQcB/LN2Atpwq6gNlkJxRET/2nHg4/c2VeCFdkB
X-Developer-Key: i=jack4it@gmail.com; a=ed25519;
 pk=x8xh2Md9yNDil0xBOA9WA/oqC3O4Eg4rdlIul4YUktU=

Commit 1274e1cc4226 ("vxlan: ecmp support for mac fdb entries") lets a
single inner MAC be reached through a group of remote VTEPs, with the
kernel flow-hashing across the group members.  Each member carries its
own remote IP, but the UDP destination port is always taken from the
VXLAN device (vxlan->cfg.dst_port) and cannot be set per member.

Some deployments pack several receivers behind one underlay IP and tell
them apart by UDP port, so they need a per-nexthop destination port to
spread flows across (IP, port) tuples rather than IP alone.

Add a netlink attribute NHA_FDB_PORT (__be16, mirroring NDA_PORT) that
carries an optional UDP destination port on an fdb nexthop.  It is only
accepted together with NHA_FDB and NHA_GATEWAY; it is stored in struct
nh_info and echoed back on dump.  This patch is control-plane plumbing
only; the VXLAN datapath is wired up in a follow-up patch, so behaviour
is unchanged for now.

Signed-off-by: Jack Ma <jack4it@gmail.com>
---
 include/net/nexthop.h        |  2 ++
 include/uapi/linux/nexthop.h |  3 +++
 net/ipv4/nexthop.c           | 20 +++++++++++++++++++-
 3 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/include/net/nexthop.h b/include/net/nexthop.h
index 572e69cda..9c8227996 100644
--- a/include/net/nexthop.h
+++ b/include/net/nexthop.h
@@ -28,6 +28,7 @@ struct nh_config {
 	u8		nh_protocol;
 	u8		nh_blackhole;
 	u8		nh_fdb;
+	__be16		nh_fdb_port;
 	u32		nh_flags;
 
 	int		nh_ifindex;
@@ -63,6 +64,7 @@ struct nh_info {
 	u8			family;
 	bool			reject_nh;
 	bool			fdb_nh;
+	__be16			fdb_port;
 
 	union {
 		struct fib_nh_common	fib_nhc;
diff --git a/include/uapi/linux/nexthop.h b/include/uapi/linux/nexthop.h
index bc49baf4a..e587bbf3b 100644
--- a/include/uapi/linux/nexthop.h
+++ b/include/uapi/linux/nexthop.h
@@ -83,6 +83,9 @@ enum {
 	/* u32; read-only; whether any driver collects HW stats */
 	NHA_HW_STATS_USED,
 
+	/* be16; UDP destination port for an fdb nexthop (e.g. VXLAN) */
+	NHA_FDB_PORT,
+
 	__NHA_MAX,
 };
 
diff --git a/net/ipv4/nexthop.c b/net/ipv4/nexthop.c
index 6205bd57a..5b27cc9a9 100644
--- a/net/ipv4/nexthop.c
+++ b/net/ipv4/nexthop.c
@@ -39,6 +39,7 @@ static const struct nla_policy rtm_nh_policy_new[] = {
 	[NHA_ENCAP_TYPE]	= { .type = NLA_U16 },
 	[NHA_ENCAP]		= { .type = NLA_NESTED },
 	[NHA_FDB]		= { .type = NLA_FLAG },
+	[NHA_FDB_PORT]		= { .type = NLA_U16 },
 	[NHA_RES_GROUP]		= { .type = NLA_NESTED },
 	[NHA_HW_STATS_ENABLE]	= NLA_POLICY_MAX(NLA_U32, true),
 };
@@ -956,6 +957,9 @@ static int nh_fill_node(struct sk_buff *skb, struct nexthop *nh,
 	} else if (nhi->fdb_nh) {
 		if (nla_put_flag(skb, NHA_FDB))
 			goto nla_put_failure;
+		if (nhi->fdb_port &&
+		    nla_put_be16(skb, NHA_FDB_PORT, nhi->fdb_port))
+			goto nla_put_failure;
 	} else {
 		const struct net_device *dev;
 
@@ -1055,6 +1059,9 @@ static size_t nh_nlmsg_size_single(struct nexthop *nh)
 		break;
 	}
 
+	if (nhi->fdb_nh)
+		sz += nla_total_size(2);	/* NHA_FDB_PORT */
+
 	if (nhi->fib_nhc.nhc_lwtstate) {
 		sz += lwtunnel_get_encap_size(nhi->fib_nhc.nhc_lwtstate);
 		sz += nla_total_size(2);  /* NHA_ENCAP_TYPE */
@@ -2956,8 +2963,10 @@ static struct nexthop *nexthop_create(struct net *net, struct nh_config *cfg,
 	nhi->family = cfg->nh_family;
 	nhi->fib_nhc.nhc_scope = RT_SCOPE_LINK;
 
-	if (cfg->nh_fdb)
+	if (cfg->nh_fdb) {
 		nhi->fdb_nh = 1;
+		nhi->fdb_port = cfg->nh_fdb_port;
+	}
 
 	if (cfg->nh_blackhole) {
 		nhi->reject_nh = 1;
@@ -3147,6 +3156,15 @@ static int rtm_to_nh_config(struct net *net, struct sk_buff *skb,
 		cfg->nh_fdb = nla_get_flag(tb[NHA_FDB]);
 	}
 
+	if (tb[NHA_FDB_PORT]) {
+		if (!tb[NHA_FDB] || !tb[NHA_GATEWAY]) {
+			NL_SET_ERR_MSG(extack,
+				       "FDB port can only be set on fdb nexthops that have a gateway");
+			goto out;
+		}
+		cfg->nh_fdb_port = nla_get_be16(tb[NHA_FDB_PORT]);
+	}
+
 	if (tb[NHA_GROUP]) {
 		if (nhm->nh_family != AF_UNSPEC) {
 			NL_SET_ERR_MSG(extack, "Invalid family for group");

-- 
2.43.0

