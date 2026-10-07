Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1EA140B11F
	for <linux-kselftest@vger.kernel.org>; Wed,  7 Oct 2026 06:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791356102; cv=none; b=g+VLWeMKQMMS1WlQ0IxANZ+PhCgYmgIhm6t5aMT6ueGZUsYOY+xJ2cMSKg6vtMlL5SjVpCgpMebeRyb05SBm1gqsb9B2i9g/3iqXUKFUah6s/H4dIydbBdv7jipDMBRWtmJbtaNh9vGCGcBDXIfxwRcVsMBcDTWVGSXUU6NXc10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791356102; c=relaxed/simple;
	bh=mnDl2TmTR5r6RvnBg2xMLRQMj1KsNWT377F6HtXgKSw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Yuea5pb8cJsm3Gd1sPyPROQFq1o5crCgV1MzkoNSV104YSxY4YwKdjz481AcK/nmC7X4OmnYiR2nUnWt9W/cTfXhmyw7hq+rYt8Xv1X3cbB90cenRCPNKLsqeQf1Z14Tny6rL7f/6IwneXEs4Kkt7bjKg6tFgrPu+wRExNDt844=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BbDpuyhR; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BbDpuyhR"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-88aea027391so1883106b3a.0
        for <linux-kselftest@vger.kernel.org>; Tue, 06 Oct 2026 23:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791356100; x=1791960900; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dFwfJXMVMMQ8FETY40B7Zp7w/Z3aCe6CKuTJ3GUd91c=;
        b=BbDpuyhRAj0dnJQapvZL5rmTjMmKU+u2BORSovKtdGQKB4yxLeZdMV5Qul9VIRgtJ0
         MHiyFf5WBckk1T5rXiTm+wtGGvzSaMVqe4qXyWjmvXUEcJl4jNuLHGu9Oo0LtG/dU6p6
         mWA/loIEMiZDPEboDXrhYPC7X91FFVFn8wjSBWw8e27cEVf13yruzfsMnwN8NC/Mv5Iq
         vibNos/KU2EH8AbaaXaXo9U7EyKeke+4W+w99ZoBg3SDJ2VgmznoE0nf3tDUcmcXY0m3
         8P5bCNGgSJgp73jZzMVzOHEN8IT+x5RKYOU3Qv8VDJNk48h1q+wjJcnxITvkD0X2VzDs
         OXUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791356100; x=1791960900;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dFwfJXMVMMQ8FETY40B7Zp7w/Z3aCe6CKuTJ3GUd91c=;
        b=H//Z6Oz/gmhFNwdfXqOCt2jlaTHecPlv1xP/DmrhTUHO11RGAE2ZaxYT1rb5UAoFBP
         AyEunp5fqct2giIgVniJJW3eaYPCWgdlxOLYrui4SsXeUZMkKrj78YNB+cnwYANhwchf
         BZjwaN524Mqt/yhPBmlh69/n2arL/2C8zaeH6TdTxbAktrtPWZsNhGYTEmjrwMKw/5PO
         f8HHl2F8HfmWymloit7KW7JK18c556oRMokRsnpwiorDc2FK6E1zmB5Vv3JW68ktZDqB
         OgiE6GeCCdGQG4HVI/z8ExSlBkRzLKpXyAjDo/jpuXHxhXYv0f3gMz878jQIfWX6aASm
         Ca/A==
X-Gm-Message-State: AFuF++mJcqVkuW0YEo6P74cM5bO3WGmc9AWOZcChDhosIerii7DIDfnZ
	ved21s5ExbH1MEAoAymoKC+vOLvctTKnUjnQ0zGsOvRWHyCbC/ClGfnUu2PaTGWm
X-Gm-Gg: AYBFou3OAdLs6XVBaFJ8f3vpUZ885DUWWt1BFL+3FX87y7sAf4+xCl/a2/WEUo9uIw+
	n9jPS3y6R2HmNsliAd9Y+JMCgJUQtFwz2Djp0RubW6SCyS8K2Biy6+nyJHU86skV1EGv2ckeKUF
	iYGLgkSyMUdeiz4ERDlVQUijI5oQlx7pSJBiJgreJdvtFms6gWBIkNtqtu/ISYENqWJdO0brdlg
	0U3xszpCKcuUVXd0ULcdMmRkyECHZnzyI9Yd9hR5O2tccZDnqK6TA1OYnSOkjzabreMlnjQ7j+J
	B54mD3BkxI9HsJzXP2+wOVliTt/eq+QpR8Qx4cdsbl7C/YYICOMgTC2ovXHlFXEEkA3JQy4Husm
	9zEgv5KCUdtqxapYHWkKzz00alokulBz0tn9vjeJ75S2vzsqof/zNkyIBZPeWEuWR4oNCr81gYa
	JaismI1aW8jwHNaV2XanU3WEn/s0FhNizUf2hs4rHH8A06lP7Rwn3CWTztbTe2CphJ5jXRfEEjX
	mGvjInm7ipVpbkFQdsNX7TpPDGGpWtL
X-Received: by 2002:a05:6a00:27a7:b0:882:bbf4:7dc1 with SMTP id d2e1a72fcca58-891b4aeee03mr1065505b3a.42.1791356099539;
        Tue, 06 Oct 2026 23:54:59 -0700 (PDT)
Received: from obadmin-Precision-3680.atlascopco.group ([136.226.232.164])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89188ff26f8sm874001b3a.26.2026.10.06.23.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 23:54:59 -0700 (PDT)
From: Sahaj Chaudhari <sahaj123.sc@gmail.com>
To: shuah@kernel.org
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] selftests/perf_events: test text_poke permissions
Date: Wed,  7 Oct 2026 12:25:37 +0530
Message-ID: <20261007065537.1227045-1-sahaj123.sc@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Verify that a privileged task can open a text-poke perf event while an
unprivileged task is denied.

Skip if text-poke is unsupported or perf settings prevent the check.

Signed-off-by: Sahaj Chaudhari <sahaj123.sc@gmail.com>
---
 .../testing/selftests/perf_events/.gitignore  |  1 +
 tools/testing/selftests/perf_events/Makefile  |  2 +-
 .../perf_events/text_poke_permissions.c       | 99 +++++++++++++++++++
 3 files changed, 101 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/perf_events/text_poke_permissions.c

diff --git a/tools/testing/selftests/perf_events/.gitignore b/tools/testing/selftests/perf_events/.gitignore
index 4931b3b6bbd39..2a475f176feed 100644
--- a/tools/testing/selftests/perf_events/.gitignore
+++ b/tools/testing/selftests/perf_events/.gitignore
@@ -3,3 +3,4 @@ sigtrap_threads
 remove_on_exec
 watermark_signal
 mmap
+text_poke_permissions
diff --git a/tools/testing/selftests/perf_events/Makefile b/tools/testing/selftests/perf_events/Makefile
index 2e5d85770dfea..02aa6e7c6e9a2 100644
--- a/tools/testing/selftests/perf_events/Makefile
+++ b/tools/testing/selftests/perf_events/Makefile
@@ -2,5 +2,5 @@
 CFLAGS += -Wl,-no-as-needed -Wall $(KHDR_INCLUDES)
 LDFLAGS += -lpthread
 
-TEST_GEN_PROGS := sigtrap_threads remove_on_exec watermark_signal mmap
+TEST_GEN_PROGS := sigtrap_threads remove_on_exec watermark_signal mmap text_poke_permissions
 include ../lib.mk
diff --git a/tools/testing/selftests/perf_events/text_poke_permissions.c b/tools/testing/selftests/perf_events/text_poke_permissions.c
new file mode 100644
index 0000000000000..c42af32c32c4d
--- /dev/null
+++ b/tools/testing/selftests/perf_events/text_poke_permissions.c
@@ -0,0 +1,99 @@
+// SPDX-License-Identifier: GPL-2.0
+#define _GNU_SOURCE
+
+#include <errno.h>
+#include <fcntl.h>
+#include <linux/perf_event.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <sys/syscall.h>
+#include <sys/types.h>
+#include <sys/wait.h>
+#include <unistd.h>
+
+#include "kselftest.h"
+
+static int perf_event_open_text_poke(void)
+{
+	struct perf_event_attr attr = {
+		.type = PERF_TYPE_SOFTWARE,
+		.size = sizeof(attr),
+		.config = PERF_COUNT_SW_CPU_CLOCK,
+		.disabled = 1,
+		.exclude_kernel = 1,
+		.text_poke = 1,
+	};
+
+	return syscall(__NR_perf_event_open, &attr, 0, -1, -1, 0);
+}
+
+static int read_perf_paranoid(int *value)
+{
+	FILE *file;
+
+	file = fopen("/proc/sys/kernel/perf_event_paranoid", "r");
+	if (!file)
+		return -1;
+
+	if (fscanf(file, "%d", value) != 1) {
+		fclose(file);
+		return -1;
+	}
+	fclose(file);
+	return 0;
+}
+
+int main(void)
+{
+	pid_t child;
+	int fd, status, paranoid;
+
+	ksft_print_header();
+	if (geteuid() != 0)
+		ksft_exit_skip("run as root to verify the unprivileged permission check\n");
+
+	if (read_perf_paranoid(&paranoid))
+		ksft_exit_skip("cannot read perf_event_paranoid\n");
+	if (paranoid <= 1)
+		ksft_exit_skip("perf_event_paranoid must be greater than 1\n");
+
+	fd = perf_event_open_text_poke();
+	if (fd < 0) {
+		if (errno == EINVAL || errno == E2BIG)
+			ksft_exit_skip("kernel does not support perf text-poke events\n");
+		if (errno == EACCES || errno == EPERM)
+			ksft_exit_skip("root cannot open the probe perf event\n");
+		ksft_exit_fail_perror("perf_event_open probe");
+	}
+	close(fd);
+
+	ksft_set_plan(1);
+	child = fork();
+	if (child < 0)
+		ksft_exit_fail_perror("fork");
+	if (child == 0) {
+		if (setgid(65534) || setuid(65534))
+			_exit(2);
+		fd = perf_event_open_text_poke();
+		if (fd >= 0) {
+			close(fd);
+			_exit(0);
+		}
+		if (errno == EACCES || errno == EPERM)
+			_exit(1);
+		_exit(2);
+	}
+
+	if (waitpid(child, &status, 0) != child)
+		ksft_exit_fail_perror("waitpid");
+	if (!WIFEXITED(status))
+		ksft_test_result_fail("permission-check child did not exit normally\n");
+	else if (WEXITSTATUS(status) == 1)
+		ksft_test_result_pass("unprivileged text-poke perf event is denied\n");
+	else if (WEXITSTATUS(status) == 0)
+		ksft_test_result_fail("unprivileged task opened a text-poke perf event\n");
+	else
+		ksft_test_result_fail("child failed to test text-poke permissions\n");
+
+	ksft_finished();
+}
-- 
2.43.0

