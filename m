Received: from pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.246.77.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E242F691D;
	Fri, 17 Jul 2026 07:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.246.77.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784272804; cv=none; b=VZYzbaeHx2Eg3YBE5p61rMpqt05IQlpGhw7V1Wnows3VvnriYctcN5rOksAONoUsVD6KvRkbPSYTgE+fQ7+1GmkFzpDX4qm/qEx8Q//nS85IsFr9By2LN91SjScmRJkIFxZjd6k6ZBVXu79H0lZK34oeFVp8BbZdnGodx8WjtAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784272804; c=relaxed/simple;
	bh=8tMHlyclkPxrhMQ9+GZuZXmDtnNO+wm9sBzXkVfHOPA=;
	h=MIME-Version:Content-Type:Subject:From:To:CC:In-Reply-To:
	 References:Date:Message-ID; b=mY1DnPNy2dDzWVS7kFi0/B/+FmERmCSjiM5LPEPK6JqxZQKougLJV62XiPGah8/niT1IAX3v4gkQc3qIEFwlfKHintlm2EWnbp42JSYJXTV4TKQYpy63wMCEb3bV+rudZLzDiEk3YvhKScPhTGA2KCSJrX3p2dv5fxXc+zbB51A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=TBEQ2sqZ; arc=none smtp.client-ip=44.246.77.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="TBEQ2sqZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1784272803; x=1815808803;
  h=mime-version:content-transfer-encoding:subject:from:to:
   cc:in-reply-to:references:date:message-id;
  bh=bqr55JcFu28BTavVVMxLU13ZCCnEIkUTU5cyOI4qprU=;
  b=TBEQ2sqZAJ5BFOlsKgiEeBIoeChdQOxiby9eFzWkq4u619JCkBRfWd01
   fHFgwg+cMkFxo+5wrFYLb+W4Q0GmTkvqhqX1mUC+Y5+jVz13jliebm7dU
   k7PiuoQD4VhNsnjXQNuP79rVIba3pxn3CUhm52qwxD6RmUGmyCPvXGI6W
   WLGakC/SDn1i9NF4zhXtvL/1ssRGwptT/0ZmNLzvLaUcnK4s8v2/ybi/y
   ve5o6nnshcqh9JqjWTf8/dMJ32erjl+yauRI1NnU1TQ7fCgg1eCQTpy63
   vkg1/ozuKgDI+013rwxSSHCt10Y6jk8oGmXjYWne1sopkqlbp4RYXUs2t
   A==;
X-CSE-ConnectionGUID: JzDjqbiiQWagW1yI0pPPuA==
X-CSE-MsgGUID: 7OTmLb4gTAGcMkeckQ0UNQ==
X-IronPort-AV: E=Sophos;i="6.25,168,1779148800"; 
   d="scan'208";a="23840607"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 07:20:03 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.48:30566]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.19.34:2525] with esmtp (Farcaster)
 id 440646e9-6d03-47d5-9ba6-4d2bb79699a7; Fri, 17 Jul 2026 07:20:02 +0000 (UTC)
X-Farcaster-Flow-ID: 440646e9-6d03-47d5-9ba6-4d2bb79699a7
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.43;
 Fri, 17 Jul 2026 07:20:02 +0000
Received: from dev-dsk-akiyano-1c-2138b29d.eu-west-1.amazon.com (172.19.83.6)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.43;
 Fri, 17 Jul 2026 07:19:56 +0000
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 net-next 2/7] selftests/ptp: Extract
 print_system_timestamp helper in testptp
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
In-Reply-To: <CAHfVqdWNk0QmvZBXi21eUKcU34DpXXZBNyJVUep+Tx1n52ihAg@mail.gmail.com>
References: <20260714020340.25014-1-akiyano@amazon.com>
 <20260714020340.25014-3-akiyano@amazon.com>
 <CAHfVqdWNk0QmvZBXi21eUKcU34DpXXZBNyJVUep+Tx1n52ihAg@mail.gmail.com>
Date: Fri, 17 Jul 2026 07:19:49 +0000
Message-ID: <178427278953.16508.13801216797525123004.b4-reply@b4>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: EX19D039UWB002.ant.amazon.com (10.13.138.79) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

On 2026-07-16 14:34:57+03:00, saeed bishara wrote:
> > +static void print_system_timestamp(int sample_num, __kernel_clockid_t clockid,
> > +                                  long long sec, unsigned int nsec,
> > +                                  const char *when)
> > +{
> > +       switch (clockid) {
> > +       case CLOCK_REALTIME:
> > +               printf("sample #%2d: real time %s: %lld.%09u\n",
> > +                      sample_num, when, sec, nsec);
> > +               break;
> > +       case CLOCK_MONOTONIC:
> > +               printf("sample #%2d: monotonic time %s: %lld.%09u\n",
> > +                      sample_num, when, sec, nsec);
> > +               break;
> > +       case CLOCK_MONOTONIC_RAW:
> > +               printf("sample #%2d: monotonic-raw time %s: %lld.%09u\n",
> > +                      sample_num, when, sec, nsec);
> > +               break;
> 
> These three printfs are also kind of duplicated, I think mapping the
> clockid to name first would save a few lines.

Done in v5 - map the clockid to a name and print once.

