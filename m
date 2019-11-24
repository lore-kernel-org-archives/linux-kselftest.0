Return-Path: <SRS0=j+c0=ZQ=vger.kernel.org=linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2567AC432C0
	for <linux-kselftest@archiver.kernel.org>; Sun, 24 Nov 2019 04:55:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EDCED2080D
	for <linux-kselftest@archiver.kernel.org>; Sun, 24 Nov 2019 04:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1574571353;
	bh=ymtaKi9IVpbZdAuAWTlDTtavINY3RKPZP8U6lntlors=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=xcDcrL+fixPljgB3KFqRZyTZRZE2roToROg2iaVlA4YoJ1IcyfJCzW7SSEuDqgUaX
	 E5KnO8+9P9GIIaWZpJYXlso9ROUzWPpiZGD5WvT8gR5UbbkUqsHO8GhKDGtHdHzdz3
	 YjnoVihYi58SDgQCxNqVzAynBbfg09rtg1HoWa3E=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726944AbfKXEzw (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Sat, 23 Nov 2019 23:55:52 -0500
Received: from mail.kernel.org ([198.145.29.99]:46934 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726705AbfKXEzw (ORCPT <rfc822;linux-kselftest@vger.kernel.org>);
        Sat, 23 Nov 2019 23:55:52 -0500
Received: from localhost.localdomain (NE2965lan1.rev.em-net.ne.jp [210.141.244.193])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8835F207FD;
        Sun, 24 Nov 2019 04:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1574571351;
        bh=ymtaKi9IVpbZdAuAWTlDTtavINY3RKPZP8U6lntlors=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Re6yMKKVleYjjsMQg4ui1OpcYru+2QwoAYas8+VySx0gkDbztqjQy45rd/IFJXVvA
         DNp6ZUD4+3EpbxdhGNm1Nsvbp4tjRQVAVMWnUjgNlrLCSXyrQGDZOyrytyoK0biCBM
         qZQ+7PwmS6S1zcpMUrSDHX2ERH1PmJrctEQbnG5o=
From:   Masami Hiramatsu <mhiramat@kernel.org>
To:     Shuah Khan <shuah@kernel.org>, Steven Rostedt <rostedt@goodmis.org>
Cc:     linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [BUGFIX PATCH 2/3] selftests/ftrace: Fix ftrace test cases to check unsupported
Date:   Sun, 24 Nov 2019 13:55:48 +0900
Message-Id: <157457134852.25666.7660419621672440723.stgit@devnote2>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <157457133001.25666.5309062776021151107.stgit@devnote2>
References: <157457133001.25666.5309062776021151107.stgit@devnote2>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-kselftest-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

Since function tracer can be disabled, set_ftrace_filter can be
disappeared. The test cases must check whether the set_ftrace_filter
exists or not before testing and if not, return it as unsupported.

Signed-off-by: Masami Hiramatsu <mhiramat@kernel.org>
---
 .../ftrace/test.d/ftrace/func-filter-stacktrace.tc |    2 ++
 .../selftests/ftrace/test.d/ftrace/func_cpumask.tc |    5 +++++
 2 files changed, 7 insertions(+)

diff --git a/tools/testing/selftests/ftrace/test.d/ftrace/func-filter-stacktrace.tc b/tools/testing/selftests/ftrace/test.d/ftrace/func-filter-stacktrace.tc
index 36fb59f886ea..1a52f2883fe0 100644
--- a/tools/testing/selftests/ftrace/test.d/ftrace/func-filter-stacktrace.tc
+++ b/tools/testing/selftests/ftrace/test.d/ftrace/func-filter-stacktrace.tc
@@ -3,6 +3,8 @@
 # description: ftrace - stacktrace filter command
 # flags: instance
 
+[ ! -f set_ftrace_filter ] && exit_unsupported
+
 echo _do_fork:stacktrace >> set_ftrace_filter
 
 grep -q "_do_fork:stacktrace:unlimited" set_ftrace_filter
diff --git a/tools/testing/selftests/ftrace/test.d/ftrace/func_cpumask.tc b/tools/testing/selftests/ftrace/test.d/ftrace/func_cpumask.tc
index 86a1f07ef2ca..7757b549f0b6 100644
--- a/tools/testing/selftests/ftrace/test.d/ftrace/func_cpumask.tc
+++ b/tools/testing/selftests/ftrace/test.d/ftrace/func_cpumask.tc
@@ -15,6 +15,11 @@ if [ $NP -eq 1 ] ;then
   exit_unresolved
 fi
 
+if ! grep -q function available_tracers ; then
+  echo "Function trace is not enabled"
+  exit_unsupported
+fi
+
 ORIG_CPUMASK=`cat tracing_cpumask`
 
 do_reset() {

