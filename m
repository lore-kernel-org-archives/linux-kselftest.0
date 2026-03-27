Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 184F53815D2
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Mar 2026 19:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774639953; cv=none; b=IO265oB48uaRpqqPeOCqz3TWMYEAlrqmT9Nw7Ki+5SSWzaCQvFgRi0k03Ejk3s3kVgQh6Ml3bmzMXOEx0vSr163NkEEIaTsYSSaz+J5IdfyNqX4PUULwTD77fJikO2mUF3Kc8jlnbedVeR0gkppRIAACkFzlrK8/q66R745k3zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774639953; c=relaxed/simple;
	bh=F2CVgNkjGWPfnnato8bleUclBsTLh9DjnP2ns7LPhj4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CniPv0+rXJCBTqNKD7NLVlj8RyJoMwlNlmuMr0HJF4p78/6mkGoczQlCohbU/D+i0k5h1mPAPDqllM34YotAzWRYF9wB3ggx6y+DrWFS6sbo5bRIrjt1lilocA6HV+r4VXGML245aIkr3Mlw9ip0kRsf0sOIEtrvfbAGb2YJzzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bG1mGRsi; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=MHr+EHS9; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bG1mGRsi";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="MHr+EHS9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774639943;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Ukb2osEY1bcCNh/6FTrbvYd3RKc8PbeIaVRV+SuCHWA=;
	b=bG1mGRsiSrNdFGOznW6KRfUq51LacPZbZa0bXnXNIMn5QC/cA2+i6BQks63A9QrgmnHVEe
	WWPaTTeHaY/1XBVes4YL9aD0baui+CN/pHMH6ZeL6lgp2HWvoi0REyPcou/daRoAeLTooi
	UNzn35cyF7nR35Z6cseOKoaEQsxutjo=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-228-J4tqSvjoNWGr_AExJTDhKA-1; Fri, 27 Mar 2026 15:32:22 -0400
X-MC-Unique: J4tqSvjoNWGr_AExJTDhKA-1
X-Mimecast-MFC-AGG-ID: J4tqSvjoNWGr_AExJTDhKA_1774639941
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b274f94f8so2485921cf.1
        for <linux-kselftest@vger.kernel.org>; Fri, 27 Mar 2026 12:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774639941; x=1775244741; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ukb2osEY1bcCNh/6FTrbvYd3RKc8PbeIaVRV+SuCHWA=;
        b=MHr+EHS9Ljgbi0fe9DpDQZWiVC8NvAYg2NZMeYOcdqxStND41sZ8U2vdmFYdpyze/p
         sNDgXJhIHG1TdKKt5WwIBjJrEknWmyndKzYUPEg4zn8vGlOsG8qAIvY98XsR36FPbG2m
         dRuvPjiIHdtXoj0jPxPePwXn25u64kD5SFItnHuAFBlyavL3/p438HUQ1WiHEOr/2cls
         FrIoLIWt5tLhIgPbu04mSPmJeVSe5UngKbQEEVUwl1o/Cmlo1bUh1ppwjqRdh9AoGv7P
         LegahV1ZL5Lzk4uVhdM4EMCS1uqaML9zdLSWDEPNcnsiXjYyoAx8ritVM2h8JH9+JGAH
         rK7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774639941; x=1775244741;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ukb2osEY1bcCNh/6FTrbvYd3RKc8PbeIaVRV+SuCHWA=;
        b=J3gRFFj2F1fRqPjAX4/qOC0C1fDVLhZtuSXWU+OpLVzwJ5yUeHBVzJJ5IDWr4emuWW
         zB9zIDqtgJzoW+MtSASvRKlg0j8SLxul0PplW09KBrjhnCUrG23hrny0HXxgFpNVNFqk
         Xpt7HsypSLXvw41Oo9nC6om5po3qMkhY9SWmAIi9uoDR7xWzL7tAqutFl1JMMj8NcUpp
         VbIogpu3IQyCUXRrFFKJmxXuoIg/BJgKQwS4EEIz7cZ7CtUYpM4aqPjqb6EsdHVKSlxk
         QXSjocPA+nK2Fpm4MT2i+CnpiBL5aqoVqkxI6u4EQOqjD61pWa7Brk5n0mdJWpegEDof
         ym7g==
X-Forwarded-Encrypted: i=1; AJvYcCXsJDWHZIQ6Nd9Ro/8CKKOxb53oR+Y/9eXXmNo/tZUnuywU0qvj/33jQAkzjWpFH51Xq14TrU5q+r1kcjq/8fg=@vger.kernel.org
X-Gm-Message-State: AOJu0YydMQclCRh1qUH54SkOgJL271JX5XiMhDKCpZXOS95raxcsUfEZ
	XWE37jFF0Wut9gjpvLSxtKsUgRmBgTrX3LQTThenwpHfvFtrYcYd5ILxrVsrUmp/OYR/s1XuVfa
	DNrC+o6wQjlivWItUqCslrerTj0mbsXfd9sI4qlq8WrjjF1PjneQMAOoYbr1zFjqSFOKa67PALW
	f35yzPxmgJHJOAFVu8OQG9Wo58M7pVl0Gyh+NWQtZUGmP/9+MqzLiW
X-Gm-Gg: ATEYQzwFHWzXIg2WLyZz+FFsW1G1x75vNsDNFkfcT58sTfHR18lKpBtSMXS4NNQLfpl
	1y2paZiT/6g2bf8vTid+jMYD3NGWtlOaktQVIm4kvciw19Gl0z+5/crIxJY79Gwgl7X5GZzu/h6
	QDuBdPsJcoYlaDEIqXd540usm5ttMmVXANp0z4hLt7h61nt1bhGOjvh8iJVc5RenYS7aMEIi8KB
	QIqzv0UqkbNzQr3Rw3P3jCZmjp8OVlP7fvX6E//SmeGKxXx9X8XV5A4dvWsvE04IVq/tfmgcwwi
	ZZFbTAjTB/mr1ihPRZkyeLgpZ8eXUrjNmBnqgsFQE40HndoO9QriSOHfrpQ27J6BvHkZfegG/8+
	eEv2meSYy+kmiB5OgpGJipFgKCjAVuQkcn6R6sa4jYeqABvyLWXzs5W0lKJi5
X-Received: by 2002:a05:622a:1a87:b0:4ed:70d7:aa5a with SMTP id d75a77b69052e-50b994a4d1fmr83800001cf.25.1774639941388;
        Fri, 27 Mar 2026 12:32:21 -0700 (PDT)
X-Received: by 2002:a05:622a:1a87:b0:4ed:70d7:aa5a with SMTP id d75a77b69052e-50b994a4d1fmr83799491cf.25.1774639940776;
        Fri, 27 Mar 2026 12:32:20 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50bb2c678e9sm2037551cf.6.2026.03.27.12.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 12:32:20 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Subject: [PATCH v8 0/8] clk: add support for v1 / v2 clock rate negotiation
 and kunit tests
Date: Fri, 27 Mar 2026 15:31:55 -0400
Message-Id: <20260327-clk-scaling-v8-0-86cd0aba3c5f@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2XNTQ6CMBCG4auQrq0p/ceV9zAuoB2gUUFbJBrC3
 S0YI+jym+R5Z0ABvIOAdsmAPPQuuLaJQ28SZOq8qQA7GzeihErCiMDmfMLB5GfXVLhghWQmByU
 pR1FcPZTuMdcOx/f2cLvHaPc91i50rX/OH3sxXT9xuYr3AhNsaVpoDiBLqvYebJ13W9Ne0BTq5
 QKnbI1lxAZ0lkltBOX/WC0w/cEqYg0qzZg1GSdihcdxfAFSa2KlNgEAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6540; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=F2CVgNkjGWPfnnato8bleUclBsTLh9DjnP2ns7LPhj4=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDKP3bbKlRf19fFftstvnu+qPQkfKrlX/8x+w7xNZcu/3
 7y//P8xdJSyMIhxMciKKbIsyTUqiEhdZXvvjiYLzBxWJpAhDFycAjARwzZGhq6afp0791/tt328
 d12sqfC6OK6ZT5dueLAp6X0yu+0Do3CG/7Hy23lTjec6LN7sfsbIhHVy/HMr+2+p99kWTtJoSuD
 7wQMA
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

Changes since v7:
Link to v7: https://lore.kernel.org/r/20260323-clk-scaling-v7-0-8e7193dc9405@redhat.com
- Address some issues identified by Sashiko
  https://sashiko.dev/#/patchset/20260323-clk-scaling-v7-0-8e7193dc9405%40redhat.com
- clk.c:
  - Add lockdep_assert_held(&prepare_lock) to clk_hw_get_children_lcm() and
    clk_has_v2_rate_negotiation().
  - Check for child_rate == 0
- clk-divider.c:
  - clk_divider_bestdiv():
    - Add null pointer check on parent for orphaned clks
    - Round the lcm rate through clk_hw_round_rate()
  - divider_ro_determine_rate(): remove v2 negotiation logic for fixed
    dividers.
- clk-divider_test.c:
  - Check return value from divider_get_val().
  - Use clk_hw_get_clk_prepared_enabled_kunit(); drop
    clk_rate_change_divider_test_exit() since it's no longer needed.
  - Change KUNIT_ASSERT_TRUE(test, !__clk_has_v2_negotiation(...)) to
    KUNIT_ASSERT_FALSE(test, __clk_has_v2_negotiation(...))
  - Add KUNIT_ASSERT_EQ(.., ret)
- kunit/clk.h: include linux/clk-provider.h
- A few minor grammar / spelling updates.

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
 drivers/clk/clk-divider.c      |  15 ++
 drivers/clk/clk-divider_test.c | 350 +++++++++++++++++++++++++++++++++++++++++
 drivers/clk/clk.c              | 114 ++++++++++++--
 drivers/clk/clk_test.c         |   9 +-
 include/kunit/clk.h            |  11 +-
 include/linux/clk-provider.h   |   5 +
 9 files changed, 492 insertions(+), 21 deletions(-)
---
base-commit: 785f0eb2f85decbe7c1ef9ae922931f0194ffc2e
change-id: 20260305-clk-scaling-b3b63cae7624

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

