Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E5923C3BEE;
	Wed, 18 Mar 2026 15:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773849032; cv=none; b=qE+25+kCPzzYFvCfHA5p543I0pYE8B5LMyu9SjC035Mll9m73mkFEQrf0gdQrsreV/gJbxpq4hgC7IuBF+E8eGDxQk/DdOCKUN5RWpVDurhFBLwOPsTSoswPrJkrUP5DD5JYmHMEoHIpGIFYZw1HOIiKjqA+WPeJ24zyTjuh6AI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773849032; c=relaxed/simple;
	bh=ppeFS/esmOXFVznMHGq33Ol4W76goRqIc1twAuAacu4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jX3B5X1sTtdpBeSnfkq62z689kJtrSR2Esr72dfa0Lt1Pnk1cCWdPnN3ec288ZIfGcoABzYJC7FnBwzbgGL7HM5UneVde7IvwfpxcAW5M++O4K/0FxrH+SGI7wnYg9yus4rieBOoaFaNFoOk40Po4jnc9Xg5zW82FpEPKO6aU3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=N1GbyH6f; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="N1GbyH6f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1773849020;
	bh=ppeFS/esmOXFVznMHGq33Ol4W76goRqIc1twAuAacu4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=N1GbyH6fU2l3ExgyNVmsaawi4XH6Byr/2/As6z6P1npZ5a8al71UOrI3wFo/g97gO
	 64QHDz+6gM1OGQXin+0A2eSYy5voGoycIGbyFGlLuVjGCt/8Po8miQp0ysrgdjbo7r
	 F7KTjnCtd2ey128HRa+85oMna4NhLrKvtRAT4XLw=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Wed, 18 Mar 2026 16:50:17 +0100
Subject: [PATCH v4 2/2] tools/nolibc: add err.h
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260318-nolibc-err-h-v4-2-08247a694bd9@weissschuh.net>
References: <20260318-nolibc-err-h-v4-0-08247a694bd9@weissschuh.net>
In-Reply-To: <20260318-nolibc-err-h-v4-0-08247a694bd9@weissschuh.net>
To: Willy Tarreau <w@1wt.eu>, Shuah Khan <shuah@kernel.org>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773849019; l=2997;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=ppeFS/esmOXFVznMHGq33Ol4W76goRqIc1twAuAacu4=;
 b=ODSuRwrWWSg9WC0ZWpzkfmFKGrEPjnKCWj6qkEk4yc0mNiIlt0pv5u3pMYXScxI3ROYgvSFXU
 2m5JiHuX4F0A3TaYt45X1irfLnvsPOdYa5K2VqNrnFItkGuJrYbVexU
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Add a few convenient helpers to print error and warning messages.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 tools/include/nolibc/Makefile |  1 +
 tools/include/nolibc/err.h    | 87 +++++++++++++++++++++++++++++++++++++++++++
 tools/include/nolibc/nolibc.h |  1 +
 3 files changed, 89 insertions(+)

diff --git a/tools/include/nolibc/Makefile b/tools/include/nolibc/Makefile
index 1958dda98895..5d242312943f 100644
--- a/tools/include/nolibc/Makefile
+++ b/tools/include/nolibc/Makefile
@@ -30,6 +30,7 @@ all_files := \
 		ctype.h \
 		dirent.h \
 		elf.h \
+		err.h \
 		errno.h \
 		fcntl.h \
 		getopt.h \
diff --git a/tools/include/nolibc/err.h b/tools/include/nolibc/err.h
new file mode 100644
index 000000000000..e22ae87a7289
--- /dev/null
+++ b/tools/include/nolibc/err.h
@@ -0,0 +1,87 @@
+/* SPDX-License-Identifier: LGPL-2.1 OR MIT */
+/*
+ * formatted error message for NOLIBC
+ * Copyright (C) 2026 Thomas Weißschuh <linux@weissschuh.net>
+ */
+
+/* make sure to include all global symbols */
+#include "nolibc.h"
+
+#ifndef _NOLIBC_ERR_H
+#define _NOLIBC_ERR_H
+
+#include "errno.h"
+#include "stdarg.h"
+#include "sys.h"
+
+static __attribute__((unused))
+void vwarn(const char *fmt, va_list args)
+{
+	fprintf(stderr, "%s: ", program_invocation_short_name);
+	vfprintf(stderr, fmt, args);
+	fprintf(stderr, ": %m\n");
+}
+
+static __attribute__((unused))
+void vwarnx(const char *fmt, va_list args)
+{
+	fprintf(stderr, "%s: ", program_invocation_short_name);
+	vfprintf(stderr, fmt, args);
+	fprintf(stderr, "\n");
+}
+
+static __attribute__((unused))
+void warn(const char *fmt, ...)
+{
+	va_list args;
+
+	va_start(args, fmt);
+	vwarn(fmt, args);
+	va_end(args);
+}
+
+static __attribute__((unused))
+void warnx(const char *fmt, ...)
+{
+	va_list args;
+
+	va_start(args, fmt);
+	vwarnx(fmt, args);
+	va_end(args);
+}
+
+static __attribute__((noreturn, unused))
+void verr(int eval, const char *fmt, va_list args)
+{
+	vwarn(fmt, args);
+	exit(eval);
+}
+
+static __attribute__((noreturn, unused))
+void verrx(int eval, const char *fmt, va_list args)
+{
+	warnx(fmt, args);
+	exit(eval);
+}
+
+static __attribute__((noreturn, unused))
+void err(int eval, const char *fmt, ...)
+{
+	va_list args;
+
+	va_start(args, fmt);
+	verr(eval, fmt, args);
+	va_end(args);
+}
+
+static __attribute__((noreturn, unused))
+void errx(int eval, const char *fmt, ...)
+{
+	va_list args;
+
+	va_start(args, fmt);
+	verrx(eval, fmt, args);
+	va_end(args);
+}
+
+#endif /* _NOLIBC_ERR_H */
diff --git a/tools/include/nolibc/nolibc.h b/tools/include/nolibc/nolibc.h
index d1d08b7f8599..fe8195483b6d 100644
--- a/tools/include/nolibc/nolibc.h
+++ b/tools/include/nolibc/nolibc.h
@@ -130,6 +130,7 @@
 #include "getopt.h"
 #include "poll.h"
 #include "math.h"
+#include "err.h"
 
 /* Used by programs to avoid std includes */
 #define NOLIBC

-- 
2.53.0

