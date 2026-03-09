Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 502FC392C40
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Mar 2026 10:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773053105; cv=none; b=ecMtBQ7nHFELYcrQUGX3FJGHCKMxRg1Mq/GCkpsQ6yhPh/Y4YZpz97iD/PqfH2CunoM8naLIgPlFUIjurxJAlKK9IAYGPwwD2XmOP7uY71YvfesbzutN/gQiOeGxNaK3wLBV7uLNR4563Lv+gU0qwlsV8wtC5w2QBSbGfXjZXQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773053105; c=relaxed/simple;
	bh=jYs0pJTHjkLdfsfBnMIrJb5n7ksT9fbzlweEBr7D4fU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iDHOXUiQcpFd0DnubahxuG4QPACEg0t812utJyhLNoAr2eCUCaGeY6xI9pBLWFrA4GLIh8VIY/qvm8BZNhU6tykICrIvSdKMAal0BqSS9nP2gmhky+vBg+VUUZFIEBGWMH6CIEUSOggD4dxcUylAc2bRPXIioO/CjRLlyWr29ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CaUIfx/3; arc=none smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CaUIfx/3"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-64ae222d978so11025995d50.1
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Mar 2026 03:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773053103; x=1773657903; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cDtJtjT4fzine+ZeyXNiHwdW8ww64N9rv71BsVnohzU=;
        b=CaUIfx/3Ha9HcYg2MAi8z9nMsKYJ2BID/wmR+SpQtnO+PJvJfEvafH+VFGSf+Qzbgv
         pND/yqLXAyK3QY9doXt2C8DoC3bQZENqLoKgETD07+NtD3+o0UWivHO5D+wQLvzOMG9k
         2J16bbwS9MoeH3pcFe+rebZKD8/iPayG+c/E2DU1Oz6Ek0ScIgGI4zLXg/kCR1ly6KIc
         KLd4Xb4ZT73b4wAvz9penUjN+WpP1cyodauRVNP7qNNKdKl60ghdFanB5A8VHqMS81ri
         JKWbzrtXB6w2RgDZ8/Gf4LiNP78o22bF2g8HUaCN0OlPsGLxmuUQkvrTC0CHAFJbrYJ0
         4aGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773053103; x=1773657903;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cDtJtjT4fzine+ZeyXNiHwdW8ww64N9rv71BsVnohzU=;
        b=RG83tA1ZrY3GuIhfu0wyHPJDApzzL6hTMP43o4XwpyLOy3Zw3EcmKzoRqRj5OlvvZK
         KwQCovPXM/7VtTmgOybqBxA19G3/islkHqDM0rl7/QN8opzWtsSRzZ+jVBLSBkFaCvjm
         v8oJQUsbXYXkjrR02EJNMCyDMLcDf1TzJ1LFe8jHEoLOJ1TMqLDarss+EX4JFBw6CiUf
         U2AF7JI1AgLmRVFs8dDaje5s9kuR4Ok9lnNKNejnN2GquW1iy94o3u406mPoiXfGhuT6
         E/RMpYgncpnZKal0UWqQulM97Cvb++FMMsz7dF7Nd2Tuq1GHgvW5nFvQRwBcm1qf5bxz
         Gciw==
X-Forwarded-Encrypted: i=1; AJvYcCUOxo2twYmBIfhhs2ZT1ydCKBTdVYI3R1iSCW223Rt3Oq5W6fQBNSO1av4sqn1JXh7FfWwLJ11+RBnKLjRZCik=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzhvp1B2+eY3NpIQjpORjFkVVv/4pE/aTGartYQyNAqq83kUXLz
	5n45dPbkuvs1/xEK+EirdrdtFEQAVHhyGu7VyHqZkKwWdSIq9yRsybba
X-Gm-Gg: ATEYQzzcUEAdjcfWa49tD3KGAR+PvrxVEEC4GWpCNnUYagDaQtE99cB4gseQunlPtAf
	DNVaWxae5f0VdPqCDosjpHsXOUd7PpDtu1KnrodtyfZJpYTOJk1t7aWOwIXLlMfY7v0EHMIx7Na
	/fvnLRQ0QgZh5vxgg2VsHoaF+K2LoZP52/RNUUkzVxpkivzv+6BkUpfYafEBAOvLec9iTH81ATy
	jQRutJ/7rdnmeFmQ/9/lzOkdG6YXP6omyCwFLK+yEuF0aKexI/zUEVL4MHK78a9R2TVBhwxqblY
	j7lk3ax5XBiieiQygbrlw3Vnow/2fzqxNyqZNKuObWPy02m8I4Hvie8QeygR0myH9alwDvlSBIe
	IKiOvgJlQUulCgIpmsU0aLSNENDYwPIT05jY1vAcDqWjd+hYRTVfdpEgJWotNZHkse3IxlWEJkg
	Out2THq0jOzNRmb+7JSXamWucZpi8vRafpUp0p67z7WKdrjM9VrcE927khZWQBtRhRFLBhJm7fk
	BZeBm8brsydGINXAGJ7DM4GkXg=
X-Received: by 2002:a05:690e:16d5:b0:64c:c0d0:9088 with SMTP id 956f58d0204a3-64d14350c51mr6706591d50.69.1773053103222;
        Mon, 09 Mar 2026 03:45:03 -0700 (PDT)
Received: from localhost.localdomain (108-214-96-168.lightspeed.sntcca.sbcglobal.net. [108.214.96.168])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64d176d9574sm4466857d50.18.2026.03.09.03.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 03:45:02 -0700 (PDT)
From: Sun Jian <sun.jian.kdev@gmail.com>
To: bpf@vger.kernel.org
Cc: Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Jiayuan Chen <jiayuan.chen@linux.dev>,
	linux-kselftest@vger.kernel.org,
	Sun Jian <sun.jian.kdev@gmail.com>
Subject: [PATCH v4 bpf-next] selftests/bpf: livepatch_trampoline: skip when prerequisites are missing
Date: Mon,  9 Mar 2026 18:44:48 +0800
Message-ID: <20260309104448.817401-1-sun.jian.kdev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

livepatch_trampoline relies on livepatch sysfs and livepatch-sample.ko.
When CONFIG_LIVEPATCH is disabled or the samples module isn't built, the
test fails with ENOENT and causes false failures in minimal CI configs.

Skip the test when livepatch sysfs or the sample module is unavailable.
Also avoid writing to livepatch sysfs when it's not present.

Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
---
v4:
  - Drop redundant <errno.h> and <unistd.h> includes; both are already included by test_progs.h (per Jiayuan Chen)
  - Tested: ./test_progs -t livepatch_trampoline -vv (SKIP when livepatch-sample.ko missing)

v3:
  - Skip on -ENOENT from load_livepatch() instead of duplicating module path logic (suggested by Jiri Olsa)
  - Tested: ./test_progs -t livepatch_trampoline (SKIP when livepatch-sample.ko missing)

v2:
  - Skip when /sys/kernel/livepatch is missing
  - Guard sysfs write in unload_livepatch() when enabled knob is absent

v3: https://lore.kernel.org/bpf/20260309033712.728133-1-sun.jian.kdev@gmail.com/
v2: https://patchwork.kernel.org/project/netdevbpf/patch/20260305030258.5273-1-sun.jian.kdev@gmail.com/
v1: https://patchew.org/linux/20260227042354.20926-1-sun.jian.kdev@gmail.com/

 .../bpf/prog_tests/livepatch_trampoline.c     | 20 +++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/livepatch_trampoline.c b/tools/testing/selftests/bpf/prog_tests/livepatch_trampoline.c
index 72aa5376c30e..0a12af924a99 100644
--- a/tools/testing/selftests/bpf/prog_tests/livepatch_trampoline.c
+++ b/tools/testing/selftests/bpf/prog_tests/livepatch_trampoline.c
@@ -5,6 +5,8 @@
 #include "testing_helpers.h"
 #include "livepatch_trampoline.skel.h"
 
+#define LIVEPATCH_ENABLED_PATH "/sys/kernel/livepatch/livepatch_sample/enabled"
+
 static int load_livepatch(void)
 {
 	char path[4096];
@@ -19,7 +21,8 @@ static int load_livepatch(void)
 static void unload_livepatch(void)
 {
 	/* Disable the livepatch before unloading the module */
-	system("echo 0 > /sys/kernel/livepatch/livepatch_sample/enabled");
+	if (!access(LIVEPATCH_ENABLED_PATH, F_OK))
+		system("echo 0 > " LIVEPATCH_ENABLED_PATH);
 
 	unload_module("livepatch_sample", env_verbosity > VERBOSE_NONE);
 }
@@ -81,9 +84,22 @@ static void __test_livepatch_trampoline(bool fexit_first)
 void test_livepatch_trampoline(void)
 {
 	int retry_cnt = 0;
+	int err;
+
+	/* Skip if kernel was built without CONFIG_LIVEPATCH */
+	if (access("/sys/kernel/livepatch", F_OK)) {
+		test__skip();
+		return;
+	}
 
 retry:
-	if (load_livepatch()) {
+	err = load_livepatch();
+	if (err) {
+		if (err == -ENOENT) {
+			test__skip();
+			return;
+		}
+
 		if (retry_cnt) {
 			ASSERT_OK(1, "load_livepatch");
 			goto out;

base-commit: 1f318b96cc84d7c2ab792fcc0bfd42a7ca890681
-- 
2.43.0

