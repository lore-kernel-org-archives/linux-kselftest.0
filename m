Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8905EC678D4
	for <linux-kselftest@archiver.kernel.org>; Tue,  7 Mar 2023 18:52:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233369AbjCGSwK (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Tue, 7 Mar 2023 13:52:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233324AbjCGSvv (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Tue, 7 Mar 2023 13:51:51 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4E6FA7680;
        Tue,  7 Mar 2023 10:40:09 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 64CF2CE1C55;
        Tue,  7 Mar 2023 18:39:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43AFEC433D2;
        Tue,  7 Mar 2023 18:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1678214365;
        bh=BRL9o4GMA03Od+W6mr3WvQm47Go0VaSPNiurBmTaY+o=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=0dDCYN/cCqaKTmTxo6lSx3fuUVIj/xagOMS9g6tHCQdmFpRwFvCDs89Wr8US6ctpn
         HeUt85oPhmqmS6Pe4YeVAxl3+c3vlAYJpXVja3zx473fhyf1xRmT5IMI+VtQ5RRGH1
         0Sk98UA3gqkGLTAhIsKxQLtavoY5V6Cbf12QpnzY=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     stable@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        patches@lists.linux.dev,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org,
        Ingo Molnar <mingo@redhat.com>,
        Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH 6.1 768/885] selftests: ipc: Fix incorrect kernel headers search path
Date:   Tue,  7 Mar 2023 18:01:42 +0100
Message-Id: <20230307170035.321965682@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307170001.594919529@linuxfoundation.org>
References: <20230307170001.594919529@linuxfoundation.org>
User-Agent: quilt/0.67
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>

commit ecf9fdb5c2a9d63c732acccb6318feb73dd1589f upstream.

Use $(KHDR_INCLUDES) as lookup path for kernel headers. This prevents
building against kernel headers from the build environment in scenarios
where kernel headers are installed into a specific output directory
(O=...).

Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Shuah Khan <shuah@kernel.org>
Cc: linux-kselftest@vger.kernel.org
Cc: Ingo Molnar <mingo@redhat.com>
Cc: <stable@vger.kernel.org> # 5.18+
Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 tools/testing/selftests/ipc/Makefile |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/tools/testing/selftests/ipc/Makefile
+++ b/tools/testing/selftests/ipc/Makefile
@@ -10,7 +10,7 @@ ifeq ($(ARCH),x86_64)
 	CFLAGS := -DCONFIG_X86_64 -D__x86_64__
 endif
 
-CFLAGS += -I../../../../usr/include/
+CFLAGS += $(KHDR_INCLUDES)
 
 TEST_GEN_PROGS := msgque
 


