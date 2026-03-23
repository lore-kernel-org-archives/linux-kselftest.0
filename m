Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E273C3431
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Mar 2026 17:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774286740; cv=none; b=LFwUyj2Dv7N9gmX7zs5B0WPd9PaVwsm3vEfTpcGbDsSNkTkqWRfqJZSCZelW7Bz3bsQ96i8Ymav5R/f1r9bq37p9O2pnl6pk/GfAncW8CY5goEG7Ar/5oGlN5DKtt9yn2XDtQcBaUCBFuYKwVjxD2/xg6sa5NCn7eiBKRLmiOAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774286740; c=relaxed/simple;
	bh=+nP+gni8/gEa7L5rSh2OfM2oe7tVFrsRHTa/XrsqwdA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mfVXx9DpjM40huleBlmQVorYh44hWfIV0e3lEIlNbCwcJ02ZgzG2XOiSa2KRDQyMaqF5edwgNEKo3JYgmwcW6UvY7IzuN9bfQanITnYf2kEEkfw+wpeeXQKAxfgDtyaHvzrnNTT9bDMBoCIbI2NzigXjTLS/PtWkz6Ze8uOO9Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KsvGU6X6; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=EiXx5P5A; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KsvGU6X6";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="EiXx5P5A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774286737;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1bY+63s9LpzIA5GqxQmRtmQcLgW30BrQbTCvbLnw8oM=;
	b=KsvGU6X6nnAOETBCnb63UaH+2vWghz2k0dumffpV7Y5mXKPnEHuZxQTxNEUrgNSCATmCfz
	Gk2P3uGukakgUy3Qyw6BPQYBN3OyuFrOMNLosNTnr16HavsRlNifh5ak5YPw4UId7XUINH
	BrxbrVnGLXP2eVoTlYaoBZD/S2Bj8hI=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-190-Yyr3K9mHO3Kbe4g3e33kaw-1; Mon, 23 Mar 2026 13:25:35 -0400
X-MC-Unique: Yyr3K9mHO3Kbe4g3e33kaw-1
X-Mimecast-MFC-AGG-ID: Yyr3K9mHO3Kbe4g3e33kaw_1774286735
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5093b92f327so327308341cf.1
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Mar 2026 10:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774286735; x=1774891535; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1bY+63s9LpzIA5GqxQmRtmQcLgW30BrQbTCvbLnw8oM=;
        b=EiXx5P5AazvOIL4zvv76XjVAlSX/+wtyEmzbBDL+WUgv8WLOLytVsaRlY7wZi2PB/F
         mvRhparYFwK5xbwoDmIjWZCOJAI/mY8KExXUbx1dxOFQXuavgwSi8ta6JkvCjBNtCJWn
         igQ4ckEYcM/FfSx3v0fOrmjIoruDIgc50DSGjyAmtlK/6/Aiwsute2H84eKrzC4GtTZ3
         TCBEm7WNbHxJ2LBz36PA4whHqMPMNM51jIQvu1YK9ko7zqE5Q4VcXe42Old9ST73uVk2
         rd92Dd+MZPxDmn6JlmJ7p2x8qXhVAVRaVK9VNHz8WV+bSieQ+FqFlH+tuH4/dT+NHgKl
         sYJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774286735; x=1774891535;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1bY+63s9LpzIA5GqxQmRtmQcLgW30BrQbTCvbLnw8oM=;
        b=VlX47339BXVPIV754hxEq9FjitgkAwWPhLn8IENV3ggsg0w+Ulx0hD4SwhZQshSVHG
         f2ufzS+SRGCuLHncE0udxJKo3WqvSkHk9RBaWwFXwYHIEkjeE1CetpbYSNfd75TFGvsg
         YDLY0uuKA2pbjIiJNb323mllq/Lkoyk767H6WzEaizck2+aW5MSTyiTvsP0rxZegqG+m
         i9TxWdyiN/n8HnZs/wh3oIIu7EjN++po6P2jb49jDLm9R/08XHz+gC8yWuaOD2crYx0/
         habdDBNRtD3nk65mRDK09mkyYPqmXraWigPj2XyonxMpuRqhgKNigKjpd+Ck6aIFjd+H
         XS1A==
X-Forwarded-Encrypted: i=1; AJvYcCXtXvfBYowduv7I0pNtz8kkZe9MrkU5eSD1FECJEcT9fomiKrix8irnsvJ7OUUCLVh0oU8ziKTYa0WHWd74f4s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5s4V9aHlKAnw3VK9Y6SwU9iyvATN3NVmzJv/lJcQX5azCUJHP
	uq8W9rPJTDPYcTW1RDuT2V97EaDBHCM0Wc5xqPez6raPcJgBOqguaAg3/CEeHXD1gFt4I+7IikI
	4KGf0E+3bInXif2hW83NmAzRdUHN/MaBNbEaPhFjgLASzAvClf+Wf4ePwTb57t47q89IYNg==
X-Gm-Gg: ATEYQzybybKrFKSM44PHfxW2qE+W54BWi9ZvFORv+vXy9JvoMwEmW45qbB4q0Dfnol6
	MknOkZEOK+pZoHsrpDkUsZBCcRzcuTQuA7SzUQkSQR9aAI9x6Dy9rr2+TniLffv8nN1/WXJDxqB
	lnWn91VnbqmDCah6u9sfRAsIAOJbjT5LAYwZqo7sgmH4wqfrvIJIc/HGYeaMRicDv0wazmsBybw
	EmozOg3YVBtBX0ut2zRjT0JHpJeoSEeK7mkSRWxjHrnuamCL5WjPeDejGwbsYuEhZciBYH/SzEy
	alhPqZohtKrZwJ0RZiBQtP+hMZJGKfAuVHY30B46ZXuQ+98P1KbYUXZPkwlHJ98jZIT97zb3hYh
	NmEhSRSaGMG2f5glNcBH41Orp90i4hDYdG/wjSk7fDRpjkIY366y1rqUxvnaN
X-Received: by 2002:ac8:5905:0:b0:509:1cf9:ea09 with SMTP id d75a77b69052e-50b375e6175mr204015031cf.67.1774286734943;
        Mon, 23 Mar 2026 10:25:34 -0700 (PDT)
X-Received: by 2002:ac8:5905:0:b0:509:1cf9:ea09 with SMTP id d75a77b69052e-50b375e6175mr204014381cf.67.1774286734323;
        Mon, 23 Mar 2026 10:25:34 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50b36e34f8bsm108249661cf.15.2026.03.23.10.25.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 10:25:33 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Subject: [PATCH v7 0/8] clk: add support for v1 / v2 clock rate negotiation
 and kunit tests
Date: Mon, 23 Mar 2026 13:24:51 -0400
Message-Id: <20260323-clk-scaling-v7-0-8e7193dc9405@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/1WNQQ6CMBQFr0K6tqa09AOuvIdxUcoHGrFoi42Gc
 HcLxijLecnMm4hHZ9CTQzIRh8F4M9gI+S4hulO2RWrqyIQzDkwwSXV/oV6r3tiWVqICoRXmwDM
 SjZvDxjzX2un8YYf3R4yOv7Ezfhzca30Mclm/cdjEg6SM1jytigwRGp4fHdadGvd6uJIlFOBPT
 sVWhihrLMoSCi15tpXneX4DhZgvqPkAAAA=
X-Change-ID: 20260305-clk-scaling-b3b63cae7624
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Alberto Ruiz <aruiz@redhat.com>, 
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
 Rae Moar <raemoar63@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5449; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=+nP+gni8/gEa7L5rSh2OfM2oe7tVFrsRHTa/XrsqwdA=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIPljebqqtsLg+8vTR3ZVPNAweBuz6zeY96VZy6F2w+0
 4d379m7HaUsDGJcDLJiiixLco0KIlJX2d67o8kCM4eVCWQIAxenAEwk9znDX5l0YZafdUfuPTnY
 UPZVRDr2way7opPv39/zbVJDUPGVA4wM/yuflixyMak7qeTIqGipJX+VVWLP4W9HflSdntdb9Nh
 ZkQcA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

The Common Clock Framework is expected to keep a clock’s rate stable
after setting a new rate with:

    clk_set_rate(clk, NEW_RATE);

Clock consumers do not know about the clock hierarchy, sibling clocks,
or the type of clocks involved. However, several longstanding issues
affect how rate changes propagate through the clock tree when
CLK_SET_RATE_PARENT is involved, and the parent's clock rate is changed:

- A clock in some cases can unknowingly change a sibling clock's rate.

- No negotiation is done with the sibling clocks, so an inappropriate
  or less than ideal parent rate can be selected.

A selection of some real world examples of where this shows up is at
[1]. DRM needs to run at precise clock rates, and this issue shows up
there, however will also show up in other subsystems that require
precise clock rates, such as sound.

This series introduces kunit tests to illustrate the current behavior in
the clk core. As discussed at Linux Plumbers Conference 2025 in Tokyo
[2], it was suggested to move the negotiation logic into the clk
providers themselves so that only the clks with this issue can have
their rate preserved, and add some common helpers to the clk core.

Changes since v6:
https://lore.kernel.org/r/20260313-clk-scaling-v6-0-ce89968c5247@redhat.com
- Move 24 MHz assertions at the end of
  clk_rate_change_sibling_div_div_test_init() into the top of the
  various divider tests to make it clear about the initial state of the
  clk tree in each of the tests to make it more readable. (Maxime)
- Move divider tests from clk_test.c into new file clk-divider_test.c
  (Maxime)
- Dropped clk_v2_rate_negotiation kernel parameter since it's no longer
  needed since the new code is very targeted to a specific part of a
  clk tree with this new approach. With the kernel parameter, we would
  have two code paths to check, and the unlikely path would get very
  little or no testing. This keeps it so that we have one path. (Maxime)
- Add Maxime's Reviewed-by on one patch. He added more Reviewed-bys on
  v6, however I didn't include them since I refactored some of those
  patches due to other changes requested.
- Drop test for clk rate of 0 in clk_hw_get_children_lcm(). Add
  clk_hw_is_enabled() check instead.
- Export clk_dummy_rate_ops and clk_dummy_context() from clk_test.c to
  avoid code duplication in the clk-divider tests.
- Simplify test names (s/sibling_div_div/divider/)

Changes since v5:
https://lore.kernel.org/r/20260306-clk-scaling-v5-0-d21b84ee6f27@redhat.com
- Dropped all of the helpers, and complexity to the clk core. To solve
  this problem, we don't need to chain rate requests together.
- Add more unit tests
- Convert clk-divider.c so that there's a real user of this new API.
- This series no longer has the problem where large numbers of boards are
  moved over at once to the new v2 negotiation logic.

Changes since v4:
https://lore.kernel.org/linux-clk/20250923-clk-tests-docs-v4-0-9205cb3d3cba@redhat.com/
- Reworked based on feedback at Linux Plumbers [2] as described in two
  paragraphs above.
- Dropped gate and mux tests.

Changes since v3:
https://lore.kernel.org/r/20250812-clk-tests-docs-v3-0-054aed58dcd3@redhat.com
- Update clk_core struct members (Maxime)
- Add v2 rate negotiation logic and additional kunit tests
- Drop clk_dummy_rate_mhz() in kunit tests; use HZ_PER_MHZ

[1] https://lore.kernel.org/lkml/20230825-pll-mipi_keep_rate-v1-0-35bc43570730@oltmanns.dev/
    https://lore.kernel.org/linux-kernel/20230807-pll-mipi_set_rate_parent-v6-0-f173239a4b59@oltmanns.dev/
    https://lore.kernel.org/all/20241114065759.3341908-1-victor.liu@nxp.com/
    https://lore.kernel.org/linux-clk/20241121-ge-ian-debug-imx8-clk-tree-v1-0-0f1b722588fe@bootlin.com/

[2] Fixing Clock Tree Propagation in the Common Clk Framework
    https://www.youtube.com/watch?v=R8TytDzlcFs
    https://lpc.events/event/19/contributions/2152/

Link: https://lore.kernel.org/linux-clk/aUSWU7UymULCXOeF@redhat.com/
Link: https://lpc.events/event/19/contributions/2152/
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Brian Masney (8):
      clk: test: export clk_dummy_rate_ops and clk_dummy_context() for other tests
      clk: divider: introduce divider kunit tests
      clk: introduce new helper clk_hw_get_children_lcm() to calculate LCM of all child rates
      clk: divider: test: introduce additional test case for parent rate change
      clk: introduce new flag CLK_V2_RATE_NEGOTIATION for sensitive clocks
      clk: divider: enable optional support for v2 rate negotiation
      clk: divider: test: introduce additional test case showing v2 rate change + LCM parent
      clk: divider: test: mark some tests as supporting only v1 negotiation

 drivers/clk/.kunitconfig       |   1 +
 drivers/clk/Kconfig            |   7 +
 drivers/clk/Makefile           |   1 +
 drivers/clk/clk-divider.c      |  28 +++-
 drivers/clk/clk-divider_test.c | 364 +++++++++++++++++++++++++++++++++++++++++
 drivers/clk/clk.c              | 107 ++++++++++--
 drivers/clk/clk_test.c         |   9 +-
 include/kunit/clk.h            |   7 +
 include/linux/clk-provider.h   |   5 +
 9 files changed, 508 insertions(+), 21 deletions(-)
---
base-commit: 785f0eb2f85decbe7c1ef9ae922931f0194ffc2e
change-id: 20260305-clk-scaling-b3b63cae7624

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

