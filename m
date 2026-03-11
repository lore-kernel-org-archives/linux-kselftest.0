Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D95835A387;
	Wed, 11 Mar 2026 22:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773266492; cv=none; b=H5GVXKDYw5WlJ2KW6py71e7X/H8ZBV57CnJRX3tFvu89VSTI7m7M6jL2Q1QnspvF7R0Z5PMPyLuJSQB08acmVpad23HOatLwbr90SYmgMs7/MbMI9lky/iHuVBfn8IpCUTi6y4Jom9KOC8Uda5va+Z5PrI9kJYmwobMQiViqWdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773266492; c=relaxed/simple;
	bh=DQ9Zc0Q7xc6dZOq15nfDtuT6wEnkMqTtKK6Bhc6CYPI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RzUAQqYt0feDkv2DKg3h8xt8lStoWjvTEZJclQISciSe1kIUC9uHJE4gf2dawS0BVZTwhlbpEoEWyXdH02CbTUFe6eP6xUou6W34jjS/7VZjy69I/1GFb06QwJDrkQZeDZDEEQzQrkfFZqX1jlCA8OxSK0kaLg6mouA4g0/xENc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=Z1QaMm+U; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="Z1QaMm+U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1773266488;
	bh=DQ9Zc0Q7xc6dZOq15nfDtuT6wEnkMqTtKK6Bhc6CYPI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Z1QaMm+ULA5QJ+M8hUnN1h45YC142/a9fJMeBY/w66uB91mKSG3oPPF06la2fpDWz
	 /7oK8QrPrO1UiVyNzf8/TcbRKrX/Df6CA+WCwHGQkhR6cFIv/zrxeLtBpkKPzHrQ94
	 0zjwMTSigBflEWaqaR6zRDvScrPGRGQHvYd4/O8g=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Wed, 11 Mar 2026 23:00:52 +0100
Subject: [PATCH 4/4] tools/nolibc: add err.h
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260311-nolibc-err-h-v1-4-735a9de7f15d@weissschuh.net>
References: <20260311-nolibc-err-h-v1-0-735a9de7f15d@weissschuh.net>
In-Reply-To: <20260311-nolibc-err-h-v1-0-735a9de7f15d@weissschuh.net>
To: Willy Tarreau <w@1wt.eu>, Shuah Khan <shuah@kernel.org>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773266488; l=3075;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=DQ9Zc0Q7xc6dZOq15nfDtuT6wEnkMqTtKK6Bhc6CYPI=;
 b=Ns1nx88qAYwjYB7FtBsijU3e5BA1Kgpt9MbVs6r0CCOKTnwwXVE3bstzF0UCqIb7hf0I8YgAg
 EMC8+Q5wZ8BDRN3Q0pCLQMAjJyrUqr7KnhdEh5Jm/mGILfjXN+0w03L
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Add a few convenient helpers to print error and warning messages.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 tools/include/nolibc/Makefile |  1 +
 tools/include/nolibc/err.h    | 91 +++++++++++++++++++++++++++++++++++++++++++
 tools/include/nolibc/nolibc.h |  1 +
 3 files changed, 93 insertions(+)

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
index 000000000000..2373c4999b71
--- /dev/null
+++ b/tools/include/nolibc/err.h
@@ -0,0 +1,91 @@
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
+#ifndef NOLIBC_IGNORE_ERRNO
+	fprintf(stderr, "%s: ", program_invocation_short_name);
+#endif
+	vfprintf(stderr, fmt, args);
+	fprintf(stderr, ": %m\n");
+}
+
+static __attribute__((unused))
+void vwarnx(const char *fmt, va_list args)
+{
+#ifndef NOLIBC_IGNORE_ERRNO
+	fprintf(stderr, "%s: ", program_invocation_short_name);
+#endif
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

