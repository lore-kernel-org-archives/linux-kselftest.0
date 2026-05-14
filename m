Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F4C3D5651
	for <linux-kselftest@vger.kernel.org>; Thu, 14 May 2026 22:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778797612; cv=none; b=h9X1MuA/efz+uwVefdA9Yw7m7LU0iSSgiEtgXaQP8btXcT1DwBCfqyWDOVx3ZkU7LM5xsoXGnp0AEVv0dIMPo/0LT6/deskp44a0ETpnA9FKuHiOgZH8V85i3eH7OAHPTycvF47xnkpTmT6ar/k0/+S6T6k2ilU87IzY3Koakos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778797612; c=relaxed/simple;
	bh=piyhP1WlFEDEC4wjfdVtJ+Ed5dSs0hL3Qd4yjf73GtU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hS63sfQ3zBBFKY/36MZZ8EtOsaNEUj3akIBFDqSAHtqeqZiK6Ms4CJ+IwYPPN+h8TYF7kg65wSx7/oWaBKerVxLs1sIP/IT9+DOkayc+NMmbG94o4KaqfPTiY96QEL0u/4o7ieHbTPFv0YccTbdsb1kZwuOzjJnhBpzRHqUoWhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=HTPqamg3; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="HTPqamg3"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-9106ea78cd8so280132785a.3
        for <linux-kselftest@vger.kernel.org>; Thu, 14 May 2026 15:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1778797609; x=1779402409; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZIrwM3YYxVlDXZ9UztplnfGrca1M/xZmJnShxYpBntg=;
        b=HTPqamg3t9ttbBJWAWze/KY4l+Pve/WCBXBEuAuvLPc75zBB9/XtUzGR9tDWdoovFS
         Ot20/0G8g/QPZXg/l7q0CH2XGfmrDuMT1DeGgSDd/Lw0rtWSZVX/twkL+2etXzv5RXPU
         +njr4lzFRxKb99hA3HsJBXFdQH/6+fvMXx88gQczzQahFIQ1HEsiQDEQxHWnS9pVMlLY
         nOo0nk9gnPNqioDNLYXGMUTAsifAsgzaWXR0ybEsxwN3cEjb7zBIlSKRPT80ozmvEbUh
         7Irq5mIbgLhk3d5TGd/f3twRGD4up67hmFEQvHsoMWrUqZwK1pfo5QixRhjXPPRZGobA
         oEUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778797609; x=1779402409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZIrwM3YYxVlDXZ9UztplnfGrca1M/xZmJnShxYpBntg=;
        b=P1gOVNj14dazf2LXLN+rWpTqiAuN8LG+UEzox3rg3Bbn1O0ruN5wAbH8LnBUhlYqwl
         zGZmVnstgxa27aZeYFUorYTMZCzoU1qXt9917wZZBnORLq/wHsQqKlKQYB8THiFcWvk4
         DfvXfCoTlCFH23eCw45HVU4xRlJpAhQzAOm2AHrrpyWzjUaaqCP+53Ou+p1BDZmtJM1W
         w62u6Zle7Z2QdQGxbuZeeF2gHLY5tbuCue9Ctdo98ESXWckETWQj78sJE5Q3ETvEHm9J
         e5mFMt/0qsPb+pvMxvNHCcyz000xa0gjuAhBQwh5sdMAk4OHMAeeovs4hrL1exfLpEpP
         BVzQ==
X-Gm-Message-State: AOJu0YxepxXoFw8lql9oFSZMi+hcKQuBXaZ5aUjCJ5l0KBuLMyOB5Etq
	0r843dSb89H2CvrKKMTrQ96U6HJ5p52QMAlPHpoKoIgdQPcuz2KDYLDwIuRUFNdjawIYYqt7NmJ
	UhNRBqWI=
X-Gm-Gg: Acq92OHmgOETTVlfknWIX2F/W9EHkMlaPTPOXCSkVZLuVrqlrkbNMdf2SQLTMpUNynu
	M0g1BCYBmSSv6Qz65i3xQrnUrlT/smy2WKEt380+6NdALrMq5USaD9YeCgHTXF9+teYZXHFkruD
	n4Kthgkd12MpWEVCRyeFLBlXOmVQnocpYxup8CcvvlYXnE9zxguyypVIrs6RnJ4j+GF9DZDU0jI
	x1Hjl3iGuxdZA7oGN6rQGZ11pcqOd+tfrnSHam/RodpYeKcQUtf+obNZTJBMWcaPAwxWFeFIZuT
	7saP5709JXJbjkBV5lRIV1r75RBJYNP8iS7NqhNuyFy2PMckzplpDoVKioihiQ3Rq69sTocgHML
	0T3ZDBUP2zM8o6aojpwgwFLEmvzdhFG34cQ5jdjAhjS6Pzh7whfZbnpf7ajETkxZyvOVfJc7S5b
	kUvc9yhWJ/hX2KZwojs36rfDRighgNjBvYd6arulzwpoqFiCneNlE=
X-Received: by 2002:a05:622a:2445:b0:4f1:ab79:fb18 with SMTP id d75a77b69052e-5165a03e931mr18328421cf.25.1778797609141;
        Thu, 14 May 2026 15:26:49 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-516456ba92fsm28671901cf.9.2026.05.14.15.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 15:26:48 -0700 (PDT)
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
Subject: [PATCH v2 10/10] selftests/liveupdate: Add stress-files kexec test
Date: Thu, 14 May 2026 22:26:28 +0000
Message-ID: <20260514222628.931312-11-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260514222628.931312-1-pasha.tatashin@soleen.com>
References: <20260514222628.931312-1-pasha.tatashin@soleen.com>
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
Reviewed-by: Pratyush Yadav (Google) <pratyush@kernel.org>
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

