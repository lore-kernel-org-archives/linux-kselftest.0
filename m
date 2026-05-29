Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E338370AE9
	for <linux-kselftest@vger.kernel.org>; Fri, 29 May 2026 03:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780024884; cv=none; b=ovWehHIMQiX8UpIPl0KmBbOnBBr1YwumvrTpyEDYoj+66jUaEL64LvRMLr/VYUZ/zWLswn0Os58fCMSnOpJo2ypNmobwqg3Sn1c8xEl6SgIitUnuL2FaxIPdrqyI212NposZchDkujH3RbryNgI8bzqdxYDvXPttJtN3VW6G2Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780024884; c=relaxed/simple;
	bh=PwW6M86VtpCYbVanCRu9RC9XepQoEWHm1vY/6gS4fT8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a0FpTOvIxl5ZhtwjQ0bEteq3cRa4WNsXKOaFAKXzV/sUsBtVuC5QZghmLsQ1u0zZkVTUuhRhqXLS/9wZm1JVuZCpSsQH1pvsMGAwwiLst0KLznh0Jznz/Bf8ggVZ7QZRfqNtwekvTcYm08WS4KKeNA8irqJqUjlc5U40Y4CcJ10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=b+4kwRa8; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="b+4kwRa8"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-8cce87d7995so2406826d6.0
        for <linux-kselftest@vger.kernel.org>; Thu, 28 May 2026 20:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780024882; x=1780629682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zMNVhv3SnOTuZ3xqpMfMs2g7riJHPagItEAHtnUEWTI=;
        b=b+4kwRa8f7qrkyNsbDVjH0o6FjozCDeb8hD4uzPe2/f34l0/Kpab6HKSKhDZlwcFA5
         v9Y+mm0dEzdSOhwAsGrTI1eQCNAJuFop/qtwur22W0cYDPJTB/cjx83EKznqE+X5iYD3
         n6R32cHt4+9XnqW+zwEBPTQnm9bO1OLPsT1NlLIm+vM5uQZCqFSIUG5EFkXlqf0C9xO3
         0pYh16JHzgVyXOu91BYTtaDcXt+6iY2Qgn7CjcPbAWKYiE0HJtvoevzCzCM30V6ncexg
         NAcx5SllZtIBQr9lNhJPREvjtRZIcmgQJooyFkXS4HOCK6tU/8jDPqWxlPTg23GrokJy
         XkxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780024882; x=1780629682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zMNVhv3SnOTuZ3xqpMfMs2g7riJHPagItEAHtnUEWTI=;
        b=KtPeKClMxjuj01MFtVriBz7deKvtwIT6bMp5F4dRxFZLj7ZJCeIT9vxDrnb05ZKMup
         qAlJ0gwLEtbS7x7vN6weucbWaJbhbOViCxnAkpsJGa+wOlm87HijGkqzDOcYsqBYsrdt
         J9OqCamc3aecK2S2Ag9/IvnwhLMW2Ly8Ld/wt5OtCfGRC2nUePTpY5hYdgMHkfDYHMwn
         +58tyS45IZ35HjGGnPbe0i4YmEdv6GKj+1jHby8Pce/1YJpN/A0A5TlQBzj9QBxaOmSB
         5XeyTY02GvZRfk2xqXf26qBrIY/RgzLvf4U+3RJZhCIWNgTjnU8QPhKbI3phvGUupwZG
         J4Rg==
X-Gm-Message-State: AOJu0YyUhqAEBvLIUIDkHDjDshjv5F3YSfDt7STL+hmESc2zs3gk7kCn
	UhP/sbRidAhTbMrDoWhuiIfhrcPX60qqQeuyM8ZfGgmUo0USxktCDT2Z52o6E9Yh4zFzGw138b9
	y90HA
X-Gm-Gg: Acq92OHsHTBnbpI+0WA3oGwzYSeNNibMnivXevdGxdY55aFf54sCM2qVP55kvjAYDFr
	tSPrmimmUA4GQZII8p712CDww39qp3KYrALcfHy6eay2Pwaj2Qdq7Yuan944G6ytoZf0hf1BFXI
	i7l9tr+Oqk0tARHWuOufMZ6Tgh0AoGg3EqwjgOFi6ILhfqij0BIONeJVm/sErs45jPahDYb+4ct
	2akB0aWe4/8+kXaCQJ92VaqniphyR/so5X0kIiT5/MD21Zb5vpsA+T7ey59naCSiwKG0sd7ZO0W
	aC3jY3qCxAehVxa8S+Ld63qOHs4CX/XGjaI9EALYswLgN6+NO5NGN3X4R9w3LWh2h/9LQeqZHnL
	4ZMbKkugEjbJ+iZY+mXGpriXDA0PxyBhoaKnHixagYDvQpGLeg1iadd+0HSgYEj71biaMi8P7nD
	RpqG308C6a773rg+CSztODbA2V1lYQPF4n767eqp4WPz6WBYAumJgs0J3JEOahpQ==
X-Received: by 2002:a05:6214:518b:b0:8ca:deb:3f9f with SMTP id 6a1803df08f44-8cce82412d1mr11698806d6.34.1780024881756;
        Thu, 28 May 2026 20:21:21 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ccea26d286sm1179476d6.48.2026.05.28.20.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 20:21:21 -0700 (PDT)
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
Subject: [PATCH v3 10/11] selftests/liveupdate: Add stress-sessions kexec test
Date: Fri, 29 May 2026 03:21:05 +0000
Message-ID: <20260529032106.1505796-11-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260529032106.1505796-1-pasha.tatashin@soleen.com>
References: <20260529032106.1505796-1-pasha.tatashin@soleen.com>
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

