Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46DA53ECBE2
	for <linux-kselftest@vger.kernel.org>; Fri, 17 Jul 2026 15:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784303979; cv=none; b=rf42SL4xNe/xEq2tvaVAH+ip2lWx9fuJFGfyLbWto5BTVeie9szEecSj17Hz+SxvAlavXW4bHnI2zucRpAAma337Rp1Z45QtuKED8Kvxso90Q0O4GmQBMM6NqMfPkSNKkTOGuS730Xmx205TBTJOZqJ2Huzk1RMqHkeZ+xVlJGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784303979; c=relaxed/simple;
	bh=WDtVLHn1TfK0EyDDUA+3N6yMy6JzwOzeEo8zYmSOCqE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W9b3DHb3UzPbq7FB2lGIjR3jWCSgHTdqowEH+YeI9rmUQCN2q5bKSodTUf8qTojTrK1w3snNxBr5To1KkYorNrTJb2r+QUvBmyFeG4RXlER6eFz3Sl+ZzSqtIfBeD93qQLp1rXVpX449wdSK7ocDIMFYTKlGIyjI/fjHuycW83o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Rnti3WNj; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Rnti3WNj"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C56D74E40E22;
	Fri, 17 Jul 2026 15:59:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 92BBC60361;
	Fri, 17 Jul 2026 15:59:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B467F11BD04D0;
	Fri, 17 Jul 2026 17:59:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784303975; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=mhYSjNdEm8uNctigqOpdn31Q0IRlbVuoAOk9I7KUjjE=;
	b=Rnti3WNjH5FgND6qxhFnehB5XhctNp/6hB6v3PfNOp9IzlArk2FHcqW57ROekX4hzDYDiM
	dhUg+Asod2VXXY5BJPncqzgMpfMdnChhbHndRnsCTtZYk6mkcW/GWqTFfuBbN9YQ3beJfU
	/ERUzpItRNRbwC/dTYhXzThCSGcZE4G1/gcd/Jnh1cmqOGbS5T/YPFHQm6CcRZSezSjjq2
	LjsePJ8TNyu/otUWfkbEvze/sV8Nnm2da4b4NA26JAMWzaGjFBHoaChfvIHYH5FY/DC6nI
	zcr18IjWDcDhMn8KA8iuHVPfllzvbzt3jM6YgJBXlpe39pcCcpP34asgg7nQ8w==
From: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
Date: Fri, 17 Jul 2026 17:59:19 +0200
Subject: [PATCH v4 3/7] clk: tests: Add Kunit testing for
 of_clk_get_parent_name()
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-schneider-v7-2-rc1-eip201-upstream-v4-3-751547e160e5@bootlin.com>
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

Make sure this helper is never broken, especially since we will soon
make some changes in it.

Signed-off-by: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>
---
 drivers/clk/clk_test.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index f47f81b7d72a..4084559e157d 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -3637,9 +3637,23 @@ static void clk_parse_clkspec_with_incorrect_index_and_name(struct kunit *test)
 	KUNIT_EXPECT_TRUE(test, IS_ERR(hw));
 }
 
+/*
+ * Verify that of_clk_get_parent_name() returns the correct clock name when
+ * looking up by index through the consumer's clocks property.
+ */
+static void of_clk_get_parent_name_gets_parent_name(struct kunit *test)
+{
+	struct clk_parse_clkspec_ctx *ctx = test->priv;
+	const char *expected_name = "clk_parse_clkspec_1";
+
+	KUNIT_EXPECT_STREQ(test, expected_name,
+			   of_clk_get_parent_name(ctx->cons_np, 0));
+}
+
 static struct kunit_case clk_parse_clkspec_test_cases[] = {
 	KUNIT_CASE(clk_parse_clkspec_with_correct_index_and_name),
 	KUNIT_CASE(clk_parse_clkspec_with_incorrect_index_and_name),
+	KUNIT_CASE(of_clk_get_parent_name_gets_parent_name),
 	{}
 };
 

-- 
2.54.0

