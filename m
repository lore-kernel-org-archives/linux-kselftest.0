Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59E5DC43217
	for <linux-kselftest@archiver.kernel.org>; Thu, 16 Sep 2021 16:29:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 442A761AAB
	for <linux-kselftest@archiver.kernel.org>; Thu, 16 Sep 2021 16:29:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241045AbhIPQaf (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Thu, 16 Sep 2021 12:30:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:38206 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241027AbhIPQ1s (ORCPT <rfc822;linux-kselftest@vger.kernel.org>);
        Thu, 16 Sep 2021 12:27:48 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id ED2B0615E0;
        Thu, 16 Sep 2021 16:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1631809064;
        bh=9iClfcn2FvwaNTaQw0Bk6+vBHtIgyJFO+KgfvpvKnfs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=OlVi2f22f+i5A9+8LmoVOx9ZNI4a03VtmEFrsahq/LpSY/axWp+N8hdGaAtaN5rxt
         56HqZ8XvK4FNQqm7ncyo1ss2dZYnc1LVeXx+nuHIXOYdNHMmcJZjh9sOZKQv0kMG50
         AZvC8oRmzO/HEmvcbqrmAKcVlRsnL1liGUruSejg=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-kernel@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        stable@vger.kernel.org,
        "Tzvetomir Stoyanov" <tz.stoyanov@gmail.com>,
        Tom Zanussi <zanussi@kernel.org>,
        Shuah Khan <shuah@kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        linux-kselftest@vger.kernel.org,
        Masami Hiramatsu <mhiramat@kernel.org>,
        "Steven Rostedt (VMware)" <rostedt@goodmis.org>
Subject: [PATCH 5.13 018/380] selftests/ftrace: Fix requirement check of README file
Date:   Thu, 16 Sep 2021 17:56:15 +0200
Message-Id: <20210916155804.589461544@linuxfoundation.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210916155803.966362085@linuxfoundation.org>
References: <20210916155803.966362085@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

From: Steven Rostedt (VMware) <rostedt@goodmis.org>

commit 210f9df02611cbe641ced3239122b270fd907d86 upstream.

The selftest for ftrace checks some features by checking if the README has
text that states the feature is supported by that kernel. Unfortunately,
this check gives false positives because it many not be checked if there's
spaces in the string to check. This is due to the compare between the
required variable with the ":README" string stripped, because neither has
quotes around them.

Link: https://lkml.kernel.org/r/20210820204742.087177341@goodmis.org

Cc: "Tzvetomir Stoyanov" <tz.stoyanov@gmail.com>
Cc: Tom Zanussi <zanussi@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-kselftest@vger.kernel.org
Cc: stable@vger.kernel.org
Fixes: 1b8eec510ba64 ("selftests/ftrace: Support ":README" suffix for requires")
Acked-by: Masami Hiramatsu <mhiramat@kernel.org>
Signed-off-by: Steven Rostedt (VMware) <rostedt@goodmis.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 tools/testing/selftests/ftrace/test.d/functions |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/tools/testing/selftests/ftrace/test.d/functions
+++ b/tools/testing/selftests/ftrace/test.d/functions
@@ -115,7 +115,7 @@ check_requires() { # Check required file
                 echo "Required tracer $t is not configured."
                 exit_unsupported
             fi
-        elif [ $r != $i ]; then
+        elif [ "$r" != "$i" ]; then
             if ! grep -Fq "$r" README ; then
                 echo "Required feature pattern \"$r\" is not in README."
                 exit_unsupported


