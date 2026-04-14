Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2FE32F5498
	for <linux-kselftest@vger.kernel.org>; Tue, 14 Apr 2026 20:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776196968; cv=none; b=VOkblUJRnTuFJgvInVocS1zellM1C2X7MoPtY1joMD15VvPD2w56ycQzl71+bmQln5RY0JGRr/g7u0f7siF6EWScfQ6/RBZkpFpXPBU0jBRVMsy112RLSvQI3ug03Lezosf9YVRrlL5R7TVwCpNInXsza7wzZTTODy8B4kYMjIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776196968; c=relaxed/simple;
	bh=pjymxqiOCC0VYfpCLW/ulNpRB/Nr0nRJchJhF6Evfq8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WLpnQqzW+0q/NDo+yfjD64VhY278ppEBGSbJKC4XLIkOLHNhoDvSnWVeArUTXyeC4XIvrzKZhBp5QauuRRk6MRefYinHmz+wyhz46BIdYH3CMKFtXXQKXcjUPRhJhoEhDQfIGLeKSRh32ZizCN0hA9VxbJSyeTIRc/dpFTSSgW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=BsRFOptD; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="BsRFOptD"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-8a154cc6a48so69960706d6.0
        for <linux-kselftest@vger.kernel.org>; Tue, 14 Apr 2026 13:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1776196965; x=1776801765; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ydncbOJwc9Epn5rxEKLGgwSNmxXWJlxhMwGYD93RLPE=;
        b=BsRFOptDjuUfcK3N55CmYT4AR5rnsxsB0/pdDe7Wdl+EFovfjDpNRbTNMpk/9gk3hQ
         IPeDaxDHj+YfX9LKaWc5pG/cQKNOWpkUOBuUWl24K6j1FyezuZm629HYxN/JII3Wh7Ra
         +MgRK0ZKX6gbOpgSLPPJOJvgBruMuLyZZORL0JawdgFeWjcm2HVc8nQe9AHcNGAR4NN6
         Kr3UcUHilw7RGNzfO1kG0Yz+ow3uAa2jNHyro+9KhXL6zc0il3CoPQUkE0Ep8pgOYCMi
         ScQqS/l36d6ElQzh1DBBj4hkLutkZHZ/DAKGVaW1wmmKUHgixConx3GF7w5kq3YVcDf2
         1asQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776196965; x=1776801765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ydncbOJwc9Epn5rxEKLGgwSNmxXWJlxhMwGYD93RLPE=;
        b=gxbrirdZqt1HJSXr13zxGAFXX6+L+axRSRbjd+hGcWyUQAg7IcUyydmSzOOW5yAxRc
         C8zWY67jbrenN396QlFXVxsrd9NqUZjSJrp+yh1vpTfuRaM87G70u5rA3SxDvoz8rHGq
         P/jjAl25mSYF8xD25GW6SVkE1IRJsfClgXI80tPh6kCawwk/0MU4J6i7URAPgH+jMnKR
         VaFDkO1OxgipiPQ02nbcmDSlpfujSJcBqxYu6a3eOy6v6JfeoslYN/VJWkTCITv+23hu
         60nDwG/63Sy8oXWkBfAGQvNV23IH609K/4t7Oy2CyvUSnB/Jl50UnnMus0mi3nB63kdf
         JeAg==
X-Gm-Message-State: AOJu0YwV5+M8OSN+wm4k4QETcFmRXeN7tyqmU3VXUOnGkdavws8js/4B
	joUjEmVrRnFyE5VeXOCqCmBDLu5owq7UJWhEY8/naDYo5uEHFnFMjM5++G8QeLwxG2FrY28PYN+
	RKHLt
X-Gm-Gg: AeBDietHLfNtwXeL8kk/LO7RCEywxjTlGtfoHSCSfdxbbpSK24+0mQbfsa1L6rUDe2y
	d6IIbqOSnxoRqgtIT6FPSdAR+0ZxEu3s+LY5J8HRgId+GjG/DrZJnTTIMlPv3FPlb/FpDUTcPvZ
	I6qObKXT2iPj7gcP4qyUWqV9zjWtoE4R+hRl5XAceJZbjzzJsbFuUW6dGyjWwov71MTl5eOFW1n
	Ne2xvYBGwH3e5nbYPXW6l2eE0bqxRLCJpt5dp9CdIdtt2vq7ZGWXB4lQ1Cs91LzoidWNRbpBqL7
	9lGbwZ+EwnvoLcyvDQOa15G3kPIkhXynjmCUp+yWFpOR/XbzC0t6kEBPIVAwN7z7DnVkBfjPlcZ
	Mir3qaKVfExpVCfosRgQp5UWcBw+0FvASdIgJ3bDmJuNoKpI5Ghc3c2ZGjh1n1DfXtpjeeOG0qP
	VZxBqOGVeX+Ue6bzuMNPLptw49tJHI4uKjRSc71dPpVm4qAH7HTnukCSiPOuvIorxVVA==
X-Received: by 2002:a05:6214:4a8a:b0:8ac:ba63:a1af with SMTP id 6a1803df08f44-8acba63a68dmr104715286d6.53.1776196965499;
        Tue, 14 Apr 2026 13:02:45 -0700 (PDT)
Received: from plex.localdomain ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ac84a180a2sm132213656d6.15.2026.04.14.13.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 13:02:45 -0700 (PDT)
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
Subject: [PATCH 4/5] selftests/liveupdate: Add stress-sessions kexec test
Date: Tue, 14 Apr 2026 20:02:36 +0000
Message-ID: <20260414200237.444170-5-pasha.tatashin@soleen.com>
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

Add a new test that creates 2000 LUO sessions before a kexec
reboot and verifies their presence after the reboot. This ensures
that the linked-block serialization mechanism works correctly for
a large number of sessions.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 tools/testing/selftests/liveupdate/Makefile   |  1 +
 .../liveupdate/luo_stress_sessions.c          | 98 +++++++++++++++++++
 .../selftests/liveupdate/luo_test_utils.c     | 25 +++++
 .../selftests/liveupdate/luo_test_utils.h     |  2 +
 4 files changed, 126 insertions(+)
 create mode 100644 tools/testing/selftests/liveupdate/luo_stress_sessions.c

diff --git a/tools/testing/selftests/liveupdate/Makefile b/tools/testing/selftests/liveupdate/Makefile
index 080754787ede..ed7534468386 100644
--- a/tools/testing/selftests/liveupdate/Makefile
+++ b/tools/testing/selftests/liveupdate/Makefile
@@ -6,6 +6,7 @@ TEST_GEN_PROGS += liveupdate
 
 TEST_GEN_PROGS_EXTENDED += luo_kexec_simple
 TEST_GEN_PROGS_EXTENDED += luo_multi_session
+TEST_GEN_PROGS_EXTENDED += luo_stress_sessions
 
 TEST_FILES += do_kexec.sh
 
diff --git a/tools/testing/selftests/liveupdate/luo_stress_sessions.c b/tools/testing/selftests/liveupdate/luo_stress_sessions.c
new file mode 100644
index 000000000000..cd6e9bb0db3c
--- /dev/null
+++ b/tools/testing/selftests/liveupdate/luo_stress_sessions.c
@@ -0,0 +1,98 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/*
+ * Copyright (c) 2026, Google LLC.
+ * Pasha Tatashin <pasha.tatashin@soleen.com>
+ *
+ * Validate that LUO can handle a large number of sessions across a kexec
+ * reboot.
+ */
+
+#include <stdio.h>
+#include <unistd.h>
+#include "luo_test_utils.h"
+
+#define NUM_SESSIONS 2000
+#define STATE_SESSION_NAME "kexec_many_state"
+#define STATE_MEMFD_TOKEN 999
+
+/* Stage 1: Executed before the kexec reboot. */
+static void run_stage_1(int luo_fd)
+{
+	int i;
+
+	ksft_print_msg("[STAGE 1] Increasing ulimit for open files...\n");
+	luo_ensure_nofile_limit(NUM_SESSIONS + 10);
+
+	ksft_print_msg("[STAGE 1] Creating state file for next stage (2)...\n");
+	create_state_file(luo_fd, STATE_SESSION_NAME, STATE_MEMFD_TOKEN, 2);
+
+	ksft_print_msg("[STAGE 1] Creating %d sessions...\n", NUM_SESSIONS);
+
+	for (i = 0; i < NUM_SESSIONS; i++) {
+		char name[LIVEUPDATE_SESSION_NAME_LENGTH];
+		int s_fd;
+
+		snprintf(name, sizeof(name), "many-test-%d", i);
+		s_fd = luo_create_session(luo_fd, name);
+		if (s_fd < 0) {
+			fail_exit("luo_create_session for '%s' at index %d",
+				  name, i);
+		}
+	}
+
+	ksft_print_msg("[STAGE 1] Successfully created %d sessions.\n",
+		       NUM_SESSIONS);
+
+	close(luo_fd);
+	daemonize_and_wait();
+}
+
+/* Stage 2: Executed after the kexec reboot. */
+static void run_stage_2(int luo_fd, int state_session_fd)
+{
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
+	ksft_print_msg("[STAGE 2] Retrieving and finishing %d sessions...\n",
+		       NUM_SESSIONS);
+
+	for (i = 0; i < NUM_SESSIONS; i++) {
+		char name[LIVEUPDATE_SESSION_NAME_LENGTH];
+		int s_fd;
+
+		snprintf(name, sizeof(name), "many-test-%d", i);
+		s_fd = luo_retrieve_session(luo_fd, name);
+		if (s_fd < 0) {
+			fail_exit("luo_retrieve_session for '%s' at index %d",
+				  name, i);
+		}
+
+		if (luo_session_finish(s_fd) < 0) {
+			fail_exit("luo_session_finish for '%s' at index %d",
+				  name, i);
+		}
+		close(s_fd);
+	}
+
+	ksft_print_msg("[STAGE 2] Finalizing state session...\n");
+	if (luo_session_finish(state_session_fd) < 0)
+		fail_exit("luo_session_finish for state session");
+	close(state_session_fd);
+
+	ksft_print_msg("\n--- MANY-SESSIONS KEXEC TEST PASSED (%d sessions) ---\n",
+		       NUM_SESSIONS);
+}
+
+int main(int argc, char *argv[])
+{
+	return luo_test(argc, argv, STATE_SESSION_NAME,
+			run_stage_1, run_stage_2);
+}
diff --git a/tools/testing/selftests/liveupdate/luo_test_utils.c b/tools/testing/selftests/liveupdate/luo_test_utils.c
index 3c8721c505df..37c330b9bb36 100644
--- a/tools/testing/selftests/liveupdate/luo_test_utils.c
+++ b/tools/testing/selftests/liveupdate/luo_test_utils.c
@@ -20,6 +20,7 @@
 #include <sys/stat.h>
 #include <errno.h>
 #include <stdarg.h>
+#include <sys/resource.h>
 
 #include "luo_test_utils.h"
 
@@ -28,6 +29,30 @@ int luo_open_device(void)
 	return open(LUO_DEVICE, O_RDWR);
 }
 
+void luo_ensure_nofile_limit(long min_limit)
+{
+	struct rlimit hl;
+
+	if (getrlimit(RLIMIT_NOFILE, &hl) < 0)
+		ksft_exit_fail_msg("getrlimit failed: %s\n", strerror(errno));
+
+	if (hl.rlim_cur >= min_limit)
+		return;
+
+	hl.rlim_cur = min_limit;
+	if (hl.rlim_cur > hl.rlim_max)
+		hl.rlim_max = hl.rlim_cur;
+
+	if (setrlimit(RLIMIT_NOFILE, &hl) < 0) {
+		if (errno == EPERM) {
+			ksft_exit_skip("Insufficient privileges to set RLIMIT_NOFILE to %ld\n",
+				       hl.rlim_cur);
+		}
+		ksft_exit_fail_msg("setrlimit to %ld failed: %s\n",
+				   hl.rlim_cur, strerror(errno));
+	}
+}
+
 int luo_create_session(int luo_fd, const char *name)
 {
 	struct liveupdate_ioctl_create_session arg = { .size = sizeof(arg) };
diff --git a/tools/testing/selftests/liveupdate/luo_test_utils.h b/tools/testing/selftests/liveupdate/luo_test_utils.h
index 90099bf49577..9174d6757a7f 100644
--- a/tools/testing/selftests/liveupdate/luo_test_utils.h
+++ b/tools/testing/selftests/liveupdate/luo_test_utils.h
@@ -26,6 +26,8 @@ int luo_create_session(int luo_fd, const char *name);
 int luo_retrieve_session(int luo_fd, const char *name);
 int luo_session_finish(int session_fd);
 
+void luo_ensure_nofile_limit(long min_limit);
+
 int create_and_preserve_memfd(int session_fd, int token, const char *data);
 int restore_and_verify_memfd(int session_fd, int token, const char *expected_data);
 
-- 
2.43.0

