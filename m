Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9245B3815DF;
	Wed, 15 Jul 2026 14:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784126616; cv=none; b=SJjS2M4eagjewBDUOES8qRJyJ2mZ6+JyXJFoz+5SFU6e/eh1/wcQg6Z0ShWJzh4CnsfudNPJ1Rinpvz3834KEIaqCwabdgFD1DKd5Pvlet5UB75/Faiz327PyfQKdofIP5bmHdNmo/UiYpQeIUGT0eqwLTiG72PnIn0hynDpMeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784126616; c=relaxed/simple;
	bh=cEKDHo/OZrzKx03VxEdPl4q31s7Fn2qq0x/9Vq/CJts=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=F68aKDequPDFm76NTS2nywx7F4WQR2GXCT+SWaQq8KWQ75L7bh/j7AFb5wDwVujotRkT0VOM9E6u7v2NV0Bh3tAeVnqs4ftvNmoT2/ddlAcdce5WU0EFp1h7q1sAQf3DmZDftfggFo1gSdc7/Qsnlsm7zqbU6bmkIB79DQYyuLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=jybkMy+B; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="jybkMy+B"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 65C0AC2B9D6;
	Wed, 15 Jul 2026 14:43:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 652516035C;
	Wed, 15 Jul 2026 14:43:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EE8DB11BD15D9;
	Wed, 15 Jul 2026 16:43:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784126611; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=cEKDHo/OZrzKx03VxEdPl4q31s7Fn2qq0x/9Vq/CJts=;
	b=jybkMy+ByVzzRCqbmx6z187kH33b00yiUqlfsKCt3c+WhaQpT4w48dlO7UlmdnESY8OsEh
	1ZBICUJXfaZMnoMrKERp3tYzDuvhYs5vB3db+pAu5IsY9OjVKStKyrKhGc8CClxSGjsubm
	7rg5oe8uOsXEm8hHeY3PHsDu19Ae1rs6uot2/Be9xkt+YQp8bDOZNNVfAJNv+Xu/xxgdRX
	/rSWWT2GkWGNQtb9VziO7y38UW6+dQtwQzob25xHXj4nYrmqEJsRGkhOw4LMhMCR4o1TSJ
	0ShD22aVrRAXJ1gyfzXexAQc+GPLvMwFb5hP9AFX4yVJB0hZRZxr968LT0Vo8Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Michael Turquette <mturquette@baylibre.com>,  Stephen Boyd
 <sboyd@kernel.org>,  Brian Masney <bmasney@redhat.com>,  Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
 Dooley <conor+dt@kernel.org>,  Brendan Higgins
 <brendan.higgins@linux.dev>,  David Gow <david@davidgow.net>,  Rae Moar
 <raemoar63@gmail.com>,  Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
  Pascal EBERHARD <pascal.eberhard@se.com>,  linux-clk@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-kselftest@vger.kernel.org,  kunit-dev@googlegroups.com,  Herve
 Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v2 0/7] clk: Add support for clock nexus
In-Reply-To: <aleSJafTTPe9Keas@shikoro> (Wolfram Sang's message of "Wed, 15
	Jul 2026 15:59:01 +0200")
References: <20260710-schneider-v7-2-rc1-eip201-upstream-v2-0-b4680787377e@bootlin.com>
	<alNN5qxBJ4EsB3Li@shikoro> <87ik6ge7kd.fsf@bootlin.com>
	<aleSJafTTPe9Keas@shikoro>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 15 Jul 2026 16:43:27 +0200
Message-ID: <87a4rse2k0.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

On 15/07/2026 at 15:59:01 +02, Wolfram Sang <wsa+renesas@sang-engineering.c=
om> wrote:

> Hi Miquel,
>
>> that all the drivers work on RZN1 hardware. When we send this out we
>> will include a link in the cover letter with a branch to test,
>> connecting the clock, irqchip an crypto changes together. Don't hesitate
>> to remind us for that testing branch if we forget to include it!
>
> Will surely do. Sounds awesome, thank you! Bonus points if you could
> also shorty summarize how you tested all the stuff then.

So far I just enabled all the crypto selftests (CONFIG_CRYPTO_SELFTESTS,
CONFIG_CRYPTO_SELFTESTS_FULL). Given the amount of errors I got during
my first iterations, it seemed pretty complete :-)

Thanks,
Miqu=C3=A8l
