Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40063CA487
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Mar 2026 17:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774286751; cv=none; b=JB19FzlaiYSAfP4/9FKcko/xs+CSxgoTcLkuev8OuwryU4Jma9veTtNtxLRmat3bRPXDwp3hzRJf2Vf+Z7NItrh7AXsk29tAmY9TOj90lUsgniam6RItMnQBQ7tVdRaL+j1Ecnb/3mzeiWuxYJxRGcfD7nwPf5RhcGGrrJQzvxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774286751; c=relaxed/simple;
	bh=xpGnRJHb7iFtNaWnVivX5OL5Ase55p/rrd+OZZm4p/o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oOPfvHbkT1Lrkd/91ezKuO9mNFAk8PriUXfnDRm1MDv7EkEO8jQo3OrRV/GTVlj5lazXqudLDt/V9tPckYqKcMh7KkLzWSvLZ4l+IjwTT2dR/IPhJQh0aE/nnh8tNVWbpq3bToWn34+eFSGGP5F7eb2UjsbU55c5UM5PWxLUU44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HgDgbK5s; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=nQaYAxBP; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HgDgbK5s";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="nQaYAxBP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774286748;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=34oVGrWJiWoSUSC15rXIzEcw5Hsg90ZuipTla97gnAM=;
	b=HgDgbK5sf65zVpnUQEz+Zxu1GfqFfYO6rO14j5WrsUA29MbhzGVqL3hKgS+DRBJ12eia9V
	3YD/ACuk9M1S4AD8VN2x5yuRsF5B18/EQk+ZXgXJQPEb9WHjqLC8CTtbgPi6yXzp9erOmQ
	QTrbZJ/LZ9qLjs3b+KXehcBAHJiMiQM=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-655-YvJshSKUN5usja4QRZzf3g-1; Mon, 23 Mar 2026 13:25:47 -0400
X-MC-Unique: YvJshSKUN5usja4QRZzf3g-1
X-Mimecast-MFC-AGG-ID: YvJshSKUN5usja4QRZzf3g_1774286747
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b317c40acso28442921cf.1
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Mar 2026 10:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774286747; x=1774891547; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=34oVGrWJiWoSUSC15rXIzEcw5Hsg90ZuipTla97gnAM=;
        b=nQaYAxBPSPF9+ZZnUiXj2t5lxVANqUy8NqfEVkp6a9GoegmsKuXfRn6VqufuQsT4/N
         w14sATkKSe9MhWG6KFFZH/Dl1w4ToUR11DCegY1cIhHZPy9qoUmYDefqRjLV5xtudSlt
         x1rChd+EMQqrG+BDpY2Pt+Hbv6OL56738C6ADEhoTBDyCxAeFgz4d4xBS0JPALRb1X05
         2hCsNX4/qPZG5SFQLHy2y2nzKPHAw58PZCe3lLXihU6gUAcLTduU+znMKRQ1cofm/xFE
         cITCnzNvAEU+EDrxI009d6cXc9ILWz/FXV8pc+fIowGoCpGfeRbpMnmDexINxNI8xvev
         G3VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774286747; x=1774891547;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=34oVGrWJiWoSUSC15rXIzEcw5Hsg90ZuipTla97gnAM=;
        b=JOd+bU1SV0AvMDqA6Hed4QiWwQLyy9evq8wp/PRYECuWICFmk59W5naFpD+kAeIbGT
         jXaeMtXkLw19coXwhw992Wo0JvW1JkYswbFYcxJPCxySlXNkKTWLPl/Zlf4AqIzp69zj
         LzzyOA4xCa7WaCwq/yHb627Smk85SCXxn+KCKKDTR9tSX5JsgKYpW3AJ8qPfU+Laioi9
         0HbhWf/aUccEBRKYHNDu3zFRzo18yPzSKCZlOmg/+EDb8ygVFoHJ+7Oru6c70Z+TvmKD
         kIYwP3YefnsU4vl2Zhmc1dldewnUxfFAPJZRwM4boArdgW9qufU0r25XaBhAWTWd1rc+
         zGlA==
X-Forwarded-Encrypted: i=1; AJvYcCWFembQN2YQmjOyssEQWytsj+a+GSCAQ4oFYwf1GGF/k+0dcx0KF+SRbI6Qcj+PhyTKo6bSgXsVoZXbkLRs+Zw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcZiwVXm9PPCdxHu5QP1/0olnLXuL3bUPJauWzN631pp89f/LG
	0lYo+3VSKMYTqlC0Wp7Jv235RMZsUv3VikxqPpNE94iPCEi21pisJ1KPJwmWV1DhFG2uOh28gIZ
	juC35qoJ7joqCbrJUPhyYPgP52n+hRzeF9EMqWGK0DjvOmohPFwnnZ/+Tmqf467I5setYbw==
X-Gm-Gg: ATEYQzwqW1Vyxs86AeGNMzuMRfDocVSxeiWl3Oxn1xoMQ1NKxoO6JccpSGKQ8U1ygcQ
	v5lTtN4IFH6ZIABKaL/G2N11oJvljcCvOyy+SQY+KtFG8oW0685umlIv+8yG8E1y7LcNnGSWvUf
	Rf7LCJdLtNOTfemxvCulHrYnHsCkZiLMUki4qm4IhVOMeR0QVHErNfEmkAJh6dZt39a0asAgyhe
	NVkWDiyxyXyuzkeUiCJUhOgT2Qeh8gC4HTAg34p5cIiaiOBv/tIMiGmnUzcOc+iPUe6lS+Mqv3Z
	UOzFDPGLjyfbCfGL1dsvOUhMDR6dHHrJ2NvI1AfYiOCYkjW8fvFGtYr7PKn9cGY8/j3QvKFvhQ0
	kTJYwPJp8KvbHEEpUc7yaElwPJtpCTkNyfYGNyBup6mO8HrgXV/ich3f3Bel9
X-Received: by 2002:a05:622a:1aaa:b0:50b:4dc9:347d with SMTP id d75a77b69052e-50b4dc94b6cmr116972411cf.22.1774286746723;
        Mon, 23 Mar 2026 10:25:46 -0700 (PDT)
X-Received: by 2002:a05:622a:1aaa:b0:50b:4dc9:347d with SMTP id d75a77b69052e-50b4dc94b6cmr116971871cf.22.1774286746000;
        Mon, 23 Mar 2026 10:25:46 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50b36e34f8bsm108249661cf.15.2026.03.23.10.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 10:25:45 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 23 Mar 2026 13:24:58 -0400
Subject: [PATCH v7 7/8] clk: divider: test: introduce additional test case
 showing v2 rate change + LCM parent
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-clk-scaling-v7-7-8e7193dc9405@redhat.com>
References: <20260323-clk-scaling-v7-0-8e7193dc9405@redhat.com>
In-Reply-To: <20260323-clk-scaling-v7-0-8e7193dc9405@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Alberto Ruiz <aruiz@redhat.com>, 
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
 Rae Moar <raemoar63@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4963; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=xpGnRJHb7iFtNaWnVivX5OL5Ase55p/rrd+OZZm4p/o=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIPlneVrBf/anbxvLrp4fWXtaXPbHPpk1uQ+983Mirm5
 M6fyg4iHaUsDGJcDLJiiixLco0KIlJX2d67o8kCM4eVCWQIAxenAEykiZXhfyDPpICi5rtNFU/y
 ZG9++SojKlKuoV7fXash830X2+Jl4YwMe/MZr91KfrCH66DAQZY2iUOsJVdXXGVf+Gyd5I9shgO
 ebAA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Add a test case that uses the clk divider with the v2 rate negotiation
logic, plus the Lowest Common Multiple (LCM) to calculate the optimal
parent rate. The test ensures that the parent clk rate is set to a rate
that's acceptable to both children, and the sibling clock is not
affected.

The test in this commit use the following simplified clk tree with
the initial state:

                     parent
                     24 MHz
                    /      \
              child1        child2
              24 MHz        24 MHz

child1 and child2 both divider-only clocks that have CLK_SET_RATE_PARENT
set, and the parent is capable of achieving any rate.

child1 requests 32 MHz, and the tree ends up with the correct state:

                     parent
                     96 MHz
                    /      \
              child1        child2
              32 MHz        24 MHz

Link: https://lore.kernel.org/linux-clk/aUSWU7UymULCXOeF@redhat.com/
Link: https://lpc.events/event/19/contributions/2152/
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk-divider_test.c | 54 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/drivers/clk/clk-divider_test.c b/drivers/clk/clk-divider_test.c
index 95a55835a29065fede0426f1c15ec158e8a703c1..a16c04d5d8a86952b42750d326f88754fbc91eb7 100644
--- a/drivers/clk/clk-divider_test.c
+++ b/drivers/clk/clk-divider_test.c
@@ -110,6 +110,18 @@ clk_rate_change_divider_test_lcm_ops_v1_params[] = {
 KUNIT_ARRAY_PARAM_DESC(clk_rate_change_divider_test_lcm_ops_v1,
 		       clk_rate_change_divider_test_lcm_ops_v1_params, desc)
 
+static const struct clk_rate_change_divider_test_param
+clk_rate_change_divider_test_regular_ops_v2_params[] = {
+	{
+		.desc = "regular_ops_v2",
+		.ops = &clk_dummy_div_ops,
+		.extra_child_flags = CLK_V2_RATE_NEGOTIATION,
+	},
+};
+
+KUNIT_ARRAY_PARAM_DESC(clk_rate_change_divider_test_regular_ops_v2,
+		       clk_rate_change_divider_test_regular_ops_v2_params, desc)
+
 static int clk_rate_change_divider_test_init(struct kunit *test)
 {
 	const struct clk_rate_change_divider_test_param *param = test->param_value;
@@ -196,6 +208,11 @@ static void clk_test_rate_change_divider_1(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, ctx->child2.div, 1);
 }
 
+static inline bool __clk_has_v2_negotiation(struct clk *clk)
+{
+	return clk_hw_get_flags(__clk_get_hw(clk)) & CLK_V2_RATE_NEGOTIATION;
+}
+
 /*
  * Test that, for a parent with two divider-only children with CLK_SET_RATE_PARENT
  * set and one requests a rate incompatible with the existing parent rate, the
@@ -265,6 +282,39 @@ static void clk_test_rate_change_divider_3_v1(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, ctx->child2.div, 1);
 }
 
+/*
+ * Test that, for a parent with two divider-only children with CLK_SET_RATE_PARENT
+ * set and one requests a rate incompatible with the existing parent rate, the
+ * sibling rate is not affected, and maintains it's rate when the v2 rate
+ * negotiation logic is used.
+ */
+static void clk_test_rate_change_divider_4_v2(struct kunit *test)
+{
+	struct clk_rate_change_divider_context *ctx = test->priv;
+	int ret;
+
+	KUNIT_ASSERT_EQ(test, clk_get_rate(ctx->parent_clk), 24 * HZ_PER_MHZ);
+	KUNIT_ASSERT_EQ(test, clk_get_rate(ctx->child1_clk), 24 * HZ_PER_MHZ);
+	KUNIT_EXPECT_EQ(test, ctx->child1.div, 1);
+	KUNIT_ASSERT_EQ(test, clk_get_rate(ctx->child2_clk), 24 * HZ_PER_MHZ);
+	KUNIT_EXPECT_EQ(test, ctx->child2.div, 1);
+	KUNIT_ASSERT_TRUE(test, __clk_has_v2_negotiation(ctx->child1_clk));
+	KUNIT_ASSERT_TRUE(test, __clk_has_v2_negotiation(ctx->child2_clk));
+
+	ret = clk_set_rate(ctx->child1_clk, 32 * HZ_PER_MHZ);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	/*
+	 * With LCM-based parent + v2 rate changes, the parent should be at
+	 * 96 MHz (LCM of 32 and 24), child1 at 32 MHz, and child2 at 24 MHz.
+	 */
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->parent_clk), 96 * HZ_PER_MHZ);
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child1_clk), 32 * HZ_PER_MHZ);
+	KUNIT_EXPECT_EQ(test, ctx->child1.div, 3);
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child2_clk), 24 * HZ_PER_MHZ);
+	KUNIT_EXPECT_EQ(test, ctx->child2.div, 4);
+}
+
 static struct kunit_case clk_rate_change_divider_cases[] = {
 	KUNIT_CASE_PARAM(clk_test_rate_change_divider_1,
 			 clk_rate_change_divider_test_regular_ops_gen_params),
@@ -272,6 +322,10 @@ static struct kunit_case clk_rate_change_divider_cases[] = {
 			 clk_rate_change_divider_test_regular_ops_gen_params),
 	KUNIT_CASE_PARAM(clk_test_rate_change_divider_3_v1,
 			 clk_rate_change_divider_test_lcm_ops_v1_gen_params),
+	KUNIT_CASE_PARAM(clk_test_rate_change_divider_1,
+			 clk_rate_change_divider_test_regular_ops_v2_gen_params),
+	KUNIT_CASE_PARAM(clk_test_rate_change_divider_4_v2,
+			 clk_rate_change_divider_test_regular_ops_v2_gen_params),
 	{}
 };
 

-- 
2.53.0

