Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E526C352C58
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Mar 2026 20:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774037661; cv=none; b=kAFYu0Z4KMXG5W4mfLm/tTAJoc2TaDcPmSVH+O5tPFrFT/jJb3gtlQRPXmM6GqINgcXVO95B14m00MaW71jNKvPy2cJNaKBveg387c+7K0HEGUj0gtQVqe2Mfa1yEI/88z5jaeh6c1p18zIcDvKpZ3XjASNVcxOI+OiQH98pnro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774037661; c=relaxed/simple;
	bh=RMoWLRANM8/2/oMiqcxTksuxeQgvNQvDb9zxMCPcigY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qq4nW+YqmkWOXsAj6K0Cw4UD/jx2KpZdmyp7+SCVM0glv/WFB4JaFC3KFnm7qMwdiFdgZCTL3IKuIpR2J3ke5R/0VwViHbiuM5SPXJB9gjqvU38uWUcWfXpZGNxrqTrw/wXYwH8+TZwyb8rHJvDiW32FXWWLqyyb1ffbK5ZGKNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jTTpDBCS; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=H0tREukZ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jTTpDBCS";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="H0tREukZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774037657;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JPuumjF1Q/CxeVJhcu6LhrvdlVq1DqJdhZ9BrK6DHGc=;
	b=jTTpDBCS0CRR2kLZLV76NSS1OIQ2oh14zHDHk9y74oAg4dzLMWjtMjh1NrwmMIM01zI0JE
	DzkPOZ7JHWmYHvHoW1t+gGbKL6m04Ko0E/xjBmBoFBYuNieTAWtNAQImp2nBndYaySmolU
	gAI9MVqkZpxwRW412Vf0PClxx1ykJcI=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-608-Z-dDGmGWMBidSg78sd6ttA-1; Fri, 20 Mar 2026 16:14:16 -0400
X-MC-Unique: Z-dDGmGWMBidSg78sd6ttA-1
X-Mimecast-MFC-AGG-ID: Z-dDGmGWMBidSg78sd6ttA_1774037656
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-79a670a5fe9so49142037b3.1
        for <linux-kselftest@vger.kernel.org>; Fri, 20 Mar 2026 13:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774037656; x=1774642456; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JPuumjF1Q/CxeVJhcu6LhrvdlVq1DqJdhZ9BrK6DHGc=;
        b=H0tREukZAdHPYC+rdZQk6rJ9agWyIv6bnNUM1rEzxU6bZ7XbnNi7iq/CHdGFM4ndcQ
         /CzHqJNzIPpSgZ6GbrWMxh/RVPeTF+i4IfDh4q9+dtHCu37u9oV3weUltbRgj08x6umx
         zGTL/YOIGPP74fV0K0J7qubaqBPDwoX++73dd3R8YDIPHrpxkNaJ1h6g2KGOXhe/zJJs
         ZpjkazXomRhKuB2eMKR+p9V2OFFBTNlkSbC0r7jj2JwK7TYO4pN3mW467IRKQs+l5rAK
         m2JGDdJACWkqh2VA+FUweEn/lHSeQp3Fa6w/GRDvZNx9yLK7P4lUWUL1/1AhdbSyySsK
         Fkdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774037656; x=1774642456;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JPuumjF1Q/CxeVJhcu6LhrvdlVq1DqJdhZ9BrK6DHGc=;
        b=NpuKzRKrV3oxTr9Xa/myfXbGVYtSlTuTGzKJz6xzIXAB73aKlHmpN7rhNuz9tR30BG
         WqlK5i6iUG1bXjSlADoRefwIWyueUJLvJr13OSA6H3O2T/8bj70XMlFcyFsBzSV1IyTp
         bZ0wLz3Pga3Lmb9wHgEhBJdBivq7VSR42Pcl9G0bLXPPqWH7Gvy8cEF6pqGbCPDhCX5F
         Yfv1qzcS90uVDzvYyiTd3zvGCKgbghr0NMKrWUl3n6K6IEWwxOUiqix299zHT73CcPQ5
         xpfYaOi240/mPiQBR1JlVr39IEWLmhvODgEhG/bB5rrCZWdYLG8y1Xv5doNSaQUakB2a
         DP/g==
X-Forwarded-Encrypted: i=1; AJvYcCUOFwH0hqg92mH6610mCoC/b0AThucsDB1Cl0EgMDajYbOFoTjS1XY4M5lc75IdiSVdFOsnSIsyZBikUVBOaTM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6kgyi3igtAUWKuKHtWdaJjNJD0w4/DhnFklRthsTVRrV9IfpY
	S0/5/iogvipc5qrDp0wR2FL3kLPjegpJtJVfYwzR37GOoELzKXSdTZ9+flMcyps4bGf9ZzMFkbG
	XbCUh3VnOWcwVtguCWLsg8EklnQNB3UNPsJyZUtLcG55tAC+Su54R3rKB8ySVk5/D5aCbRg==
X-Gm-Gg: ATEYQzxZrvJO0ZMACFd0xRbesexwh/tDJoMDa6A0x7ES1owfPbZpklbViRo/9UU2mzK
	31GLf/ynsDQ5P0qti3v9+SsykWcV/CfwOyu8G6HYLKZIarhyiZjsuuZAeRGGoCsr3aQTuG23XRQ
	YEPUzS4VDcbd5yWElKCQbgQMrjVWdGC3SodqgFEhpBysanmw9j9y3R5InLMEXxfOFBDD98AM0nq
	TxkUXixCPAgWT9pKshpofK4TBadgHCWxJm9hKAUUKYucIYwN7lKv5HpdM8YneCSqOJTWdBVa600
	B3bzpHoz9mftGaUylyxuMLC+CEH1utUD54vEjhRz/EBTl3mUu2K9drlhKaIfIpoCMuFe9XOuvvQ
	jZSMsY2EEp1BOdQyj0szCnJYU1tSg
X-Received: by 2002:a05:690c:a04d:b0:79a:649e:265d with SMTP id 00721157ae682-79a90be905dmr33607867b3.49.1774037656087;
        Fri, 20 Mar 2026 13:14:16 -0700 (PDT)
X-Received: by 2002:a05:690c:a04d:b0:79a:649e:265d with SMTP id 00721157ae682-79a90be905dmr33607617b3.49.1774037655640;
        Fri, 20 Mar 2026 13:14:15 -0700 (PDT)
Received: from thiccpad.redhat.com ([179.99.166.70])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79a903f4190sm21415977b3.15.2026.03.20.13.14.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 13:14:15 -0700 (PDT)
From: Pablo Hugen <phugen@redhat.com>
To: live-patching@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: jpoimboe@kernel.org,
	jikos@kernel.org,
	mbenes@suse.cz,
	pmladek@suse.com,
	joe.lawrence@redhat.com,
	shuah@kernel.org,
	Pablo Alessandro Santos Hugen <phugen@redhat.com>
Subject: [PATCH] selftests/livepatch: add test for module function patching
Date: Fri, 20 Mar 2026 17:11:17 -0300
Message-ID: <20260320201135.1203992-1-phugen@redhat.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pablo Alessandro Santos Hugen <phugen@redhat.com>

Add a target module and livepatch pair that verify module function
patching via a proc entry. Two test cases cover both the
klp_enable_patch path (target loaded before livepatch) and the
klp_module_coming path (livepatch loaded before target).

Signed-off-by: Pablo Alessandro Santos Hugen <phugen@redhat.com>
---
 .../selftests/livepatch/test-livepatch.sh     | 100 ++++++++++++++++++
 .../selftests/livepatch/test_modules/Makefile |   2 +
 .../test_modules/test_klp_mod_patch.c         |  53 ++++++++++
 .../test_modules/test_klp_mod_target.c        |  39 +++++++
 4 files changed, 194 insertions(+)
 create mode 100644 tools/testing/selftests/livepatch/test_modules/test_klp_mod_patch.c
 create mode 100644 tools/testing/selftests/livepatch/test_modules/test_klp_mod_target.c

diff --git a/tools/testing/selftests/livepatch/test-livepatch.sh b/tools/testing/selftests/livepatch/test-livepatch.sh
index 6673023d2b66..c44c5341a2f1 100755
--- a/tools/testing/selftests/livepatch/test-livepatch.sh
+++ b/tools/testing/selftests/livepatch/test-livepatch.sh
@@ -8,6 +8,8 @@ MOD_LIVEPATCH1=test_klp_livepatch
 MOD_LIVEPATCH2=test_klp_syscall
 MOD_LIVEPATCH3=test_klp_callbacks_demo
 MOD_REPLACE=test_klp_atomic_replace
+MOD_TARGET=test_klp_mod_target
+MOD_TARGET_PATCH=test_klp_mod_patch
 
 setup_config
 
@@ -196,4 +198,102 @@ livepatch: '$MOD_REPLACE': unpatching complete
 % rmmod $MOD_REPLACE"
 
 
+# - load a target module that provides /proc/test_klp_mod_target with
+#   original output
+# - load a livepatch that patches the target module's show function
+# - verify the proc entry returns livepatched output
+# - disable and unload the livepatch
+# - verify the proc entry returns original output again
+# - unload the target module
+
+start_test "module function patching"
+
+load_mod $MOD_TARGET
+
+if [[ "$(cat /proc/$MOD_TARGET)" != "$MOD_TARGET: original output" ]] ; then
+	echo -e "FAIL\n\n"
+	die "livepatch kselftest(s) failed"
+fi
+
+load_lp $MOD_TARGET_PATCH
+
+if [[ "$(cat /proc/$MOD_TARGET)" != "$MOD_TARGET_PATCH: this has been live patched" ]] ; then
+	echo -e "FAIL\n\n"
+	die "livepatch kselftest(s) failed"
+fi
+
+disable_lp $MOD_TARGET_PATCH
+unload_lp $MOD_TARGET_PATCH
+
+if [[ "$(cat /proc/$MOD_TARGET)" != "$MOD_TARGET: original output" ]] ; then
+	echo -e "FAIL\n\n"
+	die "livepatch kselftest(s) failed"
+fi
+
+unload_mod $MOD_TARGET
+
+check_result "% insmod test_modules/$MOD_TARGET.ko
+$MOD_TARGET: test_klp_mod_target_init
+% insmod test_modules/$MOD_TARGET_PATCH.ko
+livepatch: enabling patch '$MOD_TARGET_PATCH'
+livepatch: '$MOD_TARGET_PATCH': initializing patching transition
+livepatch: '$MOD_TARGET_PATCH': starting patching transition
+livepatch: '$MOD_TARGET_PATCH': completing patching transition
+livepatch: '$MOD_TARGET_PATCH': patching complete
+% echo 0 > $SYSFS_KLP_DIR/$MOD_TARGET_PATCH/enabled
+livepatch: '$MOD_TARGET_PATCH': initializing unpatching transition
+livepatch: '$MOD_TARGET_PATCH': starting unpatching transition
+livepatch: '$MOD_TARGET_PATCH': completing unpatching transition
+livepatch: '$MOD_TARGET_PATCH': unpatching complete
+% rmmod $MOD_TARGET_PATCH
+% rmmod $MOD_TARGET
+$MOD_TARGET: test_klp_mod_target_exit"
+
+
+# - load a livepatch that targets a not-yet-loaded module
+# - load the target module: klp_module_coming patches it immediately
+# - verify the proc entry returns livepatched output
+# - disable and unload the livepatch
+# - verify the proc entry returns original output again
+# - unload the target module
+
+start_test "module function patching (livepatch first)"
+
+load_lp $MOD_TARGET_PATCH
+load_mod $MOD_TARGET
+
+if [[ "$(cat /proc/$MOD_TARGET)" != "$MOD_TARGET_PATCH: this has been live patched" ]] ; then
+	echo -e "FAIL\n\n"
+	die "livepatch kselftest(s) failed"
+fi
+
+disable_lp $MOD_TARGET_PATCH
+unload_lp $MOD_TARGET_PATCH
+
+if [[ "$(cat /proc/$MOD_TARGET)" != "$MOD_TARGET: original output" ]] ; then
+	echo -e "FAIL\n\n"
+	die "livepatch kselftest(s) failed"
+fi
+
+unload_mod $MOD_TARGET
+
+check_result "% insmod test_modules/$MOD_TARGET_PATCH.ko
+livepatch: enabling patch '$MOD_TARGET_PATCH'
+livepatch: '$MOD_TARGET_PATCH': initializing patching transition
+livepatch: '$MOD_TARGET_PATCH': starting patching transition
+livepatch: '$MOD_TARGET_PATCH': completing patching transition
+livepatch: '$MOD_TARGET_PATCH': patching complete
+% insmod test_modules/$MOD_TARGET.ko
+livepatch: applying patch '$MOD_TARGET_PATCH' to loading module '$MOD_TARGET'
+$MOD_TARGET: test_klp_mod_target_init
+% echo 0 > $SYSFS_KLP_DIR/$MOD_TARGET_PATCH/enabled
+livepatch: '$MOD_TARGET_PATCH': initializing unpatching transition
+livepatch: '$MOD_TARGET_PATCH': starting unpatching transition
+livepatch: '$MOD_TARGET_PATCH': completing unpatching transition
+livepatch: '$MOD_TARGET_PATCH': unpatching complete
+% rmmod $MOD_TARGET_PATCH
+% rmmod $MOD_TARGET
+$MOD_TARGET: test_klp_mod_target_exit"
+
+
 exit 0
diff --git a/tools/testing/selftests/livepatch/test_modules/Makefile b/tools/testing/selftests/livepatch/test_modules/Makefile
index 939230e571f5..a13d398585dc 100644
--- a/tools/testing/selftests/livepatch/test_modules/Makefile
+++ b/tools/testing/selftests/livepatch/test_modules/Makefile
@@ -8,6 +8,8 @@ obj-m += test_klp_atomic_replace.o \
 	test_klp_callbacks_mod.o \
 	test_klp_kprobe.o \
 	test_klp_livepatch.o \
+	test_klp_mod_patch.o \
+	test_klp_mod_target.o \
 	test_klp_shadow_vars.o \
 	test_klp_state.o \
 	test_klp_state2.o \
diff --git a/tools/testing/selftests/livepatch/test_modules/test_klp_mod_patch.c b/tools/testing/selftests/livepatch/test_modules/test_klp_mod_patch.c
new file mode 100644
index 000000000000..6725b4720365
--- /dev/null
+++ b/tools/testing/selftests/livepatch/test_modules/test_klp_mod_patch.c
@@ -0,0 +1,53 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (C) 2026 Pablo Hugen <phugen@redhat.com>
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/livepatch.h>
+#include <linux/seq_file.h>
+
+static int livepatch_mod_target_show(struct seq_file *m, void *v)
+{
+	seq_printf(m, "%s: %s\n", THIS_MODULE->name,
+		   "this has been live patched");
+	return 0;
+}
+
+static struct klp_func funcs[] = {
+	{
+		.old_name = "test_klp_mod_target_show",
+		.new_func = livepatch_mod_target_show,
+	},
+	{},
+};
+
+static struct klp_object objs[] = {
+	{
+		.name = "test_klp_mod_target",
+		.funcs = funcs,
+	},
+	{},
+};
+
+static struct klp_patch patch = {
+	.mod = THIS_MODULE,
+	.objs = objs,
+};
+
+static int test_klp_mod_patch_init(void)
+{
+	return klp_enable_patch(&patch);
+}
+
+static void test_klp_mod_patch_exit(void)
+{
+}
+
+module_init(test_klp_mod_patch_init);
+module_exit(test_klp_mod_patch_exit);
+MODULE_LICENSE("GPL");
+MODULE_INFO(livepatch, "Y");
+MODULE_AUTHOR("Pablo Hugen <phugen@redhat.com>");
+MODULE_DESCRIPTION("Livepatch test: patch for module-provided function");
diff --git a/tools/testing/selftests/livepatch/test_modules/test_klp_mod_target.c b/tools/testing/selftests/livepatch/test_modules/test_klp_mod_target.c
new file mode 100644
index 000000000000..9643984d2402
--- /dev/null
+++ b/tools/testing/selftests/livepatch/test_modules/test_klp_mod_target.c
@@ -0,0 +1,39 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (C) 2026 Pablo Hugen <phugen@redhat.com>
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/proc_fs.h>
+#include <linux/seq_file.h>
+
+static struct proc_dir_entry *pde;
+
+static noinline int test_klp_mod_target_show(struct seq_file *m, void *v)
+{
+	seq_printf(m, "%s: %s\n", THIS_MODULE->name, "original output");
+	return 0;
+}
+
+static int test_klp_mod_target_init(void)
+{
+	pr_info("%s\n", __func__);
+	pde = proc_create_single("test_klp_mod_target", 0, NULL,
+				 test_klp_mod_target_show);
+	if (!pde)
+		return -ENOMEM;
+	return 0;
+}
+
+static void test_klp_mod_target_exit(void)
+{
+	pr_info("%s\n", __func__);
+	proc_remove(pde);
+}
+
+module_init(test_klp_mod_target_init);
+module_exit(test_klp_mod_target_exit);
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Pablo Hugen <phugen@redhat.com>");
+MODULE_DESCRIPTION("Livepatch test: target module with proc entry");
-- 
2.53.0

