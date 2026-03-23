Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54AC3CB2ED
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Mar 2026 17:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774286754; cv=none; b=OIQG8G7NiGZOXHj/rBZ+O4V2bw3kLsHaS7W5k1QDm6qHwVev8BrgQWFoCeL6M+QJdyE2nsKm4bSpUD2LYut/DyTZZ+/dbRmNX/AX2AR4YfHizCrpUC2dXcynaJq/+uXfcqvQ3S+bp3Q9gDBWYLZcxCHq53nT1Z/h9gcNG2keW0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774286754; c=relaxed/simple;
	bh=WDIE7lt2EMyOXFUD9TIulldMehjU0ziYiCpz80CIxbU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r1YzUU1wc/zaeV/SxbKf2KfMrLIzlgPaFdlYlgh/JDUqkHoOn2dqtK9jMCTdnrS3nIcfBGGcTSWzQJ79qYLkULISbv8BM4Gah3NQ81ob1n6+voIYO0N48w8chX7QMYWYdRMumv/rM4at4JAqA2QDOruLJ6Zl2NQIFmySULUSEbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=P2GZmIAi; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Z+mw5ojE; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="P2GZmIAi";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Z+mw5ojE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774286752;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z3ukp7lwYjI/rsNx0zgB5rYQ+pIaxNH93AMrhUusdCA=;
	b=P2GZmIAifwmZBoWyvbIsNxN3IFdpe5e+tW/qjfZoAc8ako12Xs5eYUMu9GEzEdKfKP8VYY
	Vc2nuvWb+9EaTV/dGf/FeDGaU9U3e8Kn6jvWlOj5bo9E8jt/ZN6EcfdVFsInv8aKweWFAu
	IYuv4Ljkaoroxj1IeCIWnlvwF2hBVBU=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-663-Kcx8NBn8MFSy4gq-XymNtA-1; Mon, 23 Mar 2026 13:25:49 -0400
X-MC-Unique: Kcx8NBn8MFSy4gq-XymNtA-1
X-Mimecast-MFC-AGG-ID: Kcx8NBn8MFSy4gq-XymNtA_1774286749
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5094741c1c1so19058371cf.1
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Mar 2026 10:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774286749; x=1774891549; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z3ukp7lwYjI/rsNx0zgB5rYQ+pIaxNH93AMrhUusdCA=;
        b=Z+mw5ojEWSaTmJ3OfOY6NJYvSXX4f7BvjJSejfP6zwMYn1ny8BpirjUrL9ebq6Qkv6
         840y7SHbpN4Y9O80gRqDOp97lDdjNTuoUOw6HF461H0tn+ad60Ysu70dDpVUFB89Z0NR
         acWNNihC2TJoO7iXmeiTpzbUZlvqx2gBDTRcXtZBzWbnB4LZQ6w5JH801zgpsYtxt6my
         QIejadYxy/WuXyEv9/c3iq241m1AWa5My9+QPIMHLVSTnlLCgM9bNFCmJDxVezgztlYC
         GzvAb5sO+uMoq6n3gtWM+BbnSz7KSfXVIN3bRnk6BMBS0LzdeZp1nAgRSZkf0zk3Bduw
         Xvgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774286749; x=1774891549;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z3ukp7lwYjI/rsNx0zgB5rYQ+pIaxNH93AMrhUusdCA=;
        b=LpquaS3I781wIciDHSm7XUeV3cMO9glYmQs9OLVL0FeFKK+bOwjPxo9TcvMPy5IkVp
         W4wc2jcjnKm/OplUanpoWPbqzUQKxzCSG1AQVXSZLI1yHloU0WlKizvI8juv2Gvzi6oN
         kLNQO90fwPogLH+vfZjrU3TmyayzjPlRjTcYGdQuZ4ecqFnioJRhqliznszYTeg+GAON
         bBw00iLdBnxZhaEkOIE7HqVjdmdZOUm4shH9JI+iCQqF3BSeZ5pLtHM7ey9ZVQewrS7a
         D/KPDebZf9D2lCT9YBgo1iBchadL4XGo7rmBhQGCpdLT9dp+wxIToZWZZD8KzxD14+4y
         B60A==
X-Forwarded-Encrypted: i=1; AJvYcCV22z0SuNu3nEvMlclIet812DjCbeVsboYDsA0FwGycz/0Bh6YOI/eYeXDMHjbM4IYS9RMiAV8tQHbW4JXCuU0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRRO3E04BID515qA5XD5shhFLogSBstxHLoMgqEp2MPPJBJkjh
	tq7vvMYKFmm7ROY9HI6iqTmBZjjA6SpqhRclmTOECCPoxdISfjjdC7PwijVGwcIf1d2zB1nAz1x
	YxYW6RWXu0zHEjw+n0IkjvYIAQ2gRBIEWrHKyx4GNcKB6ktrRM6zda2WfyowyiwQyU7yd1A==
X-Gm-Gg: ATEYQzzSHQ5ijmYKZ9PD9yS1iTOJh/SkXF4bL0CnLKDdYomyu2FS/o3kFTNE7cfLiKE
	9xGAvG8zEpggDqviQMSDGU21KJT3suCWhDIZ6v5Yf3Y56K8ULriY9IDJ0tQpIAV6ea6CQfKoVMx
	b2/FqQLHBWUBtKuGhlLzdtKndLgF/DWflBcmKGWOc8EmnOtrj9wlcYxQSaWlsiOTm71LGtNkdYa
	6jmP9+sD30dL6vC4Ovmw6Z2+FQlih+jHsguwdBET5bR3qpLzktKugsm7pVDUqKqkKOLIiK/q0RE
	+7aErC8uC79qaGAm2vw3fcZ/ZpSV4idfBY5TmVz35OqPIGoBKNRiSl+uCVqte2sRln8pMvY3H0j
	ynz92IZtO+eA1cm6biw6gncnELeVnEQx33APiFoPLmkZONbPwV+IW7rcIVu6t
X-Received: by 2002:a05:622a:1b91:b0:50b:3895:facc with SMTP id d75a77b69052e-50b38964598mr190997781cf.14.1774286748515;
        Mon, 23 Mar 2026 10:25:48 -0700 (PDT)
X-Received: by 2002:a05:622a:1b91:b0:50b:3895:facc with SMTP id d75a77b69052e-50b38964598mr190997271cf.14.1774286747947;
        Mon, 23 Mar 2026 10:25:47 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50b36e34f8bsm108249661cf.15.2026.03.23.10.25.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 10:25:47 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 23 Mar 2026 13:24:59 -0400
Subject: [PATCH v7 8/8] clk: divider: test: mark some tests as supporting
 only v1 negotiation
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-clk-scaling-v7-8-8e7193dc9405@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2824; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=WDIE7lt2EMyOXFUD9TIulldMehjU0ziYiCpz80CIxbU=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIPlnd7nekL2qX8bduML9Myd8kVr5HjsOVqK7KZxF29k
 rlZa411RykLgxgXg6yYIsuSXKOCiNRVtvfuaLLAzGFlAhnCwMUpABPpEWL4K/78FOOH2VHrQj+u
 Upsw6VKjbPkOA56bPlKvJI1/feTt72H4p1jnZVS79fZtlqqAm6tSlVaureJJenehqH12x6e6Bwc
 TmAE=
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
index a16c04d5d8a86952b42750d326f88754fbc91eb7..646307f1d78a08130a8a552b57874e21b07f7b4a 100644
--- a/drivers/clk/clk-divider_test.c
+++ b/drivers/clk/clk-divider_test.c
@@ -54,6 +54,15 @@ static const struct clk_ops clk_dummy_div_ops = {
 	.set_rate = clk_dummy_div_set_rate,
 };
 
+/*
+ * clk-divider.c has support for v2 rate negotiation, and setting the parent
+ * based on the LCM, however we need to be able to test just setting the parent
+ * rate based on the LCM, and not set the v2 rate negotiation flag. This is to
+ * demonstrate existing behavior in the clk core when a parent rate that's
+ * suitable for all children is selected, a sibling will still have it's rate
+ * negatively affected. Some boards may be unknowingly dependent on this
+ * behavior, and we want to ensure this behavior stays the same.
+ */
 static int clk_dummy_div_lcm_determine_rate(struct clk_hw *hw,
 					    struct clk_rate_request *req)
 {
@@ -197,6 +206,7 @@ static void clk_test_rate_change_divider_1(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, ctx->child1.div, 1);
 	KUNIT_ASSERT_EQ(test, clk_get_rate(ctx->child2_clk), 24 * HZ_PER_MHZ);
 	KUNIT_EXPECT_EQ(test, ctx->child2.div, 1);
+	/* This test is expected to work with both v1 and v2 rate negotiation. */
 
 	ret = clk_set_rate(ctx->child1_clk, 6 * HZ_PER_MHZ);
 	KUNIT_ASSERT_EQ(test, ret, 0);
@@ -229,6 +239,8 @@ static void clk_test_rate_change_divider_2_v1(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, ctx->child1.div, 1);
 	KUNIT_ASSERT_EQ(test, clk_get_rate(ctx->child2_clk), 24 * HZ_PER_MHZ);
 	KUNIT_EXPECT_EQ(test, ctx->child2.div, 1);
+	KUNIT_ASSERT_TRUE(test, !__clk_has_v2_negotiation(ctx->child1_clk));
+	KUNIT_ASSERT_TRUE(test, !__clk_has_v2_negotiation(ctx->child2_clk));
 
 	ret = clk_set_rate(ctx->child1_clk, 32 * HZ_PER_MHZ);
 	KUNIT_ASSERT_EQ(test, ret, 0);
@@ -265,6 +277,8 @@ static void clk_test_rate_change_divider_3_v1(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, ctx->child1.div, 1);
 	KUNIT_ASSERT_EQ(test, clk_get_rate(ctx->child2_clk), 24 * HZ_PER_MHZ);
 	KUNIT_EXPECT_EQ(test, ctx->child2.div, 1);
+	KUNIT_ASSERT_TRUE(test, !__clk_has_v2_negotiation(ctx->child1_clk));
+	KUNIT_ASSERT_TRUE(test, !__clk_has_v2_negotiation(ctx->child2_clk));
 
 	ret = clk_set_rate(ctx->child1_clk, 32 * HZ_PER_MHZ);
 	KUNIT_ASSERT_EQ(test, ret, 0);

-- 
2.53.0

