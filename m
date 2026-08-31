Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C554B486BBD
	for <linux-kselftest@vger.kernel.org>; Mon, 31 Aug 2026 14:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788185122; cv=none; b=VAtvNqb6NBhz8Ic1Q2ZvDFoPjc4E0vzPtD0A/4XjSrON5OxzdESnwwuS/0eqm8ipwpdbObMH51OuS3m+RkiwKAkSvcymRCoUOdvAy7x4CMoqD23wt/qpR9hDB2cWzFvKN1eyC1RNWPdDIM/oE9Va6JykzueDhFKa8BI+aQSs9fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788185122; c=relaxed/simple;
	bh=dMgH3SXQVDef4+TvHTl+j6bjZM2Hmn9mYCLR0gMCleA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZYvs/1BZ7OJgG1TvIopPjoGyqxeBdqRkue9BTAmYG3t73EVCxI9PqSsyFGjpB6Ki71VW+9iT7+pZhRi03OrwnmIlFCSQdOKwEToAR8+ribXXvgaRm8Ddltt1ff7Nahz53l2f17D05/7F1RFu10GQwt278HmztmLN8kyrTQJUFJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yds0rmmQ; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yds0rmmQ"
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-73720e58dafso1995474137.1
        for <linux-kselftest@vger.kernel.org>; Mon, 31 Aug 2026 07:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788185119; x=1788789919; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GSG1bwsrNLkgaczjFVkO4Fp9+89s6DMBG6R8XlunJWE=;
        b=Yds0rmmQ9DmcJYt68JwBC2XePECRWxVNiREj4etor9Fx5JPVgyIhpk32EMrOAXmhdq
         VnULMwQ4JBgq28iqsVCIF5iq7bmOjkVqEOkxkOz9LN6+YHPhB64NcqjUPiNTMa4iJBQh
         elXDQgrLZoK7MZEoe/tRuO8k5zP5i80Y+WzM7MXE1w7ElzvW1x2JrafF5mUOEIhey7ut
         IUQkWNDvl3K+/yq63bEBP9VOq+dN2285tNQnkWhlSTVWGCNOMmbULGhZCypvsRJ6ntre
         W2MU9OLBdb0t4ArqbczFdPBCVkQd24A8Y/pILGGOBoSBKi9c11ZV8DA+hqWm2PMW3+WT
         ZNwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788185119; x=1788789919;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GSG1bwsrNLkgaczjFVkO4Fp9+89s6DMBG6R8XlunJWE=;
        b=d9BTQRphICKpFZYMiRFbLtvO79sbp8+rIrmdBSbd9T5KtsBveLnadIJoILaqQSjqaB
         PrMQcXVz2EhooVhG2ZQoTzQon1/+cPuAG+ewqEgpEVYG8yAOqrhLVzZO8BjbKWuVClvY
         2wlWZSxUOkq+zZ5qZusy4X0yWE7/IaifLWJDm8N2j7dQlpRvg6Uq/UOyuMJwk43UfVBo
         Tz4L+LmaoqUozLukofuqimRLU/Adm5tJ1YV/5wA/bqbDWZuIFyHyIGL45kelPh4aLqyU
         NBPRNj8JrtSxu6NeMi1FlfZP6rAiS4XjPG+j88GAfixZ+yV75lnZwF6B7r5tplFcgyDL
         f22Q==
X-Gm-Message-State: AFuF++mhfa9mzEjAvT1jnk6XNOSDaVyQoJVdfOrqR8iQ/N7Ps1h2Y/Xi
	SdejJe9Q2Bv+1fXhdJAoVh4IW2YtDjPm3GfXOh0M2K0h0lz5eEk7AeLa
X-Gm-Gg: AR+sD11UObxyk76vByayYdoewIkHf8/nlO68fht/pPHoT8YokOCgOtC32iygHuL5uSZ
	czdp9WlyHLbQuAwjGkbAj0ps20aO4sSq+OPQbEYPWoBrtuMVkJXODIS9Ehz10GS+MErCrGTK9jH
	RJulSeUiEAXpixmnsiEMRae6g7eukU1DnyLca7FPtyaEpIhMFNu9eHdv7wVIsh3nPvKPpGLo2n0
	Qb8gnAi/iJjI6rnYkw9joC/zEIx9FMN/gWSDjhhXCY2Km9ku1xtZ2NuNCqlK7DELvZYKTSVU/J2
	sw8AQTK1TIjvil84z0Ql16GXZLRB/532ScC4Z/zQYMOWSezY+vdz8gPCPDB2a72pfVTL7EBU9fr
	XA+GEhXmhEXj8Jj+qp2UVD9QAvmsXJRZ00KOwm4S3imuzZ+ULwsIGY3LPMk6tR9mC+Q7BcZWUUA
	sndVO8sGzZto6HYF9OoewrzmQljZlidMz3thNhOD/+7kfJVOPWwucbJw==
X-Received: by 2002:a05:6102:41a3:b0:786:c223:ad84 with SMTP id ada2fe7eead31-786c223ae87mr6874119137.9.1788185118532;
        Mon, 31 Aug 2026 07:05:18 -0700 (PDT)
Received: from unix.. ([181.229.23.179])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-786b21c60fdsm5718410137.12.2026.08.31.07.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 07:05:17 -0700 (PDT)
From: =?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
To: Elizabeth Figura <zfigura@codeweavers.com>,
	Shuah Khan <shuah@kernel.org>
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
Subject: [PATCH] selftests: ntsync: add wait termination edge cases
Date: Mon, 31 Aug 2026 11:05:12 -0300
Message-ID: <20260831140512.136118-1-ivanrwcm25@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The existing tests cover timeouts that expire while blocked, but not a
deadline that has already passed, and no test exercises interruption by
a signal even though the documented behaviour is EINTR. Also extend
wait_args_validation() with an invalid flags case.

Add coverage for:
 - an absolute timeout in the past, which must return ETIMEDOUT without
   blocking
 - a wait interrupted by a signal, which must return EINTR
 - undefined bits in ntsync_wait_args::flags, which must return EINVAL

Tested on v7.3-rc1 under QEMU with CONFIG_NTSYNC=y: 15/15 pass, and the
two new tests were run 50 times each at 1, 2, 4 and 8 vCPUs with no
intermittent failures.

Signed-off-by: Iván Ezequiel Rodriguez <ivanrwcm25@gmail.com>
---
 .../testing/selftests/drivers/ntsync/ntsync.c | 96 +++++++++++++++++++
 1 file changed, 96 insertions(+)

diff --git a/tools/testing/selftests/drivers/ntsync/ntsync.c b/tools/testing/selftests/drivers/ntsync/ntsync.c
index 1f0dc43bb4c0..7d944e2a9094 100644
--- a/tools/testing/selftests/drivers/ntsync/ntsync.c
+++ b/tools/testing/selftests/drivers/ntsync/ntsync.c
@@ -11,6 +11,7 @@
 #include <sys/wait.h>
 #include <fcntl.h>
 #include <sched.h>
+#include <signal.h>
 #include <time.h>
 #include <pthread.h>
 #include <linux/ntsync.h>
@@ -1381,6 +1382,13 @@ TEST(wait_args_validation)
 	EXPECT_EQ(-1, ret);
 	EXPECT_EQ(EINVAL, errno);
 
+	wait_args.pad = 0;
+	wait_args.flags = ~NTSYNC_WAIT_REALTIME;
+	ret = ioctl(fd, NTSYNC_IOC_WAIT_ANY, &wait_args);
+	EXPECT_EQ(-1, ret);
+	EXPECT_EQ(EINVAL, errno);
+	wait_args.flags = 0;
+
 	ret = wait_any(fd2, 1, &sem, 123, &index);
 	EXPECT_EQ(-1, ret);
 	EXPECT_EQ(EINVAL, errno);
@@ -1471,4 +1479,92 @@ TEST(wait_any_monotonic_timens)
 	close(fd);
 }
 
+TEST(wait_timeout_expired)
+{
+	struct ntsync_wait_args wait_args = {0};
+	struct ntsync_sem_args sem_args = {0};
+	struct timespec start, end;
+	__u64 elapsed_ns;
+	int fd, sem, ret;
+
+	fd = open("/dev/ntsync", O_CLOEXEC | O_RDONLY);
+	ASSERT_LE(0, fd);
+
+	sem_args.count = 0;
+	sem_args.max = 1;
+	sem = ioctl(fd, NTSYNC_IOC_CREATE_SEM, &sem_args);
+	EXPECT_LE(0, sem);
+
+	wait_args.timeout = 0;
+	wait_args.objs = (uintptr_t)&sem;
+	wait_args.count = 1;
+	wait_args.owner = 123;
+	wait_args.index = 0xdeadbeef;
+
+	clock_gettime(CLOCK_MONOTONIC, &start);
+	ret = ioctl(fd, NTSYNC_IOC_WAIT_ANY, &wait_args);
+	clock_gettime(CLOCK_MONOTONIC, &end);
+	EXPECT_EQ(-1, ret);
+	EXPECT_EQ(ETIMEDOUT, errno);
+
+	elapsed_ns = (end.tv_sec - start.tv_sec) * 1000000000ULL +
+		     (end.tv_nsec - start.tv_nsec);
+	EXPECT_LT(elapsed_ns, 50 * 1000000ULL);
+
+	close(sem);
+	close(fd);
+}
+
+static void ntsync_test_signal_handler(int sig)
+{
+}
+
+TEST(wait_interrupted_by_signal)
+{
+	struct ntsync_wait_args wait_args = {0};
+	struct ntsync_sem_args sem_args = {0};
+	struct sigaction sa = {0}, old_sa;
+	struct wait_args thread_args;
+	int fd, sem, ret;
+	pthread_t thread;
+
+	fd = open("/dev/ntsync", O_CLOEXEC | O_RDONLY);
+	ASSERT_LE(0, fd);
+
+	sem_args.count = 0;
+	sem_args.max = 1;
+	sem = ioctl(fd, NTSYNC_IOC_CREATE_SEM, &sem_args);
+	EXPECT_LE(0, sem);
+
+	sa.sa_handler = ntsync_test_signal_handler;
+	ret = sigaction(SIGUSR1, &sa, &old_sa);
+	EXPECT_EQ(0, ret);
+
+	wait_args.timeout = get_abs_timeout(5000);
+	wait_args.objs = (uintptr_t)&sem;
+	wait_args.count = 1;
+	wait_args.owner = 123;
+	wait_args.index = 0xdeadbeef;
+	thread_args.fd = fd;
+	thread_args.args = &wait_args;
+	thread_args.request = NTSYNC_IOC_WAIT_ANY;
+	ret = pthread_create(&thread, NULL, wait_thread, &thread_args);
+	EXPECT_EQ(0, ret);
+
+	ret = wait_for_thread(thread, 50);
+	EXPECT_EQ(ETIMEDOUT, ret);
+
+	ret = pthread_kill(thread, SIGUSR1);
+	EXPECT_EQ(0, ret);
+
+	ret = wait_for_thread(thread, 1000);
+	EXPECT_EQ(0, ret);
+	EXPECT_EQ(-1, thread_args.ret);
+	EXPECT_EQ(EINTR, thread_args.err);
+
+	sigaction(SIGUSR1, &old_sa, NULL);
+	close(sem);
+	close(fd);
+}
+
 TEST_HARNESS_MAIN
-- 
2.43.0

