Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9B43FCB2F;
	Fri,  7 Aug 2026 12:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786105424; cv=none; b=ifTIGqHSo5dLdw5tdRqshSM9nC6452mdU9fwhVYOeoPqeoxyzkGeDiwyAgy5XpTypkliaJf7zylKJHKinY5D+aQWkKGGQt8ThWbQMT+iLzHA8kee7GRxrU6wkWT0PfJpmPIQtjUmWZC1EjNdgsaO/8+lJnYkmRKWbhYfI604iN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786105424; c=relaxed/simple;
	bh=3Hr6geQeS4BGm2BFtUPiifoXsD3qIfH6VfM3FfyReOw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=keW2fn3BgxWIw+Re2YpuWTQ8oP0O0vaVD2rMTqj/zQ2/BGOt9Egl13sseGon//IgnRrqgocN8cuk/mdXjWsZrvV+IicDBxncH7hTjt0pPkFaZfuIGRDi/trWGhlNC7kQgCfonmLPNo0tXOljLUFPL5RrL9NMXe2KrjxAEuhGUik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=z3Pyz0Uw; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="z3Pyz0Uw"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id AA2B04E41136;
	Fri,  7 Aug 2026 12:23:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 62A97603F0;
	Fri,  7 Aug 2026 12:23:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B96AF11C37797;
	Fri,  7 Aug 2026 14:23:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786105396; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=3Hr6geQeS4BGm2BFtUPiifoXsD3qIfH6VfM3FfyReOw=;
	b=z3Pyz0UwQk7Aq4wGx9UtU14/W9xkZAe9WKtPZThmzUBQNAZ90qDCVh8mtiEa2Md64EAyBz
	EYq/+u0mvl3qK589UFcrmthB8919M7m+mRjD9sb66/+sQUXb25F9MEPLIMIxD/NFmplU1N
	znm28wadNORMgYXO3al+28R8jZreM2KDZ8+c/+LNJLeDCFrwJEM8ntEcDFOLBUH7shGWBr
	1n3h7moWmLn6LFMfa8hkc1dxL+ecQC47NUi4mMnCBE12kzKU/Y60sKrNqngQ1v3iGCc+VV
	Px+DXWivCixvyHVhxzOviaC/Vp1G9iM23zWKzjV5kyxaBbwpfqKSSK0k+4191Q==
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
Subject: Re: [PATCH v4 3/7] clk: tests: Add Kunit testing for
 of_clk_get_parent_name()
In-Reply-To: <amOsrxO3TGsl9kfF@lizhi-Precision-Tower-5810> (Frank Li's message
	of "Fri, 24 Jul 2026 14:19:27 -0400")
References: <20260717-schneider-v7-2-rc1-eip201-upstream-v4-0-751547e160e5@bootlin.com>
	<20260717-schneider-v7-2-rc1-eip201-upstream-v4-3-751547e160e5@bootlin.com>
	<amOsrxO3TGsl9kfF@lizhi-Precision-Tower-5810>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Fri, 07 Aug 2026 14:23:10 +0200
Message-ID: <87v79mce6p.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hi Frank,

On 24/07/2026 at 14:19:27 -04, Frank Li <Frank.li@oss.nxp.com> wrote:

> On Fri, Jul 17, 2026 at 05:59:19PM +0200, Miquel Raynal (Schneider Electr=
ic) wrote:
>> Make sure this helper is never broken, especially since we will soon
>> make some changes in it.
>
> Nit: Ensure this helper remains correct before making upcoming changes
> to it.

Yes, that's better, will use that sentence.

Thanks for the review!
Miqu=C3=A8l
