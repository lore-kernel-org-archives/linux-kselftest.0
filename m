Received: from pdx-out-008.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-008.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.42.203.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB52B3F8257;
	Wed, 29 Jul 2026 23:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.42.203.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785368315; cv=none; b=JVFhFUsb9qhjH6EbPJFnfLsEIatEx+zRxQnD0e5SxD9laFeC/irINEUtRZe5fWqK3cnCKWRjJn/Rl3EGhSrYN5g2ryeB920pUTCPKmR11+ht5QrbzhUOra6ekSIDztNHbyWICmvSU34IzpaGIgQ0hFReocgd8zRBw6umnetZMSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785368315; c=relaxed/simple;
	bh=l7cohhIyUkEqOQB4gxsxvWlV/fI3CzRYvoc6+SDhf+Y=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Oqszhu9yrcA4lEJkSZfiw9vqhFEAkN3hKAvCpFVp7o8/TB7ih/RQ3CcbdLo9+BUlfVnmyZVLqRfYtGSCGCdRpag+2BIrEUqI6mUvtrSkiSmtFQsYVbR9/Sdl7M/lMxOfA8XZHCClbGAOnkg+FtL7ZJu7tJAE56xU5L7Cop+5Im8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=BefGpnDi; arc=none smtp.client-ip=52.42.203.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="BefGpnDi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1785368313; x=1816904313;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=czuKqGRe0wnRc2uL0MqYikCPk/ocXwNmytmhYvA8LRs=;
  b=BefGpnDiQZhvYwwiAK4O0SIvvTSVMsOw7GMBsLTgE06C+OzNIKnKDNXh
   DehfDryqFIVlICMVprvwCpl/U2ZntyUSOpGG/aXkbDL3c1fnjmdaaW86c
   AiEXoCzFhrTlBhGRk+Mu6IalFUQ5uRi9VDV4Xs5K48g85tJwyoFlqj6O5
   PnE210cufM4wO0O8TTcVeRKTpqtWOBEZqe6Ohem6dCmS5stxcJhMY6nVT
   85WGXqkJlbOpJnTPPW7pr3CkGhAXKUr0DzhVdTihKYe128y34VXd8ACXm
   u8iggC4kyNbrXZrvTUG8CMyW2gzr7Qmvjh96iIg6EHDto88jYkk02ZKPQ
   w==;
X-CSE-ConnectionGUID: ZDWwoRYDT3SRPUr+2EqVNA==
X-CSE-MsgGUID: S+hnJCWXT3C8U5BLb9+lfA==
X-IronPort-AV: E=Sophos;i="6.25,193,1779148800"; 
   d="scan'208";a="24641125"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-008.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 23:38:31 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.236:20399]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.10.68:2525] with esmtp (Farcaster)
 id 632a5c9e-aa46-43e6-9d6b-7c6ef055260d; Wed, 29 Jul 2026 23:38:30 +0000 (UTC)
X-Farcaster-Flow-ID: 632a5c9e-aa46-43e6-9d6b-7c6ef055260d
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.218) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.45;
 Wed, 29 Jul 2026 23:38:30 +0000
Received: from dev-dsk-akiyano-1c-2138b29d.eu-west-1.amazon.com (172.19.83.6)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.45;
 Wed, 29 Jul 2026 23:38:24 +0000
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
Subject: [PATCH v6 net-next 6/7] net: ena: Add error bound to PHC communication layer
Date: Wed, 29 Jul 2026 23:37:35 +0000
Message-ID: <20260729233740.16516-7-akiyano@amazon.com>
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
X-ClientProxiedBy: EX19D031UWC002.ant.amazon.com (10.13.139.212) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

Extend the ENA PHC communication layer to retrieve error bound from
the device.

Update ena_com_phc_get_timestamp() to retrieve error_bound alongside
timestamps.
Add error handling and statistics for error_bound retrieval failures.

Co-developed-by: Amit Bernstein <amitbern@amazon.com>
Signed-off-by: Amit Bernstein <amitbern@amazon.com>
Signed-off-by: Arthur Kiyanovski <akiyano@amazon.com>
Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
---
 .../device_drivers/ethernet/amazon/ena.rst    |  2 +
 drivers/net/ethernet/amazon/ena/ena_com.c     | 40 ++++++++++++-------
 drivers/net/ethernet/amazon/ena/ena_com.h     |  5 ++-
 drivers/net/ethernet/amazon/ena/ena_debugfs.c |  3 ++
 drivers/net/ethernet/amazon/ena/ena_phc.c     |  3 +-
 5 files changed, 36 insertions(+), 17 deletions(-)

diff --git a/Documentation/networking/device_drivers/ethernet/amazon/ena.rst b/Documentation/networking/device_drivers/ethernet/amazon/ena.rst
index 14784a0a6a8a..ce9ba84bfd01 100644
--- a/Documentation/networking/device_drivers/ethernet/amazon/ena.rst
+++ b/Documentation/networking/device_drivers/ethernet/amazon/ena.rst
@@ -306,6 +306,8 @@ PHC errors must remain below 1% of all PHC requests to maintain the desired leve
 **phc_err_dv**      | Number of failed get time attempts due to device errors (entering into block state).
 **phc_err_ts**      | Number of failed get time attempts due to timestamp errors (entering into block state),
                     | This occurs if driver exceeded the request limit or device received an invalid timestamp.
+**phc_err_eb**      | Number of failed get time attempts due to error bound errors (entering into block state),
+                    | This occurs if device received an excessively high or invalid error bound.
 =================   ======================================================
 
 PHC timeouts:
diff --git a/drivers/net/ethernet/amazon/ena/ena_com.c b/drivers/net/ethernet/amazon/ena/ena_com.c
index 40d1fd64bc34..353cb88e880e 100644
--- a/drivers/net/ethernet/amazon/ena/ena_com.c
+++ b/drivers/net/ethernet/amazon/ena/ena_com.c
@@ -45,7 +45,8 @@
 #define ENA_PHC_DEFAULT_EXPIRE_TIMEOUT_USEC 10
 #define ENA_PHC_DEFAULT_BLOCK_TIMEOUT_USEC 1000
 #define ENA_PHC_REQ_ID_OFFSET 0xDEAD
-#define ENA_PHC_ERROR_FLAGS (ENA_ADMIN_PHC_ERROR_FLAG_TIMESTAMP)
+#define ENA_PHC_ERROR_FLAGS (ENA_ADMIN_PHC_ERROR_FLAG_TIMESTAMP | \
+			     ENA_ADMIN_PHC_ERROR_FLAG_ERROR_BOUND)
 
 /*****************************************************************************/
 /*****************************************************************************/
@@ -1726,7 +1727,7 @@ int ena_com_phc_config(struct ena_com_dev *ena_dev)
 	if (phc->expire_timeout_usec > phc->block_timeout_usec)
 		phc->expire_timeout_usec = phc->block_timeout_usec;
 
-	/* Prepare PHC feature command */
+	/* Prepare PHC config feature command */
 	memset(&set_feat_cmd, 0x0, sizeof(set_feat_cmd));
 	set_feat_cmd.aq_common_descriptor.opcode = ENA_ADMIN_SET_FEATURE;
 	set_feat_cmd.feat_common.feature_id = ENA_ADMIN_PHC_CONFIG;
@@ -1781,7 +1782,8 @@ void ena_com_phc_destroy(struct ena_com_dev *ena_dev)
 	phc->virt_addr = NULL;
 }
 
-int ena_com_phc_get_timestamp(struct ena_com_dev *ena_dev, u64 *timestamp)
+int ena_com_phc_get_timestamp(struct ena_com_dev *ena_dev, u64 *timestamp,
+			      u32 *error_bound)
 {
 	const ktime_t zero_system_time = ktime_set(0, 0);
 	struct ena_com_phc_info *phc = &ena_dev->phc;
@@ -1828,6 +1830,8 @@ int ena_com_phc_get_timestamp(struct ena_com_dev *ena_dev, u64 *timestamp)
 			 * a PHC error, this occurs if device:
 			 * - exceeded the get time request limit
 			 * - received an invalid timestamp
+			 * - received an excessively high error bound
+			 * - received an invalid error bound
 			 */
 			netdev_err(ena_dev->net_device,
 				   "PHC get time request 0x%x failed (error 0x%x)\n",
@@ -1835,9 +1839,11 @@ int ena_com_phc_get_timestamp(struct ena_com_dev *ena_dev, u64 *timestamp)
 				   resp->error_flags);
 			phc->stats.phc_err_ts += !!(resp->error_flags &
 				ENA_ADMIN_PHC_ERROR_FLAG_TIMESTAMP);
+			phc->stats.phc_err_eb += !!(resp->error_flags &
+				ENA_ADMIN_PHC_ERROR_FLAG_ERROR_BOUND);
 		} else {
 			/* Device updated req_id during blocking time
-			 * with valid timestamp
+			 * with valid timestamp and error bound
 			 */
 			phc->stats.phc_exp++;
 		}
@@ -1864,9 +1870,9 @@ int ena_com_phc_get_timestamp(struct ena_com_dev *ena_dev, u64 *timestamp)
 	/* Stalling until the device updates req_id */
 	while (1) {
 		if (unlikely(ktime_after(ktime_get(), expire_time))) {
-			/* Gave up waiting for updated req_id, PHC enters into
-			 * blocked state until passing blocking time,
-			 * during this time any get PHC timestamp will fail with
+			/* Gave up waiting for updated req_id,
+			 * PHC enters into blocked state until passing blocking
+			 * time, during this time, any request will fail with
 			 * device busy error
 			 */
 			ret = -EBUSY;
@@ -1881,20 +1887,21 @@ int ena_com_phc_get_timestamp(struct ena_com_dev *ena_dev, u64 *timestamp)
 			continue;
 		}
 
-		/* Ensure PHC payload (timestamp, error_flags) is read
-		 * after req_id update is observed
+		/* Ensure PHC payload (timestamp, error_bound, error_flags)
+		 * is read after req_id update is observed
 		 */
 		dma_rmb();
 
 		/* req_id was updated by the device which indicates that
-		 * PHC timestamp and error_flags are updated too,
-		 * checking errors before retrieving timestamp
+		 * PHC timestamp, error_bound and error_flags are updated too,
+		 * checking error flags before retrieving timestamp and
+		 * error_bound values
 		 */
 		if (unlikely(resp->error_flags & ENA_PHC_ERROR_FLAGS)) {
-			/* Retrieved invalid PHC timestamp, PHC enters into
-			 * blocked state until passing blocking time,
-			 * during this time any get PHC timestamp requests
-			 * will fail with device busy error
+			/* Retrieved timestamp or error bound errors,
+			 * PHC enters into blocked state until passing blocking
+			 * time, during this time, any request will fail with
+			 * device busy error
 			 */
 			ret = -EBUSY;
 			break;
@@ -1902,12 +1909,15 @@ int ena_com_phc_get_timestamp(struct ena_com_dev *ena_dev, u64 *timestamp)
 
 		/* PHC timestamp value is returned to the caller */
 		*timestamp = resp->timestamp;
+		if (error_bound)
+			*error_bound = resp->error_bound;
 
 		/* Update statistic on valid PHC timestamp retrieval */
 		phc->stats.phc_cnt++;
 
 		/* This indicates PHC state is active */
 		phc->system_time = zero_system_time;
+
 		break;
 	}
 
diff --git a/drivers/net/ethernet/amazon/ena/ena_com.h b/drivers/net/ethernet/amazon/ena/ena_com.h
index 64df2c48c9a6..fcbff1a9eb7a 100644
--- a/drivers/net/ethernet/amazon/ena/ena_com.h
+++ b/drivers/net/ethernet/amazon/ena/ena_com.h
@@ -216,6 +216,7 @@ struct ena_com_stats_phc {
 	u64 phc_skp;
 	u64 phc_err_dv;
 	u64 phc_err_ts;
+	u64 phc_err_eb;
 };
 
 struct ena_com_admin_queue {
@@ -462,9 +463,11 @@ void ena_com_phc_destroy(struct ena_com_dev *ena_dev);
 /* ena_com_phc_get_timestamp - Retrieve PHC timestamp
  * @ena_dev: ENA communication layer struct
  * @timestamp: Retrieved PHC timestamp
+ * @error_bound: maximum possible deviation of the timestamp (nanosecond)
  * @return - 0 on success, negative value on failure
  */
-int ena_com_phc_get_timestamp(struct ena_com_dev *ena_dev, u64 *timestamp);
+int ena_com_phc_get_timestamp(struct ena_com_dev *ena_dev, u64 *timestamp,
+			      u32 *error_bound);
 
 /* ena_com_set_mmio_read_mode - Enable/disable the indirect mmio reg read mechanism
  * @ena_dev: ENA communication layer struct
diff --git a/drivers/net/ethernet/amazon/ena/ena_debugfs.c b/drivers/net/ethernet/amazon/ena/ena_debugfs.c
index 46ed80986724..db9d1843996b 100644
--- a/drivers/net/ethernet/amazon/ena/ena_debugfs.c
+++ b/drivers/net/ethernet/amazon/ena/ena_debugfs.c
@@ -32,6 +32,9 @@ static int phc_stats_show(struct seq_file *file, void *priv)
 	seq_printf(file,
 		   "phc_err_ts: %llu\n",
 		   adapter->ena_dev->phc.stats.phc_err_ts);
+	seq_printf(file,
+		   "phc_err_eb: %llu\n",
+		   adapter->ena_dev->phc.stats.phc_err_eb);
 
 	return 0;
 }
diff --git a/drivers/net/ethernet/amazon/ena/ena_phc.c b/drivers/net/ethernet/amazon/ena/ena_phc.c
index c2a3ff1ef645..2bcb5af564e2 100644
--- a/drivers/net/ethernet/amazon/ena/ena_phc.c
+++ b/drivers/net/ethernet/amazon/ena/ena_phc.c
@@ -40,7 +40,8 @@ static int ena_phc_gettimex64(struct ptp_clock_info *clock_info,
 	ptp_read_system_prets(sts);
 
 	rc = ena_com_phc_get_timestamp(phc_info->adapter->ena_dev,
-				       &timestamp_nsec);
+				       &timestamp_nsec,
+				       NULL);
 
 	ptp_read_system_postts(sts);
 
-- 
2.47.3

