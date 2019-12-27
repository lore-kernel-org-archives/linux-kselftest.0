Return-Path: <SRS0=5BjP=2R=vger.kernel.org=linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D910C2D0C6
	for <linux-kselftest@archiver.kernel.org>; Fri, 27 Dec 2019 17:57:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 00C3C20CC7
	for <linux-kselftest@archiver.kernel.org>; Fri, 27 Dec 2019 17:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1577469422;
	bh=7rwKNQPuyOvNkbJa8xITK69Gi8xyKc1iP/xJ7pOhLxU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=Y19v6mR9giiK0dP7iRwwTdRKOit7Oytifj2Yfur9oLFJom+bL8/ZtgdwlZnWPYV8r
	 MMTla+7OmX9SqfDgZi47/2oPNRsKzbA2SvBaXeCOlcoZ74Ae/IZMTmz11JAHD7t7Fn
	 evOPbt8Yf/Kj/DZQAuAG1PTxFg4qB+T9N/c/qUhA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727015AbfL0R44 (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Fri, 27 Dec 2019 12:56:56 -0500
Received: from mail.kernel.org ([198.145.29.99]:38406 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727636AbfL0Rly (ORCPT <rfc822;linux-kselftest@vger.kernel.org>);
        Fri, 27 Dec 2019 12:41:54 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 29FFC218AC;
        Fri, 27 Dec 2019 17:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1577468513;
        bh=7rwKNQPuyOvNkbJa8xITK69Gi8xyKc1iP/xJ7pOhLxU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fNpZHnPvsjr15yMJTvIgUhdmdQzuSxYdZUd11EJnwPdn+3ez2jBy/DA932wjqHBwP
         pn5Iqs79iuu+RsLVdONijMfQDt5fZ7hAR8jtP/hsLVUK7MnclSmIolbXT48AqUGIHt
         DjXDujJThfbuKlel75RnJRc5854agj66S4I6JIP4=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Masami Hiramatsu <mhiramat@kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Sasha Levin <sashal@kernel.org>,
        linux-kselftest@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 046/187] selftests: safesetid: Fix Makefile to set correct test program
Date:   Fri, 27 Dec 2019 12:38:34 -0500
Message-Id: <20191227174055.4923-46-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191227174055.4923-1-sashal@kernel.org>
References: <20191227174055.4923-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-kselftest-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

From: Masami Hiramatsu <mhiramat@kernel.org>

[ Upstream commit 8ef1ec0ca32c6f8a87f5b4c24b1db26da67c5609 ]

Fix Makefile to set safesetid-test.sh to TEST_PROGS instead
of non existing run_tests.sh.

Without this fix, I got following error.
  ----
  TAP version 13
  1..1
  # selftests: safesetid: run_tests.sh
  # Warning: file run_tests.sh is missing!
  not ok 1 selftests: safesetid: run_tests.sh
  ----

Fixes: c67e8ec03f3f ("LSM: SafeSetID: add selftest")
Signed-off-by: Masami Hiramatsu <mhiramat@kernel.org>
Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 tools/testing/selftests/safesetid/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/safesetid/Makefile b/tools/testing/selftests/safesetid/Makefile
index cac42cd36a1b..fa02c4d5ec13 100644
--- a/tools/testing/selftests/safesetid/Makefile
+++ b/tools/testing/selftests/safesetid/Makefile
@@ -3,7 +3,7 @@
 CFLAGS = -Wall -O2
 LDLIBS = -lcap
 
-TEST_PROGS := run_tests.sh
+TEST_PROGS := safesetid-test.sh
 TEST_GEN_FILES := safesetid-test
 
 include ../lib.mk
-- 
2.20.1

