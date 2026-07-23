Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74893A95E
	for <linux-kselftest@vger.kernel.org>; Thu, 23 Jul 2026 01:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784769497; cv=none; b=URdJZGF24nIauoPQyB4thDL8Pw22csYUGsq3XpbFjLYxxGXqpcirhqjnCTfpZAz/bN7kc/jhGEUKvIk1vxU3rigwCP+zYEYXd9M3XL0mqWmP71FIsjnxmvJQvUgKxeLbCcx1h5Jh1r2uivbvIUXjdG34c5Tk1AmoS4FA+ogjj/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784769497; c=relaxed/simple;
	bh=Rp5wNPbGEoMLvDNy9Y0Os0AN018Ut17OejovDqyuNkI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YQ4av0gK7zDJT6ze8tNxep1t36iOhOrqo3gKbrDwnuvkaJs3lDt3+vhpz3kCM30T0lbC00SC8pXp5hRaWvMyX44N6Pp9z1b/fMsRlGj1pXm0gx0jarGwz71NQtjOSXJLc4kQUIbzvZvMUzjBpWGPF8fVYZ8eF94GefH5vTNeGcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QNwVlL2n; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QNwVlL2n"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-84a4d8fd6ecso92256b3a.1
        for <linux-kselftest@vger.kernel.org>; Wed, 22 Jul 2026 18:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784769493; x=1785374293; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HqDIk+Slnk3pOQnmJk8DItcgvMwolBNT8qPRkL5HwoQ=;
        b=QNwVlL2nKGi4c2p7vOkeUcf44ohGsg7aeN+NzknL2gqL8W3TQYPQsVjCSj9fQXb7LO
         4k2Wv7vmLWxsiIpb3Vdskyh0IvVbvyfIUoThaBWgy5KCBIsweLYT/BCBWJUZLemHr1jM
         J0CikRQDOMs42Knj93BbrcRSHuybputv5Dg4zT8lJX5/HUVQNJIBkRYoi0uTVUmxOU38
         nL8bZkV+NFFc0WXCWcZ4mxvIOCEKgGRkWVxrg+7qGkCYewVa9bMfY2As/aPwVwT7imPe
         GbOPAdzksGX88cC6HEKMNy/dlVMbkW8FUPWJw1jowcwTxp70gVuPZ3RnlPHyS4gC9DjM
         8gFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784769493; x=1785374293;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HqDIk+Slnk3pOQnmJk8DItcgvMwolBNT8qPRkL5HwoQ=;
        b=D1gVOw1TleTJOIpheUQqbuOvXDw5czV9MRGgCtMd6fORDCKAG+LAItNrm7jOo2Oe8S
         ht+dfvVc1RhjnzOBAxbJygcMFOTwRE+i2jEnj5F8LWTj4pwE/Xhi57d7pCHgqcbj5s9C
         RJa6vb0N8UQJHWgx0pRSvNNOOJmPPHKWpIKQX1+S2NPJNY7pMk2A4+FRZagVBILIwglS
         N40IHKrjlbjuGTDyWbs0P3/QPs43eFRSYSYfFg7JJsd0TUDjtIgh6EElVRn8SdbiFdU/
         THkfJIUeJD06yXyexfYrYDV3iPSjlgPkxLgciuiaKoFWwKo+qB+ARhzHeUNfKTzybUAO
         Qt3g==
X-Forwarded-Encrypted: i=1; AHgh+Ro4Z7OtSszkfGuiVl3KmqJy9+L7/2P55PCFTYROyjsOVVOJqdausXkZg6ggs2hsxZyiPuHzQfv8bcUeXS6yDTQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzpRwalgeoaoQ6CfGzFJKrXNDY5kLaz5sqe73696NsAQOQ1SJr
	bhmLM4eDrWn4Kw8Hutx4Eud4Tv5rk0RlIXj/29ESGE4BzIoOVwxGyTL6
X-Gm-Gg: AR+sD11WTg6hOaHL6udTLubAV2nNGaO3wWZ9Jr364V5R5bMnCbGzu7wXW27DGLDmh5r
	iGBdgLoHgx4WeAgXl1KpGT+MBs4tAVJZB76D+cquzIForO9jhAF6r7LnJFiap5MN9zWFJUHuyxy
	BxkX3no+G22+xTGLm/kNIzjSSrhVP3HccKIYE16ebfAhOMsv+/yUomt43SaJwz7v3sxd8899sJ7
	9r2RuI5+EOBI6H0Xf0aHP1pe+qirW7udGPoqBfRqtsHdkUdA263wh+k7f4xQOof/aTq68fH4I6t
	TasldCAWXPZoCci1ePexQWtJyjgQ/gBCTFwHnDceEoMMhuzNPMhtt4iyF7nLsW3eoKDBlTrsEV+
	u/zuv4G21nAWnA8rXfGaf02H+HQ/SJiwwhRnwND5RMjoLJjhU6+80F/8iM9fsZyz8seeJ/w4z7d
	iuiHK7JWzei6/DOZA=
X-Received: by 2002:a05:6a00:1302:b0:845:dffa:3740 with SMTP id d2e1a72fcca58-84e2b7e5966mr1309708b3a.4.1784769492666;
        Wed, 22 Jul 2026 18:18:12 -0700 (PDT)
Received: from CPC-mjac-HKWGEZ.localdomain ([70.37.26.37])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e175ea5c7sm2089045b3a.53.2026.07.22.18.18.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 18:18:11 -0700 (PDT)
From: Jack Ma <jack4it@gmail.com>
Date: Thu, 23 Jul 2026 01:17:53 +0000
Subject: [PATCH net-next v4 1/3] net: nexthop: add NHA_DST_PORT for fdb
 nexthops
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-b4-vxlan-fdb-port-v4-1-46e3a2dd88a3@gmail.com>
References: <20260723-b4-vxlan-fdb-port-v4-0-46e3a2dd88a3@gmail.com>
In-Reply-To: <20260723-b4-vxlan-fdb-port-v4-0-46e3a2dd88a3@gmail.com>
To: David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Jack Ma <jack4it@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784769488; l=4268;
 i=jack4it@gmail.com; s=20260712; h=from:subject:message-id;
 bh=Rp5wNPbGEoMLvDNy9Y0Os0AN018Ut17OejovDqyuNkI=;
 b=J64lXUoNus6ikn25PnuBFee7hwyLnvyUa8eyxsGKOQSNGfO7bufTkdBgDhOAHXcU+sGI2Evl4
 v8YwRuJ4ROdBwoGEWE8iu4xOtvtMeS1znId1EcojIjWV0eXCsTNe7om
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

Add a netlink attribute NHA_DST_PORT (__be16, mirroring NDA_PORT) that
carries an optional UDP destination port on an fdb nexthop.  It is only
accepted together with NHA_FDB and NHA_GATEWAY; it is stored in struct
nh_info and echoed back on dump.  The attribute is named generically
rather than fdb-specific so it can be reused should another nexthop type
ever need a destination port.  This patch is control-plane plumbing
only; the VXLAN datapath is wired up in a follow-up patch, so behaviour
is unchanged for now.

Signed-off-by: Jack Ma <jack4it@gmail.com>
---
 include/net/nexthop.h        |  2 ++
 include/uapi/linux/nexthop.h |  3 +++
 net/ipv4/nexthop.c           | 20 +++++++++++++++++++-
 3 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/include/net/nexthop.h b/include/net/nexthop.h
index 572e69cda4766..7673aaeff3e28 100644
--- a/include/net/nexthop.h
+++ b/include/net/nexthop.h
@@ -28,6 +28,7 @@ struct nh_config {
 	u8		nh_protocol;
 	u8		nh_blackhole;
 	u8		nh_fdb;
+	__be16		nh_dst_port;
 	u32		nh_flags;
 
 	int		nh_ifindex;
@@ -63,6 +64,7 @@ struct nh_info {
 	u8			family;
 	bool			reject_nh;
 	bool			fdb_nh;
+	__be16			dst_port;
 
 	union {
 		struct fib_nh_common	fib_nhc;
diff --git a/include/uapi/linux/nexthop.h b/include/uapi/linux/nexthop.h
index bc49baf4a267f..59cf1cee93bd7 100644
--- a/include/uapi/linux/nexthop.h
+++ b/include/uapi/linux/nexthop.h
@@ -83,6 +83,9 @@ enum {
 	/* u32; read-only; whether any driver collects HW stats */
 	NHA_HW_STATS_USED,
 
+	/* be16; UDP destination port for an fdb nexthop (e.g. VXLAN) */
+	NHA_DST_PORT,
+
 	__NHA_MAX,
 };
 
diff --git a/net/ipv4/nexthop.c b/net/ipv4/nexthop.c
index 6205bd57aa852..0021380b8c1de 100644
--- a/net/ipv4/nexthop.c
+++ b/net/ipv4/nexthop.c
@@ -39,6 +39,7 @@ static const struct nla_policy rtm_nh_policy_new[] = {
 	[NHA_ENCAP_TYPE]	= { .type = NLA_U16 },
 	[NHA_ENCAP]		= { .type = NLA_NESTED },
 	[NHA_FDB]		= { .type = NLA_FLAG },
+	[NHA_DST_PORT]		= NLA_POLICY_MIN(NLA_BE16, 1),
 	[NHA_RES_GROUP]		= { .type = NLA_NESTED },
 	[NHA_HW_STATS_ENABLE]	= NLA_POLICY_MAX(NLA_U32, true),
 };
@@ -956,6 +957,9 @@ static int nh_fill_node(struct sk_buff *skb, struct nexthop *nh,
 	} else if (nhi->fdb_nh) {
 		if (nla_put_flag(skb, NHA_FDB))
 			goto nla_put_failure;
+		if (nhi->dst_port &&
+		    nla_put_be16(skb, NHA_DST_PORT, nhi->dst_port))
+			goto nla_put_failure;
 	} else {
 		const struct net_device *dev;
 
@@ -1055,6 +1059,9 @@ static size_t nh_nlmsg_size_single(struct nexthop *nh)
 		break;
 	}
 
+	if (nhi->dst_port)
+		sz += nla_total_size(2);	/* NHA_DST_PORT */
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
+		nhi->dst_port = cfg->nh_dst_port;
+	}
 
 	if (cfg->nh_blackhole) {
 		nhi->reject_nh = 1;
@@ -3147,6 +3156,15 @@ static int rtm_to_nh_config(struct net *net, struct sk_buff *skb,
 		cfg->nh_fdb = nla_get_flag(tb[NHA_FDB]);
 	}
 
+	if (tb[NHA_DST_PORT]) {
+		if (!tb[NHA_FDB] || !tb[NHA_GATEWAY]) {
+			NL_SET_ERR_MSG(extack,
+				       "Destination port can only be set on fdb nexthops that have a gateway");
+			goto out;
+		}
+		cfg->nh_dst_port = nla_get_be16(tb[NHA_DST_PORT]);
+	}
+
 	if (tb[NHA_GROUP]) {
 		if (nhm->nh_family != AF_UNSPEC) {
 			NL_SET_ERR_MSG(extack, "Invalid family for group");

-- 
2.43.0

