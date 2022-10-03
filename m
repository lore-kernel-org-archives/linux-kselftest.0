Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3B88C433F5
	for <linux-kselftest@archiver.kernel.org>; Mon,  3 Oct 2022 17:59:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229907AbiJCR7t (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Mon, 3 Oct 2022 13:59:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229971AbiJCR7G (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Mon, 3 Oct 2022 13:59:06 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E6AC6276;
        Mon,  3 Oct 2022 10:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=cWKiDxQpg3CrpeNWpGyXUibJ4Au13VIXyN0weQaKLtg=; b=nRl77eQDmZSZZPQHB1+dsnLflz
        w9aVyK4cbyW3sM66HlTxN9W56e8/LDGLeQrqdbiPlOEiebM/+OC+lYQQ3FKvXcIT3UXU1YpgoTh4q
        ddfvlK8cXIrtDKfL/XgQZnr6Yv76m2Ejq5vDrwtKwxZWAegthrI0XWdW/MFuq7GcD/fjXVJfaI9Og
        4XhwzddPKpX3aZknrc8NqOXwrAMuoqnp4jCRU2IRpi08gfu7f3JEdrGUovVBo2GbpuF86+kDqUbxi
        A2+WLdFVuKJvlGt4JwWhMz2Ot+7MTYqprKztwNHI86M0euJNlCX4arZ2/UcyUcBIhbanOiZSKcwDN
        rNWqqoaw==;
Received: from [2601:1c2:d80:3110::a2e7] (helo=casper.infradead.org)
        by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1ofPi3-00GZIr-8t; Mon, 03 Oct 2022 17:58:31 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>, Shuah Khan <shuah@kernel.org>,
        linux-kselftest@vger.kernel.org
Subject: [PATCH RESEND] selftests/ftrace: func_event_triggers: fix typo in user message
Date:   Mon,  3 Oct 2022 10:58:23 -0700
Message-Id: <20221003175823.25040-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

Correct typo of "it's" to "it".

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Shuah Khan <shuah@kernel.org>
Cc: linux-kselftest@vger.kernel.org
---
 tools/testing/selftests/ftrace/test.d/ftrace/func_event_triggers.tc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20211224.orig/tools/testing/selftests/ftrace/test.d/ftrace/func_event_triggers.tc
+++ linux-next-20211224/tools/testing/selftests/ftrace/test.d/ftrace/func_event_triggers.tc
@@ -85,7 +85,7 @@ run_enable_disable() {
 	echo $check_disable > $EVENT_ENABLE
     done
     sleep $SLEEP_TIME
-    echo " make sure it's still works"
+    echo " make sure it still works"
     test_event_enabled $check_enable_star
 
     reset_ftrace_filter
