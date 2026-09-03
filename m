Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54B8412C0F;
	Thu,  3 Sep 2026 09:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788429348; cv=none; b=GGCtZ/cgbJ/ws5rYEoJGoinKHPyNYc63jzkNtYbZlr9cO1e/GrKKpIjszKqOcqfd/TXfaMoGngynsZ3f9CZgUGu939Kn6IzMhTqEtomzoZjk4phIovExNXgezD2hUWcL5X5hvTZSVrF668pi2qWK4excnvdXwoYHqdDg+vK+Fpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788429348; c=relaxed/simple;
	bh=j9ZyPbTzdCCAtLbjlBJ15/oK5M+alDjmIbbTPwPleRc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=H22dDYuTdC3XG0nJMyMpQ34Lvv92puMls6wHc3nwo4PyYlWjuUxOF1WgIZEHEFC2e8V1tGO6esSj6q+bx+1qvNnNQMrKpeVko2Q7qiFVBfzxeMMcsx/eOOQWeeRS9dJFRe7xwYq5HVkEDkvZADecarUVZCwvQkebarZFCQ39yG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=wtWuKLHy; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="wtWuKLHy"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 599421A1975;
	Thu,  3 Sep 2026 09:55:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2B838602B8;
	Thu,  3 Sep 2026 09:55:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5875811C7817C;
	Thu,  3 Sep 2026 11:55:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788429344; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=j9ZyPbTzdCCAtLbjlBJ15/oK5M+alDjmIbbTPwPleRc=;
	b=wtWuKLHycFEkoRO1XLLppdIYBUfdCGyfY4ZaHVxXhwlqpUKyoZzOkJW3j8lCoI+uGfHnx2
	DOoc+DvHiVGVXTBtlrqmkznq3gV9MlPFuXwnXJ6OoF5EaMFEi/Q0ZHY4ReJqsvstYu9Ppo
	7cT8SiQTOKqWA92rqyYoruyIusgPyoV2p3/ScFrob0FeFLpQluN6uKfIteg5V9IMi1bAck
	IDvy9ScXJE+VxyPtmH1XppKnG2TxPK7b6wqoVNcRs0rtsy4BUgWAnxhv0QTlI9jyR86hpV
	jjMLBu0Iq/EFb9/gXRoG4yaUAP5GD2RismOrSFBq9fRmVOty4BLd3zDNQf+R4w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>,  Brian Masney <bmasney@redhat.com>,
  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>,  Brendan Higgins
 <brendan.higgins@linux.dev>,  David Gow <david@davidgow.net>,  Rae Moar
 <raemoar63@gmail.com>,  Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
  Pascal EBERHARD <pascal.eberhard@se.com>,  Wolfram Sang
 <wsa+renesas@sang-engineering.com>,  Fran Li <Frank.li@oss.nxp.com>,
  linux-clk@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-kselftest@vger.kernel.org,
  kunit-dev@googlegroups.com,  Frank Li <Frank.Li@nxp.com>,  Herve Codina
 <herve.codina@bootlin.com>
Subject: Re: [PATCH v5 0/7] clk: Add support for clock nexus
In-Reply-To: <20260807-schneider-v7-2-rc1-eip201-upstream-v5-0-8785f9531cf0@bootlin.com>
	(Miquel Raynal's message of "Fri, 07 Aug 2026 17:24:01 +0200")
References: <20260807-schneider-v7-2-rc1-eip201-upstream-v5-0-8785f9531cf0@bootlin.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 03 Sep 2026 11:55:38 +0200
Message-ID: <878q5i64md.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hello,

On 07/08/2026 at 17:24:01 +02, "Miquel Raynal (Schneider Electric)" <miquel=
.raynal@bootlin.com> wrote:

> Adding support for clock nexus had some prerequisites requested by
> Stephen, such as adding new selftests, the initial discussions come
> from:
>
> Link: https://lore.kernel.org/linux-clk/20260129201003.288605-1-miquel.ra=
ynal@bootlin.com/

I know Stephen had less availability to dedicate to clock matters
recently and Brian offered to help. Brian already made feedback on it
(thank you very much!), so in case there is no more debate, I hope it
will be a good candidate for early adoption since -rc1 is now out! For
the record, I already answered (several times) the various points
Sashiko raised.

Thanks,
Miqu=C3=A8l
