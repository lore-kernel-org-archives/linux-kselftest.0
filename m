Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D903BB133;
	Sun, 27 Sep 2026 08:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790498981; cv=none; b=mxayVvJjosohBDxZJY+ez801YKUrTNVkRBaRUBrpLyGL4ruD0rEGdlKmWzflklzbpGErf2XLaxMGBRe9b3EGpPjniTQdqycfLKjq+h0vCNq9hNj9z26W+AlTqmwawPMlJDfhArjBGst7VlIBNJ0IuO67UA2k3rydLkJIK9tRe3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790498981; c=relaxed/simple;
	bh=HacJOlFHWJNV1kGTeM3xvuIEvQoqdGcDtQ3/RDNe+ag=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZQf2pceNr5TSO0KZZthZyLDuHI6xsjJyhvG96x7miY5NocRAbP8J83ubWARv/JZbYbxypMOJVn/ypNyicbOYq19ViKX2L81Z05+Ky99mkbY4reUlCV86u1bPkoEuveUQbYoaHg473RlgCVvFQ7w0I7K7zqksskPyWZTYnGAsByg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=qwraTI9J; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="qwraTI9J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1790498971;
	bh=HacJOlFHWJNV1kGTeM3xvuIEvQoqdGcDtQ3/RDNe+ag=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qwraTI9J2+D8S7Nz1gYM45U/38DafRc9uqnA6al52G8kSMKRxiFFAyJXs/yS3o35w
	 2H84CmsE28wnFJT47AC8zxmJcXZy0Of3TJr0gi6iuxkZb3v9vmF9D9dhkuuOfHSFMN
	 e/c7+DDQflwPWJCHhuIzu6+IwE+7lCQ7gDK+4S0Y=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sun, 27 Sep 2026 10:49:12 +0200
Subject: [PATCH 1/5] selftests/nolibc: make the broken MIPS N32 argument
 detection reusable
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260927-nolibc-pread-v1-1-e9af6e47b37a@weissschuh.net>
References: <20260927-nolibc-pread-v1-0-e9af6e47b37a@weissschuh.net>
In-Reply-To: <20260927-nolibc-pread-v1-0-e9af6e47b37a@weissschuh.net>
To: Willy Tarreau <w@1wt.eu>, Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790498970; l=2326;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=HacJOlFHWJNV1kGTeM3xvuIEvQoqdGcDtQ3/RDNe+ag=;
 b=lf86yejgQEgcfGxPvYnoXwLi5QqS4cBeOJ8+D1Vf5tVChWCytkeGNUXqkYHnPKhkIBq0dhApb
 ykJ365RycgjDjkw/fq/x37Sr+Tvlyt9vd+TRa1m7iEPx5wKFcLiLbdc
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Another test is about to be added which needs to make use of this.
Move the definition into a reusable variable.

As a side-effect, the test is now properly marked as skipped.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 tools/testing/selftests/nolibc/nolibc-test.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/nolibc/nolibc-test.c b/tools/testing/selftests/nolibc/nolibc-test.c
index 1995d67dcca6..c344675ad0c9 100644
--- a/tools/testing/selftests/nolibc/nolibc-test.c
+++ b/tools/testing/selftests/nolibc/nolibc-test.c
@@ -1525,12 +1525,6 @@ int test_large_file(void)
 	ssize_t written;
 	off_t off;
 
-#if defined(__mips__) && defined(_ABIN32)
-	/* https://lore.kernel.org/qemu-devel/fed03914-a95a-4522-a432-f129264cb2ac@t-8ch.de/ */
-	if (getpid() != 1)
-		return 0;
-#endif
-
 	if (large_seek < UINT32_MAX) {
 		errno = EOVERFLOW;
 		return -1;
@@ -1651,6 +1645,7 @@ int run_syscall(int min, int max)
 	void *p1, *p2;
 	int has_gettid = 1;
 	int has_brk;
+	int has_working_64bit_syscall_arg = 1;
 
 	/* <proc> indicates whether or not /proc is mounted */
 	proc = stat("/proc", &stat_buf) == 0;
@@ -1666,6 +1661,11 @@ int run_syscall(int min, int max)
 	/* on musl setting brk()/sbrk() always fails */
 	has_brk = brk(0) == 0;
 
+#if defined(__mips__) && defined(_ABIN32)
+	/* https://lore.kernel.org/qemu-devel/fed03914-a95a-4522-a432-f129264cb2ac@t-8ch.de/ */
+	has_working_64bit_syscall_arg = getpid() == 1;
+#endif
+
 	for (test = min; test >= 0 && test <= max; test++) {
 		int llen = 0; /* line length */
 
@@ -1781,7 +1781,7 @@ int run_syscall(int min, int max)
 		CASE_TEST(_syscall_noargs);   EXPECT_SYSEQ(is_nolibc, _syscall(__NR_getpid), getpid()); break;
 		CASE_TEST(_syscall_args);     EXPECT_SYSEQ(is_nolibc, _syscall(__NR_statx, 0, NULL, 0, 0, NULL), -EFAULT); break;
 		CASE_TEST(namespace);         EXPECT_SYSZR(euid0 && proc, test_namespace()); break;
-		CASE_TEST(largefile);         EXPECT_SYSZR(1, test_large_file()); break;
+		CASE_TEST(largefile);         EXPECT_SYSZR(has_working_64bit_syscall_arg, test_large_file()); break;
 		case __LINE__:
 			return ret; /* must be last */
 		/* note: do not set any defaults so as to permit holes above */

-- 
2.55.0

