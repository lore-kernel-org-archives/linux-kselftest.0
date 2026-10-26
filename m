Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=50.112.246.219
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793043439;
	b=W4yRNDZB8BT/+HmlYqqbMpcWv+YI0O2V1gBKWygDijpchA304EaE055WBf6276+eC35m
	 5XUqO3E32LfXCtrSpTVEWRYFKCS4n5RJ41fPccLzuOF+uPWcci2EIgPtEZVis9dB0kXu9
	 Z7K1YvsqhAvh02lLdCvBsnZfShCthNHe4pCISniR3kw+b/a229fdSM/eSC5aQngTf/j4g
	 d5Cv+dTuvvFCPUfieBzm+upbbcAcgFaocVv0CEK99/7ksHAx6xiVJowTxrFbj2Ep6jUYp
	 QJbss26xjuxpyYUsyNfWIuxQo3BV6LoZavcnypRmgwaU+oW3IeUZAYryQtHZKW7sdSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793043439;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=uH9+rYAAqPQiJuFrT+WBrpO1LgkYx3Jka6HX8hIzNrQ=;
	b=Mjjd1yGU/uKihYETFm3b+Jp6tvK7pfmYXWwQ1eMVzKR8+q5JsdTupeEmGkRMzVSsLujC
	 nkbnnFiWD5zHY6MEnw7t0/aucWZq7KKTUFF8LkqxRT1xVulTa0ZdTmqqVUbicSOsMwwmh
	 hLc7Rnc0VmrnyR0f/NmVEPY3EkEw/y3tXwAl5m2q2vMgcnBTqTQC7UGwmUKWdY9VY2SFb
	 47SKmlKwNqZPQkObtpu2OEBlOj0Y/ddTkgLpFWBluXr387a2zZvdp0doTSdzsHAbK/y3J
	 ATeJVTUY65BhuKl0DJqFF7a6FjkI4HSZlv34/W78ear45D2u2aDdoNinXGz6w9XyguQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	arc=none smtp.remote-ip=50.112.246.219
Received: from pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com [50.112.246.219])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E1F606A31A
	for <linux-kselftest@vger.kernel.org>; Mon, 26 Oct 2026 19:37:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62E1F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1793043434; x=1824579434;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uH9+rYAAqPQiJuFrT+WBrpO1LgkYx3Jka6HX8hIzNrQ=;
  b=l4O/Gp2XuxIHNvtoh8HI+X6GvZo+Z7kjLcfPBQXimZaB4rI0hj92eOHL
   M0TxdFX8rN08sruxmjkz4GxUJKJh9vB6F/8Lx93zmPh/V4l9h7t4KzI0j
   1xWDAAzfoTFr9By/vw7G0HCUkH+ToMaUvJc7RSAW1Um9G7hzjPDIkrU6i
   04O0S+OX7hSzzPCJW2H9W60F1mxx8jY7ph/b1nQztAJCjjN6+wAlPrrPm
   s0aIxwmVG9mGdTMsgmnBo6xY3IfiD42xY983EVyC6l//pavSke7IDLzhb
   2jsye2BYl+b/QJkT2Kf/gigxljgS509UHGtTy9bn7fu01jSMyuwpgwYYT
   A==;
X-CSE-ConnectionGUID: cB3i5KkzQZG0C4euPCX6gg==
X-CSE-MsgGUID: qVbeLyasTsCSskDFEJPeJg==
X-IronPort-AV: E=Sophos;i="6.27,180,1787011200"; 
   d="scan'208";a="32065322"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 19:37:13 +0000
Received: from EX19MTAUWC002.ant.amazon.com [205.251.233.111:25760]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.12.188:2525] with esmtp (Farcaster)
 id 0cd77dc4-7152-42ca-8b01-ed50c7578bcf; Mon, 26 Oct 2026 19:37:13 +0000 (UTC)
X-Farcaster-Flow-ID: 0cd77dc4-7152-42ca-8b01-ed50c7578bcf
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Mon, 26 Oct 2026 19:37:13 +0000
Received: from dev-dsk-jamz-1e-e35f4cd9.us-east-1.amazon.com (10.189.35.140)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Mon, 26 Oct 2026 19:37:11 +0000
From: Jimmy Zuber <jamz@amazon.com>
To: Bernd Schubert <bernd@bsbernd.com>
CC: Miklos Szeredi <miklos@szeredi.hu>, <fuse-devel@lists.linux.dev>,
	<linux-kselftest@vger.kernel.org>, Shuah Khan <shuah@kernel.org>, Jim Harris
	<jiharris@nvidia.com>, Horst Birthelmer <horst@birthelmer.de>, Luis Henriques
	<luis@igalia.com>, NeilBrown <neil@brown.name>
Subject: Re: [PATCH v2 0/3] fuse: atomic open
Date: Mon, 26 Oct 2026 19:36:57 +0000
Message-ID: <20261026193657.2715998-1-jamz@amazon.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <1c71c9a2-e3dd-4edc-a467-36b389b02d92@bsbernd.com>
References: <20261026151828.562870-1-jamz@amazon.com> <1c71c9a2-e3dd-4edc-a467-36b389b02d92@bsbernd.com>
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
X-ClientProxiedBy: EX19D031UWA004.ant.amazon.com (10.13.139.19) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

On 10/26/26 17:04, Bernd Schubert wrote:
> Hi Jimmy, I will try to review today or tomorrow. Did you see the
> Sashiko reports?

Thank you for the pointer to Sashiko - I've addressed its feedback in v3:

https://lore.kernel.org/fuse-devel/20261026190747.2373775-1-jamz@amazon.com/
