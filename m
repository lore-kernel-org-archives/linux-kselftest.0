Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CA95C678D4
	for <linux-kselftest@archiver.kernel.org>; Tue,  7 Mar 2023 17:58:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230346AbjCGR6I (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Tue, 7 Mar 2023 12:58:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230071AbjCGR5u (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Tue, 7 Mar 2023 12:57:50 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91BAFA4B01;
        Tue,  7 Mar 2023 09:52:19 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 48F62B818F6;
        Tue,  7 Mar 2023 17:52:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87566C433EF;
        Tue,  7 Mar 2023 17:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1678211537;
        bh=XpzhoalVVCwrw3ou+mCujUyRNexW3OJJx1ZZztCmxnI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KX+F7sFIQTfOqSvMwQLiuFrXSUzlnFHgq7OETHECj22tM5kbNp1hpk2v1v+BuLs5b
         NbPFSGy/gqNxl0S8ueQbhDlarLti+T27JTu/ai5FktlvsoUKRsdOAWpwuEV+RtqXdh
         GzvAYtnMHQ16gwbmkq2p9oom5Ns/ePMIdxidLBk4=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     stable@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        patches@lists.linux.dev,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org,
        Ingo Molnar <mingo@redhat.com>,
        Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH 6.2 0864/1001] selftests: media_tests: Fix incorrect kernel headers search path
Date:   Tue,  7 Mar 2023 18:00:36 +0100
Message-Id: <20230307170059.348833925@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307170022.094103862@linuxfoundation.org>
References: <20230307170022.094103862@linuxfoundation.org>
User-Agent: quilt/0.67
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>

commit f2f9592b736087f695230410fb8dc1afd3cafbbb upstream.

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
 tools/testing/selftests/media_tests/Makefile |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/tools/testing/selftests/media_tests/Makefile
+++ b/tools/testing/selftests/media_tests/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 #
-CFLAGS += -I../ -I../../../../usr/include/
+CFLAGS += -I../ $(KHDR_INCLUDES)
 TEST_GEN_PROGS := media_device_test media_device_open video_device_test
 
 include ../lib.mk


