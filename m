Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D767247D468
	for <linux-kselftest@vger.kernel.org>; Wed,  7 Oct 2026 10:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791369011; cv=none; b=JiFkq0XE77GWc1UnMstRl01tB6k29tXoW8LCuiU3eMXe2LpS58CKPB558BsUWAuiw6hT5DB3S19oMGpv2sHlD+FXn9A4hpcWhpuy5u0VKMKSMLMcPjDL7X+hkoaY3GzFcZtVeM9cqKoP1Aio2t5cHRgQnjrkzF+qvbRlXVKMzxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791369011; c=relaxed/simple;
	bh=VU+1mCWqo7+B67ddwoUD1gZe5snWq20ItfRTexL+qjo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uwbQ22vCv2d+SaK01pRix5FM46zr91JBRVqpA3FNBanEg5/HNJ+so12Devx9+7ln4vrfTUBwsNa99m3lGl5HJB7LTw9QYO0n01KlziicJo/jZaV+pEinmo4U2cM8Nbpxq5OLoj5NgDjpzfJaragUBKJ/SDYRuNzzmlKXs0fOdCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mtPPqZEF; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mtPPqZEF"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-88c72646f03so1954377b3a.2
        for <linux-kselftest@vger.kernel.org>; Wed, 07 Oct 2026 03:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791368997; x=1791973797; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LSdEPaTFMwA4pJZC+adjE3HC41fXyUvfQa8u0qcPt5U=;
        b=mtPPqZEFuEIIPgmsmct/v/UdBkffF0fMInWWUpwfyUDMCkeEKk3FSNeZjWHVmA5VQf
         7juBjQVdfcW4OYwwCNHsqxUqo0PvGPdH8G7I+tuHcBTlA3CetKrLNQQY3KrO5h2nGLeq
         eAow3U99eal4Ka0ZNtUVpQLngsgj2T1ku9lCTR6bnDcww7JUlJBbun90Jy30ztWNdl4J
         OF3E4+njHtoRgsiRNXn+D7jgUlpIZMX7kHQad8HCOoVkE7GuT1I+AsM4/0T0aW2s7bAJ
         71t7H7P8re9pV9NbZYcDCJWcoBMTT75cYyvUkj/2B4cxt8mSLLPci5vZyBU1IGofvwaj
         0jpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791368997; x=1791973797;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LSdEPaTFMwA4pJZC+adjE3HC41fXyUvfQa8u0qcPt5U=;
        b=bsqE2Xd39M1BHpD7sTc/98l0+3Hpfzrr7nSzARhw6FhHHwyIH+O6ItwHEcoG0TL5pz
         +9g6Gvq0u9Iw9qfXVZqTOoGUbvWlS7i8vt393TQjIXkiJSTn2MBw0bXal/lpImwC70LW
         6AjooPyNMEV/w29Ens2gCK2nkPFnHuWH71kVEEyb/NEyO4Dc724ZI6fvkjttwtUvFOlD
         U/It1kpyIY4s/Kh7xACdCVNf7c5RM1y8P3HFcTjJ/aJ5bOwsTELrFUyN3fjOPEEkMzqd
         ooplyQYa3WmlJDT8QxHHHo303pFe7dCScwSGifMhmkRmHmWOrqJIF0476apHy4foctYF
         GU1g==
X-Gm-Message-State: AFuF++n0H1PdIqyR0Xn7qmTCqirrBEqBee39JP+c/wo8KuZK5vSLkuFL
	PUJMcaKTZDPTB56FTLQUxBdXqAWpCssNPP9GPkOIvUfBWuOSafOCo2sC
X-Gm-Gg: AYBFou122JxmzW6n+okRWzwQt6bael7QAx3ybtrtSSUVdieBP9aV3l8lE2RTB/maACW
	uGq3/ybykFmEkGiojgMmGPdp0UiiSMw/ZIs/O3ZEZQeIRbJXYPON68IHUcOpCXcTq0Jp7LGZlmU
	2wgDyVoH56C//Vpt+oUMFP4EbMwROTdPaBzYRrOhomfOBviP079zHV32Sojl+VvVk0+SroiscRX
	Yfn7NyXFifm5eYKht3Ha6ic4MQoEUVqjlDIPiYDkCWK34v5CFrMyscWlyjZtJUlTysr6YXPu2jK
	+As1rjdyYU391PFHZbUe7rEMpt73hmPj5xDGWTiYB7/fy8yKT7RAjPwCEut6h4ZYxNN1++CNs8Y
	ZK0NGqrWD3+cVuNr1bUhBqcG+Gy8Ubj3U8r5oFGTT719TsYW3Wufb48bwy7V5nKh0H4f70qz9BT
	BO71rhbgzBXaO+qrYEqgMauP96OvevcPtPnF8yQR61CaUQUsLJJDpn8u17efEeQPvFnDjxqktJZ
	KJXpLLISLyz59KBErTW65SnVC8=
X-Received: by 2002:a05:6a00:852:b0:891:6aeb:84fc with SMTP id d2e1a72fcca58-891b3f28e06mr1514627b3a.22.1791368996941;
        Wed, 07 Oct 2026 03:29:56 -0700 (PDT)
Received: from obadmin-Precision-3680.atlascopco.group ([167.103.3.1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-891894f75c4sm1102953b3a.38.2026.10.07.03.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 03:29:55 -0700 (PDT)
From: Sahaj Chaudhari <sahaj123.sc@gmail.com>
To: shuah@kernel.org
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sahaj Chaudhari <sahaj123.sc@gmail.com>
Subject: [PATCH] selftests/prctl: Test PR_SET_MM_AUXV terminator
Date: Wed,  7 Oct 2026 16:00:33 +0530
Message-ID: <20261007103033.1549957-1-sahaj123.sc@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Verify that a shortened vector supplied through PR_SET_MM_AUXV has a
valid AT_NULL terminator when exposed through /proc/self/auxv. This
catches stale AUXV entries left beyond the supplied vector.

Signed-off-by: Sahaj Chaudhari <sahaj123.sc@gmail.com>
---
 tools/testing/selftests/prctl/.gitignore      |  1 +
 tools/testing/selftests/prctl/Makefile        |  1 +
 .../testing/selftests/prctl/pr_set_mm_auxv.c  | 42 +++++++++++++++++++
 3 files changed, 44 insertions(+)
 create mode 100644 tools/testing/selftests/prctl/pr_set_mm_auxv.c

diff --git a/tools/testing/selftests/prctl/.gitignore b/tools/testing/selftests/prctl/.gitignore
index 05d5e31661dfd..089af0296aeca 100644
--- a/tools/testing/selftests/prctl/.gitignore
+++ b/tools/testing/selftests/prctl/.gitignore
@@ -4,3 +4,4 @@ disable-tsc-on-off-stress-test
 disable-tsc-test
 set-anon-vma-name-test
 set-process-name
+pr_set_mm_auxv
diff --git a/tools/testing/selftests/prctl/Makefile b/tools/testing/selftests/prctl/Makefile
index e770e86fad9ac..a21811a8f6a06 100644
--- a/tools/testing/selftests/prctl/Makefile
+++ b/tools/testing/selftests/prctl/Makefile
@@ -6,6 +6,7 @@ override ARCH := $(shell echo $(ARCH) | sed -e s/i.86/x86/ -e s/x86_64/x86/)
 ifeq ($(ARCH),x86)
 TEST_PROGS := disable-tsc-ctxt-sw-stress-test disable-tsc-on-off-stress-test \
 		disable-tsc-test set-anon-vma-name-test set-process-name
+TEST_GEN_PROGS := pr_set_mm_auxv
 all: $(TEST_PROGS)
 
 include ../lib.mk
diff --git a/tools/testing/selftests/prctl/pr_set_mm_auxv.c b/tools/testing/selftests/prctl/pr_set_mm_auxv.c
new file mode 100644
index 0000000000000..934ff480c0f4d
--- /dev/null
+++ b/tools/testing/selftests/prctl/pr_set_mm_auxv.c
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <elf.h>
+#include <errno.h>
+#include <fcntl.h>
+#include <sys/prctl.h>
+#include <unistd.h>
+
+#include "kselftest_harness.h"
+
+TEST(set_mm_auxv_terminator)
+{
+	unsigned long auxv[] = {
+		AT_UID, 0x1111,
+		AT_GID, 0x2222,
+	};
+	unsigned long result[64];
+	ssize_t len;
+	int fd;
+
+	if (prctl(PR_SET_MM, PR_SET_MM_AUXV, (unsigned long)auxv,
+		  sizeof(auxv), 0)) {
+		if (errno == EPERM)
+			SKIP(return, "requires CAP_SYS_RESOURCE");
+		ASSERT_EQ(errno, 0);
+	}
+
+	fd = open("/proc/self/auxv", O_RDONLY);
+	ASSERT_GE(fd, 0);
+
+	len = read(fd, result, sizeof(result));
+	close(fd);
+
+	ASSERT_GE(len, (ssize_t)(6 * sizeof(unsigned long)));
+	EXPECT_EQ(result[0], (unsigned long)AT_UID);
+	EXPECT_EQ(result[1], 0x1111UL);
+	EXPECT_EQ(result[2], (unsigned long)AT_GID);
+	EXPECT_EQ(result[3], 0x2222UL);
+	EXPECT_EQ(result[4], (unsigned long)AT_NULL);
+	EXPECT_EQ(result[5], 0UL);
+}
+
+TEST_HARNESS_MAIN
-- 
2.43.0

