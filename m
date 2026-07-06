Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D83372EDD
	for <linux-kselftest@vger.kernel.org>; Mon,  6 Jul 2026 13:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783345298; cv=none; b=QUEJHzetEqmMGElDMLn/ULqpMnWKo0iPESv+eMznlNyphlFGpRt0c+7rMWTvg9lDgEW3+p++yMQ09D4baDF+mLdA0boWUFkO6qs/XACIspYAt+kh5x3vkH8M4KkswA+9V5VjGeOB+oHRAprOfEF8kwwdwRpe1lTk5k8I76ClyZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783345298; c=relaxed/simple;
	bh=Ufe0EveQE+AdUZ9oZOvP+Lr73QuZkm2itpxET1Vfg2Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YvSc/tvBw1AMYQETfrS7qov8hWq7b4Lk0zuH6A+iOkR2jeEtUvUPhUYPTNTvoLjzP/iiFjJRRy+9VrhXPaFagAr5BZRqvNjuuDCNY6zREM7CPoJxo7C39uVJc1gvbJ5z1q1VPBZ1p1gNcaz5Qkf5oi87KYBbLpZTeC66r5pvsgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gL6qOa3/; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gL6qOa3/"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-493adc4ff7eso3070765e9.0
        for <linux-kselftest@vger.kernel.org>; Mon, 06 Jul 2026 06:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783345295; x=1783950095; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Morm3TxvU/7zWzMzzZHyNL09lXqWMSx5qJfV7XBDDrM=;
        b=gL6qOa3/DPJqe77U399RstJlk6BpK1M4XyAQCA4J+oLytsXDAtPEeAXOv6X+G/OU7J
         CKzB9vs+dwq714r1Y77JWhGG5F7Jfcq8TG/gREr0nk/8/uW7oW2I8FOxjKlJyKsExRbI
         B1hvsyIE9V3L2FRJHcnZm7gL2jMZ9isndEU1eOzWCdg2CS6uZUZ4ASQFxXGzxDeRyVmW
         egNWaFv1n/tERJzxoCYTYBgCY8tyhk6wrwJRbr8++ijfMuooKM+zrAjaf08FwbEqBYAG
         x6kXpN4D0/4xM3A/EEa+5ECRsEH7wQ8uzSuHLJRL7y4Xq8XYT3DALHprf2sGWY/JxHi2
         2v9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783345295; x=1783950095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Morm3TxvU/7zWzMzzZHyNL09lXqWMSx5qJfV7XBDDrM=;
        b=gddhQlHiaA8Mm8/Gkx/Ljic8IOBOMxJfwsi3JcvtGfBkaxXhtlPdamZPlZilpdfbrr
         KZmBhEtQ+YPrsVYhVQMGN/lHoEa/xEHtV3Us3J1iHb+n6VbxDjtinj9KrZAVoN3TzNav
         GBa2hoJ9KM0RxM1/VecRxsHNOfJJMMSMIqvedyXBDPHwv+chyrGY9alJyCuxi+5ZNB8w
         ng5g3xc9BelTnkX75cHhmnTqVesQ9Xy81Vvu80Nr019+ZjYOfcaGMhrdbakakYNw+T1d
         NvMaMGHvN3fgp3fDHPtqDLPmaTawaPgAMqVQN3oP7DPWQqrwhH39p8WYxUuyCY2DOA91
         M81Q==
X-Forwarded-Encrypted: i=1; AHgh+RrtkbzDGQGmKXujCbVyPO/qh07IpTecNbjwgH6tlKtDFur/9RPzwV68VMnGbZ9gvTdGyfGZyNy4RGCmk0oCsFA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx8YU7vhbCk5I/8FhwW7HMxbUUCiTjAJqZSY3ZZJ95xYeGLTL9
	8oa1xdb+5E5uahgFoFxF/ChCJ0TglQXVQ4DAhKuN84jncEprrpbI5eTK
X-Gm-Gg: AfdE7ckjxMo+GujS/TuQqwBUD+k4nVc3t+YZDai7zi+c2syh4Mf8PgGxmjJJNYOBYr7
	E1niPAU2bMnjkqiQ1bpHyCdrenfqsaYtTpvDAMSJWtkFNDNRIDKnW6wh5M54Ei5/PHo78dpMB27
	U6B4LQfxwIvtdTJtQ6idhSmNRWiBMjXGPrx1k1oJbRJAKgYUec+dx1ObTrO4oIbShyGeBwFf9K0
	OQzXAWQOVw4Dg/j0Qa/MaxDY7c6SAfYljaqzwZYbqxFGFQ1z/G0jIK+dBNVrLEr87TiWQg5FWbQ
	5SwOq/WLfJW4/m2yLsLhh6ueaG2V+XgsKAjIyvMDzEYqpKLb7H5jHtZ6PNpnw2YuFPJrR4FA7vW
	Xq1Unpjv2EhtuCdTiCwAcGkkIhwbzyf31ecDsMFO2Voz1taiXpazWYeTT/vT/dfHYQQhGh+swBi
	HtVfz9O6KE88ALjO8vTYzFlh2vdDJnr0RcsAC7G3UpQjXL741lW3RnOOLMkuyHxYFYplUYh/Opv
	oYMqdQnccQWDDvL4ceQRTV4GXGXDAuMrLyKJc0JBVoKplToFZl/lLusLfhTAQ==
X-Received: by 2002:a05:600c:c4aa:b0:493:c326:9038 with SMTP id 5b1f17b1804b1-493d0f39645mr68081825e9.3.1783345294778;
        Mon, 06 Jul 2026 06:41:34 -0700 (PDT)
Received: from hpubt (dynamic-2a02-3100-5b6d-48fc-6651-06ff-fed8-72a4.310.pool.telefonica.de. [2a02:3100:5b6d:48fc:6651:6ff:fed8:72a4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039ae44sm23960881f8f.23.2026.07.06.06.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 06:41:34 -0700 (PDT)
From: Xin Xie <xiexinet@gmail.com>
To: netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Felix Maurer <fmaurer@redhat.com>,
	Luka Gejak <luka.gejak@linux.dev>,
	Fernando Fernandez Mancera <fmancera@suse.de>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xin Xie <xiexinet@gmail.com>
Subject: [PATCH net-next v2 2/4] net: hsr: emit RedBox-MAC TLV in PRP RedBox supervision frames
Date: Mon,  6 Jul 2026 13:41:29 +0000
Message-ID: <20260706134131.61659-3-xiexinet@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260706134131.61659-1-xiexinet@gmail.com>
References: <20260704234704.4297-1-xiexinet@gmail.com>
 <20260706134131.61659-1-xiexinet@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A PRP RedBox must announce the SANs it proxies so peers populate their
proxy node tables. The proxy-announce machinery (hsr_proxy_announce(),
armed via hsr->redbox) already iterates proxy_node_db under RCU and calls
send_sv_frame() once per SAN, but the PRP sender emitted neither the
announced SAN MAC nor the RedBox-MAC TLV that IEC 62439-3 requires.

Extend send_prp_supervision_frame() so that, for a proxy-announce
(identified by the interlink port, an O(1) test), the frame carries the
proxied SAN MAC as MacAddressA followed by the RedBox-MAC TLV (Type 30)
and an explicit End-of-TLV marker before padding.

hsr_get_node() must also accept the reinjected proxy-announce: a PRP
supervision frame is an untagged ETH_P_PRP frame (mac_len == ETH_HLEN, the
RCT is appended only on egress) sourced from macaddress_redbox, which is
never learned from data. Exempt only PRP supervision frames from the
hsr_ethhdr length guard; HSR (ETH_P_HSR) supervision is front-tagged and
keeps the original guard, so HSR malformed-frame filtering is unchanged.

Also align macaddress_redbox so that ether_addr_copy() and
ether_addr_equal() on it are safe on architectures without efficient
unaligned access.

Signed-off-by: Xin Xie <xiexinet@gmail.com>
---
 net/hsr/hsr_device.c   | 33 ++++++++++++++++++++++++++++++---
 net/hsr/hsr_framereg.c | 13 +++++++++++--
 net/hsr/hsr_main.h     |  2 +-
 3 files changed, 42 insertions(+), 6 deletions(-)

diff --git a/net/hsr/hsr_device.c b/net/hsr/hsr_device.c
index 5af491ed2..0973f9a94 100644
--- a/net/hsr/hsr_device.c
+++ b/net/hsr/hsr_device.c
@@ -372,10 +372,21 @@ static void send_prp_supervision_frame(struct hsr_port *master,
 {
 	struct hsr_priv *hsr = master->hsr;
 	struct hsr_sup_payload *hsr_sp;
+	struct hsr_sup_tlv *hsr_stlv;
 	struct hsr_sup_tag *hsr_stag;
 	struct sk_buff *skb;
+	bool redbox_proxy;
+	int extra = 0;
+
+	redbox_proxy = hsr->redbox && master->type == HSR_PT_INTERLINK;
+
+	/* A proxy-announce carries a RedBox-MAC TLV and an EOT marker. */
+	if (redbox_proxy)
+		extra = sizeof(struct hsr_sup_tlv) +
+			sizeof(struct hsr_sup_payload) +
+			sizeof(struct hsr_sup_tlv);
 
-	skb = hsr_init_skb(master, 0);
+	skb = hsr_init_skb(master, extra);
 	if (!skb) {
 		netdev_warn_once(master->dev, "PRP: Could not send supervision frame\n");
 		return;
@@ -393,9 +404,25 @@ static void send_prp_supervision_frame(struct hsr_port *master,
 	hsr_stag->tlv.HSR_TLV_type = PRP_TLV_LIFE_CHECK_DD;
 	hsr_stag->tlv.HSR_TLV_length = sizeof(struct hsr_sup_payload);
 
-	/* Payload: MacAddressA */
+	/* Payload: MacAddressA, the announced node. */
 	hsr_sp = skb_put(skb, sizeof(struct hsr_sup_payload));
-	ether_addr_copy(hsr_sp->macaddress_A, master->dev->dev_addr);
+	ether_addr_copy(hsr_sp->macaddress_A, addr);
+
+	/* Proxy-announce: append the RedBox-MAC TLV (Type 30) and an explicit
+	 * EOT to terminate the TLV chain before zero padding.
+	 */
+	if (redbox_proxy) {
+		hsr_stlv = skb_put(skb, sizeof(struct hsr_sup_tlv));
+		hsr_stlv->HSR_TLV_type = PRP_TLV_REDBOX_MAC;
+		hsr_stlv->HSR_TLV_length = sizeof(struct hsr_sup_payload);
+
+		hsr_sp = skb_put(skb, sizeof(struct hsr_sup_payload));
+		ether_addr_copy(hsr_sp->macaddress_A, hsr->macaddress_redbox);
+
+		hsr_stlv = skb_put(skb, sizeof(struct hsr_sup_tlv));
+		hsr_stlv->HSR_TLV_type = HSR_TLV_EOT;
+		hsr_stlv->HSR_TLV_length = 0;
+	}
 
 	if (skb_put_padto(skb, ETH_ZLEN)) {
 		spin_unlock_bh(&hsr->seqnr_lock);
diff --git a/net/hsr/hsr_framereg.c b/net/hsr/hsr_framereg.c
index 8f708b6e6..b3b106be6 100644
--- a/net/hsr/hsr_framereg.c
+++ b/net/hsr/hsr_framereg.c
@@ -293,8 +293,17 @@ struct hsr_node *hsr_get_node(struct hsr_port *port, struct list_head *node_db,
 	 */
 	if (ethhdr->h_proto == htons(ETH_P_PRP) ||
 	    ethhdr->h_proto == htons(ETH_P_HSR)) {
-		/* Check if skb contains hsr_ethhdr */
-		if (skb->mac_len < sizeof(struct hsr_ethhdr))
+		bool prp_sup;
+
+		/* A PRP supervision frame is an untagged ETH_P_PRP frame
+		 * (mac_len == ETH_HLEN); its RCT is appended only on egress.
+		 * HSR (ETH_P_HSR) supervision is front-tagged and still must
+		 * contain a struct hsr_ethhdr.
+		 */
+		prp_sup = hsr->prot_version == PRP_V1 &&
+			  ethhdr->h_proto == htons(ETH_P_PRP) && is_sup;
+
+		if (!prp_sup && skb->mac_len < sizeof(struct hsr_ethhdr))
 			return NULL;
 	} else {
 		rct = skb_get_PRP_rct(skb);
diff --git a/net/hsr/hsr_main.h b/net/hsr/hsr_main.h
index 134e4f3ff..c27cfdd9c 100644
--- a/net/hsr/hsr_main.h
+++ b/net/hsr/hsr_main.h
@@ -211,7 +211,7 @@ struct hsr_priv {
 				 */
 	bool fwd_offloaded;	/* Forwarding offloaded to HW */
 	bool redbox;            /* Device supports HSR RedBox */
-	unsigned char		macaddress_redbox[ETH_ALEN];
+	unsigned char	macaddress_redbox[ETH_ALEN] __aligned(sizeof(u16));
 	unsigned char		sup_multicast_addr[ETH_ALEN] __aligned(sizeof(u16));
 				/* Align to u16 boundary to avoid unaligned access
 				 * in ether_addr_equal
-- 
2.53.0

