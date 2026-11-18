Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=52.35.192.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795013091;
	b=026bXoTS1Pc8AT9U8WiR2Mk/M/i4vVsMM72sYn9tR2nnOPcG/EZGOo8bxC9xSnVwyMLW
	 c5e/iydijS6HvDq13NjQyhNur/eq+LQLGt6S467aFU2Vm0pPElaFuVuJelr6o2LHV+1/Q
	 pBdZP2s8j1lgt3/cWBCq4Tq/xN6i2EOEhVEaKLsa2w4UXGSLsviTil5rV+LTW1p1tsk2i
	 W98n9iwbHqLfwNHDyAuq3+yJ+rPLMM/Mv5vVyJfdTZKK7d/qp2T2JQeJ4OAhOb4DIFLha
	 okgZbhJtOC3+bG7laZCBv2KtJ6x9ZB4xuLP/ewN9FCwvkCuRqh0m0XU6Q+bYjitpX3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795013091;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=FYdFDt3RQcZLgWMSe+61R6Sn4+qOe7+WPCHCjIeH/40=;
	b=X/vGdirnrs4E0b/JDDDnJot98xQUyl/JwMDvdsGilhQ7OZsUbtBmPPBIw3cSy3DMeagT
	 JotLJLNsEZT9FDmLgKERtf8oT6HgCOYGmu3Nynih29QYAfKHDYqcbYsf4ALac+mOxKMH5
	 84acXhDayqG+XKW+eZCn4R3kNX9/KC5VCPcrY0+meKhTVPrGKcEm3lfCqqHZ/YgXcPOh6
	 qG8aw86aYZdTbCo3NMM/t3BBQ6Gov04DAdmvCxRBFW95jSqyIfIHZKJ5uYrf94kot06R1
	 BjsWrUhqs/3XUjDWYNWNszsITTWMFapTn1ZEFM/8MhzywlYugRFUzlEvjBtP6lQNjlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=GehFDff7;
	arc=none smtp.remote-ip=52.35.192.45
Received: from pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.35.192.45])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6C0606A320
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 14:44:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE6C0606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=GehFDff7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1795013090; x=1826549090;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FYdFDt3RQcZLgWMSe+61R6Sn4+qOe7+WPCHCjIeH/40=;
  b=GehFDff7vxTJ6w99MTgGhcANgmdCF9R5FYyGZjNuHFXBmooPeiyxgx1s
   uLQ1+j7m8+Teg1jKvg8bvi7yds3I30TjDKTDmyJO2sV8JViivE67K+WWr
   IV4OStVIW8z+a4YJpl0G+Fk5ksdRptEwcT0is29vHPFix4MsWzcLQB74K
   2lc7wrV5XuR/oyR/8mnNWH9OjYEG6zvI/lpWTNHS4qvqDGAwXxJ2eZxmI
   F7i7ydeQUDRORh3fORjqKNKYU1T6dOXOC2psPLQE0MuZ3lTQgOZLAyRPo
   KL3UR5KV0g2Kqjv87UzpC3oq1MSftgnGJiQG41v0Npo1OehWeH4/WJWNy
   A==;
X-CSE-ConnectionGUID: YV+djZ4HQpOJ//ModV9smA==
X-CSE-MsgGUID: qgS2HDyeQ8GBOGDBhasHKA==
X-IronPort-AV: E=Sophos;i="6.27,219,1787011200"; 
   d="scan'208";a="34194039"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 14:44:50 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.53:25942]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.55.227:2525] with esmtp (Farcaster)
 id bbd993d7-ec4f-43cf-bd8f-d5b693ffc5aa; Wed, 18 Nov 2026 14:44:50 +0000 (UTC)
X-Farcaster-Flow-ID: bbd993d7-ec4f-43cf-bd8f-d5b693ffc5aa
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Wed, 18 Nov 2026 14:44:50 +0000
Received: from dev-dsk-jamz-1e-e35f4cd9.us-east-1.amazon.com (10.189.35.140)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Wed, 18 Nov 2026 14:44:49 +0000
From: Jimmy Zuber <jamz@amazon.com>
To: NeilBrown <neil@brown.name>
CC: Miklos Szeredi <miklos@szeredi.hu>, <fuse-devel@lists.linux.dev>,
	<linux-kselftest@vger.kernel.org>, Shuah Khan <shuah@kernel.org>, "Bernd
 Schubert" <bernd@bsbernd.com>, Jim Harris <jiharris@nvidia.com>, "Horst
 Birthelmer" <horst@birthelmer.de>, Luis Henriques <luis@igalia.com>
Subject: Re: [PATCH v6 1/2] fuse: add FUSE_OPEN_ATOMIC
Date: Wed, 18 Nov 2026 14:44:37 +0000
Message-ID: <20261118144437.2485284-1-jamz@amazon.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <179340054030.269288.17605002354655480101@noble.neil.brown.name>
References: <179340054030.269288.17605002354655480101@noble.neil.brown.name>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D031UWC004.ant.amazon.com (10.13.139.246) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

On Sat, 31 Oct 2026, NeilBrown wrote:
> Thanks for clarifying.  My only problem with the patch was that I found
> the description confusing - everything looks OK from a VFS perspective.

Thanks Neil. I reworded the description in v8 based on your feedback:
https://lore.kernel.org/fuse-devel/20261110204421.1251726-1-jamz@amazon.com/

If you have time, I'd appreciate another look.

Thanks,
Jimmy
