Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA08C883F
	for <linux-kselftest@vger.kernel.org>; Sat,  8 Aug 2026 14:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786197811; cv=none; b=q9srYYJBhXLljSjqbU7qTZOtRLVDIJFykGuFeOGzv9Nk0dXmY7rl2jkLn5bvGKR48Y4NygC4NaLo/9eMv514buqLvCb+Vj4Vv/X0hxpKQUOHxJrwFHZcg/WCzNq545KpzNBxBMzuxHqAJAFjL05iS+bUySol0hw/bnHn7dRRlUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786197811; c=relaxed/simple;
	bh=qV8EWCvezkBaBw9y2aume0AWW9XOYdG802eycHS0Abg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a4h2Ur9Ssh8eT3qrdMtx3LJub8rW4rZ5s8fDeE03xDtwrsbaLj+VqQONdjA6NuNrxU1M56OlKu/1K+X3lLE5Qo75cqj8B9jpdGzwhEXfG5AF34exP5teYgFUWY7/z1Mqd3L7GsHT7hVaLrUOPiPqZJpxM/7c8z3d8vfARgLiMLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SALwBGKj; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SALwBGKj"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cf27856f9cso5440415ad.2
        for <linux-kselftest@vger.kernel.org>; Sat, 08 Aug 2026 07:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786197810; x=1786802610; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zh0Gc0PJJF5/srbJo8dz+JvtQdZ+zW1fsqn1yIoKUI8=;
        b=SALwBGKjJnHEThVNqvRo0pbqWm0nrsi1yJi62IlPWa9pjqwgtHX6T6u8f4tn/FiDNh
         g4+iMVPssdW5aAtM+6vdDwGFua6ASHBVThtJ4JeUeTzHG9eLBXT1hfmMMgBIJmOIVvKm
         EFEUzFpGkHogDwnUgMN4BVrY58ths9bco7zou+uv6bZQadNoEr2A741qVE+sx0SWM+VS
         R1yA3Bl1vlBbDJTfsuG26JYPB+hKnsIr5C91N5IE6EFpmEPJZnHHq2VLfAevMykGZYph
         Xk4HiKuxoJ0CBg+X5yZRYQ0pFCPoF/nnDMZRn+vvrV+BXZEP+4hTmvV9KqlQvqYQMDUG
         eyxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786197810; x=1786802610;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zh0Gc0PJJF5/srbJo8dz+JvtQdZ+zW1fsqn1yIoKUI8=;
        b=gUaE2IjvfFJEi3BYCaxMQKyjJZIT0IDwg5E/ADJLTEcqPMoeBFkfGiudQCTrdrGnNY
         ULKjG3OUsVMCiiiG1pG5i5f8EfjzYWVoee9Xm+7zYs0dMMXOe6WIL92dxwxgiIztFZZU
         9X4bQ3TeYbiMu/VukWSgEdCATeZyfcanDv35LjyvzlLXfgjN4mqCqxB3J4vkEaaHZ7j9
         j6wvL0QXjdWPLSW9U69cMIQKR2ZW92F3d6BATr1Qy86eJTuZU7eP0YLihN9bRS/s4tYu
         9vRH5d+XpP2geRPhRZYqZ7PR37+SH6pjJ+eGnvKP4fcG0wDa2DmPtXH00SuTspHON7Da
         7PZg==
X-Gm-Message-State: AOJu0Yy1rwdj4C46q+TonBvYrB0mnE9GVrwIYKzTCrkJDq8khg5lAakj
	+AU6ZDL5D9/3YmMGFklcRwvwF/EWPKEkm4BYoQU9mJGpg+BtBjPfK1h7
X-Gm-Gg: AR+sD1272OUcxHPtJn7UqU2cBLzT5OMfUdc6QW5TOpLCzbf6yoGFMu//G28JNBN9ZLN
	1tjPpXqut7CTTbctZ/DBGOlQaqdlqyy5So12vix41euJsDYu6EQjFIXjrpf6CSbXXuP/lk6ED0Q
	LagpKYMCQxHgH7A3wAA+v402cUgOIT4HYN3zPnMBlPaE1j9kmct5Vnqzd/+4AaCMcQsYKPhPb3A
	CI15rKkZHSX6poMG8mEFslO1EDAxB0sc4I4MW5+I8wwbrm/6OBl4Bp/GwhMfokt5F2ygFInoF6F
	9m9h0SiOic4A+hPKO0SoyWmMez95m5X/Xa9syfttaIluAZqPRgK7ra+Edi7PlO5TyzsLCrxrZVm
	aEtaVw1A265PD5RFmMJvOmlja2NIM5NJJfskgpBmVIU3hrtf50VX0ezCBVEDaNCcHhpY2wIRnmG
	XDtAk5FEeZGaCnVtko83bkTcCcaWm64vpUJB9aBpgs7oYgJSNjYawMjhWob0Cj+sdz4cR/
X-Received: by 2002:a17:903:1b66:b0:2c9:e9db:8167 with SMTP id d9443c01a7336-2d0ca7125c0mr384049245ad.7.1786197809941;
        Sat, 08 Aug 2026 07:03:29 -0700 (PDT)
Received: from mohammed-rizwan-HP-Laptop-15-bs1xx.. ([2406:7400:63:cd19:6ccb:b987:b875:e968])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315be8a9220sm21644406eec.7.2026.08.08.07.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 07:03:29 -0700 (PDT)
From: Mohammed Rizwan Kaniyate <mrizwank004@gmail.com>
X-Google-Original-From: Mohammed Rizwan Kaniyate mrizwankan004@gmail.com
To: nphamcs@gmail.com,
	shuah@kernel.org,
	hannes@cmpxchg.org
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mohammed Rizwan Kaniyate <mrizwank004@gmail.com>
Subject: [PATCH 1/1] selftests/cachestat: add fault-path errno coverage for cachestat
Date: Sat,  8 Aug 2026 19:33:06 +0530
Message-ID: <20260808140306.945459-1-mrizwank004@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mohammed Rizwan Kaniyate <mrizwank004@gmail.com>

Add a dedicated fault test for cachestat argument
validation and errno behaviour.
The test verifies EBADF, EFAULT and EINVAL case
using a common helper that
resets/checks errno and reports mismatch.

Signed-off-by: Mohammed Rizwan Kaniyate <mrizwank004@gmail.com>
---
 .../selftests/cachestat/test_cachestat.c      | 56 +++++++++++++++++--
 1 file changed, 50 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/cachestat/test_cachestat.c b/tools/testing/selftests/cachestat/test_cachestat.c
index 542cd09cb4434..6b23022b4ec76 100644
--- a/tools/testing/selftests/cachestat/test_cachestat.c
+++ b/tools/testing/selftests/cachestat/test_cachestat.c
@@ -18,7 +18,7 @@
 
 #include "kselftest.h"
 
-#define NR_TESTS	9
+#define NR_TESTS	10
 
 static const char * const dev_files[] = {
 	"/dev/zero", "/dev/null", "/dev/urandom",
@@ -294,23 +294,67 @@ bool run_cachestat_test(enum file_type type)
 	return ret;
 }
 
+bool expect_cachestat_errno(int fd, struct cachestat_range *csr, struct cachestat *cs,
+	unsigned int flags, int expected_errno, const char *desc)
+{
+	int sys_ret;
+
+	errno = 0;
+
+	sys_ret = syscall(__NR_cachestat, fd, csr, cs, flags);
+
+	if (sys_ret == -1 && errno == expected_errno) {
+		ksft_print_msg("cachestat test success for %s\n", desc);
+	} else {
+		ksft_print_msg("cachestat test fail : %s: ret=%d, errno=%d expected_errno=%d\n",
+			desc, sys_ret, errno, expected_errno);
+		return false;
+	}
+
+	return true;
+}
+
+bool test_cachestat_faults(void)
+{
+	bool ret = true;
+	struct cachestat cs = {0};
+	struct cachestat_range cr = {0, 0};
+	// Test that the cachestat syscall fails with a bad file descriptor
+	ret &= expect_cachestat_errno(-1, &cr, &cs, 0, EBADF, "bad file descriptor");
+
+	// Fails with a NULL cacherange
+	ret &= expect_cachestat_errno(0, NULL, &cs, 0, EFAULT, "NULL range");
+	// Fails with a NULL result
+	ret &= expect_cachestat_errno(0, &cr, NULL, 0, EFAULT, "NULL result");
+	// Fails with invalid user space address
+	ret &= expect_cachestat_errno(0, (struct cachestat_range *)0x1, &cs,
+		0, EFAULT, "invalid range address");
+	// Fails with invalid user space address
+	ret &= expect_cachestat_errno(0, &cr, (struct cachestat *)0x1, 0,
+		EFAULT, "invalid result address");
+	// Fails with invalid flag
+	ret &= expect_cachestat_errno(0, &cr, &cs, 1, EINVAL, "invalid flags");
+
+	return ret;
+}
+
 int main(void)
 {
 	int ret;
 
 	ksft_print_header();
 
+	errno = 0;
 	ret = syscall(__NR_cachestat, -1, NULL, NULL, 0);
 	if (ret == -1 && errno == ENOSYS)
 		ksft_exit_skip("cachestat syscall not available\n");
-
+	ret = 0;
 	ksft_set_plan(NR_TESTS);
 
-	if (ret == -1 && errno == EBADF) {
-		ksft_test_result_pass("bad file descriptor recognized\n");
-		ret = 0;
+	if (test_cachestat_faults()) {
+		ksft_test_result_pass("cachestat syscall fault tests passed\n");
 	} else {
-		ksft_test_result_fail("bad file descriptor ignored\n");
+		ksft_test_result_fail("cachestat syscall fault tests failed\n");
 		ret = 1;
 	}
 
-- 
2.43.0

