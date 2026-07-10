Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC02A37BE85;
	Fri, 10 Jul 2026 18:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783707757; cv=none; b=S1tOf1wO+GU9ocXcmUn2zUB4B1eqk5wjKybsrjXnYfvQeFzT+ANrbA72ERk02W0sE69TW2/cjF/HHuFNGyNDIxfIvpZbhMBkwK25Qzi9PtVXe3s7jy46Ur4wu85ItzYPcpWhi0a+pRRH09kYK3I5TuEFsZG/yJWdWN2Kq5hrpRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783707757; c=relaxed/simple;
	bh=aL5KpwDXKi8VU01kD3qwRMt9USXGuVQTzWDGskskP9o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E1BMPV7G763e7+w1+yE/ahyx1Ia10t2KcWv0FmM/uaaGK9vfLUFPpCdD5phPsXWbesp7OZz/droJ5Di/ZZ7XVUD1dTXU4rvDd0W56Bb4Mi1EFrPcngUZjoa4bVVzXx5jbpKsTJ/sIHnxmJLDnbgRLKOim++C3q9nfaQ+fznN18w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=sOHuIbBX; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="sOHuIbBX"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 863DBC2C650;
	Fri, 10 Jul 2026 18:22:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A261560342;
	Fri, 10 Jul 2026 18:22:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2477211BD2C25;
	Fri, 10 Jul 2026 20:22:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783707751; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=5VAwh3lyqUj5Vaw5u3vKlNvlRD6QqBhxQWsMOqs917s=;
	b=sOHuIbBXCBaipjDv/q8zAe+W6BjjedimEYmrh5bBwww7ODcyXWhROdlp1SH+Njcucd3i3q
	5H0u8yID9sIQH8tgI8aK9MsZRj3yPZCaBPo03JDPAm4k7amDWtt5KO9S+TN+Epd9YnvukI
	u1LlVTxWGMY/ZPbvQIsAos0dmfe2KoDre9lTs9r4FJBHLUksZRvnMH9w/kH98gFuY9m4Jn
	J4fY/hfDQHsiilw3du89pQR97zrlE4FjJbv3bvsovJJX1ZrN3fEChkBIZGCoa66P/qjkqA
	VKHuVqcz83/Avw6DPFLeZ7614OV4Z8iqwdw/SNjQBD8cdg+f6LFK5kyE4SbpIA==
From: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
Date: Fri, 10 Jul 2026 20:22:02 +0200
Subject: [PATCH v2 7/7] clk: tests: Add Kunit testing for nexus nodes
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-schneider-v7-2-rc1-eip201-upstream-v2-7-b4680787377e@bootlin.com>
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

Add a nexus node with a child requesting a mapped clock in the fake DT
overlay to verify that the parsing is also correctly working.

Suggested-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>
---
 drivers/clk/clk_kunit_helpers.c          | 31 +++++++++++++++++++++++++++++++
 drivers/clk/clk_test.c                   | 15 +++++++++++++++
 drivers/clk/kunit_clk_parse_clkspec.dtso | 10 ++++++++++
 include/kunit/clk.h                      |  2 ++
 4 files changed, 58 insertions(+)

diff --git a/drivers/clk/clk_kunit_helpers.c b/drivers/clk/clk_kunit_helpers.c
index 68a28e70bb61..151f62ab57c1 100644
--- a/drivers/clk/clk_kunit_helpers.c
+++ b/drivers/clk/clk_kunit_helpers.c
@@ -233,5 +233,36 @@ int of_clk_add_hw_provider_kunit(struct kunit *test, struct device_node *np,
 }
 EXPORT_SYMBOL_GPL(of_clk_add_hw_provider_kunit);
 
+KUNIT_DEFINE_ACTION_WRAPPER(of_node_put_wrapper, of_node_put, struct device_node *);
+
+/**
+ * of_find_node_by_name_kunit() - Test managed of_find_node_by_name()
+ * @test: The test context
+ * @from: Parent device node to start searching from, or NULL to search from root
+ * @name: The name string to match against
+ *
+ * Just like of_find_node_by_name(), except the device_noded is managed by
+ * the test case and is automatically put after the test case concludes.
+ *
+ * Return: the device_node on success or a negative errno value on failure.
+ */
+struct device_node *of_find_node_by_name_kunit(struct kunit *test, struct device_node *from,
+					       const char *name)
+{
+	struct device_node *np;
+	int ret;
+
+	np = of_find_node_by_name(from, name);
+	if (!np)
+		return NULL;
+
+	ret = kunit_add_action_or_reset(test, of_node_put_wrapper, np);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return np;
+}
+EXPORT_SYMBOL_GPL(of_find_node_by_name_kunit);
+
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("KUnit helpers for clk providers and consumers");
diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index 5f3ffda033c3..bebfd928ab36 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -3656,10 +3656,25 @@ static void of_clk_get_parent_name_gets_parent_name(struct kunit *test)
 			   of_clk_get_parent_name(ctx->cons_np, 0));
 }
 
+static void of_clk_get_hw_maps_thru_nexus(struct kunit *test)
+{
+	struct clk_parse_clkspec_ctx *ctx = test->priv;
+	struct clk_hw *expected;
+	struct device_node *np;
+
+	np = of_find_node_by_name_kunit(test, NULL, "kunit-clock-nexus-child");
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, np);
+	expected = of_clk_get_hw(ctx->cons_np, 1, NULL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, expected);
+
+	KUNIT_EXPECT_PTR_EQ(test, expected, of_clk_get_hw(np, 0, NULL));
+}
+
 static struct kunit_case clk_parse_clkspec_test_cases[] = {
 	KUNIT_CASE(clk_parse_clkspec_with_correct_index_and_name),
 	KUNIT_CASE(clk_parse_clkspec_with_incorrect_index_and_name),
 	KUNIT_CASE(of_clk_get_parent_name_gets_parent_name),
+	KUNIT_CASE(of_clk_get_hw_maps_thru_nexus),
 	{}
 };
 
diff --git a/drivers/clk/kunit_clk_parse_clkspec.dtso b/drivers/clk/kunit_clk_parse_clkspec.dtso
index c93feb93e101..a4115216d2aa 100644
--- a/drivers/clk/kunit_clk_parse_clkspec.dtso
+++ b/drivers/clk/kunit_clk_parse_clkspec.dtso
@@ -18,4 +18,14 @@ kunit-clock-consumer {
 		clocks = <&kunit_clock_provider1 0>, <&kunit_clock_provider2 0>;
 		clock-names = "first_clock", "second_clock";
 	};
+
+	kunit_clock_nexus: kunit-clock-nexus {
+		clocks = <&kunit_clock_provider2 0>;
+		clock-map = <&kunit_clock_provider2 0>;
+		#clock-cells = <0>;
+
+		kunit-clock-nexus-child {
+			clocks = <&kunit_clock_nexus>;
+		};
+	};
 };
diff --git a/include/kunit/clk.h b/include/kunit/clk.h
index f226044cc78d..ab24f7747516 100644
--- a/include/kunit/clk.h
+++ b/include/kunit/clk.h
@@ -29,5 +29,7 @@ int of_clk_hw_register_kunit(struct kunit *test, struct device_node *node,
 int of_clk_add_hw_provider_kunit(struct kunit *test, struct device_node *np,
 				 struct clk_hw *(*get)(struct of_phandle_args *clkspec, void *data),
 				 void *data);
+struct device_node *of_find_node_by_name_kunit(struct kunit *test, struct device_node *from,
+					       const char *name);
 
 #endif

-- 
2.54.0

