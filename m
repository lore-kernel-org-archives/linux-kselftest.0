Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FAAC36A038;
	Mon, 16 Mar 2026 21:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773698339; cv=none; b=V5BLNpdrtpv1nwVq2SFGeW+qJbSDV0Zq33FlDhbR0vigHrkNVbYw0WUNo1XBCTsCXozUBcjYO9HZCss9mofTE6NXt6hjYH4TPsgvq6WBFP36W48ezAX2PAYwUXoW8SH2CMziaZJIvjm4Zl6xXSmKR8J5Q7RSE3UAQUZCpDI3OpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773698339; c=relaxed/simple;
	bh=ppeFS/esmOXFVznMHGq33Ol4W76goRqIc1twAuAacu4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=vEqMc0sFOcSa705inZrLtnkSgCP5Cne16eUZYEqg/QK1VT7O2fKQWwPHI45cPXT6LwZuL0B5tCwFrNgwmOAeCpIfTdiIFgzGck7l0+Yt49gwe8enGaP6tjRnsUAAJGLTzOupzq2il/URHcIvTJ19gvTxOhzVIOQNkQEN11qsDEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=oLfb1eR1; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="oLfb1eR1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1773698335;
	bh=ppeFS/esmOXFVznMHGq33Ol4W76goRqIc1twAuAacu4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=oLfb1eR1ghjjMn3hxicgEyNYeZdAdfM6LuCyh4WlmIsVfLnz9lAnPgs3cNzvbGacf
	 x5EXp/EZev38wGQlyF/lQhlkPmSe5HJWwU01ZuooJxDNlKO0Zx5ElJ9PQxTmV5l6DK
	 l5GG816w2RH7XxM7zBIMHqGVTEIj3bc6A/66y9qk=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 16 Mar 2026 22:58:51 +0100
Subject: [PATCH v3 2/2] tools/nolibc: add err.h
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260316-nolibc-err-h-v3-2-6ef80c051ab7@weissschuh.net>
References: <20260316-nolibc-err-h-v3-0-6ef80c051ab7@weissschuh.net>
In-Reply-To: <20260316-nolibc-err-h-v3-0-6ef80c051ab7@weissschuh.net>
To: Willy Tarreau <w@1wt.eu>, Shuah Khan <shuah@kernel.org>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773698335; l=2997;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=ppeFS/esmOXFVznMHGq33Ol4W76goRqIc1twAuAacu4=;
 b=ymz0OoloIYzOXrkWwl6Kdw+utZju0A2wBojTFHjZi+Q2lgkRVmYzRULFyyqjGcwHsf4c2rQEI
 PUPG8qVf2gwC7UCM2gI58wAairC8DlOleiWdmaXE4BdrwkySEaQGALg
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

