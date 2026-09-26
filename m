Received: from mail-dl2-f43.google.com (mail-dl2-f43.google.com [74.125.229.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C6037A839
	for <linux-kselftest@vger.kernel.org>; Sat, 26 Sep 2026 04:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790398553; cv=none; b=VP45bxpIaL4OhzZDFEcsAGZBuKo7my1CK6n9ZgPYzseaXNsdcKNrb3Th5U8pW+7/izM1BcK+aV5TatxQCnw2D3+gduZYO8tvJ42DihKi4yQtTsiTgsne86wZ8rlNfRXyqI2zu6jEncEc7RbbTGV1kxceeJAk84jPfmdv3r2Mruk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790398553; c=relaxed/simple;
	bh=PqFQoeQkKTbnQLcJbJhboszdzWxvj0oycYGbQkczc7c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hOb8KLq2oy27q+xW7iwtuZ/mfphqcNqNUdKkQdWJ9P+3GB3KUYaC9f7JAX/oSEdwvXJH3DbIVh20KKEEqVp0Ec2LtbTB4VdCynCRtn9nnvk1GxaoT8oXBzxamqd2yvNkY5/lPVx6wDkHZ8OMNZivhqwaEl/mZcLKxGVDJ0mwCbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hKK16ZLh; arc=none smtp.client-ip=74.125.229.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hKK16ZLh"
Received: by mail-dl2-f43.google.com with SMTP id a92af1059eb24-144f9160b81so541060c88.0
        for <linux-kselftest@vger.kernel.org>; Fri, 25 Sep 2026 21:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790398549; x=1791003349; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xDtVatxeBg9lmU3k+OE2/mtqIH1eOlLZQ5/IeR3PaDg=;
        b=hKK16ZLhsSh8Fz9JLsqyMUyx2678FwoqHc9k8GAMoOLNAyu3XNuRRvn6GhzQgdHziK
         7WYIQfSGiG0xi6MUnWindCBR6jm1XbiXXjE+l/I8CYIaSgyPBjK7vCJwvDNFDinklUpm
         bFS8t9hTotFQFSyCfD7iS++amp0UQetV43CW6InNwlxDZaVl4UtNzjKwyKjjGRK1M1yG
         xrTbc8tTE2raQCsdXExsPXF6u4ZHFkx7O6+wjfG73PfaIUAWX1KjClQ9xLT+DE0go1R2
         eQCCSMI2lrCa0xDjM8cQPvG2VRkaUvM1go7I3omyPLU+RO7qK4zZMvuoWc19J+9U/QXP
         nZtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790398549; x=1791003349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xDtVatxeBg9lmU3k+OE2/mtqIH1eOlLZQ5/IeR3PaDg=;
        b=Jn+ANPle/fWQAxfRKNJgEqrNxHd6XdVc/4UHThasRuYN3WF1Dl6n32iIVlkWE52TGF
         CDgRb9I0L3avbJ/LhO+itxgHcvgz087qOBH3uwrq3l+akZXxSt7Ei1lCh4LuMA1NSoTm
         4jUJBKHrtiQQKvSOLj+PpiwmS4vT3Iq869W58rRWfuoinLS293FLAZNh8LG9e/eEtmEt
         bMA397poIo4PhsaPFUTYJPkCyx1yIA3LYNaOdk/E/Wb/yLVCLiyBgLhYLAQoyKD5PmV5
         8dPXjbNKAZSJipwLstK9vZPNAFhxoTyYyATC/x9xYBa4JQCYFFa+tYGWwOPbryyAPFyZ
         h9xQ==
X-Forwarded-Encrypted: i=1; AKwUvBw0ATw7UhzZe20Ei2c4vYGc1qAqaioglbHWFd+mlrajZaGObO0DnlXO0T6vN8SHhf5uD5vSxV81cQh6heS+e2c=@vger.kernel.org
X-Gm-Message-State: AFuF++nlTRguMuDYg/A3F3OLORtBvDJpPQ+TJ6EOhn+Viy/QGDH6/+o1
	ZGwpFSQwgqeWGjS4JnbCkDNu0Kw1eFS50LAeT+9TgxrvMew+o1en4PKc
X-Gm-Gg: AYBFou0spatwAj/LBNqZccaa0e+SdA7U4xRQjFcDatx2jqc2E9RABv7gZYJpBKCNiKX
	t6wmLOjZ2lgIoMnKrbVcT0IZZgvmer6aHZ9QTckq39zPRh7J+kXv2vrtC6gNh5kS/AVf4T3ST7Y
	Jpvlm/F+t3X09uaySnYhlfJFys1zsyH78ttAry1Gq7BsCFfXUFmf9geatCnvSEDdQajR0wc0dN5
	YnN2cVaDpZ+uXxAwMkKiuru6VpWnuzM1GnqlTdmknQt0JHtX4HzzTbzGjrveTKjIkEpw9fg0zUn
	3yoAh/W/9AeDXAfMGmLYG2ZMYKuj5D0DGDNSSmszwealkSDWj1YxYiZp1/x4lcxeZabWTjMZJ7K
	fWMltMWx/YbEqLFPjT0ShS/tiKKvK6ale4UhMu23z1W5IJf1FxOXUNG0ZUCrb+sdmXrlpjWrdCr
	r2jx8YTKpZQuUWVLBUbQSSbqG6EGuUEPd87Sm2HEK2NHKrFgIX6guyORTO7BXFwviwTag26Sfj8
	M9eoK1oxHHPI1CjSs7ilsZ4T/iKoW7oLsIC2PWJPc++gycY1LYFw1GmRdh1Ajzg80IoE+Iy41Vf
	dxVvQ6/bC4Najb6Jc24MoL6l39t2LMOksbAkqL4AK1bG3y7OTOiI0Prc5ns=
X-Received: by 2002:a05:7022:7f04:b0:143:296a:4e57 with SMTP id a92af1059eb24-146cfec8e16mr1636662c88.26.1790398548338;
        Fri, 25 Sep 2026 21:55:48 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145adcc5b00sm9334211c88.15.2026.09.25.21.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 21:55:47 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Shuah Khan <shuah@kernel.org>
Cc: Matthias Goergens <matthias.goergens@gmail.com>,
	Minchan Kim <minchan@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Chris Li <chrisl@kernel.org>,
	Kairui Song <kasong@tencent.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Yosry Ahmed <yosry@kernel.org>,
	Nhat Pham <nphamcs@gmail.com>,
	linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [RFC PATCH v2 3/4] selftests: zram: cover offload-only swap policy
Date: Sat, 26 Sep 2026 12:55:16 +0800
Message-ID: <20260926045517.3458413-4-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260926045517.3458413-1-matthias.goergens@gmail.com>
References: <20260926045517.3458413-1-matthias.goergens@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add zram tests for proactive offload, fallback to conventional swap under
ordinary pressure, zswap bypass, discard policy and data recovery after
swapoff. Pin reclaim transitions to one CPU to exercise cached-cluster
eligibility changes, and use conventional swap as a positive zswap control.
Check that discard-once takes precedence when both discard modes are set.

Check that offload-only capacity preserves file workingset activation
with a calibrated refault workload. Wait for memory.stat to reflect the
initial footprint before reclaim, and distinguish insufficient calibration
from helper failures.

Skip unsupported kernels and cgroup setups. Restore swap devices,
controller delegation and modified zswap/MGLRU settings on exit. These
tests require an exclusive environment because swap priorities and some
of the settings are global.

Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
---
 tools/testing/selftests/zram/.gitignore       |   2 +
 tools/testing/selftests/zram/Makefile         |   4 +-
 tools/testing/selftests/zram/README           |  14 +-
 tools/testing/selftests/zram/config           |   6 +-
 tools/testing/selftests/zram/swap_offload.c   | 222 ++++++++++++++++++
 .../selftests/zram/workingset_offload.c       | 207 ++++++++++++++++
 tools/testing/selftests/zram/zram03.sh        | 174 ++++++++++++++
 tools/testing/selftests/zram/zram04.sh        | 164 +++++++++++++
 tools/testing/selftests/zram/zram_lib.sh      |  28 +++
 9 files changed, 817 insertions(+), 4 deletions(-)
 create mode 100644 tools/testing/selftests/zram/swap_offload.c
 create mode 100644 tools/testing/selftests/zram/workingset_offload.c
 create mode 100755 tools/testing/selftests/zram/zram03.sh
 create mode 100755 tools/testing/selftests/zram/zram04.sh

diff --git a/tools/testing/selftests/zram/.gitignore b/tools/testing/selftests/zram/.gitignore
index 088cd9bad87a..74b0217c60f0 100644
--- a/tools/testing/selftests/zram/.gitignore
+++ b/tools/testing/selftests/zram/.gitignore
@@ -1,2 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
 err.log
+swap_offload
+workingset_offload
diff --git a/tools/testing/selftests/zram/Makefile b/tools/testing/selftests/zram/Makefile
index 7f78eb1b59cb..781d10a20e56 100644
--- a/tools/testing/selftests/zram/Makefile
+++ b/tools/testing/selftests/zram/Makefile
@@ -1,9 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0
 all:
 
-TEST_PROGS := zram.sh
+TEST_GEN_FILES := swap_offload workingset_offload
+TEST_PROGS := zram.sh zram03.sh zram04.sh
 TEST_FILES := zram01.sh zram02.sh zram_lib.sh
 EXTRA_CLEAN := err.log
 
 include ../lib.mk
-
diff --git a/tools/testing/selftests/zram/README b/tools/testing/selftests/zram/README
index 82921c75681c..cd7f389ed3c6 100644
--- a/tools/testing/selftests/zram/README
+++ b/tools/testing/selftests/zram/README
@@ -21,10 +21,22 @@ ZRAM Testcases
 zram_lib.sh: create library with initialization/cleanup functions
 zram.sh: For sanity check of CONFIG_ZRAM and to run zram01 and zram02
 
-Two functional tests: zram01 and zram02:
+The legacy runner executes two functional tests:
 zram01.sh: creates general purpose ram disks with ext4 filesystems
 zram02.sh: creates block device for swap
 
+Offload-only swap tests, registered separately:
+zram03.sh: checks proactive routing, pressure fallback and zswap bypass
+zram04.sh: checks file workingset activation with offload-only swap
+
+Run these tests as root in an exclusive disposable VM with the offload-only
+swap policy and the options listed in config. They change global swap,
+zswap and reclaim settings. Use the initial cgroup namespace with an
+unrestricted cgroup v2 memory hierarchy mounted at /sys/fs/cgroup. A child's
+memory.zswap.writeback value does not reveal restrictions in its ancestors.
+
+zram04 needs a disk-backed TMPDIR.
+
 Commands required for testing:
  - bc
  - dd
diff --git a/tools/testing/selftests/zram/config b/tools/testing/selftests/zram/config
index e0cc47e2c7e2..c59b8c3806a5 100644
--- a/tools/testing/selftests/zram/config
+++ b/tools/testing/selftests/zram/config
@@ -1,2 +1,6 @@
+CONFIG_CGROUPS=y
+CONFIG_MEMCG=y
+CONFIG_SWAP=y
 CONFIG_ZSMALLOC=y
-CONFIG_ZRAM=m
+CONFIG_ZRAM=y
+CONFIG_ZSWAP=y
diff --git a/tools/testing/selftests/zram/swap_offload.c b/tools/testing/selftests/zram/swap_offload.c
new file mode 100644
index 000000000000..b2b94cd6ee3a
--- /dev/null
+++ b/tools/testing/selftests/zram/swap_offload.c
@@ -0,0 +1,222 @@
+// SPDX-License-Identifier: GPL-2.0
+#define _GNU_SOURCE
+
+#include <errno.h>
+#include <fcntl.h>
+#include <sched.h>
+#include <signal.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/mman.h>
+#include <sys/syscall.h>
+#include <unistd.h>
+
+#define SWAP_FLAG_PREFER	0x8000
+#define SWAP_FLAG_DISCARD	0x10000
+#define SWAP_FLAG_DISCARD_ONCE	0x20000
+#define SWAP_FLAG_DISCARD_PAGES	0x40000
+#define SWAP_FLAG_OFFLOAD_ONLY	0x80000
+
+static int activate(const char *path, int priority, int discard_flags)
+{
+	int flags = SWAP_FLAG_PREFER | SWAP_FLAG_OFFLOAD_ONLY |
+		priority | discard_flags;
+
+	if (syscall(SYS_swapon, path, flags)) {
+		perror("swapon");
+		return 1;
+	}
+
+	return 0;
+}
+
+static int reject_page_discard(const char *path, int priority)
+{
+	int flags = SWAP_FLAG_PREFER | SWAP_FLAG_OFFLOAD_ONLY |
+		SWAP_FLAG_DISCARD | SWAP_FLAG_DISCARD_PAGES | priority;
+	int ret;
+
+	errno = 0;
+	ret = syscall(SYS_swapon, path, flags);
+	if (ret == -1 && errno == EINVAL)
+		return 0;
+	if (!ret) {
+		syscall(SYS_swapoff, path);
+		fprintf(stderr, "offload-only page discard was accepted\n");
+	} else {
+		fprintf(stderr, "swapon returned unexpected error: %s\n",
+			strerror(errno));
+	}
+	return 1;
+}
+
+static int accept_discard_once_pages(const char *path, int priority)
+{
+	int flags = SWAP_FLAG_PREFER | SWAP_FLAG_OFFLOAD_ONLY |
+		SWAP_FLAG_DISCARD | SWAP_FLAG_DISCARD_ONCE |
+		SWAP_FLAG_DISCARD_PAGES | priority;
+
+	if (syscall(SYS_swapon, path, flags)) {
+		perror("swapon discard-once+discard-pages");
+		return 1;
+	}
+	if (syscall(SYS_swapoff, path)) {
+		perror("swapoff discard-once+discard-pages");
+		return 1;
+	}
+	return 0;
+}
+
+static int join_cgroup(const char *procs)
+{
+	char pid[32];
+	int fd, len;
+
+	fd = open(procs, O_WRONLY);
+	if (fd < 0) {
+		perror("open cgroup.procs");
+		return 1;
+	}
+
+	len = snprintf(pid, sizeof(pid), "%d\n", getpid());
+	if (write(fd, pid, len) != len) {
+		perror("write cgroup.procs");
+		close(fd);
+		return 1;
+	}
+	close(fd);
+	return 0;
+}
+
+static int pin_to_one_cpu(const char *pid_arg)
+{
+	cpu_set_t allowed, selected;
+	char *end;
+	long pid;
+	int cpu;
+
+	errno = 0;
+	pid = strtol(pid_arg, &end, 10);
+	if (errno || *end || pid <= 0) {
+		fprintf(stderr, "invalid pid: %s\n", pid_arg);
+		return 1;
+	}
+
+	if (sched_getaffinity(pid, sizeof(allowed), &allowed)) {
+		perror("sched_getaffinity");
+		return 1;
+	}
+	for (cpu = 0; cpu < CPU_SETSIZE; cpu++)
+		if (CPU_ISSET(cpu, &allowed))
+			break;
+	if (cpu == CPU_SETSIZE) {
+		fprintf(stderr, "pid %ld has no allowed CPU\n", pid);
+		return 1;
+	}
+
+	CPU_ZERO(&selected);
+	CPU_SET(cpu, &selected);
+	if (sched_setaffinity(pid, sizeof(selected), &selected)) {
+		perror("sched_setaffinity");
+		return 1;
+	}
+	return 0;
+}
+
+static int allocate(const char *size_arg, const char *procs,
+		    const char *ready, const char *verified)
+{
+	unsigned char *memory;
+	unsigned long size;
+	unsigned long page_size;
+	char *end;
+	sigset_t signals;
+	int signal;
+	int fd;
+
+	errno = 0;
+	size = strtoul(size_arg, &end, 0);
+	if (errno || *end || !size) {
+		fprintf(stderr, "invalid allocation size: %s\n", size_arg);
+		return 1;
+	}
+	if (join_cgroup(procs))
+		return 1;
+
+	memory = mmap(NULL, size, PROT_READ | PROT_WRITE,
+		      MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	if (memory == MAP_FAILED) {
+		perror("mmap");
+		return 1;
+	}
+
+	page_size = getpagesize();
+	for (unsigned long i = 0; i < size; i += page_size)
+		memset(memory + i, i / page_size % 251 + 1,
+		       page_size < size - i ? page_size : size - i);
+	if (mprotect(memory, size, PROT_READ)) {
+		perror("mprotect");
+		return 1;
+	}
+
+	sigemptyset(&signals);
+	sigaddset(&signals, SIGUSR1);
+	if (sigprocmask(SIG_BLOCK, &signals, NULL)) {
+		perror("sigprocmask");
+		return 1;
+	}
+
+	fd = open(ready, O_WRONLY | O_CREAT | O_EXCL, 0600);
+	if (fd < 0) {
+		perror("create ready file");
+		return 1;
+	}
+	close(fd);
+
+	errno = sigwait(&signals, &signal);
+	if (errno) {
+		perror("sigwait");
+		return 1;
+	}
+	for (unsigned long i = 0; i < size; i++) {
+		unsigned char expected = i / page_size % 251 + 1;
+
+		if (memory[i] != expected) {
+			fprintf(stderr,
+				"data mismatch at %lu: got %u, expected %u\n",
+				i, memory[i], expected);
+			return 1;
+		}
+	}
+
+	fd = open(verified, O_WRONLY | O_CREAT | O_EXCL, 0600);
+	if (fd < 0) {
+		perror("create verified file");
+		return 1;
+	}
+	close(fd);
+
+	for (;;)
+		pause();
+}
+
+int main(int argc, char **argv)
+{
+	if (argc == 4 && !strcmp(argv[1], "activate"))
+		return activate(argv[2], atoi(argv[3]),
+				SWAP_FLAG_DISCARD | SWAP_FLAG_DISCARD_ONCE);
+	if (argc == 4 && !strcmp(argv[1], "reject-page-discard"))
+		return reject_page_discard(argv[2], atoi(argv[3]));
+	if (argc == 4 && !strcmp(argv[1], "accept-discard-once-pages"))
+		return accept_discard_once_pages(argv[2], atoi(argv[3]));
+	if (argc == 3 && !strcmp(argv[1], "pin"))
+		return pin_to_one_cpu(argv[2]);
+	if (argc == 6 && !strcmp(argv[1], "allocate"))
+		return allocate(argv[2], argv[3], argv[4], argv[5]);
+
+	fprintf(stderr,
+		"usage: %s activate DEVICE PRIORITY | reject-page-discard DEVICE PRIORITY | accept-discard-once-pages DEVICE PRIORITY | pin PID | allocate BYTES CGROUP.PROCS READY VERIFIED\n",
+		argv[0]);
+	return 1;
+}
diff --git a/tools/testing/selftests/zram/workingset_offload.c b/tools/testing/selftests/zram/workingset_offload.c
new file mode 100644
index 000000000000..7b82797489c2
--- /dev/null
+++ b/tools/testing/selftests/zram/workingset_offload.c
@@ -0,0 +1,207 @@
+// SPDX-License-Identifier: GPL-2.0
+#define _GNU_SOURCE
+
+#include <errno.h>
+#include <fcntl.h>
+#include <signal.h>
+#include <stdbool.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/mman.h>
+#include <sys/stat.h>
+#include <unistd.h>
+
+#define ANON_SIZE (64UL << 20)
+#define TARGET_SIZE (16UL << 20)
+#define FILLER_SIZE (32UL << 20)
+
+static int join_cgroup(const char *path)
+{
+	char pid[32];
+	int fd, len;
+
+	fd = open(path, O_WRONLY);
+	if (fd < 0)
+		return -1;
+	len = snprintf(pid, sizeof(pid), "%d\n", getpid());
+	if (write(fd, pid, len) != len) {
+		close(fd);
+		return -1;
+	}
+	return close(fd);
+}
+
+static int create_file(const char *path, size_t size)
+{
+	unsigned char page[4096];
+	size_t offset;
+	int fd;
+
+	fd = open(path, O_CREAT | O_TRUNC | O_RDWR, 0600);
+	if (fd < 0)
+		return -1;
+	memset(page, 0xa5, sizeof(page));
+	for (offset = 0; offset < size; offset += sizeof(page)) {
+		if (pwrite(fd, page, sizeof(page), offset) != sizeof(page)) {
+			close(fd);
+			return -1;
+		}
+	}
+	if (fsync(fd) || posix_fadvise(fd, 0, size, POSIX_FADV_DONTNEED)) {
+		close(fd);
+		return -1;
+	}
+	return fd;
+}
+
+static int cache_file(int fd, size_t size)
+{
+	unsigned char byte;
+	size_t offset;
+
+	if (posix_fadvise(fd, 0, size, POSIX_FADV_RANDOM))
+		return -1;
+	for (offset = 0; offset < size; offset += getpagesize())
+		if (pread(fd, &byte, 1, offset) != 1)
+			return -1;
+	return 0;
+}
+
+static unsigned long memory_stat(const char *path, const char *key)
+{
+	unsigned long value;
+	char name[64];
+	FILE *file;
+
+	file = fopen(path, "r");
+	if (!file)
+		return 0;
+	while (fscanf(file, "%63s %lu", name, &value) == 2) {
+		if (!strcmp(name, key)) {
+			fclose(file);
+			return value;
+		}
+	}
+	fclose(file);
+	return 0;
+}
+
+static int touch_ready(const char *path)
+{
+	int fd = open(path, O_WRONLY | O_CREAT | O_EXCL, 0600);
+
+	if (fd < 0)
+		return -1;
+	return close(fd);
+}
+
+static bool calibration_sufficient(size_t pages, unsigned long selected,
+				   unsigned long refaulted,
+				   unsigned long anon)
+{
+	return selected >= pages / 2 && refaulted * 100 >= selected * 80 &&
+	       anon >= TARGET_SIZE;
+}
+
+int main(int argc, char **argv)
+{
+	unsigned long refault_before, refault_after;
+	unsigned long activate_before, activate_after;
+	unsigned long anon, selected = 0;
+	unsigned char *resident, *anon_memory;
+	unsigned char byte, checksum = 0;
+	char stat_path[4096];
+	sigset_t signals;
+	size_t pages, i;
+	void *mapping;
+	int target_fd, filler_fd, signal;
+
+	if (argc != 5) {
+		fprintf(stderr, "usage: %s CGROUP.PROCS TARGET FILLER READY\n",
+			argv[0]);
+		return 1;
+	}
+	if (join_cgroup(argv[1])) {
+		perror("join cgroup");
+		return 1;
+	}
+
+	anon_memory = mmap(NULL, ANON_SIZE, PROT_READ | PROT_WRITE,
+			   MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	if (anon_memory == MAP_FAILED) {
+		perror("mmap anonymous");
+		return 1;
+	}
+	for (i = 0; i < ANON_SIZE; i += getpagesize())
+		anon_memory[i] = i / getpagesize() % 251 + 1;
+
+	target_fd = create_file(argv[2], TARGET_SIZE);
+	filler_fd = create_file(argv[3], FILLER_SIZE);
+	if (target_fd < 0 || filler_fd < 0) {
+		perror("create files");
+		return 1;
+	}
+	if (cache_file(target_fd, TARGET_SIZE) ||
+	    cache_file(filler_fd, FILLER_SIZE)) {
+		perror("populate page cache");
+		return 1;
+	}
+
+	sigemptyset(&signals);
+	sigaddset(&signals, SIGUSR1);
+	if (sigprocmask(SIG_BLOCK, &signals, NULL) || touch_ready(argv[4])) {
+		perror("prepare signal");
+		return 1;
+	}
+	errno = sigwait(&signals, &signal);
+	if (errno) {
+		perror("sigwait");
+		return 1;
+	}
+
+	mapping = mmap(NULL, TARGET_SIZE, PROT_READ, MAP_SHARED, target_fd, 0);
+	if (mapping == MAP_FAILED) {
+		perror("mmap target");
+		return 1;
+	}
+	pages = TARGET_SIZE / getpagesize();
+	resident = calloc(pages, 1);
+	if (!resident || mincore(mapping, TARGET_SIZE, resident)) {
+		perror("mincore");
+		return 1;
+	}
+	munmap(mapping, TARGET_SIZE);
+
+	snprintf(stat_path, sizeof(stat_path), "%.*s/memory.stat",
+		 (int)(strlen(argv[1]) - strlen("/cgroup.procs")), argv[1]);
+	refault_before = memory_stat(stat_path, "workingset_refault_file");
+	activate_before = memory_stat(stat_path, "workingset_activate_file");
+	for (i = 0; i < pages; i++) {
+		if (resident[i] & 1)
+			continue;
+		if (pread(target_fd, &byte, 1, i * getpagesize()) != 1) {
+			perror("refault target");
+			return 1;
+		}
+		selected++;
+	}
+	refault_after = memory_stat(stat_path, "workingset_refault_file");
+	activate_after = memory_stat(stat_path, "workingset_activate_file");
+	anon = memory_stat(stat_path, "active_anon") +
+	       memory_stat(stat_path, "inactive_anon");
+
+	for (i = 0; i < ANON_SIZE; i += getpagesize())
+		checksum ^= anon_memory[i];
+	printf("selected=%lu refault=%lu activate=%lu anon=%lu checksum=%u\n",
+	       selected, refault_after - refault_before,
+	       activate_after - activate_before, anon, checksum);
+
+	free(resident);
+	close(filler_fd);
+	close(target_fd);
+	if (!calibration_sufficient(pages, selected,
+				    refault_after - refault_before, anon))
+		return 2;
+	return (activate_after - activate_before) * 100 < selected * 80;
+}
diff --git a/tools/testing/selftests/zram/zram03.sh b/tools/testing/selftests/zram/zram03.sh
new file mode 100755
index 000000000000..951f70c1d878
--- /dev/null
+++ b/tools/testing/selftests/zram/zram03.sh
@@ -0,0 +1,174 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+# Test proactive-only swap allocation and pressure fallback.
+
+set -eu
+
+# shellcheck source=zram_lib.sh
+. ./zram_lib.sh
+
+TCID="zram03"
+cg="/sys/fs/cgroup/zram-offload-$$"
+cgroup_root="/sys/fs/cgroup"
+tmp=""
+ready=""
+verified=""
+allocator_pid=""
+offload=""
+zswap_enabled=""
+
+fail()
+{
+	echo "$TCID: [FAIL] $*" >&2
+	exit 1
+}
+
+skip()
+{
+	echo "$TCID: [SKIP] $*" >&2
+	exit "$ksft_skip"
+}
+
+cleanup()
+{
+	local status=$?
+	set +e
+	if [ -n "$allocator_pid" ]; then
+		kill "$allocator_pid"
+		wait "$allocator_pid"
+	fi
+	if [ -n "$tmp" ]; then
+		rm -rf "$tmp" || status=1
+	fi
+	if [ -n "$cg" ] && [ -d "$cg" ]; then
+		rmdir "$cg" || status=1
+	fi
+	cgroup_disable_memory_controller "$cgroup_root" || status=1
+	if [ -n "$dev_ids" ]; then
+		zram_cleanup || status=1
+	fi
+	if [ -n "$zswap_enabled" ]; then
+		echo "$zswap_enabled" > /sys/module/zswap/parameters/enabled || status=1
+	fi
+	exit "$status"
+}
+
+swap_used_kb()
+{
+	awk -v device="$1" '$1 == device { print $4 }' /proc/swaps
+}
+
+zram_orig_data_size()
+{
+	awk '{ print $1 }' "/sys/block/${1##*/}/mm_stat"
+}
+
+wait_file()
+{
+	for _ in $(seq 1 400); do
+		[ -e "$1" ] && return 0
+		sleep 0.05
+	done
+	return 1
+}
+
+check_prereqs
+# The feature marker also requires CONFIG_VM_EVENT_COUNTERS.
+grep -q '^swpout_offload_refused ' /proc/vmstat ||
+	skip "offload refusal counters are unavailable"
+[ -x ./swap_offload ] || skip "swap_offload helper is unavailable"
+[ -e /sys/fs/cgroup/cgroup.controllers ] || skip "cgroup v2 controllers are unavailable"
+grep -qw memory /sys/fs/cgroup/cgroup.controllers || skip "memory controller is unavailable"
+[ -e /sys/module/zswap/parameters/enabled ] || skip "zswap is unavailable"
+zswap_enabled=$(cat /sys/module/zswap/parameters/enabled)
+
+# Keep every reclaim transition on one CPU.  This makes the test exercise the
+# cached-cluster provenance mismatch rather than relying on scheduler placement.
+./swap_offload pin "$$" || skip "cannot pin test to one allowed CPU"
+
+# Swap priorities are global. Put both test areas ahead of any existing swap
+# so distro-managed zram or another high-priority area cannot absorb the test
+# allocations and make the routing assertions fail spuriously.
+max_prio=$(awk 'BEGIN { max = -1 } NR > 1 && $5 > max { max = $5 } END { print max }' /proc/swaps)
+[ "$max_prio" -le 32765 ] || skip "cannot outrank existing swap priority $max_prio"
+safe_prio=$((max_prio + 1))
+offload_prio=$((max_prio + 2))
+
+dev_num=2
+zram_sizes="67108864 67108864"
+trap cleanup EXIT
+trap 'exit 129' HUP
+trap 'exit 130' INT
+trap 'exit 143' TERM
+zram_load
+echo Y > /sys/module/zswap/parameters/enabled || skip "cannot enable zswap"
+zram_set_disksizes
+
+set -- $dev_ids
+safe="/dev/zram${1}"
+offload="/dev/zram${2}"
+safe_id=$1
+offload_id=$2
+mkswap "$safe" >/dev/null
+mkswap "$offload" >/dev/null
+swapon -p "$safe_prio" "$safe"
+dev_swap_ids=" $safe_id"
+./swap_offload reject-page-discard "$offload" "$offload_prio" ||
+	fail "offload-only page discard was accepted"
+./swap_offload accept-discard-once-pages "$offload" "$offload_prio" ||
+	fail "resolved offload-only discard-once was rejected"
+./swap_offload activate "$offload" "$offload_prio"
+dev_swap_ids="$dev_swap_ids $offload_id"
+
+cgroup_enable_memory_controller "$cgroup_root" ||
+	skip "cannot enable the cgroup v2 memory controller"
+mkdir "$cg" || skip "cannot create test cgroup"
+[ -e "$cg/memory.max" ] || skip "cgroup v2 memory controller is unavailable"
+echo max > "$cg/memory.swap.max"
+echo 1 > "$cg/memory.zswap.writeback" ||
+	skip "cannot enable zswap writeback for test cgroup"
+
+tmp_dir=$(mktemp -d "${TMPDIR:-/tmp}/zram-offload.XXXXXX") ||
+	fail "cannot create readiness directory"
+tmp=$tmp_dir
+ready="$tmp/ready"
+verified="$tmp/verified"
+./swap_offload allocate 67108864 "$cg/cgroup.procs" "$ready" "$verified" &
+allocator_pid=$!
+wait_file "$ready" || fail "allocator did not become ready"
+
+echo "16M swappiness=max" > "$cg/memory.reclaim" ||
+	fail "proactive reclaim failed"
+offload_before=$(swap_used_kb "$offload")
+safe_before=$(swap_used_kb "$safe")
+offload_orig=$(zram_orig_data_size "$offload")
+[ "${offload_before:-0}" -gt 0 ] || fail "proactive reclaim missed offload area"
+[ "${safe_before:-0}" -eq 0 ] || fail "proactive reclaim used lower-priority safe area"
+[ "$((offload_orig + 1048576))" -ge "$((offload_before * 1024))" ] ||
+	fail "zswap deferred the offload-only backend write"
+
+echo 24M > "$cg/memory.max"
+sleep 1
+offload_pressure=$(swap_used_kb "$offload")
+safe_pressure=$(swap_used_kb "$safe")
+safe_orig=$(zram_orig_data_size "$safe")
+[ "${safe_pressure:-0}" -gt 0 ] || fail "pressure reclaim missed safe fallback"
+[ "$offload_pressure" -le "$offload_before" ] ||
+	fail "pressure reclaim allocated offload-only slots"
+[ "$safe_orig" -lt "$((safe_pressure * 1024))" ] ||
+	fail "zswap did not retain any unmarked safe-area pages"
+
+echo max > "$cg/memory.max"
+echo "4M swappiness=max" > "$cg/memory.reclaim" ||
+	fail "second proactive reclaim failed"
+offload_after=$(swap_used_kb "$offload")
+[ "$offload_after" -gt "$offload_pressure" ] ||
+	fail "proactive priority was not restored after pressure reclaim"
+
+swapoff "$offload" || fail "swapoff could not recover offloaded pages"
+offload=""
+dev_swap_ids=" $safe_id"
+kill -USR1 "$allocator_pid" || fail "cannot request data verification"
+wait_file "$verified" || fail "allocator did not verify recovered data"
+kill -0 "$allocator_pid" || fail "allocator died during swapoff"
+echo "$TCID: [PASS]"
diff --git a/tools/testing/selftests/zram/zram04.sh b/tools/testing/selftests/zram/zram04.sh
new file mode 100755
index 000000000000..a351d08906f2
--- /dev/null
+++ b/tools/testing/selftests/zram/zram04.sh
@@ -0,0 +1,164 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+# Reproduce offload-only swap leaking into the workingset refault heuristic.
+
+set -eu
+
+# shellcheck source=zram_lib.sh
+. ./zram_lib.sh
+
+TCID="zram04"
+cg="/sys/fs/cgroup/zram-workingset-$$"
+cg_created=0
+cgroup_root="/sys/fs/cgroup"
+tmp=""
+ready=""
+worker=""
+tmp_fs=""
+mglru=""
+zswap_enabled=""
+
+fail()
+{
+	echo "$TCID: [FAIL] $*" >&2
+	exit 1
+}
+
+skip()
+{
+	echo "$TCID: [SKIP] $*" >&2
+	exit "$ksft_skip"
+}
+
+cleanup()
+{
+	local status=$?
+	set +e
+	[ -n "$worker" ] && kill "$worker"
+	[ -n "$worker" ] && wait "$worker"
+	if [ -n "$tmp" ]; then
+		rm -rf "$tmp" || status=1
+	fi
+	if [ "$cg_created" -eq 1 ]; then
+		rmdir "$cg" || status=1
+	fi
+	cgroup_disable_memory_controller "$cgroup_root" || status=1
+	if [ -n "$dev_ids" ]; then
+		zram_cleanup || status=1
+	fi
+	if [ -n "$mglru" ]; then
+		echo "$mglru" > /sys/kernel/mm/lru_gen/enabled || status=1
+	fi
+	if [ -n "$zswap_enabled" ]; then
+		echo "$zswap_enabled" > /sys/module/zswap/parameters/enabled || status=1
+	fi
+	exit "$status"
+}
+
+wait_helper_ready()
+{
+	for _ in $(seq 1 400); do
+		[ -e "$ready" ] && return 0
+		worker_state=$(awk '{ print $3 }' "/proc/$worker/stat" \
+			2>/dev/null || :)
+		if ! kill -0 "$worker" 2>/dev/null ||
+		   [ "$worker_state" = Z ]; then
+			if wait "$worker"; then
+				status=0
+			else
+				status=$?
+			fi
+			worker=""
+			[ "$status" -eq 2 ] &&
+				skip "workingset calibration was insufficient"
+			fail "workingset helper exited with status $status before readiness"
+		fi
+		sleep 0.05
+	done
+	fail "workingset helper timed out before readiness"
+}
+
+check_prereqs
+# The feature marker also requires CONFIG_VM_EVENT_COUNTERS.
+grep -q '^swpout_offload_refused ' /proc/vmstat ||
+	skip "offload refusal counters are unavailable"
+[ -x ./swap_offload ] || skip "swap_offload helper is unavailable"
+[ -x ./workingset_offload ] || skip "workingset helper is unavailable"
+[ -e /sys/fs/cgroup/cgroup.controllers ] || skip "cgroup v2 is unavailable"
+grep -qw memory /sys/fs/cgroup/cgroup.controllers ||
+	skip "cgroup v2 memory controller is unavailable"
+[ "$(awk 'END { print NR }' /proc/swaps)" -eq 1 ] ||
+	skip "test requires no pre-existing swap"
+tmp_fs=$(stat -f -c %T "${TMPDIR:-/var/tmp}") ||
+	skip "cannot identify the test filesystem"
+[ "$tmp_fs" != tmpfs ] ||
+	skip "test files require a disk-backed filesystem"
+
+[ -e /sys/kernel/mm/lru_gen/enabled ] &&
+	mglru=$(cat /sys/kernel/mm/lru_gen/enabled)
+[ -e /sys/module/zswap/parameters/enabled ] &&
+	zswap_enabled=$(cat /sys/module/zswap/parameters/enabled)
+trap cleanup EXIT
+trap 'exit 129' HUP
+trap 'exit 130' INT
+trap 'exit 143' TERM
+[ -n "$mglru" ] && echo 0 > /sys/kernel/mm/lru_gen/enabled
+[ -n "$zswap_enabled" ] && echo N > /sys/module/zswap/parameters/enabled
+
+dev_num=1
+zram_sizes="134217728"
+zram_load
+zram_set_disksizes
+set -- $dev_ids
+offload="/dev/zram${1}"
+mkswap "$offload" >/dev/null
+./swap_offload activate "$offload" 1
+dev_swap_ids=" $1"
+
+cgroup_enable_memory_controller "$cgroup_root" ||
+	skip "cannot enable the cgroup v2 memory controller"
+mkdir "$cg" || skip "cannot create test cgroup"
+cg_created=1
+[ -e "$cg/memory.max" ] || skip "cgroup v2 memory controller is unavailable"
+echo max > "$cg/memory.max"
+echo max > "$cg/memory.swap.max"
+tmp=$(mktemp -d "${TMPDIR:-/var/tmp}/zram-workingset.XXXXXX")
+ready="$tmp/ready"
+
+./workingset_offload "$cg/cgroup.procs" "$tmp/target" "$tmp/filler" \
+	"$ready" &
+worker=$!
+wait_helper_ready
+
+# Shadow retention uses local LRU/slab statistics updated by memcg flushing.
+# Check that the 64 MiB anonymous and 48 MiB file setup is visible before
+# evicting file pages.
+stats_ready=0
+for _ in $(seq 1 50); do
+	if awk '
+		$1 == "active_anon" || $1 == "inactive_anon" { anon += $2 }
+		$1 == "file" { file = $2 }
+		END { exit !(anon >= 67108864 && file >= 50331648) }
+	' "$cg/memory.stat"; then
+		stats_ready=1
+		break
+	fi
+	sleep 0.1
+done
+[ "$stats_ready" -eq 1 ] ||
+	skip "initial working-set statistics did not become visible"
+
+echo "48M swappiness=0" > "$cg/memory.reclaim" ||
+	skip "file-only proactive reclaim failed"
+kill -USR1 "$worker"
+if wait "$worker"; then
+	worker=""
+	echo "$TCID: [PASS]"
+	exit 0
+else
+	status=$?
+fi
+worker=""
+[ "$status" -eq 2 ] && skip "workingset calibration was insufficient"
+echo "$TCID: [FAIL] refaulted file pages were not activated" >&2
+exit 1
diff --git a/tools/testing/selftests/zram/zram_lib.sh b/tools/testing/selftests/zram/zram_lib.sh
index 4b134f70726d..cf55bcd1b09d 100755
--- a/tools/testing/selftests/zram/zram_lib.sh
+++ b/tools/testing/selftests/zram/zram_lib.sh
@@ -17,6 +17,10 @@ kernel_version=`uname -r | cut -d'.' -f1,2`
 kernel_major=${kernel_version%.*}
 kernel_minor=${kernel_version#*.}
 
+# Whether this test enabled the memory controller on its cgroup parent.  Tests
+# must leave a delegation which was already present alone.
+cgroup_memory_controller_enabled=0
+
 trap INT
 
 check_prereqs()
@@ -30,6 +34,30 @@ check_prereqs()
 	fi
 }
 
+cgroup_enable_memory_controller()
+{
+	local cgroup_root=$1
+
+	if grep -qw memory "$cgroup_root/cgroup.subtree_control"; then
+		return 0
+	fi
+
+	if ! echo +memory > "$cgroup_root/cgroup.subtree_control"; then
+		return 1
+	fi
+
+	cgroup_memory_controller_enabled=1
+}
+
+cgroup_disable_memory_controller()
+{
+	local cgroup_root=$1
+
+	[ "$cgroup_memory_controller_enabled" -eq 1 ] || return 0
+	echo -memory > "$cgroup_root/cgroup.subtree_control" || return 1
+	cgroup_memory_controller_enabled=0
+}
+
 kernel_gte()
 {
 	major=${1%.*}
-- 
2.55.0

