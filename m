Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792520401;
	b=nz+D/tBKZIftesX6d0TLViF0BMHplML0pCfuSCLYa0ST9ilbfWgBj9lH3BZ0fV2MmaZg
	 1yJoRdUCQu7TLIX8F3x9Yd5bygUZI53U+GXSaHxxTv+Imgpf41hD/ds3aehlNY+SMl9ao
	 1u86mCU8+2ahDUTRVjKIdKodeSoy2twJ+Vv8HQQtQ/TCFB7ysCgEMRH2A70QTdsafXUA3
	 pQ7uQu7uITFWpHVtJ7DR44d5RhGpQTA0Aib8cGymBmyYXgDRtTVptQTzRtSQt3JIQngz5
	 lJB3pxwMJ32D/MZ4G5aZ9M9Kd+LZZLOLQKbTFek9/wUp/UVhvGqJGh5xnn7b6Gzt/Ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792520401;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=AD4FupzOkNV/tXGDExVuku+h5mwG6UM+nTlzYdmocg8=;
	b=rwCKaA23+785gPMr/LGhp2D6vWupqqHIc/G59n29/DKCHaf260IcvVHDJD+Ht/huPP3X
	 Zo5W315oqWy1wrLmEZDrQahUlbtwpeMcxzo/sSf34WVLVguqZJBnTIfd2feyP+GwrbVGp
	 kCyCE6LXA3vadhsYI5Hpdq/gtQpbzujSeZ1EJLnm7HhaSyJJUnKtA3BDkY0YNKV/E0ZdT
	 LaX6s19tM3ehr9djiMs1zhRbX98RQKRowGplVHG7A2oR8lSQD/mRgq06qj89ADv7vYux5
	 vy9TMQuQRDyf+x/miyaNOo/ttGHqZFl2c49Elh/u2VHBE/yYNBNIXUVVwp40Yw8oEGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YmxDgDCY;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E7D606A323
	for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 18:20:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56E7D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YmxDgDCY
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3514b90bb89so9727777eec.1
        for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 11:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792520400; x=1793125200; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AD4FupzOkNV/tXGDExVuku+h5mwG6UM+nTlzYdmocg8=;
        b=YmxDgDCYwXPLjojoj00LgfK+nMoCRDKWWeILGeajTcfRbuJP/mKX0qAM/tetMB9+sP
         JGBwy2BNDFEAkxnJGecRKgaXlIRajfitIHBhOjG/ZsJl+uflIjSaIaDy3TqkCmYxvxGb
         fi1xyEO0U+BOHn5+UMGGy2cF4jyDAnzcJ0cLQhQTO5OVs2ZGxTw4bUTTnM3Eg0CupABI
         B47zgQsiXBAXnBskNXIEZDRRh+Pxoti6p7kZ6lixWsSv2TG/t+ISucQWiwzROGqPPWdl
         XBHip1/OpV5PwTmydNJCu/LZ5an3N7SLOxIslaRVsJeveuM3D1vCh9L2fIkRl2ihzkaN
         s1iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792520400; x=1793125200;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AD4FupzOkNV/tXGDExVuku+h5mwG6UM+nTlzYdmocg8=;
        b=VpG4H94aF76u0AoRHIA4bqgSPBqM+M1IHAnloq7hpCY4Y0B9+71hHKs7XYrpavREMc
         7naHkAsgnNJ3m7jp4df31l3yxiticVhgXLGsH8KYFWZ+OE9alQy28oY+l1RcdsAs2gIi
         kW1QQTtODbD5COW5rBzwK8bxWiyPncS2XnOor4f+kqcsnughd7gSimjEtZyRj/n2VXz7
         u9TkYSBWaq2OxKc6D7wBa9Cn5HmuT7d12b6rullipJ4gv71sM1fePHT+avPScyJ2mcm7
         AU8duAHFHV+puKW4UIuPr7QTz8sZ8n5CMWki30HLc6eLxdHHPusPv4AoRPaNc0ml/MfT
         NN+Q==
X-Forwarded-Encrypted: i=1; AKwUvBybUZT9k17re3Qhee5byQ/5IzGbhgubOB8ktxPG1sTHicwEzOy+Hewn4WEo7Xk6lxqM0rCPR4wricsLB0GvDoM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIVtwGVuIyzPZwUwoA7AEw+LDAqBvMFnPCT54tAPKtQyloFi9cM
	xf0WM+nyn8fbadSTG2UsGMV4heeIlhmS9HwLBodAXeGUbLfb6g8YE2jW
X-Gm-Gg: AYBFou3W19Pw4dSAuDf5LrdfQW47f0TWEL8bh9Q6NrF2RWuq/AMCPdeijsJLxdlw+EB
	2g/scHjtyrMLDX6IeE0vGnKH3aXvBwS0JRUg/z8ylod7utBFOF6xS4e2HTXtKFU+iuMRo3xSFGy
	x8OK6XYIBHzRAVPvwnoLVLqkR+WJDskRMkwoQFE+kClgCJxGgdLtbnWWdEEeaBwAx7c74LmGZ+q
	XB6suOi5yKpnwBPpIfnvNj2/pUjP1oIKYiMYfJCgqp1jOORZq/G7vbJk8nR0yvrfL4SARHA7N+v
	gIwE+KRI1ZRhllTDe3tVE5diUxCoa334K25+vSK3KjjpxPLSbXXSA8EGX3yw65OBvZJ2osOAdTc
	ju/u0YnEZ754dXLs70uH77Dix0/weGhUh9rSgd/AqoiJCWw9g1rEGx26luCWrrOuZkB4uQhDr0Z
	y7NgdhnQ+tMGomGH+NjrQp1caRBihl95KS6gl1ZebAw4/XeOIqNHXt4VF4itg1Td4hHQ0gVWOq/
	q0=
X-Received: by 2002:a05:693c:65cc:b0:367:23b6:94e1 with SMTP id 5a478bee46e88-3674e25bf5cmr60596eec.41.1792520400378;
        Tue, 20 Oct 2026 11:20:00 -0700 (PDT)
Received: from unix.. ([181.229.23.179])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3673e15353csm523728eec.2.2026.10.20.11.19.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 11:20:00 -0700 (PDT)
From: =?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Deepak Gupta <debug@rivosinc.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Shuah Khan <shuah@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	James Morse <james.morse@arm.com>,
	Yury Khrustalev <yury.khrustalev@arm.com>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Zong Li <zong.li@sifive.com>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
	Zishun Yi <vulab@iscas.ac.cn>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>
Subject: [PATCH v2 4/4] selftests/riscv: shadow stack must not leak on a failed clone3
Date: Tue, 20 Oct 2026 15:19:33 -0300
Message-ID: <2c48cc867d005e2e54ca7d6c28c7f87b32a7a70b.1792519121.git.ivanrwcm25@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1792519121.git.ivanrwcm25@gmail.com>
References: <cover.1792519121.git.ivanrwcm25@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

clone3(CLONE_VM|CLONE_PIDFD) with an unwritable pidfd pointer fails
in put_user() after copy_thread() has mapped a shadow stack.
copy_process() then calls exit_thread(). Without HAVE_EXIT_THREAD
that free is a no-op and the VMA stays in the parent's mm.

Use kselftest.h / KTAP. Skip paths that cannot run the regression
run before ksft_set_plan(). Then confirm a valid clone3 writes a
pidfd, reject 16 bad-pidfd clones with -EFAULT, and require the
shadow-stack VMA count (VmFlags " ss") to stay unchanged.

ENOSYS, EINVAL, and EPERM from the valid clone skip. The rejected
child exits with a raw ecall. The test expects /proc already
mounted. The Makefile skips this binary when the compiler cannot
target zicfiss/zicfilp.

Assisted-by: LLM
Signed-off-by: Iván Ezequiel Rodriguez <ivanrwcm25@gmail.com>
---
 tools/testing/selftests/riscv/cfi/Makefile    |   5 +-
 .../selftests/riscv/cfi/shstk-clone-pidfd.c   | 173 ++++++++++++++++++
 2 files changed, 177 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/riscv/cfi/shstk-clone-pidfd.c

diff --git a/tools/testing/selftests/riscv/cfi/Makefile b/tools/testing/selftests/riscv/cfi/Makefile
index 418b4b5325a5..dbecb1fd3b82 100644
--- a/tools/testing/selftests/riscv/cfi/Makefile
+++ b/tools/testing/selftests/riscv/cfi/Makefile
@@ -13,10 +13,13 @@ endif
 
 
 ifeq ($(shell $(CC) $(CFLAGS) -nostdlib -xc /dev/null -o /dev/null > /dev/null 2>&1; echo $$?),0)
-TEST_GEN_PROGS := cfitests
+TEST_GEN_PROGS := cfitests shstk-clone-pidfd
 
 $(OUTPUT)/cfitests: cfitests.c shadowstack.c
 	$(CC) -o $@ $(CFLAGS) $(LDFLAGS) $^
+
+$(OUTPUT)/shstk-clone-pidfd: shstk-clone-pidfd.c
+	$(CC) -o $@ $(CFLAGS) $(LDFLAGS) $^
 else
 
 $(shell echo "Toolchain doesn't support CFI, skipping CFI kselftest." >&2)
diff --git a/tools/testing/selftests/riscv/cfi/shstk-clone-pidfd.c b/tools/testing/selftests/riscv/cfi/shstk-clone-pidfd.c
new file mode 100644
index 000000000000..1f16d9c513e6
--- /dev/null
+++ b/tools/testing/selftests/riscv/cfi/shstk-clone-pidfd.c
@@ -0,0 +1,173 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * clone3(CLONE_VM|CLONE_PIDFD) with an unwritable pidfd pointer must
+ * not leak a shadow-stack VMA. copy_thread() maps one, then put_user()
+ * fails and copy_process() calls exit_thread(). Without HAVE_EXIT_THREAD
+ * that free is a no-op and the VMA stays in the parent's mm.
+ *
+ * After enabling the shadow stack, do not return from main(): libc
+ * frames above that point have no shadow-stack entries.
+ */
+#define _GNU_SOURCE
+
+#include <errno.h>
+#include <linux/prctl.h>
+#include <linux/sched.h>
+#include <sched.h>
+#include <signal.h>
+#include <stdint.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/mman.h>
+#include <sys/syscall.h>
+#include <sys/wait.h>
+#include <unistd.h>
+
+#include "../../kselftest.h"
+#include "cfi_rv_test.h"
+
+#ifndef __NR_clone3
+#define __NR_clone3 435
+#endif
+
+#ifndef PR_GET_SHADOW_STACK_STATUS
+#define PR_GET_SHADOW_STACK_STATUS	74
+#endif
+#ifndef PR_SET_SHADOW_STACK_STATUS
+#define PR_SET_SHADOW_STACK_STATUS	75
+#endif
+#ifndef PR_SHADOW_STACK_ENABLE
+#define PR_SHADOW_STACK_ENABLE		(1UL << 0)
+#endif
+
+#define NCLONE			16
+#define STACK_SIZE		(64 * 1024)
+
+static int count_ss_vmas(void)
+{
+	FILE *f;
+	char line[256];
+	int vmas = 0;
+
+	f = fopen("/proc/self/smaps", "r");
+	if (!f)
+		ksft_exit_fail_msg("fopen /proc/self/smaps: %s\n",
+				   strerror(errno));
+
+	while (fgets(line, sizeof(line), f)) {
+		if (!strncmp(line, "VmFlags:", 8) && strstr(line, " ss"))
+			vmas++;
+	}
+	fclose(f);
+	return vmas;
+}
+
+/*
+ * Raw ecall: the child resumes on an empty shadow stack, so a libc
+ * return after clone3 would fault.
+ */
+static long clone_pidfd(void *stack, size_t stack_size, int *pidfd_ptr)
+{
+	struct clone_args args = {
+		.flags = CLONE_VM | CLONE_PIDFD,
+		.pidfd = (uint64_t)(uintptr_t)pidfd_ptr,
+		.exit_signal = SIGCHLD,
+		.stack = (uint64_t)(uintptr_t)stack,
+		.stack_size = stack_size,
+	};
+	register long num __asm__("a7") = __NR_clone3;
+	register long ret __asm__("a0") = (long)&args;
+	register long sz __asm__("a1") = sizeof(args);
+	int st;
+
+	asm volatile("ecall"
+		     : "+r"(ret)
+		     : "r"(num), "r"(sz)
+		     : "memory", "cc");
+	if (ret == 0) {
+		register long n __asm__("a7") = __NR_exit;
+		register long e __asm__("a0") = 0;
+
+		asm volatile("ecall" : : "r"(n), "r"(e) : "memory");
+		__builtin_unreachable();
+	}
+	if (ret < 0)
+		return ret;
+	if (waitpid((pid_t)ret, &st, 0) < 0)
+		return -errno;
+	if (!WIFEXITED(st) || WEXITSTATUS(st) != 0)
+		return 1;
+	return 0;
+}
+
+int main(void)
+{
+	void *stack;
+	void *bad_pidfd;
+	unsigned long ss_mode = 0;
+	long rc;
+	int pidfd = -1;
+	int vmas0, vmas1;
+	int i, n_efault = 0;
+
+	ksft_print_header();
+
+	stack = mmap(NULL, STACK_SIZE, PROT_READ | PROT_WRITE,
+		     MAP_PRIVATE | MAP_ANONYMOUS | MAP_STACK, -1, 0);
+	if (stack == MAP_FAILED)
+		ksft_exit_fail_msg("mmap stack: %s\n", strerror(errno));
+
+	bad_pidfd = mmap(NULL, 4096, PROT_NONE,
+			 MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	if (bad_pidfd == MAP_FAILED)
+		ksft_exit_fail_msg("mmap pidfd page: %s\n", strerror(errno));
+
+	rc = my_syscall5(__NR_prctl, PR_GET_SHADOW_STACK_STATUS, &ss_mode,
+			 0, 0, 0);
+	if (rc == -ENOSYS || rc == -EINVAL || rc == -EOPNOTSUPP)
+		ksft_exit_skip("shadow stack not available: %ld\n", rc);
+	if (rc)
+		ksft_exit_fail_msg("PR_GET_SHADOW_STACK_STATUS: %ld\n", rc);
+
+	if (!(ss_mode & PR_SHADOW_STACK_ENABLE)) {
+		rc = my_syscall5(__NR_prctl, PR_SET_SHADOW_STACK_STATUS,
+				 PR_SHADOW_STACK_ENABLE, 0, 0, 0);
+		if (rc == -EOPNOTSUPP || rc == -EINVAL || rc == -EBUSY)
+			ksft_exit_skip("cannot enable shadow stack: %ld\n",
+				       rc);
+		if (rc)
+			ksft_exit_fail_msg("PR_SET_SHADOW_STACK_STATUS: %ld\n",
+					   rc);
+	}
+
+	rc = clone_pidfd(stack, STACK_SIZE, &pidfd);
+	if (rc == -ENOSYS || rc == -EINVAL || rc == -EPERM)
+		ksft_exit_skip("clone3 valid pidfd unavailable: %s\n",
+			       strerror(-rc));
+
+	ksft_set_plan(3);
+
+	ksft_test_result(rc == 0 && pidfd >= 0,
+			 "clone3 valid pidfd (rc=%ld pidfd=%d)\n",
+			 rc, pidfd);
+	if (pidfd >= 0)
+		close(pidfd);
+
+	vmas0 = count_ss_vmas();
+
+	for (i = 0; i < NCLONE; i++) {
+		rc = clone_pidfd(stack, STACK_SIZE, bad_pidfd);
+		if (rc == -EFAULT)
+			n_efault++;
+	}
+	ksft_test_result(n_efault == NCLONE,
+			 "clone3 bad pidfd returns -EFAULT x%d\n", NCLONE);
+
+	vmas1 = count_ss_vmas();
+	ksft_test_result(vmas1 == vmas0,
+			 "no shadow-stack VMA leak (%d -> %d)\n",
+			 vmas0, vmas1);
+
+	ksft_finished();
+}
-- 
2.43.0

