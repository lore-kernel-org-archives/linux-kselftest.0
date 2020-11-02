Return-Path: <SRS0=9g6x=EI=vger.kernel.org=linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.4 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AB3AC2D0A3
	for <linux-kselftest@archiver.kernel.org>; Mon,  2 Nov 2020 23:23:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 29CD3222BA
	for <linux-kselftest@archiver.kernel.org>; Mon,  2 Nov 2020 23:23:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="My1duO+u"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726727AbgKBXX1 (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Mon, 2 Nov 2020 18:23:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726074AbgKBXX0 (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Mon, 2 Nov 2020 18:23:26 -0500
Received: from mail-qt1-x849.google.com (mail-qt1-x849.google.com [IPv6:2607:f8b0:4864:20::849])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0A0FC061A47
        for <linux-kselftest@vger.kernel.org>; Mon,  2 Nov 2020 15:23:26 -0800 (PST)
Received: by mail-qt1-x849.google.com with SMTP id p2so8969970qtw.16
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Nov 2020 15:23:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=GbyuVG1wDz+a4ocG3UBehbK3zCwGC07ew5NmRS3bOVM=;
        b=My1duO+uoPb8mcgNVqygZbmHNyuAkUYTyhHn2AUKfL0aa5COST8Lr4wvLbznN17KHt
         BbKUy0jW3JSqYyxNVemEQ5XgGf/Bem+y4rc6VmarxnqALWb6gRTZnxjZjV68rU6aq0ER
         xg62eelGUPgPE1zwTpFNVXeb9v7agH9EgRRMJ6zTRqBFVut/vYaHFPu60AwQsqFn9l2t
         4sWuC+p18L6Spofw+fNlrgVrGLppJ9Qv8ULHh2ZZpoegLY/zwzkAXadgL2K+BiPkhNCT
         Q47wPQO0gjv5YfQRRpPLGuvjGAdQk2ZTtAHsmvg+ChAJrPMXork+xzsGC3OlAVTZUfMM
         mPBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=GbyuVG1wDz+a4ocG3UBehbK3zCwGC07ew5NmRS3bOVM=;
        b=fCdRM3mMNNaATWi8M4dm26DLKXVK2VkwRjokAlY77vpXVj8J9fyS5Zvmpb8cxjqb43
         GPRpXhV/TnN5GtsBgQjVBLinfdrZ3H4kE7x8m29i947plK/IXZiKyaWXsskLFu67Wy04
         h8xii4EynrNVxMTFSpjXIyl6abMaQf5mqMOWnI656q6FcAvU4Zo+uXP0/sOj5U6/CM5L
         EFRIXdpG0smcvOO10TSpJ/sQV0V1EkmS8b+1u72c37o9fydDycT9KFOFsskTN9J/ub2q
         eRc/yRAP2CCSUu41H55tTEbkVQg4EtspXRMpoxD17iMguNQz7KRqZE0tQear65ZpJ3w6
         2D1Q==
X-Gm-Message-State: AOAM532Vu6dERBVYaHePcM0bZTnCubdYssOlBiQYu5G7Nsg6d+gRfCfH
        yRSBOEfx8BGat21Utpbj3YAnO0VPrSE6pw==
X-Google-Smtp-Source: ABdhPJzokfL8AN+cZGQWZE8+c+2ADQxa+FPEl3xaRaXhYN2yQjkcvwH+NjxE5PJ6aEY1zMxjGmc+8d6+vURTEg==
Sender: "dlatypov via sendgmr" <dlatypov@dlatypov.svl.corp.google.com>
X-Received: from dlatypov.svl.corp.google.com ([2620:15c:2cd:202:a28c:fdff:fee3:28c6])
 (user=dlatypov job=sendgmr) by 2002:ad4:4770:: with SMTP id
 d16mr21337611qvx.61.1604359405795; Mon, 02 Nov 2020 15:23:25 -0800 (PST)
Date:   Mon,  2 Nov 2020 15:23:04 -0800
Message-Id: <20201102232304.2735187-1-dlatypov@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.1.341.ge80a0c044ae-goog
Subject: [PATCH] kunit: fix display of failed expectations for strings
From:   Daniel Latypov <dlatypov@google.com>
To:     brendanhiggins@google.com
Cc:     davidgow@google.com, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, skhan@linuxfoundation.org,
        Daniel Latypov <dlatypov@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

Currently the following expectation
  KUNIT_EXPECT_STREQ(test, "hi", "bye");
will produce:
  Expected "hi" == "bye", but
      "hi" == 1625079497
      "bye" == 1625079500

After this patch:
  Expected "hi" == "bye", but
      "hi" == hi
      "bye" == bye

KUNIT_INIT_BINARY_STR_ASSERT_STRUCT() was written but just mistakenly
not actually used by KUNIT_EXPECT_STREQ() and friends.

Signed-off-by: Daniel Latypov <dlatypov@google.com>
---
 include/kunit/test.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/kunit/test.h b/include/kunit/test.h
index 9197da792336..2c1553105958 100644
--- a/include/kunit/test.h
+++ b/include/kunit/test.h
@@ -1105,7 +1105,7 @@ do {									       \
 	KUNIT_ASSERTION(test,						       \
 			strcmp(__left, __right) op 0,			       \
 			kunit_binary_str_assert,			       \
-			KUNIT_INIT_BINARY_ASSERT_STRUCT(test,		       \
+			KUNIT_INIT_BINARY_STR_ASSERT_STRUCT(test,	       \
 							assert_type,	       \
 							#op,		       \
 							#left,		       \

base-commit: 495023e4e49e4b7dee35928800bf0317276576c1
-- 
2.29.1.341.ge80a0c044ae-goog

