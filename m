Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F4C43E07B
	for <linux-kselftest@vger.kernel.org>; Tue, 21 Jul 2026 22:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784673004; cv=none; b=hCVzfMeCBWOyA2/nQAmsVHFU69/tbR3Gsiat7FhTnWy0KpEZazJpQejT70JxcrWahS8r3+1h9iRnHKElgZ31clXyDgt3oi3pk8ReeBnUTMHmFg9CoZvo+nKqno5pn0sD+osC1qDC2SlIAl4yD9ef/jcpES7/m8S8zKk04RvBQUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784673004; c=relaxed/simple;
	bh=aCZ1nYC56oVsqz3nAosAp9UeLpyyVDpG1ZflrS+5rQQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jfEAZaqGRn8xhL+ZmUyZi5gl7udHxWsyiVbb+iTQsecvvK0jufVVRlm+3ovHPzMhsjEFAHso7NzTx6I2Q+1yJl+mPcRnO9cbhoRVWIyDCOSoTS7CTrdlZNoAWfZ1JctXaizgh224EhXyrCf9/96Ti+u4otyEuBG3G7cG043OI5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OMq8YBBG; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OMq8YBBG"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cc97653887so129622585ad.1
        for <linux-kselftest@vger.kernel.org>; Tue, 21 Jul 2026 15:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784673002; x=1785277802; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f+L2jaWd7tEXAzV/TnysMQtl4QLqTTYCdiIRJKMNP80=;
        b=OMq8YBBGMtsqbBzhkAQYk1gcWAHVa4M7LWCKfH+0ooUIn4RIMsl6q8S//StRHpqnJx
         rknSG8FmTjp9H/wuGMherlkBzOdU/SUZLjX04JTokY4Q3RUGttI3lR5ESvPZ0e7nS5my
         uHpABcmN4s6a9neuk2YEet8iKSd/L2C/ELz55ddjg2vWQ+koP37nrIuC/6jPDIId/kJW
         SADHEfKAuFB5dITgwmsvsMr8skN4USKxxyMta38/RgO9IMLPKLkshQmTwJnLkP93OP8u
         TqbU8GkR1Wi5sV4U9DVVzmOywjMSpuErRR96xTtww72IU8L9+4UJiiF08wvCXX8BRb7i
         zFbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784673002; x=1785277802;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f+L2jaWd7tEXAzV/TnysMQtl4QLqTTYCdiIRJKMNP80=;
        b=nUjJaTmxT2Qa2TxWs4tDy2v+/U4qY/6fZRhhlq3wS5vhLnb44LSzUn8FPEzdkAUT1U
         08S6YuWTXhUwv+Kxqdmuj7lQTW22fjyTh1VpPuTA2lV/3XS6y4cvnjH422HeUXQTXc6r
         UVxjQj28JLS42umaDJHMFfGA1SzQLFArc9uF0VV7apAiM7PoO3gP30V3lZVhjkhl/YEw
         4Ek2GAeTeRD8h/LVIM2A6C7JcAGaCQ7+Y0SSqbtHPe1y/ReEf/x/PvWqArLhMKpnn34L
         mY2kg6+GI6Ecq53XrtllAqoVIog28+NXFaJmn/i/Zd/IZTcXrdGfI6ymp1kzGarsnIid
         DS8A==
X-Forwarded-Encrypted: i=1; AHgh+Rol/BXvNpuwMb5p8/T445rpzWXuWzwyFyXDxmG9Qx9Z3P/9Z6d65fwfnD2JthKO8gg184Va/zmwChqnFRuYGn8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxul1ZTcaTJaCv6nv+WMVaGJBJDgn1KqjOo9vn27DIuaXL7fVqQ
	F2gIUtzQvUBKKCHjrabsa5ro5qBfZ6QskiQ1eWNgwfuS9Sg6u5G1HvVQ
X-Gm-Gg: AR+sD13CVlKlzgIrH+IasDBLID34ZUI92wU4Wpe5zZo+YjMZGM0AIpqvY5/9iqRgV+j
	AFELbX+yDqxBCFM0qD052xzIfu6RtHSonQlc+49JhsbZJlV1VdcNTRreGQrMtMsCr3gZAVtB8EJ
	cf27koEROq85ex+BrqYKFii2kvHXma5RGAyQ3rn+aOjexUJ9VtcwFAskklNMFCu2ORWfYwoeqwO
	9N3muDRHaWGOZnogt+6zPhjzlYu0miS+oC02rKtN7p40RU9eKX24aVQ7iNWwCoNqAgzcUieFldd
	BUAPi8I8Fe/Uyu+MWGaxXhchQmdm8lAJWAjOUzfBJL02PQWHPNppqRrDLAWXPklztPTQ+0sD9NO
	BaT7JQFZvnpDfG30L8xs10YxdVe0qdrsXQqS4uOVTbPA0ak13xDw1h54A8iC8xgwQaLScACRSWm
	jniegskGbMf8DElMY=
X-Received: by 2002:a17:903:1aaf:b0:2ca:c4a5:84bb with SMTP id d9443c01a7336-2cf349c97b5mr219846475ad.38.1784673001667;
        Tue, 21 Jul 2026 15:30:01 -0700 (PDT)
Received: from CPC-mjac-HKWGEZ.localdomain ([70.37.26.40])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efde5cfsm3787685ad.31.2026.07.21.15.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 15:30:00 -0700 (PDT)
From: Jack Ma <jack4it@gmail.com>
Date: Tue, 21 Jul 2026 22:29:50 +0000
Subject: [PATCH net-next v3 1/3] net: nexthop: add NHA_FDB_PORT for fdb
 nexthops
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-b4-vxlan-fdb-port-v3-1-9aa0a543a78a@gmail.com>
References: <20260721-b4-vxlan-fdb-port-v3-0-9aa0a543a78a@gmail.com>
In-Reply-To: <20260721-b4-vxlan-fdb-port-v3-0-9aa0a543a78a@gmail.com>
To: David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Jack Ma <jack4it@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784672999; l=4113;
 i=jack4it@gmail.com; s=20260712; h=from:subject:message-id;
 bh=aCZ1nYC56oVsqz3nAosAp9UeLpyyVDpG1ZflrS+5rQQ=;
 b=MRlo23ob5K6AxEbeRkC+A1AErbdt8EJ+9bV7J0EAYYqyUK5XwbhjpzXXd/mtnUuYGNWpfjhvD
 nxmmJ/NBC++CJENoDX6RHxQ9/v592SQm0XWhFxJiP12jhc6UJ1wCd+O
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
index 572e69cda476..9c822799634f 100644
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
index bc49baf4a267..e587bbf3b890 100644
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
index 6205bd57aa85..b82da3eff63c 100644
--- a/net/ipv4/nexthop.c
+++ b/net/ipv4/nexthop.c
@@ -39,6 +39,7 @@ static const struct nla_policy rtm_nh_policy_new[] = {
 	[NHA_ENCAP_TYPE]	= { .type = NLA_U16 },
 	[NHA_ENCAP]		= { .type = NLA_NESTED },
 	[NHA_FDB]		= { .type = NLA_FLAG },
+	[NHA_FDB_PORT]		= NLA_POLICY_MIN(NLA_BE16, 1),
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
 
+	if (nhi->fdb_port)
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

