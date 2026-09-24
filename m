Received: from mail-oa2-f35.google.com (mail-oa2-f35.google.com [74.125.231.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E16B73B3C11
	for <linux-kselftest@vger.kernel.org>; Thu, 24 Sep 2026 01:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790214754; cv=none; b=Q8q1ZCHyCpnJhj4DQnhDiCDGzvdOvM+efokBdf72dM+Q+LnoTfX7gb+KS15ZtjIkhiiyBMLquNoPUdqJrErTZvBf1H9sruKKVYeFnNHfIUue/xQIiPJRSltcKIu3zf4kjHscZIN9ff+Cm/eJPtc6+ZtTRJ/RWCFniy3Szfs7lyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790214754; c=relaxed/simple;
	bh=z+bTycMow7VmGbkMGtwYHDwG1v1GhonRhqgvsTWop/g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ig6tEdr7YUZphU16S1X59WEJYzpMkrNC7x79/pGJx2Pek3SE+KD63yFLXMislHP1IxPoLHa5UmXqOeCY5FZd5XkBHHvTKWi8G9iBnh+uWq+j2HjOz6HFBSpaYkIF9bwW2Vn4xJMrdcQ0RCMQM2cVUIPLfb9mh9keKWncpzeYYi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n2RRJDnQ; arc=none smtp.client-ip=74.125.231.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n2RRJDnQ"
Received: by mail-oa2-f35.google.com with SMTP id 586e51a60fabf-486e0f56cddso825210fac.3
        for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 18:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790214751; x=1790819551; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZNI7syD9I4Vz5XcvsfnyP81ma4EmY9tQacNXKGJFHmM=;
        b=n2RRJDnQkQ1LV1w6GmEvbACbj+cfRnxHa3Dmzo0a1a2qWkdRV+faueumErfN5qw+Ey
         JFBa6c3o2iTaCGY5l3i9Th7IbnZcw6UJf9HGrysWuP5ZzuVKnfIW5M7VIsfS5UnvndOS
         YxsO7oqgiLVaFADRFxkbc471ncrio2rmFBQYeAkVxAO04TcyPBYeKiiIg4mLYExnCcAo
         DSZZgJOGzau7HjQSSOqI0FNfhnUsCuD8yEjMzOco8fdbOyq3B2m9QeLA8CqqbQH6LX0+
         7plXy17bLyqt6RDCE7JSGlnemHvZh9+MZbEa/T9dln62EPUp3BeqIuXP1UaHgQB1L0A7
         haig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790214751; x=1790819551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZNI7syD9I4Vz5XcvsfnyP81ma4EmY9tQacNXKGJFHmM=;
        b=pW0vkBUQVU/vugwic9iOhnAFAPrjX8m7dDLEmGnn3x8jN9zOdfgHHf3CmKtOsjaJdI
         kq86/taCGsBppiQx/goF+RFFLikvj6dPDBUsQXatywh+CExhqIknvX/QUwi04veebCcc
         MRR7Yh1jPA9YLKY+fdnH2KxRmbdyFVvmBZ+w8ueg+s6P1+gl18uDUYcT3gVONoITPHe/
         v0FmvX0bWgwSXoYKrDx3SuEN0YccusSrXvJAmNg8H0rT5tOXI4t3ZP5ZB6r1JM0Wbd49
         Yce4EsDwMAOB76TqErbOgKV9iiiFcDQNeqTBRkGwAa0YG6baIxtrYvGz3+7s0E5uG9Yw
         VFnQ==
X-Forwarded-Encrypted: i=1; AKwUvBy6EuoCTn7TYffmpIHh7hdwqSrZXikU/4V3kz6rATD4BYIOryJhBwre1bFGpWtJZE44bNoW/EbUMDvEAeT+evs=@vger.kernel.org
X-Gm-Message-State: AFuF++nRNXPB7mL1hy/SXG2eq26afsn2D+QoKLGLnV1CpSqrKXjkIhvn
	M3zc5P2oTA4+jkuU8rQSKki4JAd7phgCrX9RUbU8I/aAA1/9y8YCEl/+
X-Gm-Gg: AYBFou19z3lVoLw9/7lyjny+WE8k/99D7+EEMWfIJbE2iFb94d34hu9Hi9xoUhRNuJU
	gGgCmnAk1CuFip1lHqrwCSiM5axy7PV0w3RnJiL0czNszofginGOF5u47Qr7py48As6nR2tEuBR
	Lf9YX50Igx0zWkam5r7xZJ7b9eKi/oiGJ5Puk2hEYgAHDO/Pa1UKRtgftALbqYUkgDO8VPgubnx
	Fs6ZQB3bG1dEjRfcqw3QU5RGR/c3XeNtGVy/Hl/wwzemeWJTkqFTM+7HB92Jy9m0oZqplUnWgsI
	2ZcEZwyQbtJ5R/ciPSFoaKRbRDA7ypPUMU1CnNMW4R6c9udncAJ7c7nJ22PiEl8cSb+k2h+fq5/
	6N+o1HChhLbZ/t/5RbtlCufC1MjNe0XSfNqNxpv5SdHafX1lK3q+deE16xU4Uw5ZTFGH0oagSGJ
	1FVyDsxeaYekTZquh1qWWJ3tfnGw5Wv9CscJTFITtEuJbnuQuwFC6uLh0eNmDqiBNET2sZUBGGu
	RCt5iKOOfGyQoXaZ0TB/cPO8WHf2M2OGgVRo80i
X-Received: by 2002:a05:6870:45a8:b0:47b:e948:4d6f with SMTP id 586e51a60fabf-491e58d0f81mr1125353fac.17.1790214751519;
        Wed, 23 Sep 2026 18:52:31 -0700 (PDT)
Received: from archlinux.lan ([136.34.156.120])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-491ed1ebc62sm1057379fac.3.2026.09.23.18.52.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 18:52:31 -0700 (PDT)
From: Danish Khateeb <danishkhateeb03@gmail.com>
To: Willy Tarreau <w@1wt.eu>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Shuah Khan <shuah@kernel.org>,
	Sven Schnelle <svens@linux.ibm.com>,
	Benjamin Berg <benjamin.berg@intel.com>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danish Khateeb <danishkhateeb03@gmail.com>
Subject: [PATCH 3/3] selftests/nolibc: test the FD_* macros and select() on a high fd
Date: Wed, 23 Sep 2026 20:52:22 -0500
Message-ID: <20260924015222.31693-4-danishkhateeb03@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260924015222.31693-1-danishkhateeb03@gmail.com>
References: <20260924015222.31693-1-danishkhateeb03@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The only select() test that passes an fd_set uses fd 1, so nothing
noticed that the FD_* macros used the wrong bits for fds 31-63 of each
word on 64-bit architectures.

Add a test that FD_SET() and FD_CLR() change exactly one fd, for every
fd below FD_SETSIZE, and one that select() reports a readable pipe
duplicated to fd 40, which also checks that the macros agree with the
kernel on the layout of the set.

Assisted-by: LLM
Signed-off-by: Danish Khateeb <danishkhateeb03@gmail.com>
---
 tools/testing/selftests/nolibc/nolibc-test.c | 54 ++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/tools/testing/selftests/nolibc/nolibc-test.c b/tools/testing/selftests/nolibc/nolibc-test.c
index f62183a46205..d9a8bfd4b21b 100644
--- a/tools/testing/selftests/nolibc/nolibc-test.c
+++ b/tools/testing/selftests/nolibc/nolibc-test.c
@@ -1369,6 +1369,58 @@ int test_pipe(void)
 	return !!memcmp(buf, msg, len);
 }
 
+int test_fd_set(void)
+{
+	fd_set fds;
+	int fd, i;
+
+	for (fd = 0; fd < FD_SETSIZE; fd++) {
+		/* FD_SET() must set this fd and no other */
+		FD_ZERO(&fds);
+		FD_SET(fd, &fds);
+		for (i = 0; i < FD_SETSIZE; i++)
+			if (!!FD_ISSET(i, &fds) != (i == fd))
+				return 1;
+
+		/* FD_CLR() must clear this fd and no other */
+		for (i = 0; i < FD_SETSIZE; i++)
+			FD_SET(i, &fds);
+		FD_CLR(fd, &fds);
+		for (i = 0; i < FD_SETSIZE; i++)
+			if (!!FD_ISSET(i, &fds) != (i != fd))
+				return 1;
+	}
+
+	return 0;
+}
+
+int test_select_high_fd(void)
+{
+	struct timeval tv = { 0 };
+	int pipefd[2], fd, ret = 1;
+	fd_set fds;
+
+	if (pipe(pipefd) == -1)
+		return 1;
+
+	/* fd 40 is in the upper half of a 64-bit fd_set word */
+	fd = dup2(pipefd[0], 40);
+	if (fd == -1)
+		goto out;
+
+	write(pipefd[1], "x", 1);
+	FD_ZERO(&fds);
+	FD_SET(fd, &fds);
+	if (select(fd + 1, &fds, NULL, NULL, &tv) == 1 && FD_ISSET(fd, &fds))
+		ret = 0;
+
+	close(fd);
+out:
+	close(pipefd[0]);
+	close(pipefd[1]);
+	return ret;
+}
+
 int test_rlimit(void)
 {
 	struct rlimit rlim = {
@@ -1711,6 +1763,7 @@ int run_syscall(int min, int max)
 		CASE_TEST(execve_root);       EXPECT_SYSER(1, execve("/", (char*[]){ [0] = (char []){"/"}, [1] = NULL }, NULL), -1, EACCES); break;
 		CASE_TEST(fchdir_stdin);      EXPECT_SYSER(1, fchdir(STDIN_FILENO), -1, ENOTDIR); break;
 		CASE_TEST(fchdir_badfd);      EXPECT_SYSER(1, fchdir(-1), -1, EBADF); break;
+		CASE_TEST(fd_set);            EXPECT_ZR(1, test_fd_set()); break;
 		CASE_TEST(fdopendir_notdir);  EXPECT_SYSER(1, (uintptr_t)fdopendir(STDIN_FILENO), (uintptr_t)NULL, ENOTDIR); break;
 		CASE_TEST(file_stream);       EXPECT_SYSZR(1, test_file_stream()); break;
 		CASE_TEST(file_stream_wsr);   EXPECT_SYSZR(1, test_file_stream_wsr()); break;
@@ -1753,6 +1806,7 @@ int run_syscall(int min, int max)
 		CASE_TEST(select_null);       EXPECT_SYSZR(1, ({ struct timeval tv = { 0 }; select(0, NULL, NULL, NULL, &tv); })); break;
 		CASE_TEST(select_stdout);     EXPECT_SYSNE(1, ({ fd_set fds; FD_ZERO(&fds); FD_SET(1, &fds); select(2, NULL, &fds, NULL, NULL); }), -1); break;
 		CASE_TEST(select_fault);      EXPECT_SYSER(1, select(1, (void *)1, NULL, NULL, 0), -1, EFAULT); break;
+		CASE_TEST(select_high_fd);    EXPECT_SYSZR(1, test_select_high_fd()); break;
 		CASE_TEST(sendfile);          EXPECT_SYSZR(1, test_sendfile()); break;
 		CASE_TEST(stat_blah);         EXPECT_SYSER(1, stat("/proc/self/blah", &stat_buf), -1, ENOENT); break;
 		CASE_TEST(stat_fault);        EXPECT_SYSER(1, stat(NULL, &stat_buf), -1, EFAULT); break;
-- 
2.55.0

