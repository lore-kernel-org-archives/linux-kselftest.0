Received: from list.codeweavrs.com (list.codeweavers.com [4.36.192.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 744C536CDE8;
	Tue,  1 Sep 2026 21:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=4.36.192.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788299850; cv=none; b=lDnWZKqYGTmff36WiyIWjCiO0kxpWItFAG5g20DEY7J2OXmF+9Otq5qTEo6ggm3nMh+blGrFrqTMuZB3ummz7hMqXwJFldRuiep9koHylJ/il6hfIkRB2gJICPc0BM6odcsPNqK4qfi1j6JdR5HHv+cofzR0wiS/qTnyFB5S90Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788299850; c=relaxed/simple;
	bh=L5V/8EYLbsQScQk/LGobiujEWFyQmY2NkHwtlvEUn7g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fYiOeaSvyKHeaMjEVenebAuYHEH6jNREHY1eK5SKnRA6WisxfoNX3vIqCMULFtSgDGU7JqgQ99dAXa9Lvrlx4+It+7Hdx355ntqG1y7bDjh0HFFqJeyUtQCY/ndI3mkU9nvDot9FfG4kTQ5Rf2Fwx+3H6GdqrOG5BAzvIY/ZMJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codeweavers.com; spf=pass smtp.mailfrom=codeweavers.com; dkim=pass (2048-bit key) header.d=list.codeweavers.com header.i=@list.codeweavers.com header.b=DyYWhX+2; arc=none smtp.client-ip=4.36.192.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codeweavers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeweavers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=list.codeweavers.com header.i=@list.codeweavers.com header.b="DyYWhX+2"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=list.codeweavers.com; s=list; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=970rvjKhUbBRqZ+818aZ3SrCn1r/YQBBs6GGt00FMiw=; b=DyYWhX+29OwHwWOtLlswJqHA6u
	PyAtasmeXaX8S80+r7dYoxR+DrrYLklrKsmKhDbUWT3IuxJSdHHzJr+c+JPvprsvqKv4K3PYhmHKR
	HNRLmoFJTRotVwEqTbH+7KpivVwghG/+UNYcAazCdf/VzDAa8y+KBr1kdfrLg+KbY5UPzp3lkDKKm
	beaLPIkR9DJfCDLBKz3+R4HL9Ijp4uEuScqFdEvWnKgalOxWBRZkKcIfRBGacN+ormklte16DeMBS
	pueUyrNbrVt5SMfvhSyh+JWdI3d1Gnsy2SLHamUcaVCMiCRMKczTzr6U9GaSDHCatCOWIPhetktqT
	e4ltfI9g==;
Received: from cw137ip160.mn.codeweavers.com ([10.69.137.160] helo=camazotz.mn.codeweavers.com)
	by list.codeweavrs.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <zfigura@codeweavers.com>)
	id 1x1WEu-006tZ1-1x;
	Tue, 01 Sep 2026 16:41:56 -0500
From: Elizabeth Figura <zfigura@codeweavers.com>
To: Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org,
	wine-devel@list.winehq.org,
	linux-kselftest@vger.kernel.org,
	=?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>,
	Elizabeth Figura <zfigura@codeweavers.com>
Subject: [PATCH] selftests: ntsync: add wait termination edge cases
Date: Tue,  1 Sep 2026 16:41:33 -0500
Message-ID: <20260901214133.1270218-1-zfigura@codeweavers.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Iván Ezequiel Rodriguez <ivanrwcm25@gmail.com>

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
Reviewed-by: Elizabeth Figura <zfigura@codeweavers.com>
Signed-off-by: Elizabeth Figura <zfigura@codeweavers.com>
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

base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.53.0

