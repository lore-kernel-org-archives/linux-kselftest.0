Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA2F3B4EB6
	for <linux-kselftest@vger.kernel.org>; Mon, 14 Sep 2026 07:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789370751; cv=none; b=RVXim+c+PciFzgJb8jFbMGNOtOX426C5K7t2R3NCATjDZSx8YZdp61lXD9IjTmn/QbFjKnU7A6wbCCmDY3VJmR0VCIgx4mQxIzDsTpwcy5FQZyaF1SRonA6jijFEWqa6560R3k/0L3bZ4uBLKk7xW4VMnSPLdkf2Y8vmbOurv2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789370751; c=relaxed/simple;
	bh=+4b5tXne8/M8BAgKYGBdEU+kM4v39RRFpGoz6klM5j0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ma0aqGGz5aqddQt8m7QcVxkycAzF4ZfDhRbv/Moqs2/iNfp1pENSM+WgmK5Yvi341py4EBry831Rr0DtxdGXBFRNEAaWed04RFwIpWHb0ocT0FkoEbT4efECSNqi1TPEghdxUD2oy3mllTtlcNULmxPOUdA5imiuxhVwkAvy5o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de; spf=pass smtp.mailfrom=bairaktaris.de; dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b=QsFHFdL0; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b="QsFHFdL0"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f70553dso296830966b.0
        for <linux-kselftest@vger.kernel.org>; Mon, 14 Sep 2026 00:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1789370746; x=1789975546; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=//laNQ4vdXExCrBm3O2PIIdjOC1SK3rk6Ct5+d+DRUI=;
        b=QsFHFdL0e6A/HmyOibE2ZOFzAbowraDXFCwDy0Vz5xT2GHiXJTrud2PiEF6yNVtTlb
         fOWPCLhSJ6WaFZUGchS75PBblIpA2y/JnXiFl03mpaFugEHdYPVr+2oRECxNQploFg94
         A6mXYmgkKXyOZbMYkHXwG0Rmi+0j0Ownr4h3pvE6QvsmVlIGqx69o2ryaYNZVa60nftn
         RliOHb0T3/SmXz/HS7HjwHIpYcYIe8sBOhWlSNKvPBDZf9ZwXhl1lcB0+u/KlW/C20E+
         xjsA4msh+Nag+Qi9K7DrraGc7DPfQ95GZR/44FLdzX8T6+hjvpWaQlI+zGVIrOUc4E6r
         +9Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789370746; x=1789975546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=//laNQ4vdXExCrBm3O2PIIdjOC1SK3rk6Ct5+d+DRUI=;
        b=QEIRqP/+8cKplKQFW0HZjQ2AD29YZoUDke8YTXFGGv+7lZX5Sxayw+ybtMy0756aXr
         TkdoqB/60N3g1G1eZJs6Z7eNyzO7viM0lLVTATx5DosDow2Rw20L//A7jULuIcD02Z4u
         XNVUjDaLNY1G7Cba/n7Uq1snx37AVmKH42VCS3jcLpSyGXN18St13V2lyx1Cyh9QDlql
         TwCegPfJQdUXVkN2sGW35TrbdFVXrVaQIMl3LYr9aa8SeV8U3tuP/XIfolwpagdtcamq
         T3+00w/HDfHKHkT22R8bEhs2tSyPOWWBDehzUjkqUr00tcKkOKyYzv2GSHx1OzkhmWeM
         w9aA==
X-Forwarded-Encrypted: i=1; AKwUvByJwO8fv3wDe2N4vT8E/4MrPukzkgWSScW9m9FnFkXF9cSGea4Lsi2SMLq0Bo99AY5zQ5Dd2qOTf3ZOAS5mmbM=@vger.kernel.org
X-Gm-Message-State: AFuF++kmuGhx8hiQ9qCVBpT0xJk5t9hkU6uPLMMIax2ThRSVXNDPv8/4
	31UH5OCsGwN0st8HLNxnHfd1Mn3BFi+WCw2XLfjQuG4f0yJJS9zfJcPz0dx3Rd0qUg==
X-Gm-Gg: AYBFou2/O5sS8oNMBoYni3J+/fJ1r7Mzv+VJm/nzcT+1ZDjdZcydBNa79RGpzsa9Gaf
	mkmXwiaUR/HAUn6L/JF74Ng7R5SXm5jl/Z2eI8vFe56XeOYSabhpPj3riP0PLR0PZVYtPiwnQAG
	k76CGGcmw76qmMoOrGfQXrUblDZFzI94TTuZtyxqWG+rcvzG/NSksR1XBqwYaCdCopippHjNc4r
	DRe7TixXlKHji0E/y7/EzGqLneDPZHrOTOfKTV3N3CB8iA2RxT3HNdf4GaAvSH7hEuDXsp9UidS
	mi/sCY+89gO1W7rgTSE2WhxJjUfkJg/BtMxDVg4Pes/6qdZNtbYuRE1KonQ6lBBVHGR4SxC2ieE
	HVzLrHsAaBydiqAW0VehdTFCwxBD38pLpM7AoNp3k22qlHF9wjmxp9O5wfbp5pxNyW5CYFhtAgB
	JKCwIIwj6E6QOAc67pwzbY/serTUOXdKio0jxwcJwrPwM7Ay98xgklQURbJ9La+yyxsEopduG9s
	fMRU9IgZ7bJ5wis+kzQMgmb/duhRYwqcMl7qfAcS+mRgBdS6cfCEEzWwLQAW7OZyqkpQSj2amJg
	wR2zN1ljQXv33YJ8uGgxkRwikrbblYKm8EgsdD5FmNVUQLUlagyxJeLQ8V15eKNOxINnw+JVpOc
	lIAcr6XnPjAb1/ReKf9zmW+ity2t1K1ohJ9t2NTEQqnXtd8xQFWOEHxhNv+Y3/OMlxX5PvbQhbX
	5lu/PWYaaI
X-Received: by 2002:a17:907:94ce:b0:c29:5326:5a67 with SMTP id a640c23a62f3a-c29b86362c4mr73401466b.13.1789370745182;
        Mon, 14 Sep 2026 00:25:45 -0700 (PDT)
Received: from Desktop.fritz.box ([185.152.145.208])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2965c4e8a1sm382835666b.6.2026.09.14.00.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:25:44 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: netfilter-devel@vger.kernel.org
Cc: pablo@netfilter.org,
	fw@strlen.de,
	kadlec@netfilter.org,
	phil@nwl.cc,
	horms@kernel.org,
	davem@davemloft.net,
	razor@blackwall.org,
	ericwouds@gmail.com,
	dqfext@gmail.com,
	netdev@vger.kernel.org,
	coreteam@netfilter.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH nf-next v5 1/3] netfilter: flow: Add bridge_vid member
Date: Mon, 14 Sep 2026 09:25:39 +0200
Message-ID: <20260914072541.897040-2-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260914072541.897040-1-julius@bairaktaris.de>
References: <20260914072541.897040-1-julius@bairaktaris.de>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Eric Woudstra <ericwouds@gmail.com>

Store the vid used on the bridge in the flow_offload_tuple, so it can be
used later to identify fdb entries that relate to the tuple.

The bridge_vid member is added to the structures nft_forward_info,
nf_flow_route and flow_offload_tuple. It can now be passed from
net_device_path->bridge.vlan_id to flow_offload_tuple->out.bridge_vid.

Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
Assisted-by: LLM
---
 include/net/netfilter/nf_flow_table.h | 2 ++
 net/netfilter/nf_flow_table_core.c    | 1 +
 net/netfilter/nf_flow_table_path.c    | 3 +++
 3 files changed, 6 insertions(+)

diff --git a/include/net/netfilter/nf_flow_table.h b/include/net/netfilter/nf_flow_table.h
index f2e2771f188f..cadd5f82be8e 100644
--- a/include/net/netfilter/nf_flow_table.h
+++ b/include/net/netfilter/nf_flow_table.h
@@ -164,6 +164,7 @@ struct flow_offload_tuple {
 		};
 		struct {
 			u32		ifidx;
+			u16		bridge_vid;
 			u8		h_source[ETH_ALEN];
 			u8		h_dest[ETH_ALEN];
 		} out;
@@ -232,6 +233,7 @@ struct nf_flow_route {
 		struct {
 			u32			ifindex;
 			u32			hw_ifindex;
+			u16			bridge_vid;
 			u8			h_source[ETH_ALEN];
 			u8			h_dest[ETH_ALEN];
 			u8			needs_gso_segment:1;
diff --git a/net/netfilter/nf_flow_table_core.c b/net/netfilter/nf_flow_table_core.c
index 03241d4bfd5e..b308fb627640 100644
--- a/net/netfilter/nf_flow_table_core.c
+++ b/net/netfilter/nf_flow_table_core.c
@@ -139,6 +139,7 @@ static int flow_offload_fill_route(struct flow_offload *flow,
 		memcpy(flow_tuple->out.h_source, route->tuple[dir].out.h_source,
 		       ETH_ALEN);
 		flow_tuple->out.ifidx = route->tuple[dir].out.ifindex;
+		flow_tuple->out.bridge_vid = route->tuple[dir].out.bridge_vid;
 		break;
 	case FLOW_OFFLOAD_XMIT_XFRM:
 	case FLOW_OFFLOAD_XMIT_NEIGH:
diff --git a/net/netfilter/nf_flow_table_path.c b/net/netfilter/nf_flow_table_path.c
index 1e55644f2edb..53629e9b2273 100644
--- a/net/netfilter/nf_flow_table_path.c
+++ b/net/netfilter/nf_flow_table_path.c
@@ -88,6 +88,7 @@ struct nft_forward_info {
 		__be16	proto;
 	} encap[NF_FLOW_TABLE_ENCAP_MAX];
 	u8 num_encaps;
+	u16 bridge_vid;
 	struct flow_offload_tunnel tun;
 	struct dst_entry *tun_dst;
 	u8 num_tuns;
@@ -180,6 +181,7 @@ static int nft_dev_path_info(struct net_device_path_stack *stack,
 			case DEV_PATH_BR_VLAN_KEEP:
 				break;
 			}
+			info->bridge_vid = path->bridge.vlan_id;
 			info->xmit_type = FLOW_OFFLOAD_XMIT_DIRECT;
 			break;
 		default:
@@ -257,6 +259,7 @@ static int nft_dev_forward_path(const struct nft_pktinfo *pkt,
 	if (info.xmit_type == FLOW_OFFLOAD_XMIT_DIRECT) {
 		memcpy(route->tuple[dir].out.h_source, info.h_source, ETH_ALEN);
 		memcpy(route->tuple[dir].out.h_dest, info.h_dest, ETH_ALEN);
+		route->tuple[dir].out.bridge_vid = info.bridge_vid;
 		route->tuple[dir].xmit_type = info.xmit_type;
 	}
 	route->tuple[dir].out.needs_gso_segment = info.needs_gso_segment;
-- 
2.53.0

