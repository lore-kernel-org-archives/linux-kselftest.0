Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C27A2236E3
	for <linux-kselftest@vger.kernel.org>; Fri, 24 Jul 2026 00:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784852801; cv=none; b=aRxoAdo7/6+ev3L4xIWIuYyFKLeUMiVJjEvM8XX8xatsbjSZZOuNn/YZ4omp82LvDMPd9TqTbGFrad3huIrmsIa/+hXFQlNK5r8HvgksDrH7wB19A3oGSJLs0ooTcEZYHhOp4eme12HQqeDTTOyybYDpVUXPdiR++fjsBVoj10o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784852801; c=relaxed/simple;
	bh=3W4mbGktSc43Nvv/cf8cczw+nLblSJ3VtWQyfSWswCI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oOHHVn29eMaVyDO1LjFw/tXY1C+zX9IktEf7JJcKuhFJUbn7rIGDUw1L+iITdrSjHrJVWQVT3Hbdu5sACWEi2y3SkXHhyBXi+Ma/GyCeau48qx/WRxAZwGewMurEXgCItDrDEKFeas5TvM6hDcvHrv6Ah5mEi3MugkvgvETFS/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KTXVnvfP; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KTXVnvfP"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ced3386430so13112465ad.1
        for <linux-kselftest@vger.kernel.org>; Thu, 23 Jul 2026 17:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784852799; x=1785457599; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DKQXBlGih8Hda8UKFkNf10u1Tr2TuruH3GdBSklsbc8=;
        b=KTXVnvfPZDE+ILR8UcCHeF7TNiQNCjh95vB0ESyh2otlD+GZagw0Zzokfg6teGFHKA
         kB59pp46SNcCZ7JhQIaZ65CQvh/gxpV3HlXV2A9aR1w9SmZZdxc1HczOFH4aLYWU+EdO
         yDvbiaDxhr5LXFZ0xpZCrJQZ3HF6v5BgmcHO3GKvM9fjBb1efYBtEVYE4F5VFXYxn1US
         ROL8xbUtLPXFuSArKsuZnt2eXRoCbmK1SGV7T1GkbkqkhfNzo8arJVUmCkpKmLtWU1Sj
         fSQ6ZXxYuCbFhWFsy16qYe3yYJ4h4bs37tspHZyktvzHX4TWn3ppdBWW6dR8PHH1T6Iw
         vOBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784852799; x=1785457599;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DKQXBlGih8Hda8UKFkNf10u1Tr2TuruH3GdBSklsbc8=;
        b=XOJ0ks7VjdagDPC2IK8gCokMUHwc8DScgL+VonT8Ya/8snl4pLSk6Vqq97l0b+fjzc
         it1I1nNay1OXIAPAhdSmjIn0VeM/VZF95+hHna6T7bxmrJImMFLj6sPIq25xyygvTs5l
         V1LeK7pzrE8p4Z8lJe1Xw632XsKVAF2qGW4hSzoRPsxHvRA8+ilyO5zjFZvny6fCXqiU
         oPKiRDkyt60+9NV/WLkH0LNGmfpOvlRjpWlZ2wrjUaBrUX8SYhAzLa27/Vg1uL74JCkv
         aGf1fyVAtkut50uUubWw+hhbSAE2UW8bu8H1ZM0uyMfoT+nR29IedR/cvWfT9FFX2S3/
         UfUg==
X-Forwarded-Encrypted: i=1; AHgh+Rrg+fbap/m3HC3v6xNvtBSxGGvWelSL1s+rI71TKXTkT/30BS0UzLQs8B575YrcPpEcPbk7PpiKY8jQAwWi/bY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMbcudqcCiGNBAax3efbizGE5HX0bhbUrjZk/hyeRzctEtePeB
	034v4fHc7flzZG0awSVZWtZGpQUnxIQDHbP88kjoknfDkF11NFLRo2rx
X-Gm-Gg: AR+sD13CIsBn3c+m0UL6VkqB//vBIYKeZAz8SVG22r9Y6yqQcCeTzxH2egb8/tXy9j7
	7Q2r+oZGhAXSgQGdRGfiQN5RO9jSPXw9LmEyfks+otxd1KWLX9gOKfIGpsZLZhYnRIlxHzLbp+x
	a336kr9/OmMV5uDJHp2APMilwwvBG302bbyLL71T5bugm8AWm0CreWcJ0oe0Fxgz4EkrrWBoGsY
	WmB+KTe8tneJ1eJkz41lK+oz5HDUkcbNXXzWeInCL6vUSS0TVyyLlbDbswFHXi/IC5YjM4IBxRe
	Goh7ohk4xaNCnkh/AyPhVmTqvyFdFfHcF0q5vxRAZMcQf72dhf3Y9GnUi9JFxVfP32Vy7bsz+av
	UqS6zzjI0zQEhhAB7sq2BKNZEIRpIUcCmsSZZn6gWsaMF/NwGnB6Ahi+hj98Ya1kxlRwhPPW6Ny
	I6IIMdbGdJlOgxRBA=
X-Received: by 2002:a17:903:17cd:b0:2cc:fd6c:c5ae with SMTP id d9443c01a7336-2cfa74adfc5mr65039065ad.38.1784852798768;
        Thu, 23 Jul 2026 17:26:38 -0700 (PDT)
Received: from CPC-mjac-HKWGEZ.localdomain ([70.37.26.40])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efd76cfsm42343205ad.20.2026.07.23.17.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 17:26:38 -0700 (PDT)
From: Jack Ma <jack4it@gmail.com>
Date: Fri, 24 Jul 2026 00:26:16 +0000
Subject: [PATCH net-next v5 1/3] net: nexthop: add NHA_DST_PORT for fdb
 nexthops
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-b4-vxlan-fdb-port-v5-1-cd1c6aeee058@gmail.com>
References: <20260724-b4-vxlan-fdb-port-v5-0-cd1c6aeee058@gmail.com>
In-Reply-To: <20260724-b4-vxlan-fdb-port-v5-0-cd1c6aeee058@gmail.com>
To: David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Jack Ma <jack4it@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784852797; l=4362;
 i=jack4it@gmail.com; s=20260712; h=from:subject:message-id;
 bh=3W4mbGktSc43Nvv/cf8cczw+nLblSJ3VtWQyfSWswCI=;
 b=X0nV+yKUyIU9IjXhAt5r9UgxH4/j/y1Sb+/9J3IFlLdhHwYRIuU+wLgOOs2azgfOOf3U0W0qh
 Qi2TfZSXCjvAMbSvD93ge9xl23LTC1iqOeNwzhHRcUeaitqriJgm4Zk
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
Reviewed-by: Ido Schimmel <idosch@nvidia.com>
Reviewed-by: David Ahern <dsahern@kernel.org>
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

