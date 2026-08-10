Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9A042EEA1
	for <linux-kselftest@vger.kernel.org>; Mon, 10 Aug 2026 17:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786382713; cv=none; b=iCuT3JfOTDCnonK06+6RrKemvQhLUDEaQncO5ybyjWNcRZiGiY87XXsBKQ0ubzAJxHA+kKo3nvK4yyjHEF5ceqOhCuCw35/icnZVUrDitmXLvzrefiuR8lQqwD7n3ERB6Xw5szeJ3akS7lEgiIWYK7cPkF93wjuHsVduRRI6wMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786382713; c=relaxed/simple;
	bh=uwZv/c7tQiEL+ej6aYvVHDvYLKpa83n1lVZNexSFEAI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uycrd9p380EcaZ4rV+YymO+mzcY/fRpaxn6S3IUPtViByPoyEjdEE8/9rh/YNVnGiuDNgiBnAkaRyJjHztCk0k90Y2+9Yx3vLDYWV1J6KW5UfAOaVVmuyfn3owESqNjCXctBsDnPHZL5c3wUv4B4RIAWfoZuex7wNklVNg4v9rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=SxYChdPj; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="SxYChdPj"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8487214ad2bso2800525b3a.1
        for <linux-kselftest@vger.kernel.org>; Mon, 10 Aug 2026 10:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1786382711; x=1786987511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SICfyq893WKBo2pXS1GifsnKMH4aQWw4kYwqMwKqsmQ=;
        b=SxYChdPj1jjuTzcgalvOJj9aYQxgVM5a9w+auc4Pw1jHXevYUGLOiO/51AFsLhwNwb
         VaHu5QMo0dmqyIR+uB/g3sNla1FmQEdbLM1j0Ujee7IoM+YpUBiLut00yZZspygfrZF/
         3B+nKbBF05N8JzHGJIODeNf7Z1x6ll/k4Y/vOL6Iix3iJ/DABmNUXpx8aQ6UXrhVeugv
         khTY9Yv42SQzZKJq/bos0HBxucOUGHlwQPDJi7lOPM9Q7SDeSSrLqKWAytFCBH1oNrsd
         cKKvjzdYN12WQ22tIVtZcJ+X/uQyTv/aEI7c0QdgIh1O42Gax9fFOw9K4PedSELGjTUe
         GJWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786382711; x=1786987511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SICfyq893WKBo2pXS1GifsnKMH4aQWw4kYwqMwKqsmQ=;
        b=XaNjOkfQPW5epDCzVLBnYiNNVKRa66XTY7SHsqI1bpyfBcG9f1VYXZnU8uTOnje94R
         FyxYLIZAv55ckcq2m+E1VNyBVDoJ25hoeBWK6OAPnYQF5jVYkUmbGGYxbb2WCUOKMiAp
         5zrnUI9akYaTRSU38MSd2offTpjGNFbXUe+Rjt0hR86gZQggDcIFhEvsfZA4QxCL/tOh
         atMVzRsdJ5HTisxQaIZ52qt1JPg+3HQxzIT4KF0YwvyZSEV3F6zsSODSB7jbIvq8QyOf
         jHRLtXfvE6mh/qU+lAuxeQkwkisWnvHPPuFsop65HY4PTa2io5ISwZAYSRCbaW5DJZWU
         gaJg==
X-Forwarded-Encrypted: i=1; AHgh+Rr7wXQokKCEzcY6GRjOdHcglxnB75NWdwk+YveSZ2ro71HYcuftVuyylPXCaO5IUo41zZ6KmUXTmezumQ9l4QY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+danRYz9H8z69YvtNXIAyWdU0/T2CQhIOws4OxLtUXXtDPB91
	AFwvFw4IuFc2iSHElnbhY4PRvhEK2NxwhlVb4C95XoBA8hMHVAkjRY4AKTwAo3X/8Gc=
X-Gm-Gg: AR+sD11ANaXq+NcUpMWrLw3EAcVaamqiDFGUiWoMOMxwCUAj0iE4TpIroHKmK0EqmrN
	d+Fc61kamcy6y+MlUd63fY70SiBbBbeS6MUQl6PwhR1ggPuD4yPckGHvryNyR+RuAB3b5nCBG8p
	W7ZmeSSyE7Ee2jFD+WKvnA6umLS4bIes7YNDLdWr7AWRzbZVPUwqt0N9bPNH7bLmkMLvS0yNx+i
	NqNYceT+4S3UhgVprTXcVxAab1s6h80PXwysVuB/vzW2aPzs4XA2BoiVV6JoYtUr39l9t2gwFK2
	fNWOjI9Yi5SWhUTMpAPmvgwss6a7/3uRm+LuKJqgF9gQ5n+zAEfMFuY4U5tY4XicYcXj5QuhXF+
	MZk8n6I8Bcytl3mEkAEVWOhIqRrFEHQ1U8w+DfAHFMdcWoeEFFLqe4y2kl/y4uqezDxfC8b2OHS
	GVM7bkIdOBqM18lUgZ21pY9wQELO8J5UahkXnTCFIV4shD7gmnk5p8rNUO0j8BV39p4ZTXh4epK
	1+xl6b6N++EsKYNJdX5sz0SBdu2Xcy1N+1MPkY6HJh9S6W0tO0mu/QxRqZEFIeiF/QftXwJHZyi
X-Received: by 2002:a05:6a00:420f:b0:845:44c7:5e28 with SMTP id d2e1a72fcca58-84f5e0c56admr29573843b3a.31.1786382711117;
        Mon, 10 Aug 2026 10:25:11 -0700 (PDT)
Received: from lima-default.tail89d63.ts.net (61-222-153-199.hinet-ip.hinet.net. [61.222.153.199])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a5898f8sm4149949b3a.52.2026.08.10.10.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 10:25:10 -0700 (PDT)
From: Andy Chiu <tchiu@tenstorrent.com>
To: Shuah Khan <shuah@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	llvm@lists.linux.dev
Cc: andybnac@gmail.com,
	Andy Chiu <tchiu@tenstorrent.com>,
	dfustini@oss.tenstorrent.com,
	greentime.hu@sifive.com,
	Sergey Matyukevich <geomatsi@gmail.com>,
	Zong Li <zong.li@sifive.com>,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>
Subject: [PATCH v5 2/7] selftest: riscv: test vectorized user copy
Date: Mon, 10 Aug 2026 12:22:29 -0500
Message-ID: <20260810172255.1532787-3-tchiu@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810172255.1532787-1-tchiu@tenstorrent.com>
References: <20260810172255.1532787-1-tchiu@tenstorrent.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a test that pushes a 1KiB pseudo-random stream through a pipe, so
write() and read() copy it in and out of the kernel on the vectorized
uaccess path, and compares the result against the original. Both buffers
shift every iteration to sweep all relative alignments, and 16 processes
per online CPU keep the vector unit contended. The compare is a byte at a
time loop through volatile pointers rather than memcmp(), keeping it scalar
and independent of the user vector state.

Assisted-by: Claude-Code:claude-opus-5
Signed-off-by: Andy Chiu <tchiu@tenstorrent.com>
---
Changelog v5:
 - new patch since v5
---
 tools/testing/selftests/riscv/vector/Makefile |   6 +-
 .../selftests/riscv/vector/v_uaccess_stress.c | 221 ++++++++++++++++++
 2 files changed, 226 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/riscv/vector/v_uaccess_stress.c

diff --git a/tools/testing/selftests/riscv/vector/Makefile b/tools/testing/selftests/riscv/vector/Makefile
index 7e0017b3fb8b..0ed09b69dd8a 100644
--- a/tools/testing/selftests/riscv/vector/Makefile
+++ b/tools/testing/selftests/riscv/vector/Makefile
@@ -2,7 +2,8 @@
 # Copyright (C) 2021 ARM Limited
 # Originally tools/testing/arm64/abi/Makefile
 
-TEST_GEN_PROGS := v_initval vstate_prctl vstate_ptrace validate_v_ptrace
+TEST_GEN_PROGS := v_initval vstate_prctl vstate_ptrace validate_v_ptrace \
+		  v_uaccess_stress
 TEST_GEN_PROGS_EXTENDED := vstate_exec_nolibc v_exec_initval_nolibc
 TEST_GEN_LIBS := v_helpers.c sys_hwprobe.c
 
@@ -36,4 +37,7 @@ $(OUTPUT)/vstate_ptrace: vstate_ptrace.c $(OUTPUT)/sys_hwprobe.o $(OUTPUT)/v_hel
 $(OUTPUT)/validate_v_ptrace: validate_v_ptrace.c $(OUTPUT)/sys_hwprobe.o $(OUTPUT)/v_helpers.o
 	$(CC) -static -o $@ $(CFLAGS) $(LDFLAGS) $^
 
+$(OUTPUT)/v_uaccess_stress: v_uaccess_stress.c
+	$(CC) -static -o $@ $(CFLAGS) $(LDFLAGS) $^
+
 EXTRA_CLEAN += $(TEST_GEN_OBJ)
diff --git a/tools/testing/selftests/riscv/vector/v_uaccess_stress.c b/tools/testing/selftests/riscv/vector/v_uaccess_stress.c
new file mode 100644
index 000000000000..d70e0387e246
--- /dev/null
+++ b/tools/testing/selftests/riscv/vector/v_uaccess_stress.c
@@ -0,0 +1,221 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Stress the kernel's user copy path from several processes at once.
+ *
+ * Each child pushes a 1KiB pseudo-random byte stream through a pipe: write()
+ * copies it from user space into the kernel (copy_from_user()) and read()
+ * copies it back out (copy_to_user()). The round trip is repeated 512 times
+ * per child, and every iteration the buffers are shifted so that the copies
+ * cover all of the source/destination alignment combinations.
+ *
+ * On RISC-V those copies may be serviced by kernel-mode vector routines, so
+ * the payload is generated and verified with plain scalar loads and stores
+ * only. The comparison goes through volatile pointers, which keeps both GCC
+ * and clang from turning the loop into a vectorised compare and keeps the
+ * check independent of the user vector state the kernel is supposed to
+ * preserve. memcmp() is avoided for the same reason: the libc version is free
+ * to use vector instructions.
+ */
+
+#include <errno.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
+#include <sys/wait.h>
+
+#include "kselftest_harness.h"
+
+#define ITERATIONS	32768
+#define STREAM_SIZE	1024
+#define MAX_SHIFT	16
+#define BUF_SIZE	(STREAM_SIZE + MAX_SHIFT)
+
+#define CONCURRENCY	16
+
+/* xorshift64*, so the payload does not depend on any libc or kernel helper. */
+static unsigned long prng_state;
+
+static unsigned long prng_next(void)
+{
+	prng_state ^= prng_state >> 12;
+	prng_state ^= prng_state << 25;
+	prng_state ^= prng_state >> 27;
+
+	return prng_state * 2685821657736338717UL;
+}
+
+static void fill_random(unsigned char *buf, size_t len)
+{
+	size_t i;
+
+	for (i = 0; i < len; i++)
+		buf[i] = (unsigned char)(prng_next() >> 24);
+}
+
+/*
+ * Scalar, byte at a time comparison. Returns the offset of the first
+ * mismatching byte, or len when the two streams are identical.
+ */
+static size_t scalar_diff(const unsigned char *a, const unsigned char *b,
+			  size_t len)
+{
+	const volatile unsigned char *va = a;
+	const volatile unsigned char *vb = b;
+	size_t i;
+
+	for (i = 0; i < len; i++) {
+		if (va[i] != vb[i])
+			break;
+	}
+
+	return i;
+}
+
+static ssize_t write_all(int fd, const unsigned char *buf, size_t len)
+{
+	size_t done = 0;
+
+	while (done < len) {
+		ssize_t ret = write(fd, buf + done, len - done);
+
+		if (ret < 0) {
+			if (errno == EINTR)
+				continue;
+			return -1;
+		}
+		done += ret;
+	}
+
+	return done;
+}
+
+static ssize_t read_all(int fd, unsigned char *buf, size_t len)
+{
+	size_t done = 0;
+
+	while (done < len) {
+		ssize_t ret = read(fd, buf + done, len - done);
+
+		if (ret < 0) {
+			if (errno == EINTR)
+				continue;
+			return -1;
+		}
+		if (ret == 0)
+			return -1;
+		done += ret;
+	}
+
+	return done;
+}
+
+/* Runs in the child. Returns the exit status to hand back to the parent. */
+static int child_loop(unsigned long seed)
+{
+	unsigned char src[BUF_SIZE], dst[BUF_SIZE];
+	int pipefd[2];
+	int i;
+
+	prng_state = seed;
+
+	if (pipe(pipefd)) {
+		fprintf(stderr, "pid %d: pipe() failed: %s\n",
+			getpid(), strerror(errno));
+		return 1;
+	}
+
+	for (i = 0; i < ITERATIONS; i++) {
+		/*
+		 * Walk the source and destination through every relative
+		 * alignment, including the case where both are equally
+		 * misaligned.
+		 */
+		unsigned char *in = src + (i % MAX_SHIFT);
+		unsigned char *out = dst + ((i / MAX_SHIFT) % MAX_SHIFT);
+		size_t off;
+
+		fill_random(in, STREAM_SIZE);
+		memset(out, 0, STREAM_SIZE);
+
+		if (write_all(pipefd[1], in, STREAM_SIZE) < 0) {
+			fprintf(stderr, "pid %d: iteration %d: write() failed: %s\n",
+				getpid(), i, strerror(errno));
+			return 1;
+		}
+
+		if (read_all(pipefd[0], out, STREAM_SIZE) < 0) {
+			fprintf(stderr, "pid %d: iteration %d: read() failed: %s\n",
+				getpid(), i, strerror(errno));
+			return 1;
+		}
+
+		off = scalar_diff(in, out, STREAM_SIZE);
+		if (off != STREAM_SIZE) {
+			fprintf(stderr,
+				"pid %d: iteration %d: mismatch at byte %zu of %d (in %p, out %p): expected 0x%02x, got 0x%02x\n",
+				getpid(), i, off, STREAM_SIZE, in, out,
+				in[off], out[off]);
+			return 1;
+		}
+	}
+
+	close(pipefd[0]);
+	close(pipefd[1]);
+
+	return 0;
+}
+
+static int nr_children(void)
+{
+	long online = sysconf(_SC_NPROCESSORS_ONLN);
+
+	return online * CONCURRENCY;
+}
+
+TEST(uaccess_round_trip)
+{
+	int nr = nr_children();
+	int failures = 0;
+	pid_t pids[nr];
+	int i;
+
+	ksft_print_msg("%d children, %d iterations of %d bytes each\n",
+		       nr, ITERATIONS, STREAM_SIZE);
+
+	for (i = 0; i < nr; i++) {
+		pids[i] = fork();
+		ASSERT_LE(0, pids[i]) {
+			TH_LOG("fork() failed: %s", strerror(errno));
+		}
+
+		if (pids[i] == 0) {
+			/* A distinct, reproducible stream per child. */
+			_exit(child_loop(0x9e3779b97f4a7c15UL + i));
+		}
+	}
+
+	for (i = 0; i < nr; i++) {
+		int status;
+
+		if (waitpid(pids[i], &status, 0) < 0) {
+			TH_LOG("waitpid(%d) failed: %s", pids[i],
+			       strerror(errno));
+			failures++;
+			continue;
+		}
+
+		if (WIFSIGNALED(status)) {
+			TH_LOG("child %d killed by signal %d", pids[i],
+			       WTERMSIG(status));
+			failures++;
+		} else if (!WIFEXITED(status) || WEXITSTATUS(status)) {
+			TH_LOG("child %d failed", pids[i]);
+			failures++;
+		}
+	}
+
+	ASSERT_EQ(0, failures);
+}
+
+TEST_HARNESS_MAIN
-- 
2.43.0

