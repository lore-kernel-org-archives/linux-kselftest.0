Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF9613D170B
	for <linux-kselftest@vger.kernel.org>; Sun,  9 Aug 2026 12:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786277705; cv=none; b=TEABKv1qx3XMKbZQbgKbwM8HYNLjdM8XDksnPKCSpUDZH1RBrNUdNTgMfZUYFKNC4B66ySakxwI93kppyIAONTX91bwEq3m1kvXdjEwZigqAy/J5NVOxhdS70Or9ew+Rqb8nTXg7AKlFU0GedMfHXpXOibJZhmkZbQQG4nk/mcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786277705; c=relaxed/simple;
	bh=v2IOzHAE8P7e7RPtUYejuCgStYNSB6rjJrtbYCdnJjI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pedESjpDHIfYUyLIvlyQLf3eklMNsN4JlCpypKLbxPGUuOuR6IkEdsIgjPxtXiWgeeWoUAJVsNGCR31kK0wpJhwTkVWceZO8xBnpAvYualme/0HcBkRrR34Sm+0enHpICOfX1cYCm9aB1KEarT7cGwD74RDwmYrvWIMDr9jgiQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jaxRpvxp; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jaxRpvxp"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47f706438c3so35698f8f.3
        for <linux-kselftest@vger.kernel.org>; Sun, 09 Aug 2026 05:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786277701; x=1786882501; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tK5etVjV8isZ+EPgOl8b6oOCjBS1RkzIoG5Pe4Znpcs=;
        b=jaxRpvxp0+bYmTbQuUsag8eEDCxNEzgqanm0XvuzVSn+sTWBP88Jkh4FXmNy5t7mz8
         KbYNwlorwXWySIDuVP4MMWVZfPlXD5sh8HtbWO0mCWdmOGKSmCeVVjfheZbihHL7svER
         Ga8eHizLOtzHO+RR3sNQwqbU6RQ+EIEny/XTeqMsi4FFsfrFq6y1RtLlyeWDXORQ8uQk
         Ya7ea/dQ88bbES/bHkRqRIk2S3QOf0BSjaWRuzICqxSxeXM2vbYdAHNH0paz9N70T6Cw
         q2ekAFuPzcB3JOp/eu7fGtOnPolB1lBb1DS8R1o7a8Jz8zXP52YvLA0nbJgNkar4Ujgr
         Rdaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786277701; x=1786882501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tK5etVjV8isZ+EPgOl8b6oOCjBS1RkzIoG5Pe4Znpcs=;
        b=ruXO1BIYqMUCyRzQYt6VZHsRPBouV5TpBGrAUFh4aPUoWmGX+byyJMIQKsfPE5OidN
         yPqGXzajhR5sLFHbniUhU263n2u6wtP3OQPDISHRzNEdM8G+w7hdDCSic9cmxzS3mIpP
         YRPgP5sW4ELeb87FFlzgcVb/49mmRUIvmfpCJ53BtTvVHnNKEh3ziEUHLiZgVKiSYLcB
         nHAWDAGk47jx02x3yATl4xGYE+cs9Q78IkYlAWRcpc9mdUDMxBIZrEAMmrDckLQT0TY4
         HPTO6wlXI1AJKRxN0tAqy+G6R7nrfpDesPG64ME1oHxd5R9FkKTrjW0/EIn55EmY33N+
         1jJw==
X-Forwarded-Encrypted: i=1; AHgh+RqXuaL5PcE/zDnvGNI9iFJDR4FJ21EFqMNg7gQ1FDNWgs4FBeNNgB5HaIyt/J2em8TFr9T+N8Gx0SiS3ef1So0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9uLtondAtaHRldk2qnrvRBx3N7RiQDHUu0+mxf5cTbDZVDMMA
	H8PR0V/b5lh0FK/vvqHdnuGHzuwV0QzsB4OplLlnLG9mgJ40xFN6lM1K
X-Gm-Gg: AR+sD101n5fbHj8NtlghqTSJf3gli2KFfI/V556PAImcKKZwfgO36DlufV1R4pb1DwQ
	0wi5f2ZZabfumeLHssumiNUnuMVtWwCiGcvc4DEcf0xNU5hMzcuALj7TOFg9q186k7tJ4kljOQX
	nErgNdd2CeYaiWi/+y44n3kwfqTkUJVKHSY209/7Jw7Fg0B7NJBnSz+2svG6Hu9Jdnn/Ho6RwG2
	LCoSJSMGziAz2gPjacczMZ8AP7My0gPu2rMAPpn8kIKT4Rla6ChY1N4mr9wiWHe2uLP8yNtsTKA
	KqJWloKzbNe9AedNjmrViPjHgu2csegk3T8DWjhSIEptFgxMHaMigl/MBWmRy0F6ZOu2l7u610j
	G1yR1or3DQBtPYK2pLoV13bUMxzw1zarmQQb20Uzce7hnfdCmo3Txz70/esGbxKEAaNgqQiuirJ
	h5iB4YP7NwQSAUjNSxkD74ql+00dDwx5aQvg3z664ZiYvf7ZZlgMn2wqoot3RXUJwufmZsyC8sC
	fEi3p9+EsA2Ck8evbhqt41uYS7WUQDKVudtleObKhpwHUMKzyI5pdNi/7wd3aKY/HbtmRwCd8gQ
	It1j9yxD5RjzKpouVhiWN3RY1qfGCcU=
X-Received: by 2002:a5d:5c82:0:b0:481:3db3:8eb with SMTP id ffacd0b85a97d-4813db3093fmr3525985f8f.1.1786277700954;
        Sun, 09 Aug 2026 05:15:00 -0700 (PDT)
Received: from L-022584.energy.envision.com (dynamic-077-012-133-135.77.12.pool.telefonica.de. [77.12.133.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021e7b3fsm25158434f8f.20.2026.08.09.05.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 05:15:00 -0700 (PDT)
From: Xin Xie <xiexinet@gmail.com>
To: netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	andrew+netdev@lunn.ch,
	shuah@kernel.org,
	kees@kernel.org,
	petr.wozniak@gmail.com,
	qingfang.deng@linux.dev,
	fmaurer@redhat.com,
	luka.gejak@linux.dev,
	bigeasy@linutronix.de,
	xiaoliang.yang_1@nxp.com,
	skhawaja@google.com,
	liuhangbin@gmail.com,
	stable@vger.kernel.org,
	sdf.kernel@gmail.com,
	Xin Xie <xiexinet@gmail.com>
Subject: [PATCH 3/4] net: hsr: unfold GSO super-packets at the forward entry
Date: Sun,  9 Aug 2026 14:14:53 +0200
Message-ID: <20260809121455.1745-4-xiexinet@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260809121455.1745-1-xiexinet@gmail.com>
References: <20260809121455.1745-1-xiexinet@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

HSR/PRP require per-wire-frame tags and sequence numbers; treating a
GSO skb as one frame breaks those semantics.

Classify GSO skbs at the forward entry by effective protocol rather
than ingress port. Segment plain aggregates and process each segment
normally, preserving local delivery and forwarding. Drop ETH_P_HSR and
ETH_P_PRP aggregates (per-frame metadata cannot be rebuilt),
classification failures (unreadable header, stacked or S-tag tagging),
and aggregates with unreadable net_iov (device-memory) fragments:
their payload is not host-readable, and segmentation would leave the
segment payload uninitialized, silently dropped at transmit or exposed
where netmem transmit is enabled.

In-tree software GRO does not merge PRP RCT frames (its IPv4/IPv6
length checks reject trailing bytes); fixed-on GRO_HW output is
outside this guarantee.

Also remove the GSO_MASK member types from the HSR master's
hw_features: local traffic is segmented by the core before the forward
path, so the master funnel branch sees single frames, and TSO and the
other GSO_MASK offloads can no longer be enabled on the master;
generic-segmentation-offload stays changeable and is cleared at
runtime.

This patch depends on patch 2 ("net: hsr: shrink seqnr_lock to
sequence counter updates") and the sparse-bitmap duplicate discard
introduced by commit aae9d6b616b5 ("hsr: Implement more robust
duplicate discard for HSR"); older trees require an adapted backport.

Fixes: f421436a591d ("net/hsr: Add support for the High-availability Seamless Redundancy protocol (HSRv0)")
Cc: <stable@vger.kernel.org> # aae9d6b616b5: hsr: Implement more robust duplicate discard for HSR
Signed-off-by: Xin Xie <xiexinet@gmail.com>
---
 net/hsr/hsr_device.c  |   2 +-
 net/hsr/hsr_forward.c | 106 +++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 106 insertions(+), 2 deletions(-)

diff --git a/net/hsr/hsr_device.c b/net/hsr/hsr_device.c
index 3fd1762d8916..248cbb142e21 100644
--- a/net/hsr/hsr_device.c
+++ b/net/hsr/hsr_device.c
@@ -652,7 +652,7 @@ void hsr_dev_setup(struct net_device *dev)
 	dev->needs_free_netdev = true;
 
 	dev->hw_features = NETIF_F_SG | NETIF_F_FRAGLIST | NETIF_F_HIGHDMA |
-			   NETIF_F_GSO_MASK | NETIF_F_HW_CSUM |
+			   NETIF_F_HW_CSUM |
 			   NETIF_F_HW_VLAN_CTAG_TX |
 			   NETIF_F_HW_VLAN_CTAG_FILTER;
 
diff --git a/net/hsr/hsr_forward.c b/net/hsr/hsr_forward.c
index 8e4158a9b57c..ae49c2d74ace 100644
--- a/net/hsr/hsr_forward.c
+++ b/net/hsr/hsr_forward.c
@@ -12,6 +12,7 @@
 #include <linux/skbuff.h>
 #include <linux/etherdevice.h>
 #include <linux/if_vlan.h>
+#include <net/gso.h>
 #include "hsr_main.h"
 #include "hsr_framereg.h"
 
@@ -732,7 +733,7 @@ static int fill_frame_info(struct hsr_frame_info *frame,
 }
 
 /* Must be called holding rcu read lock (because of the port parameter) */
-void hsr_forward_skb(struct sk_buff *skb, struct hsr_port *port)
+static void hsr_forward_skb_one(struct sk_buff *skb, struct hsr_port *port)
 {
 	struct hsr_frame_info frame;
 
@@ -761,3 +762,106 @@ void hsr_forward_skb(struct sk_buff *skb, struct hsr_port *port)
 	port->dev->stats.tx_dropped++;
 	kfree_skb(skb);
 }
+
+/* GSO fan-out funnel: unfold super-packets before per-frame processing so
+ * each wire frame gets its own HSR/PRP tag and sequence number.
+ */
+/* Effective frame protocol of a (possibly VLAN-tagged) skb, or 0 when
+ * it cannot be determined or the tagging exceeds what HSR supports.
+ * HSR supports one 802.1Q C-tag only: an accelerated tag must be a
+ * C-tag with a non-VLAN inner protocol; an in-band tag is unwrapped
+ * exactly once and a residual VLAN EtherType is rejected. Read-only;
+ * no state is kept beyond the immediate protocol value.
+ */
+static __be16 hsr_gso_effective_proto(const struct sk_buff *skb)
+{
+	struct ethhdr eh;
+	struct vlan_hdr vh;
+	const struct ethhdr *eth;
+	const struct vlan_hdr *vhdr;
+	__be16 proto;
+
+	if (skb_vlan_tag_present(skb)) {
+		/* HSR supports one 802.1Q C-tag only. */
+		if (skb->vlan_proto != htons(ETH_P_8021Q))
+			return 0;
+		if (eth_type_vlan(skb->protocol))
+			return 0;
+		return skb->protocol;
+	}
+
+	eth = skb_header_pointer(skb, 0, sizeof(eh), &eh);
+	if (!eth)
+		return 0;
+
+	proto = eth->h_proto;
+	if (!eth_type_vlan(proto))
+		return proto;
+	if (proto != htons(ETH_P_8021Q))
+		return 0;
+
+	vhdr = skb_header_pointer(skb, ETH_HLEN, sizeof(vh), &vh);
+	if (!vhdr)
+		return 0;
+
+	proto = vhdr->h_vlan_encapsulated_proto;
+	if (eth_type_vlan(proto))
+		return 0;
+
+	return proto;
+}
+
+void hsr_forward_skb(struct sk_buff *skb, struct hsr_port *port)
+{
+	struct sk_buff *segs, *next;
+	__be16 proto;
+
+	if (likely(!skb_is_gso(skb))) {
+		hsr_forward_skb_one(skb, port);
+		return;
+	}
+
+	/* Conforming plain-protocol GSO super-packets carry trailer-free
+	 * sender payload and are segmented here: each segment is delivered
+	 * or forwarded as its own wire frame, on any ingress role.
+	 *
+	 * The gate is content-based, not port-based. An aggregate whose
+	 * effective protocol is ETH_P_HSR or ETH_P_PRP cannot be safely
+	 * segmented and is dropped, as is any skb whose header cannot be
+	 * read, whose tagging exceeds the single 802.1Q C-tag HSR
+	 * supports, or whose fragments are unreadable net_iov
+	 * (device-memory) pages: software segmentation cannot read their
+	 * payload, so each segment would inherit the unreadable flag and
+	 * carry uninitialized data. With NETIF_F_HW_HSR_TAG_RM the lower
+	 * has already stripped the tag, so such aggregates arrive plain
+	 * and are segmented.
+	 */
+	proto = hsr_gso_effective_proto(skb);
+	if (!proto)
+		goto drop_gso; /* classification failure, fail-safe */
+	if (proto == htons(ETH_P_HSR) || proto == htons(ETH_P_PRP))
+		goto drop_gso;
+	if (!skb_frags_readable(skb))
+		goto drop_gso; /* net_iov (device-memory) frags are not host-readable */
+
+	/* features = 0: request full software segmentation. tx_path is true
+	 * only for locally generated traffic on the master; ingress from
+	 * the interlink follows RX checksum semantics.
+	 */
+	segs = __skb_gso_segment(skb, 0, port->type == HSR_PT_MASTER);
+	if (IS_ERR(segs) || unlikely(!segs))
+		goto drop_gso;
+
+	consume_skb(skb);
+	while (segs) {
+		next = segs->next;
+		segs->next = NULL;
+		hsr_forward_skb_one(segs, port);
+		segs = next;
+	}
+	return;
+
+drop_gso:
+	port->dev->stats.tx_dropped++;
+	kfree_skb(skb);
+}
-- 
2.43.0

