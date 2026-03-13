Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E03384235
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Mar 2026 20:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773435558; cv=none; b=uHTEyTbFbLp4kNcx6239GODgFoT0QJUcJMRBIxJLl8AzmVjBI2WlpiMQmScwDRWdfwnDp3X0ZEFWYbRRkQVUB7PLNPG4kKAEdY1ezqAynuQtgHgRMw8aV1fp0NtGniwhwmeIQbSxUm6377Ga6W1AGPqQ19ukPOcEs61mmzeLFko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773435558; c=relaxed/simple;
	bh=7miD+iiagzq5C2pRyxmlazC6IojzoSp0vrZTCyoeCrc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BAvULu8mligz1Jwj3cyMOZfhIQCrcVT+3Yw09F2gXP+GoAHtb8pyk0aQwkUz5Ov8woUy84lpRI9P7j+PdkZfv5B5bF5zRHMF2fWaQcBJ4OmmbjluAKwxuVcfp1h+usAZlymQVqTQDcqX68Dv1FdkOwpsHMk7eQHIJRv6IHzsG5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=RzDVTsBb; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="RzDVTsBb"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48540d21f7dso30560935e9.0
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Mar 2026 13:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773435552; x=1774040352; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CtpindbIzqkRgW7Z2vVcHsOf0RGWeyCQynvMr4lGYeE=;
        b=RzDVTsBb4+kQ4+bDTyzmjLlcHSSoP9B8q6WireKq4OM1N4oQzwSYLdL3HhfbM9H+Qz
         eKbEfuH2DJss0wJE/k6OWjZbW4ECo2LFRBWPFsW7EQf+37BbAAz8Ki2buija+fWMPv01
         niOV7riQGMzsPK7IP7p+YKqhD3QRH8H1YJc+oBta5t9+jutVY2VEjh4X900fmz917FMX
         w5sh/LzNxXQT3U4fvnV3U7EiZhhM3l1tzBmkLo/FDBd3Fc8f7D8GluJ380UFAJ2KB+21
         6MncctgOPIrpzrP0QJ8fKkXkrQE3fF3c51mDCoGVGVWkfe+qUzhSxA/8vJ8gaAgtBU+g
         dshQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773435552; x=1774040352;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CtpindbIzqkRgW7Z2vVcHsOf0RGWeyCQynvMr4lGYeE=;
        b=jnTox6r3O8JLYirwTfklAMsPo9fUb7MXYwQACe6xDlkUJ3/iF2f8hTVm/rN+NFTFlI
         s7aEGN5c8DTajEELHLZK3wHfmorpIgZruvYO+4spMO4+VRUuVcts5Dt0IEkBgs8o88+C
         poffXkhMITgGCGh3bZz7HcyUm3qIB1icqVdyS0J8JUVCP2S9S1jmvE6aeqMR0CeBQDNK
         whFZPPypyz5uabRUFR5JCXUM/vLa8JMSKLKUbU+IW/LP9SLPwDpNv5foGzoX3JEqwTo2
         EiwU3hSXTJUahOw2W1OLw3MmlRxTeDPi+21azCr6ZzvQIP+I7O2+Z+wtnEmT6lyRAedz
         Ay7w==
X-Forwarded-Encrypted: i=1; AJvYcCUTj787u+eucdYaErlx+ZZdnxnN59jho2vgJb90+mo2RiN4zngFiqZbvZMAEez7vpUuKAnXV17tlMQa+YWQ52Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YysEA4g7owHTJ7PII09pheBzha8zY8F93SLCr4ikP3sE2TgrAkL
	JwYOJT3MnhHil6lii+yjf55fkeylWpzNlZIsbyUGL8cgjyjYwQ6+2/1yVu0uBrQoTTX+Sbvcv6J
	HAKYqjnk=
X-Gm-Gg: ATEYQzyYmEj0SvOfJKLk/2OTWrGkPqGzHlK/idocQgcNrUQPZoUJeAROLFVN0uGg+iQ
	k/0/5pPAACmclNEyyiYBVvOyMNPQOyKRBgXUN72rJWmhg2F1RtnIxdy+81RrqbQnqRpwpbQtWJB
	pEwzzv+dmNz2av5WtldBaJbCnKAqZOL345M17VP105AKAb/HEm6aCU8NA2+PC1O4yqaBBbaeRSa
	mCCv7SvnrGOvO4ffH2ka9unkNYwswmKq4+K6H6ozNpWY7VNqE3aDFDdTZbN09g8euE2fXYOHFOl
	1pou/vwq8/x9YClFwc68rJO8Yvm8QZKd/vdYOpCjFR6vj0ppBuPeaZ/e9aNzv6qpGMJaqY6AgtZ
	vqpuTOIS9966pAEVOQ6lVOgbqw0S4JVZx79aa6fddBVzMDqXW1FS3Af3a9tfVNJn2IN4VOB1x/h
	clJI6ff/EHBTIvNdDs/hPU
X-Received: by 2002:a05:600c:4f8f:b0:485:40c6:f507 with SMTP id 5b1f17b1804b1-48556711c6cmr83526535e9.30.1773435551766;
        Fri, 13 Mar 2026 13:59:11 -0700 (PDT)
Received: from [127.0.0.1] ([2804:5078:834:1300:58f2:fc97:371f:3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2beab526d3csm4042611eec.18.2026.03.13.13.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 13:59:10 -0700 (PDT)
From: Marcos Paulo de Souza <mpdesouza@suse.com>
Date: Fri, 13 Mar 2026 17:58:38 -0300
Subject: [PATCH 7/8] selftests: livepatch: sysfs: Split tests of patched
 attribute
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-lp-tests-old-fixes-v1-7-71ac6dfb3253@suse.com>
References: <20260313-lp-tests-old-fixes-v1-0-71ac6dfb3253@suse.com>
In-Reply-To: <20260313-lp-tests-old-fixes-v1-0-71ac6dfb3253@suse.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
 Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, 
 Joe Lawrence <joe.lawrence@redhat.com>, Shuah Khan <shuah@kernel.org>
Cc: live-patching@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Marcos Paulo de Souza <mpdesouza@suse.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773435515; l=8340;
 i=mpdesouza@suse.com; s=20231031; h=from:subject:message-id;
 bh=7miD+iiagzq5C2pRyxmlazC6IojzoSp0vrZTCyoeCrc=;
 b=uqFFQEX3HHu+zZW7rPQBC5tgv3eZjksDN3DnrZZTJSoo2WkJagFHOjl28pWkfB32qKuM46tb1
 cUCGhosNsX3CVCG+M5/SA0H3NlXSuYSkLfbexViZpdixDx9EgM6z4Gi
X-Developer-Key: i=mpdesouza@suse.com; a=ed25519;
 pk=/Ni/TsKkr69EOmdZXkp1Q/BlzDonbOBRsfPa18ySIwU=

In order to run the selftests on older kernels, split the sysfs tests to
another file, making it able to skip the tests when the attributes
don't exists.

No functional changes.

Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
---
 tools/testing/selftests/livepatch/Makefile         |  1 +
 .../selftests/livepatch/test-sysfs-patched-attr.sh | 95 ++++++++++++++++++++++
 tools/testing/selftests/livepatch/test-sysfs.sh    | 45 ----------
 3 files changed, 96 insertions(+), 45 deletions(-)

diff --git a/tools/testing/selftests/livepatch/Makefile b/tools/testing/selftests/livepatch/Makefile
index 1982056670fc2..31ca4669b6ae7 100644
--- a/tools/testing/selftests/livepatch/Makefile
+++ b/tools/testing/selftests/livepatch/Makefile
@@ -12,6 +12,7 @@ TEST_PROGS := \
 	test-sysfs.sh \
 	test-sysfs-replace-attr.sh \
 	test-sysfs-stack-attr.sh \
+	test-sysfs-patched-attr.sh \
 	test-syscall.sh \
 	test-kprobe.sh
 
diff --git a/tools/testing/selftests/livepatch/test-sysfs-patched-attr.sh b/tools/testing/selftests/livepatch/test-sysfs-patched-attr.sh
new file mode 100755
index 0000000000000..2cefd1159fb11
--- /dev/null
+++ b/tools/testing/selftests/livepatch/test-sysfs-patched-attr.sh
@@ -0,0 +1,95 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+# Copyright (C) 2022 Song Liu <song@kernel.org>
+
+. $(dirname $0)/functions.sh
+
+MOD_LIVEPATCH=test_klp_livepatch
+
+setup_config
+
+# - load a livepatch and verifies the sysfs patched attribute
+
+start_test "check sysfs patched attribute"
+
+load_lp $MOD_LIVEPATCH
+
+check_sysfs_exists "$MOD_LIVEPATCH" "vmlinux/patched"
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
+start_test "check sysfs patched values"
+
+load_lp $MOD_LIVEPATCH
+
+check_sysfs_rights "$MOD_LIVEPATCH" "vmlinux/patched" "-r--r--r--"
+check_sysfs_value  "$MOD_LIVEPATCH" "vmlinux/patched" "1"
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
+start_test "sysfs test object/patched"
+
+MOD_LIVEPATCH=test_klp_callbacks_demo
+MOD_TARGET=test_klp_callbacks_mod
+load_lp $MOD_LIVEPATCH
+
+# check the "patch" file changes as target module loads/unloads
+check_sysfs_value  "$MOD_LIVEPATCH" "$MOD_TARGET/patched" "0"
+load_mod $MOD_TARGET
+check_sysfs_value  "$MOD_LIVEPATCH" "$MOD_TARGET/patched" "1"
+unload_mod $MOD_TARGET
+check_sysfs_value  "$MOD_LIVEPATCH" "$MOD_TARGET/patched" "0"
+
+disable_lp $MOD_LIVEPATCH
+unload_lp $MOD_LIVEPATCH
+
+check_result "% insmod test_modules/test_klp_callbacks_demo.ko
+livepatch: enabling patch 'test_klp_callbacks_demo'
+livepatch: 'test_klp_callbacks_demo': initializing patching transition
+test_klp_callbacks_demo: pre_patch_callback: vmlinux
+livepatch: 'test_klp_callbacks_demo': starting patching transition
+livepatch: 'test_klp_callbacks_demo': completing patching transition
+test_klp_callbacks_demo: post_patch_callback: vmlinux
+livepatch: 'test_klp_callbacks_demo': patching complete
+% insmod test_modules/test_klp_callbacks_mod.ko
+livepatch: applying patch 'test_klp_callbacks_demo' to loading module 'test_klp_callbacks_mod'
+test_klp_callbacks_demo: pre_patch_callback: test_klp_callbacks_mod -> [MODULE_STATE_COMING] Full formed, running module_init
+test_klp_callbacks_demo: post_patch_callback: test_klp_callbacks_mod -> [MODULE_STATE_COMING] Full formed, running module_init
+test_klp_callbacks_mod: test_klp_callbacks_mod_init
+% rmmod test_klp_callbacks_mod
+test_klp_callbacks_mod: test_klp_callbacks_mod_exit
+test_klp_callbacks_demo: pre_unpatch_callback: test_klp_callbacks_mod -> [MODULE_STATE_GOING] Going away
+livepatch: reverting patch 'test_klp_callbacks_demo' on unloading module 'test_klp_callbacks_mod'
+test_klp_callbacks_demo: post_unpatch_callback: test_klp_callbacks_mod -> [MODULE_STATE_GOING] Going away
+% echo 0 > $SYSFS_KLP_DIR/test_klp_callbacks_demo/enabled
+livepatch: 'test_klp_callbacks_demo': initializing unpatching transition
+test_klp_callbacks_demo: pre_unpatch_callback: vmlinux
+livepatch: 'test_klp_callbacks_demo': starting unpatching transition
+livepatch: 'test_klp_callbacks_demo': completing unpatching transition
+test_klp_callbacks_demo: post_unpatch_callback: vmlinux
+livepatch: 'test_klp_callbacks_demo': unpatching complete
+% rmmod test_klp_callbacks_demo"
+
+exit 0
diff --git a/tools/testing/selftests/livepatch/test-sysfs.sh b/tools/testing/selftests/livepatch/test-sysfs.sh
index 3327bde59e73d..d24c13ad86124 100755
--- a/tools/testing/selftests/livepatch/test-sysfs.sh
+++ b/tools/testing/selftests/livepatch/test-sysfs.sh
@@ -20,8 +20,6 @@ check_sysfs_value  "$MOD_LIVEPATCH" "enabled" "1"
 check_sysfs_rights "$MOD_LIVEPATCH" "force" "--w-------"
 check_sysfs_rights "$MOD_LIVEPATCH" "transition" "-r--r--r--"
 check_sysfs_value  "$MOD_LIVEPATCH" "transition" "0"
-check_sysfs_rights "$MOD_LIVEPATCH" "vmlinux/patched" "-r--r--r--"
-check_sysfs_value  "$MOD_LIVEPATCH" "vmlinux/patched" "1"
 
 disable_lp $MOD_LIVEPATCH
 
@@ -40,47 +38,4 @@ livepatch: '$MOD_LIVEPATCH': completing unpatching transition
 livepatch: '$MOD_LIVEPATCH': unpatching complete
 % rmmod $MOD_LIVEPATCH"
 
-start_test "sysfs test object/patched"
-
-MOD_LIVEPATCH=test_klp_callbacks_demo
-MOD_TARGET=test_klp_callbacks_mod
-load_lp $MOD_LIVEPATCH
-
-# check the "patch" file changes as target module loads/unloads
-check_sysfs_value  "$MOD_LIVEPATCH" "$MOD_TARGET/patched" "0"
-load_mod $MOD_TARGET
-check_sysfs_value  "$MOD_LIVEPATCH" "$MOD_TARGET/patched" "1"
-unload_mod $MOD_TARGET
-check_sysfs_value  "$MOD_LIVEPATCH" "$MOD_TARGET/patched" "0"
-
-disable_lp $MOD_LIVEPATCH
-unload_lp $MOD_LIVEPATCH
-
-check_result "% insmod test_modules/test_klp_callbacks_demo.ko
-livepatch: enabling patch 'test_klp_callbacks_demo'
-livepatch: 'test_klp_callbacks_demo': initializing patching transition
-test_klp_callbacks_demo: pre_patch_callback: vmlinux
-livepatch: 'test_klp_callbacks_demo': starting patching transition
-livepatch: 'test_klp_callbacks_demo': completing patching transition
-test_klp_callbacks_demo: post_patch_callback: vmlinux
-livepatch: 'test_klp_callbacks_demo': patching complete
-% insmod test_modules/test_klp_callbacks_mod.ko
-livepatch: applying patch 'test_klp_callbacks_demo' to loading module 'test_klp_callbacks_mod'
-test_klp_callbacks_demo: pre_patch_callback: test_klp_callbacks_mod -> [MODULE_STATE_COMING] Full formed, running module_init
-test_klp_callbacks_demo: post_patch_callback: test_klp_callbacks_mod -> [MODULE_STATE_COMING] Full formed, running module_init
-test_klp_callbacks_mod: test_klp_callbacks_mod_init
-% rmmod test_klp_callbacks_mod
-test_klp_callbacks_mod: test_klp_callbacks_mod_exit
-test_klp_callbacks_demo: pre_unpatch_callback: test_klp_callbacks_mod -> [MODULE_STATE_GOING] Going away
-livepatch: reverting patch 'test_klp_callbacks_demo' on unloading module 'test_klp_callbacks_mod'
-test_klp_callbacks_demo: post_unpatch_callback: test_klp_callbacks_mod -> [MODULE_STATE_GOING] Going away
-% echo 0 > $SYSFS_KLP_DIR/test_klp_callbacks_demo/enabled
-livepatch: 'test_klp_callbacks_demo': initializing unpatching transition
-test_klp_callbacks_demo: pre_unpatch_callback: vmlinux
-livepatch: 'test_klp_callbacks_demo': starting unpatching transition
-livepatch: 'test_klp_callbacks_demo': completing unpatching transition
-test_klp_callbacks_demo: post_unpatch_callback: vmlinux
-livepatch: 'test_klp_callbacks_demo': unpatching complete
-% rmmod test_klp_callbacks_demo"
-
 exit 0

-- 
2.52.0

