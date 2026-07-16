Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8996C3AFCEE
	for <linux-kselftest@vger.kernel.org>; Thu, 16 Jul 2026 10:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784198697; cv=none; b=GU/qHgy/7DYtOWuwWfzsVMT4AkoTSrFKYG3113psS6E12BXXoccl1MRz2F5uMg4dNAkMawCCWHRge8q1XGIi5VguyFSMWUsTAHU1cGPmYJt+KqljIuJwGoluBjieEL/6lzKC9UdisoJyTk3xIMppif5pxOky+AKnv0lcDIBQ0Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784198697; c=relaxed/simple;
	bh=fvKp3muxqLO3ZXsRvobuXHT61jNJWSsEw3PxHdgAIVI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lg5q8GU5g3bZViy0tcyoRd7oey1793D+dwnoO22HYcB8ViduynrAgKT16cbb+kSvJUB4xXxVIBUZYef6FZlZdVq74V4bZcjGaq1Vc0SlJjxHhUh1QZoGsAMVWHctbe7N+85YQRvu5F6mBUhWXraxdJwlTwekXgP4SA0B2SE1nns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=sBi1BlTc; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="sBi1BlTc"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 32C4DC2B9E4;
	Thu, 16 Jul 2026 10:45:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DCF2D602B8;
	Thu, 16 Jul 2026 10:44:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 34D8E11BD3CB4;
	Thu, 16 Jul 2026 12:44:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784198687; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=R5Jti0bTgzxOr6073sChkcLCtqN2FPsmeK2o9HwQWUI=;
	b=sBi1BlTckZlcZe8NXu/hw+uNVeUztLRVMXusZEo8UPF+70We/Cf1dXYXnE3yv8vpjA/y4g
	E+P3uiElxckc7NnWxo0TOOa4oR3cM6giFUtEyBOrmS/CkDQWLF3fjw1zBhJw3BNvJ6mLRc
	z0aZ/knRwmhb/RgSkMADoV+bQ7dmuhGwR0saTaX385HG+SAHiXlZqQGz2g1Mq2+QeGFdE7
	HXT/ycR1DWOvkulFrKcAm2D5j7POnO79UfQDaOiA8B5HSHn3/Sd4otFU5KSHADXSg15whd
	YiAMdXmfz0BJt961rpO5I/Rh/stTcLL9yE20jayrne0MQS1vaxkl+SDsh7M//g==
From: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
Date: Thu, 16 Jul 2026 12:44:34 +0200
Subject: [PATCH v3 1/7] dt-bindings: clock: Introduce nexus nodes
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260716-schneider-v7-2-rc1-eip201-upstream-v3-1-98454e83845c@bootlin.com>
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

