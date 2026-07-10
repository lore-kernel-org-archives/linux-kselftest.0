Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 893C737F8AF;
	Fri, 10 Jul 2026 18:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783707757; cv=none; b=D/P+4KQ/XqD3xUC7k5JK/zLFi6Z0Ym9OiID7I1e1rDX47v5lOzp08d3fzkiKFf1V/W5XRD7fw+hF5Tw7bQUNU7tVYzk1mTziP3VwlCwzkihkU7op9hgJk0ZeTYJNHqftjX/drDOk1beUZlKPdqZaCwmsyQkGaW/n8d7p7PKXLc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783707757; c=relaxed/simple;
	bh=jLPNQMlx2tycltIOs26Drt1Q255C5g3gqKVQI6vBK6I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OQ4O5jnMH91+Idjq/Rjk5FL0R4xCP5S3sJZHcnyg/5xP5nzpmLRk18PkUtwsxAulhM18tD5HRps1Pe2YWSPKsLD02Sax6VSE6gPe9DTQJ4kEWaJoiFbLZXYnFO2Do5GQKJCnL6jIuza+BGpbNDKniFskSUhAmzyPVw1/L+UngQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=lPVmfrly; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="lPVmfrly"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2EBE74E40D49;
	Fri, 10 Jul 2026 18:22:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 024C760342;
	Fri, 10 Jul 2026 18:22:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9627111BD2C22;
	Fri, 10 Jul 2026 20:22:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783707745; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=1wrqvhMu2YpcC+p27L70W26av2AD4YrTW4sHtW1nCnY=;
	b=lPVmfrlyQy0LStODYFFPnPc6ckxVpn7OsqcTtaOmJOHTTsbrkvrYs/5vOd8DvW6vnVXexf
	HiO56fdJVB9b4bImLVzfbfX0VwfIgljzCp87/dLHOd2Cx5tb54zXZB9tAe5xWCbryM4Rw4
	qzPJTMtukZYHvFhTODhJyqQJ9sSLihi/prN1CXejNW8VpgQsVOI6b1VqvTmgnoQTBjyIrn
	YLo6ODzj0VkYdKfyPsty86KPO9i+M7yO9xfDEZi1ItYMlDfcWgRAiyAqo6NibS/LLdAAMA
	szPwe1pEQpclz9LNi2x5/lRvYDX6abAxwPUqz34JQzeeJNVRk/Dt+Zxq/4pcHA==
From: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
Date: Fri, 10 Jul 2026 20:22:00 +0200
Subject: [PATCH v2 5/7] clk: Use the generic OF phandle parsing in only one
 place
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-schneider-v7-2-rc1-eip201-upstream-v2-5-b4680787377e@bootlin.com>
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

There should be one single entry in the OF world, so that the way we
parse the DT is always the same. make sure this is the case by avoid
calling of_parse_phandle_with_args() from of_clk_get_parent_name(). This
is even more relevant as we currently fail to parse clock-ranges. As a
result, it seems to be safer to directly call of_parse_clkspec() there.

Suggested-by: Stephen Boyd <sboyd@kernel.org>
Fixes: 4472287a3b2f5 ("clk: Introduce of_clk_get_hw_from_clkspec()")
Signed-off-by: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>
Reviewed-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 7d63d81ebc09..dad4bac10ad4 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -5364,8 +5364,7 @@ const char *of_clk_get_parent_name(const struct device_node *np, int index)
 	int count;
 	struct clk *clk;
 
-	rc = of_parse_phandle_with_args(np, "clocks", "#clock-cells", index,
-					&clkspec);
+	rc = of_parse_clkspec(np, index, NULL, &clkspec);
 	if (rc)
 		return NULL;
 

-- 
2.54.0

