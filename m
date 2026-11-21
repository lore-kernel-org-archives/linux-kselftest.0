Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795294539;
	b=WTXSgvMfMDh/EMVksJtmYLJQLJ9Ff/UpOwtQCRlCBSicmFAYEPS8yMUbB4FnGu7P705W
	 y7f74ew4GPWJC1v5xQ4BCefHbdiakV5TA1iTW4QqtTSYV0wkXGRlX7wc1LcrgSukQw2YL
	 0IsNGuvmvCfCmmFn7UJGqz/HWaklKnuzg9UcYzmLMgaa4AJZ3N4ckfY1Ob3u6sEIJRBHF
	 VkoQi8yf03bX+VP7WyRuukGHl86qmOGbO3fYsJ/O3TCU4SS0UNA9xPSOjvQaNF8YGpHpM
	 272Ia9UxqyH6zX9yBjZ413AwZH09Z2O4sxLUpax0kOqXzAM4+2+p1gc0Rf5vruSBP+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795294539;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GeBK2KWSTEYOjvpbrLoolF+PIHIEDG1AsTpzAFk1TEA=;
	b=XV5Dq431D94cMI0XhclN0jFS0BpdLifzWodPrT+srh0FpYy5GPM+YmVo4ekiwomi8AKy
	 VA5u5dqYfwZdyBdCf6loEbprAEphqYX9AzMLPQ2DQ+b67jSgTKxUvnGPZEp+TensTOWuj
	 T4k2xJ69tb0qOKpKCEyNnN1j7wMxbF5ZQiS+JKbBIRyNMhx8TplN+qgCPb/X7jP4rNWhn
	 oRmWYDusWqsA01Mcyts8u9RvKCurrZhWMLTNzyIRrEImKLy7aQF/O28odAy3wAik2BsgJ
	 ujjji8ZUve4hsqLGUfmVyukoiUB+NQspAdnjW/bT+h0mNlHGXMtpqnRhgr9/Xi1Mkdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=gXLaYwSm;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7A4606A33A
	for <linux-kselftest@vger.kernel.org>; Sat, 21 Nov 2026 20:55:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F7A4606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=gXLaYwSm
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c505b2e1cb9so379923566b.2
        for <linux-kselftest@vger.kernel.org>; Sat, 21 Nov 2026 12:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795294537; x=1795899337; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GeBK2KWSTEYOjvpbrLoolF+PIHIEDG1AsTpzAFk1TEA=;
        b=gXLaYwSmXWTREaLwLLM+ay5C5XzlrBUYr7O0dsBnYQlVGtg+A8IMRdGMYB4owSa2J9
         UVVAaU57/dF3/dCbAFIIvr3IGJ1M2BAG1xkIpz81tvwl3jLcAVsLMhNk0iiKCMU4G2a3
         /ooENIhc/pje28/aDXUyaWCcGpAg257tZU7I3mQ705yYKKCc7G+KY5KBTaAZgKwMEl+n
         MRy9eRpsciitgZe1pHcrhWd/ZMjkjwahO3BFlPdEvrBacI1rj9xZQPxmJdkUEQdBsS/u
         ck49jXQJf6KeIhs07ptbT0/e2gZ3CF9LjYV/M1PlsYW6q/vPRynqtBmVp1ocdGOyT8jy
         WWTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795294537; x=1795899337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GeBK2KWSTEYOjvpbrLoolF+PIHIEDG1AsTpzAFk1TEA=;
        b=Qmvn3mx6nUqPtwDFEfi/v7z2v1toKl6mGD25fckC1eBecF+cIA9CJS9T+7FP81NjgJ
         ucfC/BsYqeweJHZ4oVlRgKkSr2BUSjHSdKDdUT6OiPkR3q/tx13Z8aNGbLaMA/69R4Mg
         60iLdHBRFFY/SRjRYuyvHxtrbpbdSZJBZkyKYhgBp+IFaELWN0YJobZigrdxrvpTlCju
         qms5widu3emv8qPETj00691kT92COUpXdFTOv3tbvt7s1ZRUyV39yqttGGAtYodJc6S+
         yxHjES+LnKrNS84J9EoVCiMP5+3mCwY6bDuM7C9pVgknirA9xq9YnO9Vo6+co3anVZmM
         7VRg==
X-Forwarded-Encrypted: i=1; AL+hErETwE5xozIeIk0T7GabSWQvFoVbmbOUJqgdygaNjEJYUMSwmd17pKdnB2x3w8//MkvVN/CrDCpVnh7qU+G3xJg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/XRUz1QN8nTfrnJEAxsYJE1+BiqqthDtKgksWJDKyEyr0PeZf8
	Nl5QwxYXCLkKxh/Y9HQUW51Wp7a/Ui2err4wohk7Qe/TVY3lC0evQcLCNXm7ACuQ9Q==
X-Gm-Gg: AZFdTZfoUXFExeq9WNmvs/I2JBnlcDpWoFeNSjNR5dBgw7CK4edZ9+CChW4Bzuov2yk
	QMYCD70Q3VgCGwQQRcwGZ+qTZFTN9XbUxaDN5jT3x3I7sg+Rcj6kwLzlDamsDU8LlqKvpV3dn7c
	v0a/K7KDDkpV799f3SdUbeGp8DmZ29nec5Ttzqf8CbSgfq8Ykskmrpbc5hA2lqPkZaOlvZhqz58
	VYW7naMrIU/wueTJhYmK73vS9ouLlIBdi7epH41af8t+Qj2p7rKkmg1nFBFQJg4+A2KD50AwLEh
	YxyK4Jaqy+jmTB826QOUfBpDPSB/zX1s4qIQ/2FKGrtoytftVf/SN+Rm2q/F0ilOrsv2Ms3G06a
	Xgqv/Nk4hiuLiU9sByE0JFImPL8TQkjJD5gO/J4ih60466s1UO3FWwC1V54Q2ilViz9tTLNEaTy
	eU0VIFxRoUZfghoBNBr0XrmredMg1pR+DgMC0Y49JKxsf8ZrkcrkUiT644YPORgGS9073OlnbCq
	xdj8gmqiO0VJBiFp69Ocu7MENqSv74iCFykfCWOyu9ncHtO3sGRXt0zrZRMQy54ZKC10rMQ/bnC
	asxkzP+F64J2dHXLpRRONaiSgqJ03lWNXc+Vs9yxZKoLomZB36Pj+358Vn/xg+QkR12UvAeUg9l
	fLUlEBi7+5wDf1Nx6e3cxxj2zlW1ZryCvEALdJGdn/h55YXCUkClkngBLLjjdXuGGDiUMwqv3c1
	QVUBXHfk3D5/YO+4q2GXC7epVvq2XB5FMwIpQZ+lEgGwHaKYtCCtEREIwN/xS1IlI/v5qfNWf40
	9TMqDiBczAhmgT245l5RSUatrfgJsW7NrbgnDBwviraTb1dv2ZmiNvfAb1VBPWuIYodLekjVGNS
	gKA3x/A+fKPN6NFE4c5DfjYX4/QrqdtTzkEd2o9oJQg5cpyi07kE01I=
X-Received: by 2002:a17:906:f8cf:b0:c50:bf14:8ec1 with SMTP id a640c23a62f3a-c513ab4d93emr437004166b.33.1795294536714;
        Sat, 21 Nov 2026 12:55:36 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f2470dfa000000000000000a27.dip0.t-ipconnect.de. [2003:f2:470d:fa00::a27])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aea28f4sm237136666b.33.2026.11.21.12.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 12:55:35 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: netfilter-devel@vger.kernel.org
Cc: Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>,
	Phil Sutter <phil@nwl.cc>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Eric Woudstra <ericwouds@gmail.com>,
	netdev@vger.kernel.org,
	bridge@lists.linux.dev,
	coreteam@netfilter.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH nf-next v11 1/3] net: bridge: fill a forward path only to a port that forwards
Date: Sat, 21 Nov 2026 21:55:33 +0100
Message-ID: <20261121205535.1888592-2-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261121205535.1888592-1-julius@bairaktaris.de>
References: <20261121205535.1888592-1-julius@bairaktaris.de>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

br_fill_forward_path() resolves the destination port from the fdb and
checks only that the vlan exists on it. A port in STP blocking, learning
or disabled state, or an MST vlan that is not forwarding on it, still
gets a path, so the flowtable transmits straight to a port the bridge
itself does not deliver to (should_deliver()).

Add br_port_forwards(), the port and vlan part of should_deliver(), and
fill a path only to a port it accepts.

Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
v11: no changes
v10: https://lore.kernel.org/netfilter-devel/20261115005555.645727-2-julius@bairaktaris.de/

 net/bridge/br_device.c  |  2 +-
 net/bridge/br_forward.c | 19 +++++++++++++++++++
 net/bridge/br_private.h |  1 +
 3 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/net/bridge/br_device.c b/net/bridge/br_device.c
index 0a1ce9e59a4d..f5860e88dbe9 100644
--- a/net/bridge/br_device.c
+++ b/net/bridge/br_device.c
@@ -402,7 +402,7 @@ static int br_fill_forward_path(struct net_device_path_ctx *ctx,
 		return -1;
 
 	dst = br_fdb_dst_port(f);
-	if (!dst)
+	if (!dst || !br_port_forwards(dst, path->bridge.vlan_id))
 		return -1;
 
 	if (br_vlan_fill_forward_path_mode(br, dst, path))
diff --git a/net/bridge/br_forward.c b/net/bridge/br_forward.c
index 54365c6104b5..9dbe9c949558 100644
--- a/net/bridge/br_forward.c
+++ b/net/bridge/br_forward.c
@@ -31,6 +31,25 @@ static bool should_deliver_vlan(const struct br_fwd_dst *fwd,
 	return br_allowed_egress(nbp_vlan_group_rcu(fwd->port), skb);
 }
 
+/* Called under RCU. Whether @p forwards a frame in @vid, 0 without vlan
+ * filtering, as should_deliver() decides for a frame filtered at input.
+ */
+bool br_port_forwards(const struct net_bridge_port *p, u16 vid)
+{
+	struct net_bridge_vlan *v;
+
+	if (!br_mst_is_enabled(p) && p->state != BR_STATE_FORWARDING)
+		return false;
+
+	if (!br_opt_get(p->br, BROPT_VLAN_ENABLED))
+		return !vid;
+
+	v = br_vlan_find(nbp_vlan_group_rcu(p), vid);
+
+	return v && br_vlan_should_use(v) &&
+	       br_vlan_state_allowed(br_vlan_get_state(v), false);
+}
+
 /* Don't forward packets to originating port or forwarding disabled */
 static __always_inline bool should_deliver(const struct br_fwd_dst *fwd,
 					   const struct sk_buff *skb)
diff --git a/net/bridge/br_private.h b/net/bridge/br_private.h
index 014d0b8db8c7..2c73d2549eae 100644
--- a/net/bridge/br_private.h
+++ b/net/bridge/br_private.h
@@ -1048,6 +1048,7 @@ int br_dev_queue_push_xmit(struct net *net, struct sock *sk, struct sk_buff *skb
 void br_forward(struct net_bridge_dst dst, struct sk_buff *skb,
 		bool local_rcv, bool local_orig);
 int br_forward_finish(struct net *net, struct sock *sk, struct sk_buff *skb);
+bool br_port_forwards(const struct net_bridge_port *p, u16 vid);
 void br_flood(struct net_bridge *br, struct net_bridge_vlan *v,
 	      struct sk_buff *skb, enum br_pkt_type pkt_type,
 	      bool local_rcv, bool local_orig);
-- 
2.53.0

