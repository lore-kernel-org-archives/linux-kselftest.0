Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A57A4382F15
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Mar 2026 19:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774639951; cv=none; b=aJIRBDE156XJkqLmG6UMwtzU3JQEQDkbbPnpuvaLnYpBOTlPQW8c7FqUZLffGCtauo3KRoAuVWcZpIp2fz8wDv31f5578zYxpN7dNdHCRsFOPY0QZc0D9PZrg1Ch4+jLXOEqw/PwC1sw/0WSbNDyedtIFe5a40otn8O3+mR97xQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774639951; c=relaxed/simple;
	bh=jd//XrLlu9aP2VdC9ECV4WESWkR9R53GBlDDdRxDkag=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bOl2qZpFin4AVHnuNJ3Rf9riz38Y2/lLeBsdH16tPwzzwlPzw8TCKkde2Dc8b6PHjTLIa23rTYb4nhTfwn1VFvDwpdQ7vlp8lkFhMl/1X9kqgcMHLNtdG1Mxoyki6wcO4FK2sKY2tUm1TQq61D0T2/5FsCWakAvipFtKfLZ7XEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hKqDebvu; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=fU24gB68; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hKqDebvu";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="fU24gB68"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774639944;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rLCeHqNBIDahC+z75v7xjiqfy4IF/oyQQXA2QmvbSSw=;
	b=hKqDebvu/0VxPqQqGUEKmHmslLINUc3aOkEMXDvwobGBD4bXxJUeArD3sUHjALKRqrAaoN
	tKh7FqhiGCVGBVPdTyYenK57oE4cVGP4/Da3H2zqVIymd7S0Cgzf3h8vuHeeSkhwimc26Z
	SI9mEULXbvpdL546fAABqC+2Hu3b+YU=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-111-HuLcwN20NI6uwSGSOiPztA-1; Fri, 27 Mar 2026 15:32:23 -0400
X-MC-Unique: HuLcwN20NI6uwSGSOiPztA-1
X-Mimecast-MFC-AGG-ID: HuLcwN20NI6uwSGSOiPztA_1774639943
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b2cbe7223so79053231cf.2
        for <linux-kselftest@vger.kernel.org>; Fri, 27 Mar 2026 12:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774639943; x=1775244743; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rLCeHqNBIDahC+z75v7xjiqfy4IF/oyQQXA2QmvbSSw=;
        b=fU24gB68PZChojFexpERgpvb5GyN90N9zJmE2Ac26sSap1siklK7LKs8R6NGat3Ipf
         FjBi78A1D+RybxNWyWfO6C8zcahGhxFdeKU6ErqTL9ubpGhCJlZ1mHlRSf8oo9JUkngJ
         NG/+FQA1FD+EVirmxGXWvKzBBXg+hTnIL3MWJ2qmLMZBikLbtzmoM49zUVX3oYObN+jw
         XNyGN1ztX+vS2AIXS760SsGNm6dIBoEd9SmdHsevkXeJGNMNlPqnv5B6Ji7SQhSViTeb
         Q+iwjm4Ej2wuGcd/OEADbM9a7++jfzmNq8onxn0eX1wCg49rpW/c7arGGyaui/sUr/zB
         xBjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774639943; x=1775244743;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rLCeHqNBIDahC+z75v7xjiqfy4IF/oyQQXA2QmvbSSw=;
        b=adr6z6xKaxjPuHop66aBVcjNYFMDc2RTLvFx0gSmdFfDAJfbkocau/NvghSnpbmO5p
         AhQpzp6Vew6VQyI2GhdRU2i4jbMHh0jgEhU+22zYpN//yv96LdhOqNQu+T9alSLRfAIh
         jSqZSfV+2qFIBw8AWD7Ri6WlJd8QkAkWafhOCLWObXH4V7wywr/5DDpTwqiTtkQweakJ
         U1ngqHBBgwKcMhk+B0l7xoMWHhb+RxSD37DNkBsCUpus6r85o5yBbuBalafLoJQWaqcu
         oO9gb3XRwiz4ibsoQi0MdfMVsZmCkVKti4ejcYsJfxC/iF2p9n8zLEgPy2e/NP7o1in4
         NSNg==
X-Forwarded-Encrypted: i=1; AJvYcCXKiomdP5StPkMaTdGGZp5MO3NUQ4NZzZQds9ByHgMGDorh2q9MiYyMzUWtmpiEKTXjshHs3WpVpdJNdWFCdAk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxovUlZtul7/OdmXONvYxu/4+76a5S85AGPjgHwCGpFxaVNQFbI
	jMrwjhgwXxs9dbeUkJgrptXQMyqDCxkb1NOYX8IucOR8gO9scEGspbzDfzm/uYhd9vievqPeM6A
	IU3/rVrzueGNdLAxduOCSONIYwCYilhyQ89CDYwx/ckg7zAMZohOHwbuQYv27Bw8QtiR0SmZsCk
	CFB4sLROPydw0Dhaq+oKXP0xanQT58lFPtnjKbEQkEmwyOfzvF5nSq
X-Gm-Gg: ATEYQzzLcA3qm9qK+lgSr943O1dueE9R3me43FTu87kb9OgYExLDJR/qf+L4v4QppAJ
	M6kwMra4qsyg/tjLbrROUurFbcf2Er9Gw+kKt+3H/vBBVXLD5KWS6YMSRKniPxw869/zXLQ+B5C
	PLmV6eefDcvG++OL0i459vAH6Cz1MuhFAKRBmUdCglsZZm4OyczIQR4ANZyUXzeOEK0T1cGIBCk
	5KwTJQdmjuBaknz/RJwdluv0NcQLx62dYceaqCdLsTKYOjCuISRr5C86G0PY/f55/eGZnxYdlqc
	EEgtxiwkWxRnl5EXhod3UWEl7HC0Vdm00nLZb3mR4Snc3Qqe7NZNiZmX2C1Ge3w0Z+dAteuaTag
	SYhJ3K+s7+Tf0CkE3vrFDcfogx2wUWfyOzujksc6B7KbjgCkneYHQzZ/QWHIZ
X-Received: by 2002:a05:622a:5c8d:b0:4ee:13d0:d02b with SMTP id d75a77b69052e-50ba3935ea4mr53627281cf.50.1774639942955;
        Fri, 27 Mar 2026 12:32:22 -0700 (PDT)
X-Received: by 2002:a05:622a:5c8d:b0:4ee:13d0:d02b with SMTP id d75a77b69052e-50ba3935ea4mr53626671cf.50.1774639942412;
        Fri, 27 Mar 2026 12:32:22 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50bb2c678e9sm2037551cf.6.2026.03.27.12.32.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 12:32:21 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 27 Mar 2026 15:31:56 -0400
Subject: [PATCH v8 1/8] clk: test: export clk_dummy_rate_ops and
 clk_dummy_context() for other tests
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-clk-scaling-v8-1-86cd0aba3c5f@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2985; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=jd//XrLlu9aP2VdC9ECV4WESWkR9R53GBlDDdRxDkag=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDKP3bblPL3zyScOR7epigcDNM00+RnvSLld+8K/ntl8d
 3CltpN/RykLgxgXg6yYIsuSXKOCiNRVtvfuaLLAzGFlAhnCwMUpABOp/MDwP1HIbnpS576Sy2Uv
 9jt+u/6qYN6iLRv9LiwyWcsuvv6SZyPDH75vE9Xv7Pr6vo13ncMbKaFTog9O2r4tEGVfe/eUyOs
 eVSYA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Expose clk_dummy_rate_ops and struct clk_dummy_context so that they can
be used for other clk kunit tests.

This export will be used by the upcoming clk-divider test suite. For
consistency with clk-fixed-rate_test.c and drivers/clk/clk-gate_test.c,
the divider tests will be setup as it's own separate kernel module.

The file kunit/clk.h now contains a struct clk_hw embedded by value. If
kunit/clk.h is included before linux/clk-provider.h, then this will
yield a compiler error since it won't know the size of struct clk_hw.
Let's also go ahead and include clk-provider.h since it's a dependency
here, and this lets us drop the 'struct clk' and 'struct clk_hw' at the
top that are no longer needed.

Link: https://lore.kernel.org/linux-clk/aUSWU7UymULCXOeF@redhat.com/
Link: https://lpc.events/event/19/contributions/2152/
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk_test.c |  9 +++------
 include/kunit/clk.h    | 11 +++++++++--
 2 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index a268d7b5d4cb28ec1f029f828c31107f8e130556..b286297bb902a0c6c8a0469d0f785009416ba9a5 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -15,6 +15,7 @@
 #include <kunit/of.h>
 #include <kunit/platform_device.h>
 #include <kunit/test.h>
+#include <kunit/visibility.h>
 
 #include "kunit_clk_assigned_rates.h"
 #include "clk_parent_data_test.h"
@@ -25,11 +26,6 @@ static const struct clk_ops empty_clk_ops = { };
 #define DUMMY_CLOCK_RATE_1	(142 * 1000 * 1000)
 #define DUMMY_CLOCK_RATE_2	(242 * 1000 * 1000)
 
-struct clk_dummy_context {
-	struct clk_hw hw;
-	unsigned long rate;
-};
-
 static unsigned long clk_dummy_recalc_rate(struct clk_hw *hw,
 					   unsigned long parent_rate)
 {
@@ -96,11 +92,12 @@ static u8 clk_dummy_single_get_parent(struct clk_hw *hw)
 	return 0;
 }
 
-static const struct clk_ops clk_dummy_rate_ops = {
+const struct clk_ops clk_dummy_rate_ops = {
 	.recalc_rate = clk_dummy_recalc_rate,
 	.determine_rate = clk_dummy_determine_rate,
 	.set_rate = clk_dummy_set_rate,
 };
+EXPORT_SYMBOL_IF_KUNIT(clk_dummy_rate_ops);
 
 static const struct clk_ops clk_dummy_maximize_rate_ops = {
 	.recalc_rate = clk_dummy_recalc_rate,
diff --git a/include/kunit/clk.h b/include/kunit/clk.h
index f226044cc78d11564f7adb4cc2450934aab04ce6..02ba1f1d09c50b37ba1674017b145792acf589cd 100644
--- a/include/kunit/clk.h
+++ b/include/kunit/clk.h
@@ -2,13 +2,20 @@
 #ifndef _CLK_KUNIT_H
 #define _CLK_KUNIT_H
 
-struct clk;
-struct clk_hw;
+#include <linux/clk-provider.h>
+
 struct device;
 struct device_node;
 struct of_phandle_args;
 struct kunit;
 
+struct clk_dummy_context {
+	struct clk_hw hw;
+	unsigned long rate;
+};
+
+extern const struct clk_ops clk_dummy_rate_ops;
+
 struct clk *
 clk_get_kunit(struct kunit *test, struct device *dev, const char *con_id);
 struct clk *

-- 
2.53.0

