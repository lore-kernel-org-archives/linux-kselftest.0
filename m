Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E63783D47BD;
	Fri, 13 Mar 2026 20:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773433592; cv=none; b=VYIHF0DZ/jfEqN8TEvImLkHs+Dad+pe2btVgYAk7c+oOkDfu3b0HitLQA8hUtjzBD+fP0QhrRWX3Gg/ZafruUc+aQ+qNeaVoSuP+UUll0Qqhr4iei1bNXD1pqWV8x2r0c2LD3kaaRrnvD5jf/rkYf1dOw2t0nbbm2Abo3BgHDdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773433592; c=relaxed/simple;
	bh=W+GOkaEic19kj5wIqrB+q7DKO2lLJFO2hQbTMu3jxlQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u9uSK+FJUZls6Cc/u6ynUWPJQ85TuVORkCT5AdlcRH4Wprg6J6lis3flgSvGJt8aedFIAOjfFbIMG7oJO7JwWckI5dhLPRalz/4PBW6Nt/OsLUp2t64MWBLimL6iz1H26zeG3+U2bmhYsch9k5rGhcJSlxxbIeqMIkEj6oJAOmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=OBVWoYeQ; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="OBVWoYeQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1773433589;
	bh=W+GOkaEic19kj5wIqrB+q7DKO2lLJFO2hQbTMu3jxlQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=OBVWoYeQCNC3VZPjGyNCjiUSXnSGpC5Xui5ra5ue9DD/IWhrCdz6Hp9VMAwiijEik
	 lwCrgNCIx+Nzb6MV0oC10nrqsDy3ixxwlKR8hL7mmRWpFezoqIOFIP6xlcGZtiZBNE
	 DxeGkslQvIDCpuKSnZobeiBX3l2f3zBURgNsrv7E=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Fri, 13 Mar 2026 21:26:29 +0100
Subject: [PATCH v2 2/2] tools/nolibc: add err.h
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260313-nolibc-err-h-v2-2-f4481053b07a@weissschuh.net>
References: <20260313-nolibc-err-h-v2-0-f4481053b07a@weissschuh.net>
In-Reply-To: <20260313-nolibc-err-h-v2-0-f4481053b07a@weissschuh.net>
To: Willy Tarreau <w@1wt.eu>, Shuah Khan <shuah@kernel.org>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773433588; l=3111;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=W+GOkaEic19kj5wIqrB+q7DKO2lLJFO2hQbTMu3jxlQ=;
 b=dtonDzrKCeAZ82bWTQ2kmmm1ld1gjzRMnDqH4a1HRVWlsdCMa0h/NzW45AXCyMalOXO5wkHEj
 C1BPzcLCFlrBnSka2FyT9UhRdJKa8Z39BxBU2KKgr/6frEgfOSgp+A3
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Add a few convenient helpers to print error and warning messages.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
Acked-by: Willy Tarreau <w@1wt.eu>
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

