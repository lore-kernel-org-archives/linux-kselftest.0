Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B493837756A
	for <linux-kselftest@vger.kernel.org>; Tue,  2 Jun 2026 03:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780370260; cv=none; b=JOLomcOIIwhcS7dsW1ODiLTH2Y0sivGsa/t5Oh+PUVq0Hwh3EQKhYlubrQhqOO4jD2B6j4KFa8VpqIau5MSdZXgjI8akmgWiHByA3F5G95xGTvXmxQj+CZae/U/SqWoNEAaR6dUctlWdGvz/f6uYAnFp+E2tvJwu7O8DyV15rng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780370260; c=relaxed/simple;
	bh=PI26M0khAE7StCXBHeuwdUicbhLFrZpiZfsokDq9n88=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PKW53Ym1NgoK8+C60OKb8ujfTLwuzxzSfvGZNIXvr9E/P0s2cp2QXMGLq20PELl3q/5amX6Zni7ztqXRidUSO70+hHb+l9qHnFIH2oTx/ehUIZq5YMF9tjuFSYjY7UHGLrSWvOBtdCbyGMpeupKm4qSDabIjmA4bjgJn9JQ2NqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=C4QE7CGJ; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="C4QE7CGJ"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-5174a133bc3so23485211cf.1
        for <linux-kselftest@vger.kernel.org>; Mon, 01 Jun 2026 20:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780370258; x=1780975058; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LZ44uuKaEudMkx03Nujcoh6Uuv+6Qpcd4aVYSw8wkq4=;
        b=C4QE7CGJcAqV2/zrxG4d7x5xbeua9cAzc8XndG7qWl+L2/hZHZtwC7KVyRhQOHJtE2
         T5aa8xwbPWfZWI/R3j9XoppRcgaiVHxQchY6sZbaAA+ttazu8Noy/OjpCNYvp47T2lmA
         ZCnaq8pJJvZhm2AuCfdmY7S+SOjeHVCHAXmBsNoIV+7xFK6fDdbmKn7k/pcJXyn0RTDZ
         vLEkbNpVZpRkU/KKG+m32NosX5hB6SY1uAlyxa+0J5k4wEdDgrbdzgmBTlTH2ADz+Y7c
         amIJE8MeSkwcqOSVYF9Rm0B4OYx6wYU1OADR4DRsbZt5d1SczG8KnENG06drf9vNaOV6
         1niw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780370258; x=1780975058;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LZ44uuKaEudMkx03Nujcoh6Uuv+6Qpcd4aVYSw8wkq4=;
        b=JPaomdVk01oTJYjgZBN1UOhyeTTQpMkRIvsblxNvO2Wp8jpf1HekCkXgGwHR+3tb0P
         lHObR4olXVSsQGCaGAxMxi9GvShmH/dWbP1OfFXLUdkebYQlHVcQ3N0oAJn0K5rAivFc
         iB2/nMMln+9A6MYedR2Eqh5w/NJIJsBuRMJX5X0PjbKMRZzgrTPhvIezfwhNluD0hmO7
         QZZFC0nJFdC+nUbE0OuEGIuZXdl1fs6yfjCY2AM5DYtcHVbG/s3esBIQ5K2eAi28uHlN
         QYpBolJzeu6FdcE/RoV4xFu+1tpBMr9FnHEfvWF8ILClS8F8F+Qt9/9Jru7O/iWkS/gd
         PDwA==
X-Gm-Message-State: AOJu0YyIiRfvJDFYt+aPDWWf1xy/XPE9+RDnveTSrlOKKMNaCIFXIl+9
	LUocF5IK0YQB0GKbq23Vzq350UcYZb32bjXei2WPI9UYMZaMqUtY5h+vtPtcnA0vtJGYLzAj2DM
	bUuw4
X-Gm-Gg: Acq92OG3NyMxRkAiziDefZPNgAQQv4uj2mq9gqNV2cJS9ZeYJ9c3xCwo1oxqGfP/21E
	fn/GZmxlYPMp/VdhWhGqhNz+jWANYStWSope2rWyZQCDQh5dlr0wSAmpdveab+fBKDy2rpTQE5/
	+BunyMfzmUHdYavHJeaMeQepDDXWS/TmgdkTsn06zXxJBu65D6rmiGA4g69f4ah4kf+hOYOVk5A
	auiN0caVE2Q+1mR+VzzU5Eo9D9rwJQ2VewSGV3aINMxXQKYY6uL8Vp/iHg5VZ7GqJgcR+adD61J
	knl4UZITkZUFb1QimpVh8RXUPtTJzo+96SIspluSKrCvxpwv06qsRAhieEcxJqkE15awWPHo/oX
	9qXk7U5xWFP4ahCv0u1qxrgIHs/lJjLlwP5ZxsoTu1QCFarvVcHcJ/BoNw3bWGmAN9auO9CoX/X
	ODKSfnEZJU0/vD4L6m/x+3gc9y6UvUJfsF1fjXYoFOHAf9JYxheNonwunhC/fTV76eL7PrF5iA
X-Received: by 2002:a05:622a:1f9a:b0:516:d781:589a with SMTP id d75a77b69052e-5173a73b0aemr208229881cf.22.1780370257673;
        Mon, 01 Jun 2026 20:17:37 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51741b29745sm71219081cf.8.2026.06.01.20.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 20:17:37 -0700 (PDT)
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
Subject: [PATCH v5 13/13] selftests/liveupdate: Add stress-files kexec test
Date: Tue,  2 Jun 2026 03:17:17 +0000
Message-ID: <20260602031717.197696-14-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260602031717.197696-1-pasha.tatashin@soleen.com>
References: <20260602031717.197696-1-pasha.tatashin@soleen.com>
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

