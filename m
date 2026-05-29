Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C598A37104F
	for <linux-kselftest@vger.kernel.org>; Fri, 29 May 2026 03:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780024886; cv=none; b=d2hvZ9oL5EsWMEcM2Q1b89E37Yshxvsew/8Vaomn6QLlGOLeGe5tWXJx+d5mjorDnF3IYKDb5VxFRCqDq2L2HtJWBTm54l5kP57PH8djKPK2nRteugM4rH5xKfWU5fpiNoXPwim2cBOaPl1vNknnX2E4oEJcKjv3yaLXm83nyvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780024886; c=relaxed/simple;
	bh=5h2GF0XbFDjqAMNI62aGoAqPGag11ae9hGWbCLa3/ew=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MUDDqi0CD4y+RRJqkpXjrQBIaUNK4GL60hjMwpX6YZjmT0yeUKBVUHRFkdMK5U/THNcTAS+wkVSF10rGYV3qz6MFOLJsjXN3t4XJSxuh+dD7J23kpaNhajMMAURnuRu6nT2WmiEO5kyf9+MscPrt47AXQ+P6/GbxvCTdJdXxLCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=YCqbSG4c; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="YCqbSG4c"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-90fbf21d9d3so1996534285a.1
        for <linux-kselftest@vger.kernel.org>; Thu, 28 May 2026 20:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780024884; x=1780629684; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DD7mpkHwGkKw+XnhrMPNwFwDdntpab6EeONlinrdH5M=;
        b=YCqbSG4cVmUbbUcN7NfC6z+TlNTNEo1/SoiG5DVgJgJgo3ycs0JYd/9P6j1TOmosfY
         xdzoJ6G7YUp5aL9uZLWRDpSFhNxvdiU0sVDqspADONwWkvLbBSs8GBsbnQER4ZCH000m
         tylGDIikhAy0gNVFewNG/VastMPk4/TJUsRW98fhSoBQwNgjOuR3guMSAYOq4MV4PkvY
         97+De62PaaSn2xluaz6DWQO0NXAr6B/7XDLCGqS/cajTwGXOws9wN//8NGPpvwcyR53P
         Nxa4ldcwP/BkypI07ldV79dOUfJ/tagKXdg0xlSnLHPeY4ymugSSVPR0Ria+2Cg11E4O
         5M4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780024884; x=1780629684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DD7mpkHwGkKw+XnhrMPNwFwDdntpab6EeONlinrdH5M=;
        b=UnC/ceJyIlGwX+6FCljlkSCoX0KcQkpNGQcQIKGKz+L3RYt3FYrE1Z4b4XnCu0MIY1
         +Oosgeu0RJI1XuSGDPzUJLVkxxg3daqzzVPr+3NfRfMlRXi49AJVX2jfsOsSxNXCJ5bd
         u7KUkLqSSiFa1ajVz5jp/0MYRSTfql80AwMM5dqROnteM348jrOCHJOekcpyvZqoo/9G
         YDXQciiO9gKjsMUtiKxY4BksrDvitYcndZCwxDsnwQ4iKyQaQPr61+I6DlC90uNlv6iE
         kZAOd2Koun4KHTknwdJSBmBitUUw49ZzkVneiwhhXdGgGaiJfJPqMS9X6yhjR76PpWCp
         EpJw==
X-Gm-Message-State: AOJu0YytadeRanyWY5RUAniEG77kS57vFO48cqrCxVVDQ088B7Zgdmp3
	DVaF4UOojSqtlkoKTzNH52ZB89326XCcWssR2CL0qRyAAFN1ZWsOm7YgiTBtVSurVsDVnf6PrDM
	qkc44
X-Gm-Gg: Acq92OGRzYySRDkiCprXh9VGjpRkmzP7IDAM1rP11RazrpVfcGX6EzV/Y4OY1R3M2Ae
	EDV+ulpA5YyR+YN2Ukj3nrL0D/keheK4unar/bJ5zSl8RxTAEnkkjuyUVJk/6xbn4z8fVIJmp/u
	SKplLOKzqLs2OgqH36stRNDel8isnrlDLAiiTtTmQbDXlm04ygqYnz8FsulPMEFV+jeFp8BYc38
	BbW0QsIP+ycJpvcwM+hv2YydKhQaQftj+XT7deZJhl2tUS5S32r939jLZ5QfGgYADqyGP0h2cnU
	FFqnMlITfwD1LBcBIOeSomEtx0HmEEyWgm1fbgB7HKgmUZLQAKOJhrPbLj2c0fMHYca5gPLIcUL
	DayqF9oPUkiTzD1gVouk85VrnU21axTLbqb5QNXvNxSGz2+PX1Rnv/R/AOR735you5CYpkzxBr7
	Za/sEGono1y4hJXnCZK/5AP5Hj8y4HpygZgtQo4TwxUDz29TfccowdjyFjOpRNtA==
X-Received: by 2002:a05:620a:4709:b0:914:bb8e:915b with SMTP id af79cd13be357-9152fd2fc49mr147943985a.21.1780024883867;
        Thu, 28 May 2026 20:21:23 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ccea26d286sm1179476d6.48.2026.05.28.20.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 20:21:22 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	rppt@kernel.org,
	shuah@kernel.org,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	pasha.tatashin@soleen.com,
	dmatlack@google.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	skhawaja@google.com,
	graf@amazon.com
Subject: [PATCH v3 11/11] selftests/liveupdate: Add stress-files kexec test
Date: Fri, 29 May 2026 03:21:06 +0000
Message-ID: <20260529032106.1505796-12-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260529032106.1505796-1-pasha.tatashin@soleen.com>
References: <20260529032106.1505796-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new luo_stress_files kexec test that verifies preserving and
retrieving 500 files across a kexec reboot.

Reviewed-by: Pratyush Yadav (Google) <pratyush@kernel.org>
Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 tools/testing/selftests/liveupdate/Makefile   |   1 +
 .../selftests/liveupdate/luo_stress_files.c   | 101 ++++++++++++++++++
 2 files changed, 102 insertions(+)
 create mode 100644 tools/testing/selftests/liveupdate/luo_stress_files.c

diff --git a/tools/testing/selftests/liveupdate/Makefile b/tools/testing/selftests/liveupdate/Makefile
index ed7534468386..30689d22cb02 100644
--- a/tools/testing/selftests/liveupdate/Makefile
+++ b/tools/testing/selftests/liveupdate/Makefile
@@ -7,6 +7,7 @@ TEST_GEN_PROGS += liveupdate
 TEST_GEN_PROGS_EXTENDED += luo_kexec_simple
 TEST_GEN_PROGS_EXTENDED += luo_multi_session
 TEST_GEN_PROGS_EXTENDED += luo_stress_sessions
+TEST_GEN_PROGS_EXTENDED += luo_stress_files
 
 TEST_FILES += do_kexec.sh
 
diff --git a/tools/testing/selftests/liveupdate/luo_stress_files.c b/tools/testing/selftests/liveupdate/luo_stress_files.c
new file mode 100644
index 000000000000..b6a0c3899890
--- /dev/null
+++ b/tools/testing/selftests/liveupdate/luo_stress_files.c
@@ -0,0 +1,101 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/*
+ * Copyright (c) 2026, Google LLC.
+ * Pasha Tatashin <pasha.tatashin@soleen.com>
+ *
+ * Validate that LUO can handle a large number of files per session across
+ * a kexec reboot.
+ */
+
+#include <stdio.h>
+#include <unistd.h>
+#include "luo_test_utils.h"
+
+#define NUM_FILES 500
+#define STATE_SESSION_NAME "kexec_many_files_state"
+#define STATE_MEMFD_TOKEN 9999
+#define TEST_SESSION_NAME "many_files_session"
+
+/* Stage 1: Executed before the kexec reboot. */
+static void run_stage_1(int luo_fd)
+{
+	int session_fd, ret, i;
+
+	ksft_print_msg("[STAGE 1] Increasing ulimit for open files...\n");
+	ret = luo_ensure_nofile_limit(NUM_FILES);
+	if (ret == -EPERM)
+		ksft_exit_skip("Insufficient privileges to set RLIMIT_NOFILE\n");
+	if (ret < 0)
+		ksft_exit_fail_msg("luo_ensure_nofile_limit failed: %s\n", strerror(-ret));
+
+	ksft_print_msg("[STAGE 1] Creating state file for next stage (2)...\n");
+	create_state_file(luo_fd, STATE_SESSION_NAME, STATE_MEMFD_TOKEN, 2);
+
+	ksft_print_msg("[STAGE 1] Creating test session '%s'...\n", TEST_SESSION_NAME);
+	session_fd = luo_create_session(luo_fd, TEST_SESSION_NAME);
+	if (session_fd < 0)
+		fail_exit("luo_create_session");
+
+	ksft_print_msg("[STAGE 1] Preserving %d files...\n", NUM_FILES);
+	for (i = 0; i < NUM_FILES; i++) {
+		char data[64];
+
+		snprintf(data, sizeof(data), "file-data-%d", i);
+		if (create_and_preserve_memfd(session_fd, i, data) < 0)
+			fail_exit("create_and_preserve_memfd for index %d", i);
+	}
+
+	ksft_print_msg("[STAGE 1] Successfully preserved %d files.\n", NUM_FILES);
+
+	close(luo_fd);
+	daemonize_and_wait();
+}
+
+/* Stage 2: Executed after the kexec reboot. */
+static void run_stage_2(int luo_fd, int state_session_fd)
+{
+	int session_fd;
+	int i, stage;
+
+	ksft_print_msg("[STAGE 2] Starting post-kexec verification...\n");
+
+	restore_and_read_stage(state_session_fd, STATE_MEMFD_TOKEN, &stage);
+	if (stage != 2) {
+		fail_exit("Expected stage 2, but state file contains %d",
+			  stage);
+	}
+
+	ksft_print_msg("[STAGE 2] Retrieving test session '%s'...\n", TEST_SESSION_NAME);
+	session_fd = luo_retrieve_session(luo_fd, TEST_SESSION_NAME);
+	if (session_fd < 0)
+		fail_exit("luo_retrieve_session");
+
+	ksft_print_msg("[STAGE 2] Verifying %d files...\n", NUM_FILES);
+	for (i = 0; i < NUM_FILES; i++) {
+		char data[64];
+
+		snprintf(data, sizeof(data), "file-data-%d", i);
+		if (restore_and_verify_memfd(session_fd, i, data) < 0)
+			fail_exit("restore_and_verify_memfd for index %d", i);
+	}
+
+	ksft_print_msg("[STAGE 2] Finishing test session...\n");
+	if (luo_session_finish(session_fd) < 0)
+		fail_exit("luo_session_finish for test session");
+	close(session_fd);
+
+	ksft_print_msg("[STAGE 2] Finalizing state session...\n");
+	if (luo_session_finish(state_session_fd) < 0)
+		fail_exit("luo_session_finish for state session");
+	close(state_session_fd);
+
+	ksft_print_msg("\n--- MANY-FILES KEXEC TEST PASSED (%d files) ---\n",
+		       NUM_FILES);
+}
+
+int main(int argc, char *argv[])
+{
+	return luo_test(argc, argv, STATE_SESSION_NAME,
+			run_stage_1, run_stage_2);
+}
-- 
2.53.0

