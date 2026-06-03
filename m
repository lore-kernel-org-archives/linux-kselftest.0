Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A7A3DC878
	for <linux-kselftest@vger.kernel.org>; Wed,  3 Jun 2026 15:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780501603; cv=none; b=DegFXgWg+GPm6N/9EHFXpkfYW/NZFDS1NDZRX7Q5Rr7mFwvDyDLntgYqQBH3wlptIKZ8/Td7fe5kS9SdoAuPSXap+1I0/sPIKPa40o3rDnkxA55fp3/Ns/ykGJ2JRG56Xym3LDmqEJ3hoSv7ooLIRphIEPkFmcolFkRchtx4Trc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780501603; c=relaxed/simple;
	bh=PI26M0khAE7StCXBHeuwdUicbhLFrZpiZfsokDq9n88=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mp0egUy4gkvN62MssEp9AIVCZq/SQHqladD3FwOlfbEAB/ZrMP67hFfCAfZXqZt+/5+ABZNQ4TbL58L89XPXMOCvTouIkR70AACvKPi336RNUPbWyq/LZeBpBEWmrzYdyd0J93dmofWqEeMoFhTfvDZ+zq/Ywuceg2/y4+xWwjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=UfnMU9x4; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="UfnMU9x4"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-8ce9df4732cso37080976d6.1
        for <linux-kselftest@vger.kernel.org>; Wed, 03 Jun 2026 08:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780501598; x=1781106398; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LZ44uuKaEudMkx03Nujcoh6Uuv+6Qpcd4aVYSw8wkq4=;
        b=UfnMU9x4HQ5qiHtFUE0lTFss8h/kLwIwM83j9GbTZhGvGXszQl8tr6XSAJY1tNAKlw
         Qj1G0CU3SJrnxCoUmRu6p7idE7BGqb7YKlchkUMwVRnw22z0d3QESJuxbP2ypf/u77vu
         RBvxBD8885JZf9GhT7X8H8WnQ9637cQIUNDlKvfzngK72pRBy4fryDXVv2hyEAWtFRU1
         IAtQfDrX0YGSZr2BHgW1t9gddbSUofKjyl1DfIKKugoWQKu+u5q1PH+I5USpNtniWECr
         oF7XJ71VAo2DubK9lgqpW4u2pNUm2egb5BUI4CgGO0oiKgUzKBv2WZ/HRQowF0u0snfs
         EnXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780501598; x=1781106398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LZ44uuKaEudMkx03Nujcoh6Uuv+6Qpcd4aVYSw8wkq4=;
        b=H5N+5r67bN+h9W9iIoD8Bb7doPRuOgOCB2EHOuiuqy8OdIGcO4z7bOpDu+/63fOdxI
         vLtk4ipfwKXsP2vaj0q+57HhxMCCWzMOoOFkqTOsq0m35i72mwTA+GNHzYYdMZiOQFOg
         Ej7mQpyzbGLBunJbhLPDOWSUu/Qs7GYMiCHXcawwsA1mMcdJW5ucUBeJu9QcK+u4dyWY
         PSudNo0TwIhmDYxTb3nenv1NJ8AEoZZ8aEgoa6/HHdXtJkWxvNjPcR1O7tTsCjI2k+o4
         JFN9eGCRwhUZ+HHW3XJoXBtIPL0PL0LaHQjYagVMOOkDXdvZs46BwuksEf/HPJb1rHks
         yNjg==
X-Gm-Message-State: AOJu0YwrZ3rD2sv+3i5KH2rtuYI0TBO5A13URrtAGAvSfBoectkYM14k
	NweGa68szjtiyzpmKXK9uiiyWITdB2a/hsLH4iOfcjq8UrHEhnyl2AjzgFiY2gVI7F7qOf2Gpml
	OOdUc
X-Gm-Gg: Acq92OFyusE3zsoqvDXR86/D49V4oTnQgdDRemo+p3/vxA1TmQjawXxBho/SYgcIfT1
	jWzChZpx2BGsU6W4XrHCXZLeNKJiMUQNpFpzDW9DPQGdxq/WMHKPxvpCtdEVH0D2eDrbYHirmnG
	HP117omqAmQqr5Rt6gY6RuOX7WMjP+SaKhj0F3G187XPU/tiibxqQuUFi+cBrYh6+qjSqwhATen
	KsZJJNebe6qC6wvoPPXg9yVYaLxVg4/ERfIQgI4OlEeA5lk9XThe/0uxPdlBB53pn+ErAXnvDLS
	6LVrjXw9CuK9eANq+Bumdze7xeMhb1rRSaTHrxh5SjpaLhKtVmrfL7/hizEKRb2EHOJE0AtxN1b
	WhwAAcz4IdM7xS3U24DhzrrzPUboyBBWhAKZeTtv7FYEDI1wtAlJ4cyE6SBuB2wLvRupXKzw251
	uElymq6Ejoeo1oEmyD+zshdHpCWQ7yjkUPI97fEeoOxFhGpTUvIsXVsBAeSYwGA//N9qSMW54G
X-Received: by 2002:a05:6214:dce:b0:8ac:a6bd:503b with SMTP id 6a1803df08f44-8cecde9c8admr53195506d6.15.1780501598131;
        Wed, 03 Jun 2026 08:46:38 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cecd277070sm22665326d6.48.2026.06.03.08.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 08:46:37 -0700 (PDT)
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
Subject: [PATCH v7 13/13] selftests/liveupdate: Add stress-files kexec test
Date: Wed,  3 Jun 2026 15:44:02 +0000
Message-ID: <20260603154402.468928-14-pasha.tatashin@soleen.com>
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

