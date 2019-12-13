Return-Path: <SRS0=mPm/=2D=vger.kernel.org=linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05756C43603
	for <linux-kselftest@archiver.kernel.org>; Fri, 13 Dec 2019 01:56:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C6DCF24656
	for <linux-kselftest@archiver.kernel.org>; Fri, 13 Dec 2019 01:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1576202180;
	bh=0ND/pXnfTpdNIVfXkHpe0/4EFeK4Sq09LK3RdrVaLiY=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=z+SaTpMEVpsiw1bBfa7ZDTojCL4dbUaM9uVF/5IKerWZgBMZCbNanbyexNe5wdfX1
	 qYTTYhnHa8yi1h4OGYHKdhrX7g4kL0Ke5v/J3dniVi2H+ghulWPk000NcODxoMTkyK
	 ONyNwxQnrZW/o7PSLL42ZUMv+keTu4zF2PF2FCi8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731872AbfLMB4U (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Thu, 12 Dec 2019 20:56:20 -0500
Received: from mail-io1-f68.google.com ([209.85.166.68]:40190 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731869AbfLMB4U (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Thu, 12 Dec 2019 20:56:20 -0500
Received: by mail-io1-f68.google.com with SMTP id x1so769044iop.7
        for <linux-kselftest@vger.kernel.org>; Thu, 12 Dec 2019 17:56:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QpJgpn5xWwVD9J6P9JsUIUWPTgZ7VxyS6OWeolrkzBI=;
        b=GFzm6ZniEqoDdzO+qsDrFCn2PlIlt4Kf5CvCuVwkcCzKJHi1qzv2Rly2Hu/ARaqshP
         BKY/7qK+vmWdEZX8nyAjOe5b89WLSu9YRd2qFBRCX1htrD9vZKfQkbHZkWC7dW8B3DL/
         YKb9dlHn9T6qvm2tQMYJvxVrb5y6G9v1wPfVw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QpJgpn5xWwVD9J6P9JsUIUWPTgZ7VxyS6OWeolrkzBI=;
        b=eHflnoRLHufAu00QYwFLtIBkSyFrtyG81yi0giZKijGi6tB89aIgQkG1DzsRstuwXP
         FAFdc9aNvlMItwW0JrwnULDNkr9LwR1xAIftP/9dRO+dtZ6oBY6WIk9YqkGfkYgeF55X
         LH4EW60tmFDyyQuxgZClBm/1bPPBwVynDHl3NdyxTAAXN+MWojBjvr+MUkA2GYNv5jB9
         78ZGSy47Ci13IuKnAXi8ZuL48xPuaKze+4QNXXwOU19SwlQ8yH3JR1MHf0vZXIPBR7ma
         enRnBPsJuPWp2c7bPjiTj746GDPItSwaF6LVOCthRP9QIfhTarF3eXcX0Hjq+xyLgJ0n
         F+lQ==
X-Gm-Message-State: APjAAAVmIfpu5FvZUPUUzysPEtDqykKmCp84yxyaVfGTkK+Dws007GEs
        9Nzmk0aT/7BoMdICuPMD9cn4NA==
X-Google-Smtp-Source: APXvYqznGK3WNdNstYWfdpigO3kQ1gScdYqkS3+WOfJTJh+/XlPm0/REhsuCLncgscsqVxIXlo71sw==
X-Received: by 2002:a5e:9608:: with SMTP id a8mr5549510ioq.18.1576202179412;
        Thu, 12 Dec 2019 17:56:19 -0800 (PST)
Received: from shuah-t480s.internal (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id w28sm2274755ila.64.2019.12.12.17.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2019 17:56:18 -0800 (PST)
From:   Shuah Khan <skhan@linuxfoundation.org>
To:     jpoimboe@redhat.com, jikos@kernel.org, mbenes@suse.cz,
        pmladek@suse.com, joe.lawrence@redhat.com, shuah@kernel.org
Cc:     Shuah Khan <skhan@linuxfoundation.org>,
        live-patching@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] selftests: livepatch: Fix it to do root uid check and skip
Date:   Thu, 12 Dec 2019 18:56:17 -0700
Message-Id: <20191213015617.23110-1-skhan@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kselftest-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

livepatch test configures the system and debug environment to run
tests. Some of these actions fail without root access and test
dumps several permission denied messages before it exits.

Fix it to check root uid and exit with skip code instead.

Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
---
 tools/testing/selftests/livepatch/functions.sh | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/livepatch/functions.sh b/tools/testing/selftests/livepatch/functions.sh
index 31eb09e38729..014b587692f0 100644
--- a/tools/testing/selftests/livepatch/functions.sh
+++ b/tools/testing/selftests/livepatch/functions.sh
@@ -7,6 +7,9 @@
 MAX_RETRIES=600
 RETRY_INTERVAL=".1"	# seconds
 
+# Kselftest framework requirement - SKIP code is 4
+ksft_skip=4
+
 # log(msg) - write message to kernel log
 #	msg - insightful words
 function log() {
@@ -18,7 +21,16 @@ function log() {
 function skip() {
 	log "SKIP: $1"
 	echo "SKIP: $1" >&2
-	exit 4
+	exit $ksft_skip
+}
+
+# root test
+function is_root() {
+	uid=$(id -u)
+	if [ $uid -ne 0 ]; then
+		echo "skip all tests: must be run as root" >&2
+		exit $ksft_skip
+	fi
 }
 
 # die(msg) - game over, man
@@ -45,6 +57,7 @@ function pop_config() {
 }
 
 function set_dynamic_debug() {
+	is_root
         cat <<-EOF > /sys/kernel/debug/dynamic_debug/control
 		file kernel/livepatch/* +p
 		func klp_try_switch_task -p
@@ -62,6 +75,7 @@ function set_ftrace_enabled() {
 #		 for verbose livepatching output and turn on
 #		 the ftrace_enabled sysctl.
 function setup_config() {
+	is_root
 	push_config
 	set_dynamic_debug
 	set_ftrace_enabled 1
-- 
2.20.1

