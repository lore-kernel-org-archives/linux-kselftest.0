Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D32953D523B
	for <linux-kselftest@vger.kernel.org>; Thu, 14 May 2026 22:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778797610; cv=none; b=Wno632kgqNBy+fO9lNixHNG3ldRDyd/hsLrxU6V2O/fmJOdqMS27PCcK3dkEjEw8FRVHsj13ScivdaC4EZgOpoIMTB00uYB7FSJaTKhJEhQ42FALEohegXRKcyX3Hem4lFs1KDbhcPNd0VU6CEW2hj/aOjafopH9xNrZ6gmlazg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778797610; c=relaxed/simple;
	bh=WTBJUEEMM7K7ob4xZeJB7qcdaYVjvJmNAEO/PdJgFis=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZtPWrWauwAViSx43hVpbG4CJOCBSHIALr+5zx1cti36p+w0/o3oyqPCJ/A8Q0t6CZnXvLANpo86uD3SCDIhoC+K5+Ao5sTcvwTOlktIN2sflIBnJRHo2MPXlhwvfd+fX7OsxthFOTgG2GeNH0/ksIr8TiEs8cJlb4g7i+JibbdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=G9qChUUP; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="G9qChUUP"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-512f09ecc67so59904121cf.3
        for <linux-kselftest@vger.kernel.org>; Thu, 14 May 2026 15:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1778797608; x=1779402408; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z+TDIuCJZXpxQehieZyZSUnjXJ4NsIJyCoOgTpI/vhI=;
        b=G9qChUUP2pceoS8Sp5qeM4P+165yrFC0mNQUOYQuU1NZDfsSZr5IXR5k5UiaAthqOi
         NU/vILiRhPsYf2/U4IhdnfJUrwH02oAwNNlLTVW+CCDxVHQ/Tf5kKB6uNErGNHAInmDI
         BCEWU0I27zaMcRxI4Edl5RY9vHn4ButA2KIzKop5KjzRQiYKfC7kOw0/mEyYpdvU99WT
         WWT/VFcRytvUIXYdS/6MjNsR1qpXX0dCTL/Ar1GDi0br+AZGt927BBriBFv0NSX2WS1U
         TlkVyNxMqC146SdKTCKoz+1aX/uYUQXEenARywIxDPwDzCMsQRQGPuZB5Yr4tvccXDPa
         TnQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778797608; x=1779402408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z+TDIuCJZXpxQehieZyZSUnjXJ4NsIJyCoOgTpI/vhI=;
        b=YztQlIv8TTvLm2urYNnH5yQDIzmKrxOS/ePAA0EJhEG/uJGH34khuAcz2kV8uGoPai
         slUfU11UP3vR/j8czo3Z4Q8XKbEZs0D79yt//Mo6jXS2wP8idaaiYY91MMlkpzwAZwoA
         dFHY3U5PX+++ANOjjyTD0uTq7t++cJaKrwZ4y1/Qpt/UdyTtcA6drR2X5LiMN0mmacC5
         M687HtxmHjjIirOrHP4aXc5lfRBDiXNCAPvdNj34d+yCorR5Kl+kOTN8Orji9usB9ZSr
         23Ss5YTPYo/saFOqh/YVf1jDHoaPFnWuL4LkYH3WGPNKOMxRbGeDkGKkfBqvFDYVa9ca
         GPog==
X-Gm-Message-State: AOJu0YwArrS7asHFFmrEJ8Wacf16fc1GFM8wMxs2Q1BHyTKBztSgQFAk
	HjvdcF3kkOf8MIrrmJrQDn0CZjdjwViF/kpEPShkE4bB3i2eL7pq/PDi62DcJBUWI0LGG0xqYx8
	cwUbgTd8=
X-Gm-Gg: Acq92OEqYd8MWwTgymZ+fmzvyFtHpqhoaVpmn3lEITGvwzt8W3I9FldadeMmL15riPr
	tM1wkB4PJyGGFx7jZmpvdGk9b1GOEtZ7NrpqYz6XsJlsReyPW/Nq6mD2cropnkBfSaCWWMjRhfD
	oAv73dyXX+mMukiq/nnBtQHkB53k1qucbfM/dlCqljIL5ZdKiZoYqdEzk/MHqtDNih8wLEpiehT
	u/te+pfR+M/xKukfRKXCKR8BejrxBlb31agH852Y2j11Sh5TwLLOJXvz1geYSpT2f+BdqbMHMzo
	0g2kKzGHK0gVUb7EDTeMcGKm80DZ8wkIN+jSPp8hp+UbX0Q1hrq3jR73jfSy81g3hK70wYkufOp
	QpCPU/rqhSGRDO0L9glSpH3uJS5e1+mjdwIJqeUmw3rxC/6TNTeTpqI8gaiTF9a4SYi0KmXfnQg
	FAezjj0GzmJqZEZQlUkc8pL1+B1S56gLDacqh75suxwhkz9meyZCM=
X-Received: by 2002:a05:622a:15c5:b0:50d:a8f5:1c02 with SMTP id d75a77b69052e-5165a219a43mr19531391cf.41.1778797607915;
        Thu, 14 May 2026 15:26:47 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-516456ba92fsm28671901cf.9.2026.05.14.15.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 15:26:46 -0700 (PDT)
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
Subject: [PATCH v2 09/10] selftests/liveupdate: Add stress-sessions kexec test
Date: Thu, 14 May 2026 22:26:27 +0000
Message-ID: <20260514222628.931312-10-pasha.tatashin@soleen.com>
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

Add a new test that creates 2000 LUO sessions before a kexec
reboot and verifies their presence after the reboot. This ensures
that the linked-block serialization mechanism works correctly for
a large number of sessions.

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

