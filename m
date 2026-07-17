Received: from pdx-out-010.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-010.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.12.53.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3343D891B;
	Fri, 17 Jul 2026 07:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.12.53.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784272331; cv=none; b=k016trlYgwF1tQg5qYXKWy13gLTvii058EhgNHjvUwL5VmrXAovezupRJsJ9zW5BZS1pvjODh3hPB2nE084p4UgAqiELe1OUBgtXzEdSUpck3N6yFmydd9Fd3rikqne/ySxOjeU5IW7LyB3GFEw3Ua3Rj1sdXgnlu0RUztOOMhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784272331; c=relaxed/simple;
	bh=57qGqSE9tP6lPRw/YAUHjWMVC1tvGg7x5fped7GmMnc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LjCXCEnhwFWawwGfkTElyiLvgzyPcm9BmYveMIqojnQ8TusVdjlu1gFqu/arwfRc5nTsNBeszJd+Vj/apZYPZnrmQDr78eUCLY4sIU15z9b9k/Wl2tNR4DWevtMNzcFmwA4Oj6Bxmh+z7VNmD+/JoigMUXvCWKiSkXXWAQEOA68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=rDFOW627; arc=none smtp.client-ip=52.12.53.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="rDFOW627"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1784272329; x=1815808329;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7zkFcRd5mu9B02BIWtTtfZKps/G89UKhgagGL2Z3qRE=;
  b=rDFOW627xQFQzWTIOolT5kV23PaqrDXoNaV3Vw78ad58A6XqDBtvGEud
   vzzRT0ZshwaLXRE7uNQ6TXrHzrLwlJHun7zz2tDvjqU4qO+4hTFTg/mEx
   HgBJWlkNQOGRlR9nsVY9N1eUBNSpHJOE/bPgMV4Vzcp5FoPjqVAkp5ZmN
   002pecRd84fSrJy5OOfhk/jpUs69AlfBobyZVYKdZ2N1r+Y/BBOR9t9I6
   UDpnE4LaapSK2X1Hcz4x+i+usEYenmnB22CPgCt/Yublyn1M2rQny2D3s
   NWQQaq4rpl1+cq5L7BR91J7iqcV++HG9DvXoQYyymUz6S8rx/RgyGYxQf
   w==;
X-CSE-ConnectionGUID: XyJ1zEdhTsGVN4F2VZusNg==
X-CSE-MsgGUID: C0+Q3rjcRpmBLmJiwsCVzA==
X-IronPort-AV: E=Sophos;i="6.25,168,1779148800"; 
   d="scan'208";a="23718125"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-010.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 07:12:00 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.236:7239]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.48.250:2525] with esmtp (Farcaster)
 id e0098f18-a827-49c0-af27-fb59ae799f8e; Fri, 17 Jul 2026 07:11:59 +0000 (UTC)
X-Farcaster-Flow-ID: e0098f18-a827-49c0-af27-fb59ae799f8e
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.204) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.43;
 Fri, 17 Jul 2026 07:11:59 +0000
Received: from dev-dsk-akiyano-1c-2138b29d.eu-west-1.amazon.com (172.19.83.6)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.43;
 Fri, 17 Jul 2026 07:11:53 +0000
From: Arthur Kiyanovski <akiyano@amazon.com>
To: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
	<netdev@vger.kernel.org>
CC: Arthur Kiyanovski <akiyano@amazon.com>, Richard Cochran
	<richardcochran@gmail.com>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
	<pabeni@redhat.com>, David Woodhouse <dwmw2@infradead.org>, Thomas Gleixner
	<tglx@linutronix.de>, Miroslav Lichvar <mlichvar@redhat.com>, Andrew Lunn
	<andrew+netdev@lunn.ch>, Wen Gu <guwen@linux.alibaba.com>, Xuan Zhuo
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
	<bhelgaas@google.com>, <vadim.fedorenko@linux.dev>
Subject: [PATCH v5 net-next 7/7] net: ena: Implement gettimexattrs64 callback for PTP attributes
Date: Fri, 17 Jul 2026 07:09:35 +0000
Message-ID: <20260717070936.10718-3-akiyano@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260717070936.10718-1-akiyano@amazon.com>
References: <20260717065924.2556-1-akiyano@amazon.com>
 <20260717070936.10718-1-akiyano@amazon.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D039UWB004.ant.amazon.com (10.13.138.57) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

Implement the gettimexattrs64 callback in the ENA driver to support
the PTP_SYS_OFFSET_EXTENDED_ATTRS ioctl.

This enables applications to retrieve PHC timestamps with quality
attributes through the standard PTP ioctl interface.

The ENA device currently reports only error_bound (valid bit set).
Other attributes are not reported (valid bits unset).

Signed-off-by: Amit Bernstein <amitbern@amazon.com>
Signed-off-by: Arthur Kiyanovski <akiyano@amazon.com>
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

