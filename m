Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93183859D2
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Mar 2026 19:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774639958; cv=none; b=Eya7W0U5cNTK/7RNqz5i0Z290z/5J0vSq5F3ju/O7takndMdpnTA6F8lpvqvlwcO35oUmPlA4fhTyp8FS4EdsYR5zbixcnH3cTxPkI1i+eba0a4YT8aoTYMLlCPx/aoxDbFj1PeElt4apjuZ6vx6jt7Iv5srAkwztuaYX/y3TZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774639958; c=relaxed/simple;
	bh=+oyzTK+Lzg1CH5uGIexIXBHcxdz6QmRjhgU0olx27d8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P294QJNtItsAk5u+jpTVatEpBogpLlLXUQZah7SkcQYt9m4YWzmHyMejF62XBRWBCpMMKDQIpCXrXmumC00qfw22dC144GkBmwFPUqgo/ZkBfVyRYHYcKgGVgRIxq1/K5wlyi1KiEENqcyxFq7zk0SnoKADkurRbny6n5b3uDmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VAEbgEjI; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=E7VrnKZX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VAEbgEjI";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="E7VrnKZX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774639946;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D4rHK7N03N+GX4GgIZ28PEqRp6DerPaMYvqotKrZvB0=;
	b=VAEbgEjIakwbflbNfBhZKxcAOYpi8SsBXbrYxPqvH9KAE+cqJ+XnJR8aaTl9DZrG7CJXw7
	kEBjXVRqe4a8TsoNn972Pg1QgFmM2Yy0Y+OSwvOIPA1UI1qG/fVEndby2jSwC9T+0vVh1f
	AnaxCaj7TXyskkG0vA/C8SixIGfpkpE=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-341-vzyHxMx9Oxi4gLCfxhINTQ-1; Fri, 27 Mar 2026 15:32:25 -0400
X-MC-Unique: vzyHxMx9Oxi4gLCfxhINTQ-1
X-Mimecast-MFC-AGG-ID: vzyHxMx9Oxi4gLCfxhINTQ_1774639945
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b802961ecso33778981cf.1
        for <linux-kselftest@vger.kernel.org>; Fri, 27 Mar 2026 12:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774639945; x=1775244745; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D4rHK7N03N+GX4GgIZ28PEqRp6DerPaMYvqotKrZvB0=;
        b=E7VrnKZXVLiSDWujqaw9usSZZYNQ/h6jdBUJKxocFLATrw1geF/gx6Df5Erlg7XGr9
         AhW/0Syema3vQ8vRUoTSQsEQ2Lvp96XfpRnkD4R8KSks47CwVjjBUStMszkCI9ELrHSL
         nejkOdCelg0yZ1cfQDdPMWUV6heO/dz3QTTv+snRdKHjB/MAalKy/ycD0zf8pMnzpmgy
         Gr15eL37rPTiiUngZLrx3NjqVHByv/exmDdHpWTFHKo8cu3MjWQV7d7WKQ0Q5+WdycaH
         NtbK2c8rkvHaWR6pO+dDVjJFh9WbfFO2r+UmJ1fdQOHDNrCcwl0YjMpMLs1PhTJbF7If
         3U1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774639945; x=1775244745;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=D4rHK7N03N+GX4GgIZ28PEqRp6DerPaMYvqotKrZvB0=;
        b=DFwuD84lKvjBg18G1CZGc+LmLu0wkuL1XL7ZYfrgulw8IgCtj6HdEK7SfffUw9HfOB
         QTq1IFq4XizepTvLwTVoMOWoXi0L6zMu6VHKQyY9klm5dZ9uXFMwVTY3SLCjh36Sp2iu
         K5PmcTpgLVTy2c6TlI3cGaxKnrA5b0zTrUQtQpddZ9OwHOl8FHP+Ct0GNmuvZgTDeWxV
         /3KGywV04/zR4gR1by3Z08R9vmEjDgu8uB+N0Udhr+TlaMk2++uPITRdXk6QePC4Qb3B
         2XpakDYb0ayOXl9rXIX+kLnoJH3IuG7t/Mm8jvF9fKeQ8YAFq1AbTszt6i2cdHO4483h
         cjrw==
X-Forwarded-Encrypted: i=1; AJvYcCWNbfReVqm2ff+yC1p3IBYK1i3LyTujB6iA/PvKKfcnoFlVI2eIdIXuQuVQSxmgSsxaHqANJgYPDgDVSjLpB1s=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZIDuOqTNsqQZpC8XtXkqrdLs2RuTfwITHz8vtqeOKnhYeiw+y
	SnDDNANonNfBCZLYKvwiRG3+odjCXQMcvrn5Zhp/EOyQQaveGIngNf5kSEsQvZlVpNSYpgQuf13
	KxU7RS/NBlQCOx74msKPi4WubHd40DLHXkhU8e//WAFG5D4N6Eg6/XaJUFDSzwQYHbcNdpZZGr1
	PgWFM6LIcBuqwCza0qIQNdvCDQfWedXN45B2HDWM0q/aiVQv1mKh+r
X-Gm-Gg: ATEYQzw6u8fD/8DPixk4sHRphM9nQve6KD5rvFJEkGiEx/u9wPcyDnGU2Pdxq9yyXzF
	8u3TniqQ+LSt+uLsgfHW6C+HxxTSccYzavgtqMvoh9Ab7jPC+XJWDPPBGnmZEpuTBvcjMVsfhjp
	mpFg1kc+KCfL6pJEvhVVSCW9DBd5/MDmzpi2k11IFdO9arr3npV7Nl2uUeOCO58aXx3F6XuCTsO
	n4eB+HbhRibw4MhuUxF/xx9bZhEG265H5hF+QDEYDd/DBEowVHDlJhNf5NBy1e8XosxfcIqI2WS
	zKcnAe4hSl0diLxw+fWA4EDPMld6AwI93cG0Zw3EDKmMBxrJf5kheZHM0JXW5cRjxkMYxfpJcBw
	z4ffTxTl3lns7bG2nrsjTAoxf71zqC+17rR/E7jT8ura/w1SMdAKvaI2p1xnI
X-Received: by 2002:a05:622a:4d09:b0:50b:52ee:62b5 with SMTP id d75a77b69052e-50ba391933emr53064131cf.41.1774639944699;
        Fri, 27 Mar 2026 12:32:24 -0700 (PDT)
X-Received: by 2002:a05:622a:4d09:b0:50b:52ee:62b5 with SMTP id d75a77b69052e-50ba391933emr53063401cf.41.1774639944011;
        Fri, 27 Mar 2026 12:32:24 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50bb2c678e9sm2037551cf.6.2026.03.27.12.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 12:32:23 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 27 Mar 2026 15:31:57 -0400
Subject: [PATCH v8 2/8] clk: divider: introduce divider kunit tests
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-clk-scaling-v8-2-86cd0aba3c5f@redhat.com>
References: <20260327-clk-scaling-v8-0-86cd0aba3c5f@redhat.com>
In-Reply-To: <20260327-clk-scaling-v8-0-86cd0aba3c5f@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Alberto Ruiz <aruiz@redhat.com>, 
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
 Rae Moar <raemoar63@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10856; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=+oyzTK+Lzg1CH5uGIexIXBHcxdz6QmRjhgU0olx27d8=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDKP3bZTT55xze3tG0NGh9DbS81ep1ZeMrzsbljyad43H
 tvHUYtVOkpZGMS4GGTFFFmW5BoVRKSusr13R5MFZg4rE8gQBi5OAZjIPzWGf9oHG9Y0T7Z3uund
 brAvjDdc6fUVNR4rdbPZWWvfLvIL/sLIsEWg/vcH1qcHXr7+UN0hf3DSnzf7frOf+TWNPZftaY/
 QLnYA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Introduce some kunit tests for the generic clk-divider.c implementation.
This test suite demonstrates the current behavior of how a clock can
unknowingly change the rate of it's siblings. Some boards are
unknowingly dependent on this behavior, and per discussions at the
2025 Linux Plumbers Conference in Tokyo, we can't break the existing
behavior. So let's add kunit tests with the current behavior so that we
can be made aware if that functionality changes in the future.

The tests in this commit use the following simplified clk tree with
the initial state:

                     parent
                     24 MHz
                    /      \
              child1        child2
              24 MHz        24 MHz

child1 and child2 both divider-only clocks that have CLK_SET_RATE_PARENT
set, and the parent is capable of achieving any rate.

For consistency with clk-fixed-rate_test.c and
drivers/clk/clk-gate_test.c, the divider tests are setup as it's own
separate kernel module.

Link: https://lore.kernel.org/linux-clk/aUSWU7UymULCXOeF@redhat.com/
Link: https://lpc.events/event/19/contributions/2152/
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/.kunitconfig       |   1 +
 drivers/clk/Kconfig            |   7 ++
 drivers/clk/Makefile           |   1 +
 drivers/clk/clk-divider_test.c | 212 +++++++++++++++++++++++++++++++++++++++++
 4 files changed, 221 insertions(+)

diff --git a/drivers/clk/.kunitconfig b/drivers/clk/.kunitconfig
index 8a0ea41934a2100e1bb1521ce3ad490baec76ec2..ea05b9a28c8000c647c76c4adf813da97c500ab6 100644
--- a/drivers/clk/.kunitconfig
+++ b/drivers/clk/.kunitconfig
@@ -4,6 +4,7 @@ CONFIG_OF=y
 CONFIG_OF_OVERLAY=y
 CONFIG_COMMON_CLK=y
 CONFIG_CLK_KUNIT_TEST=y
+CONFIG_CLK_DIVIDER_KUNIT_TEST=y
 CONFIG_CLK_FIXED_RATE_KUNIT_TEST=y
 CONFIG_CLK_GATE_KUNIT_TEST=y
 CONFIG_CLK_FD_KUNIT_TEST=y
diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 8cc300b90b5fd9fb38ce94fcb1098810c3f52c36..ba4af56949e39249652fc414eb23b44aee1d37f5 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -550,6 +550,13 @@ config CLK_KUNIT_TEST
 	help
 	  Kunit tests for the common clock framework.
 
+config CLK_DIVIDER_KUNIT_TEST
+	tristate "Basic divider clk type KUnit test" if !KUNIT_ALL_TESTS
+	depends on KUNIT && CLK_KUNIT_TEST
+	default KUNIT_ALL_TESTS
+	help
+	  KUnit tests for the basic divider clk type.
+
 config CLK_FIXED_RATE_KUNIT_TEST
 	tristate "Basic fixed rate clk type KUnit test" if !KUNIT_ALL_TESTS
 	depends on KUNIT
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index f52cf3ac64fcce7e20f3fd91f837c5096375521a..f11d37cb09423b914d7653fa4c3fa17370430aa7 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -21,6 +21,7 @@ clk-test-y			:= clk_test.o \
 				   kunit_clk_hw_get_dev_of_node.dtbo.o \
 				   kunit_clk_parent_data_test.dtbo.o
 obj-$(CONFIG_COMMON_CLK)	+= clk-divider.o
+obj-$(CONFIG_CLK_DIVIDER_KUNIT_TEST) += clk-divider_test.o
 obj-$(CONFIG_COMMON_CLK)	+= clk-fixed-factor.o
 obj-$(CONFIG_COMMON_CLK)	+= clk-fixed-rate.o
 obj-$(CONFIG_CLK_FIXED_RATE_KUNIT_TEST)	+= clk-fixed-rate-test.o
diff --git a/drivers/clk/clk-divider_test.c b/drivers/clk/clk-divider_test.c
new file mode 100644
index 0000000000000000000000000000000000000000..0991bd865da03c1e42f154b25a7f1b5760dff3c5
--- /dev/null
+++ b/drivers/clk/clk-divider_test.c
@@ -0,0 +1,212 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Kunit tests for clk divider
+ */
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/platform_device.h>
+#include <linux/units.h>
+
+#include <kunit/clk.h>
+#include <kunit/test.h>
+
+/* 4 ought to be enough for anybody */
+#define CLK_DUMMY_DIV_WIDTH 4
+#define CLK_DUMMY_DIV_FLAGS (CLK_DIVIDER_ONE_BASED | CLK_DIVIDER_ROUND_CLOSEST)
+
+struct clk_dummy_div {
+	struct clk_hw hw;
+	unsigned int div;
+};
+
+static unsigned long clk_dummy_div_recalc_rate(struct clk_hw *hw,
+					       unsigned long parent_rate)
+{
+	struct clk_dummy_div *div = container_of(hw, struct clk_dummy_div, hw);
+
+	return divider_recalc_rate(hw, parent_rate, div->div, NULL,
+				   CLK_DUMMY_DIV_FLAGS, CLK_DUMMY_DIV_WIDTH);
+}
+
+static int clk_dummy_div_determine_rate(struct clk_hw *hw,
+					struct clk_rate_request *req)
+{
+	if (!(clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT) && req->best_parent_rate < req->rate)
+		return -EINVAL;
+
+	return divider_determine_rate(hw, req, NULL, CLK_DUMMY_DIV_WIDTH, CLK_DUMMY_DIV_FLAGS);
+}
+
+static int clk_dummy_div_set_rate(struct clk_hw *hw, unsigned long rate,
+				  unsigned long parent_rate)
+{
+	struct clk_dummy_div *div = container_of(hw, struct clk_dummy_div, hw);
+	int ret;
+
+	ret = divider_get_val(rate, parent_rate, NULL, CLK_DUMMY_DIV_WIDTH,
+			      CLK_DUMMY_DIV_FLAGS);
+	if (ret < 0)
+		return ret;
+
+	div->div = ret;
+
+	return 0;
+}
+
+static const struct clk_ops clk_dummy_div_ops = {
+	.recalc_rate = clk_dummy_div_recalc_rate,
+	.determine_rate = clk_dummy_div_determine_rate,
+	.set_rate = clk_dummy_div_set_rate,
+};
+
+struct clk_rate_change_divider_context {
+	struct clk_dummy_context parent;
+	struct clk_dummy_div child1, child2;
+	struct clk *parent_clk, *child1_clk, *child2_clk;
+};
+
+struct clk_rate_change_divider_test_param {
+	const char *desc;
+	const struct clk_ops *ops;
+	unsigned int extra_child_flags;
+};
+
+static const struct clk_rate_change_divider_test_param
+clk_rate_change_divider_test_regular_ops_params[] = {
+	{
+		.desc = "regular_ops",
+		.ops = &clk_dummy_div_ops,
+		.extra_child_flags = 0,
+	},
+};
+
+KUNIT_ARRAY_PARAM_DESC(clk_rate_change_divider_test_regular_ops,
+		       clk_rate_change_divider_test_regular_ops_params, desc)
+
+static int clk_rate_change_divider_test_init(struct kunit *test)
+{
+	const struct clk_rate_change_divider_test_param *param = test->param_value;
+	struct clk_rate_change_divider_context *ctx;
+	int ret;
+
+	ctx = kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+	test->priv = ctx;
+
+	ctx->parent.hw.init = CLK_HW_INIT_NO_PARENT("parent", &clk_dummy_rate_ops, 0);
+	ctx->parent.rate = 24 * HZ_PER_MHZ;
+	ret = clk_hw_register_kunit(test, NULL, &ctx->parent.hw);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ctx->child1.hw.init = CLK_HW_INIT_HW("child1", &ctx->parent.hw,
+					     param->ops,
+					     CLK_SET_RATE_PARENT | param->extra_child_flags);
+	ctx->child1.div = 1;
+	ret = clk_hw_register_kunit(test, NULL, &ctx->child1.hw);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ctx->child2.hw.init = CLK_HW_INIT_HW("child2", &ctx->parent.hw,
+					     param->ops,
+					     CLK_SET_RATE_PARENT | param->extra_child_flags);
+	ctx->child2.div = 1;
+	ret = clk_hw_register_kunit(test, NULL, &ctx->child2.hw);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ctx->parent_clk = clk_hw_get_clk_prepared_enabled_kunit(test, &ctx->parent.hw, __func__);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx->parent_clk);
+
+	ctx->child1_clk = clk_hw_get_clk_prepared_enabled_kunit(test, &ctx->child1.hw, __func__);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx->child1_clk);
+
+	ctx->child2_clk = clk_hw_get_clk_prepared_enabled_kunit(test, &ctx->child2.hw, __func__);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx->child2_clk);
+
+	return 0;
+}
+
+/*
+ * Test that, for a parent with two divider-only children with CLK_SET_RATE_PARENT set
+ * and one requests a rate compatible with the existing parent rate, the parent and
+ * sibling rates are not affected.
+ */
+static void clk_test_rate_change_divider_1(struct kunit *test)
+{
+	struct clk_rate_change_divider_context *ctx = test->priv;
+	int ret;
+
+	KUNIT_ASSERT_EQ(test, clk_get_rate(ctx->parent_clk), 24 * HZ_PER_MHZ);
+	KUNIT_ASSERT_EQ(test, clk_get_rate(ctx->child1_clk), 24 * HZ_PER_MHZ);
+	KUNIT_EXPECT_EQ(test, ctx->child1.div, 1);
+	KUNIT_ASSERT_EQ(test, clk_get_rate(ctx->child2_clk), 24 * HZ_PER_MHZ);
+	KUNIT_EXPECT_EQ(test, ctx->child2.div, 1);
+
+	ret = clk_set_rate(ctx->child1_clk, 6 * HZ_PER_MHZ);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->parent_clk), 24 * HZ_PER_MHZ);
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child1_clk), 6 * HZ_PER_MHZ);
+	KUNIT_EXPECT_EQ(test, ctx->child1.div, 4);
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child2_clk), 24 * HZ_PER_MHZ);
+	KUNIT_EXPECT_EQ(test, ctx->child2.div, 1);
+}
+
+/*
+ * Test that, for a parent with two divider-only children with CLK_SET_RATE_PARENT
+ * set and one requests a rate incompatible with the existing parent rate, the
+ * sibling rate is also affected. This preserves existing behavior in the clk
+ * core that some drivers may be unknowingly dependent on.
+ */
+static void clk_test_rate_change_divider_2_v1(struct kunit *test)
+{
+	struct clk_rate_change_divider_context *ctx = test->priv;
+	int ret;
+
+	KUNIT_ASSERT_EQ(test, clk_get_rate(ctx->parent_clk), 24 * HZ_PER_MHZ);
+	KUNIT_ASSERT_EQ(test, clk_get_rate(ctx->child1_clk), 24 * HZ_PER_MHZ);
+	KUNIT_EXPECT_EQ(test, ctx->child1.div, 1);
+	KUNIT_ASSERT_EQ(test, clk_get_rate(ctx->child2_clk), 24 * HZ_PER_MHZ);
+	KUNIT_EXPECT_EQ(test, ctx->child2.div, 1);
+
+	ret = clk_set_rate(ctx->child1_clk, 32 * HZ_PER_MHZ);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	/*
+	 * The last sibling rate change is the one that was successful, and
+	 * wins. The parent, and two children are all changed to 32 MHz. This
+	 * keeps the long-standing behavior of the clk core that some drivers
+	 * may be unknowingly dependent on.
+	 */
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->parent_clk), 32 * HZ_PER_MHZ);
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child1_clk), 32 * HZ_PER_MHZ);
+	KUNIT_EXPECT_EQ(test, ctx->child1.div, 1);
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child2_clk), 32 * HZ_PER_MHZ);
+	KUNIT_EXPECT_EQ(test, ctx->child2.div, 1);
+}
+
+static struct kunit_case clk_rate_change_divider_cases[] = {
+	KUNIT_CASE_PARAM(clk_test_rate_change_divider_1,
+			 clk_rate_change_divider_test_regular_ops_gen_params),
+	KUNIT_CASE_PARAM(clk_test_rate_change_divider_2_v1,
+			 clk_rate_change_divider_test_regular_ops_gen_params),
+	{}
+};
+
+/*
+ * Test suite that creates a parent with two divider-only children, and
+ * documents the behavior of what happens to the sibling clock when one child
+ * changes its rate.
+ */
+static struct kunit_suite clk_rate_change_divider_test_suite = {
+	.name = "clk-rate-change-divider",
+	.init = clk_rate_change_divider_test_init,
+	.test_cases = clk_rate_change_divider_cases,
+};
+
+kunit_test_suites(
+	&clk_rate_change_divider_test_suite,
+);
+
+MODULE_DESCRIPTION("Kunit tests for clk divider");
+MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING");
+MODULE_LICENSE("GPL");

-- 
2.53.0

