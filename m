Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB2333BBD7
	for <linux-kselftest@vger.kernel.org>; Tue, 18 Aug 2026 15:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787068435; cv=none; b=dxapTSI4AZghp/mvngbEVqO6eo56epcpu8KTv68as+aFeP56zpzPArN7QvP/BdIdhd6SNDOe0rQDnjPFLNyKINiRI8WvJXKZ9ZOwH66XWsYhgXFJJZO1hEuZtM9NlahMAlqI32OYABcVscIN36jwrKxV2xvvrAwlzWW4ClbdpSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787068435; c=relaxed/simple;
	bh=y87poIV0uimI5CA2+kvKxO3w5k8C8v0mChPyfMiB3M0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uFLO98NkWw3uOiswQz1i+2WFyIWbaNLr+4ONpgbiSzGHa+ZzJJzoxeO2cKqplSZI3+egdmPyb1R7j2bmIKqSycPc+dFFXf2z5uzc5Tx/NxxOF7y81SNlKamQgkQBtrJp3nBhveZHeq1D107zE+OGJ9sT6jP5z+FTTpPcwhb5xY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JyBinMag; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JyBinMag"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-84faf87d19dso103294b3a.3
        for <linux-kselftest@vger.kernel.org>; Tue, 18 Aug 2026 08:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787068434; x=1787673234; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/WUnCNNunR3sztjqINhBrxpcsDId+aB/tyOe8IO5J8Q=;
        b=JyBinMagFHGby6OBDUUvGcFkz4a1kYHuu8BtCBoww+jj1Mq7eM5k7VOEG/kJ747Wrw
         rgQX7eJqiE/QoG8/QM1B/PTEMcIGT4Ds7rmfmxawiamaTLeB8syzEQZMHg2DSp5KxOlp
         9uaqKyWfeVB/kPVagLnCunbqqF+YOq6RughYnGfL9fRdgse5gdFJU3Lo4ZQdH+X0uX/n
         Y1PccHWy2SULFucZ65djZGJMl1F/dpaOSohGMJg9XYTRydfSVX0aYeHoHzuk6BWtB4up
         znuO8YQq6G8TYvFNAKsl9n8/f+c4BqTe12vQUGnZSexmGhyogk+0fBB9H56vi6IYG8od
         Prew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787068434; x=1787673234;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/WUnCNNunR3sztjqINhBrxpcsDId+aB/tyOe8IO5J8Q=;
        b=FSl+PPAnZr5j0RNx/wRycd+Bktl9Uaelh1lSArocS/D09GgoY3sUWv9vFcMZUK16YV
         cDzh1ieE8a5Z5Kw2CVv+ViKdX2OxPbwulInZx5UeRc9IxEoGvvhntb5whV1MNhC3/d18
         yZioI9qC9VxEzIRbvzx6Slo9+GhJ1By0nTsbxMF4L6MvcVBS/ahbQd0tB4cTbbAzokeG
         JFn2LMg9gebvZPrJbv6meWp8w6sMJAE7zvG8qmw+fqFK0blyTe7pMxx6uRKMBKkwqM6e
         qCu5j+onXoMSIF0SN7CuE9jXiVfqCMoAii8fPwXrI6wffZgiqI7+Uui/RRa08kf4dSjY
         vr2w==
X-Forwarded-Encrypted: i=1; AHgh+RpfPa1qH48PLuUriBHW703wuIkgYLARVqQdXlRlno0Z9lSW8FFCVU/Ciwr0EgR4ftroGIFpr+ECOaHg5ehK3NU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTnqblRZf8YA2wr0DHTbQb94LlIW8vcRRmPHgSLHhU3YcRdwN1
	8vxBJPmnbMV4xWEVhgjdH9TLcLViUBA/ZilO+bvPycSpyN5HN3PLCtO4
X-Gm-Gg: AR+sD12YkKU1mUmd9jaMaDHGWII9gim0/z7theo4uSy7n5CwJczb/aD1Ls0cEAsf2KJ
	KYd8A4xdIcvZuapzys2GCXl9EsBabf9ObJuKp3keixNXJiqVqeFZpiGyVKCvpGSrkVNQPH0MCaz
	ca3dPoXNuzldku/LMGUaiRqCinWnBWPqb5S2FWVgglJmrzLBAlC8SkUFQAIcok9RH+5kxnPJ4WV
	FdxPywxe3o8oP7voQ9lFPjyMLrr0Eo6BldQVitRxgY2utL9Vs3NBHYw2cJ4x6Z5z0eA4ndaz2a+
	FcERmDDYwmr0fV4RDNShZqM4ogwLc/bVpY0oCTh2vO5kA9PzVmxxpe5ocJ635L6pMX39SAD+OzO
	qUly8VE6GD1eBn9js6o3XnzKjzeZEp8w20tfmvifGJacaVqe6k7e/Ijj2/UNaLDmRWTkOSXsofM
	O9vHwGix3uk/Cjv5bLRImVBo7jr12E/gEdWVPdE9VTScu8clOnbalt2gXcdDIIna3fftO5UxGvW
	/ZN8Ew/MD0=
X-Received: by 2002:a05:6a21:3a93:b0:3c4:1c9f:d81 with SMTP id adf61e73a8af0-3cc71c1b661mr46109570637.7.1787068433543;
        Tue, 18 Aug 2026 08:53:53 -0700 (PDT)
Received: from localhost.localdomain ([72.255.58.127])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3267c89768dsm15962300eec.26.2026.08.18.08.53.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 08:53:53 -0700 (PDT)
From: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
To: mathieu.desnoyers@efficios.com,
	peterz@infradead.org,
	paulmck@kernel.org,
	boqun@kernel.org,
	shuah@kernel.org
Cc: broonie@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
Subject: [PATCH] selftests/rseq: Fix circular dependencies in Makefile
Date: Tue, 18 Aug 2026 15:53:37 +0000
Message-ID: <20260818155337.4774-1-mahad.ibrahim.dev@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

TEST_GEN_PROGS_EXTENDED lists the binaries which are to be built but not
run. However it is also listed as prerequisite for every generated binary
to link against; all binaries only require librseq.so.

This results in the following warnings:

  make: Circular .../rseq/check_optimized <- .../rseq/check_optimized dependency dropped.

Such warnings are emitted 36 times in in-tree and out-of-tree builds.

Additionally, the generation of a single binary pulls in all of
TEST_GEN_PROGS_EXTENDED as they are listed as prerequisites for each
other. However since Make drops all the prerequisites which form a cycle,
the build succeeds, but results in unintended behavior. For example
building a single binary like check_optimized compiles 9 binaries while
only 2 are required.

Fix circular dependencies and unnecessary compilation of binaries in rseq
Makefile by isolating librseq.so and headers into a single variable which
is added as the prerequisite.

No warnings are emitted after the change, and building a single binary
only compiles that binary and librseq.so. Verified in-tree and with
OUTPUT= set to a separate directory.

Fixes: cb48828f06af ("selftests/rseq: Don't run tests with runner scripts outside of the scripts")
Signed-off-by: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
---
 tools/testing/selftests/rseq/Makefile | 28 ++++++++++++---------------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/tools/testing/selftests/rseq/Makefile b/tools/testing/selftests/rseq/Makefile
index aba6317f6cb8..9c369e59bb2d 100644
--- a/tools/testing/selftests/rseq/Makefile
+++ b/tools/testing/selftests/rseq/Makefile
@@ -37,41 +37,37 @@ TEST_FILES := settings
 
 include ../lib.mk
 
+RSEQ_DEPS := $(OUTPUT)/librseq.so rseq.h rseq-*.h
+
 $(OUTPUT)/librseq.so: rseq.c rseq.h rseq-*.h
 	$(CC) $(CFLAGS) -shared -fPIC $< $(LDLIBS) -o $@
 
-$(OUTPUT)/%: %.c $(TEST_GEN_PROGS_EXTENDED) rseq.h rseq-*.h
+$(OUTPUT)/%: %.c $(RSEQ_DEPS)
 	$(CC) $(CFLAGS) $< $(LDLIBS) -lrseq -o $@
 
-$(OUTPUT)/basic_percpu_ops_mm_cid_test: basic_percpu_ops_test.c $(TEST_GEN_PROGS_EXTENDED) rseq.h rseq-*.h
+$(OUTPUT)/basic_percpu_ops_mm_cid_test: basic_percpu_ops_test.c $(RSEQ_DEPS)
 	$(CC) $(CFLAGS) -DBUILDOPT_RSEQ_PERCPU_MM_CID $< $(LDLIBS) -lrseq -o $@
 
-$(OUTPUT)/param_test_benchmark: param_test.c $(TEST_GEN_PROGS_EXTENDED) \
-					rseq.h rseq-*.h
+$(OUTPUT)/param_test_benchmark: param_test.c $(RSEQ_DEPS)
 	$(CC) $(CFLAGS) -DBENCHMARK $< $(LDLIBS) -lrseq -o $@
 
-$(OUTPUT)/param_test_compare_twice: param_test.c $(TEST_GEN_PROGS_EXTENDED) \
-					rseq.h rseq-*.h
+$(OUTPUT)/param_test_compare_twice: param_test.c $(RSEQ_DEPS)
 	$(CC) $(CFLAGS) -DRSEQ_COMPARE_TWICE $< $(LDLIBS) -lrseq -o $@
 
-$(OUTPUT)/param_test_mm_cid: param_test.c $(TEST_GEN_PROGS_EXTENDED) \
-					rseq.h rseq-*.h
+$(OUTPUT)/param_test_mm_cid: param_test.c $(RSEQ_DEPS)
 	$(CC) $(CFLAGS) -DBUILDOPT_RSEQ_PERCPU_MM_CID $< $(LDLIBS) -lrseq -o $@
 
-$(OUTPUT)/param_test_mm_cid_benchmark: param_test.c $(TEST_GEN_PROGS_EXTENDED) \
-					rseq.h rseq-*.h
+$(OUTPUT)/param_test_mm_cid_benchmark: param_test.c $(RSEQ_DEPS)
 	$(CC) $(CFLAGS) -DBUILDOPT_RSEQ_PERCPU_MM_CID -DBENCHMARK $< $(LDLIBS) -lrseq -o $@
 
-$(OUTPUT)/param_test_mm_cid_compare_twice: param_test.c $(TEST_GEN_PROGS_EXTENDED) \
-					rseq.h rseq-*.h
+$(OUTPUT)/param_test_mm_cid_compare_twice: param_test.c $(RSEQ_DEPS)
 	$(CC) $(CFLAGS) -DBUILDOPT_RSEQ_PERCPU_MM_CID -DRSEQ_COMPARE_TWICE $< $(LDLIBS) -lrseq -o $@
 
-$(OUTPUT)/syscall_errors_test: syscall_errors_test.c $(TEST_GEN_PROGS_EXTENDED) \
-					rseq.h rseq-*.h
+$(OUTPUT)/syscall_errors_test: syscall_errors_test.c $(RSEQ_DEPS)
 	$(CC) $(CFLAGS) $< $(LDLIBS) -lrseq -o $@
 
-$(OUTPUT)/slice_test: slice_test.c $(TEST_GEN_PROGS_EXTENDED) rseq.h rseq-*.h
+$(OUTPUT)/slice_test: slice_test.c $(RSEQ_DEPS)
 	$(CC) $(CFLAGS) $< $(LDLIBS) -lrseq -o $@
 
-$(OUTPUT)/check_optimized: check_optimized.c $(TEST_GEN_PROGS_EXTENDED) rseq.h rseq-*.h
+$(OUTPUT)/check_optimized: check_optimized.c $(RSEQ_DEPS)
 	$(CC) $(CFLAGS) $< $(LDLIBS) -lrseq -o $@

base-commit: 0f23d56f17fdfc7db69d51f64c8b91bbab947aa9
-- 
2.54.0

