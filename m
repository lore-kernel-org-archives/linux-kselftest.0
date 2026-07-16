Received: from pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.246.77.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263093CB8FD;
	Thu, 16 Jul 2026 08:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.246.77.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784189500; cv=none; b=RIWaTXyO+EIPiCqAFSymFKGlySNrXlDsBMkbsmLPeJId5vXvTFJRo0k6rIgqhrK81IXfJifj20dg/nulSulCvfW7pha0/vOz+8gR+/I8KH9MGodagiydH0kdNdlZGchYknPMhNss/SsUOvJuEQywTf6Vv4f8nag/v8rQ6hH7Kvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784189500; c=relaxed/simple;
	bh=IE77UJrcpBkry0RhfoiWTmuOVkZ7jTu3HkVhVqjjlm8=;
	h=MIME-Version:Content-Type:Subject:From:To:CC:In-Reply-To:
	 References:Date:Message-ID; b=KVn/edOq3rnJOuqege857GXUS7tacKEo+uj0ge/Pofh/bCbqaqA1XR3AXC/NRu/6U7v2S1COfZqvY6NGrD2AVdk6/nLX6S5QyX+dF+TFh5pkJ4eBNLoRCvL/EU9IhDZiIRQnyWWxNnvVfFs0wPReve89X7N3SYLkBo6Eg0dwx6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=Hcj1LbgJ; arc=none smtp.client-ip=44.246.77.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="Hcj1LbgJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1784189498; x=1815725498;
  h=mime-version:content-transfer-encoding:subject:from:to:
   cc:in-reply-to:references:date:message-id;
  bh=bDKJjLJYXnlgsnuc427azuwIUpNGhYAvUUmBe09AZWo=;
  b=Hcj1LbgJDvofk119sK4fKFx/RUHdVWOMeGL+nJQZKmOmSc8bEE4uQUyy
   C7pAvCU58wChvxfZ59PuD4JDgsiTK2Jty1OwoU1Wu0hrmiDZTCvaZnYj3
   dDWKAmSk3sMsNwHJb/sbhMMejfnhNfoum2PUOelqAEZCFTZ+CVy3sPWMt
   qZ6WUHnMDlS1C22WZ9LCywEE6kEAU0OQRGo2JNsE70o3GOaLMgQWG/Jgh
   DIZZUjG934o7F28ZDrbF7ExNc+EjwzZt2PWQgr6HJbS6fGY88sicLHFCe
   sA7GHXxAe/D0JkM3v2qx4e5dla7BrtMpJ0jsMgXXsEpuBSXnz5tP1aDIq
   Q==;
X-CSE-ConnectionGUID: pgg0oze0TECPeICmhM0Zlw==
X-CSE-MsgGUID: NqNxeN2dQYCWauVoOgDI2A==
X-IronPort-AV: E=Sophos;i="6.25,167,1779148800"; 
   d="scan'208";a="23768689"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 08:11:34 +0000
Received: from EX19MTAUWB001.ant.amazon.com [205.251.233.104:15529]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.58.199:2525] with esmtp (Farcaster)
 id 76e9badf-93cf-4bb5-bb27-9adfc5cd31a0; Thu, 16 Jul 2026 08:11:33 +0000 (UTC)
X-Farcaster-Flow-ID: 76e9badf-93cf-4bb5-bb27-9adfc5cd31a0
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.43;
 Thu, 16 Jul 2026 08:11:33 +0000
Received: from dev-dsk-akiyano-1c-2138b29d.eu-west-1.amazon.com (172.19.83.6)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.43;
 Thu, 16 Jul 2026 08:11:27 +0000
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4 net-next 7/7] net: ena: Implement gettimexattrs64
 callback for PTP attributes
From: Arthur Kiyanovski <akiyano@amazon.com>
To: Jacob Keller <jacob.e.keller@intel.com>
CC: Arthur Kiyanovski <akiyano@amazon.com>, David Miller
	<davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
	<netdev@vger.kernel.org>, Richard Cochran <richardcochran@gmail.com>, "Eric
 Dumazet" <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, "David
 Woodhouse" <dwmw2@infradead.org>, Thomas Gleixner <tglx@linutronix.de>,
	Miroslav Lichvar <mlichvar@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
	Wen Gu <guwen@linux.alibaba.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	David Woodhouse <dwmw@amazon.com>, Yonatan Sarna <ysarna@amazon.com>, "Zorik
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
	<horms@kernel.org>, <vadim.fedorenko@linux.dev>
In-Reply-To: <f8974bb1-e27d-480c-8f88-6aea3ef41ad8@intel.com>
References: <20260714020340.25014-1-akiyano@amazon.com>
 <20260714020340.25014-8-akiyano@amazon.com>
 <f8974bb1-e27d-480c-8f88-6aea3ef41ad8@intel.com>
Date: Thu, 16 Jul 2026 08:11:15 +0000
Message-ID: <178418947570.25423.8298339939975321346.b4-reply@b4>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: EX19D033UWC004.ant.amazon.com (10.13.139.225) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

On 2026-07-14 17:47:35-07:00, Jacob Keller wrote:
> On 7/13/2026 7:03 PM, Arthur Kiyanovski wrote:
> 
> > Implement the gettimexattrs64 callback in the ENA driver to support
> > the PTP_SYS_OFFSET_EXTENDED_ATTRS ioctl.
> > 
> > This enables applications to retrieve PHC timestamps with quality
> > attributes through the standard PTP ioctl interface.
> > 
> > The ENA device currently reports only error_bound (valid bit set).
> > Other attributes are not reported (valid bits unset).
> 
> Typically it would be a policy not to introduce new attributes which are
> not yet used, and add the other attributes once a user appears. However,
> I think it makes sense to have the full set of desired attributes
> especially given the ioctl interface limitations which would otherwise
> require a lot of reserved space or new ioctl numbers. Especially given
> the uAPI here has been discussed and changed heavily from previous patch
> iterations.

Thanks — that matches the reasoning. We defined the full
attribute set up front because of the ioctl interface
constraints you describe. The valid bitmask ensures that
userspace only consumes attributes that a driver explicitly
reports, while still allowing additional attributes to
become available in future drivers without further UAPI
changes.

