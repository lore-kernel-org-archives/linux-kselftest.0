Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A952FC64E90
	for <linux-kselftest@archiver.kernel.org>; Wed, 25 Nov 2020 15:44:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 44155206CA
	for <linux-kselftest@archiver.kernel.org>; Wed, 25 Nov 2020 15:44:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="M0zfIf43"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730416AbgKYPgG (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Wed, 25 Nov 2020 10:36:06 -0500
Received: from mail.kernel.org ([198.145.29.99]:53490 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730376AbgKYPgG (ORCPT <rfc822;linux-kselftest@vger.kernel.org>);
        Wed, 25 Nov 2020 10:36:06 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A31CF2083E;
        Wed, 25 Nov 2020 15:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606318565;
        bh=x6g66gI7/WNIPMacygivsWlS0rJdzWKg1uKFt1aUji8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=M0zfIf43vXhZ4rHx5M5MEH0wknca7sfQv1mZiZ/A+aoxtMq4keSaELU0CG7DdEaTb
         31TIDHOMBRLX1ihU3wYihwrZIR85tXJlzGae6ztTVRs9v+IFW0cMurCblq0OE8vyZk
         5VaKhf+MfJh9fjg8l99BL6XvHnEGAP7BfOPbBcoo=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Daniel Latypov <dlatypov@google.com>,
        Brendan Higgins <brendanhiggins@google.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Sasha Levin <sashal@kernel.org>,
        linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com
Subject: [PATCH AUTOSEL 5.9 11/33] kunit: fix display of failed expectations for strings
Date:   Wed, 25 Nov 2020 10:35:28 -0500
Message-Id: <20201125153550.810101-11-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201125153550.810101-1-sashal@kernel.org>
References: <20201125153550.810101-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

From: Daniel Latypov <dlatypov@google.com>

[ Upstream commit 3084db0e0d5076cd48408274ab0911cd3ccdae88 ]

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
Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
Tested-by: Brendan Higgins <brendanhiggins@google.com>
Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 include/kunit/test.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/kunit/test.h b/include/kunit/test.h
index 59f3144f009a5..b68ba33c16937 100644
--- a/include/kunit/test.h
+++ b/include/kunit/test.h
@@ -1064,7 +1064,7 @@ do {									       \
 	KUNIT_ASSERTION(test,						       \
 			strcmp(__left, __right) op 0,			       \
 			kunit_binary_str_assert,			       \
-			KUNIT_INIT_BINARY_ASSERT_STRUCT(test,		       \
+			KUNIT_INIT_BINARY_STR_ASSERT_STRUCT(test,	       \
 							assert_type,	       \
 							#op,		       \
 							#left,		       \
-- 
2.27.0

