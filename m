Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB046C77B73
	for <linux-kselftest@archiver.kernel.org>; Sat,  3 Jun 2023 08:12:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229564AbjFCIMn (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Sat, 3 Jun 2023 04:12:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229539AbjFCIMn (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Sat, 3 Jun 2023 04:12:43 -0400
Received: from bg4.exmail.qq.com (bg4.exmail.qq.com [43.155.65.254])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FCF11B3;
        Sat,  3 Jun 2023 01:12:41 -0700 (PDT)
X-QQ-mid: bizesmtp67t1685779952t05dliz3
Received: from linux-lab-host.localdomain ( [119.123.130.226])
        by bizesmtp.qq.com (ESMTP) with 
        id ; Sat, 03 Jun 2023 16:12:31 +0800 (CST)
X-QQ-SSF: 00200000000000D0V000000A0000000
X-QQ-FEAT: 3M0okmaRx3jysSi7KPtogxkoekhC659z+ArtoJAEYTmllq6RxfjS8BCn5mqHJ
        O98HVUV0S5ZwQZkWqwX4sJdto+Rln35sV6MiI+4oN1YpPXiJxDGBEA0ZD4AsakhyzgxQEcB
        +LDpUY6CKcIgfZCHMis0AdjIpU+jAN8A1YDKWoNxahXCzvHZBH80INcI59EL0m1rulehtAa
        RwH6J1iAR8OzjdxwHL8YMi7pZ4WYVpQN/ClKWo1C7Cj+W/ub2y91JqWvGCCknHxX4AwBG9u
        te6wHZdWxiJ0EtJrB/vogkD5aJkiFm1IaZoceZHJ3taEVEj6VBkZe8YvGN3yEWituugrvxb
        HCZCVJNS/WOcoYH2sqLVK8Hb0OF8lhktNWXUUaOZNjhd5wXiHQMtjYv0sMB6U9wlr7QOZDx
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7582937344931115199
From:   Zhangjin Wu <falcon@tinylab.org>
To:     w@1wt.eu
Cc:     falcon@tinylab.org, arnd@arndb.de, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org,
        thomas@t-8ch.de
Subject: [PATCH v3 08/12] tools/nolibc: open: fix up compile warning for arm
Date:   Sat,  3 Jun 2023 16:11:57 +0800
Message-Id: <66f55993e77b55bc666c003de2d598f81f19e4e4.1685777982.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1685777982.git.falcon@tinylab.org>
References: <cover.1685777982.git.falcon@tinylab.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

    In function ‘open’:
    nolibc/sysroot/arm/include/sys.h:919:23: warning: ‘mode_t’ {aka ‘short unsigned int’} is promoted to ‘int’ when passed through ‘...’
      919 |   mode = va_arg(args, mode_t);
          |                       ^
    nolibc/sysroot/arm/include/sys.h:919:23: note: (so you should pass ‘int’ not ‘mode_t’ {aka ‘short unsigned int’} to ‘va_arg’)
    nolibc/sysroot/arm/include/sys.h:919:23: note: if this code is reached, the program will abort

Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
---
 tools/include/nolibc/sys.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/include/nolibc/sys.h b/tools/include/nolibc/sys.h
index 0160605444e7..856249a11890 100644
--- a/tools/include/nolibc/sys.h
+++ b/tools/include/nolibc/sys.h
@@ -862,7 +862,7 @@ int open(const char *path, int flags, ...)
 		va_list args;
 
 		va_start(args, flags);
-		mode = va_arg(args, mode_t);
+		mode = va_arg(args, int);
 		va_end(args);
 	}
 
-- 
2.25.1

