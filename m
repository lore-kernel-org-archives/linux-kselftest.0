Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2D03B4E9E;
	Sun, 27 Sep 2026 08:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790498981; cv=none; b=qtEsZJj8xKI35izKoMjHvHKYNDahGm7q+/6FtPZTiab8a505XdbmFVuzl1/3MLh7KO6NTE1I19cB6Bif46AfMSPO/fjehDoA30JrK+OfSQeYiLu3uFfzIZtZzdQ48LNp5/0C3XYwBga0nh4bxbDHtt37GSSOmc1MBVqL4ePpfn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790498981; c=relaxed/simple;
	bh=KiZDR9prKxUB5d5rIv3Rj0dG8dTHGynJoP/ffWuoc0I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MdBej4vK7iCv+vGmY/0/Meu6n8n6JW2QKXiM7k9cNkNQicojCiF56IZ14KJzE3fW1bz4ChAk+SSUD9xMn3rQ2K92FH8ffMxiytqH09mnMywIQP1YZqQSWnK9AZ/fiV1JAtpzyq5Yknos6SmTGSwmdwnvgBcgrTGRsFqsF4AOzQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=FTHhOe3v; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="FTHhOe3v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1790498971;
	bh=KiZDR9prKxUB5d5rIv3Rj0dG8dTHGynJoP/ffWuoc0I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FTHhOe3vscng8fr5XLFl92bfYsD/18E8Ft1Z73DYSXZwk76nTkkomUN/Tox7ffRkN
	 rA2wR6IC/zMLkSwyOLbbpt00gexdlTqvasREn2qNSZZ/f3ucZEWmc9oNJzq8V3he+X
	 LxdImVu+I6alrhwKnR1Rcold3pZnUfWwlD/lZNTg=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sun, 27 Sep 2026 10:49:13 +0200
Subject: [PATCH 2/5] tools/nolibc: make 64-bit systemcall argument padding
 generic
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260927-nolibc-pread-v1-2-e9af6e47b37a@weissschuh.net>
References: <20260927-nolibc-pread-v1-0-e9af6e47b37a@weissschuh.net>
In-Reply-To: <20260927-nolibc-pread-v1-0-e9af6e47b37a@weissschuh.net>
To: Willy Tarreau <w@1wt.eu>, Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790498970; l=4155;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=KiZDR9prKxUB5d5rIv3Rj0dG8dTHGynJoP/ffWuoc0I=;
 b=/TPpLSMv96gL+bmxkvpn4ZiR1viLgoZVlVCo5N4J9oRq66JO0oMkTqB+QHIg6shr7RpmfC+9V
 H/qHNAmWyxdCGtkPDChk2Aw+Lh4B+U6E/dcjdPNw12X463j9J7Nb+eY
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Several 32-bit architectures pass a 64-bit systemcall argument
as two 32-bit values requiring alignment to an even register pair.
This case is currently relevant for the ftruncate64() wrapper and handled
by those architectures providing custom wrappers.
With the introduction of pread() and pwrite() wrappers, the same pattern
would lead to a lot of repeated code.

Add a #define, so that the generic code can do the padding where
necessary, without any per-architecture duplication.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 tools/include/nolibc/arch-arm.h     | 7 +------
 tools/include/nolibc/arch-hexagon.h | 7 +------
 tools/include/nolibc/arch-mips.h    | 7 +------
 tools/include/nolibc/arch-powerpc.h | 7 +------
 tools/include/nolibc/unistd.h       | 4 ++++
 5 files changed, 8 insertions(+), 24 deletions(-)

diff --git a/tools/include/nolibc/arch-arm.h b/tools/include/nolibc/arch-arm.h
index b88686fb19c4..b5b3456c75cb 100644
--- a/tools/include/nolibc/arch-arm.h
+++ b/tools/include/nolibc/arch-arm.h
@@ -196,11 +196,6 @@ void __attribute__((weak, noreturn)) __nolibc_entrypoint __nolibc_no_stack_prote
 }
 #endif /* NOLIBC_NO_RUNTIME */
 
-static __attribute__((unused))
-int _sys_ftruncate64(int fd, uint32_t length0, uint32_t length1)
-{
-	return __nolibc_syscall4(__NR_ftruncate64, fd, 0, length0, length1);
-}
-#define _sys_ftruncate64 _sys_ftruncate64
+#define __NOLIBC_PAD_64BIT_SYSCALL_ARGUMENT_PAIR
 
 #endif /* _NOLIBC_ARCH_ARM_H */
diff --git a/tools/include/nolibc/arch-hexagon.h b/tools/include/nolibc/arch-hexagon.h
index 0767054882f3..68f73529a6dd 100644
--- a/tools/include/nolibc/arch-hexagon.h
+++ b/tools/include/nolibc/arch-hexagon.h
@@ -154,11 +154,6 @@ _start(void)
 }
 #endif /* NOLIBC_NO_RUNTIME */
 
-static __attribute__((unused))
-int _sys_ftruncate64(int fd, uint32_t length0, uint32_t length1)
-{
-	return __nolibc_syscall4(__NR_ftruncate64, fd, 0, length0, length1);
-}
-#define _sys_ftruncate64 _sys_ftruncate64
+#define __NOLIBC_PAD_64BIT_SYSCALL_ARGUMENT_PAIR
 
 #endif /* _NOLIBC_ARCH_HEXAGON_H */
diff --git a/tools/include/nolibc/arch-mips.h b/tools/include/nolibc/arch-mips.h
index 26ad413cec62..21b9959a08e2 100644
--- a/tools/include/nolibc/arch-mips.h
+++ b/tools/include/nolibc/arch-mips.h
@@ -286,12 +286,7 @@ void __attribute__((weak, noreturn)) __nolibc_entrypoint __nolibc_no_stack_prote
 #endif /* NOLIBC_NO_RUNTIME */
 
 #if defined(_ABIO32)
-static __attribute__((unused))
-int _sys_ftruncate64(int fd, uint32_t length0, uint32_t length1)
-{
-	return __nolibc_syscall4(__NR_ftruncate64, fd, 0, length0, length1);
-}
-#define _sys_ftruncate64 _sys_ftruncate64
+#define __NOLIBC_PAD_64BIT_SYSCALL_ARGUMENT_PAIR
 #endif
 
 #endif /* _NOLIBC_ARCH_MIPS_H */
diff --git a/tools/include/nolibc/arch-powerpc.h b/tools/include/nolibc/arch-powerpc.h
index dbe2e5205aaa..a4711638cb66 100644
--- a/tools/include/nolibc/arch-powerpc.h
+++ b/tools/include/nolibc/arch-powerpc.h
@@ -222,12 +222,7 @@ void __attribute__((weak, noreturn)) __nolibc_entrypoint __nolibc_no_stack_prote
 #endif /* NOLIBC_NO_RUNTIME */
 
 #if !defined(__powerpc64__)
-static __attribute__((unused))
-int _sys_ftruncate64(int fd, uint32_t length0, uint32_t length1)
-{
-	return __nolibc_syscall4(__NR_ftruncate64, fd, 0, length0, length1);
-}
-#define _sys_ftruncate64 _sys_ftruncate64
+#define __NOLIBC_PAD_64BIT_SYSCALL_ARGUMENT_PAIR
 #endif
 
 #endif /* _NOLIBC_ARCH_POWERPC_H */
diff --git a/tools/include/nolibc/unistd.h b/tools/include/nolibc/unistd.h
index a264a20da13d..939d4e05a55d 100644
--- a/tools/include/nolibc/unistd.h
+++ b/tools/include/nolibc/unistd.h
@@ -52,7 +52,11 @@ int access(const char *path, int amode)
 static __attribute__((unused))
 int _sys_ftruncate64(int fd, uint32_t length0, uint32_t length1)
 {
+#if defined(__NOLIBC_PAD_64BIT_SYSCALL_ARGUMENT_PAIR)
+	return __nolibc_syscall4(__NR_ftruncate64, fd, 0, length0, length1);
+#else
 	return __nolibc_syscall3(__NR_ftruncate64, fd, length0, length1);
+#endif
 }
 #define _sys_ftruncate64 _sys_ftruncate64
 #endif

-- 
2.55.0

