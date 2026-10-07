Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21BA239D3FD
	for <linux-kselftest@vger.kernel.org>; Wed,  7 Oct 2026 11:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791373729; cv=none; b=gp2K+MylkpBPpUbDlG2Lg/dt2XiLrb3L3ErNHXSemHPnnHVayrRXhydRKpLJlUjowCfQNewueMHifHBrny2MJzHowR4ZBhS3prIbgpgmoLbzfuK8BWifLH0YFsv2o0oYUfekyDXRY8khTnVzGqNoqdOEguo7zYLQeKe4WI/dBJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791373729; c=relaxed/simple;
	bh=gIaTyk5W0brwPCMp283WK+OpliUHp2YXuHMsiDXA1dw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TuQ5GmGJbYajLsHszqA46NJijp7153tdReABxlhJoYaR5YJcN7LyCWHObALr0T8Ymmyvnz+aqX1UCSfDc09yQd8vw17J/TGr60lqDO2M6fkWMn0EU0YoNS/2oZZHJl8oqWdyET1dfX/vVQFChsMCjRL5UxWvidiosYi/cMx5EH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U7l+Zla/; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U7l+Zla/"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-886e61fa30fso728863b3a.1
        for <linux-kselftest@vger.kernel.org>; Wed, 07 Oct 2026 04:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791373717; x=1791978517; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sWMIGXFkPMPmBZIlItDDaoveYneHjrBFtGWysWCizdk=;
        b=U7l+Zla/CkFegdajnteKQ0W4OsIAIStkFnTTQDpCia/ohxlppXgoQjbmhDSTF+xoYq
         lf6MRl3B6ZGSboNEgxbBNiFTyeRpMIj7LQtawSaQ0vasxlzvM/gD2zyem7aQrEj2xlBZ
         aX+87HD1mtJTqSUE5zC4iGiuGOkIityyq7pZwr49E/z+xz1qFqHHG0PULhlhBWypFBKD
         vFxlvCuQyGn9ydGMR/GVNP0cqXLOrQgFwVB1Z7On7XWGO4VNDUM3gWv29J4zZs9f1yUX
         jE3U1w56cSCVgTntefARj8OPwW6QSAhhlVfuvih9Z0ODFB2Rvoi7syuO8X5G9/Gd6ox1
         8OmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791373717; x=1791978517;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sWMIGXFkPMPmBZIlItDDaoveYneHjrBFtGWysWCizdk=;
        b=lxcUxF+TNn+oCa/t6WaVy2SXxlXUMxHqRJPTKTwjGGhaph4r+GC/gPrSmCm8z/fV0c
         qle4sK/2tdio+2iYhKui8Qvgxb3lrbrbgnnmr3SHYbW2TccZavRk6KiAvaMacSfmLIqI
         ece7vI2lSxm43mIQjzhgIAowyJRMk9XcfSVs3J016w1/H9PbfcOlmGJ00fUXYXaEqMT/
         BXgqJRMIucvIfDLZCgVFNH++3g6GKTij1q1xVRW77wgPPnaqjIQTu3AlQH1/BH2kBMtH
         k+uSAcfdQkjhLOc47HJCFbNbs6+T3KEfddY9/4eMw1qf4SaEjHXqhiz3sleBRaPmJY6E
         M88A==
X-Forwarded-Encrypted: i=1; AKwUvBzkPxFRAUJKIskVFlW1pxgOu0RgvJLtb4mNKI4oF/IR90YueYY+nwi2nfOW7Id4PoAUy7S23P4DTgwgUd3witY=@vger.kernel.org
X-Gm-Message-State: AFuF++m3DZIr+3RKRg9sDUiAdHsQUvbTp5dtlHry+A+VfD0wrxXWTdYm
	yUxy+QmbcV4pNe3JgvW0aAEACa6mRYgx1enh4mbNjAGqVsGT3HgPRh5t
X-Gm-Gg: AYBFou1Q+oYtM2sXlwG+hF+bNtDTSwlmhw7P9mNOyXkZo3KiCEVLuHnneDJu2PPx1TM
	kW7NKOhaTQXBnuSvS7Tj9QW+kzGraxI2gYnRgbF3biIzYayNw7N1rCUzRd2S+V6/a5vhFNLZXmT
	ntnbTEkwLciB9HhGeE94HrfOGVHkfhhvZ8fkD3xJ2OqOYpkOzfblg2r5HIjSl8D+joCcp4S2yh4
	d63yFU7JGLmC4TfG+ZK2yn5oc1ZIJQ6h+pVeMJx5p3Jj6+trsp+FE4srOb157Qh/ntEY8Ud41EH
	bFMMWw4yjTXQhHv5lNHLJLtANjPWiDIOZ5T/lxYaqw4eiAmuNdfGfDQQ8+J0zfZVnTiG+jSg3w2
	Z2+8rMQglsT4yy5u0a2HZYVv7aDDY6oGkf5pQ/he0CXW5+BmKiLJaedYuJMhkJhXKCKunGxmoH7
	eIhfLrX3JD/CLQXlCjZENnSWTGZW52z+3WMK3824Rkge0MLPrCyd/vTuy0vbnF8F84fIhHK1CGV
	rZ+q7w1MxzAepC1V+/JUrB32ow=
X-Received: by 2002:a05:6a00:9504:b0:881:ac65:715e with SMTP id d2e1a72fcca58-891b5bcd274mr1520415b3a.58.1791373717127;
        Wed, 07 Oct 2026 04:48:37 -0700 (PDT)
Received: from obadmin-Precision-3680.atlascopco.group ([167.103.3.1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89188ff2376sm1192645b3a.25.2026.10.07.04.48.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 04:48:36 -0700 (PDT)
From: Sahaj Chaudhari <sahaj123.sc@gmail.com>
To: Christian Brauner <brauner@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Sahaj Chaudhari <sahaj123.sc@gmail.com>
Subject: [PATCH] selftests: pid_namespace: test fork with dead ancestor
Date: Wed,  7 Oct 2026 17:19:14 +0530
Message-ID: <20261007114914.1668934-1-sahaj123.sc@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a regression test for fork() into a PID namespace whose parent
namespace has lost its init process. Since the kernel cannot assign the
new process a PID in that dead ancestor, fork() must fail with ENOMEM.

Create the nested PID namespaces, keep the child namespace handle open
after its init process exits, then enter it and verify fork() fails.

Register the test with the PID namespace selftests and ignore its
generated binary. Skip when namespace operations are denied or procfs
cannot provide the pid_for_children handle.

Signed-off-by: Sahaj Chaudhari <sahaj123.sc@gmail.com>
---
 .../selftests/pid_namespace/.gitignore        |   1 +
 .../testing/selftests/pid_namespace/Makefile  |   2 +-
 .../pid_namespace/pidns_dead_ancestor.c       | 174 ++++++++++++++++++
 3 files changed, 176 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/pid_namespace/pidns_dead_ancestor.c

diff --git a/tools/testing/selftests/pid_namespace/.gitignore b/tools/testing/selftests/pid_namespace/.gitignore
index c647c6eb33672..b87295802a73c 100644
--- a/tools/testing/selftests/pid_namespace/.gitignore
+++ b/tools/testing/selftests/pid_namespace/.gitignore
@@ -1,3 +1,4 @@
 pid_max
+pidns_dead_ancestor
 pidns_init_via_setns
 regression_enomem
diff --git a/tools/testing/selftests/pid_namespace/Makefile b/tools/testing/selftests/pid_namespace/Makefile
index b01a924ac04bd..3199e6bebbdd8 100644
--- a/tools/testing/selftests/pid_namespace/Makefile
+++ b/tools/testing/selftests/pid_namespace/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 CFLAGS += -g $(KHDR_INCLUDES)
 
-TEST_GEN_PROGS = regression_enomem pid_max pidns_init_via_setns
+TEST_GEN_PROGS = regression_enomem pid_max pidns_dead_ancestor pidns_init_via_setns
 
 LOCAL_HDRS += $(selfdir)/pidfd/pidfd.h
 
diff --git a/tools/testing/selftests/pid_namespace/pidns_dead_ancestor.c b/tools/testing/selftests/pid_namespace/pidns_dead_ancestor.c
new file mode 100644
index 0000000000000..7524d4975ec75
--- /dev/null
+++ b/tools/testing/selftests/pid_namespace/pidns_dead_ancestor.c
@@ -0,0 +1,174 @@
+// SPDX-License-Identifier: GPL-2.0
+#define _GNU_SOURCE
+
+#include <errno.h>
+#include <fcntl.h>
+#include <sched.h>
+#include <signal.h>
+#include <stdio.h>
+#include <sys/mman.h>
+#include <sys/types.h>
+#include <sys/wait.h>
+#include <unistd.h>
+
+#include "kselftest_harness.h"
+
+#define STACK_SIZE (1024 * 1024)
+
+struct pidns_init_args {
+	int ready_read;
+	int ready_write;
+	int release_read;
+	int release_write;
+};
+
+static int pidns_init(void *data)
+{
+	struct pidns_init_args *args = data;
+	char release;
+	int error = 0;
+
+	close(args->ready_read);
+	close(args->release_write);
+	if (unshare(CLONE_NEWPID))
+		error = errno;
+	if (write(args->ready_write, &error, sizeof(error)) != sizeof(error))
+		return 1;
+	close(args->ready_write);
+	if (error)
+		return 0;
+	if (read(args->release_read, &release, sizeof(release)) != sizeof(release))
+		return 1;
+	close(args->release_read);
+	return 0;
+}
+
+static int create_unborn_pidns(void)
+{
+	struct pidns_init_args args;
+	char path[64], release = 0;
+	void *stack;
+	pid_t child;
+	int ready[2], release_pipe[2], error, status, nsfd = -1;
+	ssize_t n;
+
+	if (pipe(ready))
+		return -1;
+	if (pipe(release_pipe)) {
+		error = errno;
+		close(ready[0]);
+		close(ready[1]);
+		errno = error;
+		return -1;
+	}
+
+	stack = mmap(NULL, STACK_SIZE, PROT_READ | PROT_WRITE,
+		     MAP_PRIVATE | MAP_ANONYMOUS | MAP_STACK, -1, 0);
+	if (stack == MAP_FAILED) {
+		error = errno;
+		close(ready[0]);
+		close(ready[1]);
+		close(release_pipe[0]);
+		close(release_pipe[1]);
+		errno = error;
+		return -1;
+	}
+
+	args = (struct pidns_init_args) {
+		.ready_read = ready[0],
+		.ready_write = ready[1],
+		.release_read = release_pipe[0],
+		.release_write = release_pipe[1],
+	};
+	child = clone(pidns_init, stack + STACK_SIZE, CLONE_NEWPID | SIGCHLD,
+		      &args);
+	if (child < 0)
+		goto err_munmap;
+
+	close(ready[1]);
+	close(release_pipe[0]);
+	n = read(ready[0], &error, sizeof(error));
+	if (n != sizeof(error)) {
+		error = n < 0 ? errno : EIO;
+		goto release_child;
+	}
+	if (error)
+		goto release_child;
+
+	snprintf(path, sizeof(path), "/proc/%d/ns/pid_for_children", child);
+	nsfd = open(path, O_RDONLY | O_CLOEXEC);
+	if (nsfd < 0) {
+		error = errno;
+		goto release_child;
+	}
+
+release_child:
+	write(release_pipe[1], &release, sizeof(release));
+	close(release_pipe[1]);
+	close(ready[0]);
+	if (waitpid(child, &status, 0) != child || !WIFEXITED(status) ||
+	    WEXITSTATUS(status)) {
+		if (!error)
+			error = ECHILD;
+		if (nsfd >= 0)
+			close(nsfd);
+		nsfd = -1;
+	}
+	munmap(stack, STACK_SIZE);
+	if (error) {
+		errno = error;
+		return -1;
+	}
+	return nsfd;
+
+err_munmap:
+	error = errno;
+	munmap(stack, STACK_SIZE);
+	close(ready[0]);
+	close(ready[1]);
+	close(release_pipe[0]);
+	close(release_pipe[1]);
+	errno = error;
+	return -1;
+}
+
+TEST(pidns_dead_ancestor_rejects_fork)
+{
+	int original_fd, target_fd, fork_errno, ret;
+	pid_t child;
+
+	target_fd = create_unborn_pidns();
+	if (target_fd < 0) {
+		if (errno == ENOENT)
+			SKIP(return, "PID namespace handle unavailable through procfs\n");
+		if (errno == EPERM || errno == EACCES || errno == EINVAL)
+			SKIP(return, "PID namespace creation requires privileges\n");
+		ASSERT_GE(target_fd, 0);
+	}
+
+	original_fd = open("/proc/self/ns/pid_for_children", O_RDONLY | O_CLOEXEC);
+	ASSERT_GE(original_fd, 0);
+	ret = setns(target_fd, CLONE_NEWPID);
+	if (ret) {
+		if (errno == EPERM || errno == EACCES)
+			SKIP(return, "setns into PID namespace requires privileges\n");
+	}
+	ASSERT_EQ(0, ret);
+
+	child = fork();
+	fork_errno = errno;
+	if (child == 0)
+		_exit(0);
+
+	if (child > 0)
+		ASSERT_EQ(child, waitpid(child, NULL, 0));
+	ret = setns(original_fd, CLONE_NEWPID);
+	close(original_fd);
+	close(target_fd);
+	ASSERT_EQ(0, ret);
+
+	ASSERT_EQ(-1, child);
+	ASSERT_EQ(ENOMEM, fork_errno);
+}
+
+TEST_HARNESS_MAIN
