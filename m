Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E113386C29
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Mar 2026 19:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774639967; cv=none; b=ZI41f29W187iQEda6CDoIINPYVR+FSq0xeN+cphdOXkLnIoW7FkujRAkYmOsyKgZgUUpCinm4PRYjMh2xagYw57R2gmCzhcIdrznNLB6NJp5hnLPIwHO2H+zm+5JgVwVA0mudZpFHAsa+hMaUAg4iuXBmkAliCrS9TgE+rH+8HM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774639967; c=relaxed/simple;
	bh=6+2kBP0xFMlyP7Rqf4y/vpPGQhqSzW8u5Cx4E55/a6I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DGbbl3HYRMqR4hqjISHlY5OLzdhw5lKVxS3D92JIrJL9nxhG7e0RVvH5CcXrT2UYfXv+0cECDD4AlblODtx2xU+UVqXlyz6we7BeSu2uKstYEa8P5Cj1lqbDjaxN8Rs0WOabzvWbDzhqOB06m/TVvRTiAKuKJH3X8B5gNZSHZt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cxhdJrrF; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=I/uQPNtu; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cxhdJrrF";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="I/uQPNtu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774639956;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F2Xju4230th3m0bCLEm7u/PVwZF8WftpyZTqnsQeR4Q=;
	b=cxhdJrrF0EJziKFThBSQQLUQMaFWbZWvnFmmP3BirpMZ33kvZjk74AGboYyHNCe3Wzr8OD
	JWYxgAtOva8xXDrE2Qcx6Pb12YXNPENMcDa4Wxq0w7tNg9ihjnO/2/Iie0GAQD+iad2DvP
	9n9ipBg0u57e3aQU5HxbpdYoRfcs3u0=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-364-EDt0m6wMNNSXtIgzZaHITw-1; Fri, 27 Mar 2026 15:32:35 -0400
X-MC-Unique: EDt0m6wMNNSXtIgzZaHITw-1
X-Mimecast-MFC-AGG-ID: EDt0m6wMNNSXtIgzZaHITw_1774639955
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b781542c1so57312751cf.1
        for <linux-kselftest@vger.kernel.org>; Fri, 27 Mar 2026 12:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774639955; x=1775244755; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F2Xju4230th3m0bCLEm7u/PVwZF8WftpyZTqnsQeR4Q=;
        b=I/uQPNtu5pkryilhGBv2We+zfqtfmphvTl/FoMLHKYV6mNSXKAbRLv+h3Z5bVnx3+/
         Dk/4kVtaNRkipAJFFykl4XLSsLByUZ0EMC0sFB78VZmwDUnIljdOYOGp1QobfM8RcQsf
         K0SznOI06v6QRGw6UFTQk8q5z+NNk6uwGUDjJnaBy62bXvEJbRyiaIIxEZpPkbkI7dj1
         m+IJXZXmFxDRI/pd8ai5RaxE85IaCS1xzmEkjKfzT5eD4LUvsHv8VhBT8okxIbqwVGsF
         e6FFm5KajO9CyKKTv0hLcsriEEzuaYc5cCDURI+SDBn6q00Lk3+WyPHbnulOej7xx4KD
         5jHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774639955; x=1775244755;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=F2Xju4230th3m0bCLEm7u/PVwZF8WftpyZTqnsQeR4Q=;
        b=ePlwp4R62wYI/HSZJcyreSHY2osB2qf8y0ZQeKJZe+j6rxReOV8uxNeaYMMyiHcBje
         YCQDx27KovYUWA1nVqDSxeUTv7ZVcqdwN8qSgHO2SpQ33OniruO7wBC2tMgoLdu7YRft
         /J2Vjk0aGTzr2rKdpyF6EAZhTYreL2xuXlrSc/HPWVmRC/1RBNxU8+Meh+VtSZhfvw4Y
         cf1Vh2/d2DUVXGdZElMo7gKWqBjrTCAsIcujqjNnmIKN1PwivChXJVB/yVeK4oAYkTb4
         rz7NYQ8dcjrCZGf8jsstqq9d7MARI8iReB0AJJpsvOl6leOzBESVkQJN5jOK4ZtAq43p
         QVWA==
X-Forwarded-Encrypted: i=1; AJvYcCVez9VG0p4AhxXwEbt2AG/BYymjZ/piHqbyAFzrdNemXp4g1l3UvJtiEgwNPStq7w6l06JasMvieE625+TuKYo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMdFNs/9MSGGV/W9yylfiE4jgoaTdBo6q7ZgG2Cp+lM4V53ivi
	nw05VQhY4TaqEr5m44wGdbY5wZZ2c0C9CWGnZNix6FNol1oDJ4EvsZPwDpaDRPDtuAb951Nfwla
	molziui14rKrwd235NGuGRgR92J4e8p3egA54QiYTbr0FwRfi+JEp9RwPKTo+lLNRIsPy0XbHjT
	+YyFbFsvk1AceAhYQEH/8SgXxBrE0u6PHTEVVn7GlQDs8mEonXEnxr
X-Gm-Gg: ATEYQzzCGZIA5kzKvbGGwh/OF70OSc+7l414nnErIQxmX9MauOBGP7CxJUd8DfZ6a1Z
	H5NQF6mlje95biFdmvCCVd1uyK01BEqkF5z+sRPK8XQwhwaYl2H+lennAxaIT1h64ZVsHOvtI0B
	OGyK0gmwFHaFeV4kthqVYZ+TQSmuMwbkfwST69txHQPeFqBC6n7Tdq/8DLNkBU0SUIxJOoIBgyp
	lgcZQZKKRRsw4qra1Af+zB8u4WOGW3f4MLELZM1mQIUa9/0gylIdm8xmWWOoNKOu33X9Js3fzAf
	aLVW5LDBypQRsnppPo7DCB1chCadoRyNGJ1sDzcsA8gR82O43hsGLbq3K25hEEJzreO1FxMMD0J
	n5L6atPwl4MlNsIo2GlzMI7uGpRcptNaZZ6nBCQvj7uxBhPBIwTgbM029Rl8P
X-Received: by 2002:a05:622a:10a:b0:50b:3d9f:3846 with SMTP id d75a77b69052e-50ba38e6dcemr49601501cf.50.1774639954724;
        Fri, 27 Mar 2026 12:32:34 -0700 (PDT)
X-Received: by 2002:a05:622a:10a:b0:50b:3d9f:3846 with SMTP id d75a77b69052e-50ba38e6dcemr49600981cf.50.1774639954182;
        Fri, 27 Mar 2026 12:32:34 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50bb2c678e9sm2037551cf.6.2026.03.27.12.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 12:32:33 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 27 Mar 2026 15:32:03 -0400
Subject: [PATCH v8 8/8] clk: divider: test: mark some tests as supporting
 only v1 negotiation
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-clk-scaling-v8-8-86cd0aba3c5f@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2823; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=6+2kBP0xFMlyP7Rqf4y/vpPGQhqSzW8u5Cx4E55/a6I=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDKP3XaK2NLdx2Ugd9FG46zFttpNfQH3G/Vtzj+auNB1b
 cSR/W0CHaUsDGJcDLJiiixLco0KIlJX2d67o8kCM4eVCWQIAxenAEwkxZuR4Z1U9auiv38O3d02
 O9fZo3DqhruMAQ9KTJxcdTcwKa9+fpmR4ezTjYt17+2Z+LzTfuKuj/7fTnyT8/fiemN2p2pjMYe
 ZNxMA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Mark the tests that only support v1 negotiation to make it clear exactly
which behavior is under test.

Link: https://lore.kernel.org/linux-clk/aUSWU7UymULCXOeF@redhat.com/
Link: https://lpc.events/event/19/contributions/2152/
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk-divider_test.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/clk/clk-divider_test.c b/drivers/clk/clk-divider_test.c
index b55c822dfff018452f0a3acd4ad7ccec6f1259d4..e985b19a2b5ea4b8e7a1ba78631f7ba3a19f625b 100644
--- a/drivers/clk/clk-divider_test.c
+++ b/drivers/clk/clk-divider_test.c
@@ -59,6 +59,15 @@ static const struct clk_ops clk_dummy_div_ops = {
 	.set_rate = clk_dummy_div_set_rate,
 };
 
+/*
+ * clk-divider.c has support for v2 rate negotiation, and setting the parent
+ * based on the LCM, however we need to be able to test just setting the parent
+ * rate based on the LCM, and not set the v2 rate negotiation flag. This is to
+ * demonstrate existing behavior in the clk core when a parent rate that's
+ * suitable for all children is selected, a sibling will still have its rate
+ * negatively affected. Some boards may be unknowingly dependent on this
+ * behavior, and we want to ensure this behavior stays the same.
+ */
 static int clk_dummy_div_lcm_determine_rate(struct clk_hw *hw,
 					    struct clk_rate_request *req)
 {
@@ -184,6 +193,7 @@ static void clk_test_rate_change_divider_1(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, ctx->child1.div, 1);
 	KUNIT_ASSERT_EQ(test, clk_get_rate(ctx->child2_clk), 24 * HZ_PER_MHZ);
 	KUNIT_EXPECT_EQ(test, ctx->child2.div, 1);
+	/* This test is expected to work with both v1 and v2 rate negotiation. */
 
 	ret = clk_set_rate(ctx->child1_clk, 6 * HZ_PER_MHZ);
 	KUNIT_ASSERT_EQ(test, ret, 0);
@@ -216,6 +226,8 @@ static void clk_test_rate_change_divider_2_v1(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, ctx->child1.div, 1);
 	KUNIT_ASSERT_EQ(test, clk_get_rate(ctx->child2_clk), 24 * HZ_PER_MHZ);
 	KUNIT_EXPECT_EQ(test, ctx->child2.div, 1);
+	KUNIT_ASSERT_FALSE(test, __clk_has_v2_negotiation(ctx->child1_clk));
+	KUNIT_ASSERT_FALSE(test, __clk_has_v2_negotiation(ctx->child2_clk));
 
 	ret = clk_set_rate(ctx->child1_clk, 32 * HZ_PER_MHZ);
 	KUNIT_ASSERT_EQ(test, ret, 0);
@@ -252,6 +264,8 @@ static void clk_test_rate_change_divider_3_v1(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, ctx->child1.div, 1);
 	KUNIT_ASSERT_EQ(test, clk_get_rate(ctx->child2_clk), 24 * HZ_PER_MHZ);
 	KUNIT_EXPECT_EQ(test, ctx->child2.div, 1);
+	KUNIT_ASSERT_FALSE(test, __clk_has_v2_negotiation(ctx->child1_clk));
+	KUNIT_ASSERT_FALSE(test, __clk_has_v2_negotiation(ctx->child2_clk));
 
 	ret = clk_set_rate(ctx->child1_clk, 32 * HZ_PER_MHZ);
 	KUNIT_ASSERT_EQ(test, ret, 0);

-- 
2.53.0

