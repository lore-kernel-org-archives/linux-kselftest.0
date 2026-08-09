Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC703CF95E
	for <linux-kselftest@vger.kernel.org>; Sun,  9 Aug 2026 12:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786277704; cv=none; b=na/zpLpYV5FxxPLw1gvBmTSNlnwAMCXOOW69uvkUPeZYcXqd5ahkBSiRew+gfAWg7bT/SpKs5udETW42wqcRCnKzxTrFUMnFisS6EX4i+Tez3gxRmnjcwegZzcPRkbLdKlBzbNg5m+x3ckRvohjMh7T+yjuUGANQFcgNONlvyXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786277704; c=relaxed/simple;
	bh=uacT/jei5dgba42+Tsf6fcoe45L0FIC0Fpqbwa8RlWs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aV06D3WgIU/FO6v7vyfhTvIwiGHZODWOWpTW7U9bZvx0naGTv1/HTdDu8Fl2zb7y2C9fY1btlPrloSN/8vPdHQwTCvAa9rUUkDivdbofXkdAqnWYwktTEmpmFGEeoRmMykNWf1Pv/niiCapyI5K00SmwwpmDeEwORwcHeyBwzjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R0ll42kZ; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R0ll42kZ"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-495522bc0e2so293555e9.2
        for <linux-kselftest@vger.kernel.org>; Sun, 09 Aug 2026 05:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786277700; x=1786882500; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QTUwYlCoLFw4wVzo6jM7Q/KRvDXTLX460FJlpDvikKk=;
        b=R0ll42kZXuVmbJXoWrTzcwH2M6oHcn74Qs4x/MpIbFDPgqjClEjCqZA8oEumUMAY2D
         FLO8j3JY/7LpDvqIXdEGl9TosNItsoPtIQVmjsx9JO3D6F/LxDQixYxLuMEUCG6nEpX3
         mmTeHQ76lNblm7Rscm/aHnyhjJyvpVf6agogCKm4ze2lxPTrRl0KG6eLTHNLjv1T47QE
         2HKujjKWucH7JMCJHe3qDpG1atqTvYvxXPEkzu3edENTvBNwwS/7FbT5Kf1PqpctYyEU
         CvweAzvRcfemeMshhMxZoulokaS9HRy6zdUoGo5g+PyLSoJfb0EhiVUv4MFAsVqd3X53
         edyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786277700; x=1786882500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QTUwYlCoLFw4wVzo6jM7Q/KRvDXTLX460FJlpDvikKk=;
        b=PlALURQIoQpBAqGAOt+TdoKKFpDx3qEPs63S94QEl8qWhTLeVQDX8M29UV62i9Q3Mk
         wpGGO0anX0oY5b0HSrmlQrN8ZNF+tImp1CtYxbAW/RBdMHkIpLavlb13rEDWV8YATK1R
         4apca3ghsIQjfm+gzb+AgPkazjk0fRkGHbj/B2V9aF+0jKbJTKjWe4W+ItTnvqqKlh53
         CakQZJafoX0wJ3qeGTIBv7p6mcn2YGeagc2ky2wglDpFqIpRoxCZ4H/wm3Yc4b6+NN2i
         pc7ykmgM/Zu4BS8MIYwc6M3iuKckheqf5W3myPhy8hHFoDcY2EhXd/lZZryfHpubvCsb
         pqqg==
X-Forwarded-Encrypted: i=1; AHgh+Rq5s8kjhvBnEdQF8kLz9Yr46Ls5/Q+Gfknecm4vrEfL/GaRSx7OnlVa3mzemz/L0q1exycQIoOH1sxsI2k/9Ps=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4ul8hCXtp04NHqVfMDiLMUM17tsvmegk1hockzBEs+4Oza8CQ
	zgbMISiM31b+BkInj2sL3TsxaO4GDQk25YAP04fg5j0A3NemRTrbux2T
X-Gm-Gg: AR+sD12T0vOO4Z33EPwVO0xY6Au8XFuszzQWu6uLjJd+Pd6XumV+z5edDCtCkuOz18x
	1Cm/YE6bA53+Dvvv3JRHAy4PbVFu26Ymullu8yLA9kuGh73GHDzNVSSRm6lIFzXYY57kmK+dM4D
	qqxKKAPsB7QVjbtqYuUfO05nIvKHtAR2PW2Q+cAJJbbEj6sqD/Ubb2zRpbeg0aYGjWfgkwwKiq9
	C29cu48bMQ6reZrM0kQawnhEG8+f1OwVZhR92En9ciVsPoOTd64opmpeHkZDSV9l5DG0/RK6n72
	kZ3asbX7axzWpR55rWJMb6W+U9tyv66e+pktKDQioRazEvRT7+9ln6VKmiOPZOOzDsDv06k4unA
	GcBg9h58m4YqPt1/MNm+1YmQZjbmSIk1BtQDW5SMnwhpf7DgsBf1MadMgHNjmpdspw+DXon7u2W
	sfPH46KagsZfsOvaex766h1LSSn6mxDXitkyKvFSjGD8xxq56wQ38+9yOiC4XITb4mbRb+dIeUa
	fTcF9y+Kvd6LvH23Kb/9KcL6Xnts558BRrTDCxCe9H1Via6q9NJ0aFkdQ5sHclEZnGLHDEQo4lP
	EzLZsZDgBCwtod+8m3soRw==
X-Received: by 2002:a05:600c:1393:b0:495:650b:4c61 with SMTP id 5b1f17b1804b1-4994e7d0166mr247269495e9.3.1786277699563;
        Sun, 09 Aug 2026 05:14:59 -0700 (PDT)
Received: from L-022584.energy.envision.com (dynamic-077-012-133-135.77.12.pool.telefonica.de. [77.12.133.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021e7b3fsm25158434f8f.20.2026.08.09.05.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 05:14:59 -0700 (PDT)
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
	Xin Xie <xiexinet@gmail.com>,
	syzbot+fbf74291c3b7e753b481@syzkaller.appspotmail.com
Subject: [PATCH 2/4] net: hsr: shrink seqnr_lock to sequence counter updates
Date: Sun,  9 Aug 2026 14:14:52 +0200
Message-ID: <20260809121455.1745-3-xiexinet@gmail.com>
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

Commit 06afd2c31d33 ("hsr: Synchronize sending frames to have always
incremented outgoing seq nr.") and commit 430d67bdcb04 ("net: hsr: Use
the seqnr lock for frames received via interlink port.") hold
seqnr_lock across the whole forwarding path. Transmitting while
holding the lock can create lock-dependency issues when HSR devices
are stacked with other net devices, up to a real deadlock (see
Reported-by/Closes).

Since commit aae9d6b616b5 ("hsr: Implement more robust duplicate
discard for HSR"), duplicate discard is order-independent (sparse
bitmaps), so only the sequence counter updates need serialization.
Limit seqnr_lock to the counter updates in handle_std_frame(); the
master TX path (hsr_dev_xmit()) and the interlink RX path
(hsr_handle_frame()) drop their outer lock, and the supervision frame
builders release it right after their counter update.

Concurrent forwarding may emit frames out of allocation order, which
sparse-bitmap discard tolerates. The master/interlink tx statistics are
no longer serialized; consistent per-cpu/per-queue statistics for all
HSR paths are handled in a separate series.

Fixes: 06afd2c31d33 ("hsr: Synchronize sending frames to have always incremented outgoing seq nr.")
Fixes: 430d67bdcb04 ("net: hsr: Use the seqnr lock for frames received via interlink port.")
Reported-by: syzbot+fbf74291c3b7e753b481@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=fbf74291c3b7e753b481
Cc: <stable@vger.kernel.org> # aae9d6b616b5: hsr: Implement more robust duplicate discard for HSR
Signed-off-by: Xin Xie <xiexinet@gmail.com>
---
 net/hsr/hsr_device.c  | 15 ++++-----------
 net/hsr/hsr_forward.c |  3 ++-
 net/hsr/hsr_slave.c   | 11 +----------
 3 files changed, 7 insertions(+), 22 deletions(-)

diff --git a/net/hsr/hsr_device.c b/net/hsr/hsr_device.c
index 5555b71ab19b..3fd1762d8916 100644
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
index 0774981a65c1..8e4158a9b57c 100644
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
index bb2182a169a3..8b96eafe15b3 100644
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

