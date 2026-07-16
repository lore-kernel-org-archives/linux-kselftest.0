Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34645346E66;
	Thu, 16 Jul 2026 10:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784198693; cv=none; b=XDPi5+6uwzosX7/ZER8l5JTp6xlW9Aad5PvJ7t4wOF9JJVneD933u/yo/+0R9SddZm1amhZi4jc0SL5QG5S2kQswXsP+XBggmj/VUEVwyJUlPR6fDAXyEkBaUNX+dk+NlgC9HXfmVHH6O9vySJrolt+D/L6m+zjyKcwdoKF/fQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784198693; c=relaxed/simple;
	bh=wCqvu0eEjpkCD2dNyierTczaNh4mMrpI3+kkEsPbvP8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Q3SB88FyXl/Ny3KkO24iycZwhVD4O4TPTiW27ejJQuzkgsLVREoT14Y/JGYpkqb3Y39ZB9Koftih16K3m8kWracqrOUw9KKug9sYdIMizNZsUlTVIiwGnWWeWs2a3ngu8Qer1GLTT+gRlztLuZ3yTfaYn09lmg2w2BzTJafl0n8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=GScI2hz6; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="GScI2hz6"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 608071A101F;
	Thu, 16 Jul 2026 10:44:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 25BB8602B8;
	Thu, 16 Jul 2026 10:44:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 14A0C11BD1507;
	Thu, 16 Jul 2026 12:44:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784198685; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=4URr7AZF/FscWuft5dRhuRrhUjrmDsc/9ds2q70NhoU=;
	b=GScI2hz6xR0yylirznT9RN3WK7oIRXU4+S7cUQaVGdapuNskLHN7d7B/HqeyWjhnmO/fJQ
	lT6ZnGq7+y7+8IBdp6ziq33gPTBWmerO0ui6K9HMVx3pOTboued2XjPTefompChHl+bdAg
	RXcI+Y0F09z+FklOOym7mDIGMdt4MOR+Ytapv6vCSSOA3QM1DPcg75DwKuq9JMIrZpg3ny
	VNEvr2zocWrfXb2RtupENe0qsQ3iVp1ROZJuVOqukE803H4OQHoS54vYI1sxKqz0iaGtly
	quOAhcxckRlv0JWO5DI4744+rSmi5rg5EN3z462vxWNzvHb3/+vU0m83frSbig==
From: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
Subject: [PATCH v3 0/7] clk: Add support for clock nexus
Date: Thu, 16 Jul 2026 12:44:33 +0200
Message-Id: <20260716-schneider-v7-2-rc1-eip201-upstream-v3-0-98454e83845c@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WNQQ6CMBAAv0J6ds2yIEVP/sNwKGWVTaQlLTYaw
 t+t/MDjzGFmVZGDcFSXYlWBk0TxLkN1KJQdjXswyJBZEVKDukSIdnQsAwdIGgiCLYFlJizhNcc
 lsJnA1Br5xKY/06ByaA58l/c+uXWZR4mLD5/9mehn/8onAoS+blrUra605mvv/fIUd7R+Ut22b
 V/Lh9UA1gAAAA==
X-Change-ID: 20260710-schneider-v7-2-rc1-eip201-upstream-a470e5eab92d
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

Adding support for clock nexus had some prerequisites requested by
Stephen, such as adding new selftests, the initial discussions come
from:

Link: https://lore.kernel.org/linux-clk/20260129201003.288605-1-miquel.raynal@bootlin.com/

Changes in v3:
- Prevent out-of-bounds clock-ranges fallback in of_parse_clkspec()
- tests: Check of_clk_add_hw_provider_kunit() return value and fix node
  ref leaks
- Link to v2: https://lore.kernel.org/r/20260710-schneider-v7-2-rc1-eip201-upstream-v2-0-b4680787377e@bootlin.com

Changes in v2:
- Collected tags.
- Rebased on top of v7.2-rc1
- Exported (test) clock symbols using the _IF_KUNIT() variant, and
  imported the NS in the test file.
- Fixed a leaking node reported by Brian in the tests. Also used
  existing helpers to simplify the test implementation as he wisely
  suggested.
- Reworded the nexus node binding description as suggested by Stephen.
- Dropped redundant and non restraining properties from the Nexus
  node as suggested by Rob.
- Assigned clock/clock-rate properties now traverse Nexus nodes.
- Rename helpers following Stephen proposals.
- Rework tests following Stephen hints.
- Link to v1: https://lore.kernel.org/r/20260327-schneider-v7-0-rc1-crypto-v1-0-5e6ff7853994@bootlin.com

Signed-off-by: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>
---
Miquel Raynal (Schneider Electric) (7):
      dt-bindings: clock: Introduce nexus nodes
      clk: tests: Add clk_parse_clkspec() Kunit testing
      clk: tests: Add Kunit testing for of_clk_get_parent_name()
      clk: Improve a couple of comments
      clk: Use the generic OF phandle parsing in only one place
      clk: Add support for clock nexus dt bindings
      clk: tests: Add Kunit testing for nexus nodes

 .../bindings/clock/clock-nexus-node.yaml           |  30 +++++
 drivers/clk/Makefile                               |   1 +
 drivers/clk/clk-conf.c                             |  12 +-
 drivers/clk/clk.c                                  |  15 ++-
 drivers/clk/clk_kunit_helpers.c                    |  31 +++++
 drivers/clk/clk_test.c                             | 139 +++++++++++++++++++++
 drivers/clk/kunit_clk_parse_clkspec.dtso           |  31 +++++
 include/kunit/clk.h                                |   2 +
 8 files changed, 249 insertions(+), 12 deletions(-)
---
base-commit: 7f26e010764df304602f33912a0550dcf46e72c2
change-id: 20260710-schneider-v7-2-rc1-eip201-upstream-a470e5eab92d

Best regards,
-- 
Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>

