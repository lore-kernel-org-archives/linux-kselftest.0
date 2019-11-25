Return-Path: <SRS0=TovR=ZR=vger.kernel.org=linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D276C432C0
	for <linux-kselftest@archiver.kernel.org>; Mon, 25 Nov 2019 06:57:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 424402082F
	for <linux-kselftest@archiver.kernel.org>; Mon, 25 Nov 2019 06:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1574665034;
	bh=phZqQ51DaGnCQflW3J09B6LC13NsFK9mZ6NFiZrDYeo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=Cp+vOSkiCpuQCLG1/0qcTtQUBeIIyPwUI9dHy83Ef3I6YiZa//0XIDR+9H83IEoF0
	 qkpzOpk0r50k9ifVFMKumthUJ00XM8rdVjP0yJ/4arVaXrDNHpF39Qd58/tTzdP0UF
	 bW+cmAP3qMgoT97I/kg7be5wkEggjsk/0Wi39pq4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725793AbfKYG5O (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Mon, 25 Nov 2019 01:57:14 -0500
Received: from mail.kernel.org ([198.145.29.99]:60996 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725535AbfKYG5N (ORCPT <rfc822;linux-kselftest@vger.kernel.org>);
        Mon, 25 Nov 2019 01:57:13 -0500
Received: from localhost.localdomain (NE2965lan1.rev.em-net.ne.jp [210.141.244.193])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DC40D2082C;
        Mon, 25 Nov 2019 06:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1574665032;
        bh=phZqQ51DaGnCQflW3J09B6LC13NsFK9mZ6NFiZrDYeo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=bmquQkGM2cZp0gWEZo0b117rHYQbIjTbNiDKKJnZb/bOPdl4oieFOtrF6fZ3szRIJ
         RqSiPgKynnEwNCxc4WJ5k5LTOXc2eKnitdltPruX/36arDqtwProGpWkH6qCQNCeg6
         jTWzVjbclfLwHW8QevYMpnVgt2nsWIhLJRS2xLO8=
From:   Masami Hiramatsu <mhiramat@kernel.org>
To:     Shuah Khan <shuah@kernel.org>, Steven Rostedt <rostedt@goodmis.org>
Cc:     linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [BUGFIX PATCH v3 2/4] selftests/ftrace: Fix ftrace test cases to check unsupported
Date:   Mon, 25 Nov 2019 15:57:09 +0900
Message-Id: <157466502948.21973.11090994193254792649.stgit@devnote2>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <157466501169.21973.31401747181477687.stgit@devnote2>
References: <157466501169.21973.31401747181477687.stgit@devnote2>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-kselftest-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

Since dynamic function tracer can be disabled, set_ftrace_filter
can be disappeared. Test cases which depends on it, must check
whether the set_ftrace_filter exists or not before testing
and if not, return as unsupported.

Also, if the function tracer itself is disabled, we can not
set "function" to current_tracer. Test cases must check it
before testing, and return as unsupported.

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

