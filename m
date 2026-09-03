Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D5634A78F;
	Thu,  3 Sep 2026 21:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788471908; cv=none; b=adVeT+HBfM0Nw093kpT/+hs4Ndq9WoWFbFQRI3GWqc21CLM0S3q2MrFDvUnBVNNGg6lDOzF/lWqeZ99ySsY6Yv2BE+H96MXUITNO6ZdZIOGFQSw+2RdfYN95W1uJGtLjYDtw2exmi1odP/9h/Kw/26GUQGeov4t57wVfOVssNGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788471908; c=relaxed/simple;
	bh=MmSK9HMeijf5NpQ56w4pw4FIoKKlGPxgZSitFHu/EKo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XzAP6FSwbpiPy0oPYwk7DtTDA2HQH3TgTWTYEW/iZFwfOzokjh7+NfZ4sqevDwRrxszSwSorEigiqvXJ78bJn24xbtpqGnRTnmMEVOWS9xwxelS/RSR9pVBAheXjarJBrbnHNKLdgLNTd9KUkGkfZVO0NPTJh5OAs8h5gr7X/ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=am/esE3X; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="am/esE3X"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9A0444E414F5;
	Thu,  3 Sep 2026 21:45:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5649A6054B;
	Thu,  3 Sep 2026 21:45:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0D39611C79F76;
	Thu,  3 Sep 2026 23:44:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788471897; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=h4i/kxfQCqCFT7ghPn0BH9jtsd+Es2/MJoFBQ5HsC5w=;
	b=am/esE3XmG0vhAjg7PKNzFjKHsbscNTzjL1QP2JzqtDjUvyGjIeNUlsJyOBMHU9jMsGLbQ
	sI0Z7TNiWeD7cwalyugQgHMPLdusBVuXM+Z2OdNWiTIEkLQsX7AjLlr6tfYtkL16oMj2gp
	rbvTKvF4P9H4v4YnOk1+W1n9YRRrnKVTgMMP5Wlez/ryGJjJi5wr6qn2r0hrfjESDLTXQT
	1pCsomRM2eILsq75RERywG5GiBVzUjCavz/QXMdNvLB2SnWwAH+5dvs8mOmahAjIpe5zeP
	F5TrLCSIAYmhyzg6x0NXb2mX4n4OdUq4D7NPHW6kYHFCZ+eKuOuhwdxI+kyjCQ==
Message-ID: <b2f7d07b-5c14-4767-9fbf-47a72a6c22cd@bootlin.com>
Date: Thu, 3 Sep 2026 23:44:51 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 0/2] selftests: drv-net: Allow cross-compiling
 the hardware tests
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Donald Hunter <donald.hunter@gmail.com>,
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
 matttbe@kernel.org, Stanislav Fomichev <sdf@fomichev.me>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com, linux-kselftest@vger.kernel.org
References: <20260903155524.2241065-1-maxime.chevallier@bootlin.com>
 <2a595cf6-d208-4a0a-a96f-738235236aa1@lunn.ch>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <2a595cf6-d208-4a0a-a96f-738235236aa1@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3


On 9/3/26 18:51, Andrew Lunn wrote:

> Nice. Did you give the liburing tests a quick smoke test?

I had to bump liburing on my BR setup, I managed to get it to run, but
it wasn't easy :/

I've started an effort to run the kselftests on my fleet of random devices,
trying various ways of interconnecting them with one another. This will be
needed for the ethtool tests.

I'm generating my rootfs with buildroot on all my boards, so I'm slowly getting
a list of options to enable for proper kselftest runs.

Focusing only on drivers/net/hw, all the kselftests that tests the local device
have no trouble running once you get the proper list dependencies installed.

(one example, some tests will grep through include/linux/ethtool.h, so you need
kernel headers on the rootfs)

I've already found some drivers bugs here and there with that, for example mvpp2
fails the RSS kselftests (wonder who wrote that...)

But then there's the kselftests that require a peer, and here it's another story.
Some tests, when using the SSH remote type, will scp a small binary on the peer
and use that binary for testing (sending specially crafted frames, etc.)

Just in the drivers/net/hw tests, we have :

drivers/net/hw/csum.py
drivers/net/hw/devmem_lib.py
drivers/net/hw/gro_hw.py
drivers/net/hw/iou-zcrx.py
drivers/net/hw/nk_qlease.py

Thing is, what I have is a mixed bag of arm, aarch64, a few riscv, x86 and even
ppc32 in there, so as you can guess, scp'ing an arm binary on a riscv peer doesn't
work as one expects... took me a while to figure this out :(

My setup is quite extreme but even for day to day development, I suspect most devs are
directly connecting their embedded board to their x86 host for testing.

We could expand the remote_ssh logic to probe the peer, and raise a skip if it's
a different arch than the dut. Or better, have the DUT check if the peer doesn't
already have the tool in question, i.e. the kselftest "package" is also installed
there.

> 
> I get the feeling not many Embedded people run the self tests, if
> basic things like cross compilation does not work, and native 32bit
> builds spits out 1000s of warnings.

Indeed... my idea for stmmac is to grab as many random stmmac boards as I can to get
a good sample of glue drivers + PHYs, and run the kselftest on them (hopefully one
day feeding that into NIPA).

I can already tell the simple kselftests run well when cross-compiled on arm, aarch64
and riscv but the interop issue needs resolving. Then it's a matter of adding a lot more
tests. Hopefully this will give enough experience on what's to solve so that
everyone else can do it as well...

Maxime


