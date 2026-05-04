Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4326C3E6390
	for <linux-kselftest@vger.kernel.org>; Mon,  4 May 2026 18:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777919728; cv=none; b=uAVg0XHbL93zfBUxe0BzZ5ef8itUgKU9pm7BE96rfahqWK7w958WMpoSHTbk+zj8lpTc+PMFAEqNr6dJZoZbBfuJk6cKoIn4bF6rP3IXiZ+eglSUKQdmPjOnp2mEqLB4TXo91wMOAh4hz3shZ9f3el3Q8LJElPqyC6KnIj8KIo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777919728; c=relaxed/simple;
	bh=6P0e0A8QxWyaPvsGL9j3Ar96CdheOubVPAEIrUABQpk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rUj3vD+Ob3dPZKCBRqKNrV4keThk4AMHhH03+4xmy1XzgstForU6BY75WQhHCrD4RcgdBUGT/a8Ejy9uHfXXLYQ3a4w1IAhANZVpQkCE4CFzs3kNw/ODrF/2j1/u5+SOhXBb/NGzPXk+7drl2KTI+UYnmcDta24BDpNNHMMQtBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=GFZAz9Hx; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="GFZAz9Hx"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488e1a8ac40so42546225e9.2
        for <linux-kselftest@vger.kernel.org>; Mon, 04 May 2026 11:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777919718; x=1778524518; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ol7qxl3WD4B6OBEXdhGIzOFnzr53HJ0GeqePRgqXLMM=;
        b=GFZAz9HxgfyGAim3wPzXguYIYZaPiW64rcS6bgsNCT7YCgofVGrmBivlEfdE2wdkU1
         4p71F9V8Tnt90LR2b4avvZB0mP3Oy53CH8UeZYbBHDW0OwYFH71oEb3HKzEf2oVl4wA7
         aTh0EUdybP0+yLArmOlmWQ89gV3g5R7OKaWLJcFUuiUc/OyyhA0AokMOH+k1XL7Tqa1W
         r1mWEpJu5P69t31015bM36FJGXipmM1OdAeewlP5z9QQDd7ampikH/AsbkjLKI/Vle2f
         MFNjGAhGIpLK+E9gpxe931kfgo/GljJZJSO6b/ePfy6xFWCtFB3af7E/TnAbyuL7ObPM
         qwAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777919718; x=1778524518;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ol7qxl3WD4B6OBEXdhGIzOFnzr53HJ0GeqePRgqXLMM=;
        b=jnGhTN8wTFnQQrU8obRT6sU9hF0AGS0VO1MBTQ3UL109Ic9us08vOC+Ht7WoDOFs4n
         sdsUGXfuXuy4B64wUe6eVxlIcDN08aqV+N4I9XxiDd4y/B4agdN6uedfwXhLLtIB423m
         wX092ImW+mkeL2hKWq8VlLm6v7H6iORM9I7z7i20ruDb4ZmuS45S49aYwWTTWqggFRs3
         hMfYOeaEEeZEb87aGwKnjXd5FcxI1sa7udX6WDp1ImCGO7iA0FgiL0+vkU4w6VEQ54PU
         w5p6yQ47jRPYvGERVwOREwU/3oifsLjqXvxQEUazKdopOHVrEYBZBHttVdOkbyc94wF+
         +wNg==
X-Forwarded-Encrypted: i=1; AFNElJ9VMxcqwDlCYVXcuW/mUjdsphCDsoWzElHDzZqO9G/ruyVYbRcU/YqVmYThmgcdiWnNc3rLEMm2LpA5oucs4e8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwmgHbGSRpJFwvcrt3BlrXwqPCWQJ4k8EGkfsvS2IA2G2q9O/V
	dC/r2EoNMwetexEM73hYsIbhpjkDPbyXd+Yy9f4QS5G8NSrTw5IqP/b0eJFalxE7JQf5WEH2KzA
	J3NFpZ1s=
X-Gm-Gg: AeBDievkIRy1n9NjnzcKjC4x0GvGNoZaeQTh1voa8DtJ9Eo+zfBH/2PCAP1bdrqKIm2
	+SziDYZjw5Pr3Wg1dv+lR5/SOV5ILp+p7HEfTu/if810SV7LHmyriGJNevG8wYPwCW+CGWzc58e
	R2aGesMnfGuAf5muAbA5Cugn6XlRzWclDq73hkJycJFnu5ePhwlaB4gJo/aCdVEJuGZ219wMkY0
	RIgjMXCnk9UcihcCGm6aDVEjTT66bhfGaiWaXukxU5aAcWLaaNwTZzoU61KWZsW0pKiZZWerrTX
	uGhjxJ5hHWGOLRaBcEQ17owDMZvdZ7+7aEirErRzBs+Qur0CI2Kr6yVWJj/cfbEWth+Qx3+3fbf
	x0cN7O/difQjOYjxnGzG0HC3SkdFSz4BV4IyPUhDEHBSnbFDr+Jc9SFxHRihHaIRBaznhmNs+Oe
	TwH/pHXSaMfUKXIz4QonJWLeuU+94yK+S9gg==
X-Received: by 2002:a05:600c:a30a:b0:48a:906b:14ca with SMTP id 5b1f17b1804b1-48a9865f452mr132012925e9.20.1777919718469;
        Mon, 04 May 2026 11:35:18 -0700 (PDT)
Received: from [127.0.0.1] ([2804:1bc4:224:7800:585c:db3a:fcb:e21f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a98b76eddsm26745511f8f.34.2026.05.04.11.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 11:35:18 -0700 (PDT)
From: Marcos Paulo de Souza <mpdesouza@suse.com>
Date: Mon, 04 May 2026 15:34:45 -0300
Subject: [PATCH v5 4/6] selftests: livepatch: Check if patched sysfs
 attribute exists
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-lp-tests-old-fixes-v5-4-0be26d94ab9a@suse.com>
References: <20260504-lp-tests-old-fixes-v5-0-0be26d94ab9a@suse.com>
In-Reply-To: <20260504-lp-tests-old-fixes-v5-0-0be26d94ab9a@suse.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
 Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, 
 Joe Lawrence <joe.lawrence@redhat.com>, Shuah Khan <shuah@kernel.org>
Cc: live-patching@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Marcos Paulo de Souza <mpdesouza@suse.com>, 
 marcos@mpdesouza.com
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777919697; l=6526;
 i=mpdesouza@suse.com; s=20231031; h=from:subject:message-id;
 bh=6P0e0A8QxWyaPvsGL9j3Ar96CdheOubVPAEIrUABQpk=;
 b=y69XL2WyXkyzt8uN7FS65jaMSY6e0SmCV4WJV28ti3cJxYhyNJwnzXRRZnOWqx+dT9BFCQckL
 ldeTaiwTJ7gD72w0P+7oAsZqJYAAtlDXHJtR+/aHBuk8mj0uG7oYDPV
X-Developer-Key: i=mpdesouza@suse.com; a=ed25519;
 pk=/Ni/TsKkr69EOmdZXkp1Q/BlzDonbOBRsfPa18ySIwU=

The commit bb26cfd9e77e
("livepatch: add sysfs entry "patched" for each klp_object") was merged
in v6.1, introducing a new sysfs attribute.

In order to run the selftests on older kernels, check if given kernel
has support for the attribute. If the attribute is not supported, skip
the checks.

Along with this change, use MOD_LIVEPATCH2 variable instead of
reassigning a new value to MOD_LIVEPATCH, and also use the variable
names in the check_result, to avoid using the module names.

Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
---
 tools/testing/selftests/livepatch/test-sysfs.sh | 87 +++++++++++++------------
 1 file changed, 47 insertions(+), 40 deletions(-)

diff --git a/tools/testing/selftests/livepatch/test-sysfs.sh b/tools/testing/selftests/livepatch/test-sysfs.sh
index 58fe1d96997c..7fa2223f9533 100755
--- a/tools/testing/selftests/livepatch/test-sysfs.sh
+++ b/tools/testing/selftests/livepatch/test-sysfs.sh
@@ -8,6 +8,8 @@ MOD_LIVEPATCH=test_klp_livepatch
 MOD_LIVEPATCH2=test_klp_callbacks_demo
 MOD_LIVEPATCH3=test_klp_syscall
 
+HAS_PATCH_ATTR=0
+
 setup_config
 
 # - load a livepatch and verifies the sysfs entries work as expected
@@ -25,8 +27,12 @@ check_sysfs_rights "$MOD_LIVEPATCH" "stack_order" "-r--r--r--"
 check_sysfs_value  "$MOD_LIVEPATCH" "stack_order" "1"
 check_sysfs_rights "$MOD_LIVEPATCH" "transition" "-r--r--r--"
 check_sysfs_value  "$MOD_LIVEPATCH" "transition" "0"
-check_sysfs_rights "$MOD_LIVEPATCH" "vmlinux/patched" "-r--r--r--"
-check_sysfs_value  "$MOD_LIVEPATCH" "vmlinux/patched" "1"
+
+if does_sysfs_exist "$MOD_LIVEPATCH/vmlinux" "patched"; then
+	check_sysfs_rights "$MOD_LIVEPATCH" "vmlinux/patched" "-r--r--r--"
+	check_sysfs_value  "$MOD_LIVEPATCH" "vmlinux/patched" "1"
+	HAS_PATCH_ATTR=1
+fi
 
 disable_lp $MOD_LIVEPATCH
 
@@ -45,48 +51,49 @@ livepatch: '$MOD_LIVEPATCH': completing unpatching transition
 livepatch: '$MOD_LIVEPATCH': unpatching complete
 % rmmod $MOD_LIVEPATCH"
 
-start_test "sysfs test object/patched"
+if [[ "$HAS_PATCH_ATTR" == "1" ]]; then
+	start_test "sysfs test object/patched"
 
-MOD_LIVEPATCH=test_klp_callbacks_demo
-MOD_TARGET=test_klp_callbacks_mod
-load_lp $MOD_LIVEPATCH
+	MOD_TARGET=test_klp_callbacks_mod
+	load_lp $MOD_LIVEPATCH2
 
-# check the "patch" file changes as target module loads/unloads
-check_sysfs_value  "$MOD_LIVEPATCH" "$MOD_TARGET/patched" "0"
-load_mod $MOD_TARGET
-check_sysfs_value  "$MOD_LIVEPATCH" "$MOD_TARGET/patched" "1"
-unload_mod $MOD_TARGET
-check_sysfs_value  "$MOD_LIVEPATCH" "$MOD_TARGET/patched" "0"
+	# check the "patch" file changes as target module loads/unloads
+	check_sysfs_value  "$MOD_LIVEPATCH2" "$MOD_TARGET/patched" "0"
+	load_mod $MOD_TARGET
+	check_sysfs_value  "$MOD_LIVEPATCH2" "$MOD_TARGET/patched" "1"
+	unload_mod $MOD_TARGET
+	check_sysfs_value  "$MOD_LIVEPATCH2" "$MOD_TARGET/patched" "0"
 
-disable_lp $MOD_LIVEPATCH
-unload_lp $MOD_LIVEPATCH
+	disable_lp $MOD_LIVEPATCH2
+	unload_lp $MOD_LIVEPATCH2
 
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
+	check_result "% insmod test_modules/$MOD_LIVEPATCH2.ko
+livepatch: enabling patch '$MOD_LIVEPATCH2'
+livepatch: '$MOD_LIVEPATCH2': initializing patching transition
+$MOD_LIVEPATCH2: pre_patch_callback: vmlinux
+livepatch: '$MOD_LIVEPATCH2': starting patching transition
+livepatch: '$MOD_LIVEPATCH2': completing patching transition
+$MOD_LIVEPATCH2: post_patch_callback: vmlinux
+livepatch: '$MOD_LIVEPATCH2': patching complete
+% insmod test_modules/$MOD_TARGET.ko
+livepatch: applying patch '$MOD_LIVEPATCH2' to loading module '$MOD_TARGET'
+$MOD_LIVEPATCH2: pre_patch_callback: $MOD_TARGET -> [MODULE_STATE_COMING] Full formed, running module_init
+$MOD_LIVEPATCH2: post_patch_callback: $MOD_TARGET -> [MODULE_STATE_COMING] Full formed, running module_init
+$MOD_TARGET: test_klp_callbacks_mod_init
+% rmmod $MOD_TARGET
+$MOD_TARGET: test_klp_callbacks_mod_exit
+$MOD_LIVEPATCH2: pre_unpatch_callback: $MOD_TARGET -> [MODULE_STATE_GOING] Going away
+livepatch: reverting patch '$MOD_LIVEPATCH2' on unloading module '$MOD_TARGET'
+$MOD_LIVEPATCH2: post_unpatch_callback: $MOD_TARGET -> [MODULE_STATE_GOING] Going away
+% echo 0 > $SYSFS_KLP_DIR/$MOD_LIVEPATCH2/enabled
+livepatch: '$MOD_LIVEPATCH2': initializing unpatching transition
+$MOD_LIVEPATCH2: pre_unpatch_callback: vmlinux
+livepatch: '$MOD_LIVEPATCH2': starting unpatching transition
+livepatch: '$MOD_LIVEPATCH2': completing unpatching transition
+$MOD_LIVEPATCH2: post_unpatch_callback: vmlinux
+livepatch: '$MOD_LIVEPATCH2': unpatching complete
+% rmmod $MOD_LIVEPATCH2"
+fi
 
 start_test "sysfs test replace enabled"
 

-- 
2.54.0

