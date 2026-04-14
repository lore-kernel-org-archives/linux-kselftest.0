Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF873325726
	for <linux-kselftest@vger.kernel.org>; Tue, 14 Apr 2026 20:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776196970; cv=none; b=XMSk1xe3OypxehLVN928NeqkmOMtEMtNdSGlefvM0RmYP2jNKpZ8hB8lM7OmT0KysWz+AUBAlO2JjPIQfhv6jnJ2aKvaKJpl7u0a3hnvWd35NSc8gHJezBLqYQdG9SOffDAv6LLghMOet10seu6z+i2cNJDnmte967JFz6MYtOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776196970; c=relaxed/simple;
	bh=cstkvhMPl2LYBSE9IY4nT+D67SitefrLtAq5Ft+KA1U=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uEKRYgalVDnVZQyT6PSmVjGk3u4wRosZyFHorMwVceKcZsMsfdoua9mXWFFhMn+wpmnUJtscKIC7aB8k15XrLp/ql9J59U9K6CFAH6/EhvZQHoa7NjaKb/JpbwBGl+xUOy1Hirmh3LgB160IiAUpxdKgzuCRE1Ajj/sxeknF+rI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=Q2gKzhvG; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="Q2gKzhvG"
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-605def5b7f8so3701940137.1
        for <linux-kselftest@vger.kernel.org>; Tue, 14 Apr 2026 13:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1776196967; x=1776801767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9TjUnXkwrio/0RMOWx8bIqnkUDx9TXK82cA2FHqDPhg=;
        b=Q2gKzhvG5B3LFMabTHeYlN88iVIUqKuirWTYg0Oagbwhe6CUgsws8UZWdfWRIxWZuj
         /GZIcLMVWFrt6KRJEjEBeyzzomDtyU0ZDBadrp6jShtdhkBeLtOfr5mJ8oPz8+GYdCao
         NwnDN6gUJBPy6jf/gsL9tEcU9VU2pcZ6AjvxYZtK8CmXVnKv0fChYoEJ4Yi4iqH28JI4
         N+mTw7CuyLg/4DDKp5DWmXD++tJV9y2anPvaRLlqmNXrwPHoXwGneC2xXBVXwQ8FKtlY
         BL4bwHyGqr+SGhPVQC3oEJMBtBbf4S+e5JbkkAGK+pMiiSI484Ate1EvrO9qBEYHXWzQ
         Xqzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776196967; x=1776801767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9TjUnXkwrio/0RMOWx8bIqnkUDx9TXK82cA2FHqDPhg=;
        b=ZpYdoCvnOCl1rurfa6/wY0eEF74zZYDKd/fgvmv3kK+nDYgAhsXVwvgDdIp5babokx
         oWaPckcMeDQKsNDw1aQ132Te/SrFECxypVHQBKzyFk9R9UUeQVdTygbPSFy9a4G7IaWc
         RwRkOlstRswIvB4Jcsdfk4ohHSaj/lTMsL0UPA2ukOUhY1hP/yNvXrrigFSr7F8Pl5GC
         IBJEHBcp7DOWFBDB1mVODgt1l24Xs2ibJFu2Z6BO09MC1Ri3pN064eFXwHqmxdA3m4BF
         XDx3e29h0JPmLki1VOV0tdmzX+xKcrpxC8zyDtyvhMF6bXlw4wj/EkNRcROUknoXe1LU
         zqkQ==
X-Gm-Message-State: AOJu0YyaYrOZJQpNoReNwkiu334d9fvXCKyyePgHpDHlUhZvVdcC7OXx
	biVU2sbjLJD1yJhbDK7u6Xr51XrVpf9FtObCiaY++0okfAd+mlw0jFVhFaFmy3Had+qJ/cf6K1C
	SaIwO
X-Gm-Gg: AeBDiesYLLcT+AVFUEBhsgXQ3vk4elS4eSSRMuLlr1gIJYNEShCrXVrp+D+KHmblOST
	YtGq7MYiN+GRi+1WUhIyTut/BPcGfFKg2ofmjT3yXEz255IN2iwTE/TE6zN8t/UsKPn8Hwseqpi
	RdROyu9UwtpwbdGCxRBMTZFj4xIWU0OB+gdfr/r96/Si1r/XJZ/OcijKZYj5P/mAuv89yHpTfo6
	zLIhgHmW9VxEnTWuxfre/w1OfFIzzIDjzMQPR2HF/gwACIUI/FdNfWH9NYiaWul/pInMt92dsJ9
	UO5N3AwtKPx3IC5oimi6+hPvf9nN0RdhKRvoQiJLN4BPIzYQOMdQ511lZ5f7ZlG1aCrCv4RgcP/
	DvdJGojo1nHyTbNTlrBWwXiuRQ0iG63WIS3N6MkpFLn8k8tKS5wh8CQd3oZmkIGUAExA86VK+UI
	cYP551AJu9iheMtYZzdS92J5Wyf/wEpLFApy5QyzZdgJJ7SPTEQMzLpWZBFLms2KBv47O7fOmLR
	oyf
X-Received: by 2002:a05:6102:2c16:b0:607:95f4:53b5 with SMTP id ada2fe7eead31-609fecbd99dmr8981083137.4.1776196967110;
        Tue, 14 Apr 2026 13:02:47 -0700 (PDT)
Received: from plex.localdomain ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ac84a180a2sm132213656d6.15.2026.04.14.13.02.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 13:02:46 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	rppt@kernel.org,
	shuah@kernel.org,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	pasha.tatashin@soleen.com,
	dmatlack@google.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	skhawaja@google.com,
	graf@amazon.com
Subject: [PATCH 5/5] selftests/liveupdate: Add stress-files kexec test
Date: Tue, 14 Apr 2026 20:02:37 +0000
Message-ID: <20260414200237.444170-6-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260414200237.444170-1-pasha.tatashin@soleen.com>
References: <20260414200237.444170-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new luo_stress_files kexec test that verifies preserving and
retrieving 500 files across a kexec reboot.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 tools/testing/selftests/liveupdate/Makefile   |  1 +
 .../selftests/liveupdate/luo_stress_files.c   | 98 +++++++++++++++++++
 2 files changed, 99 insertions(+)
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
index 000000000000..6217122b92f4
--- /dev/null
+++ b/tools/testing/selftests/liveupdate/luo_stress_files.c
@@ -0,0 +1,98 @@
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
+	int session_fd;
+	int i;
+
+	ksft_print_msg("[STAGE 1] Increasing ulimit for open files...\n");
+	luo_ensure_nofile_limit(NUM_FILES + 10);
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
2.43.0

