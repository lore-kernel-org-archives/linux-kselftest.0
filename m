Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C35367F26;
	Fri, 17 Jul 2026 15:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784303986; cv=none; b=LshS7KyxgUCHMXuVutgXXRDKogrPlph5+dYFXrczYLH0gyXDr+b7Iupeo3h56Om1I7HnAMUmfmkE7dvzaSflLjz3G7UC5jLmYi09P/r/EIOs53GWVd9F3k8ltVwZcbIaXI3xIcuiB48fwXEBQLN7Q5+DLuBiTW5gfAbTl4g4kGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784303986; c=relaxed/simple;
	bh=b0CjsGb9kmZAexs7MyDMPW3zIAktW4SRGSXoUoyHCfY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mkxwIer2YtlnBkBSZ7n2bs+YDO+7ks3l9+3W/qBPqMWBDsm6aaU5OctyIAhntmkTu6kPHbwRrfCJeBFLKHyeCMUKv8fAapBOFXZjeb0h0kNloKWB8DqqCEYAZEM1KK4InVD9eSjltkTpfeNtB0Dmpij5Dc45f+uvnAqEIWWgc20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Agr1VXsY; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Agr1VXsY"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 78B4F4E40E1F;
	Fri, 17 Jul 2026 15:59:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4D89E60361;
	Fri, 17 Jul 2026 15:59:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4492511BD2559;
	Fri, 17 Jul 2026 17:59:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784303982; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=GZjpVe6V41AU3xoNOUQIWWRtJ354RHz718O41QQI6RQ=;
	b=Agr1VXsYmfDTklNs+QtsICYZWm/eaDazC3YTC9kQitME1t2EjHVHz+9JXZICh0tNDxvQ6T
	B7ySet8C62itDMd/DDbH4mAq8VifPqCDmM7K4K1mtBHF7ASZvlLq1bo5r14JzJVGAjW0PH
	qRikV6h6IW7SmC1FL0pyKzpw+8OCXYrixWP5Kvw6qVISK865uV4MRL61rdaWJZYPi5P3+3
	/DI6EeUlKKoUzt72KvS32r+U1YhycsEL81P5vEnNoLMiuu5hxDjxauEvQAqDuoZIGoKpyS
	rpRkiNKWPY9fYLE7FL+xZHiRPTdzLi1y7tVPQ0yOdxUrwwdoI8CfuOr+qlLWOQ==
From: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
Date: Fri, 17 Jul 2026 17:59:22 +0200
Subject: [PATCH v4 6/7] clk: Add support for clock nexus dt bindings
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-schneider-v7-2-rc1-eip201-upstream-v4-6-751547e160e5@bootlin.com>
References: <20260717-schneider-v7-2-rc1-eip201-upstream-v4-0-751547e160e5@bootlin.com>
In-Reply-To: <20260717-schneider-v7-2-rc1-eip201-upstream-v4-0-751547e160e5@bootlin.com>
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
 "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>, 
 Herve Codina <herve.codina@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

A nexus node is some kind of parent device abstracting the outer
connections. They are particularly useful for describing connectors-like
interfaces but not only. Certain IP blocks will typically include inner
blocks and distribute resources to them.

In the case of clocks, there is already the concept of clock controller,
but this usually indicates some kind of control over the said clock,
ie. gate or rate control. When there is none of this, an existing
approach is to reference the upper clock, which is wrong from a hardware
point of view.

Nexus nodes are already part of the device-tree specification and clocks
are already mentioned:
https://github.com/devicetree-org/devicetree-specification/blob/v0.4/source/chapter2-devicetree-basics.rst#nexus-nodes-and-specifier-mapping

Following the introductions of nexus nodes support for interrupts, gpios
and pwms, here is the same logic applied again to the clk subsystem,
just by transitioning from of_parse_phandle_with_args() to
of_parse_phandle_with_args_map():

* Nexus OF support:
commit bd6f2fd5a1d5 ("of: Support parsing phandle argument lists through a nexus node")
* GPIO adoption:
commit c11e6f0f04db ("gpio: Support gpio nexus dt bindings")
* PWM adoption:
commit e71e46a6f19c ("pwm: Add support for pwm nexus dt bindings")

Only expected Nexus property:
- clock-map: maps inner clocks to inlet clocks
(the other properties have been judged not relevant for clocks)

Here is an example:

Example:
    soc_clk: clock-controller {
        #clock-cells = <1>;
    };

    container: container {
        #clock-cells = <1>;
        clock-map = <0 &soc_clk 2>,
                    <1 &soc_clk 6>;

        child-device {
            clocks = <&container 1>;
	    /* This is equivalent to <&soc_clk 6> */
        };
    };

The child device does not need to know about the outer implementation,
and only knows about what the nexus provides. The nexus acts as a
pass-through, with no extra control.

Signed-off-by: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>
Reviewed-by: Herve Codina <herve.codina@bootlin.com>
Reviewed-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk-conf.c | 12 ++++++------
 drivers/clk/clk.c      |  4 ++--
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/clk-conf.c b/drivers/clk/clk-conf.c
index 303a0bb26e54..5380d43b56a4 100644
--- a/drivers/clk/clk-conf.c
+++ b/drivers/clk/clk-conf.c
@@ -25,8 +25,8 @@ static int __set_clk_parents(struct device_node *node, bool clk_supplier)
 		       node);
 
 	for (index = 0; index < num_parents; index++) {
-		rc = of_parse_phandle_with_args(node, "assigned-clock-parents",
-					"#clock-cells",	index, &clkspec);
+		rc = of_parse_phandle_with_args_map(node, "assigned-clock-parents",
+						    "clock", index, &clkspec);
 		if (rc < 0) {
 			/* skip empty (null) phandles */
 			if (rc == -ENOENT)
@@ -47,8 +47,8 @@ static int __set_clk_parents(struct device_node *node, bool clk_supplier)
 			return PTR_ERR(pclk);
 		}
 
-		rc = of_parse_phandle_with_args(node, "assigned-clocks",
-					"#clock-cells", index, &clkspec);
+		rc = of_parse_phandle_with_args_map(node, "assigned-clocks",
+						    "clock", index, &clkspec);
 		if (rc < 0)
 			goto err;
 		if (clkspec.np == node && !clk_supplier) {
@@ -121,8 +121,8 @@ static int __set_clk_rates(struct device_node *node, bool clk_supplier)
 			rate = rates[index];
 
 		if (rate) {
-			rc = of_parse_phandle_with_args(node, "assigned-clocks",
-					"#clock-cells",	index, &clkspec);
+			rc = of_parse_phandle_with_args_map(node, "assigned-clocks",
+							    "clock", index, &clkspec);
 			if (rc < 0) {
 				/* skip empty (null) phandles */
 				if (rc == -ENOENT)
diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 45f5d7a4ccc1..6acf042673c3 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -5207,8 +5207,8 @@ static int of_parse_clkspec(const struct device_node *np, int index,
 		 */
 		if (name)
 			index = of_property_match_string(np, "clock-names", name);
-		ret = of_parse_phandle_with_args(np, "clocks", "#clock-cells",
-						 index, out_args);
+		ret = of_parse_phandle_with_args_map(np, "clocks", "clock",
+						     index, out_args);
 		if (!ret)
 			break;
 		if (name && index >= 0)

-- 
2.54.0

