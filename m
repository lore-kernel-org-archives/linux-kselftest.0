Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3F137269B
	for <linux-kselftest@vger.kernel.org>; Tue,  8 Sep 2026 05:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788845262; cv=none; b=secLPWkV0s13X6kGiPw7VELIidzFQiyATS5vJaDZPXCc+ndR7DC/Un+XSBWC8c8kh6gjZMqyyMpxezb9Ill3qNtnxyoTtrLmVT3c24od4TACW0xEJLuK9esllRODt5Atk2VJ4wQtcY/zOStPi8rlMHgRpYoo1KR/tfUlug91vko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788845262; c=relaxed/simple;
	bh=Og17tNfr1MSjCFANiTkltISsVC58pPAzd5pXj79CkxU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NWx31/6AOEylPcWfMgCLwEhLviLeg2rb3NyIb+3sBOFNWpSWbZnPtHNBa8Wc2cwR2ImJg8nt0bplDjpqqMtuQqcWd20bnaUWt8gIbsWOn0q4D/zPafjprUBtQuwqgFB+xK3L3qVLjeuJBDKUH/q85Vg86d50bUq3/at9s6qQ4Uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l7JpBQHP; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l7JpBQHP"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc1bc88a20eso4885018a12.3
        for <linux-kselftest@vger.kernel.org>; Mon, 07 Sep 2026 22:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788845259; x=1789450059; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8ThgDhRyE+Y72EBv7/U4oxOtCi6RtEmzsslCG/DRcvA=;
        b=l7JpBQHP2vk6WBDHMcRbNgK6J/qmwni0n9s+ftc/g6ut/zo6aUSEQ4S0AD35ywi5hs
         LvklrhDE3M7Exzsxn4UCAn2TT4M6PtYdfk9F4klqmOJaEJMj/Beo5pX5l1P9AmuJEZdF
         MyapI0DL6iWZlTzYC3McI2BOC3BcwrE5tZLHvM3gulpTGYmryDW7UReN9jkYqpu861H9
         Kzw5JSQ/h9ewM1fi6bOYl/dEyExm9d9SDnKp9an3FWlxmDsNCWl9/HIB3LRvBxQUODxc
         bVxjvabZoyeJYVe0+c1loOwPl1IpyGZG9tytk/C8+ZiF4ZI3teiHjOoRDpPwR844lhjr
         aawg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788845259; x=1789450059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8ThgDhRyE+Y72EBv7/U4oxOtCi6RtEmzsslCG/DRcvA=;
        b=EVgP3ZDiG3BB4MzVCQj18uqiT4UGuA3tIWtOQ2DM4fMA2p1fUI/8h6jH1I4LZUJVWP
         OqbrdTqN+EDZCGFJ8jEZw7ajglCfJa8ZYx7M+SkO5yNv3d3rwMLS+dgRH+x3bJQCQ0jj
         MQO3gA1TbKCmq7zSYFsJDGbUPS5BRV8YG4zG8uLrdXoxs/1Dxhxbj28c3uch+rimkZAk
         3LSE6DOhW52JUDJ6P6wwpKdJXM/ZQ20LJRq0i7JurJHRA7bBEUo2adb81k/5pShTpxG8
         U2dDmYxGaQKcpJKTr7Q+ZEGZEV830faDv17Iz18hctANVj0bnvXyBzrc2rZDiTrJmmvy
         9Txw==
X-Forwarded-Encrypted: i=1; AKwUvBzAcbPdRdyBUfEoI3P6uwSG2QiF7MFqtZzkrJxvOInEH91Q+Nbb+iPxpnDMFYGxelNgm5RnNwrndP1yWSlZ/E0=@vger.kernel.org
X-Gm-Message-State: AFuF++m0xjQNjdg0c2fvagyWUZgD95R2xkMPB46p9OCnDTWAHrBef3R+
	yF0VEZ/xnJcReEQhrX4IG8Uwu3e9S756i+vwJtZKsRzKwLOS5K6xctWV
X-Gm-Gg: AYBFou3+XlGryqbQ/WYiPSuz3BdbrmOKyUjGRa2UA/fbjXFGKfizcuLYlBmcWxpjgIi
	Ly/i9tNOFm8FVkAoU+lBED5Gt5Z/bonf2m92dPmkSii/T3yTGGWjtvSMtx+ydN118P03uQQQxcO
	eYpdv9aNc2Af4xLTK9I/teo+0D60DLxRmpO82p5J3lNvLAKHX7/VxrcrOHsDkJTRApLpPibRGVM
	tGVUAmfUlon2jYQ2d4Xh5jl2XGGKMp89l1LcVva8gVUcwu0Fjyp8ef2cSWfwoOp+wl/G/SmsVUV
	QHcfpjSmtQjfAoQpxGlN/AJ9qJxfYpCs27ZtT78UaTgjnHskg1sxfQAeLApidR2KO4Jjc+ftOvJ
	qejsuDoNaAl249S128LcSRFH2LqntgQxc7NXR8ts3LmJQajZKpgCTBf5s1ydTuFcoxcmuz7HGgn
	XSId7jWaIVywiR1Yp94GT+cEe6bA00OfcetOUy3Ab3U6ofTfYb/FEsVWDq4JM7WXlRlAiZDIJPl
	E/eERxudirx1g==
X-Received: by 2002:a05:6a21:3943:b0:3c4:1493:6822 with SMTP id adf61e73a8af0-3da3a0aa8cbmr44065672637.18.1788845258816;
        Mon, 07 Sep 2026 22:27:38 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14340a69666sm11720586c88.9.2026.09.07.22.27.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 22:27:38 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Bharat Bhushan <bbhushan2@marvell.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Chris Snook <chris.snook@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	GR-Linux-NIC-Dev@marvell.com,
	Geetha sowjanya <gakula@marvell.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jian Shen <shenjian15@huawei.com>,
	Jijie Shao <shaojijie@huawei.com>,
	Manish Chopra <manishc@marvell.com>,
	Marcin Wojtas <marcin.s.wojtas@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Rahul Verma <rahulv@marvell.com>,
	Ratheesh Kannoth <rkannoth@marvell.com>,
	Russell King <linux@armlinux.org.uk>,
	Shahed Shaikh <shshaikh@marvell.com>,
	Shuah Khan <shuah@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Subbaraya Sundeep <sbhatta@marvell.com>,
	Sudarsana Kalluru <skalluru@marvell.com>,
	Sunil Goutham <sgoutham@marvell.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH net-next v3 10/10] net: dec: fix typos in comments
Date: Tue,  8 Sep 2026 10:56:02 +0530
Message-ID: <20260908052602.27497-11-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260908052602.27497-1-hemanth.selam@gmail.com>
References: <20260908052602.27497-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix misspellings in comments, found with scripts/checkpatch.pl using
the misspelling list in scripts/spelling.txt.  Comments only, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/net/ethernet/dec/tulip/de2104x.c     | 2 +-
 drivers/net/ethernet/dec/tulip/interrupt.c   | 4 ++--
 drivers/net/ethernet/dec/tulip/media.c       | 2 +-
 drivers/net/ethernet/dec/tulip/tulip.h       | 4 ++--
 drivers/net/ethernet/dec/tulip/winbond-840.c | 2 +-
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/dec/tulip/de2104x.c b/drivers/net/ethernet/dec/tulip/de2104x.c
index f38a10c79907..fa52e099409c 100644
--- a/drivers/net/ethernet/dec/tulip/de2104x.c
+++ b/drivers/net/ethernet/dec/tulip/de2104x.c
@@ -373,7 +373,7 @@ static void de_rx_err_acct (struct de_private *de, unsigned rx_tail,
 		  rx_tail, status, len);
 
 	if ((status & 0x38000300) != 0x0300) {
-		/* Ingore earlier buffers. */
+		/* Ignore earlier buffers. */
 		if ((status & 0xffff) != 0x7fff) {
 			netif_warn(de, rx_err, de->dev,
 				   "Oversized Ethernet frame spanned multiple buffers, status %08x!\n",
diff --git a/drivers/net/ethernet/dec/tulip/interrupt.c b/drivers/net/ethernet/dec/tulip/interrupt.c
index 0a12cb9b3ba7..8c02771b28e4 100644
--- a/drivers/net/ethernet/dec/tulip/interrupt.c
+++ b/drivers/net/ethernet/dec/tulip/interrupt.c
@@ -177,7 +177,7 @@ int tulip_poll(struct napi_struct *napi, int budget)
 			   pkt_len > 1518) {
 			       if ((status & (RxLengthOver2047 |
 					      RxWholePkt)) != RxWholePkt) {
-                                /* Ingore earlier buffers. */
+                                /* Ignore earlier buffers. */
                                        if ((status & 0xffff) != 0x7fff) {
                                                if (tulip_debug > 1)
                                                        dev_warn(&dev->dev,
@@ -408,7 +408,7 @@ static int tulip_rx(struct net_device *dev)
 		    pkt_len > 1518) {
 			if ((status & (RxLengthOver2047 |
 			     RxWholePkt))         != RxWholePkt) {
-				/* Ingore earlier buffers. */
+				/* Ignore earlier buffers. */
 				if ((status & 0xffff) != 0x7fff) {
 					if (tulip_debug > 1)
 						netdev_warn(dev,
diff --git a/drivers/net/ethernet/dec/tulip/media.c b/drivers/net/ethernet/dec/tulip/media.c
index 55d6fc99f40b..0c9694d2b38a 100644
--- a/drivers/net/ethernet/dec/tulip/media.c
+++ b/drivers/net/ethernet/dec/tulip/media.c
@@ -24,7 +24,7 @@
 
 /* Read and write the MII registers using software-generated serial
    MDIO protocol.  It is just different enough from the EEPROM protocol
-   to not share code.  The maxium data clock rate is 2.5 Mhz. */
+   to not share code.  The maximum data clock rate is 2.5 Mhz. */
 #define MDIO_SHIFT_CLK		0x10000
 #define MDIO_DATA_WRITE0	0x00000
 #define MDIO_DATA_WRITE1	0x20000
diff --git a/drivers/net/ethernet/dec/tulip/tulip.h b/drivers/net/ethernet/dec/tulip/tulip.h
index 5e010e1fa6f7..e39e5c78d4cc 100644
--- a/drivers/net/ethernet/dec/tulip/tulip.h
+++ b/drivers/net/ethernet/dec/tulip/tulip.h
@@ -250,7 +250,7 @@ enum t21143_csr6_bits {
 	csr6_ttm = (1<<22),  /* Transmit Threshold Mode, set for 10baseT, 0 for 100BaseTX */
 	csr6_sf = (1<<21),   /* Store and forward. If set ignores TR bits */
 	csr6_hbd = (1<<19),  /* Heart beat disable. Disables SQE function in 10baseT */
-	csr6_ps = (1<<18),   /* Port Select. 0 (defualt) = 10baseT, 1 = 100baseTX: can't be set */
+	csr6_ps = (1<<18),   /* Port Select. 0 (default) = 10baseT, 1 = 100baseTX: can't be set */
 	csr6_ca = (1<<17),   /* Collision Offset Enable. If set uses special algorithm in low collision situations */
 	csr6_trh = (1<<15),  /* Transmit Threshold high bit */
 	csr6_trl = (1<<14),  /* Transmit Threshold low bit */
@@ -274,7 +274,7 @@ enum t21143_csr6_bits {
 	csr6_om_int_loop = (1<<10), /* internal (FIFO) loopback flag */
 	csr6_om_ext_loop = (1<<11), /* external (PMD) loopback flag */
 	/* set both and you get (PHY) loopback */
-	csr6_fd = (1<<9),    /* Full duplex mode, disables hearbeat, no loopback */
+	csr6_fd = (1<<9),    /* Full duplex mode, disables heartbeat, no loopback */
 	csr6_pm = (1<<7),    /* Pass All Multicast */
 	csr6_pr = (1<<6),    /* Promiscuous mode */
 	csr6_sb = (1<<5),    /* Start(1)/Stop(0) backoff counter */
diff --git a/drivers/net/ethernet/dec/tulip/winbond-840.c b/drivers/net/ethernet/dec/tulip/winbond-840.c
index a5581f1d0141..be9199f55a8a 100644
--- a/drivers/net/ethernet/dec/tulip/winbond-840.c
+++ b/drivers/net/ethernet/dec/tulip/winbond-840.c
@@ -1188,7 +1188,7 @@ static int netdev_rx(struct net_device *dev)
 			break;
 		if ((status & 0x38008300) != 0x0300) {
 			if ((status & 0x38000300) != 0x0300) {
-				/* Ingore earlier buffers. */
+				/* Ignore earlier buffers. */
 				if ((status & 0xffff) != 0x7fff) {
 					dev_warn(&dev->dev,
 						 "Oversized Ethernet frame spanned multiple buffers, entry %#x status %04x!\n",
-- 
2.48.1

