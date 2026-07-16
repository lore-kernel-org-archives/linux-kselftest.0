Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E983BB66C
	for <linux-kselftest@vger.kernel.org>; Thu, 16 Jul 2026 10:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784198707; cv=none; b=FAsClygQhjT+vWGb8hMyEO4wl+t9A9DKNeCabh+o5W7Gl5giJx70cFvOKbmUFEV6ArxodBy1BhllUj+JSmX0QCcUaF7W47aQiqmdV9XIDK95O7lYheh70PsnFwV2lcajn1rtWceIweaBslurVSL5r8Kcnquvu0i84+5fS07E8XI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784198707; c=relaxed/simple;
	bh=b0CjsGb9kmZAexs7MyDMPW3zIAktW4SRGSXoUoyHCfY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WG0ObIjBsSBtj4qjfsPRoogsf9RtveJRsagtc2dYSOE9p6Jzj9IkIgQMpSn5jLnz6kCxbasyquNxcv9/maZREbL8omrA+RrZOUceWNeLwE8DJLA693iw3kdB+viydOrf+uc9rRPg99AAoxxZ7j9Fe4xhDS3VYjGcrFwAHpt7q3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=QB5XPfSa; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="QB5XPfSa"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0BBD61A1022;
	Thu, 16 Jul 2026 10:44:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CC947602B8;
	Thu, 16 Jul 2026 10:44:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F105611BD3CF5;
	Thu, 16 Jul 2026 12:44:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784198696; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=GZjpVe6V41AU3xoNOUQIWWRtJ354RHz718O41QQI6RQ=;
	b=QB5XPfSaFtsyQtATGvCO6BdwAw+HkRvc1/45TBkmpq5BsuEMXEzUuXXnDR7PSYVDhoFHQh
	aCnc+6v6Lux8SNcUka6URQYwWjM7n8HtQncD1yIPY9km4z+nqrt/Fd82+kndOaj/g2sPPo
	8u9vLEpJOsqPL9nqhZOiwNzc2+b1BgV1148vd87CyFNQTPCMXWDPPZ0w7fmPxwm5L+VNG/
	IT5J41UfbYea78nB9AHSneCVKwKei1Br0Iq1qpY3UNVR4kcnuMqUv7yfPrgMZ1XEXQHM/3
	nAnRlVBPst1uheO1NhStRpTACw7zV1Icr8YvUSCkH34jj29TrWrxlTiXCc49jg==
From: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
Date: Thu, 16 Jul 2026 12:44:39 +0200
Subject: [PATCH v3 6/7] clk: Add support for clock nexus dt bindings
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-schneider-v7-2-rc1-eip201-upstream-v3-6-98454e83845c@bootlin.com>
References: <20260716-schneider-v7-2-rc1-eip201-upstream-v3-0-98454e83845c@bootlin.com>
In-Reply-To: <20260716-schneider-v7-2-rc1-eip201-upstream-v3-0-98454e83845c@bootlin.com>
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

