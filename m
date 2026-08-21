Received: from sg-3-111.ptr.tlmpb.com (sg-3-111.ptr.tlmpb.com [101.45.255.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C91E394785
	for <linux-kselftest@vger.kernel.org>; Fri, 21 Aug 2026 10:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.45.255.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787309033; cv=none; b=HtCNCOygA8pJhj0c+r9qo3zROxE4pmwNHEAlAj3y+wKKrXq9Dp4t7Xo91M/bRjvrid0xGzBFYw44c0qF0WUwhbImDu2r305OjigElrxVekpEDh4oLQ8/HpENFhd6G4y7pcJKwqyotPvfcHz60CFDigHbJa6iJwwmVx7xX0bC1TA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787309033; c=relaxed/simple;
	bh=eb/FbkcQ1yOfds5otd9WzCnx2gHZinJnmqDUexxdOaQ=;
	h=To:Cc:Message-Id:Subject:Mime-Version:From:Date:Content-Type; b=DBty9RbzrSjVJ9pjtfhBgP7gDPFt22asVTdNrPUAM8I6pBNH+8Mgu+Z9zUBwtdVAHhRCeQlhHRo7QS83/1n3UXJrt0uE0zpvdo7RkJpp1RYIOT9I6vn5T//OxpRW4enOhIB1mlXMk63k7UTctLIyEv06S1uNRLvg86wIPk1V/6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=CNRHJPdj; arc=none smtp.client-ip=101.45.255.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="CNRHJPdj"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1787308986; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=9z9/dVo62CkO35NnOydRcLhfvu3cyK6bVROTYKEbxeE=;
 b=CNRHJPdjlMKSLh0JtHEZo8Iv0bXHLt+42O3VuT6rgEzTp72rLl7oWZ9505HKqtpCwHFLia
 PslW3Dtz8wv4BmmGZstEIInCk8W003kedh/ruOHrmb1WGddsx7169SoohyUASe5RTywHr0
 T33xyHr4F2B1uwX51FDiHgp5XtUVBDW0cytAPfoqAuAr1iVkNMdwHPj7Z3BHO/lLzSg+Tz
 4ARzScegD6wCZOl4Al4J8NgUCe0x8NMgw64Q13nveMsabZ2WpJT0Rmmwoj8Zj+iOhKqovc
 PxNyNmw8TFQMVwdYFJAcBlz8ZHlRW0U6SB85m5bz9AWsq/wxNLnuQvyTUpRNFw==
To: "Thomas Gleixner" <tglx@kernel.org>, "Ingo Molnar" <mingo@redhat.com>, 
	"Borislav Petkov" <bp@alien8.de>, 
	"Dave Hansen" <dave.hansen@linux.intel.com>, <x86@kernel.org>, 
	"Shuah Khan" <shuah@kernel.org>
Cc: "H . Peter Anvin" <hpa@zytor.com>, "Andy Lutomirski" <luto@kernel.org>, 
	"Kiryl Shutsemau" <kas@kernel.org>, <linux-kernel@vger.kernel.org>, 
	<linux-kselftest@vger.kernel.org>, 
	"Guixiong Wei" <weiguixiong@bytedance.com>
X-Mailer: git-send-email 2.50.1
Message-Id: <20260821104246.59955-2-weiguixiong@bytedance.com>
Content-Transfer-Encoding: 7bit
Subject: [PATCH] selftests/x86: Skip sysret_rip fall-through probes that hit the stack
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Lms-Return-Path: <lba+26a882bb8+7c71a3+vger.kernel.org+weiguixiong@bytedance.com>
From: "Guixiong Wei" <weiguixiong@bytedance.com>
Date: Fri, 21 Aug 2026 18:42:47 +0800
X-Original-From: Guixiong Wei <weiguixiong@bytedance.com>
Content-Type: text/plain; charset=UTF-8

test_syscall_fallthrough_to() relocates the syscall trampoline page to a
target high address with mremap(MREMAP_MAYMOVE | MREMAP_FIXED).  Like
MAP_FIXED, MREMAP_FIXED silently unmaps whatever already occupies the
destination.

The extra self-test at (1<<47) - 2*PAGE_SIZE remaps to 0x7fffffffd000,
and the i==47 interesting case at (1<<47) - PAGE_SIZE remaps to
0x7fffffffe000.  Both sit just below STACK_TOP_MAX (0x7ffffffff000).
With ASLR enabled the stack is randomized elsewhere and these addresses
are free, so the remap is harmless.  With ASLR disabled the stack lives
at its fixed default location and overlaps them, so the remap unmaps the
stack and the process dies with SIGSEGV (exit 139) before the test can
observe anything.

Probe the trampoline and fall-through pages with mincore() and skip any
target whose destination is already in use.  With ASLR enabled -- the
default -- the stack sits elsewhere, so every case still runs.  With
ASLR disabled only the two cases that collide with the stack are
skipped; the noncanonical cases that actually exercise the kernel's
SYSRET handling live far above the stack and always run.

Fixes: 660602140103 ("selftests/x86: Add a selftest for SYSRET to noncanonical addresses")
Signed-off-by: Guixiong Wei <weiguixiong@bytedance.com>
---
 tools/testing/selftests/x86/sysret_rip.c | 28 ++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/tools/testing/selftests/x86/sysret_rip.c b/tools/testing/selftests/x86/sysret_rip.c
index 2e423a335e1c..e4bd3ed881f4 100644
--- a/tools/testing/selftests/x86/sysret_rip.c
+++ b/tools/testing/selftests/x86/sysret_rip.c
@@ -94,6 +94,17 @@ static void sigsegv_for_fallthrough(int sig, siginfo_t *info, void *ctx_void)
 	siglongjmp(jmpbuf, 1);
 }
 
+static bool address_is_mapped(unsigned long addr)
+{
+	unsigned char vec;
+
+	/*
+	 * mincore() succeeds only when the whole range is mapped and fails
+	 * with ENOMEM when the page is not mapped.
+	 */
+	return mincore((void *)addr, 4096, &vec) == 0;
+}
+
 static void test_syscall_fallthrough_to(unsigned long ip)
 {
 	void *new_address = (void *)(ip - 4096);
@@ -101,6 +112,23 @@ static void test_syscall_fallthrough_to(unsigned long ip)
 
 	printf("[RUN]\tTrying a SYSCALL that falls through to 0x%lx\n", ip);
 
+	/*
+	 * MREMAP_FIXED, like MAP_FIXED, silently unmaps whatever already
+	 * occupies the destination.  With ASLR disabled the stack lives at
+	 * the top of the address space and overlaps the high addresses
+	 * exercised here, so a blind remap would clobber the stack and take
+	 * the test down with a SIGSEGV.  Skip any target whose trampoline or
+	 * landing page is already in use; the noncanonical cases that
+	 * actually probe the kernel sit far above the stack and are
+	 * unaffected.
+	 */
+	if (address_is_mapped((unsigned long)new_address) ||
+	    address_is_mapped(ip)) {
+		printf("[SKIP]\t0x%lx: address space near the stack is in use (ASLR off?)\n",
+		       ip);
+		return;
+	}
+
 	ret = mremap((void *)current_test_page_addr, 4096, 4096,
 		     MREMAP_MAYMOVE | MREMAP_FIXED, new_address);
 	if (ret == MAP_FAILED) {

base-commit: f5bbbfec59b4e2fb7520a91de3df8a6174325d6a
-- 
2.50.1 (Apple Git-155)
