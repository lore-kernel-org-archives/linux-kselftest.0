Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6C427466A;
	Fri,  7 Aug 2026 15:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786116263; cv=none; b=lgYq6Sp5JN/sRzoM1gsoNpxcCGnlO3dE/9Ph0GgIDhgFgIBOZwm0gzZQQ5YiH0oDnl13GwhygFYM3Jk6RwpzxlNSnAKXVdyU6RGi4NbRM2PLS6hnDTB3rR3ehq8YSxi9/tnhKZxu6wFyyHfcvz/cTMWcfO7JPwbtxPh5ZAeI9hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786116263; c=relaxed/simple;
	bh=/YIMkYiiMnTbvDCILWTkQCZ7s+D6ywrIjdQ0XntujtI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TQrx4le8xfJL+jP6Xd73U367Sta7BzlyuwjgPiodavtZNbqgO93SqCHyOHKcLggI8O0VzBWzwZG+mS89j6FO1n0q+VBUUVtT7+qY5fDPywB0d7G6ITatBb6IabARMvtCR1yG29EhgumjXDawbOX5cOzx0ELDX0aqlET6Qir0qT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=z7FLizxK; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="z7FLizxK"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9194B4E4113F;
	Fri,  7 Aug 2026 15:24:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5D5E9603F0;
	Fri,  7 Aug 2026 15:24:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A5CF911C37ABC;
	Fri,  7 Aug 2026 17:24:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786116257; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=iy2SF4T0jZmpRaS70n22aR4+O9IH+F6owy2QheVd4dw=;
	b=z7FLizxK9zikxs9sg0JQi1JbD+J2VVQuEY/D7Bx35POpcVQq2OmJDa9AUdLhiTWX3djQqH
	pFXOSzZFAe8UtZbg9kzmH6dx2Z98rJa7dHBjpu/PkGIq7/by/lGz56byB1e3h06omLjaKi
	2tLGlXkmdrZJ6QDoJ6G/sxoXCxA+j3hXvIapYpKauTYWaPm5g78MNLPr7licz3gmigIzLI
	N3jikVwTQCOkwDUQeyRm581gLCedw+PZbH2w26kTBz09OQAvuXcOf/Ft3/lWyj5QmMWgWn
	6l/KxdldhMoypyB5kaHRUN2cDk0B2VcwS5xDBNawgX4pHcwV47Jp46I3CYwvhQ==
From: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
Subject: [PATCH v5 0/7] clk: Add support for clock nexus
Date: Fri, 07 Aug 2026 17:24:01 +0200
Message-Id: <20260807-schneider-v7-2-rc1-eip201-upstream-v5-0-8785f9531cf0@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5XQMQ7CMAwF0KugzBglaVIXJu6BGNrUUEu0qZISg
 VDvTmACsZTJ+n94X/JDRApMUexWDxEocWQ/5GDXK+G6ejgTcJuz0FKXEpWE6LqBuKUACUFDcAq
 IRy0VXMc4Bap7qA1KslQ3W92KDI2BTnx7jxyOOXccJx/u782kX+1ffNIgoTFlJbHCApH2jffTh
 YeN8714DaTiEy0XoUVGt5WxhqoiH/eLmk8UF6Emo2iVNUiqzD/5Rud5fgKPdACZgAEAAA==
X-Change-ID: 20260710-schneider-v7-2-rc1-eip201-upstream-a470e5eab92d
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
 Frank Li <Frank.Li@nxp.com>, Herve Codina <herve.codina@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

Adding support for clock nexus had some prerequisites requested by
Stephen, such as adding new selftests, the initial discussions come
from:

Link: https://lore.kernel.org/linux-clk/20260129201003.288605-1-miquel.raynal@bootlin.com/

Signed-off-by: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>
---
Changes in v5:
- Collected tags.
- Added the of_ prefix on the new kunit helper.
- Reworded a commit message.
- All remaining points raised by Sashiko do not seem relevant.
- Link to v4: https://lore.kernel.org/r/20260717-schneider-v7-2-rc1-eip201-upstream-v4-0-751547e160e5@bootlin.com

Changes in v4:
- Fixed the kernel doc of of_find_node_by_name_kunit() which was lacking
  the fact that it could return NULL upon lookup failure. Also improved
  the commit message by mentioning the addition of that helper.
- All other Sashiko reports have either been disregarded because they
  were way too unrelated or just not relevant enough in my opinion.
- Link to v3: https://lore.kernel.org/r/20260716-schneider-v7-2-rc1-eip201-upstream-v3-0-98454e83845c@bootlin.com

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

