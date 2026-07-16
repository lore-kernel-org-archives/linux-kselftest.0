Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E287540A95C
	for <linux-kselftest@vger.kernel.org>; Thu, 16 Jul 2026 10:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784198703; cv=none; b=UiFC597P3NFsOpn0tDSHyDyx2guhO9nSv6c+gu570pC727kDHOMPc2XTxHaecQdlaM7/LlF3QSBBq1cM0hqrJ07ZtwN44LR8/JkYXLEQviivHA5D3T1QMfageZslkZID0cliiplvsTAgflY+sV1J/iHSbWM5LF1jYE+D44h+EDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784198703; c=relaxed/simple;
	bh=Tqp+lD/Qo+lPH96YWjh5/wMkb1+okgFfH7rhHhQyk/c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dc293JTvmaxDXJNYC1jshudpT6egcwSj8xbYTO/kLIrR7A7CHRE3OhhllHPsirQnCc9x7S8D+09WaU5qJrfGY2cp8E8tss3Mr4lVA1XKre9OCKhC2voVFvWw0fd7nxCKs96f6uBHxrOPPVspJZmVnuifTZgkhICeInGU+5bhNnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=eiLtBFN1; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="eiLtBFN1"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 196B81A1028;
	Thu, 16 Jul 2026 10:44:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DFFC7602B8;
	Thu, 16 Jul 2026 10:44:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4C06411BD3CF3;
	Thu, 16 Jul 2026 12:44:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784198694; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Ql/DV6EXuqLRczapfEXXJkUpHBEjgtfedq/CXp/PoQY=;
	b=eiLtBFN1cFu6nC56naWwdTrgFtGp/GAb9F1dRka/W+Psg7ylU0X/5J7QwIKvf24k7pf/LY
	s/X1vXLSNiOtPa1N6MK8N+jngem+TCTuYrUVL8+0nnSOqzfQHaKe2WQmKPcU3+/HAWu27I
	jrPJYg7d2ddGLL7dGobCO343dGWFCsv5DdJyi06bgvJ2DQW8DmY9eloV/onjYf1lAjY5wP
	0QsJ+/977HCOgAz0VqIiHcR3f/Mrcuc6BT0GUFIxhDUtAsl6XImDNfY26RFwCEvC0wevE2
	bwCNve63ZcTFFsVaEHtZ+r0QgVpCc/NgfgXMKSsRUKfDcFuCM4dM01HXvcFAYw==
From: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
Date: Thu, 16 Jul 2026 12:44:38 +0200
Subject: [PATCH v3 5/7] clk: Use the generic OF phandle parsing in only one
 place
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-schneider-v7-2-rc1-eip201-upstream-v3-5-98454e83845c@bootlin.com>
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

