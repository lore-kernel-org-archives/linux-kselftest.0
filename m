Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8281DC678DB
	for <linux-kselftest@archiver.kernel.org>; Tue,  7 Mar 2023 18:49:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233181AbjCGSt0 (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Tue, 7 Mar 2023 13:49:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233182AbjCGStH (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Tue, 7 Mar 2023 13:49:07 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DEE0A72A9;
        Tue,  7 Mar 2023 10:37:37 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 6A081B819CA;
        Tue,  7 Mar 2023 18:36:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF5EBC433EF;
        Tue,  7 Mar 2023 18:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1678214198;
        bh=tO4logdoC5Brx41FVyy0YsJFB3DcPXXmPPfZbwtQ/BU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=18cDrOEodIiOeYyV6FZsVh8PmJQh6DTMfp7ln4pwUBuddJmqntf3aXm0DllpBcpa3
         mVwaheujmZTlR15LBPavT7eleQmEdEeTtJZWTOxA207nHCoXHjkcpDem7uq06y1NZ1
         rr5EnTdO9AQpBmqzrKoDmVf1HThHqQY8zjfWo7rE=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     stable@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        patches@lists.linux.dev,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org,
        Ingo Molnar <mingo@redhat.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Christian Brauner <brauner@kernel.org>
Subject: [PATCH 6.1 754/885] selftests: clone3: Fix incorrect kernel headers search path
Date:   Tue,  7 Mar 2023 18:01:28 +0100
Message-Id: <20230307170034.699400278@linuxfoundation.org>
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

commit 612cf4d283414a5ee2733db6608d917deb45fa46 upstream.

Use $(KHDR_INCLUDES) as lookup path for kernel headers. This prevents
building against kernel headers from the build environment in scenarios
where kernel headers are installed into a specific output directory
(O=...).

Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Shuah Khan <shuah@kernel.org>
Cc: linux-kselftest@vger.kernel.org
Cc: Ingo Molnar <mingo@redhat.com>
Cc: <stable@vger.kernel.org>  # 5.18+
Acked-by: Shuah Khan <skhan@linuxfoundation.org>
Acked-by: Christian Brauner <brauner@kernel.org>
Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 tools/testing/selftests/clone3/Makefile |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/tools/testing/selftests/clone3/Makefile
+++ b/tools/testing/selftests/clone3/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
-CFLAGS += -g -std=gnu99 -I../../../../usr/include/
+CFLAGS += -g -std=gnu99 $(KHDR_INCLUDES)
 LDLIBS += -lcap
 
 TEST_GEN_PROGS := clone3 clone3_clear_sighand clone3_set_tid \


