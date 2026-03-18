Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470C421ADC7;
	Wed, 18 Mar 2026 15:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773849032; cv=none; b=UNZjjM01HvaefOLU7zRX8QHnD7aPgyBhDuSXPaTBKvrewZPTCHHwdHZj8bgkzAkEYMO5/ypdR7UxbipCtYrSlPKLcKqMvyd1Eyq+VZoXdvu6f73ZDxVkhJPsnbuxVGLoJRt845qvRA4xelfFbyynt2jQKfAgi+XTQDOCAHprwnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773849032; c=relaxed/simple;
	bh=CrltttxUhqp5Vd18DjWh/G2vFxyiJizaO2/2C6z0s1I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Kf/hRKwWkNb1Pp6F4KX666y72ffIPXNS8D5E/a5peK4nXOFYElWdwJuxCvkLfzFKxlAr9snN5vouqIXEYCumL19gLei0P86100SiqAWKzfRnb4anR1yUo/yAxi7ZcYF8LbXeu/2vwEcsjr0khClPUlg0IkaygxgEm7i3+njbRD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=ZdUtQ81R; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="ZdUtQ81R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1773849020;
	bh=CrltttxUhqp5Vd18DjWh/G2vFxyiJizaO2/2C6z0s1I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZdUtQ81RWqZBUEvU0CdmQRaWpt1q7ieeRyR05NlaaPCKUPMrDDZMTlTXoQdyux+5Y
	 7hSp8QQURjEJ5PkeGaZU8mtFcysLO23wpGm+OAIG7p18Eo4xPujFrpjOlgpe740Xl0
	 +YrAeYBYn5GIfnhT6gxbJ3Gvy715FussGiB1eX+0=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Wed, 18 Mar 2026 16:50:16 +0100
Subject: [PATCH v4 1/2] tools/nolibc: add support for
 program_invocation_{,short_}name
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260318-nolibc-err-h-v4-1-08247a694bd9@weissschuh.net>
References: <20260318-nolibc-err-h-v4-0-08247a694bd9@weissschuh.net>
In-Reply-To: <20260318-nolibc-err-h-v4-0-08247a694bd9@weissschuh.net>
To: Willy Tarreau <w@1wt.eu>, Shuah Khan <shuah@kernel.org>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773849019; l=5074;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=CrltttxUhqp5Vd18DjWh/G2vFxyiJizaO2/2C6z0s1I=;
 b=sxeXtpDSphiP/ja4oc9JlwX4imD1l+tYlXxoLUoTmhDbsqQLohWxByGjlxAHLjatkTr73Bp9S
 0yG2BeZnxzYCe51jf7uboBC27KjH9hemnzlfrHqiwE2tm6R/AJ5bhhP
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Add support for the GNU extensions 'program_invocation_name' and
'program_invocation_short_name'. These are useful to print error
messages, which by convention include the program name.

As these are global variables which take up memory even if not used,
similar to 'errno', gate them behind NOLIBC_IGNORE_ERRNO.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 tools/include/nolibc/crt.h                   | 26 +++++++++++++++++++++
 tools/include/nolibc/errno.h                 |  4 ++++
 tools/testing/selftests/nolibc/nolibc-test.c | 34 ++++++++++++++++++++++++++++
 3 files changed, 64 insertions(+)

diff --git a/tools/include/nolibc/crt.h b/tools/include/nolibc/crt.h
index d9262998dae9..5bb492555f13 100644
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
 
+#ifndef NOLIBC_IGNORE_ERRNO
+extern char *program_invocation_name __attribute__((weak));
+extern char *program_invocation_short_name __attribute__((weak));
+
+static __inline__
+char *__nolibc_program_invocation_short_name(char *long_name)
+{
+
+	char *short_name;
+
+	short_name = strrchr(long_name, '/');
+	if (!short_name || !short_name[0])
+		return long_name;
+
+	return short_name + 1;
+}
+#endif /* NOLIBC_IGNORE_ERRNO */
+
 void _start_c(long *sp);
 __attribute__((weak,used))
 #if __nolibc_has_feature(undefined_behavior_sanitizer)
@@ -76,6 +95,13 @@ void _start_c(long *sp)
 		;
 	_auxv = auxv;
 
+#ifndef NOLIBC_IGNORE_ERRNO
+	if (argc > 0 && argv[0]) {
+		program_invocation_name = argv[0];
+		program_invocation_short_name = __nolibc_program_invocation_short_name(argv[0]);
+	}
+#endif /* NOLIBC_IGNORE_ERRNO */
+
 	for (ctor_func = __preinit_array_start; ctor_func < __preinit_array_end; ctor_func++)
 		(*ctor_func)(argc, argv, envp);
 	for (ctor_func = __init_array_start; ctor_func < __init_array_end; ctor_func++)
diff --git a/tools/include/nolibc/errno.h b/tools/include/nolibc/errno.h
index 08a33c40ec0c..bab83692ea1c 100644
--- a/tools/include/nolibc/errno.h
+++ b/tools/include/nolibc/errno.h
@@ -15,8 +15,12 @@
 #ifndef NOLIBC_IGNORE_ERRNO
 #define SET_ERRNO(v) do { errno = (v); } while (0)
 int errno __attribute__((weak));
+char *program_invocation_name __attribute__((weak)) = "";
+char *program_invocation_short_name __attribute__((weak)) = "";
 #else
 #define SET_ERRNO(v) do { } while (0)
+#define program_invocation_name ""
+#define program_invocation_short_name ""
 #endif
 
 
diff --git a/tools/testing/selftests/nolibc/nolibc-test.c b/tools/testing/selftests/nolibc/nolibc-test.c
index 180611aabbfb..51da2f9e281b 100644
--- a/tools/testing/selftests/nolibc/nolibc-test.c
+++ b/tools/testing/selftests/nolibc/nolibc-test.c
@@ -42,6 +42,7 @@
 #include <unistd.h>
 #include <limits.h>
 #include <ctype.h>
+#include <stdbool.h>
 
 #pragma GCC diagnostic ignored "-Wmissing-prototypes"
 
@@ -702,6 +703,37 @@ static void constructor2(int argc, char **argv, char **envp)
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
@@ -716,6 +748,7 @@ int run_startup(int min, int max)
 #ifdef NOLIBC
 	test_auxv = _auxv;
 #endif
+	bool proc = access("/proc", R_OK) == 0;
 
 	for (test = min; test >= 0 && test <= max; test++) {
 		int llen = 0; /* line length */
@@ -741,6 +774,7 @@ int run_startup(int min, int max)
 		CASE_TEST(constructor);      EXPECT_EQ(is_nolibc, constructor_test_value, 0x3); break;
 		CASE_TEST(linkage_errno);    EXPECT_PTREQ(1, linkage_test_errno_addr(), &errno); break;
 		CASE_TEST(linkage_constr);   EXPECT_EQ(1, linkage_test_constructor_test_value, 0x3); break;
+		CASE_TEST(prog_name);        EXPECT_ZR(proc, test_program_invocation_name()); break;
 		case __LINE__:
 			return ret; /* must be last */
 		/* note: do not set any defaults so as to permit holes above */

-- 
2.53.0

