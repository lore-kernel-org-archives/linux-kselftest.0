Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54281C41513
	for <linux-kselftest@archiver.kernel.org>; Thu,  3 Aug 2023 07:28:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232387AbjHCH2z (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Thu, 3 Aug 2023 03:28:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230491AbjHCH2w (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Thu, 3 Aug 2023 03:28:52 -0400
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF7692728;
        Thu,  3 Aug 2023 00:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
        s=mail; t=1691047728;
        bh=KUq+Z6mBKlGZgjoNtyoT13RhBRgveu43YIN2WjHIqHQ=;
        h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
        b=JLqozudcDF5reThsW4xR/vFIF7YtkV43chGK/LHjHwzy/8rhGtZb9BNHAR86umU9u
         V9heA2CxAQ16ITl6vx4pAp3b3rD/x+7OAX7Nr8lBwpOFPS5CBU8WuOb2PCU6EO9JFW
         UPTu7dVLVttRsRSr4J419DjZtSG1zAUxRXaA1jzE=
From:   =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date:   Thu, 03 Aug 2023 09:28:45 +0200
Subject: [PATCH v3 01/14] tools/nolibc: drop unused variables
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230803-nolibc-warnings-v3-1-bcc1a096ae02@weissschuh.net>
References: <20230803-nolibc-warnings-v3-0-bcc1a096ae02@weissschuh.net>
In-Reply-To: <20230803-nolibc-warnings-v3-0-bcc1a096ae02@weissschuh.net>
To:     Willy Tarreau <w@1wt.eu>, Shuah Khan <shuah@kernel.org>
Cc:     linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yuan Tan <tanyuan@tinylab.org>,
        Zhangjin Wu <falcon@tinylab.org>,
        =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691047727; l=540;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=KUq+Z6mBKlGZgjoNtyoT13RhBRgveu43YIN2WjHIqHQ=;
 b=F88GA5vIxDDOnpVXApthFWAjZoP1+Q9qeOo6gP0vs+IA01yJ7IIbS8E9/m8yi9U+umuqG6Gun
 2nlwDGaqsPfAaptBKF0HJRQ9S5/dy2ntpvwwBsZvmd3ek24qrEBUrT0
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

Nobody needs it, get rid of it.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 tools/include/nolibc/sys.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/include/nolibc/sys.h b/tools/include/nolibc/sys.h
index 56f63eb48a1b..e12dd962c578 100644
--- a/tools/include/nolibc/sys.h
+++ b/tools/include/nolibc/sys.h
@@ -738,7 +738,6 @@ static __attribute__((unused))
 int open(const char *path, int flags, ...)
 {
 	mode_t mode = 0;
-	int ret;
 
 	if (flags & O_CREAT) {
 		va_list args;

-- 
2.41.0

