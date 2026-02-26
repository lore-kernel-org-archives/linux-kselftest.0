Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E7A3A7849;
	Thu, 26 Feb 2026 22:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772144691; cv=none; b=abLBor7PIi3qKmxVdQ82MS7JJ4fJ4UhhSISjcl0XVJ/5lJ4W+u1k1t2WxvzsemvDINxq2AJ2tCBO6mXO9EWO63JRRP89TiBVbXWYBB7QL10wLArtJKzqE+Zty38Ney5fAIuDMjdDBQT4uiPZZ46EVebkvQVE3hUYwrX+AYNiyjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772144691; c=relaxed/simple;
	bh=gfRRiSljGFcFHhZCp8h6uudeERPWEjZsb7vMNz+pmeo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WNoAKycwSXKw0DH7HeO5Z4rkJlHErsXtrDA5xFdSdOXMGB78mzNvpG683wxJhGrV3gg5kH6X1dDQSzu2wSbeBzm9u+8/HyX5gdMBkzFpwTwzoaex2tliWC8Bjgz9wJmmD7Chcsf4OkgoWUAHDpl4HxrlJdCHXKHezCoQKh1ljHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tqoSjeM1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tqoSjeM1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD45DC116C6;
	Thu, 26 Feb 2026 22:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772144691;
	bh=gfRRiSljGFcFHhZCp8h6uudeERPWEjZsb7vMNz+pmeo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=tqoSjeM1Jz6lSGDEi8LjHYwE2R43jtQ5RoJRxea2iLc+3WvEg/kEsxtESQKIW0Mw7
	 CW/8Hqb4jQhZv0oNR4TWEoblaKcyiOFt5xNCDZeJltDDsuA4bunKLa6sZ60RXBjJSc
	 w3jC1rrvo5h0d68PpfQqoWtdAPouqIQkSS5iOklyPBtjRUuXl8yPr09Ed7k48Qf9Dk
	 R65CqUp1FVOdM5QydEs6z/z3mtZXLGMv7mVKHOInhY/SxkS7l9RTbdETI+fkoP83Ro
	 AhdckCMYAOzSGY06Q66c1QtW6uO4TWX03XWSvFaE3gltwpps58vaIr2RyFu1Jmlso0
	 ObaDiRzzYnEVw==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 26 Feb 2026 22:24:42 +0000
Subject: [PATCH v4 1/2] selftests/fchmodat2: Clean up temporary files and
 directories
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-selftests-fchmodat2-v4-1-a6419435f2e8@kernel.org>
References: <20260226-selftests-fchmodat2-v4-0-a6419435f2e8@kernel.org>
In-Reply-To: <20260226-selftests-fchmodat2-v4-0-a6419435f2e8@kernel.org>
To: Shuah Khan <shuah@kernel.org>, Alexey Gladkov <legion@kernel.org>, 
 Christian Brauner <brauner@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=7362; i=broonie@kernel.org;
 h=from:subject:message-id; bh=gfRRiSljGFcFHhZCp8h6uudeERPWEjZsb7vMNz+pmeo=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpoMgu4IfxzYYBmB54XeY4Ar0XZhHlUJzc4/MvJ
 geHRjOw4/qJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaaDILgAKCRAk1otyXVSH
 0KiSB/9gywoFCXhegwHek0mkiuABbBnpi1Vq4cbirla4R8CH11ptF8kDDzKVUJFZm9OeSr+4QMi
 baZnZbnvb+Dn7wkbIJRtqep2Dh52VW3dJ9VU5Nc0/0QwabrENSlgasXz7KzbEym43BJdX8rSuNf
 3R8JrLo0LeKd0QsK6T08+NERpT96+Mj3PhHo4b1wHBoBmEXhhWyx5goST5w+W6AwxoTBnCS24sA
 tPz8ZwY5H0VCuBykMH/OJm7+X4jNlljSkFfx9fkq3wJ5yXZM18ypbgfaNvVCBSAUtp/2auxDGdp
 DddPtwfdMB26HgyZy7WYdXsfCBo0/rE1UL0fGCba8kkyBcgN
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

The fchmodat2() test program creates a temporary directory with a file and
a symlink for every test it runs but never cleans these up, resulting in
${TMPDIR} getting left with stale files after every run. Restructure the
program a bit to ensure that we clean these up, this is more invasive than
it might otherwise be due to the extensive use of ksft_exit_fail_msg() in
the program.

As a side effect this also ensures that we report a consistent test name
for the tests and always try both tests even if they are skipped.

Acked-by: Alexey Gladkov <legion@kernel.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/fchmodat2/fchmodat2_test.c | 161 ++++++++++++++-------
 1 file changed, 111 insertions(+), 50 deletions(-)

diff --git a/tools/testing/selftests/fchmodat2/fchmodat2_test.c b/tools/testing/selftests/fchmodat2/fchmodat2_test.c
index e397339495f6..e03430c4675c 100644
--- a/tools/testing/selftests/fchmodat2/fchmodat2_test.c
+++ b/tools/testing/selftests/fchmodat2/fchmodat2_test.c
@@ -9,6 +9,11 @@
 
 #include "kselftest.h"
 
+struct testdir {
+	char *dirname;
+	int dfd;
+};
+
 int sys_fchmodat2(int dfd, const char *filename, mode_t mode, int flags)
 {
 	int ret = syscall(__NR_fchmodat2, dfd, filename, mode, flags);
@@ -16,9 +21,9 @@ int sys_fchmodat2(int dfd, const char *filename, mode_t mode, int flags)
 	return ret >= 0 ? ret : -errno;
 }
 
-int setup_testdir(void)
+static void setup_testdir(struct testdir *testdir)
 {
-	int dfd, ret;
+	int ret, dfd;
 	char dirname[] = "/tmp/ksft-fchmodat2.XXXXXX";
 
 	/* Make the top-level directory. */
@@ -26,21 +31,48 @@ int setup_testdir(void)
 		ksft_exit_fail_msg("%s: failed to create tmpdir\n", __func__);
 
 	dfd = open(dirname, O_PATH | O_DIRECTORY);
-	if (dfd < 0)
-		ksft_exit_fail_msg("%s: failed to open tmpdir\n", __func__);
+	if (dfd < 0) {
+		ksft_perror("failed to open tmpdir");
+		goto err;
+	}
 
 	ret = openat(dfd, "regfile", O_CREAT | O_WRONLY | O_TRUNC, 0644);
-	if (ret < 0)
-		ksft_exit_fail_msg("%s: failed to create file in tmpdir\n",
-				__func__);
+	if (ret < 0) {
+		ksft_perror("failed to create file in tmpdir");
+		goto err;
+	}
 	close(ret);
 
 	ret = symlinkat("regfile", dfd, "symlink");
-	if (ret < 0)
-		ksft_exit_fail_msg("%s: failed to create symlink in tmpdir\n",
-				__func__);
+	if (ret < 0) {
+		ksft_perror("symlinkat() failed");
+		goto err_regfile;
+	}
+
+	testdir->dirname = strdup(dirname);
+	if (!testdir->dirname) {
+		ksft_perror("Out of memory");
+		goto err_symlink;
+	}
+	testdir->dfd = dfd;
+
+	return;
+
+err_symlink:
+	unlinkat(testdir->dfd, "symlink", 0);
+err_regfile:
+	unlinkat(testdir->dfd, "regfile", 0);
+err:
+	unlink(dirname);
+	ksft_exit_fail();
+}
 
-	return dfd;
+static void cleanup_testdir(struct testdir *testdir)
+{
+	unlinkat(testdir->dfd, "regfile", 0);
+	unlinkat(testdir->dfd, "symlink", 0);
+	rmdir(testdir->dirname);
+	free(testdir->dirname);
 }
 
 int expect_mode(int dfd, const char *filename, mode_t expect_mode)
@@ -48,61 +80,80 @@ int expect_mode(int dfd, const char *filename, mode_t expect_mode)
 	struct stat st;
 	int ret = fstatat(dfd, filename, &st, AT_SYMLINK_NOFOLLOW);
 
-	if (ret)
-		ksft_exit_fail_msg("%s: %s: fstatat failed\n",
-				__func__, filename);
+	if (ret) {
+		ksft_perror("fstatat() failed\n");
+		return 0;
+	}
 
 	return (st.st_mode == expect_mode);
 }
 
 void test_regfile(void)
 {
-	int dfd, ret;
-
-	dfd = setup_testdir();
+	struct testdir testdir;
+	int ret;
 
-	ret = sys_fchmodat2(dfd, "regfile", 0640, 0);
+	setup_testdir(&testdir);
 
-	if (ret < 0)
-		ksft_exit_fail_msg("%s: fchmodat2(noflag) failed\n", __func__);
-
-	if (!expect_mode(dfd, "regfile", 0100640))
-		ksft_exit_fail_msg("%s: wrong file mode bits after fchmodat2\n",
-				__func__);
+	ret = sys_fchmodat2(testdir.dfd, "regfile", 0640, 0);
 
-	ret = sys_fchmodat2(dfd, "regfile", 0600, AT_SYMLINK_NOFOLLOW);
+	if (ret < 0) {
+		ksft_perror("fchmodat2(noflag) failed");
+		goto out;
+	}
 
-	if (ret < 0)
-		ksft_exit_fail_msg("%s: fchmodat2(AT_SYMLINK_NOFOLLOW) failed\n",
+	if (!expect_mode(testdir.dfd, "regfile", 0100640)) {
+		ksft_print_msg("%s: wrong file mode bits after fchmodat2\n",
 				__func__);
-
-	if (!expect_mode(dfd, "regfile", 0100600))
-		ksft_exit_fail_msg("%s: wrong file mode bits after fchmodat2 with nofollow\n",
-				__func__);
-
-	ksft_test_result_pass("fchmodat2(regfile)\n");
+		ret = 1;
+		goto out;
+	}
+
+	ret = sys_fchmodat2(testdir.dfd, "regfile", 0600, AT_SYMLINK_NOFOLLOW);
+
+	if (ret < 0) {
+		ksft_perror("fchmodat2(AT_SYMLINK_NOFOLLOW) failed");
+		goto out;
+	}
+
+	if (!expect_mode(testdir.dfd, "regfile", 0100600)) {
+		ksft_print_msg("%s: wrong file mode bits after fchmodat2 with nofollow\n",
+			       __func__);
+		ret = 1;
+	}
+
+out:
+	ksft_test_result(ret == 0, "fchmodat2(regfile)\n");
+	cleanup_testdir(&testdir);
 }
 
 void test_symlink(void)
 {
-	int dfd, ret;
+	struct testdir testdir;
+	int ret;
 
-	dfd = setup_testdir();
+	setup_testdir(&testdir);
 
-	ret = sys_fchmodat2(dfd, "symlink", 0640, 0);
+	ret = sys_fchmodat2(testdir.dfd, "symlink", 0640, 0);
 
-	if (ret < 0)
-		ksft_exit_fail_msg("%s: fchmodat2(noflag) failed\n", __func__);
+	if (ret < 0) {
+		ksft_perror("fchmodat2(noflag) failed");
+		goto err;
+	}
 
-	if (!expect_mode(dfd, "regfile", 0100640))
-		ksft_exit_fail_msg("%s: wrong file mode bits after fchmodat2\n",
-				__func__);
+	if (!expect_mode(testdir.dfd, "regfile", 0100640)) {
+		ksft_print_msg("%s: wrong file mode bits after fchmodat2\n",
+			       __func__);
+		goto err;
+	}
 
-	if (!expect_mode(dfd, "symlink", 0120777))
-		ksft_exit_fail_msg("%s: wrong symlink mode bits after fchmodat2\n",
-				__func__);
+	if (!expect_mode(testdir.dfd, "symlink", 0120777)) {
+		ksft_print_msg("%s: wrong symlink mode bits after fchmodat2\n",
+			       __func__);
+		goto err;
+	}
 
-	ret = sys_fchmodat2(dfd, "symlink", 0600, AT_SYMLINK_NOFOLLOW);
+	ret = sys_fchmodat2(testdir.dfd, "symlink", 0600, AT_SYMLINK_NOFOLLOW);
 
 	/*
 	 * On certain filesystems (xfs or btrfs), chmod operation fails. So we
@@ -111,18 +162,28 @@ void test_symlink(void)
 	 *
 	 * https://sourceware.org/legacy-ml/libc-alpha/2020-02/msg00467.html
 	 */
-	if (ret == 0 && !expect_mode(dfd, "symlink", 0120600))
-		ksft_exit_fail_msg("%s: wrong symlink mode bits after fchmodat2 with nofollow\n",
+	if (ret == 0 && !expect_mode(testdir.dfd, "symlink", 0120600)) {
+		ksft_print_msg("%s: wrong symlink mode bits after fchmodat2 with nofollow\n",
 				__func__);
+		ret = 1;
+		goto err;
+	}
 
-	if (!expect_mode(dfd, "regfile", 0100640))
-		ksft_exit_fail_msg("%s: wrong file mode bits after fchmodat2 with nofollow\n",
-				__func__);
+	if (!expect_mode(testdir.dfd, "regfile", 0100640)) {
+		ksft_print_msg("%s: wrong file mode bits after fchmodat2 with nofollow\n",
+			       __func__);
+	}
 
 	if (ret != 0)
 		ksft_test_result_skip("fchmodat2(symlink)\n");
 	else
 		ksft_test_result_pass("fchmodat2(symlink)\n");
+	cleanup_testdir(&testdir);
+	return;
+
+err:
+	ksft_test_result_fail("fchmodat2(symlink)\n");
+	cleanup_testdir(&testdir);
 }
 
 #define NUM_TESTS 2

-- 
2.47.3

