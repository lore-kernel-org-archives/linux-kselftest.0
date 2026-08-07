Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A5C47A86A;
	Fri,  7 Aug 2026 13:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786108147; cv=none; b=OTlaju51+DK6iFMoRP9iPQXdVKY0Xw5CEUBkY1Z6EqnmizWx1eBuw9fDGh/utc4TPXnjkX6Rmh0zdO849uc/S89R7TnQqvl1nxZ4n3vKrXvn0oiTPKFSwLoNHxLyNCLSz01xAs5KMuQZ9KU/IOK2Jh3bv2DLRRGYB1+CLfbuw1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786108147; c=relaxed/simple;
	bh=39hw1uijqgPI4iLf860OBuF/9OOCXl9Ic1r1bXtE7Xw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=QDQmx/0owwljARz89FTFkBR+0W9K6DUJySpjqF1/GpwDKo9/UMZ9+0um+4FBBlxCva6+N5OKG4cEZnDiad8X4EYvaIijjB5lUndzrLUnGEuhHIdIZJKH6ajK39hbDKTT3ywdxfarl9UQOyaD2DXSsAs4R6h8tFrVehqA+MkOcfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=nPXZYl+5; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="nPXZYl+5"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2E9371A14A9;
	Fri,  7 Aug 2026 13:08:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F3BDC603F0;
	Fri,  7 Aug 2026 13:08:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C4AA211C37825;
	Fri,  7 Aug 2026 15:08:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786108129; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=39hw1uijqgPI4iLf860OBuF/9OOCXl9Ic1r1bXtE7Xw=;
	b=nPXZYl+5HZV5UcLXy4QIts2W1wa96utv77R3CodIWlB4tyq1xkaIZAkBRv08R2Nt/6K+qI
	KQOrQqPR+iHsCFR7rFlQE8s3LN154WcZWGUKaObFazOhVmafhOWh266TEmfUdY3hYdrg3n
	JOeaaDBQ+L9zxNzV9SFCjseRXLROHEMC6TTf7vgvnhIkWf0/fISVcw6pDXn4JNukcKn+dR
	tv+TYtGW/rZJNgutGRLzYjCzel1XwpSIU/1FtGIVEeFDxqakehbB6O/zfGr9nZqQGfm5Il
	gEKYk9BnsROXHIrYLcpb3+aarh7HzNvpz/mjZgWV8elPJzOFM0BNb2QJCTnaAg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Michael Turquette <mturquette@baylibre.com>,  Stephen Boyd
 <sboyd@kernel.org>,  Brian Masney <bmasney@redhat.com>,  Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
 Dooley <conor+dt@kernel.org>,  Brendan Higgins
 <brendan.higgins@linux.dev>,  David Gow <david@davidgow.net>,  Rae Moar
 <raemoar63@gmail.com>,  Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
  Pascal EBERHARD <pascal.eberhard@se.com>,  Wolfram Sang
 <wsa+renesas@sang-engineering.com>,  linux-clk@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-kselftest@vger.kernel.org,  kunit-dev@googlegroups.com
Subject: Re: [PATCH v4 5/7] clk: Use the generic OF phandle parsing in only
 one place
In-Reply-To: <amOwe6kq9T1Q5FBL@lizhi-Precision-Tower-5810> (Frank Li's message
	of "Fri, 24 Jul 2026 14:35:39 -0400")
References: <20260717-schneider-v7-2-rc1-eip201-upstream-v4-0-751547e160e5@bootlin.com>
	<20260717-schneider-v7-2-rc1-eip201-upstream-v4-5-751547e160e5@bootlin.com>
	<amOwe6kq9T1Q5FBL@lizhi-Precision-Tower-5810>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Fri, 07 Aug 2026 15:08:45 +0200
Message-ID: <87bjbecc2q.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

On 24/07/2026 at 14:35:39 -04, Frank Li <Frank.li@oss.nxp.com> wrote:

> On Fri, Jul 17, 2026 at 05:59:21PM +0200, Miquel Raynal (Schneider Electr=
ic) wrote:
>> There should be one single entry in the OF world, so that the way we
>> parse the DT is always the same. make sure this is the case by avoid
>> calling of_parse_phandle_with_args() from of_clk_get_parent_name(). This
>> is even more relevant as we currently fail to parse clock-ranges. As a
>> result, it seems to be safer to directly call of_parse_clkspec() there,
>> but doing so implies that we do not try the "clock-ranges" path if we
>> already found a "clocks" property..
>
> Sorry, I can't understand well what commit said.

I tried to reorder the commit sentences, hopefully it will make the text
easier to read.

Thanks,
Miqu=C3=A8l
