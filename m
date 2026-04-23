Received: from smtpout.efficios.com (smtpout.efficios.com [158.69.130.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58EFF35AC33;
	Thu, 23 Apr 2026 17:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=158.69.130.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776964942; cv=none; b=ibtj4bv+i+ra8VByJhvooKgaWWn15LYSpkBiIQNMmoE8JjAYKEIC4RRsYV6TtRXMewKQJSNU2suDhhx6OCI+Yg94gcvD1lTOt8a2QeWXeFi5TRN0RHofnfe1/fk08tuaZH2sepW16kXaAW5TtPLa+Q7U3Fk6Twwa3jbvs+qkiSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776964942; c=relaxed/simple;
	bh=82Et9j8AP6H1G8Lij+uJSr6JUdBdDrrloZMwbFqaCR0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HCWHeD2TP4H/USxIp+lnrEpwBBliS6Tq/0HL6JRw4+nDTEj2gfJ5aPrEa3bKHr8vem+FNIX4Pua0XGNLG+XMUCgSj7XN0inNRXt3gNIYHSYhqmVrjxJ2tbUaPEqjHIkeDZGwNrVczlLAZX4ojLAro+eyNN6FvvBVV/2lCGiURUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com; spf=pass smtp.mailfrom=efficios.com; dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b=chpyNhvs; arc=none smtp.client-ip=158.69.130.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b="chpyNhvs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=smtpout1; t=1776964342;
	bh=EkZQytHcN9F5Zlex4BiGqjRbNZsV3fbxoLZNHPE2B7I=;
	h=From:To:Cc:Subject:Date:From;
	b=chpyNhvse8KwO0xh9N/ADzy13G6ThDz0vHhbFnmTz7CIBRUW3gsdmDoxxKHKDiR1h
	 b+Oh81kcc1CAhDCjgnddsvkY652gxkwk3pSVsUpbQPXihq5QEMYzuUCy7JCWuRCnR0
	 pJzKUWKCMEAg/odAydvH4KPjgGdc1GeocdSQ91gbfuCjTo/bJH3hwyfODEiDsvf357
	 zq85CFmIOxBdhd3rYyzyEs+zdimqM/6aEw4Ayl5+ogt/e49ox95tMcwtbDxcZVZlEu
	 CPBGzwfJpXFkN7lUHEeYIjZAZ3uSumeKDdIw7tYAvXrqoj+JXlYUSnfu/5kcMtINqu
	 W0UBrv/x43AYg==
Received: from multivac.lan (unknown [IPv6:2607:fa49:b545:1200:a6b5:9684:1bde:dc7b])
	by smtpout.efficios.com (Postfix) with ESMTPSA id 4g1jMB03nWzhCb;
	Thu, 23 Apr 2026 13:12:21 -0400 (EDT)
From: Michael Jeanson <mjeanson@efficios.com>
To: linux-kernel@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Michael Jeanson <mjeanson@efficios.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Subject: [PATCH] rseq/selftests: Fix only run syscall errors wrapper script on 'run_tests'
Date: Thu, 23 Apr 2026 13:12:16 -0400
Message-ID: <20260423171216.2627531-1-mjeanson@efficios.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move 'syscall_errors_test' to TEST_GEN_PROGS_EXTENDED as it shouldn't be
directly executed by the 'run_tests' target. The wrapper script
'run_syscall_errors_test.sh' that sets the required environment before
executing 'syscall_errors_test' is already present in TEST_PROGS.

Fixes: 3c27b40830ca ("selftests/rseq: Add rseq syscall errors test")
Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
Reviewed-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
---
 tools/testing/selftests/rseq/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/rseq/Makefile b/tools/testing/selftests/rseq/Makefile
index 4ef90823b652..0cfd06b66780 100644
--- a/tools/testing/selftests/rseq/Makefile
+++ b/tools/testing/selftests/rseq/Makefile
@@ -17,9 +17,9 @@ OVERRIDE_TARGETS = 1
 TEST_GEN_PROGS = basic_test basic_percpu_ops_test basic_percpu_ops_mm_cid_test param_test \
 		param_test_benchmark param_test_compare_twice param_test_mm_cid \
 		param_test_mm_cid_benchmark param_test_mm_cid_compare_twice \
-		syscall_errors_test slice_test
+		slice_test
 
-TEST_GEN_PROGS_EXTENDED = librseq.so
+TEST_GEN_PROGS_EXTENDED = librseq.so syscall_errors_test
 
 TEST_PROGS = run_param_test.sh run_syscall_errors_test.sh
 
-- 
2.53.0

