Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D49F389DF3
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Mar 2026 19:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774639967; cv=none; b=Inxq01NJNx8gvuEs4Xpl5rgllkRuZp+7uzHjhpJnhJ0dzdCP4OllWc7BR+EEw5PO+nxcKo04BqdW3l7GA79658WpjvUyoQMOxeqLA5zvaGFaHP2oEuoMQ1vjIjYi6t/+GMYjCJO67CCICbJXlIqe7XfffD3IyM1Ri3Cv/uplWe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774639967; c=relaxed/simple;
	bh=RGguDxs0mpixqcCPoxM/eD7hdhypb/MfsPjPm5+1CyE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EA2/DfmXoNiP1L46Y7SmMHMY/brAaKPAtPVC6/LAjJTv5OMzEZUdN5GrQNOOfxt0loICxWBo+7mp+0GuUhpEAtoXLIlKtJUsgkHhlSreoB++ddhCwWwrT4aYnNzhHJbpbFeUYC0LQFHL7qG/QczJj+hCFKzITFvvNhHO8Iqm3B8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Pv/ZOz5K; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=kBklNiQ5; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Pv/ZOz5K";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="kBklNiQ5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774639955;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5VTZSuhR1jCaLjcqylqIXA7GgBv7DZmHs0Ejxquvhuk=;
	b=Pv/ZOz5KSp4j/nzrzie5CWRayssOSQ3evOYqeWk6XTnlLao3haYJRhcJWPuxgZbTx+qK71
	+XTbHKoAllpkEfpTU29td/s86d75eKeH6cmF1acxuLMBl6Az6o1jAGxKneG/f9KV+9o2vC
	Y1EsIK0Cg3S5bDn2Bk43aKlrJZQ0Rk8=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-562-vytqZQ4eOdqTlt3gbjBFpw-1; Fri, 27 Mar 2026 15:32:33 -0400
X-MC-Unique: vytqZQ4eOdqTlt3gbjBFpw-1
X-Mimecast-MFC-AGG-ID: vytqZQ4eOdqTlt3gbjBFpw_1774639953
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5094741c1c1so58173821cf.1
        for <linux-kselftest@vger.kernel.org>; Fri, 27 Mar 2026 12:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774639953; x=1775244753; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5VTZSuhR1jCaLjcqylqIXA7GgBv7DZmHs0Ejxquvhuk=;
        b=kBklNiQ5dPpC6UAzKm//CWB5oV/NEkjTQdnW76IMZieC1bdzjt9ZCIl72rRx7PU23X
         Tlf9qZTaaD+rEHkgXqWmI2Xw1SMEzclqYlavTsxLvUHlzqpricLV568PGqrHl5pJz0EV
         SXCKOqtLDCluc6rc+kGIN42wJyKtTBQrzT6AvvcG3EqtzBqQ7xlV6Jqz6RMJfpvpvvTh
         TAt4ZlWlOgIbqmdWt67gFMFdyvtuvDig8OlF0QJjGM/AAdcvgdW36IKx47PkVYSc1oC1
         rpjfbrvkWfGSMsA1COENsoXuJdreDIkb8bjioH02C+/aIRmVCDAhvn6ZdnB7zb40hjz1
         gHEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774639953; x=1775244753;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5VTZSuhR1jCaLjcqylqIXA7GgBv7DZmHs0Ejxquvhuk=;
        b=JJJ5dNMxXKytsxQszshEX8gCqfSYKavPP//zLgg/jSWzV2AgXfZY/GTgcVMUgH2v/X
         v6qUXq0wv2Uu1VzfEWvtQHgSt512do+wXAROHFhNbwoDE5+5kGRrIFhUCn4QeelyyvFU
         lbQm9KtDDldRwjh0d2XqIlJEv9k6TyZ7xCRuyVrO30XIeDR/YX+S1eFUctLYQDzXQLAz
         MsXvMinFRbt3l51Q3SM1kTbuCdKdnwZ5jtfUC5z05LUl+AWzZ6NtMcBgDrAcNfxj6GpI
         O5+Z28WWn609R65KRMO5FEzDTm09aahxsQ6NlYkujfaBrKaUlSu15eCRkPBPVfVXcvm8
         VRXg==
X-Forwarded-Encrypted: i=1; AJvYcCXAzwOqZjlBmwYTr3qg9VnxXa8OR4LAbA/SU1lhwFNqafz5imjpyXNmEkAB/G4os7oONoZNNsAerMcaFmUfp5Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYtGm1bZlq+e5v1EVoXuueQKdfohtR4/151Ph7mfDDhWhd0Zw9
	msI5OouOjyWcXScFvPkR8oZd1nKrf/10JB4P6og93poLy7eB3kUmF9j2xhcg1dgQBac4VDrImIj
	LwlybN7GskBYYFXGWHskyPB+EQXItIl5fRC6zV1wIrwzG7Kaw1IYaRenIIVPZgh65/pKy/jBm0d
	ww1NSZwz9E1dPg8bTmCzgDllpXQWU+3q1lpySHZamZvjkXV+fhqcRG
X-Gm-Gg: ATEYQzzSp1z1GWPOD5sXmV0kah68jx7LZqrGR0VOuSwBxHssY4OIxc/pwKvaD6S60Ri
	z8qcKlPr9ZafdlCOQem1wEEHsP0EYjs8z6Xm5zE4dYdhOgoQnFhZN//MEWN2rwX73PuXLuxiTBt
	6vBRwUY/yReXkISclkisBOnnymjC0TIlt1me+gjrR8GxeNQA4nYQhlnxLksOvnIEZypl5rNHVu0
	dwqJimW5STcc9UP/+ydWXbLg6gjbuBPX5zdG1Ryz3SZLPMHTRODCxtHTSM1eFg/q6dIDNlshSlb
	SXtcrGGynh4lJe/2qO73SoLc8qDHH6FZ9FcJQU6NBKQ5/NWiJF6XUf3bGyHIjOS2r3us74Cb2Cs
	AZXeu9s231T9D578g8rCYXtxTMaK03RLxkhgolWe7wGd3ZW1Hg3AISDzFnaqs
X-Received: by 2002:ac8:58cc:0:b0:50b:3a6d:db4b with SMTP id d75a77b69052e-50ba39a8fb9mr56434641cf.55.1774639953215;
        Fri, 27 Mar 2026 12:32:33 -0700 (PDT)
X-Received: by 2002:ac8:58cc:0:b0:50b:3a6d:db4b with SMTP id d75a77b69052e-50ba39a8fb9mr56434071cf.55.1774639952639;
        Fri, 27 Mar 2026 12:32:32 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50bb2c678e9sm2037551cf.6.2026.03.27.12.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 12:32:31 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 27 Mar 2026 15:32:02 -0400
Subject: [PATCH v8 7/8] clk: divider: test: introduce additional test case
 showing v2 rate change + LCM parent
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-clk-scaling-v8-7-86cd0aba3c5f@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4963; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=RGguDxs0mpixqcCPoxM/eD7hdhypb/MfsPjPm5+1CyE=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDKP3XZ8V+pxWX/lDFF1hWf/tpc23uz1VNu63E5XsDX5q
 G/qozqxjlIWBjEuBlkxRZYluUYFEamrbO/d0WSBmcPKBDKEgYtTACbyzJXhf+lN57V2UoveTTyT
 73b3THNNQw7nPpYZzYGJR96XH1/lIM3wi2nPg3L55yLvtxtMbnu2K6TugxvPy+KwSp6spktKUU/
 7mAE=
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
index f1ba15f3646ae501c940b82f0522eeee7831492a..b55c822dfff018452f0a3acd4ad7ccec6f1259d4 100644
--- a/drivers/clk/clk-divider_test.c
+++ b/drivers/clk/clk-divider_test.c
@@ -115,6 +115,18 @@ clk_rate_change_divider_test_lcm_ops_v1_params[] = {
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
@@ -183,6 +195,11 @@ static void clk_test_rate_change_divider_1(struct kunit *test)
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
@@ -252,6 +269,39 @@ static void clk_test_rate_change_divider_3_v1(struct kunit *test)
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
@@ -259,6 +309,10 @@ static struct kunit_case clk_rate_change_divider_cases[] = {
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

