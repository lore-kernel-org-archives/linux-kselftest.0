Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6BC237AA9A;
	Fri,  7 Aug 2026 15:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786116281; cv=none; b=kQY+jXB3TosvZIkEnyaoIQNSQNFVcVTptK7nbjJ78UTA5LrvMoQuzhmXKPC5G4RXabInUtrcjukknST35jvxPvXTQ/QW3gT767SE+fVev6j4Uq1GrF2J7oWuHz0r+34dKJNNGUic7sFACgT8f0+ApBMGz6o7qgss5zPjqWRF+1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786116281; c=relaxed/simple;
	bh=HMRl4W5pDNAuAWEGA817OKkxGf4xWR2JD8IQfGRPkws=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Wu23bN2TrsXSaN4bFCD0h8oHsBAwa4nV9AUv2vsNwATbBxBSOUUUP69qvN14yUD7Kg+C8FlxX8ULBQmlOfb64tI75In4BxMmkteTs2bVhMwSQM7Vtoi8bPtpeCy5nry2TAxLTnoxqpVuewDNmcoZYWvTcQR8st7YQxlVkDClU5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=jdBEShiN; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="jdBEShiN"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 4655F1A14B1;
	Fri,  7 Aug 2026 15:24:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1CA42603F0;
	Fri,  7 Aug 2026 15:24:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7F9A611C37ABC;
	Fri,  7 Aug 2026 17:24:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786116272; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=0a1N6Q/u1/SiB4FqpZQZYNJEWaehQaXGJU5sGi2JSUA=;
	b=jdBEShiN5nNOsEn0FxlUFMaBFRMsR1fSTwIfU/70y72ccrhSOucoJOtqUs268pCT69m6r5
	IxXzSG0yIzJaUx4oAjfVfsQ/IFzStEBXry/deHEPJPxX5meRqlRYer/Hg9mD0jLpbZwdBf
	E/bzjuo6iRlz8A94k7B0IP9SK06CPcvTzqpulI8IRfRxAxuwhZ6Pq0dKP9sFD6bfVI8FwF
	/vxQXCvDDVZ7NG7QwBEJtnMK/I5lbcTsVWW0g6tvxEf4JW8dtJI9ID4O3g2TjPZ/34ROyl
	9KwY4TlZlwyqlLT+wMu+gicyeiFhIBJFORzXimyBMuTWABSEOSCsFDjFsNvBgQ==
From: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
Date: Fri, 07 Aug 2026 17:24:04 +0200
Subject: [PATCH v5 3/7] clk: tests: Add Kunit testing for
 of_clk_get_parent_name()
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-schneider-v7-2-rc1-eip201-upstream-v5-3-8785f9531cf0@bootlin.com>
References: <20260807-schneider-v7-2-rc1-eip201-upstream-v5-0-8785f9531cf0@bootlin.com>
In-Reply-To: <20260807-schneider-v7-2-rc1-eip201-upstream-v5-0-8785f9531cf0@bootlin.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
 Rae Moar <raemoar63@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Pascal EBERHARD <pascal.eberhard@se.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Fran Li <Frank.li@oss.nxp.com>, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

Ensure this helper remains correct before making upcoming changes to it.

Signed-off-by: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>
Reviewed-by: Brian Masney <bmasney@redhat.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/clk/clk_test.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index f47f81b7d72a..4084559e157d 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -3637,9 +3637,23 @@ static void clk_parse_clkspec_with_incorrect_index_and_name(struct kunit *test)
 	KUNIT_EXPECT_TRUE(test, IS_ERR(hw));
 }
 
+/*
+ * Verify that of_clk_get_parent_name() returns the correct clock name when
+ * looking up by index through the consumer's clocks property.
+ */
+static void of_clk_get_parent_name_gets_parent_name(struct kunit *test)
+{
+	struct clk_parse_clkspec_ctx *ctx = test->priv;
+	const char *expected_name = "clk_parse_clkspec_1";
+
+	KUNIT_EXPECT_STREQ(test, expected_name,
+			   of_clk_get_parent_name(ctx->cons_np, 0));
+}
+
 static struct kunit_case clk_parse_clkspec_test_cases[] = {
 	KUNIT_CASE(clk_parse_clkspec_with_correct_index_and_name),
 	KUNIT_CASE(clk_parse_clkspec_with_incorrect_index_and_name),
+	KUNIT_CASE(of_clk_get_parent_name_gets_parent_name),
 	{}
 };
 

-- 
2.54.0

