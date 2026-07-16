Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4C03F8EB7
	for <linux-kselftest@vger.kernel.org>; Thu, 16 Jul 2026 10:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784198701; cv=none; b=rR5dJD32/G4Fg2cM9kqshCU7QWKmXiZw8dN+MAzupYdC+bqSdhrCOhiKtE01PIlww/+qtme0dkxYp3I1Edj51XCMxGXGavfuPVRZI0ksxgipRZTNHSbn9ZRfGe9CzaD+RxA1xCoy0HY+iBDJpd72YDbCJa9P/zz6AM1LuhCUlDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784198701; c=relaxed/simple;
	bh=WDtVLHn1TfK0EyDDUA+3N6yMy6JzwOzeEo8zYmSOCqE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KiaDL8b4ZBFXp/uc7rulKye3RRQR7oYSEwzAgW75mrCC7HWJlnRpb6wHrL7nyBtRVU96w3CH1EfCo3kUI89xCykXyYfHbDihSU5AJ+7bYHVNa0UU3Pi6qxvX7IDMhAWy4G4r2MH7OBjZcIaRTbncYQtfoyvKvUiFs0ZBtf9nmb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=gviMGxMb; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="gviMGxMb"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id AD84BC2B9E8;
	Thu, 16 Jul 2026 10:45:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 62EE8602B8;
	Thu, 16 Jul 2026 10:44:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C045111BD3CD7;
	Thu, 16 Jul 2026 12:44:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784198691; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=mhYSjNdEm8uNctigqOpdn31Q0IRlbVuoAOk9I7KUjjE=;
	b=gviMGxMbpEWePHu3YtGA1HFO2xeh6thVzGoMOEPm/1FkColgfeVdf4mWwBWTb4wa2jh2mj
	AOegIDmiolFtvkTDsth5YSP3vgmzmfzGY1Kxf3udAd3erVLAuyW7pBsqx2a67WwFz8aUBX
	2lIY7LJswVsY0VfRBNflpRkwV2wBni+Ux3V9q2zJaGtGoyBzWkazJYMER96aRwCX+Tg+qk
	6pUXv4o0No9US2yyqHZGkMWMflwIPqVGwlEG4or8Qh+VHAIZnC4T62SuHFIZEogfUgf0CG
	wbv2YVjGgjl5EdeJG0rKbxjUtn9KBvnMX/vy4MRTp7OFCV+jK/kYaSRnb1bEzw==
From: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
Date: Thu, 16 Jul 2026 12:44:36 +0200
Subject: [PATCH v3 3/7] clk: tests: Add Kunit testing for
 of_clk_get_parent_name()
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-schneider-v7-2-rc1-eip201-upstream-v3-3-98454e83845c@bootlin.com>
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

