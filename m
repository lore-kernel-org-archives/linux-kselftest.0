Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7771B3C73CB
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Mar 2026 17:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774286741; cv=none; b=riTBYWW+/nOSms8QCP+EGIubpCCx4kDUb2t6lEaYtNuHuRHPVOCgFJ3M3glTiFex0JtKCQs65E8Oh0Az4t+xvFDn5OPFPywvnKYV5xWRkpgEo3RkmTgG5Nuy3rHcgNwoA+bffhUmn9+RAtMm6mTigb8fdC92PvVCbaY6fwbm4Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774286741; c=relaxed/simple;
	bh=+l00fky33FJjUcCtct02e8xTnMZAOCOPGYXSQstRsV8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IYqEgq7kO7HfS01JTe88nyKmQvzZIKJyxpzGLIwzPqShE746Amph5cQfSRL67lzUDnqRMHByQcPT1FY7YdVz0tesOctvNzD6g6/B/tEMPb/J4DNh0o7Eok4vzj4VYMH6SAZNGBfq/P8Xwlx2DvU2BcMmfuDNNlpHg1xdwy+lQ18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=T+NkKkKG; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=nGVcC8yr; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="T+NkKkKG";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="nGVcC8yr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774286739;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q1hC/ZzGEUORZ2zC8HhKM0IgI+bXqAEpeb3eJalR1xU=;
	b=T+NkKkKGdG6lhkUYLhCmUrjzhPsJyhvUO6ioZHkt0cdfnktTvORxUkH0xym+L5TmmmeYPG
	6p8FLZ+8e6WZD6w3vrnLzPTSSHibrTpKZovKh3uOQqVmUYTiDMBdrCjKzddqzDoUxFXTcY
	utmXVlaUddTG2/c2BC/fKRWrsbTVVl4=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-563-QRtJ83lGPFiiEsiSzLkbSw-1; Mon, 23 Mar 2026 13:25:38 -0400
X-MC-Unique: QRtJ83lGPFiiEsiSzLkbSw-1
X-Mimecast-MFC-AGG-ID: QRtJ83lGPFiiEsiSzLkbSw_1774286736
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b469e5543so4496381cf.1
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Mar 2026 10:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774286736; x=1774891536; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q1hC/ZzGEUORZ2zC8HhKM0IgI+bXqAEpeb3eJalR1xU=;
        b=nGVcC8yrd2dYyDb8MKnxP+N5TTHUmZwUlCLwRdTAT3XcQsVS0b4o+ERfVBr3MxZZ+y
         gPDHYa3N0dXxQMNdRjykhF8ylkhvrLunSIxcLQHh6v/CxCf5YrTfcPhJG7dHOGdozEsX
         rsqhFzOvj93YlOMPtCITv+B2wabXqDfLI81j8lRhzx0Zb37yW3ytQNeCFurdDlb0p74x
         9PC73th7yH4W81tRzeog8HIFrVuFtABMpNnxfwQ8EQyVyLeU0Shfm0bLwpTlYBQ0QG+w
         iycc5JU4G38CC7wAWn7FOgQZ3zXJNIGxVKN1EoxnbRFc7HqUH2njL94NrKp7UByNYfEy
         Crcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774286736; x=1774891536;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q1hC/ZzGEUORZ2zC8HhKM0IgI+bXqAEpeb3eJalR1xU=;
        b=pS+Qug08sbmqmiqIfNhhQrnZ3371RYyQ5DQTF8G/X0xWht4iHv6vYblpPenjWMSNgH
         7f0JYMkLRSXrfMZ3YwoLpQeoQaYqmhaG6PB8WRYWJvp1TC0NSEDb2jsvPcCBaDcguTW5
         w3AHtsKmC0c+Ox78JOOBIanz1Fs03DmZto2qcynHk1DwJtK228TAoczBn4JX28CwLfRc
         JQ271L2/JKvglfEdyKFDqNsPOrlDJMf8A1S8XDAaOdjFrkeF00IbmfwEcjcCCWiBJIua
         K3jPb5zvwWnJn7lRbsd3ncAi9BNY5ii05zd8A6w2rtwaenHAoZulaog/X8m9HE3sqWH8
         UrkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWuiLtmFto3wOo4BUXFnwkWPafU0fvHce8GkyDe3CY7JUehAACGofaTk8PDJ8ZIxNgilGnT2aCeuh0xFwYykZQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzB0xAyREJxXQ1QwRVhR7cv15N8i6fZ/55ac9uJzqG5lhfEcU/5
	DCp/GeBUQdeEM+1/Ta4HvLmiqkFYgUr8ZoJiyIh6gmDQAj3wevv2nh0sB+yHqtOmpqz12aXrdOu
	9JtC+1fmkSKZOpx7VbpLG7Jg9ZkSpUoSlc7gUPtsBvkrsJA1w4vPz+KFZKUt55ZIyqGK6qA==
X-Gm-Gg: ATEYQzzZmQg07AAjZ/UO7KV7mk2HBpWY9YOy4fsXY5KTuWBnc/xydMDdOmJ8j809lz+
	KpbGM6zjfcEh+fOD6e6DDt5H9OyfV0jtASfBJxyu08mJkvHIx+19qeRPDj6SV9FQOMGC89WAWY/
	85hxtxDbDnPE24YqvAEYrr+fYnRTEHnKqqqV0VtzsiT1zTcWduhlNx2tC31EyzgBqjSIicKXkW3
	9BFHRIGxOVjat96e782DwMHFBWz/E6c1vHbFJq/P7Jiu0lsv7o+VGjieGUt1paLlxD0cLMqqL3g
	dQ5UBBF8WwdErf7aYLKW8pCYNd8pTLM/a8dZcrh8JrSXZA4ezScNX/ZCC7f/5nEqLgs8Q5XYqdB
	48edpFRL5yfS/1LZBl6kc7NpCrQsrJ7gdNgzv9TwKP+H9Eywm8LIk3X/4rwzI
X-Received: by 2002:a05:622a:1e85:b0:50b:2fac:9597 with SMTP id d75a77b69052e-50b3743992emr212550441cf.22.1774286736604;
        Mon, 23 Mar 2026 10:25:36 -0700 (PDT)
X-Received: by 2002:a05:622a:1e85:b0:50b:2fac:9597 with SMTP id d75a77b69052e-50b3743992emr212549821cf.22.1774286735944;
        Mon, 23 Mar 2026 10:25:35 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50b36e34f8bsm108249661cf.15.2026.03.23.10.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 10:25:35 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 23 Mar 2026 13:24:52 -0400
Subject: [PATCH v7 1/8] clk: test: export clk_dummy_rate_ops and
 clk_dummy_context() for other tests
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-clk-scaling-v7-1-8e7193dc9405@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2492; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=+l00fky33FJjUcCtct02e8xTnMZAOCOPGYXSQstRsV8=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIPlreFyJQq1+tfrvd9O1/RymXLZOWde5dpTvfsMJK/v
 SnG+X5YRykLgxgXg6yYIsuSXKOCiNRVtvfuaLLAzGFlAhnCwMUpABP5Xsjwz6T9kFHGr0mX1t7y
 PsffM0EloWLulwPfexJfvw1/9LBKvInhf52ZhElk6Wbmt5U+YVutvJsj98nbTtXMOdyex2vkpl/
 FAQA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Expose clk_dummy_rate_ops and clk_dummy_context() so that they can be
used for other clk kunit tests. These will be used for the clk-divider
tests.

This export will be used by the upcoming clk-divider test suite. For
consistency with clk-fixed-rate_test.c and drivers/clk/clk-gate_test.c,
the divider tests will be setup as it's own separate kernel module.

Link: https://lore.kernel.org/linux-clk/aUSWU7UymULCXOeF@redhat.com/
Link: https://lpc.events/event/19/contributions/2152/
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk_test.c | 9 +++------
 include/kunit/clk.h    | 7 +++++++
 2 files changed, 10 insertions(+), 6 deletions(-)

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
index f226044cc78d11564f7adb4cc2450934aab04ce6..b31d9a9055881ac95d3c69f0e5d0728d9fefed88 100644
--- a/include/kunit/clk.h
+++ b/include/kunit/clk.h
@@ -9,6 +9,13 @@ struct device_node;
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

