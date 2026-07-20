Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC7544BC90
	for <linux-kselftest@vger.kernel.org>; Mon, 20 Jul 2026 17:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784570071; cv=none; b=g+hm0eTsheuyHSPFtjoGpaBv3P/Oo47+U38ydDuWJQZcC0icWvKYb0gMS+mK5ZxKRR2WoB7rgf4Ml4gBrQVCQyav/WDYul5xmtmwhleFz8SM83KyG/eUmdwUFgMQOYZwMXLxUy4KjaafQdBsrHLhsDtpbLc896XIJcS5O9gAgn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784570071; c=relaxed/simple;
	bh=YPrW1TXrbX+u0gKgK8sf9Rj21grSgx0mklEsAxueIjU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ORy2RpzarbuNSbU395JpFerCYN2ILbYgVBUzF3wgQyNwouX/Ko4p3isTIh/QO2Z+8pfUsSnMTXzEdOyfgv5vP3YseIuvk9FmwIC7xPo9iqNkiIdAl6nM241z6wsfhhppILTGZTR5Nls9SCa96K9p9wYSG1xXXJoPVbxmd1xUHYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ksr75Z6L; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ksr75Z6L"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-382ef647e20so9888759a91.1
        for <linux-kselftest@vger.kernel.org>; Mon, 20 Jul 2026 10:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784570062; x=1785174862; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iyEs7k1vrNWNt95uYWZYqppv3Skiym40EV0k7tALo6w=;
        b=ksr75Z6L6BMa/cCk38UpzCJ2R1JQx+pg5cP3BRL2GjDk+pcginU3hwhuIznpTKpp7u
         Tf7jA0PHkaUy9J6kg9uD9/KMOybSJBUsnSZC9+w9XH77azve59Zdo0pVALDdfWP0rQzO
         IX9U6KMuogQYJ2r07VUdDE0KEq+fn5Ag1jlBYIJHij0jH8hLoxEpvKX3vxMHG3zg+THq
         15CNRHVF6A9hMUQXeOz0N1cyyI7tFm7CYKBxcsxnAUh6+VC02GabY+6kFmEU7VrMS7wM
         6kaQMpPWYOwSyoLqH6QSQHlWlVrHe7epcWPk+iA7qpuwS1LBrJdBn0KlcLskc2PKs1hm
         zUDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784570062; x=1785174862;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iyEs7k1vrNWNt95uYWZYqppv3Skiym40EV0k7tALo6w=;
        b=IK81xqJW4Kohy5bSpsFqXZNzZP3vr4/oLdFaDhVmEHSigaNr1tBMgeu9AvhSrN/eEl
         7wxpNn2JmfoWpfjpcJnz/zzZ27rTT2iKIzhwwlEo3t0s8iP7L3dtCFvCbLSjGIPV/Yic
         MurRL6pBod5Gl6Hivvdb+CKPVK1GyoBxfUeRL6W7ONKnGKBRbWbVmPNhYOXH6D+z85ld
         H7TRvHZT/qlAmnZyWlcnM0gamlXhWGiZRqOeOCHrkjW5T16KjvV054wX/97AcZyyBOu8
         PcCFDjX0BiBe7VuF0PNXeN1x5GlxTRKs9EP8eoH5NyxPYSpMCz+mBCWVQy7MMNMZj41b
         FsIQ==
X-Forwarded-Encrypted: i=1; AHgh+RrZYBChs+mf3R5nuO7/tLclr7jbQ2WB2y02LJLfMUXznT+OqtLK3IG9nr0siNE1/Syf/Xnxdr+ZBJtg+gZ0bts=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgNt83v+qya5tVnOg6b1GfXbTdiNC/bPAynCY9USDFJhQgv089
	a0vDgUMlot5FO27UFGFJcl6Xksvc2/t4XsNTODk6q7na885xS16r6/Vd
X-Gm-Gg: AR+sD11zXnczKide/MnqO4YXit0Rs8DO9DuFJ+5PrG4J8Q64nZULfxjewRxT8u4YBxp
	KF5/9tDywFpx7+pUNdc0R4K70NO/1krzhyJ9CWt/5VcQ8XKtioiv+2GSpDmEukDtn57SGQp6j36
	jnextXbk+OTvbHSnpkEnV1ZHoxjPV1a7QBTqrBLnGOXg/qJk4x68kh5bmetoJ5YUeefwrS9UePT
	wX+rwzUvL5OQ/WxA92iByE6toYCkAE8cHqcajcfSW8rCBEZ7cvbQuNXm7V4547jGdUZ6fTdKzb0
	5wMfpO2tocl8R1z5ueHZfLGeWsn2v6gOUYXqUIo90NIrdNgXC19JG0DZZ53dIzM/jueLqZN+XhD
	b7jH0xsb/nh/Vjokb69SV/YOj/W5dB+7Z9STQJF/LmF2BJLtn63kwTiZe0jNUpH7Y5isXPoNv
X-Received: by 2002:a17:90b:1b43:b0:38d:eb10:6f01 with SMTP id 98e67ed59e1d1-38e4b422875mr15703816a91.4.1784570061412;
        Mon, 20 Jul 2026 10:54:21 -0700 (PDT)
Received: from unix.. ([181.229.23.179])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2de31a7sm33370583c88.15.2026.07.20.10.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 10:54:20 -0700 (PDT)
From: =?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
To: Elizabeth Figura <zfigura@codeweavers.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>,
	Maoyi Xie <maoyixie.tju@gmail.com>
Subject: [PATCH 2/2] selftests: ntsync: test absolute MONOTONIC waits under time namespaces
Date: Mon, 20 Jul 2026 14:54:02 -0300
Message-ID: <20260720175402.44338-3-ivanrwcm25@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720175402.44338-1-ivanrwcm25@gmail.com>
References: <20260720175402.44338-1-ivanrwcm25@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Cover the timens conversion in ntsync_schedule(): with a negative
CLOCK_MONOTONIC offset, a 100 ms absolute wait must not return
immediately against the host clock.

Suggested-by: Maoyi Xie <maoyixie.tju@gmail.com>
Signed-off-by: Iván Ezequiel Rodriguez <ivanrwcm25@gmail.com>
---
 .../testing/selftests/drivers/ntsync/ntsync.c | 87 +++++++++++++++++++
 1 file changed, 87 insertions(+)

diff --git a/tools/testing/selftests/drivers/ntsync/ntsync.c b/tools/testing/selftests/drivers/ntsync/ntsync.c
index e6a37214aa46..ce000ff41535 100644
--- a/tools/testing/selftests/drivers/ntsync/ntsync.c
+++ b/tools/testing/selftests/drivers/ntsync/ntsync.c
@@ -8,12 +8,18 @@
 #define _GNU_SOURCE
 #include <sys/ioctl.h>
 #include <sys/stat.h>
+#include <sys/wait.h>
 #include <fcntl.h>
+#include <sched.h>
 #include <time.h>
 #include <pthread.h>
 #include <linux/ntsync.h>
 #include "kselftest_harness.h"
 
+#ifndef CLONE_NEWTIME
+#define CLONE_NEWTIME 0x00000080
+#endif
+
 static int read_sem_state(int sem, __u32 *count, __u32 *max)
 {
 	struct ntsync_sem_args args;
@@ -1340,4 +1346,85 @@ TEST(stress_wait)
 	close(stress_device);
 }
 
+/*
+ * Absolute MONOTONIC timeouts must honour the caller's time namespace.
+ * With a negative monotonic offset, a 100 ms wait must still take ~100 ms
+ * of namespace time (not return immediately against the host clock).
+ */
+TEST(wait_any_monotonic_timens)
+{
+	struct ntsync_sem_args sem_args = {0};
+	struct ntsync_wait_args wait_args = {0};
+	struct timespec start, end;
+	char buf[64];
+	__u64 elapsed_ns;
+	int fd, offset_fd, sem, ret, status, len;
+	pid_t pid;
+
+	if (access("/proc/self/ns/time", F_OK))
+		SKIP(return, "Time namespaces are not supported");
+
+	fd = open("/dev/ntsync", O_CLOEXEC | O_RDONLY);
+	if (fd < 0)
+		SKIP(return, "/dev/ntsync is not available");
+
+	ret = unshare(CLONE_NEWTIME);
+	if (ret) {
+		close(fd);
+		if (errno == EPERM)
+			SKIP(return, "need CAP_SYS_ADMIN for CLONE_NEWTIME");
+		ASSERT_EQ(0, ret);
+	}
+
+	len = snprintf(buf, sizeof(buf), "%d %d 0", CLOCK_MONOTONIC, -10);
+	offset_fd = open("/proc/self/timens_offsets", O_WRONLY);
+	ASSERT_LE(0, offset_fd);
+	ASSERT_EQ(len, write(offset_fd, buf, len));
+	close(offset_fd);
+
+	pid = fork();
+	ASSERT_LE(0, pid);
+	if (!pid) {
+		int obj;
+
+		sem_args.count = 0;
+		sem_args.max = 1;
+		sem = ioctl(fd, NTSYNC_IOC_CREATE_SEM, &sem_args);
+		if (sem < 0)
+			_exit(1);
+
+		obj = sem;
+		wait_args.timeout = get_abs_timeout(100);
+		wait_args.objs = (uintptr_t)&obj;
+		wait_args.count = 1;
+		wait_args.owner = 123;
+		wait_args.index = 0xdeadbeef;
+
+		if (clock_gettime(CLOCK_MONOTONIC, &start))
+			_exit(2);
+		ret = ioctl(fd, NTSYNC_IOC_WAIT_ANY, &wait_args);
+		if (clock_gettime(CLOCK_MONOTONIC, &end))
+			_exit(2);
+
+		if (ret != -1 || errno != ETIMEDOUT)
+			_exit(3);
+
+		elapsed_ns = (end.tv_sec - start.tv_sec) * 1000000000ULL +
+			     (end.tv_nsec - start.tv_nsec);
+		/* Without timens conversion this returns in ~0 ms. */
+		if (elapsed_ns < 50 * 1000000ULL)
+			_exit(4);
+		if (elapsed_ns > 1000 * 1000000ULL)
+			_exit(5);
+
+		_exit(0);
+	}
+
+	ASSERT_EQ(pid, waitpid(pid, &status, 0));
+	EXPECT_TRUE(WIFEXITED(status));
+	EXPECT_EQ(0, WEXITSTATUS(status));
+
+	close(fd);
+}
+
 TEST_HARNESS_MAIN
-- 
2.43.0

