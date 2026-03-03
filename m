Received: from mail-dy1-f201.google.com (mail-dy1-f201.google.com [74.125.82.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495241E1A33
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Mar 2026 01:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772499645; cv=none; b=dv6jNgtK0A7MaGUBsbaU3fF/DxoI8jN1HtYB7lJAbz9RfisS8FpIEKq+YpHu8qdwZWxCzmh9Zk1QuUKh4TUtuLtE57UUIMNkyEk6PiNCWLTyBUhv09OYrCN8SlDmao2PSw296m3NdSlqBHv22rXpvnLG2eJqX8JwDYHMW7H4c/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772499645; c=relaxed/simple;
	bh=pZIzdoHBsTFqWgy15ncCajj5m+dgIqKqfVSYDon3jks=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=iPfyXVEqJQ9CJgPZ9BmGON4zkwLSc/5axFHFBMYc8DIU7MOLeB+V+qDfGSnLheLwCQXyoqYoT6plD+oVqsXNP7sF0D7Q1MNZDNUCDcraFtHM81TwtUTCswLlsWAnCifeFKWS67JH8MCzvhYh7TTfSk1BOWsHz4LLgPFd0vqXIbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jordanrichards.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UkAFldir; arc=none smtp.client-ip=74.125.82.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jordanrichards.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UkAFldir"
Received: by mail-dy1-f201.google.com with SMTP id 5a478bee46e88-2bdc1b30ac8so9703537eec.1
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Mar 2026 17:00:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772499642; x=1773104442; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6LBYWilsGadQ1Pufl4WrAtKAejCy/lhARa3nYcHQerM=;
        b=UkAFldirMBSZU+j201vtp2QPuvl0kXZjRh0Qv/WzbzaiZQihoSUqf2KezEJN+e1uVJ
         Xfms1Yr43LYdI4yXBy0zqLD7ogWOf8/JxCdgI2yCsv9WRU6B8d6p4rwKi4uIq1pSo7az
         l/AuBIiyzWI7UslcpT4gtIjO48aQCU19YfT3dI4J/WfntMVzHUxPqb2YIs4SgkdAHRoJ
         4/QLOs+WJMVqb3B3z+Nl1ouTiLM2n5WwycuzOldVkYC1qs+cFJsqj6t7q18//tY2Q7lC
         YVhFn+al5QmEShCeQ1BACgsaxTPMpP5iQ5tUiGGt1AGUffVM27lyuM2FVCtCwOQIeZMT
         +/zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772499642; x=1773104442;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6LBYWilsGadQ1Pufl4WrAtKAejCy/lhARa3nYcHQerM=;
        b=Ag83RkPun0OgLDVI+oopJhOJwsCMKgZu9YbAN7Huk/QvGeohA4GcgRjlFs0RuHP4ou
         uLmfZDuOjEMJcixIchqpQ9wIn2xOiKiQWYyXMN0giItnRMVb6t6yVdmwW4g07miOlmo9
         j5nTBAvmIID1UkH11ff4c6sgJug96PmQk58vG7KUJq2fVZT5C6oHo4CwlaUedbAtNdEY
         iAz4i43Quc4tPki32O9Ses4tdGnJ5iOyfMyQ+/cqXrTQUCI7h7pcoz4zjoiEJB+EUJss
         H7Y3Vp3QTtPDzrGdpUPwrt2+LetdrlPHTDsQsJGePDjxDvlqh4OnklY8NiX3rgndWQLu
         YWzg==
X-Forwarded-Encrypted: i=1; AJvYcCWJ2XAoRvBDBaj/oZuyc8iFTevNcW7QmaBeIpIfLFJG524KySvKZcheclott4zziZrxAYh2QWuhzN+qNUVOEHQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQyOGO9dVl4028pTOq4uyt6qtl+FCP9t52veWVZ7PhvM+JPDMN
	3x25IhM5U+GjvQq5dzQ0Yfp9eHhPxbfSnxkCUcMdxjDODpMkEwLKRlGzcMmu677sJy+xCdR7YVb
	1mnzpBRgqflq6nDO1ejiKZiCkAMY3/gN6PdWJDQ==
X-Received: from dybir8.prod.google.com ([2002:a05:7300:c8c8:b0:2be:1796:e189])
 (user=jordanrichards job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7300:a198:b0:2be:694:5713 with SMTP id 5a478bee46e88-2be069458e8mr3073775eec.36.1772499642072;
 Mon, 02 Mar 2026 17:00:42 -0800 (PST)
Date: Tue,  3 Mar 2026 01:00:38 +0000
In-Reply-To: <20260303010039.2969125-1-jordanrichards@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260303010039.2969125-1-jordanrichards@google.com>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <20260303010039.2969125-2-jordanrichards@google.com>
Subject: [PATCH v3 1/2] tools/nolibc: add ftruncate()
From: Jordan Richards <jordanrichards@google.com>
To: Pasha Tatashin <pasha.tatashin@soleen.com>, Mike Rapoport <rppt@kernel.org>, 
	Pratyush Yadav <pratyush@kernel.org>, Shuah Khan <shuah@kernel.org>, Willy Tarreau <w@1wt.eu>, 
	"=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?=" <linux@weissschuh.net>
Cc: Jason Miu <jasonmiu@google.com>, David Matlack <dmatlack@google.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Jordan Richards <jordanrichards@google.com>
Content-Type: text/plain; charset="UTF-8"

On architectures with 32-bit longs, call the compat syscall
__NR_ftruncate64. As off_t is 64-bit it must be split into 2 registers.
Unlike llseek() which passes the high and low parts in explicitly named
arguments, the order here is endian independent.

Some architectures (arm, mips, ppc) require this pair of registers to
be aligned to an even register, so add custom sys_ftruncate64 wrappers
for those.

A test case for ftruncate is added which validates negative length or
invalid fd return the appropriate error, and checks the length is
correct on success.

Signed-off-by: Jordan Richards <jordanrichards@google.com>
---
 tools/include/nolibc/arch-arm.h              | 11 +++++
 tools/include/nolibc/arch-mips.h             | 11 +++++
 tools/include/nolibc/arch-powerpc.h          | 11 +++++
 tools/include/nolibc/unistd.h                | 35 ++++++++++++++
 tools/testing/selftests/nolibc/nolibc-test.c | 51 ++++++++++++++++++++
 5 files changed, 119 insertions(+)

diff --git a/tools/include/nolibc/arch-arm.h b/tools/include/nolibc/arch-arm.h
index 251c42579028..ed65fb674e61 100644
--- a/tools/include/nolibc/arch-arm.h
+++ b/tools/include/nolibc/arch-arm.h
@@ -6,9 +6,11 @@
 
 #ifndef _NOLIBC_ARCH_ARM_H
 #define _NOLIBC_ARCH_ARM_H
+#include <linux/unistd.h>
 
 #include "compiler.h"
 #include "crt.h"
+#include "std.h"
 
 /* Syscalls for ARM in ARM or Thumb modes :
  *   - registers are 32-bit
@@ -196,4 +198,13 @@ void __attribute__((weak, noreturn)) __nolibc_entrypoint __no_stack_protector _s
 }
 #endif /* NOLIBC_NO_RUNTIME */
 
+#ifdef __NR_ftruncate64
+static __attribute__((unused))
+int sys_ftruncate64(int fd, uint32_t length0, uint32_t length1)
+{
+	return my_syscall4(__NR_ftruncate64, fd, 0, length0, length1);
+}
+#define sys_ftruncate64 sys_ftruncate64
+#endif
+
 #endif /* _NOLIBC_ARCH_ARM_H */
diff --git a/tools/include/nolibc/arch-mips.h b/tools/include/nolibc/arch-mips.h
index a72506ceec6b..26d044004ec6 100644
--- a/tools/include/nolibc/arch-mips.h
+++ b/tools/include/nolibc/arch-mips.h
@@ -6,9 +6,11 @@
 
 #ifndef _NOLIBC_ARCH_MIPS_H
 #define _NOLIBC_ARCH_MIPS_H
+#include <linux/unistd.h>
 
 #include "compiler.h"
 #include "crt.h"
+#include "std.h"
 
 #if !defined(_ABIO32) && !defined(_ABIN32) && !defined(_ABI64)
 #error Unsupported MIPS ABI
@@ -269,4 +271,13 @@ void __attribute__((weak, noreturn)) __nolibc_entrypoint __no_stack_protector __
 }
 #endif /* NOLIBC_NO_RUNTIME */
 
+#ifdef __NR_ftruncate64
+static __attribute__((unused))
+int sys_ftruncate64(int fd, uint32_t length0, uint32_t length1)
+{
+	return my_syscall4(__NR_ftruncate64, fd, 0, length0, length1);
+}
+#define sys_ftruncate64 sys_ftruncate64
+#endif
+
 #endif /* _NOLIBC_ARCH_MIPS_H */
diff --git a/tools/include/nolibc/arch-powerpc.h b/tools/include/nolibc/arch-powerpc.h
index e0c7e0b81f7c..71829cb027e8 100644
--- a/tools/include/nolibc/arch-powerpc.h
+++ b/tools/include/nolibc/arch-powerpc.h
@@ -6,9 +6,11 @@
 
 #ifndef _NOLIBC_ARCH_POWERPC_H
 #define _NOLIBC_ARCH_POWERPC_H
+#include <linux/unistd.h>
 
 #include "compiler.h"
 #include "crt.h"
+#include "std.h"
 
 /* Syscalls for PowerPC :
  *   - stack is 16-byte aligned
@@ -218,4 +220,13 @@ void __attribute__((weak, noreturn)) __nolibc_entrypoint __no_stack_protector _s
 }
 #endif /* NOLIBC_NO_RUNTIME */
 
+#ifdef __NR_ftruncate64
+static __attribute__((unused))
+int sys_ftruncate64(int fd, uint32_t length0, uint32_t length1)
+{
+	return my_syscall4(__NR_ftruncate64, fd, 0, length0, length1);
+}
+#define sys_ftruncate64 sys_ftruncate64
+#endif
+
 #endif /* _NOLIBC_ARCH_POWERPC_H */
diff --git a/tools/include/nolibc/unistd.h b/tools/include/nolibc/unistd.h
index bb5e80f3f05d..85ac253f9189 100644
--- a/tools/include/nolibc/unistd.h
+++ b/tools/include/nolibc/unistd.h
@@ -48,6 +48,41 @@ int access(const char *path, int amode)
 	return faccessat(AT_FDCWD, path, amode, 0);
 }
 
+#if !defined(sys_ftruncate64) && defined(__NR_ftruncate64)
+static __attribute__((unused))
+int sys_ftruncate64(int fd, uint32_t length0, uint32_t length1)
+{
+
+	return my_syscall3(__NR_ftruncate64, fd, length0, length1);
+}
+#define sys_ftruncate64 sys_ftruncate64
+#endif
+
+static __attribute__((unused))
+int sys_ftruncate(int fd, off_t length)
+{
+#ifdef sys_ftruncate64
+	union {
+		off_t length;
+		struct {
+			uint32_t length0;
+			uint32_t length1;
+		};
+	} arg;
+
+	arg.length = length;
+
+	return sys_ftruncate64(fd, arg.length0, arg.length1);
+#else
+	return my_syscall2(__NR_ftruncate, fd, length);
+#endif
+}
+
+static __attribute__((unused))
+int ftruncate(int fd, off_t length)
+{
+	return __sysret(sys_ftruncate(fd, length));
+}
 
 static __attribute__((unused))
 int msleep(unsigned int msecs)
diff --git a/tools/testing/selftests/nolibc/nolibc-test.c b/tools/testing/selftests/nolibc/nolibc-test.c
index 1b9d3b2e2491..6a84dfbb4b73 100644
--- a/tools/testing/selftests/nolibc/nolibc-test.c
+++ b/tools/testing/selftests/nolibc/nolibc-test.c
@@ -969,6 +969,56 @@ int test_fork(enum fork_type type)
 	}
 }
 
+int test_ftruncate(void)
+{
+	int ret;
+	int fd;
+	struct stat stat_buf;
+	const char *filename = "/tmp/ftruncate_test";
+
+	ret = ftruncate(-1, 0);
+	if (ret != -1 || errno != EBADF) {
+		errno = EINVAL;
+		return __LINE__;
+	}
+
+	fd = open(filename, O_RDWR | O_CREAT);
+	if (fd == -1)
+		return __LINE__;
+
+	ret = ftruncate(fd, -1);
+	if (ret != -1 || errno != EINVAL) {
+		if (ret == 0)
+			errno = EINVAL;
+		ret = __LINE__;
+		goto end;
+	}
+
+	ret = ftruncate(fd, 42);
+	if (ret != 0) {
+		ret = __LINE__;
+		goto end;
+	}
+
+	ret = fstat(fd, &stat_buf);
+	if (ret != 0) {
+		ret = __LINE__;
+		goto end;
+	}
+
+	if (stat_buf.st_size != 42) {
+		errno = EINVAL;
+		ret = stat_buf.st_size;
+		goto end;
+	}
+
+end:
+	close(fd);
+	unlink(filename);
+
+	return ret;
+}
+
 int test_stat_timestamps(void)
 {
 	struct stat st;
@@ -1406,6 +1456,7 @@ int run_syscall(int min, int max)
 		CASE_TEST(file_stream);       EXPECT_SYSZR(1, test_file_stream()); break;
 		CASE_TEST(file_stream_wsr);   EXPECT_SYSZR(1, test_file_stream_wsr()); break;
 		CASE_TEST(fork);              EXPECT_SYSZR(1, test_fork(FORK_STANDARD)); break;
+		CASE_TEST(ftruncate);         EXPECT_SYSZR(1, test_ftruncate()); break;
 		CASE_TEST(getdents64_root);   EXPECT_SYSNE(1, test_getdents64("/"), -1); break;
 		CASE_TEST(getdents64_null);   EXPECT_SYSER(1, test_getdents64("/dev/null"), -1, ENOTDIR); break;
 		CASE_TEST(directories);       EXPECT_SYSZR(proc, test_dirent()); break;
-- 
2.53.0.473.g4a7958ca14-goog

