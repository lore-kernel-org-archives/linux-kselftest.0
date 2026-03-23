Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B1D3C7DE0
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Mar 2026 17:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774286745; cv=none; b=H7SdCligM3jAesjlxNd9+hiYbue7NGLTzV78ywqI9/rczPON6FncpRTNQSS/js8Iwycfzk1sZQSqXTAR80OMlTw/vrUiAcw1LK+j1BVzrHdLJW1QEswxuCUNpnYkNjrMXettq3X/Eio+Bh40mPmFWQvQVSLO7g7eFhcg67/TG/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774286745; c=relaxed/simple;
	bh=sdglBIrVf9XMFJdnwd7fyg9fFtXfQnVciJoWpfDXV38=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jpmBo/8+ZV2xQoDpYjOLPFuXVeUCm5HqReKtnmbDWM2mN+cYkOx8eoOvajaylYRbUidAg8Ufs1Gzhue2SGAqgyFTdGv2uToWxPpfa3r188bgpfZXVB2iKopUUj2AfZhzzqdmcbBoXpw0fNqtXjH16fzKvhd/N69MfQhI8HEQlsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ct0ExBVH; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=hyBS9JKo; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ct0ExBVH";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="hyBS9JKo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774286743;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KTykAjUDSJWq2f3i10F+kRt97VvDrBvWNt+eUgSz3Ow=;
	b=Ct0ExBVHQCfm8n+wL/Wc2RiK44Afv1DfHZ7Qwf6hjEvNHw5pS0+SlS5XuETIIY3isvw8GJ
	cXM/ONRjezilJm6TWDaXwj7DhFMCWvMDcG8aqrUwGVI/klPBaiGgJV2drUyxu8r7oYpONm
	zLk+zcqeY5cbY0IAIVrqppqwd3fUYhk=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-631-Ph1uRyLzPIG0-HUgeyznsQ-1; Mon, 23 Mar 2026 13:25:42 -0400
X-MC-Unique: Ph1uRyLzPIG0-HUgeyznsQ-1
X-Mimecast-MFC-AGG-ID: Ph1uRyLzPIG0-HUgeyznsQ_1774286741
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5091a96f0bcso176310051cf.1
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Mar 2026 10:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774286741; x=1774891541; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KTykAjUDSJWq2f3i10F+kRt97VvDrBvWNt+eUgSz3Ow=;
        b=hyBS9JKofQNjY8Y5k2GfRUwLMiqgAKpvKd8mS+vR511lz1wWKEm/wnSJQicjDWLPij
         HfCyB9ySdKQPcpZEs0KGfWDZ9mpOOcJvulrmi4fWxHWwd7gLLYjepGGbDzFiJ/h/v1sz
         8lw6CQEPe9Bqri30hcJ0ygu9druYnWBZ9ANrIkrZmyrctQvmwllwBG0Qw8rTRyvoRUq3
         OGYl0I7aMDeQMpZ7u4joj5+yG9htmfrNK06teBo//y4hHSdLE0a9gPmyZPmcytwLhPoW
         70vnDY1JPopGhj6b/3YBpy8+36ZqYJc5GmWmp5cK01dl9X5QTtzWy/jIxcIi7bDKbzcw
         1w3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774286741; x=1774891541;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KTykAjUDSJWq2f3i10F+kRt97VvDrBvWNt+eUgSz3Ow=;
        b=b0y8ijbuU77ysTFjHxVWM1yd6S211DyzlUEOkU+DM7p9WwqCyIdCGLSxTky0FfZePa
         qcHa9BG0kllq+fX1a0NNTO6p05oi9hwlO9Gy1RmnQABUJwU1eV2WIl7cxraoSLbZ799T
         Z6J+iG+YbpgkGEb9qIwDPVrKQ4Qaw2J6dnIHgCucRRkD02uKuY5XbHU3QCpIBZ3Z+z6C
         ZiE6G7naWlFVWaq40ud07MjFWgZZtoePvDEsBqH13HrbwEuIaoBfl2D7oPLhX9W1MycS
         /LQHCg+hrwbZGC7tSkLKHMGO/YieTFe+9JgBNCmltOIoq/taoV/5m8tGUb6oTfhJsSBV
         E/rw==
X-Forwarded-Encrypted: i=1; AJvYcCUAfBsJxhw/2w7uKWmT/16qzTx78RGeGMpRvpip6dr/z4hrENqwiJETTCTppVciL1WTb8gThXbmiBeWQHW1YdA=@vger.kernel.org
X-Gm-Message-State: AOJu0YydeI+J426ShzjV1DqqkqcE9xsabatmPmn7KjCj7qDSZQIjaZtd
	6dZPL+8b7krNy9G/ANGDgnSz5YGxS448hRyxBsVVj1TDOLJQ8USUHk7tp4vfn/K1enSGXU+tzEk
	TZXIHGoHcY+9IbukDkDRKPDQQFZXSER15PV+BXU2gi9S7Dlkxtt7Sy0ym8/k48nPdgiKm3A==
X-Gm-Gg: ATEYQzwnMCFOx8Rcg91vkIcuPzj3NIkn+04qcrOh3CYrUGz/Nu2qlCaeVZgRoFmiFD0
	ejH60BXWCqgFB4eGpoymOvohiaMJqMI3QvYQQ8bzLva5jZRbICW4pIuiTLVu+ZzAdpX6yhFA9G7
	SffYOcxV1z6yxbr6JPWrkZiYdeN2J8rzOdP76B0FofOrY+ArPAwN7SqwONH1FsnOHjA/HaWbKtP
	U1GvRFp7SUsP5iOSFvWiubRKRQPdIMUV/INnYCcnGR6hZHzN7AVQd57SiSLpbWtXBQ2a8Rt/VyG
	QMsXJnYOMIK/r81oZ7ZodyoGSCUv62Z3JtoRwmPEdKL0UI6kawRQ0r6q8I41GKSPVJGhY36T88P
	UNRtgrF5Dot3GGPAhqAKnF9AFh3XtQ3+DnFeV13fHxfBWZ6mzp3VxQtzjp1XV
X-Received: by 2002:ac8:59d5:0:b0:50b:559e:fb09 with SMTP id d75a77b69052e-50b559f063fmr90674161cf.11.1774286741272;
        Mon, 23 Mar 2026 10:25:41 -0700 (PDT)
X-Received: by 2002:ac8:59d5:0:b0:50b:559e:fb09 with SMTP id d75a77b69052e-50b559f063fmr90673591cf.11.1774286740676;
        Mon, 23 Mar 2026 10:25:40 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50b36e34f8bsm108249661cf.15.2026.03.23.10.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 10:25:40 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 23 Mar 2026 13:24:55 -0400
Subject: [PATCH v7 4/8] clk: divider: test: introduce additional test case
 for parent rate change
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-clk-scaling-v7-4-8e7193dc9405@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5709; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=sdglBIrVf9XMFJdnwd7fyg9fFtXfQnVciJoWpfDXV38=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIPlnc4Xbb6dWF/8pq5jOvSmEvD7SY0uueslZaR0Zh3X
 8n83SGdjlIWBjEuBlkxRZYluUYFEamrbO/d0WSBmcPKBDKEgYtTACZy/xojw881i96Ehj9tPb3k
 1LMVF5NfP5Rce0vWjo2TaeIOh/S/AY4M/5Ndsp3nLH9f9SctYEmjY5q5b3W4gdsss0MfTtxcnlz
 GwAcA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Add a test case where the parent clk rate is changed to a rate that's
acceptable to both children, however the sibling clk rate is affected.

The tests in this commit use the following simplified clk tree with
the initial state:

                     parent
                     24 MHz
                    /      \
              child1        child2
              24 MHz        24 MHz

child1 and child2 both divider-only clocks that have CLK_SET_RATE_PARENT
set, and the parent is capable of achieving any rate.

child1 requests 32 MHz, and the tree should end up with the state:

                     parent
                     96 MHz
                    /      \
              child1        child2
              32 MHz        24 MHz

However, child2 ends up with it's parent rate due to the way the clk
core currently handles rate changes.

                     parent
                     96 MHz
                    /      \
              child1        child2
              32 MHz        96 MHz
                            ^^^^^^
                            Incorrect. Should be 24 MHz.

Let's document this behavior with a kunit test since some boards are
unknowingly dependent on this behavior.

Link: https://lore.kernel.org/linux-clk/aUSWU7UymULCXOeF@redhat.com/
Link: https://lpc.events/event/19/contributions/2152/
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk-divider_test.c | 70 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/drivers/clk/clk-divider_test.c b/drivers/clk/clk-divider_test.c
index 2a01b0201e9d919c36bb70eeb21c9f4ae113254e..95a55835a29065fede0426f1c15ec158e8a703c1 100644
--- a/drivers/clk/clk-divider_test.c
+++ b/drivers/clk/clk-divider_test.c
@@ -54,6 +54,26 @@ static const struct clk_ops clk_dummy_div_ops = {
 	.set_rate = clk_dummy_div_set_rate,
 };
 
+static int clk_dummy_div_lcm_determine_rate(struct clk_hw *hw,
+					    struct clk_rate_request *req)
+{
+	struct clk_hw *parent_hw = clk_hw_get_parent(hw);
+
+	if (!(clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT) && req->best_parent_rate < req->rate)
+		return -EINVAL;
+
+	req->best_parent_rate = clk_hw_get_children_lcm(parent_hw, hw, req->rate);
+	req->best_parent_hw = parent_hw;
+
+	return divider_determine_rate(hw, req, NULL, CLK_DUMMY_DIV_WIDTH, CLK_DUMMY_DIV_FLAGS);
+}
+
+static const struct clk_ops clk_dummy_div_lcm_ops = {
+	.recalc_rate = clk_dummy_div_recalc_rate,
+	.determine_rate = clk_dummy_div_lcm_determine_rate,
+	.set_rate = clk_dummy_div_set_rate,
+};
+
 struct clk_rate_change_divider_context {
 	struct clk_dummy_context parent;
 	struct clk_dummy_div child1, child2;
@@ -78,6 +98,18 @@ clk_rate_change_divider_test_regular_ops_params[] = {
 KUNIT_ARRAY_PARAM_DESC(clk_rate_change_divider_test_regular_ops,
 		       clk_rate_change_divider_test_regular_ops_params, desc)
 
+static const struct clk_rate_change_divider_test_param
+clk_rate_change_divider_test_lcm_ops_v1_params[] = {
+	{
+		.desc = "lcm_ops_v1",
+		.ops = &clk_dummy_div_lcm_ops,
+		.extra_child_flags = 0,
+	},
+};
+
+KUNIT_ARRAY_PARAM_DESC(clk_rate_change_divider_test_lcm_ops_v1,
+		       clk_rate_change_divider_test_lcm_ops_v1_params, desc)
+
 static int clk_rate_change_divider_test_init(struct kunit *test)
 {
 	const struct clk_rate_change_divider_test_param *param = test->param_value;
@@ -197,11 +229,49 @@ static void clk_test_rate_change_divider_2_v1(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, ctx->child2.div, 1);
 }
 
+/*
+ * Test that, for a parent with two divider-only children with CLK_SET_RATE_PARENT
+ * set and one requests a rate incompatible with the existing parent rate, the
+ * sibling rate is also affected. This preserves existing behavior in the clk
+ * core that some drivers may be unknowingly dependent on. This test
+ * demonstrates that even if the clk provider picks a parent rate that's
+ * suitable for both children, the child's rate change also affects the
+ * sibling's rate with the v1 rate negotiation logic.
+ */
+static void clk_test_rate_change_divider_3_v1(struct kunit *test)
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
+	 * With LCM-based coordinated rate changes, the parent should be at
+	 * 96 MHz (LCM of 32 and 24), child1 at 32 MHz, and child2 at 24 MHz.
+	 * However, the clk core by default will clobber the sibling clk rate,
+	 * so the sibling gets the parent rate of 96 MHz.
+	 */
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->parent_clk), 96 * HZ_PER_MHZ);
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child1_clk), 32 * HZ_PER_MHZ);
+	KUNIT_EXPECT_EQ(test, ctx->child1.div, 3);
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child2_clk), 96 * HZ_PER_MHZ);
+	KUNIT_EXPECT_EQ(test, ctx->child2.div, 1);
+}
+
 static struct kunit_case clk_rate_change_divider_cases[] = {
 	KUNIT_CASE_PARAM(clk_test_rate_change_divider_1,
 			 clk_rate_change_divider_test_regular_ops_gen_params),
 	KUNIT_CASE_PARAM(clk_test_rate_change_divider_2_v1,
 			 clk_rate_change_divider_test_regular_ops_gen_params),
+	KUNIT_CASE_PARAM(clk_test_rate_change_divider_3_v1,
+			 clk_rate_change_divider_test_lcm_ops_v1_gen_params),
 	{}
 };
 

-- 
2.53.0

