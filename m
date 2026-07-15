Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A043A47DD7F;
	Wed, 15 Jul 2026 12:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784120124; cv=none; b=Ee/Mz6cnUr+cFhjfRbdyxPJg1Z4XwtgDMivKE8MTH4ZxZc2KidGm3+b9xNaor95BUoYbOZGx9hFj/F3r/WiR129F1Cdv1Uw3StHLFtRjy42gjBU/jq+tt5qBD/2I5IGhJ2vyuplsKRcHGvuYjhORyuHIqNj2ngVM9bMiwhDSx34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784120124; c=relaxed/simple;
	bh=IceKw2RyO8lhEJAXdeRQF+oq+EC4Y1cpc1+smre66Ek=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=fRHXXoWPMXYBzg2ELnuB8aXTyLi74n8bPfF2QDvCJ+k0rxJCswqpiSt4FLm0BqxrBmZ6QC9muBX6l+ZR5wJhFJYtIU/C4kPjhTRZKPnfZfJ3CbkURkVi8LO90VaemY8acChUop2VpPNOa1JKYtJjz8LbdpfikX+vbieXaHi+FL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=qKQ+Jhcx; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="qKQ+Jhcx"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id CE5C71A0FF4;
	Wed, 15 Jul 2026 12:55:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9FCF06035C;
	Wed, 15 Jul 2026 12:55:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6456B11BD15D9;
	Wed, 15 Jul 2026 14:55:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784120118; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=IceKw2RyO8lhEJAXdeRQF+oq+EC4Y1cpc1+smre66Ek=;
	b=qKQ+Jhcxz+NSWtDInntefSbu+3RlDnLesfeAPEInTmUy/+R4jC63RvyEnoQ+CKt1aICzZG
	3NvJmV9xA0Xa9coqHCrcl6OsiT1zZiMwddDZSYODB+4pCpMYiAWdZ+NpH3l8d9/MG3LBT/
	3fv0jOieWgxDYw5BFKqWvcvf4FxF0N+iKU/pf6FoL5gIAxn4yx6IeXMwIGZ9bvslQ5BXKh
	uG/bQSi4Xj9R8jAcIqJmWeVmfr+rM3Mz5LLXc/gwLVI9KGN68dd6dM5KJIju3iNmgjYswD
	M5snQoJeM8vhBhjwlApuo1mhMrzMXC883lc+263USQopFmXmwOi4BKgFPfefzg==
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
In-Reply-To: <alNN5qxBJ4EsB3Li@shikoro> (Wolfram Sang's message of "Sun, 12
	Jul 2026 10:18:46 +0200")
References: <20260710-schneider-v7-2-rc1-eip201-upstream-v2-0-b4680787377e@bootlin.com>
	<alNN5qxBJ4EsB3Li@shikoro>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 15 Jul 2026 14:55:14 +0200
Message-ID: <87ik6ge7kd.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hello Wolfram,

On 12/07/2026 at 10:18:46 +02, Wolfram Sang <wsa+renesas@sang-engineering.c=
om> wrote:

> Hi Miquel,
>
>> Then there has been a bigger series (including patches for other
>> subsystems) to show the big picture, but let's split again and focus on
>> one subsystem at a time:
>
> This is a good idea IMO. Sadly, for this series, I won't have time for
> review. If you have a branch available for testing, I could provide
> test-tags, though.

We are working on adding the two other crypto algorithms in. I believe
the crypto stuff is worth testing for you as it is the one showing proof
that all the drivers work on RZN1 hardware. When we send this out we
will include a link in the cover letter with a branch to test,
connecting the clock, irqchip an crypto changes together. Don't hesitate
to remind us for that testing branch if we forget to include it!

Thanks,
Miqu=C3=A8l
