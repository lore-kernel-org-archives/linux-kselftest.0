Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 986E33491C2
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Feb 2026 16:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772210457; cv=none; b=rkK6o+AErx4L82AxhITzEiz7RButCUOEbA6PXzVICdW9O6KwnwfMxymcUDEFix5TWcnPMyhAbqDo3mj+gb+z2o6dQn480+xGmN8bTkJNW6DNPbW8HXQ2qonndfRlV9x+D2+vWuus3zYKv7G3MJuwAtVL6LJzpCR/Aokc3LQ1Un4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772210457; c=relaxed/simple;
	bh=C9rvgcLgCnl2H3Sg4HwQ69JNuoVVfZdko+mTO0riISE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ju33yiiCQmhUoNVZRpZWwXkAQOsiazHotZqlzWs02ooyxCqcom9tTykPE+AiNMP+ZWNv0C9+y3pv/GSRn0hmoGljjhxk6VYQvJ7+/TmYAklho/LaUZAsdE61+WrhIUcQbMHHk8fYlgNqthQyLPmkd9sWIWT7Lq8tpY/yh6WA0ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LSiZX+Kg; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LSiZX+Kg"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2b4520f6b32so2800547eec.0
        for <linux-kselftest@vger.kernel.org>; Fri, 27 Feb 2026 08:40:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772210456; x=1772815256; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jdhIwXbtzriV4OW5ztdIybKDlCas+wm2/e72G4CdWfk=;
        b=LSiZX+KgqPM8gkkTRYnQF4QKo15oV/QXh/m7oyDGR/x8wN6SnXBpLAmnYll49dVxlj
         DRj1bLoxgrYoIa4yr4OEaRWkDNGMlvqysGwi5RFoB3AwHtP8pHgK+nhGHDV54zBeW0kM
         BiVkQpBFmTTY+w0NHfT0CycYlTAjNr2jrCl2Y1cZFjbDkHH2UxL15/1crmX7Fuv11zAa
         fU36fxIwBEAwoDDovUDirPw7I+Ls50qNfknKYMevaYiHWEiJ3G+wW3iCx6piL/4BnNuG
         CTg27Ri7Oc1UpQHvQguFO70RsXV+dvmDqa329MDSLWvCaCwSjyrikupRfykFHEEJn6Uu
         npPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772210456; x=1772815256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jdhIwXbtzriV4OW5ztdIybKDlCas+wm2/e72G4CdWfk=;
        b=fja2YG8vazDvHPhRtJ41mb/Bb/yZuNX2hmwP43HBmqp2ctGhzsoOJJGBm3121t5uex
         QyBHN8wma8GwJNeJ7JQLpWBEQfK84DKjW9j/HIb1N8GVetw1dsslSnnQ2A64rrVZZgRm
         DcCbDxlsXsmC0k0NlArL9MNatxUuqiKxK6oBCfAtq+HU5mka2d7YLlj7ERQfYTIwnp1o
         DxRJj/O7kgTNLDBYXe1i5pWYVBExgQudCKxsJ/+uOVvXclU1nSuKaVTF20tJgvdk3/PQ
         le8VCQegEULF3RGIbyg+JgomKC+86+M6WfKirfgITNBEj3cRrdIIXx2fZLZoI1cGnN6O
         yEOg==
X-Forwarded-Encrypted: i=1; AJvYcCV+/Kq0MT/5SLjB7faO+bE8H20vk9kLGkw0kMQ4CN5qbm032joKsdUozeMtZnuC4xHDLfoyyjdKJWoPghzU5i4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyV77TuIG3MzS+wFBdFbmLphQYrn3R6FBNIk9Y9Tm6XIGrigBLJ
	91pCXn5RBv16oKr/3uFqHGZVHGxJFEYKB/xa0v9tjMou10w5PHnfE2je
X-Gm-Gg: ATEYQzwEJaXqBzlXoH+3Ye7vS9HGHoi7IuyrGoz9aSoxpiKk8abnv2R8bg/c7BdSdJ5
	zoWN2qu7GSo2tqlcMv++Z087DEBjCqh3n5QrB4wPECTz6lI3oywFtzOQSnkTSadXP/1xDewidTV
	NiNhxP8i3TPXK/5zD0PMJgJ6FzeL6cnteMJwFg2yXKRNmbo+y0II5t4Oi3KtdpMHzwFkiSltp98
	moy9MO42oQh3sb9ZUxWjKM0nr3afrJgOgxIBtkb+ntWFxdJlWPBMGCXrGsB/FUSwcxg9/AtJfyv
	nny+m6FtrfE73lIlYAml2WegDS6Flo2YSOiD97ozJZQD2/PDSg5BBM3W0+kjTuvSJ+tKTcbwW5Q
	rfMVuBLqQGMrEvC1QuR3h/Pl9RqqDMj59FMU5jXvZ7rh6zUpx7r2qKDOphkrweW3wvaj4tiQ7ml
	hRiLI4gyTsM+/z22X8IWU5OsmpiqsreKyIUlK+0o/EVyb+fmRIGdQ8cFVP+LNAQpH6OE6lPy5Mz
	kEJ4Tlg9bLjaCcZ2HwH7IsRJA8=
X-Received: by 2002:a05:693c:2c97:b0:2ba:8961:e1a1 with SMTP id 5a478bee46e88-2bde1d31e56mr1547097eec.22.1772210455641;
        Fri, 27 Feb 2026 08:40:55 -0800 (PST)
Received: from localhost.localdomain (108-214-96-168.lightspeed.sntcca.sbcglobal.net. [108.214.96.168])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bdef9700ffsm220707eec.28.2026.02.27.08.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 08:40:55 -0800 (PST)
From: Sun Jian <sun.jian.kdev@gmail.com>
To: Andrii Nakryiko <andrii@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: Eduard Zingerman <eddyz87@gmail.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sun Jian <sun.jian.kdev@gmail.com>
Subject: [PATCH 2/2] selftests/bpf: bpf_cookie: make perf_event subtest trigger reliably
Date: Sat, 28 Feb 2026 00:40:37 +0800
Message-ID: <20260227164037.84110-3-sun.jian.kdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260227164037.84110-1-sun.jian.kdev@gmail.com>
References: <20260227164037.84110-1-sun.jian.kdev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The perf_event subtest relies on SW_CPU_CLOCK sampling to trigger the BPF
program, but the current CPU burn loop can be too short on slower systems
and may fail to generate any overflow sample. This leaves pe_res unchanged
and makes the test flaky.

Make burn_cpu() take a loop count and use a longer burn only for the
perf_event subtest. Also scope perf_event_open() to the current task to
avoid wasting samples on unrelated activity.

Tested:
  ./test_progs -t bpf_cookie/perf_event -vv (30 runs): 0 failures

Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
---
 .../selftests/bpf/prog_tests/bpf_cookie.c       | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/bpf_cookie.c b/tools/testing/selftests/bpf/prog_tests/bpf_cookie.c
index 50f5e11e6e65..35adc3f6d443 100644
--- a/tools/testing/selftests/bpf/prog_tests/bpf_cookie.c
+++ b/tools/testing/selftests/bpf/prog_tests/bpf_cookie.c
@@ -6,6 +6,7 @@
 #include <sys/syscall.h>
 #include <sys/mman.h>
 #include <unistd.h>
+#include <linux/compiler.h>
 #include <test_progs.h>
 #include <network_helpers.h>
 #include <bpf/btf.h>
@@ -431,11 +432,12 @@ static void tp_subtest(struct test_bpf_cookie *skel)
 	bpf_link__destroy(link3);
 }
 
-static void burn_cpu(void)
+static void burn_cpu(long loops)
 {
-	volatile int j = 0;
+	long j = 0;
 	cpu_set_t cpu_set;
-	int i, err;
+	long i;
+	int err;
 
 	/* generate some branches on cpu 0 */
 	CPU_ZERO(&cpu_set);
@@ -443,9 +445,10 @@ static void burn_cpu(void)
 	err = pthread_setaffinity_np(pthread_self(), sizeof(cpu_set), &cpu_set);
 	ASSERT_OK(err, "set_thread_affinity");
 
-	/* spin the loop for a while (random high number) */
-	for (i = 0; i < 1000000; ++i)
+	for (i = 0; i < loops; ++i) {
 		++j;
+		barrier();
+	}
 }
 
 static void pe_subtest(struct test_bpf_cookie *skel)
@@ -470,7 +473,7 @@ static void pe_subtest(struct test_bpf_cookie *skel)
 	if (!ASSERT_OK_PTR(link, "link1"))
 		goto cleanup;
 
-	burn_cpu(); /* trigger BPF prog */
+	burn_cpu(100000000L); /* trigger BPF prog */
 
 	ASSERT_EQ(skel->bss->pe_res, 0x100000, "pe_res1");
 
@@ -489,7 +492,7 @@ static void pe_subtest(struct test_bpf_cookie *skel)
 	if (!ASSERT_OK_PTR(link, "link2"))
 		goto cleanup;
 
-	burn_cpu(); /* trigger BPF prog */
+	burn_cpu(100000000L); /* trigger BPF prog */
 
 	ASSERT_EQ(skel->bss->pe_res, 0x200000, "pe_res2");
 
-- 
2.43.0

