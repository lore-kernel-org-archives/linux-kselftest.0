Received: from pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com [50.112.246.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51793DC4A8;
	Fri, 17 Jul 2026 07:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=50.112.246.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784272752; cv=none; b=r++Smj83DH5e2C1vhUv+n4IPg4a7xLPTNBOj/lxy5lYnpCY+KcFCP+G+rHUeDDD2ehPiF45z+O3YAxPfWG6oBBy5BDGyn+aELkqatQnHguA1qS+XPq7iGcaDRcXGXs8q+9y8AbOVqZEH7Uh+ttbUTUso3AjyKmgJr768oWjyTKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784272752; c=relaxed/simple;
	bh=us31fa9kzIZcQX8xpSgM1UcHN5qnpzqY5cxwqb3sWYI=;
	h=MIME-Version:Content-Type:Subject:From:To:CC:In-Reply-To:
	 References:Date:Message-ID; b=tT9WEggPE7Pq8hEZk3yO4sfI3m20EHXW5njY/vvxxhydF+/6Mdhf/UGcL+E0+vxZsBqSEzFiO0jA1d8virqemCNmGXtrDXWswQYEjbG7hllYFZ8nb44PkMZ1ZDPbfcGhCXTYkReocZ3HkQfgb9Oekw7aTsPTr2FFrbZBAt+4pno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=X1HUA0WI; arc=none smtp.client-ip=50.112.246.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="X1HUA0WI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1784272751; x=1815808751;
  h=mime-version:content-transfer-encoding:subject:from:to:
   cc:in-reply-to:references:date:message-id;
  bh=xQWjXm6HUL+I0zaTCH7PGlqlxH15ReHt/GEWSFNRymQ=;
  b=X1HUA0WIIcVLSrBJ1z53ciB0PCKJplBGMSTYH7a8E2UaL7j6mYb87n1L
   e9yTXIy9Zh0MpqcCvXhfxX5RrQe2HLSjou6zBW51spGY2MZ8x+IbnP2Jd
   xh0xzc0MrD5sr/U+XCgpaBlQ84d9SA4OuDMQQ2CRrv2309axpXEP08qRk
   I3q1Uuvikitc4H1ElhhTxq4TnX2fvhH1uVkQHlgNzhhqdoQZo4J8j4lZ7
   aXL/cA20JX+ddW7vy3VKWgXsuX6MToOq9HGqonnjY+ChKvP2Go+sy1hPQ
   M/3VUq7PnD7OAMIfkfrwFFAfY1LZqokYRIVVzqNnEhKEH44ttlN3Vqx8p
   A==;
X-CSE-ConnectionGUID: VQHsZWImQKKgtpK3dnDFBQ==
X-CSE-MsgGUID: KUhCYNB8SsGFD5bj0xOsxg==
X-IronPort-AV: E=Sophos;i="6.25,168,1779148800"; 
   d="scan'208";a="23648299"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 07:19:09 +0000
Received: from EX19MTAUWC002.ant.amazon.com [205.251.233.51:26854]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.29.147:2525] with esmtp (Farcaster)
 id 24c6662d-fa07-475d-9a5d-bdb1a9768d7d; Fri, 17 Jul 2026 07:19:08 +0000 (UTC)
X-Farcaster-Flow-ID: 24c6662d-fa07-475d-9a5d-bdb1a9768d7d
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.43;
 Fri, 17 Jul 2026 07:19:08 +0000
Received: from dev-dsk-akiyano-1c-2138b29d.eu-west-1.amazon.com (172.19.83.6)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.43;
 Fri, 17 Jul 2026 07:19:02 +0000
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4 net-next 1/7] ptp: Add ioctls for PHC timestamps
 with quality attributes
From: Arthur Kiyanovski <akiyano@amazon.com>
To: saeed bishara <saeed.bishara.os@gmail.com>
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
In-Reply-To: <CAHfVqdWBsBMqerM7mq3U0fMKhCSMUd3nbNFi1vgFehRivG5B0w@mail.gmail.com>
References: <20260714020340.25014-1-akiyano@amazon.com>
 <20260714020340.25014-2-akiyano@amazon.com>
 <CAHfVqdWBsBMqerM7mq3U0fMKhCSMUd3nbNFi1vgFehRivG5B0w@mail.gmail.com>
Date: Fri, 17 Jul 2026 07:18:54 +0000
Message-ID: <178427273498.16508.8669013141517009007.b4-reply@b4>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: EX19D036UWC002.ant.amazon.com (10.13.139.242) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

On 2026-07-16 14:22:19+03:00, saeed bishara wrote:
> On Tue, Jul 14, 2026 at 5:06 AM Arthur Kiyanovski <akiyano@amazon.com> wrote:
> 
> > +       n_samples = data->request.num_samples;
> > +       sts.clockid = data->request.clock_id;
> > +       kfree(data);
> > +       data = kzalloc(struct_size(data, timestamps, n_samples), GFP_KERNEL);
> > +       if (!data)
> > +               return -ENOMEM;
> 
> any idea why you free then allocate back?
> 
> > --- a/include/linux/ptp_clock_kernel.h
> > +++ b/include/linux/ptp_clock_kernel.h
> > @@ -123,11 +123,34 @@ struct ptp_system_timestamp {
> >   *               reading the lowest bits of the PHC timestamp and the second
> >   *               reading immediately follows that.
> >   *
> > + * @gettimexattrs64:  Reads the current time from the hardware clock and
> > + *                    optionally also the system clock with additional clock
> > + *                    attributes.
> > + *                    parameter ts: Holds the PHC timestamp.
> > + *                    parameter sts: If not NULL, it holds a pair of
> > + *                    timestamps from the system clock. The first reading is
> > + *                    made right before reading the lowest bits of the PHC
> > + *                    timestamp and the second reading immediately follows that.
> 
> The descriptions for ts and sts here are identical to gettimex64.
> Instead of duplicating this text, could we just refer back to the
> gettimex64 documentation?

Thanks. Both addressed in v5: ptp_sys_offset_{extended,precise}_attrs()
now copy the request header onto the stack and allocate the result
buffer once (no free + re-alloc), and the gettimexattrs64 /
getcrosststampattrs kernel-doc now references the base callbacks
instead of duplicating the text.

