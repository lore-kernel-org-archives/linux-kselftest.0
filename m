Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D2037A494
	for <linux-kselftest@vger.kernel.org>; Tue,  8 Sep 2026 05:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788845254; cv=none; b=S3FOuNTuRIaaOPKP3uJq25bKhSM7y+jKE87W2tzk/0Y/ZM7NY6CfhZ8FvWCi808I8AaGdLDgiG4Ja5FNebP1y5OFj+QYqz5EdJq/Ksmcc3AYIyr+X43jVhDrt6caIMyneg/1xRJIm8lufS6A+On8evQCEVurX2Sn6/nyymmedmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788845254; c=relaxed/simple;
	bh=fjyYAKrA9xZ3oFHLIxjUPnbIcj2DikHpK634Qm6CIMw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HpHzamCeNKSdJHlRNlnC7Xhgh1Qb3rrk8RvZ9gAh99HbsWrWAyfEdy4D9ICNp5XlvQ7/tDw9VwYBsxSz6+fk9W0UiG7WEq8tgvyTq5IMIX8mn9paptk4v2NQVPRNwSHR8+YylR/nsaJtczUj3Z21NGRi5lZYBFOh9vF63+klVfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZAPxwCQ7; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZAPxwCQ7"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2d6fe26ef1cso41422195ad.2
        for <linux-kselftest@vger.kernel.org>; Mon, 07 Sep 2026 22:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788845250; x=1789450050; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qMXY7RVPMRlOGVUE1GxTzGvnZE4FGesxKUeRlJf9LaQ=;
        b=ZAPxwCQ7dy1j2j5YzaKqu8G8ne/0AC5OUjagEGvTs505gPC/512dH+ugOz4sC4KxH5
         8gD8J1Aqwt2cZ2tuVzKwlCenN6NWdHbX5Yv2c17Kjb1miPQ16boIzwGRro0ixe6l7ge4
         eVrDMfMrIVKjzOkW8p2dK84C6StKzXgjI7EY5Ge3OKQsNQoApOjakWFeMLQp8ovDChxe
         i6abU+Ri7+UkufdsPocMyFSJGvL4OotdDL9S2rkcBqTvX3VYwXMY6Yy/2DrMGKPZ11cC
         I77muEnDBl/U7QFLWBgDRe5WfVREgHNi9rbXmrvkMeMnSuA3YL5dHOOZ4zYk6BOw+zad
         i7Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788845250; x=1789450050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qMXY7RVPMRlOGVUE1GxTzGvnZE4FGesxKUeRlJf9LaQ=;
        b=VBOWdlSYb/H/MJqMH5vr45uaQsB/PBt8AV0H47DC60ib34bBzIQWVTgT8OdPtWCFIv
         x+mg2/nRYlWFxWjNDJ1M6WTVigMNdy3ZViNM3fTHItw44DFtGQWwrDgYnEucEW+eQBOY
         oYEx+6cnnhTqosYPmVxKQsANJipGbMfonCJk/Qeq+6o+ZtOQT9CbI4odfI6QdKoh7iQS
         WvQVTrtYdaXTM/x5GkcwbS7PU9uK4K5yUoLyx6QaFPuEa5nHRhEIWw7rPJsJi+4famh1
         9LomNEHamhIHDQ46tFQmUgEUljm7pZnPHJrs8YthXZZIdagn65ReVDFaHWH/PZ9/MVHa
         QPog==
X-Forwarded-Encrypted: i=1; AKwUvBxliTqWwURBBNJ5TavNWq+2FP3xAxQgGXq5SPaS025RMK68FFua9W7VO3xgAA5dRVAK80x/+z5OzePyfKreuj8=@vger.kernel.org
X-Gm-Message-State: AFuF++mOC044CkvTpmUhRVBaxOXBr2qMYy/zOmSSLmcIgQstF2v4slnz
	uK+YqPv3dC8RKK/rcKZH1G5a2qBDzuc0ANFpoKMLYeElI2pqCD1hMLYZ
X-Gm-Gg: AYBFou1U0+46Vsuv8L3RvH3PNzCRl5F1t603tX4Tb0Bb3NRf6pUkd88PozVi+fDovXr
	U+4cuWolYNbXnOxLBWGpiSUgwxluJrHmlerCGBBsrtKqiWzKevpRfT7/M0a27Qc4gBy9Wvf+cdZ
	/BcXnmUFqi8sWBPwV4RSHnu2oseQoAstGqJOgJluwB9h/7uwEipauTCHt1pj5wG8Kba0SdsvGYU
	XgmUqBursopVM8AhfVbihvesrHFSFbOhcT2Ih+gIlj5C/Mf+LeO3G74kyqDB1OL8ujSaX+JMYbB
	x39260lL8YRohOKJnOc3RR786yLZhJEw2GdvktSEu6eaazBhillzvObIGM2PlbAhITIxw0XWA2S
	0VLvFIyFG6w6IQzJb+v6XoyoSDGMwFmapVQ8RQiNkf43B4La/KjE6CsGqS5U/GaRysTBM15ctHJ
	FVwDt3bwG0e1bw8CdQ/QLKp+6SNKjJPHQMb62zwGFnCOkufE8SpLa97mpfADKohTvLzaaS8jHb8
	2+iD+3Im4atlA==
X-Received: by 2002:a17:90a:d44b:b0:396:4cbf:45bc with SMTP id 98e67ed59e1d1-39b26203f11mr43064219a91.16.1788845250288;
        Mon, 07 Sep 2026 22:27:30 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14340a69666sm11720586c88.9.2026.09.07.22.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 22:27:29 -0700 (PDT)
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
Subject: [PATCH net-next v3 09/10] net: atheros: fix typos in comments
Date: Tue,  8 Sep 2026 10:56:01 +0530
Message-ID: <20260908052602.27497-10-hemanth.selam@gmail.com>
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
 drivers/net/ethernet/atheros/atl1c/atl1c_hw.h   | 2 +-
 drivers/net/ethernet/atheros/atl1e/atl1e.h      | 2 +-
 drivers/net/ethernet/atheros/atl1e/atl1e_hw.c   | 2 +-
 drivers/net/ethernet/atheros/atl1e/atl1e_main.c | 2 +-
 drivers/net/ethernet/atheros/atlx/atl1.c        | 2 +-
 drivers/net/ethernet/atheros/atlx/atl2.c        | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/atheros/atl1c/atl1c_hw.h b/drivers/net/ethernet/atheros/atl1c/atl1c_hw.h
index c567c920628f..8f03bb561d44 100644
--- a/drivers/net/ethernet/atheros/atl1c/atl1c_hw.h
+++ b/drivers/net/ethernet/atheros/atl1c/atl1c_hw.h
@@ -659,7 +659,7 @@ void atl1c_post_phy_linkchg(struct atl1c_hw *hw, u16 link_speed);
 /* INT-triggle/SMB Control Register */
 #define REG_SMB_STAT_TIMER		0x15C4	/* 2us resolution */
 #define SMB_STAT_TIMER_MASK		0xFFFFFF
-#define REG_TINT_TPD_THRESH             0x15C8 /* tpd th to trig intrrupt */
+#define REG_TINT_TPD_THRESH             0x15C8 /* tpd th to trig interrupt */
 
 /* Mail box */
 #define MB_RFDX_PROD_IDX_MASK		0xFFFF
diff --git a/drivers/net/ethernet/atheros/atl1e/atl1e.h b/drivers/net/ethernet/atheros/atl1e/atl1e.h
index 9fcad783c939..6b0066f47e9e 100644
--- a/drivers/net/ethernet/atheros/atl1e/atl1e.h
+++ b/drivers/net/ethernet/atheros/atl1e/atl1e.h
@@ -381,7 +381,7 @@ struct atl1e_rx_page {
 	u8		*addr;   /* receive rage virtual address */
 	dma_addr_t	write_offset_dma;  /* the DMA address which contain the
 					      receive data offset in the page */
-	u32		*write_offset_addr; /* the virtaul address which contain
+	u32		*write_offset_addr; /* the virtual address which contain
 					     the receive data offset in the page */
 	u32		read_offset;       /* the offset where we have read */
 };
diff --git a/drivers/net/ethernet/atheros/atl1e/atl1e_hw.c b/drivers/net/ethernet/atheros/atl1e/atl1e_hw.c
index fa89bc27f62d..25d3e7469058 100644
--- a/drivers/net/ethernet/atheros/atl1e/atl1e_hw.c
+++ b/drivers/net/ethernet/atheros/atl1e/atl1e_hw.c
@@ -369,7 +369,7 @@ static int atl1e_phy_setup_autoneg_adv(struct atl1e_hw *hw)
  *
  * hw - Struct containing variables accessed by shared code
  *
- * Sets bit 15 and 12 of the MII control regiser (for F001 bug)
+ * Sets bit 15 and 12 of the MII control register (for F001 bug)
  */
 int atl1e_phy_commit(struct atl1e_hw *hw)
 {
diff --git a/drivers/net/ethernet/atheros/atl1e/atl1e_main.c b/drivers/net/ethernet/atheros/atl1e/atl1e_main.c
index 40290028580b..cc6c262868a5 100644
--- a/drivers/net/ethernet/atheros/atl1e/atl1e_main.c
+++ b/drivers/net/ethernet/atheros/atl1e/atl1e_main.c
@@ -2117,7 +2117,7 @@ static int atl1e_suspend(struct pci_dev *pdev, pm_message_t state)
 			wol_ctrl_data |= WOL_MAGIC_EN | WOL_MAGIC_PME_EN;
 
 		if (wufc & AT_WUFC_LNKC) {
-		/* if orignal link status is link, just wait for retrive link */
+		/* if original link status is link, just wait for retrieve link */
 			if (mii_bmsr_data & BMSR_LSTATUS) {
 				for (i = 0; i < AT_SUSPEND_LINK_TIMEOUT; i++) {
 					msleep(100);
diff --git a/drivers/net/ethernet/atheros/atlx/atl1.c b/drivers/net/ethernet/atheros/atlx/atl1.c
index 98a4d089270e..179d74e93efd 100644
--- a/drivers/net/ethernet/atheros/atlx/atl1.c
+++ b/drivers/net/ethernet/atheros/atlx/atl1.c
@@ -628,7 +628,7 @@ static s32 atl1_phy_leave_power_saving(struct atl1_hw *hw)
  * Resets the PHY and make all config validate
  * hw - Struct containing variables accessed by shared code
  *
- * Sets bit 15 and 12 of the MII Control regiser (for F001 bug)
+ * Sets bit 15 and 12 of the MII Control register (for F001 bug)
  */
 static s32 atl1_phy_reset(struct atl1_hw *hw)
 {
diff --git a/drivers/net/ethernet/atheros/atlx/atl2.c b/drivers/net/ethernet/atheros/atlx/atl2.c
index 5560d5cc3169..c9aca219ec9c 100644
--- a/drivers/net/ethernet/atheros/atlx/atl2.c
+++ b/drivers/net/ethernet/atheros/atlx/atl2.c
@@ -2591,7 +2591,7 @@ static s32 atl2_phy_setup_autoneg_adv(struct atl2_hw *hw)
  *
  * hw - Struct containing variables accessed by shared code
  *
- * Sets bit 15 and 12 of the MII Control regiser (for F001 bug)
+ * Sets bit 15 and 12 of the MII Control register (for F001 bug)
  */
 static s32 atl2_phy_commit(struct atl2_hw *hw)
 {
-- 
2.48.1

