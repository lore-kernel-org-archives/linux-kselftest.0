Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F1AF3955D7
	for <linux-kselftest@vger.kernel.org>; Fri, 17 Jul 2026 20:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784319309; cv=none; b=tE2D6OJzSdnxtJjYhwK+pIh0ApsZAqrNwoUR5VjS9cHQRTm5vZglujTx5ffSL+z5AHoeyYW2MU9c+FOb85pRkPQgSfr2or1EDsOXWRkpnd1sKgPTvBui9bUnc2xMqwjM/k2m+bnel99mg46Ptaly1kEa1co/XSxNwQiBjs5xFOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784319309; c=relaxed/simple;
	bh=PMfdPP8tbxO4rGaiNWWMMR+GuufY3qRT/GwPQyy8FmA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LNikQYIX6lxI8oxotz3kyA1dkAzpJQebGuDIjqBEzaDvm+m6INO10QIiqOBHsFHXCov6sPNvl9I1HUZCwlU7sAeLtB3ayMDWgEyetNs8fACr1GSwQGL/Cl4jcFN2tspReBn0Yk3aM1Z7P3yUrNNyxPgKHuvOb1B7khvQQNnx7H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rCJNaLCB; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rCJNaLCB"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-494049206c6so1928455e9.2
        for <linux-kselftest@vger.kernel.org>; Fri, 17 Jul 2026 13:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784319304; x=1784924104; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KgwWXpWZ5E6B/1xrDcK3wBAQSk4ptg7t74XAEY84UEo=;
        b=rCJNaLCBkqR06nCMfkwMlJgM7T0VryjOG9PRjzun3dAteZF/ziLA4hFjbzSR9ulPGE
         TGPpAeM/KKBo7Ql4JqdVVimDvGZNxADf2ueFwwSt0lXdEUb848npv317xSZS9JW5Q6Z3
         uPx/0JiGFoDWDK5DWCkcSnDwdYdkhlkT5n2wIhblVZUcsxYLyg6XiT4ry3MfUEfhKbXo
         A6j9tu1B7enWeTnhMZBdQujj+1kSeMt7wGUYioRjdARiA5IDZm/Wxb2kiPKPAJjFeuAF
         8AT13QIdo43Y/ijAuknr16KE/Fn9mfwEQ8VDUXv+LyXotmMU/RPSEmOr9GgpMxXLLE2S
         YUgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784319304; x=1784924104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KgwWXpWZ5E6B/1xrDcK3wBAQSk4ptg7t74XAEY84UEo=;
        b=MI0Cm0elyRo5eHsTx88LyZwHc3/HzaYFGWbvGIVEQ9uD/HFL1t2d5PdgRWDktoJ1D/
         TaH8fIB0N+xgdj/CjOuy7sNzdKrzs4L8+aOK3paqPVBf8GkdCDmyhhoS9QXz6QtTMqhT
         y1Od+u7dzCfVRLROY3gEN8lqbxwIgdUz/gEO8akt9Ndi8z2VHIvzOdtHLMGw0fzW9V4E
         LikkfCg+l8r59hLHsEviJifM3atEGvxSSugpdmJntUYQYvdZRz4+v+GjDVM1BaMEJc29
         40zNNV6xrclOxhVYncNZXXKECjRU8A3d8GeCcAUB9r0KyzZ8La0BwBIxqGS0jLtSc95m
         CDiA==
X-Forwarded-Encrypted: i=1; AHgh+Rp2A1CT7en70M9R/gEEK8iQ349MkCnLYpqSnEba/s8KtxqruO2eg8Tb3nctV/m3c2BWSIiARXT9pxZ6MhPNdCM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGehV8MPr3zWDmnwTgeBPgX72VuDnd+44JLMIuk19aENHIV8f5
	Cm7YP6bCbaTDSjfsQlAOj9qKqOHWgjSCBlERSwUtM1/SEGtm9dni/0/P
X-Gm-Gg: AfdE7cmon3hMq6PZvji58DYa7vGWIfprxTb0SjpxTuxvQKzFwF0PG24LdkO7kIM6hcc
	lc1tk37pfOchr86gbWvfAQ3Bzj53c0YQvm0ZJiZEfTr2wVfOmss/sa6WFUiZuiMoZQ++fpv79Ej
	RYhfDoYd3ekrMpX9tv41WSQh0MnQOhgGjkl1S7UNGq73znMcmY4akmJQTeNAPmEph5mLAS91H78
	dsi5u5Ev5pHgUTak4mFeDvuY+mdm35nj/cZZ7zDoZCk9DCq2b+aCXBVBydJSc8MC2sVgqoeKJJi
	XmABNLqxeOlCi/4gQAn5ysEh9Ra2YPPDPqW+KvYeRJn6JO+I1C3GQ1LWJlsJ0dzVYBDfwaeFs1i
	oYhZ4tBBoHGtBpRFmIvEQXEtfL1CRCZUsSbALxHki92GakWO98RLpH+c6tDElQyjoMf+TvSUatW
	E9kBvpsjhBsH2qDZ2ImORy6eGrsnFfrLucUTWQ9TCO1B9WlsSiPXwnAMID65Po0cb/MLG6W1ZqN
	qUfsMYpXeBWtrsmnFWe6EunOTA5ri2iZUytR2A=
X-Received: by 2002:a05:600c:1c23:b0:490:846d:4edf with SMTP id 5b1f17b1804b1-4954a3ebc81mr26331675e9.1.1784319304154;
        Fri, 17 Jul 2026 13:15:04 -0700 (PDT)
Received: from L-022584.energy.envision.com (dynamic-077-179-077-126.77.179.pool.telefonica.de. [77.179.77.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495499a5847sm53179335e9.2.2026.07.17.13.15.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 13:15:03 -0700 (PDT)
From: Xin Xie <xiexinet@gmail.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	wsa+renesas@sang-engineering.com,
	jie.luo@oss.qualcomm.com,
	shuah@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	fmancera@suse.de,
	bigeasy@linutronix.de,
	fmaurer@redhat.com,
	luka.gejak@linux.dev,
	Xin Xie <xiexinet@gmail.com>,
	Hangbin Liu <liuhangbin@gmail.com>
Subject: [PATCH net-next v4 2/4] net: hsr: emit RedBox-MAC TLV in PRP RedBox supervision frames
Date: Fri, 17 Jul 2026 22:14:55 +0200
Message-ID: <20260717201457.54-3-xiexinet@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260717201457.54-1-xiexinet@gmail.com>
References: <20260717201457.54-1-xiexinet@gmail.com>
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
index 5af491ed2b7..0973f9a94f4 100644
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
index 8f708b6e6c3..b3b106be692 100644
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
index 134e4f3fff6..53e95bae0ee 100644
--- a/net/hsr/hsr_main.h
+++ b/net/hsr/hsr_main.h
@@ -211,7 +211,7 @@ struct hsr_priv {
 				 */
 	bool fwd_offloaded;	/* Forwarding offloaded to HW */
 	bool redbox;            /* Device supports HSR RedBox */
-	unsigned char		macaddress_redbox[ETH_ALEN];
+	unsigned char		macaddress_redbox[ETH_ALEN] __aligned(sizeof(u16));
 	unsigned char		sup_multicast_addr[ETH_ALEN] __aligned(sizeof(u16));
 				/* Align to u16 boundary to avoid unaligned access
 				 * in ether_addr_equal
-- 
2.53.0

