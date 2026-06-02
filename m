Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8313750B9
	for <linux-kselftest@vger.kernel.org>; Tue,  2 Jun 2026 03:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780370259; cv=none; b=NqxT6Xe+0xGCVLi8FsLHGg/J4x/TRennGm69nwXK73ln4o3rdOX4cXO7IGI8/DStSac6CNBq9uJkkErWfI5V6VVeNT/xVkGbAs2P6ADqe1kMW2NrZJiNbFAya31qait2wbmM8N/rNM/R3x10vsYrD5JcHq9z+mehVtjx8ObgJnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780370259; c=relaxed/simple;
	bh=zVenBMcmRxURhVBZmDsLf2LabKQiVm7GKN1LU8rMyS8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HSRv26oXlemvpMEZ6/XUC3kbkZLP8FpbSvcyOsP6KheW+X7cxhsfAAqlG6kCuxdiCpzBwhHtLkTrfL4Smmi+bv0MkmMKQUj6o0VqEbFZVQH7ij2ii9UDUiUc4gBRGYXFyKJtQK0sroyMLTlkwNoqWUXwhxOLnf2Mc0NQwBfdAF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=V+RITm34; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="V+RITm34"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-8ccf0fa0aacso49174686d6.2
        for <linux-kselftest@vger.kernel.org>; Mon, 01 Jun 2026 20:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780370256; x=1780975056; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=psMAwGaqe9xuyJY3Mn283ARVP/GQQXmgr+1HpWpGRKs=;
        b=V+RITm34NqkX7tWxwna2tv1oYa3eUAsrGrSbX27INEVkBSJ2+09YVO1iCnt3++EcLy
         6VXtnXzPCC8YAOmaBfCxhG+PrrI3KA0j4iAXBGm2YFeDaIk9jDTpuodc03PooITiQpBs
         283/vSKyEPVQGRr7SsZy0nT8A6f+7kCpnHoy0oMuvSSQjlJnXYSQkRHgi925y+VimTia
         fJt1bAwmbNZt+hJqXR3LTjSrr1vRt6YgmSp0+w90lQyGfOGxYGEhNvkkJUUqvEi1iAqz
         yICyjJya9QACAEvR8t3fJcREv6hvcymj2G3nnM70gxXHvVLIGtUPURLbw0rdjUk9DyAs
         NWUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780370256; x=1780975056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=psMAwGaqe9xuyJY3Mn283ARVP/GQQXmgr+1HpWpGRKs=;
        b=I9X3ufxlCATq3K0Iv3yT8ELMhx/jXluxO0QHywAFtx0vCv0iWYuRM3eLNKccwklkZP
         Yklp9MJKcwLnOKweLmC5fy++HMRwc4hEszm+XEMlUhoDEsidQWyn7RCLC/VUS7tCGOX0
         pGB4dH0Jsb/H3wwCLQClfTQPJ1cCwcQa8HF9G/HiaohpR2u3ogpgLBU/2q3CShuqbk+K
         V1XvjLinPqB79tF1LbxcbcyrBD8dFl33bAKlQ0m62LHchy83o0tllyM9OGPzLUhyQqWS
         haeEO4DjFAafGGotHITYFE+Zn78InWrfk/wRoVQo21xHdIk7UmHcSDRd2uoBQPPkdDL7
         LbeA==
X-Gm-Message-State: AOJu0YxySF4kEUJend3jr2ZVGw3sT+uZ3jLrpiyznW+nJt52HZecMg92
	2J+lTDMJG7GqZteOzKZk5ed9zG5AmjxVRobfGUzGE2JENAqNHB2RsaQmsl/b7npyAMZ5Ozjubwy
	+lVx9
X-Gm-Gg: Acq92OG/AisMS1Xc8WDodL1ISWfJQa8zrEiG7bOw5wRIMvNjaoGMS3rTPQOnv2dZJLS
	bZ/CCzVAjJAFvA/PU5mZ7sgwPvAQvh/ewyvQ1/S/SO6ws1/Kfjk65VikwnqYmhlY9kAPPrYXZoY
	hrXYJH37S/B6qmXF9bMixyV8/y2wI1wcoaiTB7gFgeOoa8jPyv2MkDOODNMynUQb1u+Si/2fStK
	ZaUSMEYQfwTalUt42MuLKzZ26BY11DJZuprD78+KqHbTtZw9GkHpBiLlW98XEy8uKsDD8+TQtbj
	lgmlYque0KRI44Rm/3eYcmOy+xEjA4ohQ0UqYweq6FKfnRGmHFr6NPsOG1239ICOvb6KBdXF5E/
	u+mjdzWPOSTS4gzMz9cWblS0rD5ptbwVIPOZydHky/XUPwS3S1R3HANREz1X8ghLwJcKy5UQQ45
	vnbziviSN1hdqmGEIt5q6iRYe/0/ABD+PsPE3rC8QrKtER0k8Wt7rI2gSMSYJGJQ==
X-Received: by 2002:a05:622a:9016:b0:50d:3e1e:7998 with SMTP id d75a77b69052e-5173a821f86mr167634871cf.37.1780370256215;
        Mon, 01 Jun 2026 20:17:36 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51741b29745sm71219081cf.8.2026.06.01.20.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 20:17:35 -0700 (PDT)
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
Subject: [PATCH v5 12/13] selftests/liveupdate: Add stress-sessions kexec test
Date: Tue,  2 Jun 2026 03:17:16 +0000
Message-ID: <20260602031717.197696-13-pasha.tatashin@soleen.com>
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

