Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3818C433F5
	for <linux-kselftest@archiver.kernel.org>; Tue, 29 Mar 2022 10:39:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235280AbiC2KlI (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Tue, 29 Mar 2022 06:41:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231955AbiC2KlI (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Tue, 29 Mar 2022 06:41:08 -0400
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA111385;
        Tue, 29 Mar 2022 03:39:25 -0700 (PDT)
Received: by mail-qt1-x829.google.com with SMTP id j21so14854905qta.0;
        Tue, 29 Mar 2022 03:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5Ecw2v/7sJWWbjDq3WJP55wjT6CTt1W28tsRHnE8O4o=;
        b=JHJBqa1piz3YU9iObDM7KXs06Yt+QFBj/gqoPldKRWcaeWKF45+NcCxkNjCI/Iz3Vt
         XvGjCpLxC3hTK5NL9Vpf9zNCevbtlzYA1n1fqtuZsF/q0SkuCle0+LbDSeTtaitoau+o
         A4q/IVSf+cXN5tDRsN6K+7z9o78VTOgxjASvPExbZlhpn7P3Bn8teoE6AO0kvDsLaOgt
         lmw9+zKJWFGPmOyg85ZUFXALO0hUPjhYwhi0NM2iajqnMuNYfR/LRDo023Cg8wDk2X+O
         1m2/WsnB/l8YQ7n3NtFOjbfM0l6f2yCxsNu2l2WYxEeXt847pbOIgjkha1MzsD6dwcco
         rPQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5Ecw2v/7sJWWbjDq3WJP55wjT6CTt1W28tsRHnE8O4o=;
        b=TEg3fEHDso13Rg9wNfmsJbV2ZeuC3jhpl1zHb2LD995shIwedm+tB0u+qhgOjfEBtU
         A55xSFkzEz/0L1GzfQ7fNMv7kEkjS80SntiS0cemuo10JHeYlMmutdkA0D7/nviKzqb6
         2YszpnhxEGdoCF5IHf5XOsnB3Wi0wW0vyB28m8cbmiADv0Vysdcpx6nvPxcZnckyUMNX
         E4dXYuoxOGq4qQ1WLCiFNAb8OB+i+rWo57INyWNzmc5o3qcYjJUtixDWu/7NGkeF7beK
         DTdJGrXxBUL7t+PD0/Bvn37Y+wwcCItvP8yK+e1Mgkd/hjp0nCQm3bJjNwU0hztfPR2h
         eMpA==
X-Gm-Message-State: AOAM530My0HnGBp5Csl4T+sWzZYLVd9DlBDmehUawOFrDwAfKaALTIZD
        l8VFTj9lRo71XFLKR5Xsa4HcK+zM62A=
X-Google-Smtp-Source: ABdhPJyQs2ovCBp7Z22B/uO+SVqUPrN1oCUQwzzVBW+swp08Nv0nInAmc4/6G5gnOGMm1VlI8P4c+w==
X-Received: by 2002:a05:622a:1703:b0:2e1:c663:27aa with SMTP id h3-20020a05622a170300b002e1c66327aamr26343742qtk.112.1648550364904;
        Tue, 29 Mar 2022 03:39:24 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
        by smtp.gmail.com with ESMTPSA id c11-20020a05620a134b00b006809a92a94fsm9137873qkl.79.2022.03.29.03.39.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Mar 2022 03:39:24 -0700 (PDT)
From:   cgel.zte@gmail.com
X-Google-Original-From: lv.ruyi@zte.com.cn
To:     brendanhiggins@google.com
Cc:     linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
        linux-kernel@vger.kernel.org, Lv Ruyi <lv.ruyi@zte.com.cn>,
        Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH] kunit: tool: add null pointer check
Date:   Tue, 29 Mar 2022 10:39:19 +0000
Message-Id: <20220329103919.2376818-1-lv.ruyi@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

From: Lv Ruyi <lv.ruyi@zte.com.cn>

kmalloc and kcalloc is a memory allocation function which can return NULL
when some internal memory errors happen. Add null pointer check to avoid
dereferencing null pointer.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Lv Ruyi <lv.ruyi@zte.com.cn>
---
 lib/kunit/executor.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/lib/kunit/executor.c b/lib/kunit/executor.c
index 22640c9ee819..be21d0451367 100644
--- a/lib/kunit/executor.c
+++ b/lib/kunit/executor.c
@@ -71,9 +71,13 @@ kunit_filter_tests(struct kunit_suite *const suite, const char *test_glob)
 
 	/* Use memcpy to workaround copy->name being const. */
 	copy = kmalloc(sizeof(*copy), GFP_KERNEL);
+	if (!copy)
+		return NULL;
 	memcpy(copy, suite, sizeof(*copy));
 
 	filtered = kcalloc(n + 1, sizeof(*filtered), GFP_KERNEL);
+	if (!filtered)
+		return NULL;
 
 	n = 0;
 	kunit_suite_for_each_test_case(suite, test_case) {
-- 
2.25.1

