Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B932DEB64D0
	for <linux-kselftest@archiver.kernel.org>; Tue, 13 Jun 2023 18:30:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239117AbjFMSaY (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Tue, 13 Jun 2023 14:30:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233062AbjFMSaX (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Tue, 13 Jun 2023 14:30:23 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AF771709;
        Tue, 13 Jun 2023 11:30:20 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C894163417;
        Tue, 13 Jun 2023 18:30:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB035C433D9;
        Tue, 13 Jun 2023 18:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686681018;
        bh=9UpH02lnYMFhWYUhwvlChbIYfVJtuVYhldKfs9WH2JY=;
        h=From:To:Cc:Subject:Date:From;
        b=DC+laHQB4xKjdZpP6Vn7Ee0G2PYgW0Rs45JrTvXg4uR7KFNOjMaqmVVXh4QqlWm9o
         zsGmqrvwyj7C9KfSidMr2Y/EYtL4wxXrmmxzv8rs5qq4UxHpJVc1yQIAW3ZCrnoa8J
         hhLmLqF2NPfjUP2A7hW+UhbplStdkNCYFxTqvhaUXUFuBYz3x2UfeqpmjCCPDE8H5V
         sgeknqlVX08oo4A1S/MyEzB+3DUxATkhlU4vKGrC0w+mRt+z85kPGFvCid7n/7pd/8
         afEqjKccE5oBvB0Yv0ZS2/61w34LfI+idaZZCdywyVtM3vv6y/kv0yYqTfIMmQGkc0
         X+5cbKTbGQjbA==
From:   SeongJae Park <sj@kernel.org>
To:     brendanhiggins@google.com, davidgow@google.com
Cc:     SeongJae Park <sj@kernel.org>, linux-kselftest@vger.kernel.org,
        kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org
Subject: [PATCH v2] MAINTAINERS: Add source tree entry for kunit
Date:   Tue, 13 Jun 2023 18:30:15 +0000
Message-Id: <20230613183015.88392-1-sj@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

Patches for kunit are managed in kunit and kunit-fixes branches of
linux-kselftest tree before merged into the mainline.  However, the
MAINTAINERS section for kunit is not having the entries for the
branches.  Add the entries.

Signed-off-by: SeongJae Park <sj@kernel.org>
---
Changes from v1
(https://lore.kernel.org/all/20230610180549.82560-1-sj@kernel.org/)
- Mention branches (David Gow)

 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ce5f343c1443..eda8b6b464c6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11327,6 +11327,8 @@ L:	linux-kselftest@vger.kernel.org
 L:	kunit-dev@googlegroups.com
 S:	Maintained
 W:	https://google.github.io/kunit-docs/third_party/kernel/docs/
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git kunit
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git kunit-fixes
 F:	Documentation/dev-tools/kunit/
 F:	include/kunit/
 F:	lib/kunit/
-- 
2.25.1

