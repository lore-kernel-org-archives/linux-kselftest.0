Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C263CA4A8
	for <linux-kselftest@vger.kernel.org>; Mon, 20 Jul 2026 20:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784579530; cv=none; b=IQlGmwDT7WZWuyfL81eexWuv2heypquu97V3I5jKbpCB5TqVXQRKk+PYPbk+X4HsE+wMl7WQZub820iZMlIJeM+TdlpVxWfxPP61wqnDgyWkyxJfWXD+zS0dtx70qB8MQf+8jNU8pcscrbZHiwCyrB+ligsG2wvTRFG7v0NBV5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784579530; c=relaxed/simple;
	bh=jdIVzBFIoulpULK4pzaO1WKiE6HjqadJrPUbUmqnGMk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=NBC7/vsIBYzv+ACMQ+D3Zd8fkSd6uVAVAZe9OPh/Fq8SgRk1WVZwFCCJyRmFv2tgFsMS73VFt2lnC6/aQpyvKezh4r796aWs0NCzIek7Yy0OIOCZvT6SpWK6SzLBnLUZ1degPDd2OMrIvyHsYunAIdV8Lf7XnlZGvG4VnaVzHAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vipinsh.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fFDJoKN/; arc=none smtp.client-ip=209.85.210.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vipinsh.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fFDJoKN/"
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84865f326efso10948950b3a.0
        for <linux-kselftest@vger.kernel.org>; Mon, 20 Jul 2026 13:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784579528; x=1785184328; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D0u/ZsKaJ4sWO+EwXyup1tCC2bG9yJvlOEOLZr8wnIo=;
        b=fFDJoKN/LeZehdU8w2+ZkXQDSAEtsgE9mGROxxy6kz1F4A/6m8No11Jhb2slosVEJd
         xAKJxTGBb79PhLnaLlkyIVWEJUMO9CarNESnGmanlUFjtNHWjqPC01YUAxxz6dfeYhc1
         rlCq93JS8CCjXDyMyzSnWpyThKTsmLUoDGOrZNxFiG1eBvH3pOhe7lseBPvmb17SFaFF
         uXE5Z3c7Ms8v4jK4SxsW28pmx9Lfk976hbcXg3eikdm17vTEoPJbrcIlq0AKfWHzLNyT
         GoFLQoVNKRC9JzjPx2D3QR4XyuNA/tdMP0K8cnkBd75sxIu6lPc2huRX9J93tiULrqHi
         cfDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784579528; x=1785184328;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D0u/ZsKaJ4sWO+EwXyup1tCC2bG9yJvlOEOLZr8wnIo=;
        b=sg0fYV+7OCgd0s0KTL5tcuyDZewGYgjmG3KsCME4EKgZpGpILSzmxrOnj6gC3sAk9q
         AYBXxLj+nR1gKKuhCDzrZ2KvY0T+9rtb7wPNb8/xDeVfG8VKuUx5o+8D8fDm0G6FqSs5
         ljBrqw6V6MM9n4Yc5mbRIguxnHKb57cHWIu8wwsV+bHM+z92gDb5/N/mVoNFN1EOnAgy
         ZlxQZPXdOsGyY86AYrhrcQYhM7lUjAYqcNy5z0yFdNy0H+6VPbj93OlHJ91lBokdmnQi
         ukgBV4WCKp4lI/N2e9p0lqAu/iUDZJALISDrsY5geWWlbndBPGI9ppwEJPc9CD7iY0UU
         vljg==
X-Forwarded-Encrypted: i=1; AHgh+RpjeTnB9YiU3MKnLCAPvOFfL+Phxjvo2YURm/2y2U95uSrm6pj6WBOWsL0Dz1+PWEw/7f9xdXHkG62xYsjKhNg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7PSmNgj4G8I3nlIi2wjtt7hrP3TEbVMWqpY53s4MXu3cGBQC9
	dH12e3c0D1oC6qh1hi+cUN64OsmcSop1g+t/knnZRxl/t4JqBj5JSWep22lvaSGbwynJg/iZL75
	938kGpgldPA==
X-Received: from pfbjo7.prod.google.com ([2002:a05:6a00:9087:b0:845:b941:bc97])
 (user=vipinsh job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:8c2:b0:848:54e0:96c1
 with SMTP id d2e1a72fcca58-84c29590547mr16031465b3a.77.1784579527756; Mon, 20
 Jul 2026 13:32:07 -0700 (PDT)
Date: Mon, 20 Jul 2026 13:32:02 -0700
In-Reply-To: <20260720203202.1964557-1-vipinsh@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260720203202.1964557-1-vipinsh@google.com>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
Message-ID: <20260720203202.1964557-3-vipinsh@google.com>
Subject: [PATCH v4 2/2] selftests/liveupdate: Move luo_test_utils.* into a
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

Update path in vmtest.sh as that one uses hardcoded path for util.

No functional change intended.

Co-developed-by: David Matlack <dmatlack@google.com>
Signed-off-by: David Matlack <dmatlack@google.com>
Acked-by: Pratyush Yadav (Google) <pratyush@kernel.org>
Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
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
 tools/testing/selftests/liveupdate/vmtest.sh  |  4 ++--
 11 files changed, 39 insertions(+), 22 deletions(-)
 rename tools/testing/selftests/liveupdate/{luo_test_utils.h => lib/include/libliveupdate.h} (89%)
 create mode 100644 tools/testing/selftests/liveupdate/lib/libliveupdate.mk
 rename tools/testing/selftests/liveupdate/{luo_test_utils.c => lib/lu_utils.c} (99%)

diff --git a/tools/testing/selftests/liveupdate/.gitignore b/tools/testing/selftests/liveupdate/.gitignore
index cb08ddb0dfee..47c670bf532b 100644
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
index 885712a65075..74d41115c281 100644
--- a/tools/testing/selftests/liveupdate/luo_test_utils.c
+++ b/tools/testing/selftests/liveupdate/lib/lu_utils.c
@@ -23,7 +23,7 @@
 #include <stdarg.h>
 #include <linux/unistd.h>
 
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
diff --git a/tools/testing/selftests/liveupdate/vmtest.sh b/tools/testing/selftests/liveupdate/vmtest.sh
index b0000fae1461..64fd2ab55b76 100755
--- a/tools/testing/selftests/liveupdate/vmtest.sh
+++ b/tools/testing/selftests/liveupdate/vmtest.sh
@@ -131,9 +131,9 @@ function mkinitrd() {
 	"$CROSS_COMPILE"gcc -static -O2 -nostdinc -nostdlib \
 		-I "$headers_dir/include" \
 		-I "$kernel_dir/tools/include/nolibc" \
-		-I "$test_dir" \
+		-I "$test_dir/lib/include" \
 		-o "$workspace_dir/test_binary" \
-		"$test_dir/$test_name.c" "$test_dir/luo_test_utils.c"
+		"$test_dir/$test_name.c" "$test_dir/lib/lu_utils.c"
 
 	"$CROSS_COMPILE"gcc -s -static -Os -nostdinc -nostdlib		\
 			-fno-asynchronous-unwind-tables -fno-ident	\
-- 
2.55.0.229.g6434b31f56-goog

