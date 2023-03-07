Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E880C678D5
	for <linux-kselftest@archiver.kernel.org>; Tue,  7 Mar 2023 18:49:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233289AbjCGStP (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Tue, 7 Mar 2023 13:49:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233304AbjCGSsa (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Tue, 7 Mar 2023 13:48:30 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D216F91B57;
        Tue,  7 Mar 2023 10:37:29 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 8DF8EB819D1;
        Tue,  7 Mar 2023 18:37:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05E80C4339B;
        Tue,  7 Mar 2023 18:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1678214230;
        bh=xcrRjS4mv8SOU/BI53iJoGghNnS2rHgwDiF9lAMRO/I=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SG3FpwYW5BuaGBgrxh2ev5D0KiQA1i5baEYOx/2yov+1irZMnlO2MfNAuFfX2ae79
         aZyniEk/X46PiAaOTML57qYO7BNIPAyWBeqSYPa2UwzmhIW3/st0C89yLfwZMlj6pK
         tAVN4arhzGd/tDSxDCGD3JurGOAEjg3lY+7OsZQs=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     stable@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        patches@lists.linux.dev,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org,
        Ingo Molnar <mingo@redhat.com>,
        Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH 6.1 763/885] selftests: sync: Fix incorrect kernel headers search path
Date:   Tue,  7 Mar 2023 18:01:37 +0100
Message-Id: <20230307170035.086155463@linuxfoundation.org>
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

commit 5ad0c8e42c13623bd996e19ce76f2596e16eb0db upstream.

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
Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 tools/testing/selftests/sync/Makefile |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/tools/testing/selftests/sync/Makefile
+++ b/tools/testing/selftests/sync/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 CFLAGS += -O2 -g -std=gnu89 -pthread -Wall -Wextra
-CFLAGS += -I../../../../usr/include/
+CFLAGS += $(KHDR_INCLUDES)
 LDFLAGS += -pthread
 
 .PHONY: all clean


