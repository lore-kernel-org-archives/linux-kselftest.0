Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A284F1C2AA;
	Wed, 11 Mar 2026 22:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773266492; cv=none; b=H2zZyEcM6hKJAeRxsRd/YDjKoBzlheAbVG5+voBXdcXJma5Y700Wd6rjNQMBy1oLKvABWM0VafjXACbN+opfaR4oUraVSF46xeEQd2Pnuka98r2N/4v+LSqcst72nbGH501/oce5Rh6C0PGGoeJE02z8poFC5dZ7kCH/O0U3GYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773266492; c=relaxed/simple;
	bh=gckXH9wN4WIXeY1+31lpvhL4hO7sn1D+zyGAFN9lD04=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u1z6A4jMz52ozPKraiF+ytz2k5VmgpKcNQh3EQSYAsjxIx82kQ8NQ6YPiFPJdIbs60ZcOGZjNGzyw6XzTE4CAtO1jLX0ixnboPYVD+KHuuP5jrGDoGgq3Eom3zqVteMNWtjfB7Fb/YkZS96lHRhDA1Zw7CW3Wro8/c349N02fG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=ptdQ1Fpg; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="ptdQ1Fpg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1773266488;
	bh=gckXH9wN4WIXeY1+31lpvhL4hO7sn1D+zyGAFN9lD04=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ptdQ1FpgBWytOzshHGOcgwcsDv9s7MPz8PPjN9cYIHH54GFqe6IG8nKLtDSlkNaJt
	 74YdNdx1OmcEqi60YVibNuzMOEmbKRg1qWNuoRJQe5t9bN/Et3iuiCSIZCkWiLKzVm
	 NRhsqRQgmHPkEJ9ta+jrB5pgHRcYt5ypyO4M0gec=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Wed, 11 Mar 2026 23:00:51 +0100
Subject: [PATCH 3/4] tools/nolibc: add support for
 program_invocation_{,short_}name
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260311-nolibc-err-h-v1-3-735a9de7f15d@weissschuh.net>
References: <20260311-nolibc-err-h-v1-0-735a9de7f15d@weissschuh.net>
In-Reply-To: <20260311-nolibc-err-h-v1-0-735a9de7f15d@weissschuh.net>
To: Willy Tarreau <w@1wt.eu>, Shuah Khan <shuah@kernel.org>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773266488; l=3886;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=gckXH9wN4WIXeY1+31lpvhL4hO7sn1D+zyGAFN9lD04=;
 b=fE2YwWpNIEJqNHEcb/GNbND+fPrZJi0Dxw0sZFtCzCJRSBxmYa/j320jSibGoGHwaKvBbPFuc
 hB9T2qdhpO4BMnB+yppak8bFPFhsQEh04qKDsaB3ondZn6oPAjEKQFr
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Add support for the GNU extensions 'program_invocation_name' and
'program_invocation_short_name'. These are useful to print error
messages, which by convention include the program name.

As these are global variables which take up memory even if not used,
similar to 'errno', gate them behind NOLIBC_IGNORE_ERRNO.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 tools/include/nolibc/crt.h                   | 26 ++++++++++++++++++++++++++
 tools/include/nolibc/errno.h                 |  2 ++
 tools/testing/selftests/nolibc/nolibc-test.c |  2 ++
 3 files changed, 30 insertions(+)

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
index a140c54e4d72..5565ada679cc 100644
--- a/tools/testing/selftests/nolibc/nolibc-test.c
+++ b/tools/testing/selftests/nolibc/nolibc-test.c
@@ -754,6 +754,8 @@ int run_startup(int min, int max)
 		CASE_TEST(constructor);      EXPECT_EQ(is_nolibc, constructor_test_value, 0x3); break;
 		CASE_TEST(linkage_errno);    EXPECT_PTREQ(1, linkage_test_errno_addr(), &errno); break;
 		CASE_TEST(linkage_constr);   EXPECT_EQ(1, linkage_test_constructor_test_value, 0x3); break;
+		CASE_TEST(prog_name_nolibc); EXPECT_STREQ(is_nolibc, program_invocation_short_name, "nolibc-test"); break;
+		CASE_TEST(prog_name_libc);   EXPECT_STREQ(!is_nolibc, program_invocation_short_name, "libc-test"); break;
 		case __LINE__:
 			return ret; /* must be last */
 		/* note: do not set any defaults so as to permit holes above */

-- 
2.53.0

