Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D52381B08;
	Thu, 23 Apr 2026 19:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776971882; cv=none; b=OVx1OJ1v/V3O3S0oFy9ibiFFM1WFb3prgFBURzJDQaa16losmfyyW66ZyxE1baGwJ9XCOHT4Wa8eTFfWikwApFUVtM5CItv5MHbCvu0w2fSvwR9fOJDymNH+7QeJooxMbefesN3Q0bEGsmUbE3KOJ00gI9SWaXcKmBrk9hYXMFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776971882; c=relaxed/simple;
	bh=HWSCZXLpnBFLaItxpRGRaPVe8vGpL9XBLSjFfcHOdn0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=K+16UYVbHzgXzzbJBTfNhdEAsPcPyUGqJjh5z9vWcwk/NHgS90pWIyXqgYxmxlk0BPQhgeYn4XXzg5KTKutiG223XzCANqMz9oGao2KVdab2xHt/hh1UPKQIxQ8hFSTFbC5gmfNp/HclsTAcaOhUJscC9PeVp4lXwQyIm17yP8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ohCIW0YZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ohCIW0YZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B63A4C2BCAF;
	Thu, 23 Apr 2026 19:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776971881;
	bh=HWSCZXLpnBFLaItxpRGRaPVe8vGpL9XBLSjFfcHOdn0=;
	h=From:Date:Subject:To:Cc:From;
	b=ohCIW0YZJEKkgPM6vZ1gPPbfFvrXmZsQB/1kM6Gm3A0LloKDFYf/KYGYwFYHa5Eo2
	 HX8SqHOtlc480PAIAlRII9A9n1CINsfE+L6Nl2SNcdV9kC45lWKxGPDiGLzPNKJ8lu
	 0OEId2zVvvIrb4YH3k8E2CWY0Lyra1T6WmXPX78vJ1vweGnTd/pd1KhWr5NyUxkCe3
	 WZn2slgmSQlPex5AJKaXvM9ZI34iHR77jJfC/bNjXbCe+ybaEdFRvXLuwenZibq0m8
	 /SgjW8GnMU36pADAxOVbRmvDzjmuaPrv5/TBVGAlYfToNtSpoXUS0kbpQs22Fd2+F2
	 jD1pZX+O4Jkyg==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 23 Apr 2026 20:17:45 +0100
Subject: [PATCH] selftests/rseq: Don't run tests with runner scripts
 outside of the scripts
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-selftests-rseq-use-runner-v1-1-e13a133754c1@kernel.org>
X-B4-Tracking: v=1; b=H4sIAFhw6mkC/yXMQQrCMBBG4auUWTtQ05IWryIuavpHRyTqTCJC6
 d1Ndfkt3lvIoAKjQ7OQ4i0mj1Sx3zUUrlO6gGWuJtc63/auY8M9Zlg2VsOLi4G1pATlsRv9gB4
 x+IFq/1RE+fzex9PfVs43hLwNaV2/nYEmf30AAAA=
X-Change-ID: 20260423-selftests-rseq-use-runner-83867e4efc67
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Thomas Gleixner <tglx@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 "Paul E. McKenney" <paulmck@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Shuah Khan <shuah@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2092; i=broonie@kernel.org;
 h=from:subject:message-id; bh=HWSCZXLpnBFLaItxpRGRaPVe8vGpL9XBLSjFfcHOdn0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp6nBmNK4kN6LdBZPz0trympe3IjOlZbErFkcyv
 /SustuhZNSJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaepwZgAKCRAk1otyXVSH
 0FbfB/9bcroUHmWkosF36oBfOIgUEdlaC2PmzcmEV4tukwtTZvNhIbkNzuJMXKXi2RICT21Nrp3
 mc6cfkPCPM8tTuMRXEmATRp8YF7f23u6SQLx/SwZarW6v3rsEs/mEXBDG8Xead0ZLlWNfBQ5zhE
 mkRvNMh3otHlNiQz+xyg8MRmFqZ7HPn4A7ryGIGstvTFx6CYATJl93O4uJnNVtAT5QKoc6F3q3h
 ZT7DxbizSHAyRsH+2dZuUrn4IDpXjMg+ghtNOJN/NKEB9Fmm2JI6Sw2LPfGKP/20McPxpEoO4Wq
 vkwMARQgXqfRtUKN1/dlIH1gFN3lKCFC34arDhnCvOReKjJp
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

The rseq selftests include two runner scripts run_param_test.sh and
run_syscall_errors_test.sh which set up the environment for test binaries
and run them with various parameters. Currently we list these test binaries
in TEST_GEN_PROGS but this results in the kselftest framework running them
directly as well as via the runners, resulting in duplication and spurious
failures when the environment is not correctly set up (eg, if glibc tries
to use rseq).

Move the binaries the runners invoke to TEST_GEN_PROGS_EXTENDED, binaries
listed there are built but not run by the framework.  The param_test
benchmarks are not moved since they are not run by run_param_test.sh.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/rseq/Makefile | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/rseq/Makefile b/tools/testing/selftests/rseq/Makefile
index 4ef90823b652..a217b959e036 100644
--- a/tools/testing/selftests/rseq/Makefile
+++ b/tools/testing/selftests/rseq/Makefile
@@ -14,12 +14,16 @@ LDLIBS += -lpthread -ldl
 # still track changes to header files and depend on shared object.
 OVERRIDE_TARGETS = 1
 
-TEST_GEN_PROGS = basic_test basic_percpu_ops_test basic_percpu_ops_mm_cid_test param_test \
-		param_test_benchmark param_test_compare_twice param_test_mm_cid \
-		param_test_mm_cid_benchmark param_test_mm_cid_compare_twice \
-		syscall_errors_test slice_test
-
-TEST_GEN_PROGS_EXTENDED = librseq.so
+TEST_GEN_PROGS = basic_test basic_percpu_ops_test basic_percpu_ops_mm_cid_test \
+		param_test_benchmark param_test_mm_cid_benchmark \
+		slice_test
+
+TEST_GEN_PROGS_EXTENDED = librseq.so \
+	param_test \
+	param_test_compare_twice \
+	param_test_mm_cid \
+	param_test_mm_cid_compare_twice \
+	syscall_errors_test
 
 TEST_PROGS = run_param_test.sh run_syscall_errors_test.sh
 

---
base-commit: 028ef9c96e96197026887c0f092424679298aae8
change-id: 20260423-selftests-rseq-use-runner-83867e4efc67

Best regards,
--  
Mark Brown <broonie@kernel.org>

