Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794282222;
	b=aCRBp2suZSQrHZTfLjLMpVEniwfJVspxCtW4lFxJ2fD83CwGoTsqvcERpe4NpdQ3+Ps4
	 1CHoiUx3YKKGYrHYZC21o52MaUpo1BQgP4g+BNCf1pFEKXAdWKJCBqk+TE5uvpavRssa3
	 bC23YFSJWsz1Rqd1QBB//DYpbf6X756GmR2w7Y7PVlf4qkAGTr6mUBlHJXvZynQCvxVUQ
	 L7VGtmIkX5ugN3Kiro9rVJAslXtAfRgkMEOz/PFvM4AFF6J3QnEG2l+pgdh4rifdGKt/0
	 anMZCpDPNJNaBmtuJdSFc44sl5d55QRkfEz0ERpOEYwhefi9BT62U9h6tjoGRatoSdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794282222;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=fL+SZuiF3s5j2o9OeQNQ3D7wF9D0Cd00TwqxMtlc1DA=;
	b=WVru1oPXffFp+jsLiXEHhohuWsgOzDUb9pt3BVR5qwoGuE9UaQ0cR1EzCtsPq8z62vwY
	 VRk9ThxhLilX6CMtHetdtP7XeTvybhxXlEluzKv8Ivylyne9d+PL5ifUUKohQ0sXlS4GR
	 rSg4Jicgw9Tsnh31A1mYzpZN/p4Y8GWr1n0WrCGSJ/drP3pK2OGhFiZG42kSqtGNh4NYc
	 yhO1e/Y9JY6vrDmx32QAIosMVCw4CFZwgzfByA4v1F/IDeyqoaNGq8Yu1Mx6AX582cCPr
	 +QXx0O6zmR/UyJ6/vmAxC8kmPQQr9jyk2PuycqnthpN8fwHmXFQEyG/Cb3h7o5wXENQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JY2qCfJL;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EFE060A2617;
	Tue, 10 Nov 2026 03:43:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EFE060A2617
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JY2qCfJL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794282222; x=1825818222;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2YJVWYGG3Vb3zZesqJ3VTTLAhwv3x1ZwrYkzeX+oSuo=;
  b=JY2qCfJLE3WdEnv73uwEekB99X1CSvo0SCm+LvaYLLOhJpqghGGv3eKn
   SOHYLjrWnbNXEbKF2ypbX2riGiTxde/bv30JoZJuN8lVMUJoM/fT7K/VK
   fX1Dleuf//2Y6e7AyqjD1JJuSPQglZLDOezd9kURZKJR1GWVyiNzAfkJ2
   pFp2/2ko5JFBHR7aHr7/uf4BSjIv9zvnasd9lR9JTRv6OjHRWVuPGpIBI
   h/h6yIbCh6Hl8RKLQ9FV8lIh3TmOyWTKZDD13DaKeIyFMiyKPPtiGUTR4
   /uES9LrU44LxanAS+Znsfz+/qATeNvEp1G1LnkBcQeiEMIFICqLbtxTK1
   w==;
X-CSE-ConnectionGUID: OoK7ieoERKiubntZ2d8ijg==
X-CSE-MsgGUID: WJlHbeMkRk+E4tP0DIo3Hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3018038"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="3018038"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 19:43:41 -0800
X-CSE-ConnectionGUID: enaVYPkzQqSIyZMIRQovpQ==
X-CSE-MsgGUID: g3AOKsO+QyugOmG8s6AWFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="8218906"
Received: from chang-linux-3.sc.intel.com (HELO chang-linux-3) ([172.25.66.174])
  by fmviesa003.fm.intel.com with ESMTP; 09 Nov 2026 19:43:41 -0800
From: "Chang S. Bae" <chang.seok.bae@intel.com>
To: linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: x86@kernel.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	shuah@kernel.org,
	chang.seok.bae@intel.com
Subject: [PATCH 5/6] selftests/x86/xstate: Add coredump test
Date: Tue, 10 Nov 2026 03:16:02 +0000
Message-ID: <20261110031603.698635-6-chang.seok.bae@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110031603.698635-1-chang.seok.bae@intel.com>
References: <20261110031603.698635-1-chang.seok.bae@intel.com>
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

The existing ptrace test exercises much of the XSTATE ABI handling, but
it does not cover the coredump path entirely. Add a dedicated test to
validate XSTATE handling in core dumps.

Refactor the XSAVE buffer validation code from the ptrace test for reuse.
Also, move most of the coredump-specific preparation and handling into a
header so that the PKRU test outside the x86 selftest can reuse it.

Signed-off-by: Chang S. Bae <chang.seok.bae@intel.com>
---
 tools/testing/selftests/x86/coredump.h | 229 +++++++++++++++++++++++++
 tools/testing/selftests/x86/xstate.c   |  99 ++++++++---
 2 files changed, 308 insertions(+), 20 deletions(-)
 create mode 100644 tools/testing/selftests/x86/coredump.h

diff --git a/tools/testing/selftests/x86/coredump.h b/tools/testing/selftests/x86/coredump.h
new file mode 100644
index 000000000000..8aef96667f87
--- /dev/null
+++ b/tools/testing/selftests/x86/coredump.h
@@ -0,0 +1,229 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#ifndef __SELFTESTS_X86_COREDUMP_H
+#define __SELFTESTS_X86_COREDUMP_H
+
+#include <link.h>
+#include <stdint.h>
+#include <fcntl.h>
+#include <limits.h>
+
+#include <sys/resource.h>
+#include <sys/mman.h>
+#include <sys/stat.h>
+
+#include "kselftest.h"
+
+#define CORE_PATTERN_PATH "/proc/sys/kernel/core_pattern"
+#ifndef CORENAME_MAX_SIZE
+#define CORENAME_MAX_SIZE 128
+#endif
+
+static char orig_pattern[CORENAME_MAX_SIZE];
+
+static inline bool get_core_pattern(char *buf, int size)
+{
+	bool ret;
+	FILE *fp;
+
+	if (!buf)
+		return false;
+
+	fp = fopen(CORE_PATTERN_PATH, "r");
+	if (!fp)
+		return false;
+
+	ret = fgets(buf, size, fp) != NULL;
+	if (ret)
+		buf[strcspn(buf, "\n")] = 0;
+
+	fclose(fp);
+
+	return ret;
+}
+
+static inline bool set_core_pattern(const char *pattern)
+{
+	bool ret;
+	FILE *fp;
+
+	if (!pattern)
+		return false;
+
+	fp = fopen(CORE_PATTERN_PATH, "w");
+	if (!fp)
+		return false;
+
+	ret = fprintf(fp, "%s\n", pattern) >= 0;
+
+	fclose(fp);
+
+	return ret;
+}
+
+static inline bool save_core_pattern(void)
+{
+	return get_core_pattern(orig_pattern, CORENAME_MAX_SIZE);
+}
+
+static inline bool set_test_core_pattern(void)
+{
+	const char test_pattern[] = "core.%p";
+
+	if (!strcmp(orig_pattern, test_pattern))
+		return true;
+
+	return set_core_pattern(test_pattern);
+}
+
+static inline bool restore_core_pattern(void)
+{
+	return set_core_pattern(orig_pattern);
+}
+
+static char core_dir[] = "/tmp/x86-coredump-XXXXXX";
+
+static struct corefile {
+	bool dumped;
+	int fd;
+	struct stat st;
+	char *image;
+	char path[PATH_MAX];
+} core_file = { false, -1, { }, NULL, "\0" };
+
+static inline void corefile_reset(void)
+{
+	close(core_file.fd);
+	unlink(core_file.path);
+
+	if (core_file.image != NULL && core_file.image != MAP_FAILED)
+		munmap((void *)core_file.image, core_file.st.st_size);
+
+	core_file = (struct corefile){ .dumped = false, .fd = -1, .st = { },
+				       .image = NULL, .path = "\0" };
+}
+
+static inline void coredump_cleanup(void)
+{
+	if (core_file.dumped)
+		corefile_reset();
+
+	rmdir(core_dir);
+	strcpy(core_dir, "/tmp/x86-coredump-XXXXXX");
+	restore_core_pattern();
+}
+
+/*
+ * Create a temporary directory for the core file and configure core_pattern to
+ * use a predictable file name. Save the original pattern so it can be restored
+ * after the test.
+ */
+static inline bool coredump_prepare(void)
+{
+	struct rlimit lim = { RLIM_INFINITY, RLIM_INFINITY };
+
+	if (setrlimit(RLIMIT_CORE, &lim)) {
+		ksft_test_result_skip("Failed to set rlimit. core Try sudo.\n");
+		return false;
+	}
+
+	if (!save_core_pattern()) {
+		ksft_test_result_skip("Failed to save core pattern.\n");
+		return false;
+	}
+
+	if (!set_test_core_pattern()) {
+		ksft_test_result_skip("Failed to update core pattern. Try sudo.\n");
+		return false;
+	}
+
+	if (!mkdtemp(core_dir)) {
+		coredump_cleanup();
+		ksft_test_result_skip("Failed to create test folder.\n");
+		return false;
+	}
+
+	return true;
+}
+
+/* Always call this for any failed exit after coredump_prepare() */
+static inline void coredump_exit_fail_msg(const char *msg)
+{
+	coredump_cleanup();
+	ksft_exit_fail_msg("%s\n", msg);
+}
+
+static inline void coredump_trigger(void)
+{
+	volatile unsigned int *ptr = NULL;
+
+	*ptr = 0xDEAD;
+}
+
+static inline void corefile_map(pid_t child)
+{
+	snprintf(core_file.path, sizeof(core_file.path), "%s/core.%d", core_dir, child);
+
+	core_file.fd = open(core_file.path, O_RDONLY);
+	if (core_file.fd < 0)
+		coredump_exit_fail_msg("Cannot open core file.");
+
+	core_file.dumped = true;
+
+	if (fstat(core_file.fd, &core_file.st))
+		coredump_exit_fail_msg("Invalid core file.");
+
+	core_file.image = mmap(NULL, core_file.st.st_size, PROT_READ, MAP_PRIVATE, core_file.fd, 0);
+	if (core_file.image == MAP_FAILED)
+		coredump_exit_fail_msg("Cannot map core file.");
+}
+
+#ifndef NT_X86_XSTATE
+#define NT_X86_XSTATE	0x202
+#endif
+
+#define next_pos(pos, size)		((pos) + (((size) + 3) & ~3))
+
+/* Program Header */
+#define phdr_ptr(core, offset)		(ElfW(Phdr) *)(core + offset)
+
+/* Note Header */
+#define nhdr_ptr(core, offset)		(ElfW(Nhdr) *)(core + offset)
+
+/*
+ * Locate the NT_X86_XSTATE note in the ELF core image and return a pointer to
+ * its XSTATE data.
+ */
+static inline char *retrieve_corefile_xbuf(void)
+{
+	ElfW(Ehdr) *ehdr;
+	ElfW(Phdr) *phdr;
+	ElfW(Nhdr) *nhdr;
+	size_t pos, end;
+	int i;
+
+	ehdr = (ElfW(Ehdr) *)core_file.image;
+	phdr = phdr_ptr(core_file.image, ehdr->e_phoff);
+
+	for (i = 0; i < ehdr->e_phnum; i++) {
+		if (phdr[i].p_type != PT_NOTE)
+			continue;
+
+		end = phdr[i].p_offset + phdr[i].p_filesz;
+		pos = phdr[i].p_offset;
+
+		while (pos + sizeof(*nhdr) <= end) {
+			nhdr  = nhdr_ptr(core_file.image, pos);
+			pos   = next_pos(pos + sizeof(*nhdr), nhdr->n_namesz);
+
+			if (nhdr->n_type == NT_X86_XSTATE)
+				return core_file.image + pos;
+
+			pos = next_pos(pos, nhdr->n_descsz);
+		}
+	}
+
+	coredump_exit_fail_msg("No NT_X86_XSTATE was found.");
+	_exit(1);
+}
+
+#endif /* __SELFTESTS_X86_COREDUMP_H */
diff --git a/tools/testing/selftests/x86/xstate.c b/tools/testing/selftests/x86/xstate.c
index a2f25ca848fb..fd04fd6fa631 100644
--- a/tools/testing/selftests/x86/xstate.c
+++ b/tools/testing/selftests/x86/xstate.c
@@ -14,6 +14,7 @@
 
 #include "helpers.h"
 #include "xstate.h"
+#include "coredump.h"
 
 /*
  * The userspace xstate test suite is designed to be generic and operates
@@ -243,29 +244,11 @@ static struct xsave_buffer *stashed_xbuf;
  * Ptrace test for the ABI format as described in arch/x86/include/asm/user.h
  */
 
-/*
- * Make sure the ptracee has the expanded kernel buffer on the first use.
- * Then, initialize the state before performing the state injection from
- * the ptracer. For non-dynamic states, this is benign.
- */
-static inline void ptracee_touch_xstate(void)
-{
-	load_rand_xstate(&xstate, stashed_xbuf);
-	load_init_xstate(&xstate, stashed_xbuf);
-}
-
-static bool validate_ptracer_xstate(pid_t target, struct iovec iov,
-				    struct xsave_buffer *xbuf,
-				    struct xsave_buffer *expected)
+static bool validate_abi_xstate(struct xsave_buffer *xbuf,
+				struct xsave_buffer *expected)
 {
 	unsigned int failed = 0;
 
-	if (ptrace(PTRACE_SETREGSET, target, (uint32_t)NT_X86_XSTATE, &iov))
-		ksft_exit_fail_msg("PTRACE_SETREGSET failed\n");
-
-	if (ptrace(PTRACE_GETREGSET, target, (uint32_t)NT_X86_XSTATE, &iov))
-		ksft_exit_fail_msg("PTRACE_GETREGSET failed\n");
-
 	/*
 	 * To track this whole result only, use printf() for skipping sub-test
 	 * counting.
@@ -295,6 +278,30 @@ static bool validate_ptracer_xstate(pid_t target, struct iovec iov,
 	return failed == 0;
 }
 
+/*
+ * Make sure the ptracee has the expanded kernel buffer on the first use.
+ * Then, initialize the state before performing the state injection from
+ * the ptracer. For non-dynamic states, this is benign.
+ */
+static inline void ptracee_touch_xstate(void)
+{
+	load_rand_xstate(&xstate, stashed_xbuf);
+	load_init_xstate(&xstate, stashed_xbuf);
+}
+
+static bool validate_ptracer_xstate(pid_t target, struct iovec iov,
+				    struct xsave_buffer *xbuf,
+				    struct xsave_buffer *expected)
+{
+	if (ptrace(PTRACE_SETREGSET, target, (uint32_t)NT_X86_XSTATE, &iov))
+		ksft_exit_fail_msg("PTRACE_SETREGSET failed\n");
+
+	if (ptrace(PTRACE_GETREGSET, target, (uint32_t)NT_X86_XSTATE, &iov))
+		ksft_exit_fail_msg("PTRACE_GETREGSET failed\n");
+
+	return validate_abi_xstate(xbuf, expected);
+}
+
 /*
  * Ptracer injects the randomized xstate data. It also reads before and
  * after that, which will execute the kernel's state copy functions.
@@ -388,6 +395,57 @@ static void test_ptrace(void)
 	free(stashed_xbuf);
 }
 
+static void test_coredump(void)
+{
+	struct xsave_buffer *xbuf, *corefile_xbuf;
+	pid_t child;
+	int status;
+
+	if (!coredump_prepare())
+		return;
+
+	ksft_print_msg("[RUN]\t%s: validate coredump.\n", xstate.name);
+
+	/*
+	 * Use a shared buffer to retain the expected XSTATE across fork() and
+	 * compare it against the XSTATE saved in the core dump.
+	 */
+	xbuf = mmap(NULL, get_xbuf_size(),
+		    PROT_READ | PROT_WRITE,
+		    MAP_SHARED | MAP_ANONYMOUS, -1, 0);
+	if (xbuf == MAP_FAILED)
+		coredump_exit_fail_msg("mmap() for the shared xsave buffer failed.");
+
+	child = fork();
+	if (child < 0)
+		coredump_exit_fail_msg("fork() failed.");
+
+	if (!child) {
+		if (chdir(core_dir)) {
+			printf("\tchdir() failed.\n");
+			_exit(1);
+		}
+		load_rand_xstate(&xstate, xbuf);
+		coredump_trigger();
+		_exit(1);
+	}
+
+	if (waitpid(child, &status, 0) != child ||
+	    !WIFSIGNALED(status) || WTERMSIG(status) != SIGSEGV)
+		coredump_exit_fail_msg("Child didn't SIGSEGV successfully.");
+
+	corefile_map(child);
+	corefile_xbuf = (struct xsave_buffer *)retrieve_corefile_xbuf();
+
+	if (validate_abi_xstate(corefile_xbuf, xbuf))
+		ksft_test_result_pass("%s for %s\n", __func__, xstate.name);
+	else
+		ksft_test_result_fail("%s for %s\n", __func__, xstate.name);
+
+	munmap(xbuf, get_xbuf_size());
+	coredump_cleanup();
+}
+
 /*
  * Test signal delivery for the ABI compatibility.
  * See the ABI format: arch/x86/include/uapi/asm/sigcontext.h
@@ -511,6 +569,7 @@ static struct test_info {
 	{ .nr = 1, .fn = test_context_switch, },
 	{ .nr = 2, .fn = test_ptrace, },
 	{ .nr = 2, .fn = test_signal, },
+	{ .nr = 1, .fn = test_coredump, },
 };
 
 int test_xstate(uint32_t feature_num)
-- 
2.53.0

