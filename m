Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDD9FC0015E
	for <linux-kselftest@archiver.kernel.org>; Thu,  3 Aug 2023 07:28:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232590AbjHCH2z (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Thu, 3 Aug 2023 03:28:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231771AbjHCH2w (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Thu, 3 Aug 2023 03:28:52 -0400
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46BF6272A;
        Thu,  3 Aug 2023 00:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
        s=mail; t=1691047728;
        bh=Kc+QdIXEiriZU7G8O0tQxJI0UlyXn+ahx8/7NZv6UOI=;
        h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
        b=BMh1bDsk6/kxaJrHT6o97UVSd6wbtiq/uu64gzptWH2Ws3t3UADHmCGpm//BfQVGt
         j5Snvsm9ei6gW9FtSFuGmBBJ7olzU1++pvIyRAMpGTlBnn/Zc1n3A02XV39JnD7lc6
         jMntC4aSUERO6vMVgP4xVmSbJpL11M4rDZqopRk8=
From:   =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date:   Thu, 03 Aug 2023 09:28:46 +0200
Subject: [PATCH v3 02/14] tools/nolibc: fix return type of getpagesize()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230803-nolibc-warnings-v3-2-bcc1a096ae02@weissschuh.net>
References: <20230803-nolibc-warnings-v3-0-bcc1a096ae02@weissschuh.net>
In-Reply-To: <20230803-nolibc-warnings-v3-0-bcc1a096ae02@weissschuh.net>
To:     Willy Tarreau <w@1wt.eu>, Shuah Khan <shuah@kernel.org>
Cc:     linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yuan Tan <tanyuan@tinylab.org>,
        Zhangjin Wu <falcon@tinylab.org>,
        =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691047727; l=1272;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=Kc+QdIXEiriZU7G8O0tQxJI0UlyXn+ahx8/7NZv6UOI=;
 b=u/P0udBpE4q6UzvgDTxFjgz2+bHM5uIMee8vumQczRMeEd5B8Qlfkf4PJu4x4TCaiC/LeylD9
 Es7vLxLlhTADwKVNUwV7OV6umoHFR8m5a6wbNkY/r1bDCLMbDV60y7R
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

It's documented as returning int which is also implemented by glibc and
musl, so adopt that return type.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 tools/include/nolibc/sys.h                   | 4 ++--
 tools/testing/selftests/nolibc/nolibc-test.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/include/nolibc/sys.h b/tools/include/nolibc/sys.h
index e12dd962c578..c151533ba8e9 100644
--- a/tools/include/nolibc/sys.h
+++ b/tools/include/nolibc/sys.h
@@ -460,11 +460,11 @@ pid_t gettid(void)
 static unsigned long getauxval(unsigned long key);
 
 /*
- * long getpagesize(void);
+ * int getpagesize(void);
  */
 
 static __attribute__((unused))
-long getpagesize(void)
+int getpagesize(void)
 {
 	return __sysret(getauxval(AT_PAGESZ) ?: -ENOENT);
 }
diff --git a/tools/testing/selftests/nolibc/nolibc-test.c b/tools/testing/selftests/nolibc/nolibc-test.c
index 3a21bee360ea..52489455add8 100644
--- a/tools/testing/selftests/nolibc/nolibc-test.c
+++ b/tools/testing/selftests/nolibc/nolibc-test.c
@@ -636,7 +636,7 @@ int test_getdents64(const char *dir)
 
 static int test_getpagesize(void)
 {
-	long x = getpagesize();
+	int x = getpagesize();
 	int c;
 
 	if (x < 0)

-- 
2.41.0

