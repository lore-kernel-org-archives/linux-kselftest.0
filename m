Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12009C001DF
	for <linux-kselftest@archiver.kernel.org>; Mon, 31 Jul 2023 06:27:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230220AbjGaG1E (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Mon, 31 Jul 2023 02:27:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230198AbjGaG1C (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Mon, 31 Jul 2023 02:27:02 -0400
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBC9DE71;
        Sun, 30 Jul 2023 23:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
        s=mail; t=1690784819;
        bh=9qdnbLtbhPht0XjyjkFBgcqvEDUXoH/3gWDSG61Kn34=;
        h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
        b=JILPw/4U6Cko7x2HlkTjmMh/EQ53PmnQ8Sr+R5MgmPWYmUBfljFaI7Mn5rsXnUSNL
         vJPA7ZEXmHBVdLETcZAuS1bSJGmbmW/4hSVd3IXpLQE8JANxG0TBBFtfAC0FcXg8Eb
         cVLfmXnJbuwXsftKIlKZeDNmxSyqu6Q/RagfXGdk=
From:   =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date:   Mon, 31 Jul 2023 08:26:59 +0200
Subject: [PATCH 4/4] selftests/nolibc: enable -Wall compiler warnings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230731-nolibc-warnings-v1-4-74973d2a52d7@weissschuh.net>
References: <20230731-nolibc-warnings-v1-0-74973d2a52d7@weissschuh.net>
In-Reply-To: <20230731-nolibc-warnings-v1-0-74973d2a52d7@weissschuh.net>
To:     Willy Tarreau <w@1wt.eu>, Shuah Khan <shuah@kernel.org>
Cc:     linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yuan Tan <tanyuan@tinylab.org>,
        Zhangjin Wu <falcon@tinylab.org>,
        =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1690784818; l=913;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=9qdnbLtbhPht0XjyjkFBgcqvEDUXoH/3gWDSG61Kn34=;
 b=O0FkQ9DeQVyJzEUUjHX/mRWQwt9DHx2IGJP8JAcnKjDRiR29iJZHRpdUleo1NqdrCrv73AKr8
 5Pu3O3jPAF1A/aniH6XJHiUihWHCOkSdktGhCnJo2aHIJHKdiIJ6F6k
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

It will help the developers to avoid cruft and detect some bugs.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 tools/testing/selftests/nolibc/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/nolibc/Makefile b/tools/testing/selftests/nolibc/Makefile
index f42adef87e12..72227d75c6da 100644
--- a/tools/testing/selftests/nolibc/Makefile
+++ b/tools/testing/selftests/nolibc/Makefile
@@ -79,7 +79,7 @@ endif
 CFLAGS_s390 = -m64
 CFLAGS_mips = -EL
 CFLAGS_STACKPROTECTOR ?= $(call cc-option,-mstack-protector-guard=global $(call cc-option,-fstack-protector-all))
-CFLAGS  ?= -Os -fno-ident -fno-asynchronous-unwind-tables -std=c89 \
+CFLAGS  ?= -Os -fno-ident -fno-asynchronous-unwind-tables -std=c89 -Wall \
 		$(call cc-option,-fno-stack-protector) \
 		$(CFLAGS_$(ARCH)) $(CFLAGS_STACKPROTECTOR)
 LDFLAGS := -s

-- 
2.41.0

