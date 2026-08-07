Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6E14749D3;
	Fri,  7 Aug 2026 12:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786107035; cv=none; b=olQfBt4gRZ1KXwqVbtMy1jbdwpbo2ANdErF1A2CG0Vcbn3vbv4JxW6Eybo/cx3AJinFmV8bGjB2iO322ntw/6tFmpanPwhk8erglf7/ycuxgIOkQ3cfjXdEmrTqBxxK/Ddi5hWQi+b+cLNU/tRYD/kX3TZ9scVxOVf5+D3uHhi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786107035; c=relaxed/simple;
	bh=xcwc27dtgaEfeclKCaFaHyK44PWLjl6vV/kiSw+kWsI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=uIckkYN7edVmelb+tNuHPG5JE+Mw2KhdSI/tlcI5yzJPrKsybfjH9fUD8DzKeJHPrtyAhqgvVH13SiEcIffVe7ktWzvoKD82rcRm3CiCinoEkHQteThU7y1vmbrFYsr0UKkK2nvnLEFY3Czgaf/Z2yi8UVTsOgHf9Zdj4J+LxCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=c2t0R/lf; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="c2t0R/lf"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 03D4B1A14A2;
	Fri,  7 Aug 2026 12:50:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C2E69603F0;
	Fri,  7 Aug 2026 12:50:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8B5E611C377B9;
	Fri,  7 Aug 2026 14:50:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786107016; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=suSWk7tHHlNpm3KUJH6c7fI1wM3gzEsCFQhFgi5mZn0=;
	b=c2t0R/lfxbDbZ+8GeFQCc5gOFXCS/d4cHMVhRbjHgWmGlWsay8TYUnl19XMjpSlxHvnHvI
	io1yYLwk90U8jvcA+dUpBc6XL7JPoJnXxmOIeI/GX86eyKCK/cGMvRfcyCd+axDP2Zv5Pt
	OCsu11IS17A7kviqpjhtZ3ynV6XZgVsq2d93bKptvWvupxoC/Y9W6IJvnYec55Qu6oMVDA
	ssOWg88QZbBgJm6gDZeLuP9ynBYGkIqOK+IMTuliqp4pAakjMb5QxSB/CiHYkxHhRm2JCR
	jsq2iflttlaN3ZTSq7nxlXUp2rG9N0iAsbCgnLLTMxDNNLYmWJmr0s3PWaoL8w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>,  Stephen Boyd
 <sboyd@kernel.org>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Brendan
 Higgins <brendan.higgins@linux.dev>,  David Gow <david@davidgow.net>,  Rae
 Moar <raemoar63@gmail.com>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Pascal EBERHARD <pascal.eberhard@se.com>,
  Wolfram Sang <wsa+renesas@sang-engineering.com>,
  linux-clk@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-kselftest@vger.kernel.org,
  kunit-dev@googlegroups.com
Subject: Re: [PATCH v4 7/7] clk: tests: Add Kunit testing for nexus nodes
In-Reply-To: <al_zh1cOInMXEU8x@redhat.com> (Brian Masney's message of "Tue, 21
	Jul 2026 18:32:39 -0400")
References: <20260717-schneider-v7-2-rc1-eip201-upstream-v4-0-751547e160e5@bootlin.com>
	<20260717-schneider-v7-2-rc1-eip201-upstream-v4-7-751547e160e5@bootlin.com>
	<al_zh1cOInMXEU8x@redhat.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Fri, 07 Aug 2026 14:50:12 +0200
Message-ID: <87jyq2ccxn.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

On 21/07/2026 at 18:32:39 -04, Brian Masney <bmasney@redhat.com> wrote:

> On Fri, Jul 17, 2026 at 05:59:23PM +0200, Miquel Raynal (Schneider Electr=
ic) wrote:
>> Add a nexus node with a child requesting a mapped clock in the fake DT
>> overlay to verify that the parsing is also correctly working.
>>=20
>> Create an of_find_node_by_name() like kunit helper to garbage collect the
>> node automatically in case of failed assertion.
>>=20
>> Suggested-by: Stephen Boyd <sboyd@kernel.org>
>> Signed-off-by: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin=
.com>
>> ---
>>  drivers/clk/clk_kunit_helpers.c          | 31 +++++++++++++++++++++++++=
++++++
>>  drivers/clk/clk_test.c                   | 15 +++++++++++++++
>>  drivers/clk/kunit_clk_parse_clkspec.dtso | 10 ++++++++++
>>  include/kunit/clk.h                      |  2 ++
>>  4 files changed, 58 insertions(+)
>>=20
>> diff --git a/drivers/clk/clk_kunit_helpers.c b/drivers/clk/clk_kunit_hel=
pers.c
>> index 68a28e70bb61..daaf1cf1546c 100644
>> --- a/drivers/clk/clk_kunit_helpers.c
>> +++ b/drivers/clk/clk_kunit_helpers.c
>> @@ -233,5 +233,36 @@ int of_clk_add_hw_provider_kunit(struct kunit *test=
, struct device_node *np,
>>  }
>>  EXPORT_SYMBOL_GPL(of_clk_add_hw_provider_kunit);
>>=20=20
>> +KUNIT_DEFINE_ACTION_WRAPPER(of_node_put_wrapper, of_node_put, struct de=
vice_node *);
>> +
>> +/**
>> + * of_find_node_by_name_kunit() - Test managed of_find_node_by_name()
>> + * @test: The test context
>> + * @from: Parent device node to start searching from, or NULL to search=
 from root
>> + * @name: The name string to match against
>> + *
>> + * Just like of_find_node_by_name(), except the device_noded is managed=
 by
>> + * the test case and is automatically put after the test case concludes.
>> + *
>> + * Return: the device_node on success, NULL if not found, or a negative=
 errno value on failure.
>> + */
>> +struct device_node *of_find_node_by_name_kunit(struct kunit *test, stru=
ct device_node *from,
>> +					       const char *name)
>> +{
>> +	struct device_node *np;
>> +	int ret;
>> +
>> +	np =3D of_find_node_by_name(from, name);
>> +	if (!np)
>> +		return NULL;
>> +
>> +	ret =3D kunit_add_action_or_reset(test, of_node_put_wrapper, np);
>> +	if (ret)
>> +		return ERR_PTR(ret);
>> +
>> +	return np;
>> +}
>> +EXPORT_SYMBOL_GPL(of_find_node_by_name_kunit);
>
> Should this be prefixed with clk_ since this is in
> clk_kunit_helpers.c?

That's right, I missed it. I'll rename the helper.

Thanks!
Miqu=C3=A8l
