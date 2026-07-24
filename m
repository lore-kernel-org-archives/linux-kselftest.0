Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C44A444707
	for <linux-kselftest@vger.kernel.org>; Fri, 24 Jul 2026 16:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784909588; cv=none; b=ZLWOMJW8uTvAnk98R+gVsc8ly2nOuLouVFHgKv9MukMhVRqhOnbzzgCIS2LS4zU907jNeAREAEmv65Bi+Ku6AlhD6M4BWRu5oOgiJ3OuD522xyNuyD7Yf7lArqUpUe+2XRcZZcaZmaQDRXv6SUygDABELZzEU7yi73GrydyJ5CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784909588; c=relaxed/simple;
	bh=DrZn5Cm0c6AMnJiWXRIPou1SyGN6W4LA+hiWm/G6shI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T1cfsFlPtuMB9PUKyo2EbyK7Ih0GNS7uyYGUBHgnop21DW81oLH1cMjh/Sr9mZ44AU+DqkhHPuY+14w3Hr4TyXOOJO3JGDCS0iObiHLTqYykbVCYclKORzYvKZyGlx65ezd3vlEtJ2jEGcfpUF+8te6YNgE4Kn2rvWAekbYNeNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s2pP9vRy; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s2pP9vRy"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-494049206c6so882655e9.2
        for <linux-kselftest@vger.kernel.org>; Fri, 24 Jul 2026 09:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784909579; x=1785514379; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GQEhlL0dKHAvltrTCYueCiy8so7kE3jHnbdeiA1S1sw=;
        b=s2pP9vRyukVzKD7Q9AvYuYAwwRysqh9Kg3dZ3eywusHi8kQQqRg3+9rjh30MuWo1cr
         edcIoz9i0y9u+NAx/KzhfVCYhTYCplaNFFQDTWmlBb/ZHl9rOeT3LreSAF/hEJDzZiGn
         1Soc+q+ycIvtSAantCLhYXgtizWMWUnVj0tD5zfX6O/ZgkfZy1c6qcpfo/YqaqC8qsLH
         KeY9TvRU+SXW2BzmdBcZLakjy3/InZhZ/bw6/TjOV3jojs8ZoO5LLQzjurWmoEF/UiG9
         NHVTtTOsYVJp2vkkiQ+owoNoyDkaq7LOYdlJt0ApKti9wf3Ew1dlkxmlb6JI9xOHVAVt
         10KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784909579; x=1785514379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GQEhlL0dKHAvltrTCYueCiy8so7kE3jHnbdeiA1S1sw=;
        b=D8Cw5Sq4U9sXeYTjYbyZRhkRWbUD8Fvp+AT/f4XP8ZkaOYm2C+jaMHVtGQtHoWNWUy
         yHC29XaHgNSzIpKKSSM6yjVcxA8cFs8EouJB4rwxHa9pSUxes7uqG7eeAq4Ub+JlgqNo
         3rbUdGRhWpJAe4zPKTPjI7HOvgsN5W10F+QC4m2pUkEA64TtqY4qfRRBy0uS0Q5cg/EH
         KY0ZRreNpHvL4IpE5GRaWA0JHisyRMAZC/s8mFAl9x8rFqX3F2SEK2Z1k3uMZ/GM2sMP
         be3izuJvvu2eqWtHYb5nrn+S1taECuEAn7gu9mWcjmp8vR6tvSLtcZXH23k8Lx3YtF/a
         5riA==
X-Forwarded-Encrypted: i=1; AHgh+Rpvqcd2l3m2/DjPtqfOpjMVLZ1PZ5srTksIkGWZR3WoegsBM0opBB5QLPgAJ9iITRvier7an9fQFr7Rgfa32TI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwvSRfk9R3/Xi665zAOnB8N8ybsYWSQoD0mVQmZO6EjWKONjVe
	JEFFhrviLUFcyBJ/nRiL6gXVKDJhrQcRsu/nOs15xv9HrLSL2/7VRc89
X-Gm-Gg: AR+sD10sqG67KeNqmBtYxpSB4lzYHG1RoxLz6VOg5oD0j0U3sVNLv+P0Hy+5NR2fVaX
	uFXEELOkYCL6iyJiUdxSW8ymAxW5StzY3nldvx2/IMQNyw2hE3DrsRzA50mdYmycItnM0o1iNfj
	whovLnbEFnI3LMdR8I3UrxGgBf1LQPUCRLvvOKcc+pmBUvBT/cXdbytlGuaEI8jh5BVgB4iZ98Q
	CQX6Zb+V55zLcbLqdS7BJR/+dzQS+3JjrZczgHJXhwQ3A/YmHzWucOkTo4ocFynHidFJXuFNHjc
	aUPpsrPei2RDfxQf78CzQRoU1pxFv0CBBtzgwiS9bcjBsGddp71G8Uvte+0UgYvaWj/acceqEm7
	HN4F8yDm0bcCUrMo7ijr8kjUYLByVEgSclGR055iK44fGZwcXYbpNAM02k1UUbgY8mPpd2FH9+C
	8WYWAWVeaNkTk53GhpJk1iOAzn4rwGHBIWeG/qC5rCNJ3VBYXjMJTEWdLXtgMOMV1eKaQiCyOiO
	f5hlA7ocRq9DSkQa8Qtw7Z4Su3KaexWjxTvP7E=
X-Received: by 2002:a05:600c:3508:b0:492:1e4d:d44b with SMTP id 5b1f17b1804b1-4957ae14d36mr34322885e9.8.1784909578225;
        Fri, 24 Jul 2026 09:12:58 -0700 (PDT)
Received: from L-022584.energy.envision.com (dynamic-077-181-161-038.77.181.pool.telefonica.de. [77.181.161.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957f9928fdsm40969655e9.1.2026.07.24.09.12.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 09:12:57 -0700 (PDT)
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
	Xin Xie <xiexinet@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net v2 2/4] net: hsr: shrink seqnr_lock to sequence counter updates
Date: Fri, 24 Jul 2026 18:12:51 +0200
Message-ID: <20260724161253.79-3-xiexinet@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260724161253.79-1-xiexinet@gmail.com>
References: <20260724161253.79-1-xiexinet@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hsr->seqnr_lock is currently held across entire hsr_forward_skb()
calls: master TX (hsr_dev_xmit()), interlink RX (hsr_handle_frame()),
and both supervision frame builders hold it while frames are built,
classified, duplicated and forwarded on every port. The only state
that actually needs the lock is the sequence counters themselves
(hsr->sequence_nr / hsr->sup_sequence_nr).

Shrink the locking to the individual counter updates:
handle_std_frame() now takes the lock around its sequence number
allocation (replacing the lockdep assertion), the master TX and
interlink RX paths drop their outer lock, and the supervision
builders release the lock right after updating their counter instead
of holding it across frame construction and forwarding.

Sequence numbers remain unique and monotonically allocated per
counter; concurrent inputs may now interleave allocations, which is
fine as the output paths were already concurrent.

This is a prerequisite for unfolding GSO super-packets at the forward
entry: the expensive segmentation work should not extend the global
sequence lock's critical section.

The locking being narrowed here was introduced by
commit 06afd2c31d33 ("hsr: Synchronize sending frames to have
always incremented outgoing seq nr."), briefly removed by
commit b3c9e65eb227 ("net: hsr: remove seqnr_lock") and reinstated
for the interlink RX path after a syzbot lockdep report by
commit 430d67bdcb04 ("net: hsr: Use the seqnr lock for frames
received via interlink port."). All sequence counter updates
remain protected; only the forwarding work moves out of the
critical section.

Cc: stable@vger.kernel.org
Signed-off-by: Xin Xie <xiexinet@gmail.com>
---
 net/hsr/hsr_device.c  | 15 ++++-----------
 net/hsr/hsr_forward.c |  3 ++-
 net/hsr/hsr_slave.c   | 11 +----------
 3 files changed, 7 insertions(+), 22 deletions(-)

diff --git a/net/hsr/hsr_device.c b/net/hsr/hsr_device.c
index 5555b71ab19..3fd1762d891 100644
--- a/net/hsr/hsr_device.c
+++ b/net/hsr/hsr_device.c
@@ -232,9 +232,7 @@ static netdev_tx_t hsr_dev_xmit(struct sk_buff *skb, struct net_device *dev)
 		skb->dev = master->dev;
 		skb_reset_mac_header(skb);
 		skb_reset_mac_len(skb);
-		spin_lock_bh(&hsr->seqnr_lock);
 		hsr_forward_skb(skb, master);
-		spin_unlock_bh(&hsr->seqnr_lock);
 	} else {
 		dev_core_stats_tx_dropped_inc(dev);
 		dev_kfree_skb_any(skb);
@@ -335,6 +333,7 @@ static void send_hsr_supervision_frame(struct hsr_port *port,
 		hsr_stag->sequence_nr = htons(hsr->sequence_nr);
 		hsr->sequence_nr++;
 	}
+	spin_unlock_bh(&hsr->seqnr_lock);
 
 	hsr_stag->tlv.HSR_TLV_type = type;
 	/* HSRv0 has 6 unused bytes after the MAC */
@@ -356,14 +355,10 @@ static void send_hsr_supervision_frame(struct hsr_port *port,
 		ether_addr_copy(hsr_sp->macaddress_A, hsr->macaddress_redbox);
 	}
 
-	if (skb_put_padto(skb, ETH_ZLEN)) {
-		spin_unlock_bh(&hsr->seqnr_lock);
+	if (skb_put_padto(skb, ETH_ZLEN))
 		return;
-	}
 
 	hsr_forward_skb(skb, port);
-	spin_unlock_bh(&hsr->seqnr_lock);
-	return;
 }
 
 static void send_prp_supervision_frame(struct hsr_port *master,
@@ -390,6 +385,7 @@ static void send_prp_supervision_frame(struct hsr_port *master,
 	spin_lock_bh(&hsr->seqnr_lock);
 	hsr_stag->sequence_nr = htons(hsr->sup_sequence_nr);
 	hsr->sup_sequence_nr++;
+	spin_unlock_bh(&hsr->seqnr_lock);
 	hsr_stag->tlv.HSR_TLV_type = PRP_TLV_LIFE_CHECK_DD;
 	hsr_stag->tlv.HSR_TLV_length = sizeof(struct hsr_sup_payload);
 
@@ -397,13 +393,10 @@ static void send_prp_supervision_frame(struct hsr_port *master,
 	hsr_sp = skb_put(skb, sizeof(struct hsr_sup_payload));
 	ether_addr_copy(hsr_sp->macaddress_A, master->dev->dev_addr);
 
-	if (skb_put_padto(skb, ETH_ZLEN)) {
-		spin_unlock_bh(&hsr->seqnr_lock);
+	if (skb_put_padto(skb, ETH_ZLEN))
 		return;
-	}
 
 	hsr_forward_skb(skb, master);
-	spin_unlock_bh(&hsr->seqnr_lock);
 }
 
 /* Announce (supervision frame) timer function
diff --git a/net/hsr/hsr_forward.c b/net/hsr/hsr_forward.c
index 0774981a65c..8e4158a9b57 100644
--- a/net/hsr/hsr_forward.c
+++ b/net/hsr/hsr_forward.c
@@ -621,9 +621,10 @@ static void handle_std_frame(struct sk_buff *skb,
 	if (port->type == HSR_PT_MASTER ||
 	    port->type == HSR_PT_INTERLINK) {
 		/* Sequence nr for the master/interlink node */
-		lockdep_assert_held(&hsr->seqnr_lock);
+		spin_lock_bh(&hsr->seqnr_lock);
 		frame->sequence_nr = hsr->sequence_nr;
 		hsr->sequence_nr++;
+		spin_unlock_bh(&hsr->seqnr_lock);
 	}
 }
 
diff --git a/net/hsr/hsr_slave.c b/net/hsr/hsr_slave.c
index cefbbfbd5ef..c7fd021f03b 100644
--- a/net/hsr/hsr_slave.c
+++ b/net/hsr/hsr_slave.c
@@ -73,16 +73,7 @@ static rx_handler_result_t hsr_handle_frame(struct sk_buff **pskb)
 	}
 	skb_reset_mac_len(skb);
 
-	/* Only the frames received over the interlink port will assign a
-	 * sequence number and require synchronisation vs other sender.
-	 */
-	if (port->type == HSR_PT_INTERLINK) {
-		spin_lock_bh(&hsr->seqnr_lock);
-		hsr_forward_skb(skb, port);
-		spin_unlock_bh(&hsr->seqnr_lock);
-	} else {
-		hsr_forward_skb(skb, port);
-	}
+	hsr_forward_skb(skb, port);
 
 finish_consume:
 	return RX_HANDLER_CONSUMED;
-- 
2.43.0

