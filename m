Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD0B378D74
	for <linux-kselftest@vger.kernel.org>; Sat, 30 May 2026 22:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780179606; cv=none; b=LP22s8ek8+9KZjIMphFr/YomJnB1sn9Hx6uUAZRYBPT/XACFPqrylE4iALWCAAz+T2fAwTWyKohr0f003NpUW9a2vHp5ecDJA5/ZgT+Wkh91IwNPIWUVMCZORGfI00uSG0/dogMDA0rcHmZ9+1tyTPlsAnsREGz+AeeLl303QIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780179606; c=relaxed/simple;
	bh=PwW6M86VtpCYbVanCRu9RC9XepQoEWHm1vY/6gS4fT8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oHEFg3AaatLWfqR0b6QuBgulaOTP7QPaUMVrB5ccphvLyhheljFzRTvHg7JN3mT7oRMbNZ0W9wrXYaPVvpYNunmukN296zkxmRvarOZ8lDMPMFxKI86A3+T1uk2BEK2TqOZOpg+2tBJ6PgiqDakKxZHAqBHcKgNrkXHyA/LcZdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=Lp5mv4Oj; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="Lp5mv4Oj"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-914bbfc2464so693728485a.1
        for <linux-kselftest@vger.kernel.org>; Sat, 30 May 2026 15:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780179604; x=1780784404; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zMNVhv3SnOTuZ3xqpMfMs2g7riJHPagItEAHtnUEWTI=;
        b=Lp5mv4Oj6Qz1Qet2yJKFpTE3zeQyNLOnctYYkLT2kYgsLrEaqal6v7ZUhbnZ0UP6qN
         Zd14FUOqJCOrSa24A/eJMFrP9ZGrRl8TBgv8xy3h8/FJJzP9UE1TsZvk+VwiAy5AxwWD
         vteIt4oNnA81O36sARggQ6qwmExvhyhI6rDmz/WdYnmgySNjS4zUCWDR/9VT7p8TS2gV
         V3Ds2j1QlTh+do06fTuLRG8PDU6hV48U2qHxi9HmNLgkm30/J2rNHPUbWCKlZyZAhGvt
         8LqsqcOcp8E589KSyEwaJ0wL6U8i0Hb+IMwE2m7A6LqUGYcCOKdztW5+x4gqoIDE/JWa
         KKRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780179604; x=1780784404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zMNVhv3SnOTuZ3xqpMfMs2g7riJHPagItEAHtnUEWTI=;
        b=DHaApc3bGfUw9CW9+NRU2AsVFfPVFJsQVnOECdNTgjRumE73aPttu8lWLaWY/R7Itk
         mkSXFL1mZTKvYmQMB8KrkaFWuHPNpdlwpcH0l7r0IZafv4WZf6rGFDWUHaWhcfQWHgew
         jxRGEe2cwvSFdliGIiCPfn5RBwSXUtWi/y17+VpCXxVyKUr1nAeArkclQMSRSMglpB6o
         PQoDfDS3s1vPfMkQX9bZiJHNdguz7ATzh4137IwNbtJ3qe6uasL4WIbePoazektlIXnE
         BKMZIThY9FvqiXo2baqLy/ZJeIXhhbErV0ckQ648UCbUnwT0cxC2n0apaa9Ggj9N9bS6
         ICgg==
X-Gm-Message-State: AOJu0YzJlAAhMELgnLT6ekgT2PQzuC76cQPg9lxLkmEwq/QKWnt2x/FL
	FMSOJ3iDqonSwRh3jwLcxOdPOtqOWVLbVmpTxx/rA3IjHhJ9Vx4JOkQFCe/ncUfxF1e/QJA1TGm
	2R82a
X-Gm-Gg: Acq92OEFOlD+xHR6O0Pqri5/ceiOPTGj6kUwkggY7iBgTB+G1asK0t9VTe3CNRPe/o9
	UCbYuU5b876441lnPIqy1wuX2R6rWPRoPcAf/UK8ZmMPqCIq5pc5SqQz7pnd8xy3z+yZQGK7guR
	uuWVlhkPGuLIg6uTPb2y6CnLPOxCjJTHwZgTjsT1VYayvnkXqTbagQDpwccRq5XBUOPNBXGEwo1
	TaRi9sHs02rCcBfD7KPkr9aIvkhKOmrIdTiqwGWmOBDQeAQn/r1ddoO5jLXTxY7azJLLCsVURv1
	8Wed+TR7pvCnScibYBa4kwToBKRygZST9PI3Oyrnvg76WG8LK9q0orwG5XXYmoBpReaGedujHHr
	Ypm/QqgRQ4i0HW980eila0me1UF9RjkeHqWzAUDLeREpKow0acrGAJwXmTvdI309J9DdROSfyg4
	5+EZC5UaINk+gKojssrrX7O6rveyffl69Kjp0mvIpgcYk+3DQ+NDrFMDkPYg2xVg==
X-Received: by 2002:a05:620a:178e:b0:912:67ca:bac6 with SMTP id af79cd13be357-9153d98adc6mr770549985a.26.1780179603772;
        Sat, 30 May 2026 15:20:03 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-915324868a0sm651790085a.18.2026.05.30.15.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 15:20:03 -0700 (PDT)
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
Subject: [PATCH v4 12/13] selftests/liveupdate: Add stress-sessions kexec test
Date: Sat, 30 May 2026 22:19:37 +0000
Message-ID: <20260530221938.115978-13-pasha.tatashin@soleen.com>
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

Add a new test that creates 2000 LUO sessions before a kexec
reboot and verifies their presence after the reboot. This ensures
that the linked-block serialization mechanism works correctly for
a large number of sessions.

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 tools/testing/selftests/liveupdate/Makefile   |   1 +
 .../liveupdate/luo_stress_sessions.c          | 102 ++++++++++++++++++
 2 files changed, 103 insertions(+)
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
index 000000000000..f201b1839d1d
--- /dev/null
+++ b/tools/testing/selftests/liveupdate/luo_stress_sessions.c
@@ -0,0 +1,102 @@
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
+	int ret, i;
+
+	ksft_print_msg("[STAGE 1] Increasing ulimit for open files...\n");
+	ret = luo_ensure_nofile_limit(NUM_SESSIONS);
+	if (ret == -EPERM)
+		ksft_exit_skip("Insufficient privileges to set RLIMIT_NOFILE\n");
+	if (ret < 0)
+		ksft_exit_fail_msg("luo_ensure_nofile_limit failed: %s\n", strerror(-ret));
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
-- 
2.53.0

