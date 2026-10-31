Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=128.30.2.78
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793463516;
	b=uyXEO26SLAwoDtQQQxy8mzpqk6VqnDDoJ/mYXBl5bsGNZ460BuukUThS4u7WtQ/6VXZu
	 MGWP4DGhBRWAUzPFkvwNu9V4ip0aWkBG56UHlKy7gKAYCD3LE/zMUC3yAj0zF5ZwDsTCw
	 iyS8+v3wO8tSlyWWzbWjIMEw9w0EPgg9QzTkGfbyZvlB8aLywB3yDoXHu/LfQFyKGvsFg
	 NRKl5cBwUgBVK77hc7oakvXZjV6vRXMDjwKzeitbFRENhL+I9ZGYBBxeJ9Z5BFLgHGTyS
	 FdLfexoJuy2dGQdE0Kj3d2H4T0hrq4dj8Mekb/hz5lv61feNpDF56cOv+8cIeooI57Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793463516;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=sefssd0h9iGFrI1w3mYBioDvjowpq37ELWUYVRuZytk=;
	b=qfBLa7wjQjHz0x/tsjXuIpHS131m1nyuVnQ7V/w74hz4bBChr6/ORCW9oqp7jifrBJ9K
	 XDWHiugTZrVW+YdPCvaNRj9mbBuEnH+f4pMBDMVjeIIsKjklQolinKsi5a61TpxZvkvRP
	 ZPfK/tCdKqqOTqnPmxa0n6e3PgPmwHH13w5ozcrEGITCLzl84UXGUfxGigJZDaPpbPKRR
	 4eo1XUOFicQ0vlTmrvFpPK9CmThjdb5/yNt+VunDibKEndGRQQFOrcMg6HeviZ8to04Y+
	 enkAEKc9eU5Ho4FkoXnDDRzL5yyo5SLfELsP03ubnYPSarHLrn/ZoqovuAezaM5AZTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=csail.mit.edu;
	spf=pass smtp.mailfrom=csail.mit.edu;
	arc=none smtp.remote-ip=128.30.2.78
Received: from outgoing2021.csail.mit.edu (outgoing2021.csail.mit.edu [128.30.2.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D194E606A31C;
	Sat, 31 Oct 2026 16:18:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D194E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csail.mit.edu
Received: from escalante.csail.mit.edu ([128.52.128.198])
	by outgoing2021.csail.mit.edu with esmtp (Exim 4.95)
	(envelope-from <nickolai@csail.mit.edu>)
	id 1xNBml-00Eg4I-B6;
	Sat, 31 Oct 2026 12:18:27 -0400
From: Nickolai Zeldovich <nickolai@csail.mit.edu>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Andy Chiu <andybnac@gmail.com>,
	Guobin Zhang <guobin.zhang@intel.com>,
	Deepak Gupta <debug@rivosinc.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nickolai Zeldovich <nickolai@csail.mit.edu>
Subject: [PATCH v2 2/2] selftests: riscv: test FP state restore when rt_sigreturn() faults
Date: Sat, 31 Oct 2026 12:18:26 -0400
Message-ID: <20261031161826.858908-3-nickolai@csail.mit.edu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261031161826.858908-1-nickolai@csail.mit.edu>
References: <20261031161826.858908-1-nickolai@csail.mit.edu>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a test for the previous patch: the signal frame sits on a
userfaultfd page that the handler drops after dirtying the FP
registers, so rt_sigreturn() sleeps in the middle of copying the FP
registers from the frame. The interrupted code must get its own
registers back.

The test is skipped without the D extension or when userfaultfd is not
available to the caller.

Signed-off-by: Nickolai Zeldovich <nickolai@csail.mit.edu>
---
 .../selftests/riscv/sigreturn/.gitignore      |   1 +
 .../selftests/riscv/sigreturn/Makefile        |   5 +-
 .../selftests/riscv/sigreturn/fp_restore.c    | 146 ++++++++++++++++++
 3 files changed, 151 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/riscv/sigreturn/fp_restore.c

diff --git a/tools/testing/selftests/riscv/sigreturn/.gitignore b/tools/testing/selftests/riscv/sigreturn/.gitignore
index 35002b8ae780..8ed282ecb618 100644
--- a/tools/testing/selftests/riscv/sigreturn/.gitignore
+++ b/tools/testing/selftests/riscv/sigreturn/.gitignore
@@ -1 +1,2 @@
+fp_restore
 sigreturn
diff --git a/tools/testing/selftests/riscv/sigreturn/Makefile b/tools/testing/selftests/riscv/sigreturn/Makefile
index 8c77508641f3..ac7ae7a7c2ae 100644
--- a/tools/testing/selftests/riscv/sigreturn/Makefile
+++ b/tools/testing/selftests/riscv/sigreturn/Makefile
@@ -4,9 +4,12 @@
 
 CFLAGS += -I$(top_srcdir)/tools/include
 
-TEST_GEN_PROGS := sigreturn
+TEST_GEN_PROGS := sigreturn fp_restore
 
 include ../../lib.mk
 
 $(OUTPUT)/sigreturn: sigreturn.c
 	$(CC) -static -o $@ $(CFLAGS) $(LDFLAGS) $^
+
+$(OUTPUT)/fp_restore: fp_restore.c
+	$(CC) -static -pthread -o $@ $(CFLAGS) $(LDFLAGS) $^
diff --git a/tools/testing/selftests/riscv/sigreturn/fp_restore.c b/tools/testing/selftests/riscv/sigreturn/fp_restore.c
new file mode 100644
index 000000000000..1a56684c5f28
--- /dev/null
+++ b/tools/testing/selftests/riscv/sigreturn/fp_restore.c
@@ -0,0 +1,146 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Check that rt_sigreturn() restores the FP registers from the signal
+ * frame when the copy of the frame sleeps on a page fault while the
+ * handler's FP state is dirty.  The frame is placed on a userfaultfd
+ * page that the handler drops, so the copy faults after f0-f15.
+ */
+#include <fcntl.h>
+#include <pthread.h>
+#include <signal.h>
+#include <stdint.h>
+#include <string.h>
+#include <sys/auxv.h>
+#include <sys/ioctl.h>
+#include <sys/mman.h>
+#include <sys/syscall.h>
+#include <ucontext.h>
+#include <unistd.h>
+#include <asm/hwcap.h>
+#include <linux/userfaultfd.h>
+#include "kselftest_harness.h"
+
+#define PAGE		4096UL
+#define STACK_SIZE	65536UL
+/* the page boundary falls this far into the FP image, after f0-f15 */
+#define SPLIT		128
+
+#define F0_15	"0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15"
+/* caller-saved only, so the handler's epilogue does not reload them */
+#define HANDLER_REGS	"0, 1, 2, 3, 4, 5, 6, 7, 10, 11, 12, 13, 14, 15"
+
+static uint64_t pattern[16], handler_pattern[16];
+static void *saved;
+static int placed;
+
+static void handler(int sig, siginfo_t *si, void *context)
+{
+	ucontext_t *uc = context;
+	unsigned long split = (unsigned long)&uc->uc_mcontext.__fpregs + SPLIT;
+
+	placed = !(split & (PAGE - 1));
+	if (placed) {
+		/* rt_sigreturn() will fault on this page and wait for serve() */
+		memcpy(saved, (void *)split, PAGE);
+		if (madvise((void *)split, PAGE, MADV_DONTNEED))
+			_exit(1);
+	}
+	asm volatile(".irp i, " HANDLER_REGS "\n"
+		     "fld f\\i, \\i * 8(%[h])\n"
+		     ".endr\n"
+		     : : [h] "r" (handler_pattern)
+		     : "memory", "ft0", "ft1", "ft2", "ft3", "ft4", "ft5",
+		       "ft6", "ft7", "fa0", "fa1", "fa2", "fa3", "fa4", "fa5");
+}
+
+static void *serve(void *arg)
+{
+	struct uffdio_copy copy = { .src = (unsigned long)saved, .len = PAGE };
+	struct uffd_msg msg;
+	int fd = (long)arg;
+
+	while (read(fd, &msg, sizeof(msg)) == sizeof(msg)) {
+		copy.dst = msg.arg.pagefault.address & ~(PAGE - 1);
+		copy.copy = 0;
+		ioctl(fd, UFFDIO_COPY, &copy);
+	}
+	return NULL;
+}
+
+TEST(fp_restore_frame_fault)
+{
+	struct sigaction sa = {
+		.sa_sigaction = handler,
+		.sa_flags = SA_SIGINFO | SA_ONSTACK,
+	};
+	struct uffdio_api api = { .api = UFFD_API };
+	struct uffdio_register reg = { .mode = UFFDIO_REGISTER_MODE_MISSING };
+	stack_t ss = { .ss_size = STACK_SIZE };
+	long pid = getpid(), tid = syscall(__NR_gettid);
+	uint64_t out[16];
+	unsigned long fcsr, shift;
+	pthread_t thread;
+	int fd, i;
+
+	if (!(getauxval(AT_HWCAP) & COMPAT_HWCAP_ISA_D))
+		SKIP(return, "no D extension");
+
+	fd = syscall(__NR_userfaultfd, O_CLOEXEC);
+	if (fd < 0)
+		SKIP(return, "userfaultfd not available");
+	ASSERT_EQ(0, ioctl(fd, UFFDIO_API, &api));
+
+	for (i = 0; i < 16; i++) {
+		pattern[i] = 0x4010000000000000ULL + i;
+		handler_pattern[i] = 0xbff0000000000000ULL + i;
+	}
+
+	saved = mmap(NULL, PAGE, PROT_READ | PROT_WRITE,
+		     MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	ASSERT_NE(MAP_FAILED, saved);
+	ss.ss_sp = mmap(NULL, STACK_SIZE, PROT_READ | PROT_WRITE,
+			MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	ASSERT_NE(MAP_FAILED, ss.ss_sp);
+	/* populate it, so only the page the handler drops faults */
+	memset(ss.ss_sp, 0, STACK_SIZE);
+	reg.range.start = (unsigned long)ss.ss_sp;
+	reg.range.len = STACK_SIZE;
+	ASSERT_EQ(0, ioctl(fd, UFFDIO_REGISTER, &reg));
+	ASSERT_EQ(0, pthread_create(&thread, NULL, serve, (void *)(long)fd));
+	ASSERT_EQ(0, sigaction(SIGUSR1, &sa, NULL));
+
+	/* lower the frame until the FP image crosses a page at SPLIT */
+	for (shift = 0; shift < PAGE && !placed; shift += 16) {
+		register long a0 asm("a0") = pid;
+		register long a1 asm("a1") = tid;
+		register long a2 asm("a2") = SIGUSR1;
+		register long a7 asm("a7") = __NR_tgkill;
+
+		ss.ss_size = STACK_SIZE - shift;
+		ASSERT_EQ(0, sigaltstack(&ss, NULL));
+		fcsr = 0x1f;
+		asm volatile(".irp i, " F0_15 "\n"
+			     "fld f\\i, \\i * 8(%[in])\n"
+			     ".endr\n"
+			     "csrw fcsr, %[fcsr]\n"
+			     "ecall\n"
+			     "csrr %[fcsr], fcsr\n"
+			     ".irp i, " F0_15 "\n"
+			     "fsd f\\i, \\i * 8(%[out])\n"
+			     ".endr\n"
+			     : "+r" (a0), [fcsr] "+r" (fcsr)
+			     : "r" (a1), "r" (a2), "r" (a7),
+			       [in] "r" (pattern), [out] "r" (out)
+			     : "memory", "ft0", "ft1", "ft2", "ft3", "ft4", "ft5",
+			       "ft6", "ft7", "fs0", "fs1", "fa0", "fa1", "fa2",
+			       "fa3", "fa4", "fa5");
+	}
+	ASSERT_TRUE(placed);
+
+	for (i = 0; i < 16; i++) {
+		EXPECT_EQ(pattern[i], out[i]) TH_LOG("f%d", i);
+	}
+	EXPECT_EQ(0x1fUL, fcsr);
+}
+
+TEST_HARNESS_MAIN
-- 
2.53.0

