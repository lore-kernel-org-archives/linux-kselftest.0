Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0501470443;
	Fri,  7 Aug 2026 15:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786116286; cv=none; b=BUsh6m1lxWXXhYr3w00Txe7nKRqJ1xK+gzZ8LsTB+wAR8h8swhIj1QRHFaQznh0y18IkJlE3P1GQWXL9H4ofaaPOCc7sDH4l+3oattl8FFWdXlt+/ARsO/HeauykRokNvFxhFjpjkAJlKbDxK2JOYwQjS6JdwusOUgAg8d4/ot4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786116286; c=relaxed/simple;
	bh=4Z5ASawV7KvaJGtXSweO5js3deOZ/JggqDhMsZbkE18=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cO7qu4M8o98aztQ4gr9EsZ7JPd0v1btkb12K+cR0klEGncOqoujZqRNCkQA9m3MavEqnVG4xjyWVU5NHcTRkSG45drlEzXHd0JGWiF3wc0WQtDlD6A9eJmJwgoAmmsFSE0w43EDTME/or1KDiMCLExDW3bbCW12w7WBxEp9+0XI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=DEt0ebtq; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="DEt0ebtq"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 795AF4E41140;
	Fri,  7 Aug 2026 15:24:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4E86A603F0;
	Fri,  7 Aug 2026 15:24:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AF18611C37AC5;
	Fri,  7 Aug 2026 17:24:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786116281; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=rGYCq+VkQRoc47FpryIf69RRpxfv8Q4feCXJKvo5Yxs=;
	b=DEt0ebtqzzOXlYhNqD5Xysv8UVranXvWG7MS7pt8n0voeKQyKmmzuKnpLo1usy8cprZLtU
	DlTOeT7nLy3XUKaBY8uw7p5U3Qlh6Irt175JTlcX7d86iqowXkANnJ4R6xT6TYZPRkl5Rx
	Ak0Khj3zVAEgwD6/AZyuKzGT0pixRl2ejsK84+CU0FpsdKYKpm7VPNUxoVfZOQH3L5ZPXG
	vj1AEBaCkLmpk4jAYck/4cQCAHmfEzMs0AODBUVNAW+2er8/3fx8nJI/JoqVm3Df4V4r89
	CN/3hvZJj63J4Rd7SGZI6hS6deo3FYSjwPWrz8Kk6s3FJUl6A5pqVMSo7XmGVw==
From: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
Date: Fri, 07 Aug 2026 17:24:06 +0200
Subject: [PATCH v5 5/7] clk: Use the generic OF phandle parsing in only one
 place
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-schneider-v7-2-rc1-eip201-upstream-v5-5-8785f9531cf0@bootlin.com>
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
 "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

Ideally, there should be one single entry in the OF world. This way, the
DT parsing logic is always identical. At this stage, we call
of_parse_phandle_with_args() in:
- of_parse_clkspec()
- of_clk_get_parent_name()
which kinds of defeats the above statement. Furthermore, when this call
is done from of_clk_get_parent_name(), we fail to parse the
'clock-ranges' property.

Make sure DT world is entered only once by calling of_parse_clkspec()
from of_clk_get_parent_name(). Doing so implies that we do not try the
"clock-ranges" path if we already found a "clocks" property.

Suggested-by: Stephen Boyd <sboyd@kernel.org>
Fixes: 4472287a3b2f5 ("clk: Introduce of_clk_get_hw_from_clkspec()")
Signed-off-by: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>
Reviewed-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 7d63d81ebc09..45f5d7a4ccc1 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -5219,6 +5219,8 @@ static int of_parse_clkspec(const struct device_node *np, int index,
 		 * has a "clock-ranges" property, then we can try one of its
 		 * clocks.
 		 */
+		if (of_property_present(np, "clocks"))
+			break;
 		np = np->parent;
 		if (np && !of_property_present(np, "clock-ranges"))
 			break;
@@ -5364,8 +5366,7 @@ const char *of_clk_get_parent_name(const struct device_node *np, int index)
 	int count;
 	struct clk *clk;
 
-	rc = of_parse_phandle_with_args(np, "clocks", "#clock-cells", index,
-					&clkspec);
+	rc = of_parse_clkspec(np, index, NULL, &clkspec);
 	if (rc)
 		return NULL;
 

-- 
2.54.0

