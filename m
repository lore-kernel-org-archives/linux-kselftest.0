Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9C935B658;
	Wed, 11 Mar 2026 22:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773266492; cv=none; b=nMq+wDUp5N75U2iQfqZ6Td0TjY1zkVppECMKDHtWCHoThapWCAsCSmviksxBC7TxPMdECfGfYADZidc9BZ6LAt0+8czUzNFsPPIe6jCFu1mVJM6nxB8TBVqySqldAjMHSBPa/b6pQampMbIumfxJnVh7i4emSSjbg+7Hj2D3hvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773266492; c=relaxed/simple;
	bh=+yVXS7454Sh1Jf02UggP0hD9+jM4HyKK2AjFU+7L+bg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nZp4pQmJMbjEW6NHy1PoOpRcy+lS2cyZs5+MZay4JoiPlyDH30tZnqjtRSoz3oS4e0SWOtltN1r2GxGfMjuMUAkBarBpnW6of6yxKekglkreciU3qiwX8DBPzU9MDA4B6mpn8i75FB+HGYyAsytGED7YbM5c3pcR5KCtjsKdOXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=Fk/lcCyz; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="Fk/lcCyz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1773266488;
	bh=+yVXS7454Sh1Jf02UggP0hD9+jM4HyKK2AjFU+7L+bg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Fk/lcCyzEEl7qmAJQWdJCiLppRjFzFZicCGVxHIetiBF/d+IGgmKIFEBk/HZgOW3C
	 Kvx02UJmeZzDj/VA40jP87Vt/Mw6aRPVlZ5PmzdJMXjglfK+Jn45oT3g5rwO3bt3cg
	 PCvirqKy2XH7t8NU3UuF5y6dLdoYio9KgtduvzPI=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Wed, 11 Mar 2026 23:00:50 +0100
Subject: [PATCH 2/4] selftests/nolibc: validate NOLIBC_IGNORE_ERRNO
 compilation
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260311-nolibc-err-h-v1-2-735a9de7f15d@weissschuh.net>
References: <20260311-nolibc-err-h-v1-0-735a9de7f15d@weissschuh.net>
In-Reply-To: <20260311-nolibc-err-h-v1-0-735a9de7f15d@weissschuh.net>
To: Willy Tarreau <w@1wt.eu>, Shuah Khan <shuah@kernel.org>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773266488; l=1549;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=+yVXS7454Sh1Jf02UggP0hD9+jM4HyKK2AjFU+7L+bg=;
 b=thwH4L4fgLg7KziPs99NZupYfcCePC9XK0/7V/hDHbdEJ70fLlfCz23InMdNh8HZEQv/+pYjD
 s/g3GQtIs3RCBnkkLcz6lYgylSo9kPs8Slgp+RkrH2W2f9M/U1uGDb6
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

When NOLIBC_IGNORE_ERRNO is set, various bits of nolibc are disabled.

Make sure that all the ifdeffery does not result in any compilation
errors by compiling a dummy source file.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 tools/testing/selftests/nolibc/Makefile.include           | 2 +-
 tools/testing/selftests/nolibc/nolibc-test-ignore-errno.c | 6 ++++++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/nolibc/Makefile.include b/tools/testing/selftests/nolibc/Makefile.include
index 6455373d56be..41a0039f774c 100644
--- a/tools/testing/selftests/nolibc/Makefile.include
+++ b/tools/testing/selftests/nolibc/Makefile.include
@@ -9,4 +9,4 @@ CFLAGS_NOLIBC_TEST  ?= -Os -fno-ident -fno-asynchronous-unwind-tables -std=c89 -
 		$(call cc-option,-fno-stack-protector) $(call cc-option,-Wmissing-prototypes) \
 		$(_CFLAGS_STACKPROTECTOR) $(_CFLAGS_SANITIZER)
 
-NOLIBC_TEST_SOURCES := nolibc-test.c nolibc-test-linkage.c
+NOLIBC_TEST_SOURCES := nolibc-test.c nolibc-test-linkage.c nolibc-test-ignore-errno.c
diff --git a/tools/testing/selftests/nolibc/nolibc-test-ignore-errno.c b/tools/testing/selftests/nolibc/nolibc-test-ignore-errno.c
new file mode 100644
index 000000000000..aea816da4fca
--- /dev/null
+++ b/tools/testing/selftests/nolibc/nolibc-test-ignore-errno.c
@@ -0,0 +1,6 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#define NOLIBC_IGNORE_ERRNO
+
+/* Include all of nolibc and make sure everything compiles */
+#include <stdlib.h>

-- 
2.53.0

