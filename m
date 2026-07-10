Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B315337AA81
	for <linux-kselftest@vger.kernel.org>; Fri, 10 Jul 2026 18:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783707743; cv=none; b=Z7vsRAxWRskT8cqlkDFwdwpA9vF0Ic43BvAj2KKCawbCOcAyT/YELwxj+RdXpxZHFYGnMNS8sEgB1Jc8CcZnIATDYrDJH3zkFyeSE8HWDNlyEJBl6oNlDUwEbuCt3lvKzKvaeCpYUyPf4BGsb3IUpTGJTdJDurUuPDXr2XqQHqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783707743; c=relaxed/simple;
	bh=BftAQ4d/iZFW8LlEWOjZYzTJKwuq8e6Tg64d926D7hs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CJI9RTNc2I8FfzNbNeVWcQpmTvWuKP3erLIa2WpWo+fwazrEjYKrIZ6Gly3ZbRZ3u62Q+79Mh951ScZ61WXi7Tj7vUx+nlJoTHAXsKdV8Wumnl7jwYBIYW5dH4TKw6m0tWxLwrnPR+of+d9fPpfhPq3vFwnNCk0/7G8NP1nQKeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=naP2iMxf; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="naP2iMxf"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5E5731A0F48;
	Fri, 10 Jul 2026 18:22:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2C4A560342;
	Fri, 10 Jul 2026 18:22:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E65CA11BD2C1F;
	Fri, 10 Jul 2026 20:22:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783707738; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=M5ONPK0FldTaZ0gyW+2a82proN3HkRbf2BKdgJRba8A=;
	b=naP2iMxfOZH1C5pIVPhisLYqCr4G4xOLjpDjFeMpUwKODbh2MDGrIiHz5QIluHNHK9t5a9
	JQzcnwG46rpsmV1360VfkqqvUbMNRYtlUQTVX2EGS/47t2RLZ/RpDbCRJf40rmJMpaZVUu
	QwS0/BNieuvHIS6mwwljYtEWWA25B4a1AAR5UN3mR6isnRbtzCp7iQnZE44OU9m4aRFmLw
	YHkH1SSG8qAmaK1+lX3czSifYOfh3sCwUznDwxi8kqtPmgtQ7z+8kQLorkj61Od33jac6Z
	oIVbKkMtFo006P3K/LtK4Q2LHLLzaU+GkVJ5naikDOJiMpRhE05bNvStK9RIHg==
From: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
Date: Fri, 10 Jul 2026 20:21:57 +0200
Subject: [PATCH v2 2/7] clk: tests: Add clk_parse_clkspec() Kunit testing
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-schneider-v7-2-rc1-eip201-upstream-v2-2-b4680787377e@bootlin.com>
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

Create a new set of kunit tests to make sure clk_parse_clkspec() is
working as expected. We currently verify if we get a proper device when
using indexes and names. If we make an out of bounds request we expect
an error.

For testing purposes, we must ensure of_clk_get_hw()'s symbol is
exported.

Suggested-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>
---
 drivers/clk/Makefile                     |   1 +
 drivers/clk/clk.c                        |   2 +
 drivers/clk/clk_test.c                   | 117 +++++++++++++++++++++++++++++++
 drivers/clk/kunit_clk_parse_clkspec.dtso |  21 ++++++
 4 files changed, 141 insertions(+)

diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index cc108a75a900..035b984db70d 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -19,6 +19,7 @@ clk-test-y			:= clk_test.o \
 				   kunit_clk_assigned_rates_zero.dtbo.o \
 				   kunit_clk_assigned_rates_zero_consumer.dtbo.o \
 				   kunit_clk_hw_get_dev_of_node.dtbo.o \
+				   kunit_clk_parse_clkspec.dtbo.o \
 				   kunit_clk_parent_data_test.dtbo.o
 obj-$(CONFIG_COMMON_CLK)	+= clk-divider.o
 obj-$(CONFIG_COMMON_CLK)	+= clk-fixed-factor.o
diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 048adfa86a5d..08874cf9b561 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -24,6 +24,7 @@
 #include <linux/spinlock.h>
 #include <linux/string.h>
 #include <linux/stringhash.h>
+#include <kunit/visibility.h>
 
 #include "clk.h"
 
@@ -5300,6 +5301,7 @@ struct clk_hw *of_clk_get_hw(struct device_node *np, int index,
 
 	return hw;
 }
+EXPORT_SYMBOL_IF_KUNIT(of_clk_get_hw);
 
 static struct clk *__of_clk_get(struct device_node *np,
 				int index, const char *dev_id,
diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index b1961daac5e2..fddb2bb9618f 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -3541,10 +3541,126 @@ static struct kunit_suite clk_hw_get_dev_of_node_test_suite = {
 	.test_cases = clk_hw_get_dev_of_node_test_cases,
 };
 
+static const struct clk_init_data clk_parse_clkspec_1_init_data = {
+	.name = "clk_parse_clkspec_1",
+	.ops = &empty_clk_ops,
+};
+
+static const struct clk_init_data clk_parse_clkspec_2_init_data = {
+	.name = "clk_parse_clkspec_2",
+	.ops = &empty_clk_ops,
+};
+
+struct clk_parse_clkspec_ctx {
+	struct device_node *cons_np;
+};
+
+static int clk_parse_clkspec_init(struct kunit *test)
+{
+	struct device_node *prov1_np, *prov2_np;
+	struct clk_parse_clkspec_ctx *ctx;
+	struct clk_hw *hw1, *hw2;
+
+	ctx = kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
+	test->priv = ctx;
+
+	KUNIT_ASSERT_EQ(test, 0, of_overlay_apply_kunit(test, kunit_clk_parse_clkspec));
+
+	/* Register provider 1 */
+	hw1 = kunit_kzalloc(test, sizeof(*hw1), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, hw1);
+	hw1->init = &clk_parse_clkspec_1_init_data;
+
+	prov1_np = of_find_compatible_node(NULL, NULL, "test,clock-provider1");
+	KUNIT_ASSERT_NOT_NULL(test, prov1_np);
+
+	KUNIT_ASSERT_EQ(test, 0, of_clk_hw_register_kunit(test, prov1_np, hw1));
+	of_clk_add_hw_provider_kunit(test, prov1_np, of_clk_hw_simple_get, hw1);
+	of_node_put(prov1_np);
+
+	/* Register provider 2 */
+	hw2 = kunit_kzalloc(test, sizeof(*hw2), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, hw2);
+	hw2->init = &clk_parse_clkspec_2_init_data;
+
+	prov2_np = of_find_compatible_node(NULL, NULL, "test,clock-provider2");
+	KUNIT_ASSERT_NOT_NULL(test, prov2_np);
+
+	KUNIT_ASSERT_EQ(test, 0, of_clk_hw_register_kunit(test, prov2_np, hw2));
+	of_clk_add_hw_provider_kunit(test, prov2_np, of_clk_hw_simple_get, hw2);
+	of_node_put(prov2_np);
+
+	ctx->cons_np = of_find_compatible_node(NULL, NULL, "test,clock-consumer");
+	KUNIT_ASSERT_NOT_NULL(test, ctx->cons_np);
+
+	return 0;
+}
+
+static void clk_parse_clkspec_exit(struct kunit *test)
+{
+	struct clk_parse_clkspec_ctx *ctx = test->priv;
+
+	of_node_put(ctx->cons_np);
+}
+
+/* Test DT phandle lookups using correct index or name succeed */
+static void clk_parse_clkspec_with_correct_index_and_name(struct kunit *test)
+{
+	struct clk_parse_clkspec_ctx *ctx = test->priv;
+	struct clk_hw *hw1, *hw2, *hw3, *hw4;
+
+	/* Get clocks by index */
+	hw1 = of_clk_get_hw(ctx->cons_np, 0, NULL);
+	KUNIT_EXPECT_NOT_ERR_OR_NULL(test, hw1);
+
+	hw2 = of_clk_get_hw(ctx->cons_np, 1, NULL);
+	KUNIT_EXPECT_NOT_ERR_OR_NULL(test, hw2);
+	KUNIT_EXPECT_PTR_NE(test, hw1, hw2);
+
+	/* Get clocks by name */
+	hw3 = of_clk_get_hw(ctx->cons_np, 0, "first_clock");
+	KUNIT_EXPECT_NOT_ERR_OR_NULL(test, hw3);
+	KUNIT_EXPECT_PTR_EQ(test, hw1, hw3);
+
+	hw4 = of_clk_get_hw(ctx->cons_np, 0, "second_clock");
+	KUNIT_EXPECT_NOT_ERR_OR_NULL(test, hw4);
+	KUNIT_EXPECT_PTR_EQ(test, hw2, hw4);
+}
+
+/* Test DT phandle lookups using wrong index or name fail */
+static void clk_parse_clkspec_with_incorrect_index_and_name(struct kunit *test)
+{
+	struct clk_parse_clkspec_ctx *ctx = test->priv;
+	struct clk_hw *hw;
+
+	/* Get clock by index */
+	hw = of_clk_get_hw(ctx->cons_np, 2, NULL);
+	KUNIT_EXPECT_TRUE(test, IS_ERR(hw));
+
+	/* Get clock by name */
+	hw = of_clk_get_hw(ctx->cons_np, 0, "third_clock");
+	KUNIT_EXPECT_TRUE(test, IS_ERR(hw));
+}
+
+static struct kunit_case clk_parse_clkspec_test_cases[] = {
+	KUNIT_CASE(clk_parse_clkspec_with_correct_index_and_name),
+	KUNIT_CASE(clk_parse_clkspec_with_incorrect_index_and_name),
+	{}
+};
+
+/* Test suite to verify clk_parse_clkspec() */
+static struct kunit_suite clk_parse_clkspec_test_suite = {
+	.name = "clk_parse_clkspec",
+	.init = clk_parse_clkspec_init,
+	.exit = clk_parse_clkspec_exit,
+	.test_cases = clk_parse_clkspec_test_cases,
+};
 
 kunit_test_suites(
 	&clk_assigned_rates_suite,
 	&clk_hw_get_dev_of_node_test_suite,
+	&clk_parse_clkspec_test_suite,
 	&clk_leaf_mux_set_rate_parent_test_suite,
 	&clk_test_suite,
 	&clk_multiple_parents_mux_test_suite,
@@ -3562,4 +3678,5 @@ kunit_test_suites(
 	&clk_uncached_test_suite,
 );
 MODULE_DESCRIPTION("Kunit tests for clk framework");
+MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/clk/kunit_clk_parse_clkspec.dtso b/drivers/clk/kunit_clk_parse_clkspec.dtso
new file mode 100644
index 000000000000..c93feb93e101
--- /dev/null
+++ b/drivers/clk/kunit_clk_parse_clkspec.dtso
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	kunit_clock_provider1: kunit-clock-provider1 {
+		compatible = "test,clock-provider1";
+		#clock-cells = <1>;
+	};
+
+	kunit_clock_provider2: kunit-clock-provider2 {
+		compatible = "test,clock-provider2";
+		#clock-cells = <1>;
+	};
+
+	kunit-clock-consumer {
+		compatible = "test,clock-consumer";
+		clocks = <&kunit_clock_provider1 0>, <&kunit_clock_provider2 0>;
+		clock-names = "first_clock", "second_clock";
+	};
+};

-- 
2.54.0

