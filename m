Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9043988E0
	for <linux-kselftest@vger.kernel.org>; Fri,  5 Jun 2026 03:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780630465; cv=none; b=pH6nrNfUUtAaFJ5uvVRyBFEYnfqE3X3Z/ure2rWFxvS8/GJOptRbP2hLypMgtC4oJzMG5mhvqyyvDWqonbC0NQOsFYL5GA/T6CZ8POCS4qxsdgKRd6ha/hR4BtvDWcs2r1g2MjqGdQ872hAm6I2AOnCnDa7q30UMAVC82uVa9eE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780630465; c=relaxed/simple;
	bh=EryfO6BIhkEjNjxl4nuOnpJQVHpd6RmCotJcy7+BaGQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GY957zLnMCFkQAYvhuGx2Q5KaNBnkK6tqkt8WMI8MMQZLy7kA7lO8r6VAqYUQIvsdTAUuTHQpEXuPKhCQYCxcxDmoqTbCODtpBG5s4Ste0xSvCPhZutXyP0MPlWNt/JjlP3drwIrjuriEiQPQ7H3dLHQyW6KJ8CPbiEXH+7E7t0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=fpwL7b4m; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="fpwL7b4m"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-51764768c36so20941921cf.0
        for <linux-kselftest@vger.kernel.org>; Thu, 04 Jun 2026 20:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780630463; x=1781235263; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rfxlNkzCx8TA3SebJdSu06wI/is0K0+hQNvlMemiJzs=;
        b=fpwL7b4mVbU5SWWgO7SMj/OjXxWa785AG4w3MSGrnRIBYHpNpz3QZRhK7EvOP96BzM
         89Ep7ecmEBt1skBHo3gW3OBBseh91kz75FC3z6aOVnx0utwLmcmRGHpzovaZxwrpLmBo
         +3nATnatQF4+QDE/0Wh8t09jaBDtHxVwboemJu7RofMpZhSmaF1TCgQFDZ7X4+MLwY1D
         sff4Uu1SBOVncw92VZ1WHAy8MlBj8k2NYg22YwjcZB0z2UdXZHPOLRD0JdpU7kGkzP59
         fnDVDYTeskdhJ8KVqWftlhEErYj4rMOwpsm6CfnPyACWhyN26ee/JAAebnslaGSmmUMw
         YchA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780630463; x=1781235263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rfxlNkzCx8TA3SebJdSu06wI/is0K0+hQNvlMemiJzs=;
        b=U1XuK0/JG5geq0tyT9T1a6XWm3UYN7BYVKVbk5ZA+eULHoKqMxhCZqUgOn4op0xBh6
         Oh1t+SzNyL5NYAwWhXxvupz21pDRwTQSIeLRDIcGOitfyiGHTHoMPL8oPPb7P+LDWUCN
         MB97sejJkpcY9R0/dtkfE/BL7fnqrKZQwAsyM1Cge+vgvHPuUJhZhrRgvYuNMNZlE63V
         TGMpz59yLLqlQAD1duCIYBuVbmxG7OsyuVm9AvYYaZuaU4FRJZj6E0+SUL7hZQ+kHyd+
         3J3QCxwrhA1izx0UPW76irGbG1vs02jILw20kc1gf05Hx0o9zecytDRql0o9YONd2uXy
         I3Kw==
X-Gm-Message-State: AOJu0YwYYeSzKWVSkzTsHsMjXMMho1gMB81WjDGHewAyRpBhjoA9MhXC
	aS2wXh+Ys+CXFNc01TOd7KlrXHoZCUgXt9oLsjEwOO28upl5o/tDJnbJ9NSwQf8/DzygAYfKj2o
	JjRhI
X-Gm-Gg: Acq92OHItX/pEelNhTY/kmkALzi9+1L6cTQ0I5S27rwamxE56ohQ2VDss2KExHEiaSZ
	pp4IET7Ykt3VGdw58SGGn2mTKChwuceIJ1YwstB4RzobssFbTpYQcYIoaN+m/uxmIXbxE1URA3Z
	UG6Axq7WqzFztcyJRvvx0SUx7Z2G0XA8eRGpG8RYtn3Ko7LUSK+IGauBpAfqVv2/XHBAb39qGNz
	mDfbNZ/GDIBOAdCYiq07oeEotQLrg1UYeKKXge4AZ0Bj5XyQIIcSJJV2dGMEg4YQhVAKF9D0Jtg
	6nXseiylP8S6kobHJF6JsvVO5TGPHI/jmjkIJHGksnSg1lctDllOb25Bl8ChcNKQH1PVK4u2v+B
	UEQCrCBiv66+LGW7NWBJs/TNPZPnNh1uQH/77ymWUvpipMmNMZWpvoopAoeoAKzYMOIlFr0g0eC
	MN/YwwoYHARzNU9Zmwq0jraA9xkKpIgM0iY9gSEr+vQTV4u3lybaAN0ea+sksLlA==
X-Received: by 2002:a05:622a:4106:b0:517:6665:2a9a with SMTP id d75a77b69052e-51795c920f2mr28080531cf.50.1780630463488;
        Thu, 04 Jun 2026 20:34:23 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51775df4dd6sm67871381cf.27.2026.06.04.20.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 20:34:23 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	rppt@kernel.org,
	shuah@kernel.org,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	jasonmiu@google.com,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	ran.xiaokai@zte.com.cn,
	pasha.tatashin@soleen.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	graf@amazon.com
Subject: [RFC v1 9/9] liveupdate: add KUnit test to verify alphabetical order of compatibility strings
Date: Fri,  5 Jun 2026 03:32:35 +0000
Message-ID: <20260605033235.717351-10-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260605033235.717351-1-pasha.tatashin@soleen.com>
References: <20260605033235.717351-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce a KUnit test suite to verify that composite compatibility
strings are formatted correctly, specifically ensuring that all KHO
sub-component compatibility strings are unique and strictly sorted
in alphabetical order.

Maintaining alphabetical order in composite compatibility strings
is required to guarantee consistent, predictable, and reproducible
compatibility string representation across different system configurations.

The test suite validates:
- KHO_FDT_COMPATIBLE (the root composite compatibility string)
- LUO_ABI_COMPATIBLE (the LUO composite compatibility string)
- MEMFD_LUO_FH_COMPATIBLE (the memfd file handler composite compatibility string)

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 kernel/liveupdate/Kconfig                 | 15 ++++++
 kernel/liveupdate/Makefile                |  2 +
 kernel/liveupdate/liveupdate_test.c       | 56 +++++++++++++++++++++++
 tools/testing/selftests/liveupdate/config |  1 +
 4 files changed, 74 insertions(+)
 create mode 100644 kernel/liveupdate/liveupdate_test.c

diff --git a/kernel/liveupdate/Kconfig b/kernel/liveupdate/Kconfig
index c13af38ba23a..617a31dcee73 100644
--- a/kernel/liveupdate/Kconfig
+++ b/kernel/liveupdate/Kconfig
@@ -86,4 +86,19 @@ config LIVEUPDATE_MEMFD
 
 	  If unsure, say N.
 
+config LIVEUPDATE_KUNIT_TEST
+	tristate "KUnit tests for LUO and KHO" if !KUNIT_ALL_TESTS
+	depends on KUNIT
+	depends on LIVEUPDATE
+	default KUNIT_ALL_TESTS
+	help
+	  Enable KUnit tests for LUO and KHO. These tests verify that the
+	  composite KHO, LUO, and memfd compatibility strings remain unique
+	  and sorted alphabetically.
+
+	  For more information on KUnit and unit tests in general, please refer
+	  to the KUnit documentation in Documentation/dev-tools/kunit/.
+
+	  If unsure, say N.
+
 endmenu
diff --git a/kernel/liveupdate/Makefile b/kernel/liveupdate/Makefile
index b481e21a311a..5e0deb85e1b1 100644
--- a/kernel/liveupdate/Makefile
+++ b/kernel/liveupdate/Makefile
@@ -17,3 +17,5 @@ obj-$(CONFIG_KEXEC_HANDOVER_DEBUG)	+= kexec_handover_debug.o
 obj-$(CONFIG_KEXEC_HANDOVER_DEBUGFS)	+= kexec_handover_debugfs.o
 
 obj-$(CONFIG_LIVEUPDATE)		+= luo.o
+obj-$(CONFIG_LIVEUPDATE_KUNIT_TEST)		+= liveupdate_test.o
+
diff --git a/kernel/liveupdate/liveupdate_test.c b/kernel/liveupdate/liveupdate_test.c
new file mode 100644
index 000000000000..15688d69735e
--- /dev/null
+++ b/kernel/liveupdate/liveupdate_test.c
@@ -0,0 +1,56 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * KUnit test for Live Update compatibility strings.
+ */
+#include <kunit/test.h>
+#include <linux/string.h>
+#include <linux/kho/abi/kexec_handover.h>
+#include <linux/kho/abi/luo.h>
+#include <linux/kho/abi/memfd.h>
+
+/* Verify that compatibility sub-components are unique and sorted alphabetically */
+static bool is_alphabetical_unique(const char *compat)
+{
+	char buf[1024];
+	char *string = buf;
+	char *token;
+	char *prev = NULL;
+	char *sub;
+
+	strscpy(buf, compat, sizeof(buf));
+
+	sub = strchr(string, ';');
+	if (!sub)
+		return true;
+
+	sub++;
+
+	while ((token = strsep(&sub, ";")) != NULL) {
+		if (prev && strcmp(prev, token) >= 0)
+			return false;
+		prev = token;
+	}
+
+	return true;
+}
+
+static void test_compatibility_alphabetical(struct kunit *test)
+{
+	KUNIT_EXPECT_TRUE(test, is_alphabetical_unique(KHO_FDT_COMPATIBLE));
+	KUNIT_EXPECT_TRUE(test, is_alphabetical_unique(LUO_ABI_COMPATIBLE));
+	KUNIT_EXPECT_TRUE(test, is_alphabetical_unique(MEMFD_LUO_FH_COMPATIBLE));
+}
+
+static struct kunit_case liveupdate_test_cases[] = {
+	KUNIT_CASE(test_compatibility_alphabetical),
+	{}
+};
+
+static struct kunit_suite liveupdate_test_suite = {
+	.name = "liveupdate-compatibility",
+	.test_cases = liveupdate_test_cases,
+};
+
+kunit_test_suite(liveupdate_test_suite);
+
+MODULE_LICENSE("GPL");
diff --git a/tools/testing/selftests/liveupdate/config b/tools/testing/selftests/liveupdate/config
index 91d03f9a6a39..28c54bb473b8 100644
--- a/tools/testing/selftests/liveupdate/config
+++ b/tools/testing/selftests/liveupdate/config
@@ -6,6 +6,7 @@ CONFIG_KEXEC_HANDOVER_DEBUGFS=y
 CONFIG_KEXEC_HANDOVER_DEBUG=y
 CONFIG_LIVEUPDATE=y
 CONFIG_LIVEUPDATE_TEST=y
+CONFIG_LIVEUPDATE_KUNIT_TEST=y
 CONFIG_MEMFD_CREATE=y
 CONFIG_TMPFS=y
 CONFIG_SHMEM=y
-- 
2.53.0

