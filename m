Received: from pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com [35.83.148.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43613FA5D4;
	Wed, 29 Jul 2026 23:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.83.148.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785368318; cv=none; b=g+En1cNzfu5zarSQpk5JDqGNhfMCTAQtfNMG//Jt3z4EkE3mPKOg5lx5X/kl5WLCCaG+CTMpAeAe5H+xVduWtukWUsG56vQrlKKafHqlLCr3ExZh1MYXYu8W/evWOZFFxMVhcJ6aqfodLQy3jeaqXjoHQnk9PCmG8rI6J31AQH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785368318; c=relaxed/simple;
	bh=Bv57IfIU0/+Yhmuqr4qxGgiiTA9ZTAyMJokDBeCZbGk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J9xSIn+Ld6b9n/7l7cdE/WKc350GABKfyZ3iYBX6EgBiul4De2DbYHFtvBpnt/NkOJg690iA0RUz8hl1S/HMKv4W3XcOreXZfjo54pEWoYRcw2w1mPt0XZkXSZcAMu2/bhJJgEaMO8PCl5zMORoa8ldnDnI6DqwavgiuMPwkwZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=Zws7t7+P; arc=none smtp.client-ip=35.83.148.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="Zws7t7+P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1785368316; x=1816904316;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dsjm1PUL13BDO2LDLCZyjE7vr9P4k6EkADkJIagz9Q4=;
  b=Zws7t7+PCnIdNpkMkbaBsCi/YF/S/f5fnfZhnYSmZk8BaNiB4Hr7XoPI
   ZutwBs4bV++h/qEsXXZ7DD9zkr0ldMba0U/JOea0MBbSdvBnv3N51YG+r
   Iz3jWJFvoXjy33EVfx4/0lk0uPr8pIRv6kFa85QwN1UkI14Yp3LBhHe23
   DpvqLVErvh021Ma0LcT2+CT+hWaZLOGLvjA239zb62emu3pD2aIVLFz6g
   4RwHSJ0rh3iTFBMKBzezsR63G1hp9dgGVUam40d1AjnXKchPReGVnzwAf
   gNAQNKB+XSJhkqz7f+RyvIMwXsJwlPRbQ0GerRzhSCFFi5tahzrrf6nC3
   A==;
X-CSE-ConnectionGUID: RF83o/c2SEun8G5SM2FB/w==
X-CSE-MsgGUID: CzRDpEibTPGEsM2doGuGxA==
X-IronPort-AV: E=Sophos;i="6.25,193,1779148800"; 
   d="scan'208";a="24411293"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 23:38:36 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.111:2249]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.53.230:2525] with esmtp (Farcaster)
 id b03d46ea-ae77-4a49-a0d4-745beae2e0d8; Wed, 29 Jul 2026 23:38:36 +0000 (UTC)
X-Farcaster-Flow-ID: b03d46ea-ae77-4a49-a0d4-745beae2e0d8
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.45;
 Wed, 29 Jul 2026 23:38:35 +0000
Received: from dev-dsk-akiyano-1c-2138b29d.eu-west-1.amazon.com (172.19.83.6)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.45;
 Wed, 29 Jul 2026 23:38:30 +0000
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
Subject: [PATCH v6 net-next 7/7] net: ena: Implement gettimexattrs64 callback for PTP attributes
Date: Wed, 29 Jul 2026 23:37:36 +0000
Message-ID: <20260729233740.16516-8-akiyano@amazon.com>
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

