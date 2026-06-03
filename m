Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F063DCD92
	for <linux-kselftest@vger.kernel.org>; Wed,  3 Jun 2026 15:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780501592; cv=none; b=riSNolzMNjIdk+P/GXJI43LDAkgd602mhgeb6cDYJePG4YNJ3mn3CPVRC/hiLKwN5GpspsLiXp8cYjkW4u5dv8e/orF91ViWLDI7OVXZbTWuiow9vogM/oCO3/mctfSmjT1Wem61v2pmaOVgwmPiHFFkTECDa495f7WQNwlBH1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780501592; c=relaxed/simple;
	bh=zVenBMcmRxURhVBZmDsLf2LabKQiVm7GKN1LU8rMyS8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o41d5OQdeGoxLg7VjAtdk4k9pB4jhsdH1N1P8Hr1aMDH0Co1QEGopfDEp2iEiTB0Tani1f5XDAsbcsdPLeAaEiQBthPpKQyuti8hUfkID2hkgaQyiX2NruU1iPIWTPtz1xd4VU6iJno66jkQAP3wNuu2kJ3lp6C78mSeVN7SJ4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=XbsuCauu; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="XbsuCauu"
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-6efdb57db0cso238273137.2
        for <linux-kselftest@vger.kernel.org>; Wed, 03 Jun 2026 08:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780501586; x=1781106386; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=psMAwGaqe9xuyJY3Mn283ARVP/GQQXmgr+1HpWpGRKs=;
        b=XbsuCauuxhUW2rofUghnExSOhGM8R9+KaB+rD9m3h+1tIQ/I3oAsajcDYcBb2cs9b/
         Pd0u8pUVP/ZdMgN3pugL3F3iXL7IYG2jxv/qAMBUtBkRo2zSGPiI/URBnRBESV0Lp14c
         Mt4CXvH+Gj61ct0t064jV33ZtDOfiyHOodhsE+PMbeMHQlhP34vYgWaCMJiOCSWcXLXW
         Zv7+KkJ7gh2VJU6cJzXJvMRZ3WAorXhgR4oFeklfCI4gyWSjG+1WYDWG+90ojf93nGFM
         CfaD0EIF4SI32aYlEHXzXtHgV8HkLqEQ5iEHYVeISwfGWKzHCJh29t5Uge7XuL6WRREF
         zJlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780501586; x=1781106386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=psMAwGaqe9xuyJY3Mn283ARVP/GQQXmgr+1HpWpGRKs=;
        b=gVGbxVnC30U+eQOfpT5eKj+sxU0T9tYfguqo8qIk9J+3Db1AWRwRNFaeTAtUghjwcu
         svMSlFqMjQTke0chGnLbkJeHm43XAddx4psPjTg/cAGC5O/p9YChG/udfRN9HFjTqT1X
         H6K4LxR6+e1lrTj6hVQW83x5XIW5zR9F6MqBuXnUm+P71KazmJW/LgAacqUiR2pT6P1A
         PjP2ashdVHISL/x+bPKmb1rs+9ogPRIBXtIyKvJt0ruzEgngDGgyoM7lVYqS4OJwyNCp
         w87v0bMfoawdumx0QJDXD+iKqcgEyqrr4GH+J3mda9uoDJ/U6Y/AeyojLNrDuyZ5yc2U
         milQ==
X-Gm-Message-State: AOJu0YwHjcZF7+L0VkS0Yypbvv1NNJXAZX0yDb6PdrDxgc2o6tB1xVQq
	YF5hFjE/51ZaRLzPbNiU+/7v66OY47t4+acgf1swSUX+eVnOTIActeqD/SDbxpPXNk3ip7pktg4
	vwlau
X-Gm-Gg: Acq92OFjagjhRsY1qzo8JsTcZz9ljSuvo0EaM6dMXl4ofU3YA5hI/0ltfOoTRueRlu+
	65sc3nVYExMCkX1dRliIiMFZ+e/c2W+bnYBLHQYfgbCV5TaofJ08tOJ2Ygjpin5fZ5j1TPMeIyX
	GVXqI9VrZ1KBGKqE9q2RJxUCgiAHDsY3bHFhuR6NZEe4cjGyFrNVAMunSn1+S3eApQl1ZzUZ7XA
	XT+h3hFflORyPCgWbrGnifaJJQS2ohXjuOfQ7H9APPYMM/uoKApWY9RZEVw7Ch98NOAWWbffUt3
	StFVoBY0kaeCG4I8l9vlqycrCYQdqHBH8SlzfGEtuapy2hnxXIsedK6LuyCyuOACSycDp9Z5NIV
	+tIb4JM7tkgIXnobYucRZTbe/8/o7z+PV58/1MhaOqV+zSiQP9sz3KtBTZ9tNZQOz3FTvE8d1+7
	0Q1eN5tYHvCUIqBOBOmch1upw1fjXj02rULd2mshv5Hj94CLAtCWwzCU9sUuECBw==
X-Received: by 2002:a05:6102:e0a:b0:631:2a80:e492 with SMTP id ada2fe7eead31-6ec4ce590b0mr2408029137.30.1780501586216;
        Wed, 03 Jun 2026 08:46:26 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cecd053032sm23998326d6.24.2026.06.03.08.46.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 08:46:25 -0700 (PDT)
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
Subject: [PATCH v7 12/13] selftests/liveupdate: Add stress-sessions kexec test
Date: Wed,  3 Jun 2026 15:44:01 +0000
Message-ID: <20260603154402.468928-13-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260603154402.468928-1-pasha.tatashin@soleen.com>
References: <20260603154402.468928-1-pasha.tatashin@soleen.com>
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
Reviewed-by: Pratyush Yadav (Google) <pratyush@kernel.org>
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

