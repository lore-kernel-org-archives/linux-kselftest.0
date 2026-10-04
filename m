Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E0247044E
	for <linux-kselftest@vger.kernel.org>; Sun,  4 Oct 2026 17:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791134200; cv=none; b=tneUHuRYKWB+B/B+F6jfhR3vuWW88a6qlWihCTINMRXd7oLjiBBWVfyQn3slYNB42mMlSwkq07O5tCvlhxBFBO6NddfYY9wrV1SqpebOLi8KlX7OfKs0Qw6PZCwu6Z6wvub400rMsLj1LWWkb7cMj+DQ792h7uA54uLNZOh2mSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791134200; c=relaxed/simple;
	bh=N2fEn5naZVynWAREy9aYIddLfbC9cTCqMP6evTuQQrw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oABfMmdwBhCRZcR5mvaNOjmC2S+DBrPzhCw9eZUnkSvid/ZJUeAorhIMWgE66qd1xnVLrSlWcOHjhvgz48IwvTJRYz05r04IY2Sd1q6Ts4BaIpaRIgIUY6P3BFu3ePZAw6FSswhXgPt8YLriq38YfDk7sswkxFoLNJ7Q6qAx2mI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de; spf=pass smtp.mailfrom=bairaktaris.de; dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b=gImvn9C/; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b="gImvn9C/"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c2e43f3d1fdso143421166b.3
        for <linux-kselftest@vger.kernel.org>; Sun, 04 Oct 2026 10:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1791134191; x=1791738991; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7pciMmt6xvkKxAILLtPxurNk5XIP3aiXY2Q8mmcn43k=;
        b=gImvn9C/gR68omXOgmOhHwB+3WO9azBAH1Vach+nKQaIJvVRbIYvjOarZ4WLaT7S6Y
         TzIVwG6JwBYrb3MV5N4pb8MQxzeLsJASfqKYwOlbmRHjnmoXsVIqFujn1pa7eKo7ZaAb
         m/fVlaQwrJT5hncJVqNrYVw1yc3gSpqdks04MW2Mp/RD80UABCaGODDtnzKxdrVe5dZ2
         iEVIoXDKWuH+8HPnkYIGuk9Jsf5mhWLoAmDvFySxvE5OocbHZ6xLboBMxPZpzFIwuuWP
         /kmUn4bPKsMsX+A3kVAUK/5+B9bYgdnfOwK5VIZaf1HzvBze2UJfi+RvhQDFQuC/E1NF
         toxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791134191; x=1791738991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7pciMmt6xvkKxAILLtPxurNk5XIP3aiXY2Q8mmcn43k=;
        b=b7w+iVohhl5UbjJ1+WavSIPK3KhvAGRpcup5iLtVbdZl6UUP6JDCTzSvM2BrJC5BFa
         xSAwWt4q52JdTPJ9CqauDUl6xCdfOMK76UvdhLWRcPUAQbbocT0gBnJ8BvMn299pmedq
         e4Fh2Ld6B270cpxsgZMQaH3a02fIUUdP/GxKwyrmlbkEMpPljQZ8rRfSUPnuS132xKS+
         ess47/rVQLe9ApcR8M0JgCGDPxFrtbuFROxKu8trLfiSZmOAfgwP+4OGaZcshk1+ripa
         nUM8sFSSJvZ5Uqul3UUmOXXO9RRgq1JZT0NyYD6TEk4RYlmXV98Owgwipk9NH4Z/y3Pp
         9H6g==
X-Forwarded-Encrypted: i=1; AKwUvBzTcUwrK+jcE3Y3/+irSMuTyYJHU3+y4XH0L4Nk+qne3F/G6bbP8QkbCe/B2/W+UfVbSMgewFnPM0d9Si1onKs=@vger.kernel.org
X-Gm-Message-State: AFuF++m3l0E2ImSfHNehhxv6ZRp3SjxRkCI3pbKHz1G/3SXgpLOCkOZj
	YM2bRJHqKPPOUll8UZy17aGFhqx0QOA9v8HBZbeDuujabE/ojxk/4U7vmAogfkT9Jw==
X-Gm-Gg: AYBFou32+vhM43y2uzNQHLg/5C4WgKjdST1Vt2mFX4UD6kLmxeChqT7Nz2CaDsx+msQ
	7HBKm65pMo1PU2kDoMxK44xSDv5SK0yKS1aawsgM9M/YNdCnChiI4nmsm2Wsebuzz9xAZ47OrOs
	TL6zmpcRU5uqs6VXMvc7IVPTBBvFR9Qxep5+9I3G05Y48GSSDYv2seB1WypbI5n3bb8LE650MIu
	w35NWqm1lAOMLkrNSW1WKhp3lAqIvMzxBauaBCzrgZJfBVbSlHknQZ9Di31rSC2krkkV+1BWM4S
	ZJDD2n51Gw2u8Zg+u4bpUfLmUjQooE44njNG3JmQCanBFJEuIdsu2XoXu6cLp841vlOFFyMYayY
	jepX3N9lIzld9yvBoYGV+P4HyTqvBxIY7+/dAeeLmmh1qNb+jsJSPwwJNnP1/S/GBLVJt+4I1Ou
	AuHxwbcZM3cSIf45JRQ9PKrEZsZ602x6Lo1wvA6V4hQVvtWTK2OosQUf+MT7nssXtmADjBOMGg9
	HifaIFeosXiRFqFWGRQXBv09B5S1fdC8wVLt2dmu0tKQs7vWmWPKPko/ej2Zm3I0sCu6ugW3pfD
	PhkfEcENopdpx8WqB+CfffeT5pbGl/iFrQHCA5aDMRYAdoP0rWlQSq7QY1TSeBmPkuB7PICyk1q
	K1/9l4MWuBsBHZr+S/pRjHdSq676xy264lEWQYvN6bq7knERUErOq9rxjIhcJLezJKI4AMS+iU4
	o6tO1eItq1l4zGexMMmH7B6nE=
X-Received: by 2002:a17:907:3f1f:b0:c2e:317e:d711 with SMTP id a640c23a62f3a-c2e6edf32b9mr428205766b.27.1791134191269;
        Sun, 04 Oct 2026 10:16:31 -0700 (PDT)
Received: from Desktop (pd9513667.dip0.t-ipconnect.de. [217.81.54.103])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e4cf9ddbesm317345166b.69.2026.10.04.10.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 10:16:30 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: pablo@netfilter.org,
	netfilter-devel@vger.kernel.org
Cc: kadlec@netfilter.org,
	fw@strlen.de,
	coreteam@netfilter.org,
	netdev@vger.kernel.org,
	geldot@protonmail.com,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH nf-next v2 2/4] netfilter: flowtable: promote a flow offloaded in one direction only
Date: Sun,  4 Oct 2026 19:16:26 +0200
Message-ID: <20261004171628.3544978-3-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261004171628.3544978-1-julius@bairaktaris.de>
References: <20261004171628.3544978-1-julius@bairaktaris.de>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The next patch offloads TCP flows without a reply in the original
direction only. Keep the reply direction of such a flow on the classic
path until the connection is assured, then offload it too, as act_ct
does for UDP. The XDP flowtable lookup does not return that reply tuple
either.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 net/netfilter/nf_flow_table_bpf.c |  4 ++++
 net/netfilter/nf_flow_table_ip.c  | 26 ++++++++++++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/net/netfilter/nf_flow_table_bpf.c b/net/netfilter/nf_flow_table_bpf.c
index cbd5b97a6329..7070bc600db1 100644
--- a/net/netfilter/nf_flow_table_bpf.c
+++ b/net/netfilter/nf_flow_table_bpf.c
@@ -50,6 +50,10 @@ bpf_xdp_flow_tuple_lookup(struct net_device *dev,
 
 	nf_flow = container_of(tuplehash, struct flow_offload,
 			       tuplehash[tuplehash->tuple.dir]);
+	if (tuplehash->tuple.dir == FLOW_OFFLOAD_DIR_REPLY &&
+	    !test_bit(NF_FLOW_HW_BIDIRECTIONAL, &nf_flow->flags))
+		return ERR_PTR(-ENOENT);
+
 	flow_offload_refresh(nf_flow_table, nf_flow, false);
 
 	return tuplehash;
diff --git a/net/netfilter/nf_flow_table_ip.c b/net/netfilter/nf_flow_table_ip.c
index c8c29a9a1684..289fe6c9e4f5 100644
--- a/net/netfilter/nf_flow_table_ip.c
+++ b/net/netfilter/nf_flow_table_ip.c
@@ -465,6 +465,26 @@ nf_flow_offload_lookup(struct nf_flowtable_ctx *ctx,
 	return flow_offload_lookup(flow_table, &tuple);
 }
 
+/* The reply direction of a flow offloaded in one direction only stays on the
+ * classic path so that conntrack sees it. Once the connection is assured, that
+ * direction is offloaded too.
+ */
+static bool nf_flow_reply_unoffloaded(struct nf_flowtable *flow_table,
+				      struct flow_offload *flow,
+				      enum flow_offload_tuple_dir dir)
+{
+	if (dir != FLOW_OFFLOAD_DIR_REPLY ||
+	    test_bit(NF_FLOW_HW_BIDIRECTIONAL, &flow->flags))
+		return false;
+
+	if (test_bit(IPS_ASSURED_BIT, &flow->ct->status)) {
+		set_bit(NF_FLOW_HW_BIDIRECTIONAL, &flow->flags);
+		flow_offload_refresh(flow_table, flow, true);
+	}
+
+	return true;
+}
+
 static int nf_flow_offload_forward(struct nf_flowtable_ctx *ctx,
 				   struct nf_flowtable *flow_table,
 				   struct flow_offload_tuple_rhash *tuplehash,
@@ -478,6 +498,9 @@ static int nf_flow_offload_forward(struct nf_flowtable_ctx *ctx,
 	dir = tuplehash->tuple.dir;
 	flow = container_of(tuplehash, struct flow_offload, tuplehash[dir]);
 
+	if (nf_flow_reply_unoffloaded(flow_table, flow, dir))
+		return 0;
+
 	mtu = flow->tuplehash[dir].tuple.mtu + ctx->offset;
 	if (flow->tuplehash[!dir].tuple.tun_num)
 		mtu -= sizeof(*iph);
@@ -1074,6 +1097,9 @@ static int nf_flow_offload_ipv6_forward(struct nf_flowtable_ctx *ctx,
 	dir = tuplehash->tuple.dir;
 	flow = container_of(tuplehash, struct flow_offload, tuplehash[dir]);
 
+	if (nf_flow_reply_unoffloaded(flow_table, flow, dir))
+		return 0;
+
 	mtu = flow->tuplehash[dir].tuple.mtu + ctx->offset;
 	if (flow->tuplehash[!dir].tuple.tun_num)
 		mtu -= sizeof(*ip6h);
-- 
2.53.0

