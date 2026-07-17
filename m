Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC347348C5E;
	Fri, 17 Jul 2026 15:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784303975; cv=none; b=Ht3V8BcB3oh7S/6XnU4QaHI5TMHXn3LV2m9O+xBoJs/Nz6jcqes13onbnv2IsaG9HLd1aejuIULvtLIbUXxATACHeexG05mkDNGRnFOaMszc64Zcv9HUACq6jIERfwNNDKj8SKntPEOviJSe84G8EMumIoY5mPKSnP0TDxiaupY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784303975; c=relaxed/simple;
	bh=fvKp3muxqLO3ZXsRvobuXHT61jNJWSsEw3PxHdgAIVI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YiGwRe1yK6QFMhAJD1e6joQnbr0Hc1F+S2vKEwJ7czucKLHh5/+8sigpAMiByBaZMNPR7em1bOiFkZ+Cn85YQXad1/yyzr3YXG1eIxmK3JRCiGtPz3P5qeLGOnUavPIIaAzDUcvI4+l6jSWbZ06Z/09DiA7/IOv+Dh4yBCXAoVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=S6pbyxKU; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="S6pbyxKU"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6772C4E40E20;
	Fri, 17 Jul 2026 15:59:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3AE9760361;
	Fri, 17 Jul 2026 15:59:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0D28311BD0C60;
	Fri, 17 Jul 2026 17:59:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784303970; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=R5Jti0bTgzxOr6073sChkcLCtqN2FPsmeK2o9HwQWUI=;
	b=S6pbyxKUUkegm8iJSNU6ruPxGyYcZRMIEegA8vBhm/p1F9XBXi8saP1ruwbNbCG/Ah69lE
	GgHd4N1kG7SYApAX0tvx7M37WzeO1wT7bSmu25+ypN/82fRnkOGVvgzqnkI7NYR5ZrSmqk
	PFM9aqLhB668PiSHz275CAJMdd7Am1CWbYxQA31DLUQJ7x/+lOA07S7ZRfAT5lLBjbBOb0
	WbTUBro6Zno7hiXz1KRx03ya1Ppl5pFvVNGzQtQieVMMSFdD+7oPSbAjNgvmPvlOdb3cTv
	RxCL5ql7SG4RkgWJJaWhB0Cd3DXcEbaJleuI3Tn9tpoV6dhH8ohUq75hzCuQeg==
From: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
Date: Fri, 17 Jul 2026 17:59:17 +0200
Subject: [PATCH v4 1/7] dt-bindings: clock: Introduce nexus nodes
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260717-schneider-v7-2-rc1-eip201-upstream-v4-1-751547e160e5@bootlin.com>
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
 "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

Hardware containers can just decouple external resources like clock
without any more control. Nexus nodes already exist for PWM and GPIOs,
add a binding to allow them for clocks as well.

No examples are given, the file is litteraly a copy-paste from Hervé
Codina's work on PWM Nexus nodes, hence we just point to the examples
there which already illustrate very clearly the concept of the various
properties.

Signed-off-by: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>
---
 .../bindings/clock/clock-nexus-node.yaml           | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/clock-nexus-node.yaml b/Documentation/devicetree/bindings/clock/clock-nexus-node.yaml
new file mode 100644
index 000000000000..ff3283bd5fb1
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/clock-nexus-node.yaml
@@ -0,0 +1,30 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/clock-nexus-node.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Clock Nexus
+
+description: >
+  A nexus node allows to remap a clock specifier list in a consumer node
+  through a container or a connector node in a generic way. With this
+  remapping, the consumer node needs to know only about the nexus
+  node. Resources behind the nexus node are decoupled by the nexus node
+  itself.
+
+maintainers:
+  - Miquel Raynal <miquel.raynal@bootlin.com>
+
+select: true
+
+properties:
+  clock-map:
+    $ref: /schemas/types.yaml#/definitions/uint32-matrix
+
+dependentRequired:
+  clock-map: ['#clock-cells']
+
+additionalProperties: true
+
+# See the original pwm-nexus-node.yaml description for examples

-- 
2.54.0

