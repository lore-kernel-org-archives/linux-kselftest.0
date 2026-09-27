Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90813C7E19;
	Sun, 27 Sep 2026 08:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790498984; cv=none; b=onK4nlic0/E+jWBw1GroNyGJfTM1KZ2vqa2hlo29xiRQRJsOroP3aRJj5QsJAJfK1TYuXXDhDbHTTRT8eAAahJipLwcr+uSpmQnefpc204IZwoZgAbmfCrDBiH5vmBuKZeKHgavU4xESkN4hCCOl5nvY8XU54hNPfxPEAdijIdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790498984; c=relaxed/simple;
	bh=jKHsHQu6fDRkoPCtzx9NdGcF+9GBacsRc66HQTc6tqw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JvcQMhcHqIVQEa/LpHQqo6poqQL6fEz2AHInWjvOlLPQjuniVdmJYvzw7NDCx21+3HTq+eqpua23BAY19hCGhHY/o6UoHrUUtUSXLZRSYGpZw2nI+qtqBePEFlVsoRL7YEHdNeU5+X0/6LC2HH192ZJDqO5466VXGpQGDUt8yfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=HUZatX3j; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="HUZatX3j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1790498972;
	bh=jKHsHQu6fDRkoPCtzx9NdGcF+9GBacsRc66HQTc6tqw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=HUZatX3jnZKzGNprZtHVrBBSeluk9pY6SvIOYSbRnOjKUJF7I/x1FWeBZTIX977e9
	 ln2rjkYXcqIcN6Y5Xi0tJS5pqGWC8ZSztoQfOzOJJvMPVB3ob/jYlWBsZQ2s8owwAj
	 5D4LZWmm4mrQ1bR0kfmWxO93oFarhChA1LUTgKVA=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sun, 27 Sep 2026 10:49:16 +0200
Subject: [PATCH 5/5] tools/nolibc: add support for pread() and pwrite()
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260927-nolibc-pread-v1-5-e9af6e47b37a@weissschuh.net>
References: <20260927-nolibc-pread-v1-0-e9af6e47b37a@weissschuh.net>
In-Reply-To: <20260927-nolibc-pread-v1-0-e9af6e47b37a@weissschuh.net>
To: Willy Tarreau <w@1wt.eu>, Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790498970; l=5510;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=jKHsHQu6fDRkoPCtzx9NdGcF+9GBacsRc66HQTc6tqw=;
 b=zSTTEnYfQgjoxlJd+RNnw+twljGgjusDFIijAplibiFArOOEF3Cl9WWSdw3+UKNnj0UO+XoQv
 VLyh/eqMlNGDWKgk1e+UZznR9IXH+oCXbiJ9kytWjffvpb1s9DEgfI/
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

These are standard function to interact with a file descriptor without
touching its internal file offset.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 tools/include/nolibc/arch-sh.h               | 18 ++++++++++
 tools/include/nolibc/sys.h                   | 50 ++++++++++++++++++++++++++++
 tools/testing/selftests/nolibc/nolibc-test.c | 46 +++++++++++++++++++++++++
 3 files changed, 114 insertions(+)

diff --git a/tools/include/nolibc/arch-sh.h b/tools/include/nolibc/arch-sh.h
index a32378fd621f..996cfbe1bee3 100644
--- a/tools/include/nolibc/arch-sh.h
+++ b/tools/include/nolibc/arch-sh.h
@@ -10,6 +10,8 @@
 #include "compiler.h"
 #include "crt.h"
 
+#include <linux/unistd.h>
+
 /*
  * Syscalls for SuperH:
  *   - registers are 32bit wide
@@ -161,4 +163,20 @@ void __attribute__((weak, noreturn)) __nolibc_entrypoint __nolibc_no_stack_prote
 }
 #endif /* NOLIBC_NO_RUNTIME */
 
+static __attribute__((unused))
+ssize_t _sys_pread(int fd, void *buf, size_t count, off_t offset)
+{
+	return __nolibc_syscall6(__NR_pread64, fd, buf, count, 0,
+				 __NOLIBC_LLARGPART(offset, 0), __NOLIBC_LLARGPART(offset, 1));
+}
+#define _sys_pread _sys_pread
+
+static __attribute__((unused))
+ssize_t _sys_pwrite(int fd, const void *buf, size_t count, off_t offset)
+{
+	return __nolibc_syscall6(__NR_pwrite64, fd, buf, count, 0,
+				 __NOLIBC_LLARGPART(offset, 0), __NOLIBC_LLARGPART(offset, 1));
+}
+#define _sys_pwrite _sys_pwrite
+
 #endif /* _NOLIBC_ARCH_SH_H */
diff --git a/tools/include/nolibc/sys.h b/tools/include/nolibc/sys.h
index 7f06d27da612..b63fa6c618c5 100644
--- a/tools/include/nolibc/sys.h
+++ b/tools/include/nolibc/sys.h
@@ -745,6 +745,56 @@ int pivot_root(const char *new, const char *old)
 }
 
 
+/*
+ * ssize_t pread(int fd, void *buf, size_t count, off_t offset);
+ * ssize_t pwrite(int fd, const void *buf, size_t count, off_t offset);
+ */
+
+#ifndef _sys_pread
+static __attribute__((unused))
+ssize_t _sys_pread(int fd, void *buf, size_t count, off_t offset)
+{
+#if __NOLIBC_BITS_PER_SYSCALL_ARG == 64
+	return __nolibc_syscall4(__NR_pread64, fd, buf, count, offset);
+#elif defined(__NOLIBC_PAD_64BIT_SYSCALL_ARGUMENT_PAIR)
+	return __nolibc_syscall6(__NR_pread64, fd, buf, count, 0,
+				 __NOLIBC_LLARGPART(offset, 0), __NOLIBC_LLARGPART(offset, 1));
+#else
+	return __nolibc_syscall5(__NR_pread64, fd, buf, count,
+				 __NOLIBC_LLARGPART(offset, 0), __NOLIBC_LLARGPART(offset, 1));
+#endif
+}
+#endif /* _sys_pread */
+
+static __attribute__((unused))
+ssize_t pread(int fd, void *buf, size_t count, off_t offset)
+{
+	return __sysret(_sys_pread(fd, buf, count, offset));
+}
+
+#ifndef _sys_pwrite
+static __attribute__((unused))
+ssize_t _sys_pwrite(int fd, const void *buf, size_t count, off_t offset)
+{
+#if __NOLIBC_BITS_PER_SYSCALL_ARG == 64
+	return __nolibc_syscall4(__NR_pwrite64, fd, buf, count, offset);
+#elif defined(__NOLIBC_PAD_64BIT_SYSCALL_ARGUMENT_PAIR)
+	return __nolibc_syscall6(__NR_pwrite64, fd, buf, count, 0,
+				 __NOLIBC_LLARGPART(offset, 0), __NOLIBC_LLARGPART(offset, 1));
+#else
+	return __nolibc_syscall5(__NR_pwrite64, fd, buf, count,
+				 __NOLIBC_LLARGPART(offset, 0), __NOLIBC_LLARGPART(offset, 1));
+#endif
+}
+#endif /* _sys_pwrite */
+
+static __attribute__((unused))
+ssize_t pwrite(int fd, const void *buf, size_t count, off_t offset)
+{
+	return __sysret(_sys_pwrite(fd, buf, count, offset));
+}
+
+
 /*
  * ssize_t read(int fd, void *buf, size_t count);
  */
diff --git a/tools/testing/selftests/nolibc/nolibc-test.c b/tools/testing/selftests/nolibc/nolibc-test.c
index c344675ad0c9..f3d0d27cdbe1 100644
--- a/tools/testing/selftests/nolibc/nolibc-test.c
+++ b/tools/testing/selftests/nolibc/nolibc-test.c
@@ -1369,6 +1369,51 @@ int test_pipe(void)
 	return !!memcmp(buf, msg, len);
 }
 
+int test_pwrite_pread(void)
+{
+	const off_t offset = (0x12ULL << 32) | 0x34;
+	ssize_t ret;
+	char buf[2];
+	int fd, err;
+	off_t offs;
+
+	fd = open("/tmp", O_TMPFILE | O_RDWR, 0644);
+	if (fd == -1)
+		return __LINE__;
+
+	/* Write into the middle of the file. */
+	ret = pwrite(fd, "abc", 3, offset);
+	if (ret != 3) {
+		err = __LINE__;
+		goto out;
+	}
+
+	/* Make sure the file offset points somewhere else before pread(). */
+	offs = lseek(fd, 0, SEEK_END);
+	if (offs != offset + 3) {
+		err = __LINE__;
+		goto out;
+	}
+
+	ret = pread(fd, buf, 2, offset + 1);
+	if (ret != 2) {
+		err = __LINE__;
+		goto out;
+	}
+
+	if (buf[0] != 'b' || buf[1] != 'c') {
+		err = __LINE__;
+		goto out;
+	}
+
+	err = 0;
+
+out:
+	close(fd);
+
+	return err;
+}
+
 int test_rlimit(void)
 {
 	struct rlimit rlim = {
@@ -1746,6 +1791,7 @@ int run_syscall(int min, int max)
 		CASE_TEST(poll_stdout);       EXPECT_SYSNE(1, ({ struct pollfd fds = { 1, POLLOUT, 0}; poll(&fds, 1, 0); }), -1); break;
 		CASE_TEST(poll_fault);        EXPECT_SYSER(1, poll(NULL, 1, 0), -1, EFAULT); break;
 		CASE_TEST(prctl);             EXPECT_SYSER(1, prctl(PR_SET_NAME, (unsigned long)NULL, 0, 0, 0), -1, EFAULT); break;
+		CASE_TEST(pwrite_pread);      EXPECT_SYSZR(has_working_64bit_syscall_arg, test_pwrite_pread()); break;
 		CASE_TEST(read_badf);         EXPECT_SYSER(1, read(-1, &tmp, 1), -1, EBADF); break;
 		CASE_TEST(rlimit);            EXPECT_SYSZR(1, test_rlimit()); break;
 		CASE_TEST(rmdir_blah);        EXPECT_SYSER(1, rmdir("/blah"), -1, ENOENT); break;

-- 
2.55.0

