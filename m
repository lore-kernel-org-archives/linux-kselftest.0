Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77DF23F4DD7
	for <linux-kselftest@vger.kernel.org>; Wed,  3 Jun 2026 03:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780457367; cv=none; b=gv/U36okBbf7cyUreLiPDPCEjC3rj85RXk+zfVk0D0QHrpxzFK8fHF2ijFIWnqk5nh9wxhONq3KNRK1C/bJk+0EIOjmLNTqsikuV3K6t162Qh0KJq3MRZVpgR666sXgs9gSP9DHMTiluAuKnCpAYm42dGmq6ZahRKq/8Rx3UP/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780457367; c=relaxed/simple;
	bh=zVenBMcmRxURhVBZmDsLf2LabKQiVm7GKN1LU8rMyS8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CsAg5WHcReUz8TY38VjcRt1ON9lYN3TAKGRiiz2pzfVWiQUOnsJOts4Qs/nJzBlrboyaAOihvsKdQC0U+H6KeMhmcDbvXJK8VXYu/FO9HXFLOPsyvhB5+bnyrujlAh4z2nsWu7V/N4laXy6zsYfRs8NsSEo5kwu8HWx7iZYy6a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=XcFBWTb6; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="XcFBWTb6"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-8ccf18ef922so54915256d6.3
        for <linux-kselftest@vger.kernel.org>; Tue, 02 Jun 2026 20:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780457364; x=1781062164; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=psMAwGaqe9xuyJY3Mn283ARVP/GQQXmgr+1HpWpGRKs=;
        b=XcFBWTb6hZQAhAjn3K7CmzlQYZ5HKzAUaHLOiOssReJ0XjOKQgMHVQ3rWuLRdUIchY
         fd2DnWuCLs5nnFQmy1hQArIIz3+b+4Mf3uWwkpqEQ7cq5+X86qKsDUQep7Jm1mU4xRrT
         Su57PCruJvvsWIE7F9ajNVNJ5m/gzrUa7VhLAN4c0Ag2Ik4tXKGdsC74wYcGnQkLWGzc
         nC6N406w2XsG5h4c2dbTfp7VVkallWqNnIx8R9zdwqs2GSqcg47tNfYUnjPv+9eUavbq
         M0UYlj0yuKAo5F1muDoCnCB5NrEXqzvHJyeiJd7FMIKuoGup6HBqR9s3rljRyNw6zT1g
         s5cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780457364; x=1781062164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=psMAwGaqe9xuyJY3Mn283ARVP/GQQXmgr+1HpWpGRKs=;
        b=Zp2L6gc5fZLNY89uPKmhc/vZ7QCVTuoHdAz323yDvlOW6vd/ztsvfF+nING58age3U
         8KtlfXfCTrbwWmSG9XWxXs7/2Dcl1+B5J1l7QzBrMTQUHpnNzkiDKh58zEtE3MzS3Nqe
         +7iyut1n4t5PLWioA1Dx7so3pFYs4IP+RsUzYama+BHK0XMiD5EsuVLEJSwJYLJZAWKA
         EaRpFbE2NfbpalHwfTI3MQa7FBLTxKRMFLBDITuuHA9BKBoYN4gMDVWuNPTJ0s41SbVw
         SK9ejUchdaqM8KSmuNRBYjVZMlDeFt+Dvg+/EYZElFuQZt04qnpbMLS9zmtyopm5+qEL
         hOvQ==
X-Gm-Message-State: AOJu0YwMlg9kMPbobSWZQrIFwiLoy5HlR3ECPtOM3EQlgku3FZ4Sxj7H
	v6weJb3XuTJm2Knm02kry1HYKJKHiXBOkJ5rcguex35ThThqKNdV80hXry39cMZADTgi6LJUBwE
	lhbqq
X-Gm-Gg: Acq92OH1U1IIl21ySHmjby2IeB5ODWB1kIUyf5FiZtE0jyZry1+jz8HAG64zD8SXHu9
	ccj+X1A1B2UxjOBD0JFfNkAjz2x7ISj3uRTC/XNdpVkmDxa15ZnND21hJoBE+/koQYKqz340/WL
	7T0hwI1+AgubN6lg3kB8xgYlb8Q86xSI/rxmLenyClt0zMkJinm/2Uru+Z0dmUzyjkooMHP4KNJ
	3RnX02YZfyhBATTQtHpwbxVZYrTMyMVMeWtiW2ftYgTFQznfLF9qZiejs4O4/GqfVeDNsi15HkO
	5S+npCz1JuZkUytzjvs3b8Hh63gDjOpp8PeYXQIyh0aNggLKBUGQkEcQTXAv+EmqpCRnATzJ7f9
	A3zwRRxpjNKbFihYOk64zyi1lYIRgt4AKlF2jwtZbnKn5XXHZXf++3YrL7Z8nYTcb2wOZCm0ePJ
	zE2Q93JnTGUzHrpTiiho1g1rFMjvW3AtbAN5VPQcWc8wUZgmwjWFqS/D8za/cSvriBGeYXeuHK
X-Received: by 2002:ad4:5044:0:b0:8bd:59a6:4165 with SMTP id 6a1803df08f44-8cecdc04bc1mr16915496d6.4.1780457364532;
        Tue, 02 Jun 2026 20:29:24 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cecd26b3b9sm9244566d6.45.2026.06.02.20.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 20:29:23 -0700 (PDT)
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
Subject: [PATCH v6 12/13] selftests/liveupdate: Add stress-sessions kexec test
Date: Wed,  3 Jun 2026 03:29:03 +0000
Message-ID: <20260603032905.344462-13-pasha.tatashin@soleen.com>
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

