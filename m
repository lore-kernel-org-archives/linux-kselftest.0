Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-26.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A55DBC433E0
	for <linux-kselftest@archiver.kernel.org>; Tue, 19 Jan 2021 23:53:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 79AA32251D
	for <linux-kselftest@archiver.kernel.org>; Tue, 19 Jan 2021 23:53:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730629AbhASXxa (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Tue, 19 Jan 2021 18:53:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730599AbhASXxY (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Tue, 19 Jan 2021 18:53:24 -0500
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B32FC061757
        for <linux-kselftest@vger.kernel.org>; Tue, 19 Jan 2021 15:52:41 -0800 (PST)
Received: by mail-yb1-xb49.google.com with SMTP id r1so12573004ybd.23
        for <linux-kselftest@vger.kernel.org>; Tue, 19 Jan 2021 15:52:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=JEMTUZ20yMo08GXgCsAKGqGJK8V3DyGDgd8Y1lymdBc=;
        b=bgjnlKeiHI6RzMOOdt7M8I21LGue+wOl+S6abgFOIJHOYcOtJ7rD2heCgbrnefoF5w
         Xj+3ySLX52m4Tww0KAeEhxlZY0HiMRwYyaIoWnHGEw59zWwYYByZ173ME7fAjVDtHfpB
         Z4RfxSXHvhKt3q6qf5jGByUyrzFTfxO5qMiwAr4cVupbmstS1OJrIhSMrzjTfGM6NCKf
         Qgjw6+/sLBvP8TpmNCIOxMwF71vwGipIJokxov9b7XvUM2jhX9NZA3SR1oE0Iqn889Lb
         TSwxHLVznYUjOt/uKcmz03C8NS2lB9iQxPDaITQqg0/kCrBILQTO72nOAUs5H2Bft625
         w/Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=JEMTUZ20yMo08GXgCsAKGqGJK8V3DyGDgd8Y1lymdBc=;
        b=jaPfQArGsFNeC9l6MaIk9kYWtZtBuPvrnkJZLctFP7Z/vmuxrRcO3GDb4NRp2QLIFO
         IOcSJEt41JfH+7AbXYx3FuIl6hAruUAIwTLa9RifczonOUXCNBB8WVP8jrw5OdNRaPCX
         aKK1Yq6sFiouA0JqyXJdRXjxqymxwrPPQdnsvLbk6u9+VAiJEMT2g5OV/z2w8TtyVlEB
         lYbO1dkYKM36yO+osnJqUiyK0yByj6JXyEgT0HKWeZQ3x6zzp4/wdT7bAy4ldHnfzkcj
         gOMPNAJAWqTFlwdyy5wLsWiyhL0RYJIylQioum7Wbo1buvKlHeMabWH2OldJWk6Tyv+F
         sETQ==
X-Gm-Message-State: AOAM531+IAYJhoyp7n6i3PYQShvD+QsSBQyBEnz2gu5H3R764u1H6mlJ
        8ePKbK/gzMn6VbQJR2EL+xB8XGI/ozec5w==
X-Google-Smtp-Source: ABdhPJx9gADC9+UacYJUO+wrvyHZD58QYvIE7h9HdWAaUkYJWmnpygaVuChl1i21I3HcPfSHcZQtTFAANlaiRg==
Sender: "dlatypov via sendgmr" <dlatypov@dlatypov.svl.corp.google.com>
X-Received: from dlatypov.svl.corp.google.com ([2620:15c:2cd:202:a28c:fdff:fee3:28c6])
 (user=dlatypov job=sendgmr) by 2002:a25:99c6:: with SMTP id
 q6mr9687488ybo.408.1611100360313; Tue, 19 Jan 2021 15:52:40 -0800 (PST)
Date:   Tue, 19 Jan 2021 15:52:26 -0800
Message-Id: <20210119235226.93280-1-dlatypov@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.30.0.296.g2bfb1c46d8-goog
Subject: [PATCH] KUnit: Docs: make start.rst example Kconfig follow style.rst
From:   Daniel Latypov <dlatypov@google.com>
To:     brendanhiggins@google.com
Cc:     davidgow@google.com, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, skhan@linuxfoundation.org,
        Daniel Latypov <dlatypov@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

The primary change is that we want to encourage people to respect
KUNIT_ALL_TESTS to make it easy to run all the relevant tests for a
given config.

Signed-off-by: Daniel Latypov <dlatypov@google.com>
---
 Documentation/dev-tools/kunit/start.rst | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/dev-tools/kunit/start.rst b/Documentation/dev-tools/kunit/start.rst
index 454f307813ea..560f27af4619 100644
--- a/Documentation/dev-tools/kunit/start.rst
+++ b/Documentation/dev-tools/kunit/start.rst
@@ -196,8 +196,9 @@ Now add the following to ``drivers/misc/Kconfig``:
 .. code-block:: kconfig
 
 	config MISC_EXAMPLE_TEST
-		bool "Test for my example"
+		tristate "Test for my example" if !KUNIT_ALL_TESTS
 		depends on MISC_EXAMPLE && KUNIT=y
+		default KUNIT_ALL_TESTS
 
 and the following to ``drivers/misc/Makefile``:
 

base-commit: 146620506274bd24d52fb1c589110a30eed8240b
-- 
2.30.0.296.g2bfb1c46d8-goog

