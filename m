Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D02343E06B;
	Fri,  7 Aug 2026 15:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786116283; cv=none; b=rFyq/s1oiM1XBYwgxSKnUYjVknuOkfv2dpEGu+sxpiSw+UY48IwIcZwQjZpreoXoPd9U6uUMjxlccdbhHKh4UnsIcT4LiY71dUOhUTGFX4xeOsZ244+n1nwKe+rpW/lnZ8E9XWlX28YOoSenO2B7cTYGbl5OC9GfenrqWGUJwD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786116283; c=relaxed/simple;
	bh=MKXF36B/N58wgTDVUubwpPnEsfYr+reCs2pY25QG5rc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ppcVaDTn5i/PFcfM/LX+pgM4PK2kHumy1itgNOf6n656ly/YAKn7LstrIsdq5X7H/rzcE7abhtYjVpJ5FlooVCdKnC0SkzUzGvgXeLkVdat1AXGYFRLE6SfVZRJvLDrdiTGm+iYNTGaW+1qE+RMN6xwmlc4v9KLI9nFUqk8J0pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=THj0V2/l; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="THj0V2/l"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C42DD1A14B2;
	Fri,  7 Aug 2026 15:24:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 98A43603F0;
	Fri,  7 Aug 2026 15:24:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 25F0211C37ACB;
	Fri,  7 Aug 2026 17:24:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786116279; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=nTJU2NJ54O6LZ0hZrhPZm1F5PCgRji3kSdkWz/GfYyE=;
	b=THj0V2/lEt+d7eiM9wXyfoibWmPpJ6QIwPLZccfCaUZzPY587sEipw5gT0eix9h8usmfs2
	dLFSkPi97zpiG+XCKL9gLTIFt6KdYmWHsU9+7UuFYVkwenCmJc9cpBPTrEtsFUiUNFcCkM
	f1a1nnJlchv0GLonoNOeBc4DVEKA8sjgpdKkU/U8OhRSlKxrreVmlXrnur0VA3fHeZsjqM
	igcRUww6znmXkfX2wkotctB4pVdxBISCnp1DskSCB6UCl5VCNHQSzbcqDltgjn9KF0Hi9H
	F80zzEgsn2Ut2Ceeo2eEsSEhoC1kMlDtmlInw89YUfeAyYwBywybl8kfAnNYzA==
From: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
Date: Fri, 07 Aug 2026 17:24:05 +0200
Subject: [PATCH v5 4/7] clk: Improve a couple of comments
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-schneider-v7-2-rc1-eip201-upstream-v5-4-8785f9531cf0@bootlin.com>
References: <20260807-schneider-v7-2-rc1-eip201-upstream-v5-0-8785f9531cf0@bootlin.com>
In-Reply-To: <20260807-schneider-v7-2-rc1-eip201-upstream-v5-0-8785f9531cf0@bootlin.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
 Rae Moar <raemoar63@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Pascal EBERHARD <pascal.eberhard@se.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Fran Li <Frank.li@oss.nxp.com>, linux-clk@vger.kernel.org, 
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

