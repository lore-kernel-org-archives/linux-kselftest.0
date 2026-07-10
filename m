Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 793AC377EAC;
	Fri, 10 Jul 2026 18:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783707746; cv=none; b=ZkaHhmb+JkE50TT/Ba7UuPRddySkM4yLuczrWP3pc8EuOk0rRiOkHieh+TO7VT1gnNSpQzMuJKGx0VuxJbCPcVFeG1Eq+EruQCe3aIP4omlnIp1wrq53QTi3PHpkodnJshWg4aANEUrz/omm0/PPC+Dve9iHEKkRQKVHTpbz9Rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783707746; c=relaxed/simple;
	bh=1hxI8IPp7+qUHOwC1pZ378X8AOhxlzUL/nxF5tit2HM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K1FqOyiREys8B+RAoshU5NMsl79fZritfT8XG1mf7AiPeNi4kmI3ZGzKJguIglthjvE1+kn6SCNkdZvnPJkf6XF/TzseAin8ZiVKGaDyx8vLLKo5gW7nwMKiRKx4EPwKXqxus9OoXvwpuYZ4d+mLJUApfphw8cYNQ7obpohueeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=BotI4WXU; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="BotI4WXU"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id DE1C31A0F46;
	Fri, 10 Jul 2026 18:22:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B308160342;
	Fri, 10 Jul 2026 18:22:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6DBDB11BD2BB8;
	Fri, 10 Jul 2026 20:22:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783707740; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=y4d0+A/oCA9z4CTriljWhVa/qSWjf+3UGfLM+Z2+ZyU=;
	b=BotI4WXUol7aIZ4Cmw3x1ZEc+yn2YidBDr1Hrh7LINyfyl80rNRJ7CMLJgrx6Nu0rlU8za
	Lw68DVU1fL0pBkwNBG1NH64soUhimFSH+eDmKYlHOUX6A3WvZZX/WUPkkM1JQreNH7eVD8
	TM/dtm3xbnLqCK3lxjRnA3kvXkxinYWnxfNl7T7nirwrKBZuUDAh6QthLfCief/gH5b+se
	rzv/3L5zpNRoWe9+j7qG4hzjBMqTDymhH51fHSwFkQAm33REzeuw5WeHGEfdeLKpHoyIGz
	d42YiuBOVZBGAqsalKRVZeaqFJWtzOGsdbnGngKCjx1DqlBzky1+gaAjaJt6Ew==
From: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
Date: Fri, 10 Jul 2026 20:21:58 +0200
Subject: [PATCH v2 3/7] clk: tests: Add Kunit testing for
 of_clk_get_parent_name()
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-schneider-v7-2-rc1-eip201-upstream-v2-3-b4680787377e@bootlin.com>
References: <20260710-schneider-v7-2-rc1-eip201-upstream-v2-0-b4680787377e@bootlin.com>
In-Reply-To: <20260710-schneider-v7-2-rc1-eip201-upstream-v2-0-b4680787377e@bootlin.com>
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
index fddb2bb9618f..5f3ffda033c3 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -3643,9 +3643,23 @@ static void clk_parse_clkspec_with_incorrect_index_and_name(struct kunit *test)
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

