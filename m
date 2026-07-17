Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E468234CFC7;
	Fri, 17 Jul 2026 15:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784303974; cv=none; b=fteILsNp/0uZCJ0uR6a2jj+iOMmq1GHmsK+FiZvXOFaJsjsinbGvJP0jLNpBP/6WijCrCgbO0mOtpMjDXblvtoY2VBjtEySQkrphORB/Dxc8jz4zCwUpKNH20nQe7fBGvRbb6W2gQ2VXCQJL+AJQzJyK7Gt/MOSyxAmoSoQPHD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784303974; c=relaxed/simple;
	bh=2ySKVJHEYJ9b4Hu2QmS50I5VYM80H72Yb3ncuiYzURs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QhzpGNj83Ruinz+b0F6qlRssub9bs06BfaTzLTldyapqrFma0qnlbTijJ1ccEDvaoZNiGvHYZWwtOzBQWN1UkRgrfrUZP0AkAb29QE/sPodofrbEIzG+Dj/nvMZhRFlVa3f0o6R6MsGbSo0mkSYc8i/2uXi93o/UQHkOHwsf/tY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=pMLBP5oE; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="pMLBP5oE"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2D7FB4E40E1F;
	Fri, 17 Jul 2026 15:59:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E536260361;
	Fri, 17 Jul 2026 15:59:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7BA3011BD04D0;
	Fri, 17 Jul 2026 17:59:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784303968; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=F2BGsKr7N3XWJmJ4aqE/UETUyr928syJPbAkO96C3Oo=;
	b=pMLBP5oE3LIQRMhrOIaGFaasEL7lkqgWJM5FOruJ6Vjomp/0qsU6VF2xeytSfmy/AtmxW8
	Z0yvGfA7HSiTUuyum/LnGA7DeO1RBAIdoftN68dEyV+nJrH/uXFB1AzPYRK8Tf1wgW2bF+
	/w3ma2yGyM8zO++WCpAjVrfwLo6T4gzbXSFVDnDOfD4WrRZOJYL/G+rPKoevaDBgY3gybT
	rHwtiT4NbUFuZIpflHNTyT2S6BESImOkrxyhzK7IlP67PtrLfdlEOrK49fFVKbTers96T7
	N5N4TABAU6FLYyNtT8WgHZ5xTFyzQnBsXiZ8fVI/kHjeMNVAB3kcUZM55HHtiA==
From: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
Subject: [PATCH v4 0/7] clk: Add support for clock nexus
Date: Fri, 17 Jul 2026 17:59:16 +0200
Message-Id: <20260717-schneider-v7-2-rc1-eip201-upstream-v4-0-751547e160e5@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5XNsQ6CMBDG8VcxnT1T2kKLk+9hHEo55RKhpMVGQ
 3h3C5NuOl3+N/y+mUUMhJEddzMLmCiSH3Ko/Y65zg43BGpzM8FFxXXBIbpuQGoxQNIgILgCkEb
 BC3iMcQpoe7BKcyzRNrVoWYbGgFd6biPnS+6O4uTDa9tMYv3+xScBHBpVGa6NllrjqfF+utNwc
 L5n60CSn2j1EyozWhtVKjQyH/eNLsvyBmH5HHMrAQAA
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

