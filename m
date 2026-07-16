Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7751040A951;
	Thu, 16 Jul 2026 10:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784198702; cv=none; b=b60hiAVIZiesn7fjaZEncm3WLbGCewLb2HiQKLtwFM5xNe4AcGfsU+yX9lEUf5EXEfX6dHnoCWhLF0boAcFo7CJeUDeswgdIloJlZIRTXd+Qsg/zD5qs4/sgtSbiIrTP+7eN1tTkeGQPEkZtqbK4OBYV5kuWGWcNb4wEpGovguY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784198702; c=relaxed/simple;
	bh=MKXF36B/N58wgTDVUubwpPnEsfYr+reCs2pY25QG5rc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jjOb3g6mKOGUjifd1JQ2bFtLzk+JBIlt+UCP4hIOm476zw5my5pi2ZkbtRKAKB4D5J+sHodAwgwziRIyvLMPbr/SplsX1wTMu3X02JfEz6FgiTGKUjygu6iQCHmENN4/r1lmx+Qaa9guYBegD4qtF/pErt9lllOjljgSRNvJ/Do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=BoP6fua5; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="BoP6fua5"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 837BFC2B9E9;
	Thu, 16 Jul 2026 10:45:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 34272602B8;
	Thu, 16 Jul 2026 10:44:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 844BE11BD3CDC;
	Thu, 16 Jul 2026 12:44:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784198693; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=nTJU2NJ54O6LZ0hZrhPZm1F5PCgRji3kSdkWz/GfYyE=;
	b=BoP6fua52gszpewJHc1ZBvQp5kZJqEkSw0klTke8gd1nWAV4bA2Juvrjm/G5p4Zpm/kimo
	q+wrfnjqMM7HXxI9cFaW3I2T5quklx/CtWU8eBv4ioFHyQ2aYJydIvUNKrSIFvNJXRZabc
	rLqCyLAgnaF4zEBzPtUuXqBUlZrmI8TT+tXLBXfEZx63itxTohww5rjjtL5zfApC4j83yu
	/+X0sLstu/mtmNxnxfDvMYwOArBtRZ47/gvQ8nNT3PLOYXGuVHCsOgyBFK6NSpH+zsMu+t
	derWgXC3moCeji0+O30IWRx6p7PQjG5TJgzAqLWAs9g8UujZoa2bFk3RjuCycQ==
From: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
Date: Thu, 16 Jul 2026 12:44:37 +0200
Subject: [PATCH v3 4/7] clk: Improve a couple of comments
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-schneider-v7-2-rc1-eip201-upstream-v3-4-98454e83845c@bootlin.com>
References: <20260716-schneider-v7-2-rc1-eip201-upstream-v3-0-98454e83845c@bootlin.com>
In-Reply-To: <20260716-schneider-v7-2-rc1-eip201-upstream-v3-0-98454e83845c@bootlin.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
 Rae Moar <raemoar63@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Pascal EBERHARD <pascal.eberhard@se.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

Avoid mentioning the function names directly in the comments, it makes
them easily out of sync with the rest of the code. Use a more generic
wording.

Suggested-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>
Reviewed-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 08874cf9b561..7d63d81ebc09 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -5202,7 +5202,7 @@ static int of_parse_clkspec(const struct device_node *np, int index,
 		/*
 		 * For named clocks, first look up the name in the
 		 * "clock-names" property.  If it cannot be found, then index
-		 * will be an error code and of_parse_phandle_with_args() will
+		 * will be an error code and the OF phandle parser will
 		 * return -EINVAL.
 		 */
 		if (name)
@@ -5275,7 +5275,7 @@ of_clk_get_hw_from_clkspec(struct of_phandle_args *clkspec)
  *
  * This function looks up a struct clk from the registered list of clock
  * providers, an input is a clock specifier data structure as returned
- * from the of_parse_phandle_with_args() function call.
+ * from the OF phandle parser.
  */
 struct clk *of_clk_get_from_provider(struct of_phandle_args *clkspec)
 {

-- 
2.54.0

