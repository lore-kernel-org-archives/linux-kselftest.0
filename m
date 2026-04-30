Received: from pdx-out-001.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-001.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.245.243.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80713750D5;
	Thu, 30 Apr 2026 03:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.245.243.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777519566; cv=none; b=Ompp9GGyJdI2kfqFAyvEqQ6vJVlSVH2c7Cj21kBG3xPM9nMrYxS0IOw9h7u47g3wGLuftSHCyJRRH3lbbAJIxStBJHDfofmE7dkSJJIpU4n+QkgKpe/MJsGIsbD4JUc2ODg62yt78FvIEbxnL3ZFkpfwFtUYfuE6/f37pB7E7yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777519566; c=relaxed/simple;
	bh=TNE3wFxySN+NnT7u8aGCpT/TMQW6VUAIal+tyAB0im0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VTn6aKkv9oICACic7ZPqXRb/2WpyddwYLINJhLXjcj4zRMDvTIN3n52914xGd20y6MrFC6SSgMhfFSGSThdE/xxs44MBoq/yDesh36PhU7rzo+2ZzGyeXIZ8XO9jbEfhi9rnc/GDDnnSbm5wxOZF5fC/aByJoGvVdAU7NJSXIdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=qMfc2rEn; arc=none smtp.client-ip=44.245.243.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="qMfc2rEn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1777519565; x=1809055565;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aBezZd7agyWR38Sjrg0pK67g+bbxDS/5NCgYDQZAEAo=;
  b=qMfc2rEnLzNS4ycuLUxNIHx5DPpPl7g0rMTLxCU2tlOlrMfZluqb+R27
   k9tWLtwAr26umd1JfUjv80L/DSghjC8bsyj9Kt/9VfubSFUXNnJQaxB4f
   XPNnrBGNcqb4B+ql9kbcjdKkj5X1LlspACsiLYb9RPuncjJAZnP3yJ4Pa
   o/Lug58Lnm5NjltWLsN0icU8vP4r55U0XbJ5Y2eZhKSKcpW2yJ1geIaDo
   D/oVSaXWwt9rMCl9Pf07x6dDl2iqu1eJe3ZSum6NG1iCOp23DNzGZFQOr
   UQlbqf6sc4HFxImUJY/QFQsjwKfAbWVdC5BqR1PF1bY3p3d7xwite4lFV
   w==;
X-CSE-ConnectionGUID: ql4vXkm4QMCbp7nRXFSA2A==
X-CSE-MsgGUID: fi7x+tbAQqa+wJY5n5EpHw==
X-IronPort-AV: E=Sophos;i="6.23,207,1770595200"; 
   d="scan'208";a="18049139"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-001.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 03:26:00 +0000
Received: from EX19MTAUWB001.ant.amazon.com [205.251.233.51:30886]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.20.153:2525] with esmtp (Farcaster)
 id 2cfa5e7e-ebd3-4c34-8ec9-b6e3992c3456; Thu, 30 Apr 2026 03:25:59 +0000 (UTC)
X-Farcaster-Flow-ID: 2cfa5e7e-ebd3-4c34-8ec9-b6e3992c3456
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Thu, 30 Apr 2026 03:25:59 +0000
Received: from dev-dsk-akiyano-1c-2138b29d.eu-west-1.amazon.com (172.19.83.6)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Thu, 30 Apr 2026 03:25:54 +0000
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
	<linux-kselftest@vger.kernel.org>, <shuah@kernel.org>,
	<vadim.fedorenko@linux.dev>
Subject: [PATCH v2 net-next 5/8] net: ena: PHC: Check return code before setting timestamp output
Date: Thu, 30 Apr 2026 03:25:02 +0000
Message-ID: <20260430032507.11586-6-akiyano@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260430032507.11586-1-akiyano@amazon.com>
References: <20260430032507.11586-1-akiyano@amazon.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D031UWC003.ant.amazon.com (10.13.139.252) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

ena_phc_gettimex64() is setting the output parameter regardless
of whether ena_com_phc_get_timestamp() succeeded or failed.

When ena_com_phc_get_timestamp() returns an error, the timestamp
parameter may contain uninitialized stack memory (e.g., when PHC is
disabled or in blocked state) or invalid hardware values. Passing
these to userspace via the PTP ioctl is both a security issue
(information leak) and a correctness bug.

Fix by checking the return code after releasing the lock and only
setting the output timestamp on success.

Fixes: e0ea34158ee8 ("net: ena: Add PHC support in the ENA driver")
Signed-off-by: Arthur Kiyanovski <akiyano@amazon.com>
---
 drivers/net/ethernet/amazon/ena/ena_phc.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/amazon/ena/ena_phc.c b/drivers/net/ethernet/amazon/ena/ena_phc.c
index 7867e89..c2a3ff1 100644
--- a/drivers/net/ethernet/amazon/ena/ena_phc.c
+++ b/drivers/net/ethernet/amazon/ena/ena_phc.c
@@ -46,9 +46,12 @@ static int ena_phc_gettimex64(struct ptp_clock_info *clock_info,
 
 	spin_unlock_irqrestore(&phc_info->lock, flags);
 
+	if (rc)
+		return rc;
+
 	*ts = ns_to_timespec64(timestamp_nsec);
 
-	return rc;
+	return 0;
 }
 
 static int ena_phc_settime64(struct ptp_clock_info *clock_info,
-- 
2.47.3

