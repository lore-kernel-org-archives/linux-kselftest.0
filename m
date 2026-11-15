Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794704169;
	b=BA7WQqdJ6TTWSD5apUmXIY1yv2IzxAPu0AdwGIIN1k1T2mQ75/JjPZXJs/Hcqb1Ams9v
	 9nF5bKobd2tFyn4C8kjC5QdYNunK7piuS9T8vZC5w92taXDzf8VAV20NNEdQNA4Ec9Pzf
	 WIKPbWXazsGhp+Ddag/YnhTGrIatE2VYk0JV2DejcHxFaW9tBEIGj3INF55tpH8LM5ycA
	 QyFab7d3mQquYWnf/6eUj+TLBQoI9BzkkAs0Vek8DltVwCCzx4C6W4zfrFBAvCXQY2IoI
	 RBzfKqoJU44L884r7+CxyDxlLSIg31GXM0KpBy3Mo5wbxrxfgc0RNFDYxfVw5AUB2DA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794704169;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=EXiLXVBflQGlm4cX13sHzQkGhpIOp9cmpNR58hxiL1A=;
	b=12Qy7OQbK1IqImnrIXPConziTaibrLLir3nXbA2ZX5NouD/fOCvfcko3lE696+n5OAUh
	 YmawBzI/HGXQnBRNHgs/Fa36HFUxmUUVERLg3zvBj/xAV9Ze01GgxMafnJk8NBbjdiRnz
	 H7yS2Rbl4Bvy3MPQFApWRVK15R9Z7sHpdciZ54jpRLmSgvCA6eMWL7vxGz/sJgvYD3flH
	 PeXzCCYvROCXKM9kWRkGFJU7PqDJRrIQ8TzEZvw6sLyvrs0ZmM7GSTWlyS38koAzRN4fh
	 5jykH4fxYWMEVnVIFJ7fZqKDTrQ+tsl32aYIiN1k3O1zwezBIi//Eb3GRM+2CZqM80A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b="nLwi/sa3";
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF60606A32D
	for <linux-kselftest@vger.kernel.org>; Sun, 15 Nov 2026 00:56:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCF60606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=nLwi/sa3
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c50a4a2132cso283845066b.3
        for <linux-kselftest@vger.kernel.org>; Sat, 14 Nov 2026 16:56:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794704167; x=1795308967; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EXiLXVBflQGlm4cX13sHzQkGhpIOp9cmpNR58hxiL1A=;
        b=nLwi/sa3548+Zm1k4zR5gIG8GKanUjn0tMfXpNZPuTKr+P9PKrYmiNthDAKdZ6PFv8
         ldheE2YF0jLlXkFGdCnkklO2PVJj6HXg87kSZsy9ygc9i+LvJ0V81TW3FFROQOJMiUfu
         pMATh6jWwbA76icBXAGerKleOZ3gstRB+hWkCYIPgTsmtJAUojTbWJkjo6MAlgF6H6BR
         i7KmAUpjUSZF5+sXrw/7CUsuF67bJ/0p1gcpx8gaMA2k0s7aHsOonF1CXw0J3MuewHdT
         cfjxpQkykCc6JzIOZZO/ZsvDo0I0Zu1uwxnPgjUF7L92dUGMDsUOFb1tZLu7xtCulFJS
         uh/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794704167; x=1795308967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EXiLXVBflQGlm4cX13sHzQkGhpIOp9cmpNR58hxiL1A=;
        b=YtTUFZ4oLNsYgX9g1v/t8i05HFXX+Z4LRS8yKd5K1zcxZ+jlqXr2XJRJGx56J58DJF
         PaL8Ta82EzDdIIUNMXJQRVJwSH+hY7l7IJyx0jdlxnfwWKzUFisyorokkFLb9mWxY/Av
         f+8wZDj1xTm0lR7s5wpekdo2iLZDLANPd+BUEUdMbok1YwV0vRfuApArdXWOuvzzovtD
         cJ1OMmqzgKNff11LyLQRErcIshRILblJuwv8jPdCUrT6Rie8FJRZs+GT4us3T3pU0IQ+
         qS5JUi37oJCdQ+iqk/1dDDtJkYG3teJNhAL62v7J0SPQYOKNHYhjOFoqy/BxgAgNovMI
         RbCw==
X-Forwarded-Encrypted: i=1; AL+hErGU5S00hRkMsQcqbaHvGTaVK+J9LhViWXsKNoe5ujELvSju6ZHsel2v4cWHjrRFJIraaB0ajgA2tdCv+o1tOQs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/+trOoubNMIoY96NjiEfvRTUtwAlE2KWcs41zMdEUaFz2u3JS4
	BVf2nkUUN+0oNIkJbnFJZHEFF2xvPSwLftnvwwEGQLGHenc/lVRrU85Lb9Hl5e9TCQ==
X-Gm-Gg: AYBFou2VmFsJ5mGJ49v1ZcFRwdxYthJnIiGxog85Dt14+Tiy2j8IszZZ3SUdf2xqxMY
	qqTWEzzn/SzCf7DrVPVJm+3mLStWqnra/791jpY3W6Mqhjsm4vLeOcPD1QFe/nOCdltGtsWmx+q
	yaqDwbJ5PvYYTiy/ShFJYCW30SL0tlX6421DGnJuMbSO7i0Mgu7KE/dMuxsjDDnD3USmocFxaQK
	F5r2eFF721ev/rImOA4h1RPHuoZyj2rt33WhSCKidCnVrj+fEgpp7hspriZ+TZVqJWWHWZEkCjo
	PU0lrJH08vHI6z8Rg4MHDKdmTHWgFMQsYmmB7/zi6heMcMof/BuWIXjbz0XCM1bb12d5f71SU+I
	21tw9EvknS234qqRRPSXJPAKP3oOYIhsIJiFSQFdzm4KVEPkjzdANIQ/MzNtkM3YW/dB5PAf/ha
	4tZr4wDucbzquRXw4tD61bqmqy6k/rD7H8RgX9D3eWu+gukZjFnKDYDp5+knoEyZjU93H4RtC9A
	Y+lqqI/U+WiuKm+FoJ8FZ6kk5gNZcU1kZWtn5zqm80lM2/Ar/QWwI6UBSBD/nmksetyC/e/U6IY
	gxT1NVFny6YvkLbp1WIPrUfY5oGLloJY+vuWn2uKX2+5AxSVqpmlZ4RBnk996UW4IAp8XGGz17o
	RiAfa3XU/fV20fNPa3T6efg9QnOEgZo7Ahg9719AqzfKKXxqTmBXjWCBh+Zp/Cf1hwHrZHuvWCM
	c7r0w4tbim7U0bNMr0zROU8WGrQiVxgDD8mAfHLVOKZwimesDz6fS/eJyiI+DcGdpbdm9HF6oo3
	Nu4HD6VDGx0kcC5or7Lw1ypNbUaC59OVZ4PJ57PJlWfLOWKin85Xu33i/Q24kDnhHX522r/o99/
	/GYWHbdTGhVbT/nKRfgCg68FuWHT4K49Rqq8bXbnHgdyMGcgE3o=
X-Received: by 2002:a17:907:6d02:b0:c46:9ca9:f524 with SMTP id a640c23a62f3a-c50963b6917mr545268566b.32.1794704167251;
        Sat, 14 Nov 2026 16:56:07 -0800 (PST)
Received: from Desktop (p200300f2470a670069e45948b1a17361.dip0.t-ipconnect.de. [2003:f2:470a:6700:69e4:5948:b1a1:7361])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b921d4sm266313166b.83.2026.11.14.16.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 16:56:06 -0800 (PST)
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
Subject: [PATCH nf-next v10 1/3] net: bridge: fill a forward path only to a port that forwards
Date: Sun, 15 Nov 2026 01:55:53 +0100
Message-ID: <20261115005555.645727-2-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261115005555.645727-1-julius@bairaktaris.de>
References: <20261115005555.645727-1-julius@bairaktaris.de>
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
v10: new; v9 transmitted to a disabled port and in a vlan removed from
the port, which the gc then left in place

 net/bridge/br_device.c  |  2 +-
 net/bridge/br_forward.c | 19 +++++++++++++++++++
 net/bridge/br_private.h |  1 +
 3 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/net/bridge/br_device.c b/net/bridge/br_device.c
index 0a1ce9e59a4d4..f5860e88dbe95 100644
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
index 54365c6104b5c..9dbe9c9495582 100644
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
index 014d0b8db8c73..2c73d2549eaec 100644
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

