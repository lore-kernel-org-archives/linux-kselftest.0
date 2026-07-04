Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5434133F59E
	for <linux-kselftest@vger.kernel.org>; Sat,  4 Jul 2026 23:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783208831; cv=none; b=HL3MlcNPwQRyIgqMJi5E1DFR7b6ee/z4AqVNfiTFx/ydvPyjCjILHk0zXxLUlCsMxfvnsmLWtlU3pWS+hspr6Xy2BJYsCnLFzPUNXH3AWP3gHDvuNQSqODde0sxfsJaizTY0HGZdc1R7G75h3ywXOFwty5rg+n8AJQxxcbi6aA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783208831; c=relaxed/simple;
	bh=rrYma4sdY/EKOaCz+0ZnCAGtPRG4kmPijBQ1M/kgDuU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NXgUJfHkXKvCVUysSPYJvW8XC4vjjWeKXTvfPpA/7KvW/Djzix6CMxC9PyIV7CiLDwzl4Qg73rfCQLFtWaYCIk8sHBUbQ5i1eafkLkrch//p7slTHuIYpX6vBh0Gi9m/+HbjfO1sLCBXaYDjMJOx7AnrtLO7gjGQJMygW4gXmP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KJnaY0hg; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KJnaY0hg"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-493bb481d51so539265e9.1
        for <linux-kselftest@vger.kernel.org>; Sat, 04 Jul 2026 16:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783208828; x=1783813628; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KR6G98ejd7YQBOCRwJ4kmyrzqgrbuG5J4PbK3v86NWM=;
        b=KJnaY0hgCwYkV92FzSzL1vcuhYcLaMXgO6gA6pL3LyXqU+nVyePHBNrmXYyaWM8DOX
         xlINOJ4pnfCYOTFJO4pQ+pfo4Mr/mFy8nbModv4Y7icaoFVXS/SNQ32IT2vanRCteHj+
         vSbKzEXuvgd2DrA1tV24gcAxyI6Y7v70OQ50wwtocyLL4+2/4xlqpKsXdnqsSBDNMHS4
         4wWAIreUJoWnN8MiQR74Mmhyo9duculqDyJhLuCzAVBq313uq857FKy4+sVBhQk5bUjL
         WWfQdjf8AdFw6Gs/Olp326Z6zGbMJUA4whB8/Qvk2neEC8kUlCxfPnUvPqeobJnZmjM2
         kwEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783208828; x=1783813628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KR6G98ejd7YQBOCRwJ4kmyrzqgrbuG5J4PbK3v86NWM=;
        b=IOhQ8jGvIR2ibjae/F+KAAMqtRD1yBb6r+JwOp1/b+XQCgR0ZaBStZFfEFlxfMA8W4
         Gh7jCfIn1iWGh+4jWI8npcGRx6HApamumPQwgYrkP3apBQyh9ZYdmQ49bWZwn7+tq35a
         lynmZOzoelktjZm20NloUqjO2UrFibByriWgVhHb+YGjn7Hfjb+Un12BHcnySl8EDsEX
         HVPZkwErZQMp4vPkQwRqq9N9STaDCqOeTOCEMghRU71OB0i8kWDx3T25ad5kzbhoKphV
         EXc/4N278SBuDRUahJ7nBK3lyifmb9V1+NQ7VGO3b5fv5mvlu/JD8+Qu8buQxPUkstui
         6rIA==
X-Forwarded-Encrypted: i=1; AFNElJ+R6u4tM8K5Tu6z/t+PKrbyn8ftVFQgy/49IHMcARY6QJ5fWbRShkGCx8LRVhQBL0rab64PGtOxtIyK3WAq0Vw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWI/hhU9vrmL3bobVNUvIWa5K0V8wSmfaDVLaajC/JTSF9/3iU
	RnIToN4TCVAZTYoxnlvXbfGqoxX0qqfKHy6RpWPXm0A6HtOCOwgwXnKX
X-Gm-Gg: AfdE7ckHmRjT9f5p1dsPUjnVZ8AbXMrgY7UpflhX/L9Gi4lUbUH6opjvdmmKZtfiEvB
	930h+CwsmbfdQZctANwSWGkSRohgbw6nlJOEmY4fNbkHQ2kUuszJtXbgpPkQo3SH70lnKQvNKm6
	vcwK+KTplVQ0unYqaoANaBXCbcy6CuMKVhuT/qSAdS8WnMuGNyZY3nlqpZ8sgB9xdxNUDDpFJp3
	o9PS4bmnKr2ULz82EOKDyuB/J0Zci3/o8gpsow0ppuNg39olB1WKzgZSsO05mYFWKW6ZbGihJBy
	Je4CNLGXfaPcEOCfAmdgifhDgt9SyH68ruuTdQMQ299dFN7A0+goNU362s7+Gb8L3Cwa4fNMSBj
	xY3G83HOoQ4Xu/uTGdfjUQ90SofWHeRohE1UO8PqXV0vjB5tWf84cQMRbfSTURqamibugpCXJcX
	RwBIXqNAdZhsTHse6fK6lSDzsqGpG6LezX0Am3gNQYKoSuBthETcHr4p6DYf/Me0TO+BJdJhSwx
	pTiE54ibkUEejVLQDsCxDlvzbHAiGHZZqd+BZrD+6x4iVtiCcw=
X-Received: by 2002:a05:600c:5249:b0:493:d282:8275 with SMTP id 5b1f17b1804b1-493d2828325mr21184415e9.0.1783208827713;
        Sat, 04 Jul 2026 16:47:07 -0700 (PDT)
Received: from hpubt (dynamic-2a02-3100-5cf8-ddfc-6651-06ff-fed8-72a4.310.pool.telefonica.de. [2a02:3100:5cf8:ddfc:6651:6ff:fed8:72a4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cce040b4sm216014125e9.10.2026.07.04.16.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 16:47:07 -0700 (PDT)
From: Xin Xie <xiexinet@gmail.com>
To: netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xin Xie <xiexinet@gmail.com>
Subject: [PATCH net-next 2/4] net: hsr: emit RedBox-MAC TLV in PRP RedBox supervision frames
Date: Sat,  4 Jul 2026 23:47:02 +0000
Message-ID: <20260704234704.4297-3-xiexinet@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260704234704.4297-1-xiexinet@gmail.com>
References: <20260704234704.4297-1-xiexinet@gmail.com>
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

Signed-off-by: Xin Xie <xiexinet@gmail.com>
---
 net/hsr/hsr_device.c   | 33 ++++++++++++++++++++++++++++++---
 net/hsr/hsr_framereg.c | 13 +++++++++++--
 2 files changed, 41 insertions(+), 5 deletions(-)

diff --git a/net/hsr/hsr_device.c b/net/hsr/hsr_device.c
index 5555b71ab..7cc21253c 100644
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
index 7a7c52a95..37ade2dde 100644
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
-- 
2.53.0

