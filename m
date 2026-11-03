Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793721312;
	b=aF2N8xrsAwF23ZD1P64FM1QCUwAB1dT5McuiiYUUVCpoB4nhfaNezH/e2PvtAPZlWTh8
	 JQyHptZvAplWZ+mgBr1ssoDPEYKJHhFdwl2EvNgZR7PcaSM4NXxorzt0iYbne7PTnXV4d
	 A3porOyE+RujHOKDYuWMm+4cYc4Ctm8J4WrbXP0ulscG90Y+QKbsZ8MqsddQ5qp+yUqQK
	 xoiFmOwedzG2nNgrsO6UABbcuOdSkC6G3+0baCopSQU6gejrZnsRGwvEqmX42isTZ/zGk
	 oQ3WjRpAbZ0Eus+lacH8T2yeu/Xh8QVUTvcMuO5+l6xlXd3cx40F1ccYqfK58oXjAmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793721312;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/g3Z9XGPnKVMJobj2ihkWLzf/zdYtzMXoXMBf3jpwNU=;
	b=hX1quZYZG9q1cEmZ/t5NN9zIytNUXQwWQV9uOyYi2JqQZ1frURVQiOZi9FVBBtIqKFp8
	 rzYBVeGrB3FOkq1H1L724eqBBXJXHS7sIJqe6mbZXmjbJjeEcOHYRMNUzvsSpT4q+YTIZ
	 e+MEHU3tuXHAy6MKDXTjizv/dPqkxp10hcUWNnPHKq/PV4rNrG2yEmy05rJlhvW4/7aTR
	 odKYiSJvWNFueL/MlJ2uX9Wt82EegP81/A/ze8raCkiCOnuW5WJabWCEGeFoe7UgqVNb4
	 szaUuQpynzomhX9a7VtdV+CDXEDZJ2k4wDGN6BBRhGO03qLemjL4kcozGcIQJMn/pYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cniBgwPl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F45C6082BEC;
	Tue,  3 Nov 2026 15:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cniBgwPl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A101E1F00A21;
	Tue,  3 Nov 2026 15:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793721312;
	bh=/g3Z9XGPnKVMJobj2ihkWLzf/zdYtzMXoXMBf3jpwNU=;
	h=From:To:Cc:Subject:Date;
	b=cniBgwPlZoCzH+6lg0bPoi6FeCQT1nIWVHjuOtQnrq0WQPtbRqTfUVrvlMmWl3zTQ
	 VTi434OGrKq60TSbRTip+caY24VORevpAgsiG8uaXAK15OAbzRlTmY3rptLjGl2Wpn
	 +V/clTOP9wtQMrtetEgvmlmhers1sgMVtjqzNWXuvhej141bWU2gnrflchvHO7DdUB
	 2Vh6BEsyAL14QcSBs0gBXKehuyk1Mq0GYO3kBNmpwTCqXxj+aV5GyqfFDpshJrO0dr
	 9W+t4FL+P9L+DGGxg+7OBA8OU7CvMslcNMFAfRwloZLgxd6gdOfn5/nSTUcbRY1Dk5
	 DVacOu5HHaGQw==
From: Sasha Levin <sashal@kernel.org>
To: Shuah Khan <shuah@kernel.org>
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] selftests/rlimits: print rlim_t as unsigned long long
Date: Tue,  3 Nov 2026 10:55:10 -0500
Message-ID: <20261103155510.535037-1-sashal@kernel.org>
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

On 32-bit architectures with _FILE_OFFSET_BITS=64, rlim_t is an unsigned
long long, and printing it with %ld warns:

  rlimits-per-userns.c:38:49: warning: format '%ld' expects argument of type 'long int', but argument 3 has type 'rlim_t' {aka 'long long unsigned int'} [-Wformat=]

Cast it to unsigned long long and print it with %llu.

Signed-off-by: Sasha Levin <sashal@kernel.org>
---
Found with a 32-bit build of the selftests with a 64-bit time_t (gcc 16
and clang 21 with -m32 -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64);
KernelCI's 32-bit arm builds show the same warnings. The changed files
build without format warnings there now, and the x86_64 builds don't
change. The other selftests get the same kind of fix in separate
patches.

 tools/testing/selftests/rlimits/rlimits-per-userns.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/rlimits/rlimits-per-userns.c b/tools/testing/selftests/rlimits/rlimits-per-userns.c
index 26dc949e93eae..11bc65aca16b0 100644
--- a/tools/testing/selftests/rlimits/rlimits-per-userns.c
+++ b/tools/testing/selftests/rlimits/rlimits-per-userns.c
@@ -35,7 +35,7 @@ static void setrlimit_nproc(rlim_t n)
 		.rlim_max = n
 	};
 
-	warnx("(pid=%d): Setting RLIMIT_NPROC=%ld", pid, n);
+	warnx("(pid=%d): Setting RLIMIT_NPROC=%llu", pid, (unsigned long long)n);
 
 	if (setrlimit(RLIMIT_NPROC, &limit) < 0)
 		err(EXIT_FAILURE, "(pid=%d): setrlimit(RLIMIT_NPROC)", pid);
-- 
2.53.0

