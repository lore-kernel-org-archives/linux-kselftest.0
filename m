Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6283F3CA4AF;
	Tue, 13 Oct 2026 09:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791882525; cv=none; b=BTLAYh7dVTlnXZW8M/AN3ESs/ykMkOY+NExACzI3U2ShTnEgZ7edeIMmMk8L1zn0sPDMc026q8bmis+eSzRyJnqtYFsyrdyV06Vp/lxpym21FRwuX+06b1tLWaWoqmDUzu2ZXiMNGG+LqLFDOxy8C0p/CZ0f6P2bAkr5zBcH+mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791882525; c=relaxed/simple;
	bh=oQCg/opSnSnFyK+sLAbK1dc3dPpsAkgSybMxu8/Rql0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fQuVLOzTXTBy3Y4ChAp5ooyDWvGKGWrF1PyJ7zany5sHvu7fzPd04if0MQmTMOkQgQADn+CTSuQJjS3ibzHbHj/tljblNPZkM0AgreWpZdk/Nl1UT13602Y7zv/NxEu1c5t2gJV1ZY1TNyA8a2rlpYx0L6Qf7E+034mgb47pxXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=WAoweGfr; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="WAoweGfr"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5C9C01BA8;
	Tue, 13 Oct 2026 02:08:40 -0700 (PDT)
Received: from e127648.cambridge.arm.com (e127648.arm.com [10.0.128.106])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 232013F7B4;
	Tue, 13 Oct 2026 02:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791882523; bh=oQCg/opSnSnFyK+sLAbK1dc3dPpsAkgSybMxu8/Rql0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WAoweGfrJkG7Pb0UNJhQonZxz8wROR3WRiBVvUxJSOlGlg8UjmV8rWq6HwCQJ6vt7
	 prQPniF2+zwGiQY9h6FP6vrK6L5h19XsZNOG0dz3xYdo9NQ4g/72cZTF+4+wgVBUsZ
	 lplZy5FUoAOLkyv2LXhu92h4zBhDrb+jKVF+j1NU=
From: Christian Loehle <christian.loehle@arm.com>
To: linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org
Cc: Christian Loehle <christian.loehle@arm.com>,
	Rama Krishna Katta <ramakrishna.katta@arm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Gregory Price <gourry@gourry.net>,
	Kees Cook <kees@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Andy Lutomirski <luto@kernel.org>,
	Gabriel Krisman Bertazi <krisman@suse.de>
Subject: [PATCH RESEND 2/3] selftests/syscall_user_dispatch: Skip tests if SUD is unsupported
Date: Tue, 13 Oct 2026 10:08:20 +0100
Message-Id: <14d5505bdb9073501276f7ae1bd8342e0ac063aa.1791881928.git.christian.loehle@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1791881928.git.christian.loehle@arm.com>
References: <cover.1791881928.git.christian.loehle@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Syscall User Dispatch is unavailable on architectures without generic
syscall entry. Such architectures return -EINVAL for otherwise valid SUD
prctl requests, causing sud_test to report failures.

This also prevents bad_prctl_param from providing useful coverage. The
unsupported stub returns EINVAL before argument validation, so valid
operations fail and requests expected to fail with EFAULT return EINVAL.

Probe SUD with a valid disabled configuration at the start of each test
and skip when the kernel returns EINVAL. Preserve failures for unexpected
errors and continue to run the full test on supported kernels.

Fixes: 179ef035992e ("selftests: Add kselftest for syscall user dispatch")
Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>
Reviewed-by: Gabriel Krisman Bertazi <krisman@suse.de>
Signed-off-by: Christian Loehle <christian.loehle@arm.com>
---
 .../syscall_user_dispatch/sud_test.c          | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/tools/testing/selftests/syscall_user_dispatch/sud_test.c b/tools/testing/selftests/syscall_user_dispatch/sud_test.c
index b855c6000287..1c84b86e24ba 100644
--- a/tools/testing/selftests/syscall_user_dispatch/sud_test.c
+++ b/tools/testing/selftests/syscall_user_dispatch/sud_test.c
@@ -41,6 +41,21 @@
 #define SYSCALL_DISPATCH_ON(x) ((x) = SYSCALL_DISPATCH_FILTER_BLOCK)
 #define SYSCALL_DISPATCH_OFF(x) ((x) = SYSCALL_DISPATCH_FILTER_ALLOW)
 
+static bool require_sud(struct __test_metadata *_metadata)
+{
+	int ret;
+
+	ret = prctl(PR_SET_SYSCALL_USER_DISPATCH, PR_SYS_DISPATCH_OFF,
+		    0UL, 0UL, 0UL);
+	if (ret == -1 && errno == EINVAL)
+		SKIP(return false, "Syscall User Dispatch is not supported");
+	ASSERT_EQ(0, ret) {
+		TH_LOG("PR_SET_SYSCALL_USER_DISPATCH: %m");
+	}
+
+	return true;
+}
+
 /* Test Summary:
  *
  * - dispatch_trigger_sigsys: Verify if PR_SET_SYSCALL_USER_DISPATCH is
@@ -68,6 +83,9 @@ TEST_SIGNAL(dispatch_trigger_sigsys, SIGSYS)
 	struct sysinfo info;
 	int ret;
 
+	if (!require_sud(_metadata))
+		return;
+
 	ret = sysinfo(&info);
 	ASSERT_EQ(0, ret);
 
@@ -105,6 +123,9 @@ TEST(bad_prctl_param)
 	char sel = SYSCALL_DISPATCH_FILTER_ALLOW;
 	int op;
 
+	if (!require_sud(_metadata))
+		return;
+
 	/* Invalid op */
 	op = -1;
 	prctl_invalid(_metadata, op, 0, 0, &sel, EINVAL);
@@ -211,6 +232,9 @@ TEST(dispatch_and_return)
 {
 	long ret;
 
+	if (!require_sud(_metadata))
+		return;
+
 	glob_sel = 0;
 	nr_syscalls_emulated = 0;
 	si_code = 0;
@@ -259,6 +283,9 @@ TEST_SIGNAL(bad_selector, SIGSYS)
 	sigset_t mask;
 	struct sysinfo info;
 
+	if (!require_sud(_metadata))
+		return;
+
 	glob_sel = SYSCALL_DISPATCH_FILTER_ALLOW;
 	nr_syscalls_emulated = 0;
 	si_code = 0;
@@ -301,6 +328,9 @@ TEST(disable_dispatch)
 	struct sysinfo info;
 	char sel = 0;
 
+	if (!require_sud(_metadata))
+		return;
+
 	ret = prctl(PR_SET_SYSCALL_USER_DISPATCH, PR_SYS_DISPATCH_EXCLUSIVE_ON, 0, 0, &sel);
 	ASSERT_EQ(0, ret) {
 		TH_LOG("Kernel does not support CONFIG_SYSCALL_USER_DISPATCH");
@@ -329,6 +359,9 @@ TEST(direct_dispatch_range)
 	struct sysinfo info;
 	char sel = SYSCALL_DISPATCH_FILTER_ALLOW;
 
+	if (!require_sud(_metadata))
+		return;
+
 	/*
 	 * Instead of calculating libc addresses; allow the entire
 	 * memory map and lock the selector.
@@ -365,6 +398,9 @@ static void test_range(struct __test_metadata *_metadata,
 
 TEST(dispatch_range)
 {
+	if (!require_sud(_metadata))
+		return;
+
 	ASSERT_EQ(0, setup_sigsys_handler());
 	test_range(_metadata, PR_SYS_DISPATCH_EXCLUSIVE_ON, 0, 0, true);
 	test_range(_metadata, PR_SYS_DISPATCH_EXCLUSIVE_ON, syscall_addr, 1, false);
-- 
2.34.1

