Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4483D6491;
	Fri,  3 Apr 2026 19:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775245228; cv=none; b=o6ZyGLonlw2Y7N1KquGCCorWYhUcb532zSusYqL92CidoL8xirYKVcE+U91ggokBFhGZhL+4CPsZrWX2YQJ9oIMOBsc0j51Kkg8kGpn9sh8JBTNUtkGNiJIBOVaUbL3Hx3Cy6iJOaLvLY7y3FH1IP6NZ60Q594uJCI8u09YaeMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775245228; c=relaxed/simple;
	bh=VK1HcPC/3wExF1FoSkZi5ZUUe6b5gm8f6ww+D0kO+o8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IHJovJFDk8YbKOmDIz87kfn2o4sLlnfKGfcarciWZim848LXcHYbO7HXxcSfa9jcjh/ZesocVneCWQNLPYm7LqgtTx0DmEGP4O6+0r3XpUiaCuvsK26jGps1dst6VHy+8fqTKRror9y1IV2A+f2QTct18aIJjLnbhNogUh7X/A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZoTiwGe1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZoTiwGe1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AD8DC19424;
	Fri,  3 Apr 2026 19:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775245228;
	bh=VK1HcPC/3wExF1FoSkZi5ZUUe6b5gm8f6ww+D0kO+o8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZoTiwGe1QmwvyLreS4Iwrj0r8ah0hPBXnXkDtoGieRWHthFimFGI/8HyOb0NfseHn
	 U3Rfy1sk15IcwoJLlpi32RaU6sx0F/WIfS49RxgHFJmI2SxvbSHZm5RmndtmsNjjy5
	 9JIiG6ShZO2+U8SlhLW2qp5Wz8yI6r6dhBeJP+RSJae8qbTkIhHVjLhE2QHfY6aWaa
	 C4lj3ERuasJB+zfR4KTOLQqnwPHge8yRiNX736KKPZ3jlpcDYTuNkk+HAo3Q3X6n5h
	 pztj4dQayog8j5amMJ2fQgbBklDTkb0hQVeL0ucoCZF8M2p6iXp7ZJWxrIrUZlnYVp
	 v2TCiAAEh4yYg==
From: Pratyush Yadav <pratyush@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>,
	Mike Rapoport <rppt@kernel.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Usama Arif <usama.arif@linux.dev>
Cc: linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH v2 1/6] selftests/liveupdate: add framework for memfd tests
Date: Fri,  3 Apr 2026 19:40:07 +0000
Message-ID: <20260403194014.3704180-2-pratyush@kernel.org>
X-Mailer: git-send-email 2.53.0.1213.gd9a14994de-goog
In-Reply-To: <20260403194014.3704180-1-pratyush@kernel.org>
References: <20260403194014.3704180-1-pratyush@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Pratyush Yadav (Google)" <pratyush@kernel.org>

Currently memfd preservation using LUO is only tested indirectly via the
luo_multi_session or luo_kexec_simple tests. Their main purpose is to
test other live update functionality.

Add a framework for writing memfd tests. The framework hooks into the
kselftest harness, but adds some things on top to make it suitable for
live update.

The LUO FD (/dev/liveupdate) can only be opened by one process at a
time. Each test runs in its own process. This means the LUO FD must be
owned by the main process and shared to children. main() opens the LUO
FD and shares it to child runners using a global variable.

Live update tests run in two stages. One before kexec and one after.
Detect the stage using a special state session. If the session is
present, it means the test is in post-kexec state.

Additionally, take in an optional --stage argument that lets callers
specify expected stage. This is useful as a safety net to catch LUO core
failures. If LUO core fails to preserve the state session properly, this
option can help detect this and fail early. Since the option is not
recognized by the kselftest harness, remove it from argv before calling
test_harness_run().

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: Pratyush Yadav (Google) <pratyush@kernel.org>
---
 tools/testing/selftests/liveupdate/Makefile   |  1 +
 .../testing/selftests/liveupdate/luo_memfd.c  | 78 +++++++++++++++++++
 2 files changed, 79 insertions(+)
 create mode 100644 tools/testing/selftests/liveupdate/luo_memfd.c

diff --git a/tools/testing/selftests/liveupdate/Makefile b/tools/testing/selftests/liveupdate/Makefile
index 080754787ede..051daae55eec 100644
--- a/tools/testing/selftests/liveupdate/Makefile
+++ b/tools/testing/selftests/liveupdate/Makefile
@@ -6,6 +6,7 @@ TEST_GEN_PROGS += liveupdate
 
 TEST_GEN_PROGS_EXTENDED += luo_kexec_simple
 TEST_GEN_PROGS_EXTENDED += luo_multi_session
+TEST_GEN_PROGS_EXTENDED += luo_memfd
 
 TEST_FILES += do_kexec.sh
 
diff --git a/tools/testing/selftests/liveupdate/luo_memfd.c b/tools/testing/selftests/liveupdate/luo_memfd.c
new file mode 100644
index 000000000000..47d2c3163b62
--- /dev/null
+++ b/tools/testing/selftests/liveupdate/luo_memfd.c
@@ -0,0 +1,78 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/*
+ * Copyright (c) 2026, Google LLC.
+ * Pratyush Yadav (Google) <pratyush@kernel.org>
+ */
+
+/*
+ * Selftests for memfd preservation via LUO.
+ */
+
+#include <errno.h>
+#include <fcntl.h>
+#include <string.h>
+#include <sys/ioctl.h>
+#include <unistd.h>
+
+#include <linux/liveupdate.h>
+
+#include "../kselftest.h"
+#include "../kselftest_harness.h"
+
+#include "luo_test_utils.h"
+
+#define STATE_SESSION_NAME "luo-state"
+#define STATE_MEMFD_TOKEN 1
+
+static int luo_fd = -1;
+static int stage;
+
+int main(int argc, char *argv[])
+{
+	int expected_stage = 0;
+	int session;
+
+	/*
+	 * The test takes an optional --stage argument. This lets callers
+	 * provide the expected stage, and if that doesn't match the test errors
+	 * out.
+	 *
+	 * Look for the stage. Since test_harness_run() doesn't recognize it,
+	 * once found, remove it from argv.
+	 */
+	for (int i = 1; i < argc; i++) {
+		if (strcmp(argv[i], "--stage") == 0) {
+			if (i + 1 < argc) {
+				expected_stage = atoi(argv[i + 1]);
+				memmove(&argv[i], &argv[i + 2], (argc - i - 1) * sizeof(char *));
+				argc -= 2;
+				i--;
+			} else {
+				ksft_exit_fail_msg("Option --stage requires an argument\n");
+			}
+		}
+	}
+
+	luo_fd = luo_open_device();
+	if (luo_fd < 0)
+		ksft_exit_skip("Failed to open %s (%s) device. Is LUO enabled?\n",
+			       LUO_DEVICE, strerror(errno));
+
+	session = luo_retrieve_session(luo_fd, STATE_SESSION_NAME);
+	if (session == -ENOENT)
+		stage = 1;
+	else if (session >= 0)
+		stage = 2;
+	else
+		ksft_exit_fail_perror("Failed to check for state session");
+
+	if (expected_stage && expected_stage != stage)
+		ksft_exit_fail_msg("Stage mismatch: expected %d, got %d\n",
+				   expected_stage, stage);
+
+	if (stage == 1)
+		create_state_file(luo_fd, STATE_SESSION_NAME, STATE_MEMFD_TOKEN, 2);
+
+	test_harness_run(argc, argv);
+}
-- 
2.53.0.1213.gd9a14994de-goog

