Received: from mail-yx2-f18.google.com (mail-yx2-f18.google.com [74.125.224.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EEAE52E04D
	for <linux-kselftest@vger.kernel.org>; Fri, 18 Sep 2026 21:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789768417; cv=none; b=Le44JqgfL9cTU4ykJ4IJVbnA/o8gLfl1oGbKYSJhji+IkVfQ5b1RqkngizlGFAbZMsLpAZPaJgz0jHryiTnjEpVfr7ei/UtLLLYl3B8hYEXxPrMGLYap4l9YA8UCG6MqwwyFKCIfH3AMHIHFqXVLrY1iz4pW8Y6B0Jl3lY3eVQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789768417; c=relaxed/simple;
	bh=uwZv/c7tQiEL+ej6aYvVHDvYLKpa83n1lVZNexSFEAI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RxNhr+PL2gxk4QfMOPal2qOvaOCn0yuxlkqbaPTox1rzLSjhfw+ZRXImFTX30vFIOYf0fhtbhJ7EuzURCDpyfuosfGZcHsArfivRGtKgpCAu0Bf/apXzY16Noit1SG8gd44rtfk0F4uZFp8RscSeRISF1JNcAxHTyvQvcGzS0Qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=hlCIICG/; arc=none smtp.client-ip=74.125.224.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="hlCIICG/"
Received: by mail-yx2-f18.google.com with SMTP id 956f58d0204a3-66e4aac92dbso1166490d50.2
        for <linux-kselftest@vger.kernel.org>; Fri, 18 Sep 2026 14:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1789768414; x=1790373214; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SICfyq893WKBo2pXS1GifsnKMH4aQWw4kYwqMwKqsmQ=;
        b=hlCIICG/y76Q7C7/+xr1+gg8iVFMnecV0knCiz5BeI5Fz63i91sepsuGTMUpWBHSga
         SBIyyYLavRjNK32FpFNb7vRgQdFDR1EcZJxsS4s/H075VLg9KaFk3WX7Vl6btU6e/mAp
         4wuRlqO4WiSNhC/Ls/vVWCYqPy+nUyQjp9fkC+o+A0AacY3KIA+aliajZ/A4ITpjCUE/
         rkIMR1GIQolluW0W3dDcpGMYkcsKA/0QZ62HdA5TXjLLCNkvWX8IrPx6wjXUibrm5W4o
         51SpihrxJUxCPlMg5pYWhLONxW47lgZQ0oTzUBeTz+tEOFv1WJ0zDzCdnoTuPkuXzagj
         +4UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789768414; x=1790373214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SICfyq893WKBo2pXS1GifsnKMH4aQWw4kYwqMwKqsmQ=;
        b=Fce1xcNkATSGkgXTzzlYt7l2L4yaOSFLfRLdSn1QGy4gISfLmuyz4fNpFAT2UWtoqd
         J5jt0linAXi8R75TypCCsEeYzAiNo9KKgHh8tilmBT4RkVT1aRuAFIKLTHdseIoCNehB
         VSK49BOLZAFoklLw8fGZReNmvXqIKnjxiMZSyJpyoj09UTOTODzAZgcGFjJF3QSvM3iX
         r7RM8rZ9qhN/QD0jJ8zfzCGSCzreknxw8fb0goeQ1oE+gYwhFnOZPO4itpSVeMZ7ilXv
         Gi6XZdyW43chn7F1BS75+oreHISZGz9099HRg2J7YqPvZvW75hZcK+Cwiby7UClm0duk
         AhAg==
X-Forwarded-Encrypted: i=1; AKwUvBzzYAziC4+3F8lr2dwy//09i9LPjif0aU254HJ0q5KeZ59U4jz+HcutGuHlYyuJ3O58PcMq4gK5Q2cBUobT6+c=@vger.kernel.org
X-Gm-Message-State: AFuF++n6VKfTfTXi48bm0a44LeAax5qOuZYg4LZckWef5U/DGYxsh/rX
	j06tJ412CcjCHdnvATL4K9lysvQb/ErMJeVzQ+mw84lrc3N3Z97AMB3/vBGxfsAKhl4=
X-Gm-Gg: AYBFou2Bp1hbz2qL5PTz9HAwO5HsR8ua7vIc/eSBBrnn7NLrQ0ahs5kUsUnzyc6itPa
	IUnJSV00ZP8URRQx57tqsn6koyc46Q1BIIh5ZV4FgsKHXBECOhq8lXc36Ytf0BKISOhaPQoZqm6
	Ml3EUQalm6AM4krNyiLKtt0X9RqnPUpCzzcyI+cjr/KhgX7WrDvX89iAB+gfN4KUCba0o1TYI4a
	M80HW0odp3Uk0xHiBTZlCWnymkVRimjhIPgH0Rmf6hI6OCRBeA/Zl2BmLNQlrjTaCgFbLCgBGxN
	LGsCiAIfVzVyL8Y7pLinFAVSCpBO2MxcqFqScfVgnJxLZ2kKqFsrm/Qkznh78UIcSS5AfcntaSR
	A7w4KSACWeCjXFjrZiUst/m6f6/nKXKTgohcwyb21s1/brEzT5W/QYZ1dhn4NXoP83KMUQ855tI
	W94lu4/WMSSJGXY7GnNAQSCEpin4/sWM+Skevnp04l3/Ss9lZVupg+PozBG7pWVz12nyezsezD8
	Iq4ZXp8nE78+EN3KfnY/Z5YKDCkRVbhTM3h
X-Received: by 2002:a05:690e:4548:20b0:670:fe0f:fe39 with SMTP id 956f58d0204a3-6717fdfd203mr887495d50.88.1789768414543;
        Fri, 18 Sep 2026 14:53:34 -0700 (PDT)
Received: from lima-default.tail89d63.ts.net ([12.55.13.134])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-89a45d8fb3csm4017757b3.13.2026.09.18.14.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 14:53:34 -0700 (PDT)
From: Andy Chiu <tchiu@tenstorrent.com>
To: Shuah Khan <shuah@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
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
Subject: [PATCH v6 3/8] selftest: riscv: test vectorized user copy
Date: Fri, 18 Sep 2026 16:51:17 -0500
Message-ID: <20260918215154.2481482-4-tchiu@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918215154.2481482-1-tchiu@tenstorrent.com>
References: <20260918215154.2481482-1-tchiu@tenstorrent.com>
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

