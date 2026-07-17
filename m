Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B69D5373BE0;
	Fri, 17 Jul 2026 15:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784303984; cv=none; b=NIcs1fpPaZp0QBo3v8NvmH287XVpIFQIigxTdevq234Mz7IwKw6oW5/5jcvGRytJT4BbwXE3eHgxuVs1Sp1Zthrto+o45JlYU7iBQtQ/8A51DFSytVmOGDV7K73z9M0LHHqKwreZJG/xfFpGjWTjpRPykO0zls9JYY8/rlMJhlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784303984; c=relaxed/simple;
	bh=Tqp+lD/Qo+lPH96YWjh5/wMkb1+okgFfH7rhHhQyk/c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NNba/UUX3sS/ABAjJBelwRbSKEM8gk9dXC0XCzaJmDPZKHRedFC3eXk99meC+UYqDnSXGF0FUIEM/l14kcaZ9vV9DyEVvJAKw/dmMRmhbN1xabMW6uigcblQbUQOCLXkURJyGzQ6blhfDg0AgNX/9M2Y5GPhDzy/dpYoO7/1MH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=XtEU+0Tw; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="XtEU+0Tw"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 34F1D1A1063;
	Fri, 17 Jul 2026 15:59:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 083B960361;
	Fri, 17 Jul 2026 15:59:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 33DCE11BD0C60;
	Fri, 17 Jul 2026 17:59:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784303979; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Ql/DV6EXuqLRczapfEXXJkUpHBEjgtfedq/CXp/PoQY=;
	b=XtEU+0TwkxFGqHy1CuPILeSr3uwNoeqpQP7JqPxNSTogUDQj3B2v3dKObDH1P58iEqqU2d
	s59tjl74JPJxSbAwnOAH/bZyqsU1e7prTZc3gy+ndHHuBEybfFAEbteS2j7yqa0kgV/+8D
	4ohx7Ve9PD8yEau/471h4BMUNXWyN4Hw32luuBUa235cc+oWxy/rRR0BE38EP7rsb6KxVr
	X6AD9Py3rEtA+nh3xoHqmpliSLMreyHD2ML7MKpGPmKdOIMR15Oj2tCHhzM5p4pZHz1+r1
	/sDQAvzeJhh3ci/B9EqG4rfydRmUFo6o81AwKQZqi/O7z8I4wogrKVnzIX71CA==
From: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
Date: Fri, 17 Jul 2026 17:59:21 +0200
Subject: [PATCH v4 5/7] clk: Use the generic OF phandle parsing in only one
 place
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-schneider-v7-2-rc1-eip201-upstream-v4-5-751547e160e5@bootlin.com>
References: <20260717-schneider-v7-2-rc1-eip201-upstream-v4-0-751547e160e5@bootlin.com>
In-Reply-To: <20260717-schneider-v7-2-rc1-eip201-upstream-v4-0-751547e160e5@bootlin.com>
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

There should be one single entry in the OF world, so that the way we
parse the DT is always the same. make sure this is the case by avoid
calling of_parse_phandle_with_args() from of_clk_get_parent_name(). This
is even more relevant as we currently fail to parse clock-ranges. As a
result, it seems to be safer to directly call of_parse_clkspec() there,
but doing so implies that we do not try the "clock-ranges" path if we
already found a "clocks" property..

Suggested-by: Stephen Boyd <sboyd@kernel.org>
Fixes: 4472287a3b2f5 ("clk: Introduce of_clk_get_hw_from_clkspec()")
Signed-off-by: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>
Reviewed-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 7d63d81ebc09..45f5d7a4ccc1 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -5219,6 +5219,8 @@ static int of_parse_clkspec(const struct device_node *np, int index,
 		 * has a "clock-ranges" property, then we can try one of its
 		 * clocks.
 		 */
+		if (of_property_present(np, "clocks"))
+			break;
 		np = np->parent;
 		if (np && !of_property_present(np, "clock-ranges"))
 			break;
@@ -5364,8 +5366,7 @@ const char *of_clk_get_parent_name(const struct device_node *np, int index)
 	int count;
 	struct clk *clk;
 
-	rc = of_parse_phandle_with_args(np, "clocks", "#clock-cells", index,
-					&clkspec);
+	rc = of_parse_clkspec(np, index, NULL, &clkspec);
 	if (rc)
 		return NULL;
 

-- 
2.54.0

