Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8724A3ECBFC;
	Fri, 27 Feb 2026 06:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772174767; cv=none; b=tQgzJeh96eep+kH+4k6u3gc0Z/f/lAu8Vj9dIXBaOYmn97ApsKw4GozHe244Lz5S5ChfKY6Ju08MFSSxtP8NBQr9c/UM6GbsILONxVn3l/LYVhRQQdZeTDuxTgup/OTV6VNiuRxBWH4XWYOMc7YLaUoqWxBD2KUDYTw9kmGkhbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772174767; c=relaxed/simple;
	bh=KtqNHU7wD2sCSz2s5rhDGX2wVCKqF45UIkAV4kmR3uU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q5/oP7/Mag8GIptUODcUaK+S2ULhGfli0S66XXP4eIwmWgS7AWZi0vBS7sXcDMlhhAx/OKJH79A81upSwJlYZK1gOF4j77RonFHMsNIiA9EtsRkhfQ+3I2+ThjyniOkmF2GcpUtpsOKURknqIkCY6dAvlOwUXhjR+1sMj3Lh1KI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Aq8EILhF; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=sVs+85LA; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Aq8EILhF";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="sVs+85LA"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772174765;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AgcdgWu3vCBzJsk721i7VUjvuKqv4KR1jMoeYjmaNvs=;
	b=Aq8EILhFdM3J9k8ADO+afGyPBF1wjJD7IqTzQlihB9hnCk3GBW5YUrjnLdRJGGu2fKGZ43
	PzrDs87hlXCho8d1aw65DL7LFlsjWsbEQ5M14vmk7omUmM7t8y6Y3fzd0kQtx0mIiQPXth
	BKLmTCQlDOpKVECqo0h/RZv0fnJ5Gpzwz2lsNqfhWBkpuN/alYPLTkVA9WUcXVcGdS5+cS
	Jd7hrANKF6oiIZ8FwVzIodKGFMy/Gn1C/m+PGyl3ublS9EsfW25r2Ryjll90vHF0h5AV38
	3JnjBXqN1omIWax4Z+z1H3AMJfuIL36+a2eo80EKBgZeCo0F/9P/0cXyxVnQCQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772174765;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AgcdgWu3vCBzJsk721i7VUjvuKqv4KR1jMoeYjmaNvs=;
	b=sVs+85LAAew06XzQXOW+KptBwGiqmutT2Tnu5wdwFwMuCrsx09+C3ZTbUbQSPaLK2jbuAQ
	2hikdMFss6uKpcDA==
Date: Fri, 27 Feb 2026 07:46:01 +0100
Subject: [PATCH v2 6/6] selftests: vDSO: vdso_test_correctness: Add a test
 for time()
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260227-vdso-selftest-cleanups-v2-6-d84830fa8beb@linutronix.de>
References: <20260227-vdso-selftest-cleanups-v2-0-d84830fa8beb@linutronix.de>
In-Reply-To: <20260227-vdso-selftest-cleanups-v2-0-d84830fa8beb@linutronix.de>
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772174759; l=3063;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=KtqNHU7wD2sCSz2s5rhDGX2wVCKqF45UIkAV4kmR3uU=;
 b=mAFHHHbTqAKnXNAgVz2DREFwql80U7nglbGMLG0JLZqv7T/0WFaQMhW5J6OX/fD+NTdS/n6ME
 9B113971goRBmUTY4bDCv8dZ+lKrZmZxQ3H5ffFiL1lDLPL+yA+qZvr
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

Extend the test to also cover the time() function.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 .../testing/selftests/vDSO/vdso_test_correctness.c | 66 ++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/tools/testing/selftests/vDSO/vdso_test_correctness.c b/tools/testing/selftests/vDSO/vdso_test_correctness.c
index a94ab4d597b1..5c5a07dd1128 100644
--- a/tools/testing/selftests/vDSO/vdso_test_correctness.c
+++ b/tools/testing/selftests/vDSO/vdso_test_correctness.c
@@ -55,6 +55,10 @@ typedef long (*vgtod_t)(struct timeval *tv, struct timezone *tz);
 
 vgtod_t vdso_gettimeofday;
 
+typedef time_t (*vtime_t)(__kernel_time_t *tloc);
+
+vtime_t vdso_time;
+
 typedef long (*getcpu_t)(unsigned *, unsigned *, void *);
 
 getcpu_t vgetcpu;
@@ -133,6 +137,10 @@ static void fill_function_pointers(void)
 	if (!vdso_gettimeofday)
 		printf("Warning: failed to find gettimeofday in vDSO\n");
 
+	vdso_time = (vtime_t)vdso_sym(version, name[2]);
+	if (!vdso_time)
+		printf("Warning: failed to find time in vDSO\n");
+
 }
 
 static long sys_getcpu(unsigned * cpu, unsigned * node,
@@ -156,6 +164,16 @@ static inline int sys_gettimeofday(struct timeval *tv, struct timezone *tz)
 	return syscall(__NR_gettimeofday, tv, tz);
 }
 
+static inline __kernel_old_time_t sys_time(__kernel_old_time_t *tloc)
+{
+#ifdef __NR_time
+	return syscall(__NR_time, tloc);
+#else
+	errno = ENOSYS;
+	return -1;
+#endif
+}
+
 static void test_getcpu(void)
 {
 	printf("[RUN]\tTesting getcpu...\n");
@@ -422,6 +440,53 @@ static void test_gettimeofday(void)
 	VDSO_CALL(vdso_gettimeofday, 2, &vdso, NULL);
 }
 
+static void test_time(void)
+{
+	__kernel_old_time_t start, end, vdso_ret, vdso_param;
+
+	if (!vdso_time)
+		return;
+
+	printf("[RUN]\tTesting time...\n");
+
+	if (sys_time(&start) < 0) {
+		if (errno == -ENOSYS) {
+			printf("[SKIP]\tNo time() support\n");
+		} else {
+			printf("[FAIL]\tsys_time failed (%d)\n", errno);
+			nerrs++;
+		}
+		return;
+	}
+
+	vdso_ret = VDSO_CALL(vdso_time, 1, &vdso_param);
+	end = sys_time(NULL);
+
+	if (vdso_ret < 0 || end < 0) {
+		printf("[FAIL]\tvDSO returned %d, syscall errno=%d\n",
+		       (int)vdso_ret, errno);
+		nerrs++;
+		return;
+	}
+
+	printf("\t%lld %lld %lld\n",
+	       (long long)start,
+	       (long long)vdso_ret,
+	       (long long)end);
+
+	if (vdso_ret != vdso_param) {
+		printf("[FAIL]\tinconsistent return values: %lld %lld\n",
+		       (long long)vdso_ret, (long long)vdso_param);
+		nerrs++;
+		return;
+	}
+
+	if (!(start <= vdso_ret) || !(vdso_ret <= end)) {
+		printf("[FAIL]\tTimes are out of sequence\n");
+		nerrs++;
+	}
+}
+
 int main(int argc, char **argv)
 {
 	version = versions[VDSO_VERSION];
@@ -432,6 +497,7 @@ int main(int argc, char **argv)
 	test_clock_gettime();
 	test_clock_gettime64();
 	test_gettimeofday();
+	test_time();
 
 	/*
 	 * Test getcpu() last so that, if something goes wrong setting affinity,

-- 
2.53.0

