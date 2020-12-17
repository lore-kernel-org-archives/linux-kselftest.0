Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACEF3C2BB9A
	for <linux-kselftest@archiver.kernel.org>; Thu, 17 Dec 2020 16:42:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 77B79239A4
	for <linux-kselftest@archiver.kernel.org>; Thu, 17 Dec 2020 16:42:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727566AbgLQQmX (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Thu, 17 Dec 2020 11:42:23 -0500
Received: from sym2.noone.org ([178.63.92.236]:38668 "EHLO sym2.noone.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727260AbgLQQmX (ORCPT <rfc822;linux-kselftest@vger.kernel.org>);
        Thu, 17 Dec 2020 11:42:23 -0500
X-Greylist: delayed 596 seconds by postgrey-1.27 at vger.kernel.org; Thu, 17 Dec 2020 11:42:22 EST
Received: by sym2.noone.org (Postfix, from userid 1002)
        id 4Cxcwg63Bvzvjkx; Thu, 17 Dec 2020 17:32:35 +0100 (CET)
From:   Tobias Klauser <tklauser@distanz.ch>
To:     Shuah Khan <shuah@kernel.org>
Cc:     Vincenzo Frascino <vincenzo.frascino@arm.com>,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] selftests/vDSO: fix -Wformat warning in vdso_test_correctness
Date:   Thu, 17 Dec 2020 17:32:35 +0100
Message-Id: <20201217163235.22788-1-tklauser@distanz.ch>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

Fix the following -Wformat warnings in vdso_test_correctness.c:

vdso_test_correctness.c: In function ‘test_one_clock_gettime64’:
vdso_test_correctness.c:352:21: warning: format ‘%ld’ expects argument of type ‘long int’, but argument 3 has type ‘long long int’ [-Wformat=]
  352 |  printf("\t%llu.%09ld %llu.%09ld %llu.%09ld\n",
      |                 ~~~~^
      |                     |
      |                     long int
      |                 %09lld
  353 |         (unsigned long long)start.tv_sec, start.tv_nsec,
      |                                           ~~~~~~~~~~~~~
      |                                                |
      |                                                long long int
vdso_test_correctness.c:352:32: warning: format ‘%ld’ expects argument of type ‘long int’, but argument 5 has type ‘long long int’ [-Wformat=]
  352 |  printf("\t%llu.%09ld %llu.%09ld %llu.%09ld\n",
      |                            ~~~~^
      |                                |
      |                                long int
      |                            %09lld
  353 |         (unsigned long long)start.tv_sec, start.tv_nsec,
  354 |         (unsigned long long)vdso.tv_sec, vdso.tv_nsec,
      |                                          ~~~~~~~~~~~~
      |                                              |
      |                                              long long int
vdso_test_correctness.c:352:43: warning: format ‘%ld’ expects argument of type ‘long int’, but argument 7 has type ‘long long int’ [-Wformat=]

The tv_sec member of __kernel_timespec is long long, both in
uapi/linux/time_types.h and locally in vdso_test_correctness.c.

Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
---
 tools/testing/selftests/vDSO/vdso_test_correctness.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/vDSO/vdso_test_correctness.c b/tools/testing/selftests/vDSO/vdso_test_correctness.c
index 5029ef9b228c..c4aea794725a 100644
--- a/tools/testing/selftests/vDSO/vdso_test_correctness.c
+++ b/tools/testing/selftests/vDSO/vdso_test_correctness.c
@@ -349,7 +349,7 @@ static void test_one_clock_gettime64(int clock, const char *name)
 		return;
 	}
 
-	printf("\t%llu.%09ld %llu.%09ld %llu.%09ld\n",
+	printf("\t%llu.%09lld %llu.%09lld %llu.%09lld\n",
 	       (unsigned long long)start.tv_sec, start.tv_nsec,
 	       (unsigned long long)vdso.tv_sec, vdso.tv_nsec,
 	       (unsigned long long)end.tv_sec, end.tv_nsec);
-- 
2.29.0

