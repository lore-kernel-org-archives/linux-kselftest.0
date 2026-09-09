Received: from pdx-out-001.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-001.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.245.243.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F7C43D7D8D;
	Wed,  9 Sep 2026 07:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.245.243.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788939181; cv=none; b=TVBm9qH9KBAC+GXkfwmAGjKUr6sl+fel74WZYgeKY0vFYMcJnSlvcRBhAG3VSf6phVKl5vzelLNPuMvxG9lI2F4w91yhIk8u0pMR23TNabFY6xrGyaKGCkcZVZN0RfUGzQqziQTMylmKIviCezIFbA/LTsvbHyA1bHB3T0U0tKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788939181; c=relaxed/simple;
	bh=Bv57IfIU0/+Yhmuqr4qxGgiiTA9ZTAyMJokDBeCZbGk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=vDRw+Ieq83uS9qy5lT26vSDfCuoQd1kOf4T+8ZqY4S5XTlXt/MnuwzqR4miGHaluFzTQrnoKAycS1BHMrmMORUr/z5QNFbVuslrfavIbY5QyptLQCT1RFxMT0XvZMBJfsYCRWPA6CIcPXLb9HrDrDrkGRn2kXOyWlMaEc7KiHc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=OeViczQ1; arc=none smtp.client-ip=44.245.243.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="OeViczQ1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1788939178; x=1820475178;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dsjm1PUL13BDO2LDLCZyjE7vr9P4k6EkADkJIagz9Q4=;
  b=OeViczQ1DFE1aAxzMkIdlXoDveeiBkXRsgWIWkn2p4xKG5jqz4w2TZC2
   5ckiKCzwuLAossPGEYRxmRS6NanhfntMxNRfunFF/LijiwfzOu5rkTVmd
   mQlwg67tka3RvopgJx6dkLDsEafck4XywbFn8eEyE7GDBjj5xmxC6Eknp
   jBEqPzcZjLJ6xP19L2Z8O6r+SWJYVPCLkBbJ/paI3inIzK3rRE8MFeKMS
   1PPl4ZLPHykPQA0r///1ZEYi9IQmW8l16sViw2m8vfEkHut9JQn1qusXr
   ygVcV1a6vjE23sBcLIjO0P0FxtXO38XeA0nFv9ixsPWltVWBwnOcHHBjY
   g==;
X-CSE-ConnectionGUID: 52WgGGzZRb2r1PZ1G9BM2A==
X-CSE-MsgGUID: I7uwacuOR/qvpDQjA7sKMw==
X-IronPort-AV: E=Sophos;i="6.25,270,1779148800"; 
   d="scan'208";a="27698468"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-001.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 07:32:54 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.105:13222]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.24.165:2525] with esmtp (Farcaster)
 id 43a162c8-2ceb-4240-803e-feca777f8554; Wed, 9 Sep 2026 07:32:54 +0000 (UTC)
X-Farcaster-Flow-ID: 43a162c8-2ceb-4240-803e-feca777f8554
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.45;
 Wed, 9 Sep 2026 07:32:54 +0000
Received: from dev-dsk-akiyano-1c-2138b29d.eu-west-1.amazon.com (172.19.83.6)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.46;
 Wed, 9 Sep 2026 07:32:47 +0000
From: Arthur Kiyanovski <akiyano@amazon.com>
To: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>, <netdev@vger.kernel.org>
CC: Arthur Kiyanovski <akiyano@amazon.com>, Eric Dumazet
	<edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, David Woodhouse
	<dwmw2@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Miroslav Lichvar
	<mlichvar@redhat.com>, Maciek Machnikowski <maciek@machnikowski.net>, "Andrew
 Lunn" <andrew+netdev@lunn.ch>, Andrew Lunn <andrew@lunn.ch>, Carolina Jubran
	<cjubran@nvidia.com>, Wen Gu <guwen@linux.alibaba.com>, Xuan Zhuo
	<xuanzhuo@linux.alibaba.com>, David Woodhouse <dwmw@amazon.com>, "Yonatan
 Sarna" <ysarna@amazon.com>, Zorik Machulsky <zorik@amazon.com>, "Alexander
 Matushevsky" <matua@amazon.com>, Saeed Bshara <saeedb@amazon.com>, Matt
 Wilson <msw@amazon.com>, Anthony Liguori <aliguori@amazon.com>, Nafea Bshara
	<nafea@amazon.com>, Evgeny Schmeilin <evgenys@amazon.com>, Netanel Belgazal
	<netanel@amazon.com>, Ali Saidi <alisaidi@amazon.com>, Benjamin Herrenschmidt
	<benh@amazon.com>, Noam Dagan <ndagan@amazon.com>, David Arinzon
	<darinzon@amazon.com>, Evgeny Ostrovsky <evostrov@amazon.com>, Ofir Tabachnik
	<ofirt@amazon.com>, Amit Bernstein <amitbern@amazon.com>,
	<linux-kselftest@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
	<skhan@linuxfoundation.org>, Simon Horman <horms@kernel.org>, Bjorn Helgaas
	<bhelgaas@google.com>, <vadim.fedorenko@linux.dev>, David Woodhouse
	<dwmw@amazon.co.uk>
Subject: [PATCH v7 net-next 7/7] net: ena: Implement gettimexattrs64 callback for PTP attributes
Date: Wed, 9 Sep 2026 07:31:33 +0000
Message-ID: <20260909073136.12863-8-akiyano@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260909073136.12863-1-akiyano@amazon.com>
References: <20260909073136.12863-1-akiyano@amazon.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D040UWA001.ant.amazon.com (10.13.139.22) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

Implement the gettimexattrs64 callback in the ENA driver to support
the PTP_SYS_OFFSET_EXTENDED_ATTRS ioctl.

This enables applications to retrieve PHC timestamps with quality
attributes through the standard PTP ioctl interface.

The ENA device currently reports only error_bound (valid bit set).
Other attributes are not reported (valid bits unset).

Co-developed-by: Amit Bernstein <amitbern@amazon.com>
Signed-off-by: Amit Bernstein <amitbern@amazon.com>
Signed-off-by: Arthur Kiyanovski <akiyano@amazon.com>
Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
---
 drivers/net/ethernet/amazon/ena/ena_phc.c | 58 +++++++++++++++++++----
 1 file changed, 48 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/amazon/ena/ena_phc.c b/drivers/net/ethernet/amazon/ena/ena_phc.c
index 2bcb5af564e2..725c36fe3f6e 100644
--- a/drivers/net/ethernet/amazon/ena/ena_phc.c
+++ b/drivers/net/ethernet/amazon/ena/ena_phc.c
@@ -25,6 +25,43 @@ static int ena_phc_feature_enable(struct ptp_clock_info *clock_info,
 	return -EOPNOTSUPP;
 }
 
+static int ena_phc_gettimexattrs64(struct ptp_clock_info *clock_info,
+				   struct timespec64 *ts,
+				   struct ptp_system_timestamp *sts,
+				   struct ptp_clock_attrs *att)
+{
+	struct ena_phc_info *phc_info =
+		container_of(clock_info, struct ena_phc_info, clock_info);
+	u32 error_bound_nsec;
+	unsigned long flags;
+	u64 timestamp_nsec;
+	int rc;
+
+	spin_lock_irqsave(&phc_info->lock, flags);
+
+	ptp_read_system_prets(sts);
+
+	rc = ena_com_phc_get_timestamp(phc_info->adapter->ena_dev,
+				       &timestamp_nsec,
+				       &error_bound_nsec);
+
+	ptp_read_system_postts(sts);
+
+	spin_unlock_irqrestore(&phc_info->lock, flags);
+
+	if (rc)
+		return rc;
+
+	*ts = ns_to_timespec64(timestamp_nsec);
+
+	if (att) {
+		att->error_bound = error_bound_nsec;
+		att->valid |= PTP_ATTRS_VALID_ERROR_BOUND;
+	}
+
+	return 0;
+}
+
 static int ena_phc_gettimex64(struct ptp_clock_info *clock_info,
 			      struct timespec64 *ts,
 			      struct ptp_system_timestamp *sts)
@@ -62,16 +99,17 @@ static int ena_phc_settime64(struct ptp_clock_info *clock_info,
 }
 
 static struct ptp_clock_info ena_ptp_clock_info = {
-	.owner		= THIS_MODULE,
-	.n_alarm	= 0,
-	.n_ext_ts	= 0,
-	.n_per_out	= 0,
-	.pps		= 0,
-	.adjtime	= ena_phc_adjtime,
-	.adjfine	= ena_phc_adjfine,
-	.gettimex64	= ena_phc_gettimex64,
-	.settime64	= ena_phc_settime64,
-	.enable		= ena_phc_feature_enable,
+	.owner		   = THIS_MODULE,
+	.n_alarm	   = 0,
+	.n_ext_ts	   = 0,
+	.n_per_out	   = 0,
+	.pps		   = 0,
+	.adjtime	   = ena_phc_adjtime,
+	.adjfine	   = ena_phc_adjfine,
+	.gettimexattrs64   = ena_phc_gettimexattrs64,
+	.gettimex64	   = ena_phc_gettimex64,
+	.settime64	   = ena_phc_settime64,
+	.enable		   = ena_phc_feature_enable,
 };
 
 /* Enable/Disable PHC by the kernel, affects on the next init flow */
-- 
2.47.3

