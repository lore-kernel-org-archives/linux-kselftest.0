Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4358433689A
	for <linux-kselftest@vger.kernel.org>; Fri, 12 Jun 2026 21:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781300721; cv=none; b=TifUXxA6+pOTMEAm+EXqyUzPieCs/qmP1Jcduq6j7nr1KFVBuNIRprASc7I2/9btruPEkzNMsP3P0zz3uPiqB7/RC7lx2Q63BmlHO2ogeu5+ZyE4c0Rs8DdXNagcT2xoh0VQeijgaScygb37OLwb9dW1SZbfD7vOjcWgPhJlEQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781300721; c=relaxed/simple;
	bh=oZOYvzA1o4Ib+EBgI1PTxEuljFbQ3N4usxtkstUSGiQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ijPwz9YHpppgrzfczjfBDRNe/YNJncP7gif+hsqeGl7Zw6kyeaPjCROEsci4V9RBBg9JTnwXlslgTd+fpNzN6XSRSNxmXdFvWYwOqXKEIGyXxGvZzjugVtuVmbLtpe9EgoNCn47Az+OHHxspCK8MxtmhJ/DrL+vORmNaQPRTjIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vipinsh.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XMSoBrOq; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vipinsh.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XMSoBrOq"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-36bd4146cb2so1574576a91.1
        for <linux-kselftest@vger.kernel.org>; Fri, 12 Jun 2026 14:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781300720; x=1781905520; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y63OIuewjJn4DM3LNPrZ6+3k1EeVNDYrDOZ6UJ5T9lM=;
        b=XMSoBrOqUbe/e81/lHvyF4dpNAwvbkfyHqiGDauwB5rFdytelXzQKkw+qPQ15B/ta+
         D/ArVgGE67g1MOXU1wTtW1KlKHkqqo9L4gSKJPGOtjTYhjT2uZ9KLII8frLOhxiTLI0/
         EpJc7DLp5X1o/Rpe7c7RvkP+aX28ByzUkxtutto7Co/ZKBAb08FFsHbmODmTDkc1mbqS
         65RmhSQJhiHsiXJvtIKd8OieA1rmygW9VSz4CXKtVxx8sYK7TuHURsxSdaxCTiENZGkt
         odKIg8kB3cGyn9hE3SFsZYax3ZRpybTkVxmR/Z/FtjnknReNx7M3xhb/iNCjTvgxRO6/
         wr5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781300720; x=1781905520;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y63OIuewjJn4DM3LNPrZ6+3k1EeVNDYrDOZ6UJ5T9lM=;
        b=KE02W00GlpNr3il41iVXYieuMQYaFOmDNnUHU7RR/1/LBOuZH3+Y0wAoCvV2SBvug6
         h6jmQRLUF0KR8vWPsMSU5c5/Fkz5+eBTUzGVxuN+VVpC4gh9tY6j3prmwgT/lJZZBMGy
         eV5q4o79JMZ6A+KKGyX09xqiFhk+avJpuBHrJCq4bCHT2CU2FfwNXSvt8TYLD0l/g3W9
         vDVGZf0WPpgQaQry0bJJYO+NMrUGng9L/pxp0PkyGLdP7Qy5sP6+JRV5sRxb+Xh+EKeD
         wS+Kv991GVmTBMctCJjrRrAzDMqLcbfs7jjHSNgYt3RYU5pCujHxMCiWXMlux7RDVatQ
         FAsw==
X-Forwarded-Encrypted: i=1; AFNElJ9EF//iMNOmvnQ129A7yCd07XZWhDIi8mDpII4mBF6uX86Bnf92KUX+3zGfJTGJj0JLlRumGfSobZMtCFTjLm0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwQ+UmS1+uPm4WA+rKOb/J2xAskI3gNa2fHY3US40QzMpZX+LN
	RETY8r79cKEC3RzQ7dQXPX0lCmYMPZZluZBmj5/31nPsblgYqGW5FkT55VKiDRhlPrKP6tq70fm
	6or4VJZ9y9g==
X-Received: from pghc6.prod.google.com ([2002:a63:da06:0:b0:c86:253f:3d70])
 (user=vipinsh job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3ec3:b0:35f:c493:cac5
 with SMTP id 98e67ed59e1d1-379eff366b7mr4487198a91.16.1781300719329; Fri, 12
 Jun 2026 14:45:19 -0700 (PDT)
Date: Fri, 12 Jun 2026 14:45:12 -0700
In-Reply-To: <20260612214512.464146-1-vipinsh@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260612214512.464146-1-vipinsh@google.com>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260612214512.464146-3-vipinsh@google.com>
Subject: [PATCH v3 2/2] selftests/liveupdate: Move luo_test_utils.* into a
 reusable library
From: Vipin Sharma <vipinsh@google.com>
To: pasha.tatashin@soleen.com, rppt@kernel.org, pratyush@kernel.org
Cc: tarunsahu@google.com, skhawaja@google.com, shuah@kernel.org, 
	dmatlack@google.com, linux-kernel@vger.kernel.org, kexec@lists.infradead.org, 
	linux-kselftest@vger.kernel.org, Vipin Sharma <vipinsh@google.com>
Content-Type: text/plain; charset="UTF-8"

Move luo_test_utils.[ch] into a lib/ directory and make libliveupdate
library. Pull the rules to build them out into a separate
libliveupdate.mk script. This will enable these utilities to be
also built by and used within other selftests (such as VFIO).

No functional change intended.

Co-developed-by: David Matlack <dmatlack@google.com>
Signed-off-by: David Matlack <dmatlack@google.com>
Acked-by: Pratyush Yadav (Google) <pratyush@kernel.org>
Signed-off-by: Vipin Sharma <vipinsh@google.com>
---
 tools/testing/selftests/liveupdate/.gitignore |  1 +
 tools/testing/selftests/liveupdate/Makefile   | 14 ++++---------
 .../include/libliveupdate.h}                  |  8 ++++----
 .../selftests/liveupdate/lib/libliveupdate.mk | 20 +++++++++++++++++++
 .../{luo_test_utils.c => lib/lu_utils.c}      |  2 +-
 .../testing/selftests/liveupdate/liveupdate.c |  2 +-
 .../selftests/liveupdate/luo_kexec_simple.c   |  2 +-
 .../selftests/liveupdate/luo_multi_session.c  |  2 +-
 .../selftests/liveupdate/luo_stress_files.c   |  3 ++-
 .../liveupdate/luo_stress_sessions.c          |  3 ++-
 10 files changed, 37 insertions(+), 20 deletions(-)
 rename tools/testing/selftests/liveupdate/{luo_test_utils.h => lib/include/libliveupdate.h} (89%)
 create mode 100644 tools/testing/selftests/liveupdate/lib/libliveupdate.mk
 rename tools/testing/selftests/liveupdate/{luo_test_utils.c => lib/lu_utils.c} (99%)

diff --git a/tools/testing/selftests/liveupdate/.gitignore b/tools/testing/selftests/liveupdate/.gitignore
index 661827083ab6..18a0c7036cf3 100644
--- a/tools/testing/selftests/liveupdate/.gitignore
+++ b/tools/testing/selftests/liveupdate/.gitignore
@@ -3,6 +3,7 @@
 !/**/
 !*.c
 !*.h
+!*.mk
 !*.sh
 !.gitignore
 !config
diff --git a/tools/testing/selftests/liveupdate/Makefile b/tools/testing/selftests/liveupdate/Makefile
index 30689d22cb02..634211c66652 100644
--- a/tools/testing/selftests/liveupdate/Makefile
+++ b/tools/testing/selftests/liveupdate/Makefile
@@ -1,7 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
-LIB_C += luo_test_utils.c
-
 TEST_GEN_PROGS += liveupdate
 
 TEST_GEN_PROGS_EXTENDED += luo_kexec_simple
@@ -12,25 +10,21 @@ TEST_GEN_PROGS_EXTENDED += luo_stress_files
 TEST_FILES += do_kexec.sh
 
 include ../lib.mk
+include lib/libliveupdate.mk
 
 CFLAGS += $(KHDR_INCLUDES)
 CFLAGS += -Wall -O2 -Wno-unused-function
 CFLAGS += -MD
 
-LIB_O := $(patsubst %.c, $(OUTPUT)/%.o, $(LIB_C))
 TEST_O := $(patsubst %, %.o, $(TEST_GEN_PROGS))
 TEST_O += $(patsubst %, %.o, $(TEST_GEN_PROGS_EXTENDED))
 
-TEST_DEP_FILES := $(patsubst %.o, %.d, $(LIB_O))
+TEST_DEP_FILES := $(patsubst %.o, %.d, $(LIBLIVEUPDATE_O))
 TEST_DEP_FILES += $(patsubst %.o, %.d, $(TEST_O))
 -include $(TEST_DEP_FILES)
 
-$(LIB_O): $(OUTPUT)/%.o: %.c
-	$(CC) $(CFLAGS) $(CPPFLAGS) $(TARGET_ARCH) -c $< -o $@
-
-$(TEST_GEN_PROGS) $(TEST_GEN_PROGS_EXTENDED): $(OUTPUT)/%: %.o $(LIB_O)
-	$(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) $(TARGET_ARCH) $< $(LIB_O) $(LDLIBS) -o $@
+$(TEST_GEN_PROGS) $(TEST_GEN_PROGS_EXTENDED): $(OUTPUT)/%: %.o $(LIBLIVEUPDATE_O)
+	$(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) $(TARGET_ARCH) $< $(LIBLIVEUPDATE_O) $(LDLIBS) -o $@
 
-EXTRA_CLEAN += $(LIB_O)
 EXTRA_CLEAN += $(TEST_O)
 EXTRA_CLEAN += $(TEST_DEP_FILES)
diff --git a/tools/testing/selftests/liveupdate/luo_test_utils.h b/tools/testing/selftests/liveupdate/lib/include/libliveupdate.h
similarity index 89%
rename from tools/testing/selftests/liveupdate/luo_test_utils.h
rename to tools/testing/selftests/liveupdate/lib/include/libliveupdate.h
index 49931ab90593..fa07fed08364 100644
--- a/tools/testing/selftests/liveupdate/luo_test_utils.h
+++ b/tools/testing/selftests/liveupdate/lib/include/libliveupdate.h
@@ -7,13 +7,13 @@
  * Utility functions for LUO kselftests.
  */
 
-#ifndef LUO_TEST_UTILS_H
-#define LUO_TEST_UTILS_H
+#ifndef SELFTESTS_LIVEUPDATE_LIB_LIVEUPDATE_H
+#define SELFTESTS_LIVEUPDATE_LIB_LIVEUPDATE_H
 
 #include <errno.h>
 #include <string.h>
 #include <linux/liveupdate.h>
-#include "../kselftest.h"
+#include "../../../kselftest.h"
 
 #define LUO_DEVICE "/dev/liveupdate"
 
@@ -46,4 +46,4 @@ typedef void (*luo_test_stage2_fn)(int luo_fd, int state_session_fd);
 int luo_test(int argc, char *argv[], const char *state_session_name,
 	     luo_test_stage1_fn stage1, luo_test_stage2_fn stage2);
 
-#endif /* LUO_TEST_UTILS_H */
+#endif /* SELFTESTS_LIVEUPDATE_LIB_LIVEUPDATE_H */
diff --git a/tools/testing/selftests/liveupdate/lib/libliveupdate.mk b/tools/testing/selftests/liveupdate/lib/libliveupdate.mk
new file mode 100644
index 000000000000..634cd4c16c47
--- /dev/null
+++ b/tools/testing/selftests/liveupdate/lib/libliveupdate.mk
@@ -0,0 +1,20 @@
+include $(top_srcdir)/scripts/subarch.include
+ARCH ?= $(SUBARCH)
+
+LIBLIVEUPDATE_SRCDIR := $(selfdir)/liveupdate/lib
+
+LIBLIVEUPDATE_C := lu_utils.c
+
+LIBLIVEUPDATE_OUTPUT := $(OUTPUT)/libliveupdate
+
+LIBLIVEUPDATE_O := $(patsubst %.c, $(LIBLIVEUPDATE_OUTPUT)/%.o, $(LIBLIVEUPDATE_C))
+
+CFLAGS += -I$(LIBLIVEUPDATE_SRCDIR)/include
+
+$(LIBLIVEUPDATE_OUTPUT):
+	$(Q)mkdir -p $@
+
+$(LIBLIVEUPDATE_O): $(LIBLIVEUPDATE_OUTPUT)/%.o : $(LIBLIVEUPDATE_SRCDIR)/%.c | $(LIBLIVEUPDATE_OUTPUT)
+	$(CC) $(CFLAGS) $(CPPFLAGS) $(TARGET_ARCH) -c $< -o $@
+
+EXTRA_CLEAN += $(LIBLIVEUPDATE_OUTPUT)
diff --git a/tools/testing/selftests/liveupdate/luo_test_utils.c b/tools/testing/selftests/liveupdate/lib/lu_utils.c
similarity index 99%
rename from tools/testing/selftests/liveupdate/luo_test_utils.c
rename to tools/testing/selftests/liveupdate/lib/lu_utils.c
index ddb4123f5107..1f92daf3b372 100644
--- a/tools/testing/selftests/liveupdate/luo_test_utils.c
+++ b/tools/testing/selftests/liveupdate/lib/lu_utils.c
@@ -22,7 +22,7 @@
 #include <errno.h>
 #include <stdarg.h>
 
-#include "luo_test_utils.h"
+#include <libliveupdate.h>
 
 int luo_open_device(void)
 {
diff --git a/tools/testing/selftests/liveupdate/liveupdate.c b/tools/testing/selftests/liveupdate/liveupdate.c
index 5c7ed2512710..2dedd5fc2534 100644
--- a/tools/testing/selftests/liveupdate/liveupdate.c
+++ b/tools/testing/selftests/liveupdate/liveupdate.c
@@ -24,9 +24,9 @@
 #include <sys/ioctl.h>
 #include <unistd.h>
 
+#include <libliveupdate.h>
 #include <linux/liveupdate.h>
 
-#include "luo_test_utils.h"
 #include "../kselftest.h"
 #include "../kselftest_harness.h"
 
diff --git a/tools/testing/selftests/liveupdate/luo_kexec_simple.c b/tools/testing/selftests/liveupdate/luo_kexec_simple.c
index d7ac1f3dc4cb..786ac93b9ae3 100644
--- a/tools/testing/selftests/liveupdate/luo_kexec_simple.c
+++ b/tools/testing/selftests/liveupdate/luo_kexec_simple.c
@@ -8,7 +8,7 @@
  * across a single kexec reboot.
  */
 
-#include "luo_test_utils.h"
+#include <libliveupdate.h>
 
 #define TEST_SESSION_NAME "test-session"
 #define TEST_MEMFD_TOKEN 0x1A
diff --git a/tools/testing/selftests/liveupdate/luo_multi_session.c b/tools/testing/selftests/liveupdate/luo_multi_session.c
index 0ee2d795beef..aac24a5f5ce3 100644
--- a/tools/testing/selftests/liveupdate/luo_multi_session.c
+++ b/tools/testing/selftests/liveupdate/luo_multi_session.c
@@ -9,7 +9,7 @@
  * files.
  */
 
-#include "luo_test_utils.h"
+#include <libliveupdate.h>
 
 #define SESSION_EMPTY_1 "multi-test-empty-1"
 #define SESSION_EMPTY_2 "multi-test-empty-2"
diff --git a/tools/testing/selftests/liveupdate/luo_stress_files.c b/tools/testing/selftests/liveupdate/luo_stress_files.c
index 0cdf9cd4bac7..a0d48490f4ed 100644
--- a/tools/testing/selftests/liveupdate/luo_stress_files.c
+++ b/tools/testing/selftests/liveupdate/luo_stress_files.c
@@ -10,7 +10,8 @@
 
 #include <stdio.h>
 #include <unistd.h>
-#include "luo_test_utils.h"
+
+#include <libliveupdate.h>
 
 #define NUM_FILES 500
 #define STATE_SESSION_NAME "kexec_many_files_state"
diff --git a/tools/testing/selftests/liveupdate/luo_stress_sessions.c b/tools/testing/selftests/liveupdate/luo_stress_sessions.c
index f201b1839d1d..278aebabe0e9 100644
--- a/tools/testing/selftests/liveupdate/luo_stress_sessions.c
+++ b/tools/testing/selftests/liveupdate/luo_stress_sessions.c
@@ -10,7 +10,8 @@
 
 #include <stdio.h>
 #include <unistd.h>
-#include "luo_test_utils.h"
+
+#include <libliveupdate.h>
 
 #define NUM_SESSIONS 2000
 #define STATE_SESSION_NAME "kexec_many_state"
-- 
2.54.0.1136.gdb2ca164c4-goog

