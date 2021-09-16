Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B16A1C433EF
	for <linux-kselftest@archiver.kernel.org>; Thu, 16 Sep 2021 10:51:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 93EEE60F11
	for <linux-kselftest@archiver.kernel.org>; Thu, 16 Sep 2021 10:51:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235627AbhIPKxB (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Thu, 16 Sep 2021 06:53:01 -0400
Received: from smtpbg604.qq.com ([59.36.128.82]:37194 "EHLO smtpbg604.qq.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235487AbhIPKxA (ORCPT <rfc822;linux-kselftest@vger.kernel.org>);
        Thu, 16 Sep 2021 06:53:00 -0400
X-QQ-mid: bizesmtp44t1631789491t5arkjjj
Received: from localhost.localdomain (unknown [180.113.36.229])
        by esmtp6.qq.com (ESMTP) with 
        id ; Thu, 16 Sep 2021 18:51:24 +0800 (CST)
X-QQ-SSF: 0100000000800020B000000A0000000
X-QQ-FEAT: q+EIYT+FhZoEyFn1ILsRlikLkfivFXO3ci2ss10+GGCuB1aitqVHGpdaZ5BLR
        ePCxsDu+YhgdQqhrqTaDvd7oseRlmsAxbLLUugEOid0HDKMdNekjoigI1GFFqZrLc85JPr8
        MMEItRwLy8sAaivtrVi6snnaa3NcrFw9R+3f+i13YHmh3xFGqMHJSgXbYHdsxCWEzH5DBSr
        IKf1JfRqQ4/bgMPpMR1HEDlprfwmtoPUWMHqgsVecIzHIO55NbnFe2khMXcAKLZKRWys9MQ
        UUrFAX8n8eVKd+y12kZW3ylopxia+TuEzz+Kl6o3vCbpXB7e2dg3cWc6rwZ4iHtemPat2zl
        LMKwPQtlkaqBZFjkYjyHeSY2z7vnQ==
X-QQ-GoodBg: 0
From:   Xiang wangx <wangxiang@cdjrlc.com>
To:     shuah@kernel.org
Cc:     bongsu.jeon@samsung.com, netdev@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xiang wangx <wangxiang@cdjrlc.com>
Subject: [PATCH] selftests: nci: fix grammatical errors
Date:   Thu, 16 Sep 2021 18:51:22 +0800
Message-Id: <20210916105122.12523-1-wangxiang@cdjrlc.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybgspam:qybgspam4
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

Should not use unsigned expression compared with zero

Signed-off-by: Xiang wangx <wangxiang@cdjrlc.com>
---
 tools/testing/selftests/nci/nci_dev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/nci/nci_dev.c b/tools/testing/selftests/nci/nci_dev.c
index e1bf55dabdf6..162c41e9bcae 100644
--- a/tools/testing/selftests/nci/nci_dev.c
+++ b/tools/testing/selftests/nci/nci_dev.c
@@ -746,7 +746,7 @@ int read_write_nci_cmd(int nfc_sock, int virtual_fd, const __u8 *cmd, __u32 cmd_
 		       const __u8 *rsp, __u32 rsp_len)
 {
 	char buf[256];
-	unsigned int len;
+	int len;
 
 	send(nfc_sock, &cmd[3], cmd_len - 3, 0);
 	len = read(virtual_fd, buf, cmd_len);
-- 
2.20.1

