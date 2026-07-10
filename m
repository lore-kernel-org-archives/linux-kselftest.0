Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 113283793C1;
	Fri, 10 Jul 2026 18:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783707740; cv=none; b=Wxpho64XFoDXdvkfeQN911Qmp9ChYJbfAtKjkDRAQAOw9acuoaWWg8qnqRBAfQDzzCAWonKILM83oJ2tE4uD2kPrJ2KHUywnuWSuYrfSA2FOuJwNuISOuioMJ/FFl8etPzMJMxQmj9uBqEYeWXRumMV6VjQwlExSkIxkeNZs9ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783707740; c=relaxed/simple;
	bh=fvKp3muxqLO3ZXsRvobuXHT61jNJWSsEw3PxHdgAIVI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AEoaIwl6gjxLkHXPHvpHgfSu5oqfj4sZFILthWlHuUq6DdEsxzB0QoLjcDj0Xx6zJwoyNb/uzsbHiYPgc2b/wrtRMYjBChXAqmqJBwQS3xaUsSFNFcmbVKj1RUR5U0mkOi50L5oUxmAu97mnaigE60RY41U/AvWbeGxVlh/55zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=KMyH/a4T; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="KMyH/a4T"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D74021A0F47;
	Fri, 10 Jul 2026 18:22:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A466060345;
	Fri, 10 Jul 2026 18:22:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6D97C11BD2C1D;
	Fri, 10 Jul 2026 20:22:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783707735; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=R5Jti0bTgzxOr6073sChkcLCtqN2FPsmeK2o9HwQWUI=;
	b=KMyH/a4To9HPUEriDlXstepHJyiDLbLbp5K5Tk3cZprImc60Xi1PBkrfmp5SuZODiscSoR
	00jQoeNCHCQxMq3f+tPjlk66n+/UKkVyw3BDbGfRdFqpuo4qBBI5/43/aIov3mxbd8dGO7
	tXjSffZDQLVePQXJoO3B55cLD3IyDAzPREafInkcRWHyNYGPKN2YWi3cz5rMtxJJEBZK2V
	DHmgSKdE1kwBzrKQab8SRI7GGMlVB5fT7IwoAXt1ZA8lZP/+dMQl5VlVAERQKxV5wldnAw
	nnP9iy0PALDRRuvIJ9pL/ujiMxzlwmABYp8DRyIHsEUOhpv5uTSmYzlig8MRPA==
From: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
Date: Fri, 10 Jul 2026 20:21:56 +0200
Subject: [PATCH v2 1/7] dt-bindings: clock: Introduce nexus nodes
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260710-schneider-v7-2-rc1-eip201-upstream-v2-1-b4680787377e@bootlin.com>
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

