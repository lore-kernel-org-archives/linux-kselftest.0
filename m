Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED0D37998B
	for <linux-kselftest@vger.kernel.org>; Sat, 30 May 2026 22:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780179608; cv=none; b=Me2KIDwQmzgmC6zxWGtcA2D2d0cYP55d76JZczlRHuUNrB/gvPO2vWTfywK5USxvDsQ9rvWHbAsIysAtuZtr7I6NAHe/OUY1w+T5HYHgg0mAYPLPJBhBkZf6l7UeeiZY5xuBRH6CZjFxerBk/rXc46Cbhgu4fBt/Erkmno9+vN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780179608; c=relaxed/simple;
	bh=PI26M0khAE7StCXBHeuwdUicbhLFrZpiZfsokDq9n88=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GRFL2+aVy+XSL4yxtJAl4YGaZ2HLxqULXeusH+3+kuHzhUn2JEfpaRmKDHT4mOPlSSscGeKYFnxlcvrgjUYB8lzTX7yR9hWDLA0XKLSMk/unJaFkyJ4Rt/+6W/5E0iufrr0hpPECTamoyVrqn+NemQOUy9PfTcE2pqNu3zPcDlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=NyZMKQgY; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="NyZMKQgY"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-9154ca1aa1dso53053085a.0
        for <linux-kselftest@vger.kernel.org>; Sat, 30 May 2026 15:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780179605; x=1780784405; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LZ44uuKaEudMkx03Nujcoh6Uuv+6Qpcd4aVYSw8wkq4=;
        b=NyZMKQgYj9gZS3nJ3TwtHG7VqnqiDZ7KNKoh/6eimpM8dJG4qWT4jinWbbBmjb0PGx
         3dSk/F5rGoQIor4+8DKMkZHq/U9EY7H7Yrt9RivbCT/Gee0N76YAwhFLRC+LOFl4qV5G
         rltSGcyOF+OCE8mydvhQLrM1hUhDpgXoXDccXZK3DdBhG/NwSEXt92AR3GHqXeCJ/6VP
         CaWI+kX00v3SZkCHNaxnGihKX78Og9V5jMk4TRFAIj5ahuTYS7I3oSpQGtXuvL5ETaoe
         4dPeHjWVJ8g1+JBolFO6uVf4KnPuHu/C5g2+9+oC/kko3rrNwdTnZw51nSAHI5Oqe/co
         J6Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780179605; x=1780784405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LZ44uuKaEudMkx03Nujcoh6Uuv+6Qpcd4aVYSw8wkq4=;
        b=BAecoxjwYbXVHhVmZv/TX/ffjYAjMA1CTH6AogRqFy1JZRtQlbZRtty9cO/qkXVVtY
         OICfgq91TwNGh1B+9+ZavMyhxyXYRQtfxNKcNQjslTXvhdr6l+Qd1PP1VSJlvX9ICVqW
         u+cDfR9NrSCBPMjE8yqXpvhHwWFOFG3rexAwcFdQbOl/VVWoTS4WBWnMMfYDVfO78KDH
         XNfwQmiLjh03z4q+MXzKiEMWezIZMfGJzML7soW+T1UxTdaGTKso30TUMUo8aqbB/QuR
         GBzs86whhRoke7gJLYovRu3Ljd64rCgJc30m6VAH+p6JcUF1Afu00TTJGkbWLt0xNO+1
         zr/w==
X-Gm-Message-State: AOJu0YwvQU4rQ+yonrv+1em95RByq9UZj1B08K6VaI078AAbbVZl7Rcv
	jEWgUS8fGracETmOkeFLxbshxZpsgYvzvBm6EDgWAc88UfR3JWdhul9wbHZQbbkoplM68fv6cb8
	Nv6T9
X-Gm-Gg: Acq92OFlkd/9vwa7zvnefMC9U4oTzEv1PRnHtbmE6duKpja3L+PGRod2hrxNqIuNhtf
	BNtGetyJ6EdgDg12k9GlAY4lK5LXHs2ke0a4iBAppjUyDB1OxCyvGnVds+RaytXin9p3xckYbI4
	Eq+CHlxnBN63KLG59LvJaLozA4ETjWXg4mOxqRCzjDvUM6pOa48brPvXirJ1In1kJgotPjbQSIl
	TrnYEAXsWLhJQrUmm6pMMABomnRdJBDNujepeV/G9jrQ7BwujMxverZeU+xzVlabD18v6W8hwpr
	uyixN8yiz6XIVZsGB1M47ylDVkPpVYggr343DliiIDJPlu9KkvzBfkhW8LMueSRmjMO1P5Af6kH
	7uybRtl0wV0nscEXpxpyrtg4NM24i7fqWLySRDf1eaieh5Bn30HrZsxE8akAIRanVlBrM+BFObw
	BZykOHnzSaxWZgCU+krX+ivsFoPwuQQrAdLWV1uS5QUaUeJgvqv5/8dpAWVuIcxw==
X-Received: by 2002:a05:620a:29d5:b0:90f:786c:4a82 with SMTP id af79cd13be357-9152fa29820mr1006065185a.39.1780179605586;
        Sat, 30 May 2026 15:20:05 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-915324868a0sm651790085a.18.2026.05.30.15.20.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 15:20:04 -0700 (PDT)
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
Subject: [PATCH v4 13/13] selftests/liveupdate: Add stress-files kexec test
Date: Sat, 30 May 2026 22:19:38 +0000
Message-ID: <20260530221938.115978-14-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260530221938.115978-1-pasha.tatashin@soleen.com>
References: <20260530221938.115978-1-pasha.tatashin@soleen.com>
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
 tools/testing/selftests/liveupdate/Makefile   |  1 +
 .../selftests/liveupdate/luo_stress_files.c   | 97 +++++++++++++++++++
 2 files changed, 98 insertions(+)
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
index 000000000000..0cdf9cd4bac7
--- /dev/null
+++ b/tools/testing/selftests/liveupdate/luo_stress_files.c
@@ -0,0 +1,97 @@
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
+	int session_fd, i;
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
+		int fd;
+
+		snprintf(data, sizeof(data), "file-data-%d", i);
+		fd = restore_and_verify_memfd(session_fd, i, data);
+		if (fd < 0)
+			fail_exit("restore_and_verify_memfd for index %d", i);
+		close(fd);
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

