Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792491076;
	b=KCemqIQLMcxRTwhbZ/taj5k3EVd0OcNppq12MCRj7f3IfTBvAacgdolrBWdqVy+NhfOl
	 RDBJKX668ihMQCjesqdX00nzlwO0O0uYbvJiiWOx7V8zbAP14WZwuigeHrGplkFu8z/NP
	 pI/gu7E//fJrn59ImFwWhtAFQuPeDh+T+7s3xv0cMuaCO6V820CxbDxmAcyb0GjwzhfK9
	 riVDXFtQUh7ACAFt/0bToPqMWeFNJwWrHkrL6czRH9/5cCvy4TqzAisOApb/5hY3Hr/aN
	 +gdVaz1uoGagTCcsQL+RF3R0TFsQu7xJXTSdPwWrHs3ozqd1CUGk1gV9OLWBS8xm2KQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792491076;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=AF3BwNTjc3cQhxo/zFwFMktZ+rpNg/N7alAMthomJEA=;
	b=i3c359IeL0PjR65iamjhmqYqc3Z7FkzgqB7Lw4rIU5czQUlG4mpaq65YcUzkjFvIWMbm
	 ZvaRno9SPjPopI3jMQY8cTsEZ9xWJbdq5ILVyl+sXfpiHGKcBoSeE4ZoUbxsqoHhECRdo
	 u3xEloJDEYW75QcD68ajSxtqI/Ha2NA570l2EWzTW8dPfudOwCgVCSe4tFNgqmfT49VsU
	 WKjC/Gm4UA361NpG8plX3usfe1eWk4VYkcfi62B5qggJWRDR/8GEcA9H9hFCV97estvud
	 Hi+0Jk99mmOFSd3KvscwSotumHpwPOoBPAu/KykIHFOLpixYF2Om309ig/OT9idgvlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=D158JEF3;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92D4606A320
	for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 10:11:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A92D4606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=D158JEF3
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 4AB6FC5CD5F;
	Tue, 20 Oct 2026 10:12:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C382B60393;
	Tue, 20 Oct 2026 10:11:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9713310328C52;
	Tue, 20 Oct 2026 12:11:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792491070; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=AF3BwNTjc3cQhxo/zFwFMktZ+rpNg/N7alAMthomJEA=;
	b=D158JEF39wkwljUJNH2cpX5X77YTgOGtmWkKjwvYfADgBKly+UXMXn1LuaQMqaZTfnYFjs
	+5Pp1yU1CGTsYKHkjbRNF8asnW9yW9A9Qh65tztizCy52H48hWzojAsuNRiemSMo64mq1N
	U3lXjtqEefBKeGzjy36yoW2ndINtt0YsIMEYDTfMDcF8cCuhJGlBT1dLoa5dZjxV6J4ifQ
	YPSWB+cXGYtICd3AvSxwQbPg4a8mZiJNhPxveLsJ0WwVyskhxEX9IbhG61/UV64fx470Lb
	UZ5O4DCjqt8HG4Qp7B2RVn5RZ4KfEbwchAXBV1e7/7wBiiwx37GOpMm4nI5aZg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>,  Stephen Boyd
 <sboyd@kernel.org>,  Maxime Ripard <mripard@kernel.org>,  Alberto Ruiz
 <aruiz@redhat.com>,  Brendan Higgins <brendan.higgins@linux.dev>,  David
 Gow <david@davidgow.net>,  Rae Moar <raemoar63@gmail.com>,
  linux-clk@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-kselftest@vger.kernel.org,  kunit-dev@googlegroups.com
Subject: Re: [PATCH v8 0/8] clk: add support for v1 / v2 clock rate
 negotiation and kunit tests
In-Reply-To: <20260327-clk-scaling-v8-0-86cd0aba3c5f@redhat.com> (Brian
	Masney's message of "Fri, 27 Mar 2026 15:31:55 -0400")
References: <20260327-clk-scaling-v8-0-86cd0aba3c5f@redhat.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 20 Oct 2026 12:11:06 +0200
Message-ID: <87wlrcsmv9.fsf@bootlin.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

On 27/03/2026 at 15:31:55 -04, Brian Masney <bmasney@redhat.com> wrote:

> The Common Clock Framework is expected to keep a clock=E2=80=99s rate sta=
ble
> after setting a new rate with:
>
>     clk_set_rate(clk, NEW_RATE);
>
> Clock consumers do not know about the clock hierarchy, sibling clocks,
> or the type of clocks involved. However, several longstanding issues
> affect how rate changes propagate through the clock tree when
> CLK_SET_RATE_PARENT is involved, and the parent's clock rate is changed:
>
> - A clock in some cases can unknowingly change a sibling clock's rate.
>
> - No negotiation is done with the sibling clocks, so an inappropriate
>   or less than ideal parent rate can be selected.
>
> A selection of some real world examples of where this shows up is at
> [1]. DRM needs to run at precise clock rates, and this issue shows up
> there, however will also show up in other subsystems that require
> precise clock rates, such as sound.
>
> This series introduces kunit tests to illustrate the current behavior in
> the clk core. As discussed at Linux Plumbers Conference 2025 in Tokyo
> [2], it was suggested to move the negotiation logic into the clk
> providers themselves so that only the clks with this issue can have
> their rate preserved, and add some common helpers to the clk core.

I could succesfully test this series with minor adjustments:

* The LCM calculation must happen on core clocks instead of hw clocks
  (see my other answer in this thread).

* The imx8mp LDB clock shall set the CLK_SET_RATE_PARENT flag, otherwise
  it does not forward the rate change:

--- a/drivers/clk/imx/clk-imx8mp.c
+++ b/drivers/clk/imx/clk-imx8mp.c
@@ -751,9 +751,9 @@ static int imx8mp_clocks_probe(struct platform_device *=
pdev)
-       hws[IMX8MP_CLK_MEDIA_LDB] =3D imx8m_clk_hw_composite("media_ldb", i=
mx8mp_media_ldb_sels, ccm_base + 0xbf00);
+       hws[IMX8MP_CLK_MEDIA_LDB] =3D imx8m_clk_hw_composite_bus_flags("med=
ia_ldb", imx8mp_media_ldb_sels, ccm_base + 0xbf00, CLK_SET_RATE_PARENT);

* The imx8mp LDB and media_pix[1,2] clocks need to be flagged as
  supporting the new v2 rate calculation introduced by Brian.

--- a/drivers/clk/imx/clk-imx8mp.c
+++ b/drivers/clk/imx/clk-imx8mp.c
@@ -689,7 +689,7 @@ static int imx8mp_clocks_probe(struct platform_device *=
pdev)

-       hws[IMX8MP_CLK_MEDIA_DISP2_PIX] =3D imx8m_clk_hw_composite_bus_flag=
s("media_disp2_pix", imx8mp_media_disp_pix_sels, ccm_base + 0x9300, CLK_SET=
_RATE_PARENT);
+       hws[IMX8MP_CLK_MEDIA_DISP2_PIX] =3D imx8m_clk_hw_composite_bus_flag=
s("media_disp2_pix", imx8mp_media_disp_pix_sels, ccm_base + 0x9300, CLK_SET=
_RATE_PARENT | CLK_V2_RATE_NEGOTIATION);
=20
-       hws[IMX8MP_CLK_MEDIA_DISP1_PIX] =3D imx8m_clk_hw_composite_bus_flag=
s("media_disp1_pix", imx8mp_media_disp_pix_sels, ccm_base + 0xbe00, CLK_SET=
_RATE_PARENT);
+       hws[IMX8MP_CLK_MEDIA_DISP1_PIX] =3D imx8m_clk_hw_composite_bus_flag=
s("media_disp1_pix", imx8mp_media_disp_pix_sels, ccm_base + 0xbe00, CLK_SET=
_RATE_PARENT | CLK_V2_RATE_NEGOTIATION);

-       hws[IMX8MP_CLK_MEDIA_LDB] =3D imx8m_clk_hw_composite_bus_flags("med=
ia_ldb", imx8mp_media_ldb_sels, ccm_base + 0xbf00, CLK_SET_RATE_PARENT);
+       hws[IMX8MP_CLK_MEDIA_LDB] =3D imx8m_clk_hw_composite_bus_flags("med=
ia_ldb", imx8mp_media_ldb_sels, ccm_base + 0xbf00, CLK_SET_RATE_PARENT | CL=
K_V2_RATE_NEGOTIATION);

To be fairly honest, the discussion at LPC about how to handle this case
(and the transition) did not exist because time was flying but I do not
generally like the approaches were we introduce "the good" alternative
without enabling it by default. It just makes the transitions endless
and more painful for people who already suffer from a problem. I am
fine keeping the old behaviour available, but I would be in favour of
making the legacy way available with an explicity flag, rather than the
opposite. We may break users, yes, but otherwise we will have to support
the two calculations forever and nobody will ever notice the new
alternative.

That being said, it works! So:

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
Tested-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks,
Miqu=C3=A8l
