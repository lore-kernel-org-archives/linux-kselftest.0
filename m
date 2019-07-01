Return-Path: <SRS0=U7Os=U6=vger.kernel.org=linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07A59C0650F
	for <linux-kselftest@archiver.kernel.org>; Mon,  1 Jul 2019 04:04:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D0AD3212F5
	for <linux-kselftest@archiver.kernel.org>; Mon,  1 Jul 2019 04:04:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b="u84Sii5a"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727360AbfGAEE0 (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Mon, 1 Jul 2019 00:04:26 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:34614 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727303AbfGAEEZ (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Mon, 1 Jul 2019 00:04:25 -0400
Received: by mail-pg1-f195.google.com with SMTP id p10so5345575pgn.1
        for <linux-kselftest@vger.kernel.org>; Sun, 30 Jun 2019 21:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Jy/K9h1um5pl+8SDvWEqL6+5KT54XouLblV746P0ug4=;
        b=u84Sii5aAkBvGlPfBDUEFlgzWi9pe/R8agHeC9cZDawsEvVr//eP4lbs319tS7MB+i
         QOphyTpWRhB92FW2gofqOe6B7/CBXpE5N4uRQQaCnTbXxHoIMZGYSLBUw3o2TvY3QAaF
         TZvXL0aKUkdSOgS71c1JNmf+geptZjHeKrEqo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Jy/K9h1um5pl+8SDvWEqL6+5KT54XouLblV746P0ug4=;
        b=f0mAKCzrBsYBIOkshPEXD8f9QcsKyg9VUIBWrcWuekKp/z7rH4JtvfHS9Pv15MEJGF
         K4XklY5cMLdf8775oiH0dO47596bl2/zKjc0BSteOiV76ORQ+SwJHnoydIB+3lvXTM8b
         IwQ0Rq8c0pqBSHwX3aud6pck46x/qmA1PhRoUd34g0VODrPCRzOYjIxtyhGvF6wEo3SU
         tf+4CcFy4spxr58gEI8UKejcVrQDleScAB+trkWTVRnTGIwohVCr+ZMl0qOJBfSTJf4n
         LwGD7yqZzbE4M1zT5khWt6WuBn428VSPCs3LN/yls+DFKD6Gy/1PgImlcdXB40KKeX3s
         u2xA==
X-Gm-Message-State: APjAAAW/WVnrN8Vy+PcqS7d08Skj7BkMCN9lK6fVidZ2+kcK4SRJWryO
        vn3c8VKT6DsK6sw/5HSdaYjS0Q==
X-Google-Smtp-Source: APXvYqz7Htdbd6b36gdXr2EmEP4Fdix5WXB90ZCvu4Hf3VsWtGkMTcw8H7gq6+NbImTPXG9SZmJJRg==
X-Received: by 2002:a63:4554:: with SMTP id u20mr16528634pgk.406.1561953865200;
        Sun, 30 Jun 2019 21:04:25 -0700 (PDT)
Received: from joelaf.cam.corp.google.com ([2620:15c:6:12:9c46:e0da:efbf:69cc])
        by smtp.gmail.com with ESMTPSA id w1sm10841305pjt.30.2019.06.30.21.04.23
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 30 Jun 2019 21:04:24 -0700 (PDT)
From:   "Joel Fernandes (Google)" <joel@joelfernandes.org>
To:     linux-kernel@vger.kernel.org
Cc:     "Joel Fernandes (Google)" <joel@joelfernandes.org>,
        Josh Triplett <josh@joshtriplett.org>, kernel-team@android.com,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        linux-kselftest@vger.kernel.org,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        "Paul E. McKenney" <paulmck@linux.ibm.com>, rcu@vger.kernel.org,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Shuah Khan <shuah@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>
Subject: [RFC 3/3] Revert "rcutorture: Tweak kvm options"
Date:   Mon,  1 Jul 2019 00:04:15 -0400
Message-Id: <20190701040415.219001-3-joel@joelfernandes.org>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
In-Reply-To: <20190701040415.219001-1-joel@joelfernandes.org>
References: <20190701040415.219001-1-joel@joelfernandes.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kselftest-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

This reverts commit a6fda6dab93c2c06ef4b8cb4b9258df6674d2438 which
causes kvm.sh to not run on my machines. The qemu-system-x86_64 command
runs but does nothing.

Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
---
I am Ok if we want to drop this patch but it is in my tree because
without it I can't run the tests.

 tools/testing/selftests/rcutorture/bin/functions.sh | 13 +------------
 .../selftests/rcutorture/configs/rcu/CFcommon       |  3 ---
 2 files changed, 1 insertion(+), 15 deletions(-)

diff --git a/tools/testing/selftests/rcutorture/bin/functions.sh b/tools/testing/selftests/rcutorture/bin/functions.sh
index c3a49fb4d6f6..6bcb8b5b2ff2 100644
--- a/tools/testing/selftests/rcutorture/bin/functions.sh
+++ b/tools/testing/selftests/rcutorture/bin/functions.sh
@@ -172,7 +172,7 @@ identify_qemu_append () {
 	local console=ttyS0
 	case "$1" in
 	qemu-system-x86_64|qemu-system-i386)
-		echo selinux=0 initcall_debug debug
+		echo noapic selinux=0 initcall_debug debug
 		;;
 	qemu-system-aarch64)
 		console=ttyAMA0
@@ -191,19 +191,8 @@ identify_qemu_append () {
 # Output arguments for qemu arguments based on the TORTURE_QEMU_MAC
 # and TORTURE_QEMU_INTERACTIVE environment variables.
 identify_qemu_args () {
-	local KVM_CPU=""
-	case "$1" in
-	qemu-system-x86_64)
-		KVM_CPU=kvm64
-		;;
-	qemu-system-i386)
-		KVM_CPU=kvm32
-		;;
-	esac
 	case "$1" in
 	qemu-system-x86_64|qemu-system-i386)
-		echo -machine q35,accel=kvm
-		echo -cpu ${KVM_CPU}
 		;;
 	qemu-system-aarch64)
 		echo -machine virt,gic-version=host -cpu host
diff --git a/tools/testing/selftests/rcutorture/configs/rcu/CFcommon b/tools/testing/selftests/rcutorture/configs/rcu/CFcommon
index e19a444a0684..d2d2a86139db 100644
--- a/tools/testing/selftests/rcutorture/configs/rcu/CFcommon
+++ b/tools/testing/selftests/rcutorture/configs/rcu/CFcommon
@@ -1,5 +1,2 @@
 CONFIG_RCU_TORTURE_TEST=y
 CONFIG_PRINTK_TIME=y
-CONFIG_HYPERVISOR_GUEST=y
-CONFIG_PARAVIRT=y
-CONFIG_KVM_GUEST=y
-- 
2.22.0.410.gd8fdbe21b5-goog

