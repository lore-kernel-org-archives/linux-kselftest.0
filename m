Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B0F3FD96B
	for <linux-kselftest@vger.kernel.org>; Wed,  3 Jun 2026 03:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780457368; cv=none; b=jwT1AX/IxquZ79fKJ3cA1cwwPCAPQ1gQ9rRXhpl2z/G3UgTnVlO/dwmRkXX/DZQziNL0CxMuCSbrMtEJRqJKWZZJwKo+EWNSCs/rncrkLvEiw7yzonhPlzywLqhHS2IriMD+oEoM6xQ2I8ULtJmfDPcK//J/WTa4UQk5gvSxcdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780457368; c=relaxed/simple;
	bh=PI26M0khAE7StCXBHeuwdUicbhLFrZpiZfsokDq9n88=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=orENzMA57mEkSZdbakU4nFayAL9OOcSpi+z4r9JYIlwtcYBpenuE0WT2l0L6lPXh+FFMU93UO3BG8Wf5bWETLWa7fwawC+ehCmicdrKCL5rB28v+F/wqjQ4W0c1uk495YjoIxdcxRvi9VqKPOTjv1QKQ/Wp/oWXgfBSF/+pJwdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=H3gBJSfy; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="H3gBJSfy"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-8ce9df31840so25832856d6.1
        for <linux-kselftest@vger.kernel.org>; Tue, 02 Jun 2026 20:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780457366; x=1781062166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LZ44uuKaEudMkx03Nujcoh6Uuv+6Qpcd4aVYSw8wkq4=;
        b=H3gBJSfyhNg/d6xu8tLy3zhPjq0CIcVT/vNWBe0DuibKH55/qS4e6LLCg+5zeqDmhR
         hhwZQIsVo57hM55ZQDivV6QthQNfw6vBcVPhYuUS7p8LAiYLOE6N/cGo6VOaJ6epJPgU
         0wCwLZcspfeG20llEo2UvjtXyGe3J/5zBiPPolqLtA6J8xbD9wZeseSIW0sC2K+cs47z
         CxuvDvrCq4BiuXhYBof1v6DlVLI+JpGuVPPDiczcylwEmSjiay76x8Ax1qSl5eoUqHbL
         FgkfC+fYpuMSDtd2RcKttTwoU7FMSUgarS6naaReiZmhx5didspEY4QLcu+jFsE06j9R
         NVXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780457366; x=1781062166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LZ44uuKaEudMkx03Nujcoh6Uuv+6Qpcd4aVYSw8wkq4=;
        b=REZNs1jErVHqNAxvOk0MU/Xvdy5L1YraGXWHcJYZXc5Ft4i2cIEVTy96Sc0SsBCRqo
         fXuYq7gFa3COob6D2gnsEgVcUASIW0nSMElk9Qvus9DYc7ZsMvzCZCKSkX+BsWrQBvfW
         S3/qNAufaRs2pLmavzE+WJXykdQ7XVIkhebX0+jR0ISi+72BUKRzH2sI2akLLwhDLde3
         r0+om+gbzgQgNbMKsFTNhzv9bJ6jntHIsLHwmjk5lCeFZ6C3p3dnCj2ngkI+7fLIrr6v
         UetbpkWfiEInn7Jr5Izot/wwEPNszGRYU1ZMciGLVtuyESwqmkQA3D2Brik+bcdJgeIb
         UlPQ==
X-Gm-Message-State: AOJu0Yw8yRhZNRA2HGE7e8RgMLrfk0XTKY2UPEFynIeBh/DWbVkKR7k6
	2h/TZ2IhYakkZmVvDIyTO7LrqNiyUs7Otuw38ovA9lblL9U3zYxR87eom8da+EvAI7xzFcJXUHm
	6njiR
X-Gm-Gg: Acq92OGUIcuHMDR96q/18qs7s7oSquOMznT6ou+SBm1z2EnQ7QJIR9Uj0JzI5MH5jKB
	5TX3Kc44sitRtao2iQJDGGfKCMmbD2mvku9hGtZDjxZiDBpeEI7kTMQ9BefaqaCqIe+WenwFAQ3
	/mnnoN+5ivdLRBsLEr9PRFo3gMBAD+8Eol7OHCWlw/ozFT6BspLzGXLc5aXZLtS/xG4an5WWNch
	pe1ULZMWyDX8cbaUwnzxzf3UekvniZ2CGlp4FaO+UThkNkY6VqsSj2Qkg6p65BDaG2FWQ2hvrTH
	jCrh0LR+7eolOa/TdfWQg2pOoxgfXHGRnK+maBaWBCA3ZNm4IJ+xbiBu0tWeEaHwbJ6ghRJ9c0f
	+d0ZOsVhy4F8w5PQ1OW/o9QZwT1nvjhqaVcilhi7SEmrBvDDo7IFdbLEen1qOvot88ZtO3wzaBi
	mFhvRmx+lOyAJyy+n12OXToo+tYhPS4neUVNysdVlTVzgZMMkloso2FW4YchiZgg==
X-Received: by 2002:a05:6214:500e:b0:8a0:4e92:c45f with SMTP id 6a1803df08f44-8cecdc18097mr21849986d6.11.1780457365747;
        Tue, 02 Jun 2026 20:29:25 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cecd26b3b9sm9244566d6.45.2026.06.02.20.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 20:29:25 -0700 (PDT)
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
Subject: [PATCH v6 13/13] selftests/liveupdate: Add stress-files kexec test
Date: Wed,  3 Jun 2026 03:29:04 +0000
Message-ID: <20260603032905.344462-14-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260603032905.344462-1-pasha.tatashin@soleen.com>
References: <20260603032905.344462-1-pasha.tatashin@soleen.com>
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

