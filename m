Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B20643F4D3
	for <linux-kselftest@vger.kernel.org>; Mon, 14 Sep 2026 10:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789382758; cv=none; b=NdMq5CoFIy6FLkui88K05OGw/wwGPoPlWiTlVQ5pfn6zNMMzlbbbgshloResJsxilrMBfToXqlvzJdiIMeAF+Xderzu6fP/6Rw1U108Qq+IA/uM+DMF4sHXF7NTHC5LFNaBE+vW+fJAy1V+on0OtIsophHNWExL2jo1g4DEPnQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789382758; c=relaxed/simple;
	bh=E+whOZZL5DnjQqWnSCx5Pi1r1WYVaqla7av/tBEaSnk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r9l/US6kpr0LvMrDQ/cYjXvQb4Cs3Ffif7WVHqJHz4nXYYfXr9Cb93ucuWMqYYKkFPdnRnSK17lE5ObHVEoiAKzGTHE5SOF1WeawNEC1l+t/S7mUY7Yz8Qvg7JHvcaIxpII8m3DcCNTsDF/G4qPfKMRz1U8CZp9SQYHg7m3oBY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VdMTp8JS; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VdMTp8JS"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-86ec25cf7ecso674462b3a.1
        for <linux-kselftest@vger.kernel.org>; Mon, 14 Sep 2026 03:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789382735; x=1789987535; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pP4c2SklkdAq8uJAifC1BRbJPGJDoqcc2YiW0fKnZ+4=;
        b=VdMTp8JSDnsosavIwCOSIQpy5gbULhiwa2juCP47Gebcpaikuvc8m+GJtjWm9DG6sT
         7lYSSxBkSRaJbVWk2RKdW+b/GqgoDFuHbSlDvy8G7+nrkM5k9NleU5lBKwtoQfshTnAI
         rUR4gf7tG20FrYxweRaSymxaupJuqE+Vmzsj+WyPKxenUTYNCydt1E6wtxYbXNUrpqXm
         R3MYqRG+ZHnBtfZezqjXiArfgyaTUFStygXGEYDjxwOrCuvubJ6AKM9HbW1gOzJ/QNPQ
         /zwTecrc6KRo48vDQjYeTSKvvlCrkT3Zqog/0BLvzmZfg3BDnrXlL6xI6H8WJDqHSOuy
         c6IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789382735; x=1789987535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pP4c2SklkdAq8uJAifC1BRbJPGJDoqcc2YiW0fKnZ+4=;
        b=Y7wBlFwQlWL4IVqCMG4Xxm8X41Fbg+72aFXsxzftVbCQccn/1MhUvhac398eav2frV
         WRl0stoiFZ05mtGDV0/5TgOV+DwXnC2BXENuTssq65mL7aOljx5/3JC0fS+j088IgjVD
         Y5PfFffik7R24pGwjd+sJ9SiXoe5H7fEmn5xTUvsKmaByKjYFU8Qn37ZiriWk/k/zkI9
         07MIAFbRQh+XPw3UybAj2tdj/qRXd1gLBTo3PDig9gnVugO80vwY+VTWE1/GpRdw3Z8C
         6qvHofqDfE1Zn5qMDkyKPxcP1XKS2PLRK8l2br8GUpO802oXv7qbTnMj/xtuNggoSsMc
         gl0w==
X-Forwarded-Encrypted: i=1; AKwUvBzuTaCk4gK1H4pMtBAJdPUY+WSrCH7UCJsO+6mXMaqjrAToJ2/EPYePG5EVCPZXKFKAFxwXp8McdpX3ikD2LT4=@vger.kernel.org
X-Gm-Message-State: AFuF++l8bu0yUo4qQ8RU06HKewAjt0VdVRPFvd5MRxinKdr96NhkIJws
	bPvqVE3fHNGpPubS3RrwtD3clqWlu4InydkXQRT1+REslH15ZGKPr5zTo1EOnWM7YUQ=
X-Gm-Gg: AYBFou25XN78zgxhYLz9rh8EYYHxcoZsahw0f/w0Vm4a0WQUSETeNNkH/sTingGpfpo
	s850+i9U/7EIUJPCIhFrMk03szwY7VG1AIvI5bYsemtKpQ1ynw0Qa2+VM4KMDP7ZLwrpErN/XXG
	fyGOMatDwyBrzbfyw0XniOP13x27QxMxEDyckHLNqSN7jymnamsjP0YVpBngFdRYqjjsr6VaZti
	z4PGxYiRxYA+s74tgeinR6ya6/9dtl4QNcpLIGhZJlNRiaDpLU2psD9smuOVPoyB/3Lte1RpLKf
	iGyBcUwsRJhe2I1u61U5F171PkcvMJoj5Q8ZiWQhzjuVbx1zi3aElRJ1UZjonhH971NsegKCa02
	3ALvW4fxV4r8kzHvwjeQEDuZfAsj6+CcVNwhypD3Ze4M/cHTrmwJNM/qVRBnZf/uUY+5BLl/sqp
	Gqpa2BNQ/DwmSf/8rRDu+/6o9OhZE3JuG7Jick+TARVtzQXHehTCsAI1dklWi0Y/LZfaYogi+rZ
	yOpr2tUmrx17kfwd+UJT1Mb46oTTsiBZmncw2Ygd3XsOoH4+pDB6k1RE35BXRLLX9LQ4MWUjdhZ
	r80At6cJRL3Nqk7iuF8p85GHeTvAgFi8PRcg6/5nB3uZfdZ/4U7wdpUdzgkAYjA=
X-Received: by 2002:a05:6a00:4397:b0:853:ffd0:93f3 with SMTP id d2e1a72fcca58-86e2a8cce3amr6578637b3a.11.1789382735182;
        Mon, 14 Sep 2026 03:45:35 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.252.203.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b28fd0e0dsm4234386b3a.26.2026.09.14.03.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 03:45:34 -0700 (PDT)
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
Subject: [RFC PATCH 3/3] selftests: zram: cover retained offload-only entries
Date: Mon, 14 Sep 2026 18:45:01 +0800
Message-ID: <20260914104501.3960616-4-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260914104501.3960616-1-matthias.goergens@gmail.com>
References: <20260914104501.3960616-1-matthias.goergens@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Faulting and dirtying one page of a swapped-out large folio can leave
sibling PTEs referring to its existing offload-only swap allocation.
Exercise this path with zram behind dm-delay: ordinary reclaim must not
rewrite the allocation, while proactive reclaim must still be able to.

Check backing-device writes, refusal counters and data integrity. Derive
the folio and expected I/O sizes from the architecture's PMD huge-page
size. Keep this test separate from basic routing coverage because it
also requires transparent huge pages, MADV_COLLAPSE and dm-delay.

Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
---
 tools/testing/selftests/zram/Makefile       |   2 +-
 tools/testing/selftests/zram/config         |   4 +
 tools/testing/selftests/zram/swap_offload.c | 182 +++++++++-
 tools/testing/selftests/zram/zram05.sh      | 360 ++++++++++++++++++++
 4 files changed, 546 insertions(+), 2 deletions(-)
 create mode 100755 tools/testing/selftests/zram/zram05.sh

diff --git a/tools/testing/selftests/zram/Makefile b/tools/testing/selftests/zram/Makefile
index 781d10a20e56..b83e6a1563b2 100644
--- a/tools/testing/selftests/zram/Makefile
+++ b/tools/testing/selftests/zram/Makefile
@@ -2,7 +2,7 @@
 all:
 
 TEST_GEN_FILES := swap_offload workingset_offload
-TEST_PROGS := zram.sh zram03.sh zram04.sh
+TEST_PROGS := zram.sh zram03.sh zram04.sh zram05.sh
 TEST_FILES := zram01.sh zram02.sh zram_lib.sh
 EXTRA_CLEAN := err.log
 
diff --git a/tools/testing/selftests/zram/config b/tools/testing/selftests/zram/config
index c59b8c3806a5..018429d8f5ca 100644
--- a/tools/testing/selftests/zram/config
+++ b/tools/testing/selftests/zram/config
@@ -1,6 +1,10 @@
 CONFIG_CGROUPS=y
+CONFIG_BLK_DEV_DM=y
+CONFIG_DM_DELAY=y
 CONFIG_MEMCG=y
 CONFIG_SWAP=y
+CONFIG_TRANSPARENT_HUGEPAGE=y
+CONFIG_VM_EVENT_COUNTERS=y
 CONFIG_ZSMALLOC=y
 CONFIG_ZRAM=y
 CONFIG_ZSWAP=y
diff --git a/tools/testing/selftests/zram/swap_offload.c b/tools/testing/selftests/zram/swap_offload.c
index b2b94cd6ee3a..1850b3b4809f 100644
--- a/tools/testing/selftests/zram/swap_offload.c
+++ b/tools/testing/selftests/zram/swap_offload.c
@@ -3,6 +3,7 @@
 
 #include <errno.h>
 #include <fcntl.h>
+#include <limits.h>
 #include <sched.h>
 #include <signal.h>
 #include <stdio.h>
@@ -17,6 +18,7 @@
 #define SWAP_FLAG_DISCARD_ONCE	0x20000
 #define SWAP_FLAG_DISCARD_PAGES	0x40000
 #define SWAP_FLAG_OFFLOAD_ONLY	0x80000
+#define KSFT_SKIP	4
 
 static int activate(const char *path, int priority, int discard_flags)
 {
@@ -201,11 +203,187 @@ static int allocate(const char *size_arg, const char *procs,
 		pause();
 }
 
+static int create_marker(const char *path, int write_pid)
+{
+	char *temporary;
+	int fd, ret = 1;
+
+	if (asprintf(&temporary, "%s.XXXXXX", path) < 0) {
+		perror("asprintf marker path");
+		return 1;
+	}
+	fd = mkstemp(temporary);
+	if (fd < 0) {
+		perror(path);
+		goto out_free;
+	}
+	if (write_pid && dprintf(fd, "%d\n", getpid()) < 0) {
+		perror("write marker");
+		close(fd);
+		goto out_unlink;
+	}
+	if (close(fd)) {
+		perror("close marker");
+		goto out_unlink;
+	}
+	/* Publish only after the payload is complete for the shell reader. */
+	if (rename(temporary, path)) {
+		perror("publish marker");
+		goto out_unlink;
+	}
+	ret = 0;
+out_unlink:
+	unlink(temporary);
+out_free:
+	free(temporary);
+	return ret;
+}
+
+static unsigned char retained_byte(unsigned long offset, long page_size,
+				   int touched)
+{
+	unsigned char value = offset / page_size % 251 + 1;
+
+	if (touched && !offset)
+		value ^= 0x5a;
+	return value;
+}
+
+static int verify_retained(unsigned char *memory, unsigned long size,
+			   long page_size, int full)
+{
+	unsigned long limit = full ? size : 1;
+
+	for (unsigned long offset = 0; offset < limit; offset++) {
+		unsigned char expected = retained_byte(offset, page_size, 1);
+
+		if (memory[offset] != expected) {
+			fprintf(stderr,
+				"retained data mismatch at %lu: got %u, expected %u\n",
+				offset, memory[offset], expected);
+			return 1;
+		}
+	}
+	return 0;
+}
+
+static int retained(const char *size_arg, const char *procs,
+		    const char *ready, const char *touched,
+		    const char *verified)
+{
+	unsigned long allocation_size, mapping_start, size;
+	unsigned char *mapping, *memory;
+	char *end;
+	sigset_t signals;
+	long page_size;
+	int signal;
+
+	errno = 0;
+	size = strtoul(size_arg, &end, 0);
+	if (errno || *end || !size || (size & (size - 1))) {
+		fprintf(stderr, "allocation size must be a power of two\n");
+		return 1;
+	}
+	if (join_cgroup(procs))
+		return 1;
+
+	page_size = sysconf(_SC_PAGESIZE);
+	if (page_size <= 0) {
+		perror("sysconf _SC_PAGESIZE");
+		return 1;
+	}
+	if (size < (unsigned long)page_size || size % page_size) {
+		fprintf(stderr, "allocation size must contain whole pages\n");
+		return 1;
+	}
+	if (size > ULONG_MAX / 2) {
+		fprintf(stderr, "allocation size is too large\n");
+		return 1;
+	}
+	allocation_size = size * 2;
+	mapping = mmap(NULL, allocation_size, PROT_READ | PROT_WRITE,
+		       MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	if (mapping == MAP_FAILED) {
+		perror("mmap");
+		return 1;
+	}
+	mapping_start = (unsigned long)mapping;
+	memory = (unsigned char *)((mapping_start + size - 1) & ~(size - 1));
+	if ((unsigned long)memory != mapping_start)
+		munmap((void *)mapping_start,
+		       (unsigned long)memory - mapping_start);
+	munmap(memory + size, allocation_size - size -
+	       ((unsigned long)memory - mapping_start));
+	if (madvise(memory, size, MADV_HUGEPAGE)) {
+		perror("madvise MADV_HUGEPAGE");
+		return 1;
+	}
+	for (unsigned long offset = 0; offset < size; offset += page_size)
+		memset(memory + offset, retained_byte(offset, page_size, 0),
+		       page_size);
+#ifdef MADV_COLLAPSE
+	if (madvise(memory, size, MADV_COLLAPSE)) {
+		int error = errno;
+
+		perror("madvise MADV_COLLAPSE");
+		if (error == EAGAIN || error == EINVAL || error == ENOMEM)
+			return KSFT_SKIP;
+		return 1;
+	}
+#else
+	fprintf(stderr, "MADV_COLLAPSE is unavailable\n");
+	return KSFT_SKIP;
+#endif
+
+	sigemptyset(&signals);
+	sigaddset(&signals, SIGUSR1);
+	sigaddset(&signals, SIGUSR2);
+	sigaddset(&signals, SIGALRM);
+	if (sigprocmask(SIG_BLOCK, &signals, NULL)) {
+		perror("sigprocmask");
+		return 1;
+	}
+	if (create_marker(ready, 1))
+		return 1;
+
+	for (;;) {
+		errno = sigwait(&signals, &signal);
+		if (errno) {
+			perror("sigwait");
+			return 1;
+		}
+		if (signal == SIGUSR1) {
+			unsigned char value;
+
+			if (mprotect(memory, page_size, PROT_READ)) {
+				perror("mprotect read");
+				return 1;
+			}
+			value = memory[0];
+			if (mprotect(memory, page_size, PROT_READ | PROT_WRITE)) {
+				perror("mprotect write");
+				return 1;
+			}
+			memory[0] = value ^ 0x5a;
+			if (create_marker(touched, 0))
+				return 1;
+		} else {
+			if (verify_retained(memory, size, page_size,
+					    signal == SIGALRM))
+				return 1;
+			if (create_marker(verified, 0))
+				return 1;
+		}
+	}
+}
+
 int main(int argc, char **argv)
 {
 	if (argc == 4 && !strcmp(argv[1], "activate"))
 		return activate(argv[2], atoi(argv[3]),
 				SWAP_FLAG_DISCARD | SWAP_FLAG_DISCARD_ONCE);
+	if (argc == 4 && !strcmp(argv[1], "activate-no-discard"))
+		return activate(argv[2], atoi(argv[3]), 0);
 	if (argc == 4 && !strcmp(argv[1], "reject-page-discard"))
 		return reject_page_discard(argv[2], atoi(argv[3]));
 	if (argc == 4 && !strcmp(argv[1], "accept-discard-once-pages"))
@@ -214,9 +392,11 @@ int main(int argc, char **argv)
 		return pin_to_one_cpu(argv[2]);
 	if (argc == 6 && !strcmp(argv[1], "allocate"))
 		return allocate(argv[2], argv[3], argv[4], argv[5]);
+	if (argc == 7 && !strcmp(argv[1], "retained"))
+		return retained(argv[2], argv[3], argv[4], argv[5], argv[6]);
 
 	fprintf(stderr,
-		"usage: %s activate DEVICE PRIORITY | reject-page-discard DEVICE PRIORITY | accept-discard-once-pages DEVICE PRIORITY | pin PID | allocate BYTES CGROUP.PROCS READY VERIFIED\n",
+		"usage: %s activate|activate-no-discard DEVICE PRIORITY | reject-page-discard DEVICE PRIORITY | accept-discard-once-pages DEVICE PRIORITY | pin PID | allocate BYTES CGROUP.PROCS READY VERIFIED | retained BYTES CGROUP.PROCS READY TOUCHED VERIFIED\n",
 		argv[0]);
 	return 1;
 }
diff --git a/tools/testing/selftests/zram/zram05.sh b/tools/testing/selftests/zram/zram05.sh
new file mode 100755
index 000000000000..e4bbf6bfa0e9
--- /dev/null
+++ b/tools/testing/selftests/zram/zram05.sh
@@ -0,0 +1,360 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+# Test retained offload-only entries under ordinary and proactive reclaim.
+
+set -eu
+
+# shellcheck source=zram_lib.sh
+. ./zram_lib.sh
+
+TCID="zram05"
+cg="/sys/fs/cgroup/zram-retained-$$"
+cgroup_root="/sys/fs/cgroup"
+tmp="${TMPDIR:-/var/tmp}/zram-retained-$$"
+ready="$tmp/ready"
+touched="$tmp/touched"
+verified="$tmp/verified"
+holder_pid=""
+safe=""
+safe_active=0
+offload_backing=""
+offload=""
+offload_active=0
+dm_name="zram-retained-$$"
+dm_active=0
+dm_node_created=0
+zswap_enabled=""
+thp_size=0
+thp_kib=0
+thp_sectors=0
+page_kib=0
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
+	set +e
+	if [ -n "$holder_pid" ]; then
+		kill "$holder_pid"
+		wait "$holder_pid"
+	fi
+	if [ "$offload_active" -eq 1 ]; then
+		swapoff "$offload" >/dev/null 2>&1
+	fi
+	if [ "$safe_active" -eq 1 ]; then
+		swapoff "$safe" >/dev/null 2>&1
+	fi
+	if [ "$dm_active" -eq 1 ]; then
+		dmsetup --noudevsync --noudevrules remove "$dm_name" \
+			>/dev/null 2>&1
+	fi
+	if [ "$dm_node_created" -eq 1 ]; then
+		rm -f "$offload"
+	fi
+	rm -rf "$tmp"
+	rmdir "$cg"
+	cgroup_disable_memory_controller "$cgroup_root"
+	if [ "$dev_end" -ge "$dev_start" ]; then
+		zram_cleanup
+	fi
+	if [ -n "$zswap_enabled" ]; then
+		echo "$zswap_enabled" > /sys/module/zswap/parameters/enabled
+	fi
+}
+
+wait_file()
+{
+	for _ in $(seq 1 400); do
+		[ -e "$1" ] && return 0
+		if [ -n "$holder_pid" ]; then
+			holder_state=$(awk '{ print $3 }' \
+				"/proc/$holder_pid/stat" 2>/dev/null || :)
+		else
+			holder_state=""
+		fi
+		if [ -n "$holder_pid" ] &&
+		   { ! kill -0 "$holder_pid" 2>/dev/null ||
+		     [ "$holder_state" = Z ]; }; then
+			if wait "$holder_pid"; then
+				helper_status=0
+			else
+				helper_status=$?
+			fi
+			holder_pid=""
+			return 2
+		fi
+		sleep 0.05
+	done
+	return 1
+}
+
+require_helper_file()
+{
+	if wait_file "$1"; then
+		return 0
+	else
+		status=$?
+	fi
+	if [ "$status" -eq 2 ]; then
+		[ "$helper_status" -eq "$ksft_skip" ] && skip "$2 is unavailable"
+		fail "retained helper exited with status $helper_status while $2"
+	fi
+	fail "retained helper timed out while $2"
+}
+
+written_sectors()
+{
+	awk '{ print $7 }' "/sys/block/${offload_backing##*/}/stat"
+}
+
+vmstat_value()
+{
+	awk -v name="$1" '$1 == name { print $2 }' /proc/vmstat
+}
+
+wait_offload_quiet()
+{
+	# A bio queued inside dm-delay is not yet visible in either the backing
+	# device statistics or the mapped device's inflight counters.
+	sleep 4
+	previous=-1
+	stable=0
+	for _ in $(seq 1 240); do
+		current=$(written_sectors)
+		read -r reads writes < "$dm_inflight"
+		if [ "$current" -eq "$previous" ] && \
+		   [ "$reads" -eq 0 ] && [ "$writes" -eq 0 ]; then
+			stable=$((stable + 1))
+			[ "$stable" -ge 20 ] && return 0
+		else
+			stable=0
+		fi
+		previous=$current
+		sleep 0.05
+	done
+	return 1
+}
+
+check_prereqs
+[ -x ./swap_offload ] || skip "swap_offload helper is unavailable"
+command -v dmsetup >/dev/null 2>&1 || skip "dmsetup is unavailable"
+command -v blockdev >/dev/null 2>&1 || skip "blockdev is unavailable"
+[ -e /sys/fs/cgroup/cgroup.controllers ] ||
+	skip "cgroup v2 controllers are unavailable"
+grep -qw memory /sys/fs/cgroup/cgroup.controllers ||
+	skip "memory controller is unavailable"
+[ -d /sys/kernel/mm/transparent_hugepage ] ||
+	skip "transparent huge pages are unavailable"
+[ -r /sys/kernel/mm/transparent_hugepage/hpage_pmd_size ] ||
+	skip "PMD huge-page size is unavailable"
+grep -q '^swpout_offload_refused ' /proc/vmstat ||
+	skip "offload refusal counters are unavailable"
+
+thp_size=$(cat /sys/kernel/mm/transparent_hugepage/hpage_pmd_size)
+case "$thp_size" in
+	''|*[!0-9]*) skip "invalid PMD huge-page size: $thp_size" ;;
+esac
+[ "$thp_size" -gt 0 ] || skip "PMD huge-page size is zero"
+page_kib=$(awk '/KernelPageSize:/ { print $2; exit }' /proc/self/smaps)
+[ "${page_kib:-0}" -gt 0 ] || skip "cannot determine the base page size"
+page_size=$((page_kib * 1024))
+[ "$page_size" -gt 0 ] || skip "base page size is zero"
+[ $((thp_size % page_size)) -eq 0 ] ||
+	skip "PMD huge-page size is not page aligned"
+thp_kib=$((thp_size / 1024))
+thp_sectors=$((thp_size / 512))
+expected_retained_kib=$((thp_kib - page_kib))
+expected_refused=$((thp_size / page_size))
+
+mkdir "$tmp"
+trap cleanup EXIT
+trap 'exit 129' HUP
+trap 'exit 130' INT
+trap 'exit 143' TERM
+dmsetup targets > "$tmp/dm-targets" 2>/dev/null ||
+	skip "cannot query device-mapper targets"
+grep -q '^delay[[:space:]]' "$tmp/dm-targets" ||
+	skip "device-mapper delay target is unavailable"
+
+if [ -e /sys/module/zswap/parameters/enabled ]; then
+	zswap_enabled=$(cat /sys/module/zswap/parameters/enabled)
+	echo N > /sys/module/zswap/parameters/enabled ||
+		skip "cannot disable zswap"
+fi
+
+# Swap priorities are global.  The ordinary zram device must be preferred to
+# any pre-existing swap, while the delayed offload device remains first for
+# eligible proactive reclaim.
+max_prio=$(awk 'BEGIN { max = -1 } NR > 1 && $5 > max { max = $5 } END { print max }' /proc/swaps)
+[ "$max_prio" -le 32765 ] ||
+	skip "cannot outrank existing swap priority $max_prio"
+safe_prio=$((max_prio + 1))
+offload_prio=$((max_prio + 2))
+
+dev_num=2
+zram_size=$((thp_size * 4))
+[ "$zram_size" -ge 67108864 ] || zram_size=67108864
+zram_sizes="$zram_size $zram_size"
+zram_load
+zram_set_disksizes
+safe="/dev/zram${dev_start}"
+offload_backing="/dev/zram$((dev_start + 1))"
+
+sectors=$(blockdev --getsz "$offload_backing") ||
+	skip "cannot read offload backing size"
+[ "$sectors" -gt 0 ] || skip "offload backing has zero size"
+dm_table="0 $sectors delay $offload_backing 0 0 $offload_backing 0 3000"
+dmsetup --noudevsync --noudevrules create "$dm_name" --table "$dm_table" ||
+	skip "cannot create delayed offload device"
+dm_active=1
+dmsetup --noudevsync --noudevrules info --columns --noheadings \
+	--separator ' ' -o major,minor "$dm_name" > "$tmp/dm-devno" ||
+	skip "cannot identify delayed offload device"
+read -r dm_major dm_minor < "$tmp/dm-devno"
+offload="/dev/mapper/$dm_name"
+if [ ! -e "$offload" ]; then
+	mkdir -p /dev/mapper
+	mknod "$offload" b "$dm_major" "$dm_minor" ||
+		skip "cannot create delayed offload device node"
+	dm_node_created=1
+fi
+dm_inflight="/sys/dev/block/$dm_major:$dm_minor/inflight"
+[ -r "$dm_inflight" ] || skip "cannot observe delayed offload I/O"
+
+mkswap "$safe" >/dev/null || fail "cannot initialise safe swap"
+mkswap "$offload" >/dev/null || fail "cannot initialise offload swap"
+swapon -p "$safe_prio" "$safe" || fail "cannot activate safe swap"
+dev_makeswap=$dev_start
+safe_active=1
+./swap_offload activate-no-discard "$offload" "$offload_prio" ||
+	fail "cannot activate offload-only swap"
+offload_active=1
+
+cgroup_enable_memory_controller "$cgroup_root" ||
+	skip "cannot enable the cgroup v2 memory controller"
+mkdir "$cg" || skip "cannot create test cgroup"
+[ -e "$cg/memory.max" ] ||
+	skip "cgroup v2 memory controller is unavailable"
+echo max > "$cg/memory.swap.max"
+
+./swap_offload retained "$thp_size" "$cg/cgroup.procs" "$ready" \
+	"$touched" "$verified" &
+holder_pid=$!
+require_helper_file "$ready" "creating a PMD-sized anonymous huge folio"
+read -r reported_pid < "$ready"
+[ "$reported_pid" -eq "$holder_pid" ] ||
+	fail "retained helper reported the wrong pid"
+anon_huge_kib=$(awk '/AnonHugePages:/ { print $2 }' \
+	"/proc/$holder_pid/smaps_rollup")
+[ "${anon_huge_kib:-0}" -ge "$thp_kib" ] ||
+	skip "anonymous huge folio was not created"
+echo "$TCID: anonymous_huge_kib=$anon_huge_kib"
+
+# This is the only reclaim before the retained entry is made dirty.  It puts
+# the whole folio on offload-only swap so the later single-page fault leaves
+# sibling swap PTEs referring to the existing slot.
+echo "$thp_size swappiness=max" > "$cg/memory.reclaim" 2>/dev/null || :
+wait_offload_quiet || fail "offload device did not quiesce after setup"
+kill -0 "$holder_pid" || fail "retained helper died during setup reclaim"
+kill -USR1 "$holder_pid" || fail "cannot request the dirty-page transition"
+require_helper_file "$touched" "faulting and dirtying the retained entry"
+retained_kib=$(awk '/VmSwap:/ { print $2 }' "/proc/$holder_pid/status")
+[ "${retained_kib:-0}" -eq "$expected_retained_kib" ] ||
+	fail "retained $retained_kib KiB, expected $expected_retained_kib KiB"
+echo "$TCID: retained_kib=$retained_kib"
+
+wait_offload_quiet || fail "offload device did not quiesce before pressure"
+ordinary_before=$(written_sectors)
+refused_before=$(vmstat_value swpout_offload_refused)
+echo $((thp_size / 2)) > "$cg/memory.high" ||
+	fail "ordinary pressure reclaim failed"
+wait_offload_quiet || fail "offload device did not quiesce after pressure"
+ordinary_after=$(written_sectors)
+refused_after=$(vmstat_value swpout_offload_refused)
+ordinary_writes=$((ordinary_after - ordinary_before))
+refused_pages=$((refused_after - refused_before))
+echo "$TCID: ordinary_sectors=$ordinary_writes refused_pages=$refused_pages"
+[ "$ordinary_writes" -eq 0 ] ||
+	fail "ordinary reclaim wrote $ordinary_writes offload sectors"
+[ "$refused_pages" -ge "$expected_refused" ] ||
+	fail "ordinary reclaim refused $refused_pages pages, expected at least $expected_refused"
+kill -0 "$holder_pid" || fail "retained helper died after refused write"
+rm -f "$verified"
+kill -USR2 "$holder_pid" || fail "cannot request dirty-byte verification"
+require_helper_file "$verified" "verifying the dirty retained byte"
+
+# Proactive reclaim must still be able to rewrite the retained PMD-sized slot.
+# Repeated requests make the test insensitive to a short-lived writeback
+# collision; the backing-sector delta still requires exactly one folio write.
+wait_offload_quiet || fail "offload device did not quiesce before recovery"
+recovery_before=$(written_sectors)
+echo max > "$cg/memory.high"
+for _ in $(seq 1 8); do
+	echo "$thp_size swappiness=max" > "$cg/memory.reclaim" 2>/dev/null || :
+done
+wait_offload_quiet || fail "offload device did not quiesce after recovery"
+recovery_after=$(written_sectors)
+recovery_writes=$((recovery_after - recovery_before))
+echo "$TCID: recovery_sectors=$recovery_writes"
+[ "$recovery_writes" -eq "$thp_sectors" ] ||
+	fail "proactive recovery wrote $recovery_writes sectors, expected $thp_sectors"
+kill -0 "$holder_pid" || fail "retained helper died during recovery"
+rm -f "$verified"
+kill -ALRM "$holder_pid" || fail "cannot request full data verification"
+require_helper_file "$verified" "verifying all retained data"
+kill -0 "$holder_pid" || fail "retained helper failed full data verification"
+
+kill "$holder_pid" || fail "cannot stop retained helper"
+if wait "$holder_pid"; then
+	:
+else
+	status=$?
+	[ "$status" -eq 143 ] || fail "retained helper exited with status $status"
+fi
+holder_pid=""
+swapoff "$offload" || fail "cannot deactivate offload-only swap"
+offload_active=0
+swapoff "$safe" || fail "cannot deactivate safe swap"
+safe_active=0
+dev_makeswap=-1
+dmsetup --noudevsync --noudevrules remove "$dm_name" ||
+	fail "cannot remove delayed offload device"
+dm_active=0
+if [ "$dm_node_created" -eq 1 ]; then
+	rm -f "$offload" || fail "cannot remove delayed offload device node"
+	dm_node_created=0
+fi
+rmdir "$cg" || fail "cannot remove test cgroup"
+cg=""
+cgroup_disable_memory_controller "$cgroup_root" ||
+	fail "cannot restore the cgroup memory controller"
+for i in $(seq "$dev_start" "$dev_end"); do
+	echo 1 > "/sys/block/zram${i}/reset" || fail "cannot reset zram$i"
+	if [ "$sys_control" -eq 1 ]; then
+		echo "$i" > /sys/class/zram-control/hot_remove ||
+			fail "cannot remove zram$i"
+	fi
+done
+if [ "$module_load" -eq 1 ]; then
+	rmmod zram || fail "cannot unload zram"
+fi
+dev_end=-1
+if [ -n "$zswap_enabled" ]; then
+	echo "$zswap_enabled" > /sys/module/zswap/parameters/enabled ||
+		fail "cannot restore zswap"
+	zswap_enabled=""
+fi
+rm -rf "$tmp" || fail "cannot remove temporary files"
+tmp=""
+
+echo "$TCID: [PASS]"
-- 
2.55.0

