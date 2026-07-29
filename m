Received: from pdx-out-006.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-006.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.26.1.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 948643E1681;
	Wed, 29 Jul 2026 23:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.26.1.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785368308; cv=none; b=gd12JacC9f7geX/RS5wS0T/0zLn3K3i0gJO6CtYGcd2l3IYdx/5aW8Wmk+vicpw5eBIemAR9vyyuP+k70hrEt5Nyan0Z/apQHB7NiXRtuj9wfos97lVgBCkahY6zwD2eLDosIjnaFsxj/5p4asX9n0CA1BDynffrHAoWti5awu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785368308; c=relaxed/simple;
	bh=ymhmZszCiNZs3BPo69NjLzS0r5amDTxx95ipac6nD7U=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hfVf+9Dl4ZBvYS8O6mvwYwQfClOzVJ0XowSAtCA5rab5qh8KYkfW1tINIg84dGKE2+2Upvf0G5JTuRJ0C9AdFMZWARbKBMH4OigF9S1XGpspqCatojJGCn2oeofL3es/ITl1ok1OCo+obx1vHRCOpqg4A47JLl56ezghedrk9XE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=YBEQ98Yh; arc=none smtp.client-ip=52.26.1.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="YBEQ98Yh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1785368306; x=1816904306;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3n8MQ6GQ5HKAYer3ANl/cn3DzMxfFI7lJ1RGcbWewZE=;
  b=YBEQ98YhL6Gq7Quk6ZAsz/xCXN6jKSgr3CeS8XvGYjQA0pH0+Kvp9vwR
   efuctU2TfsXJQTZNvNtfA31gIunnCBDwIN8uYdGgXPdZ8n3e9f8+vcwFR
   UwMauS31dZoPPs8uN9aorwDdGFJwPAMTe5ZH9iTB2sht1IfyGkvDc4tVf
   Mmo5ZSBVF7sO4/osxNShQH6ud1HRZ8EMfO7Po9G7CIn5EIt37oS2oSoYr
   Ki6QglYP1+BpMlytMv5BuYJd6Z/UaMTB5HGNsT5GFKTnpn3ywDp+w6zM/
   F39PWN6aa6xWG4RGwJg7DMbhg1CU69sKBd5BzcWAy1N4nGEoSCulHJeOg
   w==;
X-CSE-ConnectionGUID: Tc6jV0gES/2u+RJLhccyjw==
X-CSE-MsgGUID: 1zeu8TEhRpuoXMosEh0Jrg==
X-IronPort-AV: E=Sophos;i="6.25,193,1779148800"; 
   d="scan'208";a="24643652"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-006.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 23:38:23 +0000
Received: from EX19MTAUWC002.ant.amazon.com [205.251.233.111:9809]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.53.248:2525] with esmtp (Farcaster)
 id b6e22415-9bb9-4376-a1aa-3c12f2ece870; Wed, 29 Jul 2026 23:38:23 +0000 (UTC)
X-Farcaster-Flow-ID: b6e22415-9bb9-4376-a1aa-3c12f2ece870
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.45;
 Wed, 29 Jul 2026 23:38:23 +0000
Received: from dev-dsk-akiyano-1c-2138b29d.eu-west-1.amazon.com (172.19.83.6)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.45;
 Wed, 29 Jul 2026 23:38:17 +0000
From: Arthur Kiyanovski <akiyano@amazon.com>
To: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>, <netdev@vger.kernel.org>
CC: Arthur Kiyanovski <akiyano@amazon.com>, Eric Dumazet
	<edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, David Woodhouse
	<dwmw2@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Miroslav Lichvar
	<mlichvar@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>, Andrew Lunn
	<andrew@lunn.ch>, Carolina Jubran <cjubran@nvidia.com>, Wen Gu
	<guwen@linux.alibaba.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, "David
 Woodhouse" <dwmw@amazon.com>, Yonatan Sarna <ysarna@amazon.com>, "Zorik
 Machulsky" <zorik@amazon.com>, Alexander Matushevsky <matua@amazon.com>,
	"Saeed Bshara" <saeedb@amazon.com>, Matt Wilson <msw@amazon.com>, Anthony
 Liguori <aliguori@amazon.com>, Nafea Bshara <nafea@amazon.com>, Evgeny
 Schmeilin <evgenys@amazon.com>, Netanel Belgazal <netanel@amazon.com>, Ali
 Saidi <alisaidi@amazon.com>, Benjamin Herrenschmidt <benh@amazon.com>, Noam
 Dagan <ndagan@amazon.com>, David Arinzon <darinzon@amazon.com>, Evgeny
 Ostrovsky <evostrov@amazon.com>, Ofir Tabachnik <ofirt@amazon.com>, Amit
 Bernstein <amitbern@amazon.com>, <linux-kselftest@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <shuah@kernel.org>, Jonathan Corbet
	<corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Simon Horman
	<horms@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	<vadim.fedorenko@linux.dev>, David Woodhouse <dwmw@amazon.co.uk>
Subject: [PATCH v6 net-next 5/7] net: ena: Update PHC admin interface for error bound support
Date: Wed, 29 Jul 2026 23:37:34 +0000
Message-ID: <20260729233740.16516-6-akiyano@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260729233740.16516-1-akiyano@amazon.com>
References: <20260729233740.16516-1-akiyano@amazon.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D036UWB003.ant.amazon.com (10.13.139.172) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

Extend the ENA admin interface to support error bound.

Add error_bound to the PHC response structure.
Introduce a feature version mechanism to indicate device supports
error_bound, and add an error flag for error_bound retrieval failures.

This enables the driver to retrieve error_bound information from the
device alongside timestamps.

Co-developed-by: Amit Bernstein <amitbern@amazon.com>
Signed-off-by: Amit Bernstein <amitbern@amazon.com>
Signed-off-by: Arthur Kiyanovski <akiyano@amazon.com>
Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
---
 .../net/ethernet/amazon/ena/ena_admin_defs.h    | 17 +++++++++++------
 drivers/net/ethernet/amazon/ena/ena_com.c       | 11 ++++++-----
 2 files changed, 17 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/amazon/ena/ena_admin_defs.h b/drivers/net/ethernet/amazon/ena/ena_admin_defs.h
index 898ecd96b96a..2d132c4bc590 100644
--- a/drivers/net/ethernet/amazon/ena/ena_admin_defs.h
+++ b/drivers/net/ethernet/amazon/ena/ena_admin_defs.h
@@ -128,12 +128,14 @@ enum ena_admin_get_stats_scope {
 	ENA_ADMIN_ETH_TRAFFIC                       = 1,
 };
 
-enum ena_admin_phc_type {
-	ENA_ADMIN_PHC_TYPE_READLESS                 = 0,
+enum ena_admin_phc_feature_version {
+	/* Readless with error_bound */
+	ENA_ADMIN_PHC_FEATURE_VERSION_0             = 0,
 };
 
 enum ena_admin_phc_error_flags {
 	ENA_ADMIN_PHC_ERROR_FLAG_TIMESTAMP   = BIT(0),
+	ENA_ADMIN_PHC_ERROR_FLAG_ERROR_BOUND = BIT(1),
 };
 
 /* ENA SRD configuration for ENI */
@@ -1035,10 +1037,10 @@ struct ena_admin_queue_ext_feature_desc {
 };
 
 struct ena_admin_feature_phc_desc {
-	/* PHC type as defined in enum ena_admin_get_phc_type,
-	 * used only for GET command.
+	/* PHC version as defined in enum ena_admin_phc_feature_version,
+	 * used only for GET command as max supported PHC version by the device.
 	 */
-	u8 type;
+	u8 version;
 
 	/* Reserved - MBZ */
 	u8 reserved1[3];
@@ -1224,7 +1226,10 @@ struct ena_admin_phc_resp {
 	/* PHC timestamp (nsec) */
 	u64 timestamp;
 
-	u8 reserved2[12];
+	u8 reserved2[8];
+
+	/* Timestamp error limit (nsec) */
+	u32 error_bound;
 
 	/* Bit field of enum ena_admin_phc_error_flags */
 	u32 error_flags;
diff --git a/drivers/net/ethernet/amazon/ena/ena_com.c b/drivers/net/ethernet/amazon/ena/ena_com.c
index 297fb36ab8c1..40d1fd64bc34 100644
--- a/drivers/net/ethernet/amazon/ena/ena_com.c
+++ b/drivers/net/ethernet/amazon/ena/ena_com.c
@@ -1682,11 +1682,11 @@ int ena_com_phc_config(struct ena_com_dev *ena_dev)
 	struct ena_admin_set_feat_cmd set_feat_cmd;
 	int ret = 0;
 
-	/* Get device PHC default configuration */
+	/* Get default device PHC configuration */
 	ret = ena_com_get_feature(ena_dev,
 				  &get_feat_resp,
 				  ENA_ADMIN_PHC_CONFIG,
-				  0);
+				  ENA_ADMIN_PHC_FEATURE_VERSION_0);
 	if (unlikely(ret)) {
 		netdev_err(ena_dev->net_device,
 			   "Failed to get PHC feature configuration, error: %d\n",
@@ -1694,10 +1694,11 @@ int ena_com_phc_config(struct ena_com_dev *ena_dev)
 		return ret;
 	}
 
-	/* Supporting only readless PHC retrieval */
-	if (get_feat_resp.u.phc.type != ENA_ADMIN_PHC_TYPE_READLESS) {
+	/* Supporting only PHC V0 (readless mode with error bound) */
+	if (get_feat_resp.u.phc.version != ENA_ADMIN_PHC_FEATURE_VERSION_0) {
 		netdev_err(ena_dev->net_device,
-			   "Unsupported PHC type, error: %d\n",
+			   "Unsupported PHC version (0x%X), error: %d\n",
+			   get_feat_resp.u.phc.version,
 			   -EOPNOTSUPP);
 		return -EOPNOTSUPP;
 	}
-- 
2.47.3

