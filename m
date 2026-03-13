Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6160F3C6619
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Mar 2026 20:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773435553; cv=none; b=HUJi/IRqBp4CT9IMBipuN3T+dqXUu+ueULKVkEl7/B9xqhxbY9b0WOY8IsrWJgADKr6TeCpxi2R5fPjF35VmhgbNhDuoW0NjpHPVFJOzvCx/cRJt9FFVw3zsRVCDuow8vmrheuT7o9A/uE8j5lhOOcu5/1KV70ty7edNH0zRKyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773435553; c=relaxed/simple;
	bh=dAnCHBD0kYfQriAqJYl89NUP2OzkcdbdI/rMejo7qBM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MHXYJEtdpKr8TLcG1zwBoKZ2iognhczYfz8A2K+hP38EY9JuHYNCsX7gEQRmLWFsLMF9yI/CVdUQJpiazpPJr+s+cZ1rTGr2WCeSdDTIi6n+JqOzUOawnv4Mw0qZEM6mwqP8yh7OPslQCcqFmjSZf4QeOrWr7rSZ6P6UnuzMiKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=IWnbu5K5; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="IWnbu5K5"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4852c9b4158so22273025e9.0
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Mar 2026 13:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773435547; x=1774040347; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g0feFC5vZEgNUR6jUa/fsGovJx254Pm7zg4y/sKLrFg=;
        b=IWnbu5K5RB5JUI23fOhqonepbrdEEmwrhmKDGrDOBJuWQLxPKP6//rSazNjM24ceoE
         qkvJKhpNZ7zAlppSfdj7chn7H3LQ93Q9MtzZThIX5K/aanQF+p77YhliOYJ+TqGGC4ai
         eagyYOOEOsHuhKvDlmZh34L+FHOJowxL0HVHoDAWXj/tZ477WY1vcQaGC//8kIYxjh7N
         4zvfh14lfSgTsGuc8R/xYJZDgl0PRKQiwSx7xgSAelXpRfn6hdcs4A3gO4DaxcecA9jl
         kNC+7d7OllFiom2G5iXbPvbg6bYnVBxJiuZdo8/N+HCC5VNPWSnwkNarkfty25leqsn3
         d8nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773435547; x=1774040347;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=g0feFC5vZEgNUR6jUa/fsGovJx254Pm7zg4y/sKLrFg=;
        b=ny6KIdZTGSubU1R9aOdFkhkQEwySpqeRIBUV1Z6eoMXmKJHP6TWOWaHv18mdwZvM1S
         yuUBmoL+lLVWdQ/kWVwCOf6c7vZgpitwEVREAUEeohgpNAZHGqCiHS5DxpE8LCyrpL/C
         UY1xGxoIU5V46lUTXzItiPkXLTZvVcZ3+vO7hkxyBL3rWYiXPssgWCwQUDz8L5OffmKB
         yLsg3UuwxD6o9QBmHPAHL7MBf0vKOkHPUgG6KVtynfOhBvvsE1JnFh1lSOPP5BolmjY4
         nKPYadx+hmw6gxjZX8VITZKtpMv/KzzHZgZhyUnUzTbeRRCVPOeHTeqNwa/X4GbOka9j
         ig8g==
X-Forwarded-Encrypted: i=1; AJvYcCWHielzbDF7MbyKuzXA0tMoujb8/EsN0Wb/B5MHDPYGTI8JVoQ9ngpkCHz1ri2HzeqK8NjgSev9GrXVj8HVmDU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXD37SM9FnAdqrmlQA3OhXN7NwePtpUKN6ynGqKjHNCuq2gC29
	a/qttSKNdU9tmZYCgDd47bEjLNlfJ7CC5owVuI+IfLwgEdl+CLjv0Dsdt6DkutyEMNzDok0Xs9f
	Tr+fL8jc=
X-Gm-Gg: ATEYQzy84S2Vh8b5HbkpiFXZtfHokFCdshU9d7fwOlRCISDRryyVVRxol8q2IezQ5Yh
	Iyf8hhm8puMKQ6J5SoT3NZ9uvgh1yZNUk1vOAuqTxrvtOq4N4v0bboMrvmTjhwxdtoVGQ2tIzM1
	FniYCSJRVO3uD/g/PQr87HPw6VqsEQZ3wz6Yx+2gbOrEs/MnwbyIRRKK6H0FPF3OS8kwXao38gm
	kMltQZtsWN+eYPdTiAhog/fuT6tzHfyzFsHk5XCyl0pkBQa92T5L+158C3rSBjXb8VWv6Ild2qt
	XHpnoVxne1r75v4Wk0Qub9wBzJNpJ6e247kAIdnSoRfM4VV3JiAoTogFxGxRGkS2FXZESQKTaN4
	b3UWN9QSDS86UtxqDQvgrQ0VgcEEVjAMrQkE1umv43+xwky/gFd/+Bi8zmwvFvv2YlhRGV2JXVE
	uhvy74F8bXEu1ttxfQtZiS
X-Received: by 2002:a05:600c:8286:b0:485:34b3:8585 with SMTP id 5b1f17b1804b1-485566d6dffmr72119545e9.8.1773435547219;
        Fri, 13 Mar 2026 13:59:07 -0700 (PDT)
Received: from [127.0.0.1] ([2804:5078:834:1300:58f2:fc97:371f:3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2beab526d3csm4042611eec.18.2026.03.13.13.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 13:59:06 -0700 (PDT)
From: Marcos Paulo de Souza <mpdesouza@suse.com>
Date: Fri, 13 Mar 2026 17:58:37 -0300
Subject: [PATCH 6/8] selftests: livepatch: sysfs: Split tests of
 stack_order attribute
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-lp-tests-old-fixes-v1-6-71ac6dfb3253@suse.com>
References: <20260313-lp-tests-old-fixes-v1-0-71ac6dfb3253@suse.com>
In-Reply-To: <20260313-lp-tests-old-fixes-v1-0-71ac6dfb3253@suse.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
 Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, 
 Joe Lawrence <joe.lawrence@redhat.com>, Shuah Khan <shuah@kernel.org>
Cc: live-patching@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Marcos Paulo de Souza <mpdesouza@suse.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773435515; l=9545;
 i=mpdesouza@suse.com; s=20231031; h=from:subject:message-id;
 bh=dAnCHBD0kYfQriAqJYl89NUP2OzkcdbdI/rMejo7qBM=;
 b=Y2RmJfSytx/PBjCk0gfL7cla8FAo0I3qGVTE6GweDQkji0rgmqZI4CkeR9tTXN5bQdiDwtSx5
 HvSmNp/yxRkBBruCGlnxky4fqPa/Uk/q0q0W7KinJthXgb0Tj4eBLB9
X-Developer-Key: i=mpdesouza@suse.com; a=ed25519;
 pk=/Ni/TsKkr69EOmdZXkp1Q/BlzDonbOBRsfPa18ySIwU=

In order to run the selftests on older kernels, split the sysfs tests to
another file, making it able to skip the tests when the attributes
don't exists.

No functional changes.

Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
---
 tools/testing/selftests/livepatch/Makefile         |   1 +
 .../selftests/livepatch/test-sysfs-stack-attr.sh   | 121 +++++++++++++++++++++
 tools/testing/selftests/livepatch/test-sysfs.sh    |  71 ------------
 3 files changed, 122 insertions(+), 71 deletions(-)

diff --git a/tools/testing/selftests/livepatch/Makefile b/tools/testing/selftests/livepatch/Makefile
index b95aa6e78a273..1982056670fc2 100644
--- a/tools/testing/selftests/livepatch/Makefile
+++ b/tools/testing/selftests/livepatch/Makefile
@@ -11,6 +11,7 @@ TEST_PROGS := \
 	test-ftrace.sh \
 	test-sysfs.sh \
 	test-sysfs-replace-attr.sh \
+	test-sysfs-stack-attr.sh \
 	test-syscall.sh \
 	test-kprobe.sh
 
diff --git a/tools/testing/selftests/livepatch/test-sysfs-stack-attr.sh b/tools/testing/selftests/livepatch/test-sysfs-stack-attr.sh
new file mode 100755
index 0000000000000..2b8b72fe1f6dc
--- /dev/null
+++ b/tools/testing/selftests/livepatch/test-sysfs-stack-attr.sh
@@ -0,0 +1,121 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+# Copyright (C) 2022 Song Liu <song@kernel.org>
+
+. $(dirname $0)/functions.sh
+
+MOD_LIVEPATCH=test_klp_livepatch
+MOD_LIVEPATCH2=test_klp_callbacks_demo
+MOD_LIVEPATCH3=test_klp_syscall
+
+setup_config
+
+# - load a livepatch and verifies the sysfs stack_order attribute exists
+
+start_test "check sysfs stack_order attribute"
+
+load_lp $MOD_LIVEPATCH
+
+check_sysfs_exists "$MOD_LIVEPATCH" "stack_order"
+file_exists=$?
+
+disable_lp $MOD_LIVEPATCH
+
+unload_lp $MOD_LIVEPATCH
+
+if [[ "$file_exists" == "0" ]]; then
+	skip "sysfs attribute doesn't exists."
+fi
+
+start_test "check sysfs stack_order permissions"
+
+load_lp $MOD_LIVEPATCH
+
+check_sysfs_rights "$MOD_LIVEPATCH" "stack_order" "-r--r--r--"
+check_sysfs_value  "$MOD_LIVEPATCH" "stack_order" "1"
+
+disable_lp $MOD_LIVEPATCH
+
+unload_lp $MOD_LIVEPATCH
+
+check_result "% insmod test_modules/$MOD_LIVEPATCH.ko
+livepatch: enabling patch '$MOD_LIVEPATCH'
+livepatch: '$MOD_LIVEPATCH': initializing patching transition
+livepatch: '$MOD_LIVEPATCH': starting patching transition
+livepatch: '$MOD_LIVEPATCH': completing patching transition
+livepatch: '$MOD_LIVEPATCH': patching complete
+% echo 0 > $SYSFS_KLP_DIR/$MOD_LIVEPATCH/enabled
+livepatch: '$MOD_LIVEPATCH': initializing unpatching transition
+livepatch: '$MOD_LIVEPATCH': starting unpatching transition
+livepatch: '$MOD_LIVEPATCH': completing unpatching transition
+livepatch: '$MOD_LIVEPATCH': unpatching complete
+% rmmod $MOD_LIVEPATCH"
+
+start_test "sysfs test stack_order value"
+
+load_lp $MOD_LIVEPATCH
+
+check_sysfs_value  "$MOD_LIVEPATCH" "stack_order" "1"
+
+load_lp $MOD_LIVEPATCH2
+
+check_sysfs_value  "$MOD_LIVEPATCH2" "stack_order" "2"
+
+load_lp $MOD_LIVEPATCH3
+
+check_sysfs_value  "$MOD_LIVEPATCH3" "stack_order" "3"
+
+disable_lp $MOD_LIVEPATCH2
+unload_lp $MOD_LIVEPATCH2
+
+check_sysfs_value  "$MOD_LIVEPATCH" "stack_order" "1"
+check_sysfs_value  "$MOD_LIVEPATCH3" "stack_order" "2"
+
+disable_lp $MOD_LIVEPATCH3
+unload_lp $MOD_LIVEPATCH3
+
+disable_lp $MOD_LIVEPATCH
+unload_lp $MOD_LIVEPATCH
+
+check_result "% insmod test_modules/$MOD_LIVEPATCH.ko
+livepatch: enabling patch '$MOD_LIVEPATCH'
+livepatch: '$MOD_LIVEPATCH': initializing patching transition
+livepatch: '$MOD_LIVEPATCH': starting patching transition
+livepatch: '$MOD_LIVEPATCH': completing patching transition
+livepatch: '$MOD_LIVEPATCH': patching complete
+% insmod test_modules/$MOD_LIVEPATCH2.ko
+livepatch: enabling patch '$MOD_LIVEPATCH2'
+livepatch: '$MOD_LIVEPATCH2': initializing patching transition
+$MOD_LIVEPATCH2: pre_patch_callback: vmlinux
+livepatch: '$MOD_LIVEPATCH2': starting patching transition
+livepatch: '$MOD_LIVEPATCH2': completing patching transition
+$MOD_LIVEPATCH2: post_patch_callback: vmlinux
+livepatch: '$MOD_LIVEPATCH2': patching complete
+% insmod test_modules/$MOD_LIVEPATCH3.ko
+livepatch: enabling patch '$MOD_LIVEPATCH3'
+livepatch: '$MOD_LIVEPATCH3': initializing patching transition
+livepatch: '$MOD_LIVEPATCH3': starting patching transition
+livepatch: '$MOD_LIVEPATCH3': completing patching transition
+livepatch: '$MOD_LIVEPATCH3': patching complete
+% echo 0 > $SYSFS_KLP_DIR/$MOD_LIVEPATCH2/enabled
+livepatch: '$MOD_LIVEPATCH2': initializing unpatching transition
+$MOD_LIVEPATCH2: pre_unpatch_callback: vmlinux
+livepatch: '$MOD_LIVEPATCH2': starting unpatching transition
+livepatch: '$MOD_LIVEPATCH2': completing unpatching transition
+$MOD_LIVEPATCH2: post_unpatch_callback: vmlinux
+livepatch: '$MOD_LIVEPATCH2': unpatching complete
+% rmmod $MOD_LIVEPATCH2
+% echo 0 > $SYSFS_KLP_DIR/$MOD_LIVEPATCH3/enabled
+livepatch: '$MOD_LIVEPATCH3': initializing unpatching transition
+livepatch: '$MOD_LIVEPATCH3': starting unpatching transition
+livepatch: '$MOD_LIVEPATCH3': completing unpatching transition
+livepatch: '$MOD_LIVEPATCH3': unpatching complete
+% rmmod $MOD_LIVEPATCH3
+% echo 0 > $SYSFS_KLP_DIR/$MOD_LIVEPATCH/enabled
+livepatch: '$MOD_LIVEPATCH': initializing unpatching transition
+livepatch: '$MOD_LIVEPATCH': starting unpatching transition
+livepatch: '$MOD_LIVEPATCH': completing unpatching transition
+livepatch: '$MOD_LIVEPATCH': unpatching complete
+% rmmod $MOD_LIVEPATCH"
+
+exit 0
diff --git a/tools/testing/selftests/livepatch/test-sysfs.sh b/tools/testing/selftests/livepatch/test-sysfs.sh
index 0865a7959496a..3327bde59e73d 100755
--- a/tools/testing/selftests/livepatch/test-sysfs.sh
+++ b/tools/testing/selftests/livepatch/test-sysfs.sh
@@ -5,8 +5,6 @@
 . $(dirname $0)/functions.sh
 
 MOD_LIVEPATCH=test_klp_livepatch
-MOD_LIVEPATCH2=test_klp_callbacks_demo
-MOD_LIVEPATCH3=test_klp_syscall
 
 setup_config
 
@@ -20,8 +18,6 @@ check_sysfs_rights "$MOD_LIVEPATCH" "" "drwxr-xr-x"
 check_sysfs_rights "$MOD_LIVEPATCH" "enabled" "-rw-r--r--"
 check_sysfs_value  "$MOD_LIVEPATCH" "enabled" "1"
 check_sysfs_rights "$MOD_LIVEPATCH" "force" "--w-------"
-check_sysfs_rights "$MOD_LIVEPATCH" "stack_order" "-r--r--r--"
-check_sysfs_value  "$MOD_LIVEPATCH" "stack_order" "1"
 check_sysfs_rights "$MOD_LIVEPATCH" "transition" "-r--r--r--"
 check_sysfs_value  "$MOD_LIVEPATCH" "transition" "0"
 check_sysfs_rights "$MOD_LIVEPATCH" "vmlinux/patched" "-r--r--r--"
@@ -87,71 +83,4 @@ test_klp_callbacks_demo: post_unpatch_callback: vmlinux
 livepatch: 'test_klp_callbacks_demo': unpatching complete
 % rmmod test_klp_callbacks_demo"
 
-start_test "sysfs test stack_order value"
-
-load_lp $MOD_LIVEPATCH
-
-check_sysfs_value  "$MOD_LIVEPATCH" "stack_order" "1"
-
-load_lp $MOD_LIVEPATCH2
-
-check_sysfs_value  "$MOD_LIVEPATCH2" "stack_order" "2"
-
-load_lp $MOD_LIVEPATCH3
-
-check_sysfs_value  "$MOD_LIVEPATCH3" "stack_order" "3"
-
-disable_lp $MOD_LIVEPATCH2
-unload_lp $MOD_LIVEPATCH2
-
-check_sysfs_value  "$MOD_LIVEPATCH" "stack_order" "1"
-check_sysfs_value  "$MOD_LIVEPATCH3" "stack_order" "2"
-
-disable_lp $MOD_LIVEPATCH3
-unload_lp $MOD_LIVEPATCH3
-
-disable_lp $MOD_LIVEPATCH
-unload_lp $MOD_LIVEPATCH
-
-check_result "% insmod test_modules/$MOD_LIVEPATCH.ko
-livepatch: enabling patch '$MOD_LIVEPATCH'
-livepatch: '$MOD_LIVEPATCH': initializing patching transition
-livepatch: '$MOD_LIVEPATCH': starting patching transition
-livepatch: '$MOD_LIVEPATCH': completing patching transition
-livepatch: '$MOD_LIVEPATCH': patching complete
-% insmod test_modules/$MOD_LIVEPATCH2.ko
-livepatch: enabling patch '$MOD_LIVEPATCH2'
-livepatch: '$MOD_LIVEPATCH2': initializing patching transition
-$MOD_LIVEPATCH2: pre_patch_callback: vmlinux
-livepatch: '$MOD_LIVEPATCH2': starting patching transition
-livepatch: '$MOD_LIVEPATCH2': completing patching transition
-$MOD_LIVEPATCH2: post_patch_callback: vmlinux
-livepatch: '$MOD_LIVEPATCH2': patching complete
-% insmod test_modules/$MOD_LIVEPATCH3.ko
-livepatch: enabling patch '$MOD_LIVEPATCH3'
-livepatch: '$MOD_LIVEPATCH3': initializing patching transition
-livepatch: '$MOD_LIVEPATCH3': starting patching transition
-livepatch: '$MOD_LIVEPATCH3': completing patching transition
-livepatch: '$MOD_LIVEPATCH3': patching complete
-% echo 0 > $SYSFS_KLP_DIR/$MOD_LIVEPATCH2/enabled
-livepatch: '$MOD_LIVEPATCH2': initializing unpatching transition
-$MOD_LIVEPATCH2: pre_unpatch_callback: vmlinux
-livepatch: '$MOD_LIVEPATCH2': starting unpatching transition
-livepatch: '$MOD_LIVEPATCH2': completing unpatching transition
-$MOD_LIVEPATCH2: post_unpatch_callback: vmlinux
-livepatch: '$MOD_LIVEPATCH2': unpatching complete
-% rmmod $MOD_LIVEPATCH2
-% echo 0 > $SYSFS_KLP_DIR/$MOD_LIVEPATCH3/enabled
-livepatch: '$MOD_LIVEPATCH3': initializing unpatching transition
-livepatch: '$MOD_LIVEPATCH3': starting unpatching transition
-livepatch: '$MOD_LIVEPATCH3': completing unpatching transition
-livepatch: '$MOD_LIVEPATCH3': unpatching complete
-% rmmod $MOD_LIVEPATCH3
-% echo 0 > $SYSFS_KLP_DIR/$MOD_LIVEPATCH/enabled
-livepatch: '$MOD_LIVEPATCH': initializing unpatching transition
-livepatch: '$MOD_LIVEPATCH': starting unpatching transition
-livepatch: '$MOD_LIVEPATCH': completing unpatching transition
-livepatch: '$MOD_LIVEPATCH': unpatching complete
-% rmmod $MOD_LIVEPATCH"
-
 exit 0

-- 
2.52.0

