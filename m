Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB953D3491;
	Fri, 13 Mar 2026 20:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773433592; cv=none; b=jd5ZaaO5z3257yZids7Iw0QJParUH09fv4ZooS4YGxigwrEZFQFSGyUPlUb2y4F9BpUpNxyUfPU3HsiQtS6ushRK/IUNw6Z146j4Y7mC8hbmTO/GJyG8Q78dT7TAToHOQZ9CIMEdD92wJZPRSSSRvCXT0evfVdNOl7kpAqZ146M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773433592; c=relaxed/simple;
	bh=hZVfQ0/dCkzXftH42Scb31RyIHJH7EPTXFQkVpXgmu4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ldv+0ZBWWWiiEajbeSO6JR5L4UlalhcPpkg31wXLJpX/qEg/+6s27CZcWjhWHksrESTs2URXr6fr/tqsrQZ8KjIzSXXjcRqU6XGo4oFhZ0PgCBoyWA4gqI4IcPZyP1z2Drs0C8NVmjrekVkD3V2gi4YsgJ+HV5IjIflvV9IXxb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=r4C/z/mI; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="r4C/z/mI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1773433589;
	bh=hZVfQ0/dCkzXftH42Scb31RyIHJH7EPTXFQkVpXgmu4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=r4C/z/mIL+rqocLEAV09aYd6g2xXeYN9hxiTcc37VWKFKrnDJP0BRCaAk4x6xWO3Z
	 lenoKJNNZwfWrzqgkG4TBgIQrBYqlG8sa02csaQ+oCJfLRByVEOjpMK7cl/yQHr92i
	 s7EC/TOmNSno7HlsW+Uv8WPZkzPPOUND8HvnDvYk=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Fri, 13 Mar 2026 21:26:28 +0100
Subject: [PATCH v2 1/2] tools/nolibc: add support for
 program_invocation_{,short_}name
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260313-nolibc-err-h-v2-1-f4481053b07a@weissschuh.net>
References: <20260313-nolibc-err-h-v2-0-f4481053b07a@weissschuh.net>
In-Reply-To: <20260313-nolibc-err-h-v2-0-f4481053b07a@weissschuh.net>
To: Willy Tarreau <w@1wt.eu>, Shuah Khan <shuah@kernel.org>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773433588; l=4762;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=hZVfQ0/dCkzXftH42Scb31RyIHJH7EPTXFQkVpXgmu4=;
 b=bNiyQIt7AszDCvjZbgYDR+7FIUYmxuMEjIgret8aprZ2Nl5CnG8HLO8n1FH/2vqYGnKeT3FgA
 GEuEc8NC4V6Cpf5gz9v83YWHcn1Ribl7Qfx6rn7EntmX4PBuhPi1gxZ
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Add support for the GNU extensions 'program_invocation_name' and
'program_invocation_short_name'. These are useful to print error
messages, which by convention include the program name.

As these are global variables which take up memory even if not used,
similar to 'errno', gate them behind NOLIBC_IGNORE_ERRNO.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 tools/include/nolibc/crt.h                   | 26 ++++++++++++++++++++++
 tools/include/nolibc/errno.h                 |  2 ++
 tools/testing/selftests/nolibc/nolibc-test.c | 33 ++++++++++++++++++++++++++++
 3 files changed, 61 insertions(+)

diff --git a/tools/include/nolibc/crt.h b/tools/include/nolibc/crt.h
index d9262998dae9..842f86e41f2f 100644
--- a/tools/include/nolibc/crt.h
+++ b/tools/include/nolibc/crt.h
@@ -17,6 +17,7 @@ const unsigned long *_auxv __attribute__((weak));
 void _start(void);
 static void __stack_chk_init(void);
 static void exit(int);
+static char *strrchr(const char *s, int c);
 
 extern void (*const __preinit_array_start[])(int, char **, char**) __attribute__((weak));
 extern void (*const __preinit_array_end[])(int, char **, char**) __attribute__((weak));
@@ -27,6 +28,24 @@ extern void (*const __init_array_end[])(int, char **, char**) __attribute__((wea
 extern void (*const __fini_array_start[])(void) __attribute__((weak));
 extern void (*const __fini_array_end[])(void) __attribute__((weak));
 
+extern char *program_invocation_name __attribute__((weak));
+extern char *program_invocation_short_name __attribute__((weak));
+
+static __inline__
+char *__nolibc_program_invocation_short_name(char *long_name)
+{
+	char *short_name;
+
+	if (!long_name)
+		return NULL;
+
+	short_name = strrchr(long_name, '/');
+	if (!short_name || !short_name[0])
+		return NULL;
+
+	return short_name + 1;
+}
+
 void _start_c(long *sp);
 __attribute__((weak,used))
 #if __nolibc_has_feature(undefined_behavior_sanitizer)
@@ -76,6 +95,13 @@ void _start_c(long *sp)
 		;
 	_auxv = auxv;
 
+#ifndef NOLIBC_IGNORE_ERRNO
+	if (argc > 0) {
+		program_invocation_name = argv[0];
+		program_invocation_short_name = __nolibc_program_invocation_short_name(argv[0]);
+	}
+#endif /* NOLIBC_IGNORE_ERRNO */
+
 	for (ctor_func = __preinit_array_start; ctor_func < __preinit_array_end; ctor_func++)
 		(*ctor_func)(argc, argv, envp);
 	for (ctor_func = __init_array_start; ctor_func < __init_array_end; ctor_func++)
diff --git a/tools/include/nolibc/errno.h b/tools/include/nolibc/errno.h
index 08a33c40ec0c..64d9f9bc6539 100644
--- a/tools/include/nolibc/errno.h
+++ b/tools/include/nolibc/errno.h
@@ -15,6 +15,8 @@
 #ifndef NOLIBC_IGNORE_ERRNO
 #define SET_ERRNO(v) do { errno = (v); } while (0)
 int errno __attribute__((weak));
+char *program_invocation_name __attribute__((weak));
+char *program_invocation_short_name __attribute__((weak));
 #else
 #define SET_ERRNO(v) do { } while (0)
 #endif
diff --git a/tools/testing/selftests/nolibc/nolibc-test.c b/tools/testing/selftests/nolibc/nolibc-test.c
index 180611aabbfb..07af23833879 100644
--- a/tools/testing/selftests/nolibc/nolibc-test.c
+++ b/tools/testing/selftests/nolibc/nolibc-test.c
@@ -702,6 +702,37 @@ static void constructor2(int argc, char **argv, char **envp)
 		constructor_test_value |= 1 << 1;
 }
 
+int test_program_invocation_name(void)
+{
+	char buf[100];
+	char *dirsep;
+	ssize_t r;
+	int fd;
+
+	fd = open("/proc/self/cmdline", O_RDONLY);
+	if (fd == -1)
+		return 1;
+
+	r = read(fd, buf, sizeof(buf));
+	close(fd);
+	if (r < 1 || r == sizeof(buf))
+		return 1;
+
+	buf[r - 1] = '\0';
+
+	if (strcmp(program_invocation_name, buf) != 0)
+		return 1;
+
+	dirsep = strrchr(buf, '/');
+	if (!dirsep || dirsep[1] == '\0')
+		return 1;
+
+	if (strcmp(program_invocation_short_name, dirsep + 1) != 0)
+		return 1;
+
+	return 0;
+}
+
 int run_startup(int min, int max)
 {
 	int test;
@@ -716,6 +747,7 @@ int run_startup(int min, int max)
 #ifdef NOLIBC
 	test_auxv = _auxv;
 #endif
+	bool proc = access("/proc", R_OK) == 0;
 
 	for (test = min; test >= 0 && test <= max; test++) {
 		int llen = 0; /* line length */
@@ -741,6 +773,7 @@ int run_startup(int min, int max)
 		CASE_TEST(constructor);      EXPECT_EQ(is_nolibc, constructor_test_value, 0x3); break;
 		CASE_TEST(linkage_errno);    EXPECT_PTREQ(1, linkage_test_errno_addr(), &errno); break;
 		CASE_TEST(linkage_constr);   EXPECT_EQ(1, linkage_test_constructor_test_value, 0x3); break;
+		CASE_TEST(prog_name);        EXPECT_ZR(proc, test_program_invocation_name()); break;
 		case __LINE__:
 			return ret; /* must be last */
 		/* note: do not set any defaults so as to permit holes above */

-- 
2.53.0

