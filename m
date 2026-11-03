Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793721316;
	b=Mnh5S3cMiga1ezDADU7DETEjzy61brmNNBTWPLJxYaTrnQZT2TNKVmK9mWyCGhSr7i99
	 oTsPyStshfildMmBcQfUoNYfbLPNU4VyfXzaJYoh7T46qq2vwSf6woK0DuNFZyRTMz/AB
	 wyqk1XP9shl9VaS4RVd4T30zdyciffjxYtWzTYDgMn1I34fXuQIkkjHlxRCRZItxr1IOf
	 m/8ObYzoWe8DP6YvoaRhojN8gvg4hC2MOrLy1ud0yFuqWO6fShcuL2m+mhnBANYX9tvJl
	 dNOWXiZZN18FA4epUAQMR/yYuxJE77oEH6j61+FJJsnFbp863LJpPuDXR5EluQ6Lxtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793721316;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qeNLbpSQYWeLzu/9GgYKukuneWHtvUD45tJUmCL2fts=;
	b=albZEJ3QnfcfHdiudByJGrIvcG+kx78Hh/vK59O2TAkiZqf8GGJX7reRcyxCNTOZMsLY
	 ABGYCFf3GfqCF5vLe8bDLNbbczvQZLLKZQxkL2TiU03SwfGtUJ6A8krDtPUKJk2b1GToK
	 S2y8Z814IbuZugUurXyApyj1PWfyweP3YNjZSEEejAFHvimGmZVaiLIf1elHhwyXpeV8o
	 hXEZjG5BD03POX1a71zytL3s7g0AtekzVT5QNMJM1TgMHlNKIDurJXamRWd+1JDVXhR9d
	 sZB+PX9Wln4ESnKfwVvf76DfiVOlgBVHqDgEY84K/IemUT20nPTJMKSn9P8pb5+fHKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KOCil7qn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5F5606D825;
	Tue,  3 Nov 2026 15:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KOCil7qn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E1931F00A02;
	Tue,  3 Nov 2026 15:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793721316;
	bh=qeNLbpSQYWeLzu/9GgYKukuneWHtvUD45tJUmCL2fts=;
	h=From:To:Cc:Subject:Date;
	b=KOCil7qnJ7iH8OXOC7YbkX6YWpVpJt4vBJNx3+pVJhiPkuzPGNJ2TT8DwYVNClmKd
	 t8+iMBaT4yd5oUUfaYiCeB3hR7XEztxJBgwaScdQUSRZ0/VmzNJXxK+fGcp9ynT/vn
	 bwcXp26H5GOpe7Q+/+SkKnv+CKzvkG9/aWwLFqCVAQTW5k2GwyTY1GSj+tDbFGnigs
	 NNMNdJzAHdc9gHuJ2bqJ8lGDfry/QBoxx9qE4EVQgNVCAtHy0Cp97OVY32rfM6kyeu
	 4QoleFLc6K9CLsP/1wHua0LbeA/hl7i1LCqIPG7MRRs6rOUPXiZsR0xTaV79qVkBZq
	 b7xBRr6+T3cXQ==
From: Sasha Levin <sashal@kernel.org>
To: Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] selftests: vDSO: print tv_sec as long long in vdso_test_getrandom
Date: Tue,  3 Nov 2026 10:55:14 -0500
Message-ID: <20261103155514.535166-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 32-bit architectures with a 64-bit time_t, such as armhf in Debian
13, tv_sec is a long long, and printing it with %lu warns:

  vdso_test_getrandom.c:184:40: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type '__time64_t' {aka 'long long int'} [-Wformat=]

Cast it to long long and print it with %lld. While at it, print tv_nsec,
a long, with %ld instead of %lu, and cast it to long, as it is a long
long on x32.

Signed-off-by: Sasha Levin <sashal@kernel.org>
---
Found with a 32-bit build of the selftests with a 64-bit time_t (gcc 16
and clang 21 with -m32 -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64);
KernelCI's 32-bit arm builds show the same warnings. The changed files
build without format warnings there now, and the x86_64 builds don't
change. The other selftests get the same kind of fix in separate
patches.

 .../selftests/vDSO/vdso_test_getrandom.c       | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/vDSO/vdso_test_getrandom.c b/tools/testing/selftests/vDSO/vdso_test_getrandom.c
index ef402001e8988..504b84d4cc53e 100644
--- a/tools/testing/selftests/vDSO/vdso_test_getrandom.c
+++ b/tools/testing/selftests/vDSO/vdso_test_getrandom.c
@@ -181,19 +181,22 @@ static void bench_single(void)
 	test_vdso_getrandom(NULL);
 	clock_gettime(CLOCK_MONOTONIC, &end);
 	timespecsub(&end, &start, &diff);
-	printf("   vdso: %u times in %lu.%09lu seconds\n", TRIALS, diff.tv_sec, diff.tv_nsec);
+	printf("   vdso: %u times in %lld.%09ld seconds\n", TRIALS,
+	       (long long)diff.tv_sec, (long)diff.tv_nsec);
 
 	clock_gettime(CLOCK_MONOTONIC, &start);
 	test_libc_getrandom(NULL);
 	clock_gettime(CLOCK_MONOTONIC, &end);
 	timespecsub(&end, &start, &diff);
-	printf("   libc: %u times in %lu.%09lu seconds\n", TRIALS, diff.tv_sec, diff.tv_nsec);
+	printf("   libc: %u times in %lld.%09ld seconds\n", TRIALS,
+	       (long long)diff.tv_sec, (long)diff.tv_nsec);
 
 	clock_gettime(CLOCK_MONOTONIC, &start);
 	test_syscall_getrandom(NULL);
 	clock_gettime(CLOCK_MONOTONIC, &end);
 	timespecsub(&end, &start, &diff);
-	printf("syscall: %u times in %lu.%09lu seconds\n", TRIALS, diff.tv_sec, diff.tv_nsec);
+	printf("syscall: %u times in %lld.%09ld seconds\n", TRIALS,
+	       (long long)diff.tv_sec, (long)diff.tv_nsec);
 }
 
 static void bench_multi(void)
@@ -208,7 +211,8 @@ static void bench_multi(void)
 		pthread_join(threads[i], NULL);
 	clock_gettime(CLOCK_MONOTONIC, &end);
 	timespecsub(&end, &start, &diff);
-	printf("   vdso: %u x %u times in %lu.%09lu seconds\n", TRIALS, THREADS, diff.tv_sec, diff.tv_nsec);
+	printf("   vdso: %u x %u times in %lld.%09ld seconds\n", TRIALS, THREADS,
+	       (long long)diff.tv_sec, (long)diff.tv_nsec);
 
 	clock_gettime(CLOCK_MONOTONIC, &start);
 	for (size_t i = 0; i < THREADS; ++i)
@@ -217,7 +221,8 @@ static void bench_multi(void)
 		pthread_join(threads[i], NULL);
 	clock_gettime(CLOCK_MONOTONIC, &end);
 	timespecsub(&end, &start, &diff);
-	printf("   libc: %u x %u times in %lu.%09lu seconds\n", TRIALS, THREADS, diff.tv_sec, diff.tv_nsec);
+	printf("   libc: %u x %u times in %lld.%09ld seconds\n", TRIALS, THREADS,
+	       (long long)diff.tv_sec, (long)diff.tv_nsec);
 
 	clock_gettime(CLOCK_MONOTONIC, &start);
 	for (size_t i = 0; i < THREADS; ++i)
@@ -226,7 +231,8 @@ static void bench_multi(void)
 		pthread_join(threads[i], NULL);
 	clock_gettime(CLOCK_MONOTONIC, &end);
 	timespecsub(&end, &start, &diff);
-	printf("   syscall: %u x %u times in %lu.%09lu seconds\n", TRIALS, THREADS, diff.tv_sec, diff.tv_nsec);
+	printf("   syscall: %u x %u times in %lld.%09ld seconds\n", TRIALS, THREADS,
+	       (long long)diff.tv_sec, (long)diff.tv_nsec);
 }
 
 static void fill(void)
-- 
2.53.0

