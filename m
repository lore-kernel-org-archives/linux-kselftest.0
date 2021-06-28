Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E6ADC2B9F4
	for <linux-kselftest@archiver.kernel.org>; Mon, 28 Jun 2021 14:56:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ED33C613FD
	for <linux-kselftest@archiver.kernel.org>; Mon, 28 Jun 2021 14:56:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232908AbhF1O6l (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Mon, 28 Jun 2021 10:58:41 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:38658 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232941AbhF1O4y (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Mon, 28 Jun 2021 10:56:54 -0400
Received: from 1.general.ppisati.uk.vpn ([10.172.193.134] helo=canonical.com)
        by youngberry.canonical.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <paolo.pisati@canonical.com>)
        id 1lxseW-0005sL-Sk; Mon, 28 Jun 2021 14:54:24 +0000
From:   Paolo Pisati <paolo.pisati@canonical.com>
To:     "David S . Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc:     netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] selftests: net: devlink_port_split: check devlink returned an element before dereferencing it
Date:   Mon, 28 Jun 2021 16:54:24 +0200
Message-Id: <20210628145424.69146-1-paolo.pisati@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

And thus avoid a Python stacktrace:

~/linux/tools/testing/selftests/net$ ./devlink_port_split.py
Traceback (most recent call last):
  File "/home/linux/tools/testing/selftests/net/./devlink_port_split.py",
line 277, in <module> main()
  File "/home/linux/tools/testing/selftests/net/./devlink_port_split.py",
line 242, in main
    dev = list(devs.keys())[0]
IndexError: list index out of range

Signed-off-by: Paolo Pisati <paolo.pisati@canonical.com>
---
 tools/testing/selftests/net/devlink_port_split.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/testing/selftests/net/devlink_port_split.py b/tools/testing/selftests/net/devlink_port_split.py
index 834066d465fc..d162915311fd 100755
--- a/tools/testing/selftests/net/devlink_port_split.py
+++ b/tools/testing/selftests/net/devlink_port_split.py
@@ -239,6 +239,9 @@ def main(cmdline=None):
         assert stderr == ""
 
         devs = json.loads(stdout)['dev']
+        if len(devs.keys()) == 0:
+            print("no devlink device found")
+            sys.exit(1)
         dev = list(devs.keys())[0]
 
     cmd = "devlink dev show %s" % dev
-- 
2.30.2

