Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 762E039890A
	for <linux-kselftest@vger.kernel.org>; Tue, 13 Oct 2026 06:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791874055; cv=none; b=NQQz2GiNGPfi5SgObrFnxsX4LWincRLiuXok/W+kTAY1Xdg7e3OeIeziYiKlGmDp6P7YQ914r32SGUQ3ygbIWJ3WnW85UypWleOti4T2SlB8xMMMycnWYaW8UMUNdpVCAvSnFn7aHD0X0t8J424DrvmpUP3z6iO3voTlTwwX9lE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791874055; c=relaxed/simple;
	bh=G8k1ARucNhABhvPBrGiPOoMqDK8wFePs1k6MrV7Hm0I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YMoSiTQGeKU5WVYB/87oKX2NSf9A+uNTuQyowN3dgPnNRIA9Fvh8O2img9wiAcrOITKlzqUOYlId8Gv6vFjdu6oxseXFFhA7mrVeGBFLP108c7zv2j+hFeAXFQ48AQnuIDBE30r/uOAjfoc1mEfGRQaTsgAEwPLUtWMWNSPXR9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ozrYyjqo; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ozrYyjqo"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cc1d57602e8so908319a12.3
        for <linux-kselftest@vger.kernel.org>; Mon, 12 Oct 2026 23:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791874054; x=1792478854; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TS1bnNj6YPEDGh6hu3tHyNWvKwTMGGGvQBMH8h5yo6I=;
        b=ozrYyjqoWSkKe/2tO7TN3Rbk7iCBghtfSwnpqInmDRv1NpqpG1nQlIgKoEMlqkbR6o
         XiL8wiWxbOCB//Zeebu/0wyt3Vfcb7/XyF99j+woqwvIQd+7n8S7wZT7JHBH5yc/a5HT
         mPFtP3BeFqiKl0YrMNWdBe0+u6afyj8almk/J/VVh2sxrOYW6jKE/VrvRr5iNSt31PTB
         /+zWfXZYJ8ENObQtnU7XCocsYyTGVoESIx/NKYNEesHz6NkIEC8faPtW8SCufQsOCc1m
         nV8XkuxxhohydKiLdWb9RASASFMyvC7qEzhqHQigE4FpZdLNnA63UIbRzRmfmZmKmdFF
         SL0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791874054; x=1792478854;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TS1bnNj6YPEDGh6hu3tHyNWvKwTMGGGvQBMH8h5yo6I=;
        b=JQSoPcKgHb7+fXV4I9s2nvhQ8e7T4aYBOfUen8sIgY2dfAhNeXA6UiXj8MDuMsXCst
         wj6uyzwKznkCAoDJciuLwC3xx52IARlNyhBXchnyRr4Zfs2jmhA87ZHB7Et9nRiNfu8+
         fFjK+rUjDYou1xaIM2UWDD7djWUE5v2IeLxjUrje/QjrHkik58mrtPnJvSHnAOGwTUL2
         xt/vJ2Y1yy22vIv2aU4oxY4140CUDxG4YGPiwm7+IqENGNiDZYUPZYDZ+aM45dfAJ5n1
         zwB4Z2MuNaTf0q1ybM3OzKJlJ20fVS6B1jlJZzPK1zPko1ovnbhsTUnGHrCqZQTtTttv
         kCIA==
X-Forwarded-Encrypted: i=1; AKwUvBzlcr6SSrmxOKQm42Q/rIn24HaMEULT/TwEXPyezqmFMgmErYgZqnuLfGCnBLQPAyslq3tNO1kIyOPSbgmfsO4=@vger.kernel.org
X-Gm-Message-State: AFq9FYISOY8ejEGw6IeDz4X7eBG0nTpVT8z2e8o/p3WAKke0q4JYH3s9
	H3Q17giJLErFoOXMO4eKRtz/YR4QeiyhUOvnfuWYJmsrng/DAX20RP5k
X-Gm-Gg: AYBFou1wfFPbFPROaFpfS5rrtOf/3rehjhS8MF4zFEKFtN8uzLD5xzmXvkQFiZv8tLy
	iW/jvL4Bxh/A0nBuqbc2uyGNkG0ophByKQ47YFqjfUP04WJeF3PfFVe2lR0MAK/PcfjQPte0peJ
	qX96EzSt2OAmjRSIhKM552ESXe8MpKfTum7xYbgC6+FvSu5svuqA6kcdT9xT7ZbgI4PPtyDtAOO
	aXvrieVwH5AS2IYV5++V2iws5pNInorLAreTvmODPyzYWrjluzicfO9iAZF2Ba9roDq0p6zsh+T
	gQoRCe6042cl48WxVf+Zd22PeAslZIfK7DiRrWjCIiwhFbvxCSvCEXFhRmDyDra9oGoQwvIvP21
	OcRxQFCBV+cPcjWfGKRIWTKG1OUeaBLC+kGUS+u5HNLa1U4lwJd4eMUlboIY+EtIusVcz2QOs1s
	OdEXbBGfbIJ3hQQjynEGScFQLVC30SzTiv3CMXyOhMcPco4jsXDXhDbSnRi06X3RCL+hdcCONcR
	e+/ghW1E3LvlpWOuwIl9nFIt0qHHaFV6+vqnibZTJtC
X-Received: by 2002:a17:90b:5444:b0:3aa:f2c4:12df with SMTP id 98e67ed59e1d1-3ab3a236ca5mr9333642a91.9.1791874053712;
        Mon, 12 Oct 2026 23:47:33 -0700 (PDT)
Received: from obadmin-Precision-3680.atlascopco.group ([167.103.3.1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac38b36fcesm1577115a91.2.2026.10.12.23.47.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 23:47:33 -0700 (PDT)
From: Sahaj Chaudhari <sahaj123.sc@gmail.com>
To: tj@kernel.org,
	hannes@cmpxchg.org,
	mkoutny@suse.com,
	shuah@kernel.org
Cc: cgroups@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] selftests/cgroup: test pids.events notification
Date: Tue, 13 Oct 2026 12:18:12 +0530
Message-ID: <20261013064812.875787-1-sahaj123.sc@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a selftest for pids.events notifications. When pids_localevents is
enabled, a fork rejected by pids.max must increment pids.events and
generate an IN_MODIFY inotify event on that file.

The test creates a cgroup with pids.max set to 1, watches its pids.events
file, moves itself into the cgroup and forces a rejected fork. It then
checks both the counter and the notification. It skips when cgroup v2 is
not mounted, pids_localevents is not enabled or the pids controller is
unavailable.

Check for a failed read() of the inotify event before comparing its
signed ssize_t result with sizeof(struct inotify_event). Otherwise -1 is
converted to a large unsigned length and the uninitialized event buffer
is inspected.

Signed-off-by: Sahaj Chaudhari <sahaj123.sc@gmail.com>
---
Changes since v2:
- v2 was mistakenly sent as an incremental delta on top of v1. This v3 is
  the complete patch, replacing both v1 and v2.
- Check for a failed inotify read() before comparing the signed result
  with sizeof(struct inotify_event) (the v2 change).

Testing:
- Built with make -C tools/testing/selftests TARGETS=cgroup.
- On an x86 host the test skips: its cgroup2 mount lacks pids_localevents.
- On an AM642 board (6.12.57) the test fails with a timeout waiting for
  the notification. That kernel lacks commit 1765a153d985 ("cgroup/pids:
  Restore pids.events notifications in local mode"), so this is expected.

v1: https://lore.kernel.org/all/20261007063516.1192279-1-sahaj123.sc@gmail.com/
v2: https://lore.kernel.org/all/20261012095011.3188830-1-sahaj123.sc@gmail.com/

 tools/testing/selftests/cgroup/.gitignore     |   1 +
 tools/testing/selftests/cgroup/Makefile       |   2 +
 .../selftests/cgroup/test_pids_local_events.c | 143 ++++++++++++++++++
 3 files changed, 146 insertions(+)
 create mode 100644 tools/testing/selftests/cgroup/test_pids_local_events.c

diff --git a/tools/testing/selftests/cgroup/.gitignore b/tools/testing/selftests/cgroup/.gitignore
index 952e4448bf070..0a00eaab14cb1 100644
--- a/tools/testing/selftests/cgroup/.gitignore
+++ b/tools/testing/selftests/cgroup/.gitignore
@@ -8,5 +8,6 @@ test_kill
 test_kmem
 test_memcontrol
 test_pids
+test_pids_local_events
 test_zswap
 wait_inotify
diff --git a/tools/testing/selftests/cgroup/Makefile b/tools/testing/selftests/cgroup/Makefile
index e01584c2189ac..e494487307418 100644
--- a/tools/testing/selftests/cgroup/Makefile
+++ b/tools/testing/selftests/cgroup/Makefile
@@ -16,6 +16,7 @@ TEST_GEN_PROGS += test_kill
 TEST_GEN_PROGS += test_kmem
 TEST_GEN_PROGS += test_memcontrol
 TEST_GEN_PROGS += test_pids
+TEST_GEN_PROGS += test_pids_local_events
 TEST_GEN_PROGS += test_zswap
 
 LOCAL_HDRS += $(selfdir)/clone3/clone3_selftests.h $(selfdir)/pidfd/pidfd.h
@@ -32,4 +33,5 @@ $(OUTPUT)/test_kill: $(LIBCGROUP_O)
 $(OUTPUT)/test_kmem: $(LIBCGROUP_O)
 $(OUTPUT)/test_memcontrol: $(LIBCGROUP_O)
 $(OUTPUT)/test_pids: $(LIBCGROUP_O)
+$(OUTPUT)/test_pids_local_events: $(LIBCGROUP_O)
 $(OUTPUT)/test_zswap: $(LIBCGROUP_O)
diff --git a/tools/testing/selftests/cgroup/test_pids_local_events.c b/tools/testing/selftests/cgroup/test_pids_local_events.c
new file mode 100644
index 0000000000000..59885901fbf51
--- /dev/null
+++ b/tools/testing/selftests/cgroup/test_pids_local_events.c
@@ -0,0 +1,143 @@
+// SPDX-License-Identifier: GPL-2.0
+#define _GNU_SOURCE
+
+#include <errno.h>
+#include <fcntl.h>
+#include <linux/limits.h>
+#include <poll.h>
+#include <stdbool.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/inotify.h>
+#include <sys/wait.h>
+#include <unistd.h>
+
+#include "cgroup_util.h"
+#include "kselftest.h"
+
+static int test_pids_events_notify(const char *root)
+{
+	union {
+		struct inotify_event align;
+		char bytes[sizeof(struct inotify_event) + NAME_MAX + 1];
+	} event_buf;
+	struct pollfd pfd;
+	char *cgroup = NULL, *events_path = NULL;
+	const char *reason = "pids.events did not notify after a rejected fork";
+	bool moved = false;
+	int inotify_fd = -1, ret = KSFT_FAIL, watch;
+	ssize_t n;
+	pid_t child;
+
+	cgroup = cg_name(root, "pids_local_events_notify");
+	if (!cgroup) {
+		reason = "failed to allocate cgroup path";
+		goto cleanup;
+	}
+	if (cg_create(cgroup)) {
+		reason = "failed to create test cgroup";
+		goto cleanup;
+	}
+	if (cg_write(cgroup, "pids.max", "1")) {
+		reason = "failed to set pids.max";
+		goto cleanup;
+	}
+
+	if (asprintf(&events_path, "%s/pids.events", cgroup) < 0) {
+		reason = "failed to allocate pids.events path";
+		goto cleanup;
+	}
+	inotify_fd = inotify_init1(IN_CLOEXEC | IN_NONBLOCK);
+	if (inotify_fd < 0) {
+		reason = "inotify_init1 failed";
+		goto cleanup;
+	}
+	watch = inotify_add_watch(inotify_fd, events_path, IN_MODIFY);
+	if (watch < 0) {
+		reason = "inotify_add_watch on pids.events failed";
+		goto cleanup;
+	}
+
+	if (cg_enter_current(cgroup)) {
+		reason = "failed to move test into cgroup";
+		goto cleanup;
+	}
+	moved = true;
+
+	child = fork();
+	if (child == 0)
+		_exit(0);
+	if (child > 0) {
+		waitpid(child, NULL, 0);
+		reason = "fork succeeded despite pids.max";
+		goto cleanup;
+	}
+	if (errno != EAGAIN) {
+		reason = "fork failed for a reason other than pids.max";
+		goto cleanup;
+	}
+
+	if (cg_read_key_long(cgroup, "pids.events", "max ") != 1) {
+		reason = "pids.events did not count the rejected fork";
+		goto cleanup;
+	}
+
+	pfd.fd = inotify_fd;
+	pfd.events = POLLIN;
+	if (poll(&pfd, 1, 1000) <= 0) {
+		reason = "timed out waiting for pids.events notification";
+		goto cleanup;
+	}
+	n = read(inotify_fd, event_buf.bytes, sizeof(event_buf.bytes));
+	if (n < 0) {
+		reason = "failed to read pids.events notification";
+		goto cleanup;
+	}
+	if ((size_t)n < sizeof(struct inotify_event) ||
+	    !(event_buf.align.mask & IN_MODIFY)) {
+		reason = "received no pids.events modify notification";
+		goto cleanup;
+	}
+	if (cg_read_key_long(cgroup, "pids.events", "max ") != 1) {
+		reason = "pids.events did not count the rejected fork";
+		goto cleanup;
+	}
+
+	ret = KSFT_PASS;
+
+cleanup:
+	if (inotify_fd >= 0)
+		close(inotify_fd);
+	if (moved)
+		cg_enter_current(root);
+	if (cgroup)
+		cg_destroy(cgroup);
+	free(events_path);
+	free(cgroup);
+	if (ret != KSFT_PASS)
+		ksft_print_msg("%s\n", reason);
+	return ret;
+}
+
+int main(void)
+{
+	char root[PATH_MAX];
+	int ret;
+
+	ksft_print_header();
+	if (cg_find_unified_root(root, sizeof(root), NULL))
+		ksft_exit_skip("cgroup v2 isn't mounted\n");
+	if (proc_mount_contains("pids_localevents") <= 0)
+		ksft_exit_skip("mount cgroup2 with pids_localevents to run this test\n");
+	if (cg_read_strstr(root, "cgroup.controllers", "pids"))
+		ksft_exit_skip("pids controller isn't available\n");
+	if (cg_read_strstr(root, "cgroup.subtree_control", "pids") &&
+	    cg_write(root, "cgroup.subtree_control", "+pids"))
+		ksft_exit_skip("failed to enable pids controller\n");
+
+	ksft_set_plan(1);
+	ret = test_pids_events_notify(root);
+	ksft_test_result_report(ret, "pids.events notifies on a rejected fork\n");
+	ksft_finished();
+}
-- 
2.43.0

