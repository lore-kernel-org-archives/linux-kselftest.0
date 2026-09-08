Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF511377A8B
	for <linux-kselftest@vger.kernel.org>; Tue,  8 Sep 2026 05:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788845218; cv=none; b=Tl0V5qHgMjc0QNmnHKYBuF4Mq2XRMMG6clNK8rwueP/zmhptjxmHBUky32W8XcIeYH7ypj8enZeP8ad+OzzR++vJLYS+P3DaDVZpjjIrT4NtaNN41SfS7ytGRO7pLTF9KHtYV0zbWln82sUQRfG1S5dqTI0nHUks/U7R7TtdHHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788845218; c=relaxed/simple;
	bh=0T/9zHHBg8JlGaqYwBGGLUUgXoah60mFMolw0Z8Tmz0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jEq3XTr/7VHNi+FQCLHPN2rJE6ZzbzGRb7mkMi2fUyDmo8llQ1lTOm0uW3xio24m7Fjmv80dn4e1ycltloMvUaqSqz5/MwZYIn6IxnzQV1IVOQuWRmZrO4zXgDc2jBhyqp0c/qfGv9bQeh0IsD+W+NAvr7j7uqUVLXfUJG/fh6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VOse+mxU; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VOse+mxU"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-39b9a99469fso219027a91.3
        for <linux-kselftest@vger.kernel.org>; Mon, 07 Sep 2026 22:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788845216; x=1789450016; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6LsOjIpoezfOQTuidmlHq/lP7hR+WKEHPT5u3b2kG30=;
        b=VOse+mxUEXyeKLeLlSjz7tl4H9W0+Pmrqs1opJ7mcNl+IGNDMmiHarWoI1lVKIADvm
         L35do45RoaaFseUgNbVQWeox0rtSqWU1SebBRAvwTHSKQ1j11Mul7imGHdYr0EkTIJxq
         WJdifc+/8/yjw9gAe6q9A2hip65zfohheW6jjVXzvz2K0WZiiRd2Jw1rRr/54h1kJnoi
         VcxBfbnhHxTJYEdh/nayg8DBE1yB6buM/VKAsuRCrH43Nxq1OtTdTWA+q/YhLUXiVRiB
         WH8Q3XoIuTyZNXdfWQC82QpHa3JMHH58Tvtm+EQGoGmNURh8wkdlnRD+rjsTfUnA7M3/
         p08w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788845216; x=1789450016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6LsOjIpoezfOQTuidmlHq/lP7hR+WKEHPT5u3b2kG30=;
        b=bFPG1Cpu/9M2mPzKS1AD+rfkS1C5BPD/6nE382Th0WbWMAZu4s036SpnX7LqZMmIEz
         o+jSXhIevbvo63DxPLtc+Wp0cWJ1whknSsofhLts7dXpKkTDNLSv6R7e/eFFfIuY3zdD
         hZxxMzjEu7abX4Mmsfzdiiky58/EvFwf6zhRWHhXt0bN/HtNIbvyI2Po2wbACGh5w4Go
         UUaVE21vVkWmdW2aiUF0zrfezBcyWAdbJB+l0oP6bjWwwsNHYgOHpq9hMltP4em55Xdc
         +8rTmXjwYTc+zDiP5rmhw+wPJJF0vv1viLKTqyerBZktHC8oJ4tBR63NGbdPILQ+t3ny
         CqOw==
X-Forwarded-Encrypted: i=1; AKwUvBw35cplkNbrMOFQ1354wHqyF9Q9s/9BsSVb7PEzafczTkZ05z4Q7DO517NOXKzyvUT00TTZQOr8KSe86r+wI3E=@vger.kernel.org
X-Gm-Message-State: AFuF++lXQQxO0PPBlCHu9ervRw5+SUDZgf0sH7ar1QZ7YhRoOL8/bcn8
	SIn0V8fksAUFckw2KcPwcGy1fBh8XTa0o+Bjt44AkYT8BvxcqilYv+/9
X-Gm-Gg: AYBFou0blz/wyPT6rVFbT1lLjcNZVaWSNzgfC5oxTLppkIgsiJv76s/ftDrXHY3lOOd
	ZGZLD4hSDYDxAsTxqO1yluSDwfjdQSkqVMIt9AXEfPdz58i8AiA1tRuD6+fxYbJEnKhuzfHGXZI
	Vc31g/s7Q3o9Fpm4m7s6UVC3yl9l0x2GZS0sAu6HfNcvLWkbWzQECydEPCpETEk+Na//6YBMxmq
	p8hGuY6D6zDuKJAWR5It+90FsMlXRsL69KO31lS6oAUOS3M7nUi/SkgAL+M/Jko40oEyhxXlMov
	WYkRT+OugNt26/c1wwna/Ad0yWx/3iE4sglA46aedG6cMk4zqRi2qqvnoocZnREU3ujZDI5qbHD
	ssTZY7WtmoAXW2mDGNe1Un0JrSWWT4N/3rQ/Do9MZSYQOfXJR0sFLomsSr0K6aA+3jtzkj0U2ww
	etnd19U9w2VSbx8YlMQ+5GUUpzLkFSeVcSV6stoqoPELal5qo8tqaC+Ygij+OXbnLhyMXlzJNpp
	UhfG1BI5KRMBw==
X-Received: by 2002:a17:90b:39a7:b0:381:cef1:11ac with SMTP id 98e67ed59e1d1-39b26125efemr37873663a91.10.1788845216050;
        Mon, 07 Sep 2026 22:26:56 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14340a69666sm11720586c88.9.2026.09.07.22.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 22:26:55 -0700 (PDT)
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
Subject: [PATCH net-next v3 05/10] net: qlogic: fix typos in comments
Date: Tue,  8 Sep 2026 10:55:57 +0530
Message-ID: <20260908052602.27497-6-hemanth.selam@gmail.com>
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
 drivers/net/ethernet/qlogic/netxen/netxen_nic_ctx.c   | 2 +-
 drivers/net/ethernet/qlogic/qed/qed_cxt.c             | 2 +-
 drivers/net/ethernet/qlogic/qed/qed_mcp.h             | 2 +-
 drivers/net/ethernet/qlogic/qlcnic/qlcnic.h           | 2 +-
 drivers/net/ethernet/qlogic/qlcnic/qlcnic_83xx_init.c | 4 ++--
 drivers/net/ethernet/qlogic/qlcnic/qlcnic_ctx.c       | 2 +-
 drivers/net/ethernet/qlogic/qlcnic/qlcnic_main.c      | 4 ++--
 7 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/qlogic/netxen/netxen_nic_ctx.c b/drivers/net/ethernet/qlogic/netxen/netxen_nic_ctx.c
index fef4b2b0b1f2..79d6a819bf90 100644
--- a/drivers/net/ethernet/qlogic/netxen/netxen_nic_ctx.c
+++ b/drivers/net/ethernet/qlogic/netxen/netxen_nic_ctx.c
@@ -17,7 +17,7 @@ netxen_poll_rsp(struct netxen_adapter *adapter)
 	int	timeout = 0;
 
 	do {
-		/* give atleast 1ms for firmware to respond */
+		/* give at least 1ms for firmware to respond */
 		msleep(1);
 
 		if (++timeout > NX_OS_CRB_RETRY_COUNT)
diff --git a/drivers/net/ethernet/qlogic/qed/qed_cxt.c b/drivers/net/ethernet/qlogic/qed/qed_cxt.c
index b70262e70baf..89b947f82cf0 100644
--- a/drivers/net/ethernet/qlogic/qed/qed_cxt.c
+++ b/drivers/net/ethernet/qlogic/qed/qed_cxt.c
@@ -561,7 +561,7 @@ int qed_cxt_cfg_ilt_compute(struct qed_hwfn *p_hwfn, u32 *line_count)
 			 *      block in the ILT client. This is later used to
 			 *      configure the CDU segment offset registers and
 			 *      results in an FL command for TIDs of this
-			 *      segement behaves as regular load commands
+			 *      segment behaves as regular load commands
 			 *      (loading TIDs from the working memory).
 			 */
 			line = p_cli->pf_blks[CDUT_SEG_BLK(i)].start_line;
diff --git a/drivers/net/ethernet/qlogic/qed/qed_mcp.h b/drivers/net/ethernet/qlogic/qed/qed_mcp.h
index 9bd0565fe8ab..50699d600b8e 100644
--- a/drivers/net/ethernet/qlogic/qed/qed_mcp.h
+++ b/drivers/net/ethernet/qlogic/qed/qed_mcp.h
@@ -783,7 +783,7 @@ struct qed_mcp_info {
 	u16					mfw_mb_length;
 	u32					mcp_hist;
 
-	/* Capabilties negotiated with the MFW */
+	/* Capabilities negotiated with the MFW */
 	u32					capabilities;
 
 	/* S/N for debug data mailbox commands */
diff --git a/drivers/net/ethernet/qlogic/qlcnic/qlcnic.h b/drivers/net/ethernet/qlogic/qlcnic/qlcnic.h
index d7c8fadb49de..9728d583b891 100644
--- a/drivers/net/ethernet/qlogic/qlcnic/qlcnic.h
+++ b/drivers/net/ethernet/qlogic/qlcnic/qlcnic.h
@@ -909,7 +909,7 @@ struct qlcnic_mac_vlan_list {
 
 #define QLCNIC_LRO_REQUEST_CLEANUP	4
 
-/* Capabilites received */
+/* Capabilities received */
 #define QLCNIC_FW_CAPABILITY_TSO		BIT_1
 #define QLCNIC_FW_CAPABILITY_BDG		BIT_8
 #define QLCNIC_FW_CAPABILITY_FVLANTX		BIT_9
diff --git a/drivers/net/ethernet/qlogic/qlcnic/qlcnic_83xx_init.c b/drivers/net/ethernet/qlogic/qlcnic/qlcnic_83xx_init.c
index 47cd9ec665ee..ff337a917243 100644
--- a/drivers/net/ethernet/qlogic/qlcnic/qlcnic_83xx_init.c
+++ b/drivers/net/ethernet/qlogic/qlcnic/qlcnic_83xx_init.c
@@ -1957,9 +1957,9 @@ static void qlcnic_83xx_template_end(struct qlcnic_adapter *p_dev)
 * qlcnic_83xx_exec_template_cmd
 *
 * @p_dev: adapter structure
-* @p_buff: Poiter to instruction template
+* @p_buff: Pointer to instruction template
 *
-* Template provides instructions to stop, restart and initalize firmware.
+* Template provides instructions to stop, restart and initialize firmware.
 * These instructions are abstracted as a series of read, write and
 * poll operations on hardware registers. Register information and operation
 * specifics are not exposed to the driver. Driver reads the template from
diff --git a/drivers/net/ethernet/qlogic/qlcnic/qlcnic_ctx.c b/drivers/net/ethernet/qlogic/qlcnic/qlcnic_ctx.c
index eb827b86ecae..1b94c42d669b 100644
--- a/drivers/net/ethernet/qlogic/qlcnic/qlcnic_ctx.c
+++ b/drivers/net/ethernet/qlogic/qlcnic/qlcnic_ctx.c
@@ -95,7 +95,7 @@ qlcnic_poll_rsp(struct qlcnic_adapter *adapter)
 	int timeout = 0, err = 0;
 
 	do {
-		/* give atleast 1ms for firmware to respond */
+		/* give at least 1ms for firmware to respond */
 		mdelay(1);
 
 		if (++timeout > QLCNIC_OS_CRB_RETRY_COUNT)
diff --git a/drivers/net/ethernet/qlogic/qlcnic/qlcnic_main.c b/drivers/net/ethernet/qlogic/qlcnic/qlcnic_main.c
index ff4f7cd20c79..23ae76ca81db 100644
--- a/drivers/net/ethernet/qlogic/qlcnic/qlcnic_main.c
+++ b/drivers/net/ethernet/qlogic/qlcnic/qlcnic_main.c
@@ -640,7 +640,7 @@ static int qlcnic_max_rings(struct qlcnic_adapter *adapter, u8 ring_cnt,
 
 void qlcnic_set_tx_ring_count(struct qlcnic_adapter *adapter, u8 tx_cnt)
 {
-	/* 83xx adapter does not have max_tx_rings intialized in probe */
+	/* 83xx adapter does not have max_tx_rings initialized in probe */
 	if (adapter->max_tx_rings)
 		adapter->drv_tx_rings = qlcnic_max_rings(adapter, tx_cnt,
 							 QLCNIC_TX_QUEUE);
@@ -650,7 +650,7 @@ void qlcnic_set_tx_ring_count(struct qlcnic_adapter *adapter, u8 tx_cnt)
 
 void qlcnic_set_sds_ring_count(struct qlcnic_adapter *adapter, u8 rx_cnt)
 {
-	/* 83xx adapter does not have max_sds_rings intialized in probe */
+	/* 83xx adapter does not have max_sds_rings initialized in probe */
 	if (adapter->max_sds_rings)
 		adapter->drv_sds_rings = qlcnic_max_rings(adapter, rx_cnt,
 							  QLCNIC_RX_QUEUE);
-- 
2.48.1

