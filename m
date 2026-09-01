Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73D3485507;
	Tue,  1 Sep 2026 17:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788282597; cv=none; b=R2RN+HwjdrlX2YQ86vgk9ElCKL+SKFwvNhZbMA8HNeKkmNyXq9mjbYMu+Qa9vDNd/1xypIOIOZgNt5P7KIpQU8ANUgd3a8ilOKr7/37LGZdQXxGVX+5pfEjg1NY3HQzhXEnqFJ/AcVrU7yuLJJH62FIxiaH25ZepxonMIfJNtng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788282597; c=relaxed/simple;
	bh=GdbDqMwhKS4dvNXEnU5ojuDWOVHjqy8HghJqycB6KsI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rHpA5mP1K4dfYzhSUG/i7sXXA7P+dbect2oICUn/O4fQErXjUONq7PYRi68VVrdRbITAHimMAjbdorYZqA65zYmDypyfTS9AVGH38BI/IWO+T6LRapbsNGo8OubR5TI94QvQc8hTmqJrsfRbXLWZG6QMHLuWy331ahjFnSyJI84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l4yB8LX+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l4yB8LX+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 652361F00ADB;
	Tue,  1 Sep 2026 17:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788282595;
	bh=NxI+FpOAmxzg2hKYXBYiDpr6L2PYG+09QYQFHVt1TSo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=l4yB8LX+vDTiOKEzrwwpXiZhiM0zUvRfh264ziRNaC3LdH1YAteSETLqdUZOpRVSZ
	 g35FbqIEWxDEVYqILqegQuTaI333IF6RoarCa36St9RFDtGc1rNDv4hEDJz10qT/uG
	 IlpM7TlWUulrl2khmXML0UhGzCG2usU0Kk2ZwAhNZ72f8gpDmUly1IDaCZd8G1yDPs
	 344QS4ozGUuPUpSrV2cbPbiGOwBrnphwzEg3y8GNSW9LbYkywJKRoyNxMbum8fK3YJ
	 MkbgShzNjwj2LwK2VTxVp9STjyEygsj/xl6F5EXbUrKso0l/9eNRPDBI4zqRnueq/c
	 8fwAm/V4RMLrQ==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 01 Sep 2026 18:06:47 +0100
Subject: [PATCH 07/11] kselftest/arm64: Remove the sched_yield()s from the
 fp-stress loads
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-arm64-fp-stress-kvm-v1-7-31bce995b49b@kernel.org>
References: <20260901-arm64-fp-stress-kvm-v1-0-31bce995b49b@kernel.org>
In-Reply-To: <20260901-arm64-fp-stress-kvm-v1-0-31bce995b49b@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
 Fuad Tabba <fuad.tabba@linux.dev>, Mark Rutland <mark.rutland@arm.com>, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kselftest@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3902; i=broonie@kernel.org;
 h=from:subject:message-id; bh=GdbDqMwhKS4dvNXEnU5ojuDWOVHjqy8HghJqycB6KsI=;
 b=owEBbAGT/pANAwAKASTWi3JdVIfQAcsmYgBqlwbKNftVcanUlhQIMWx2Mid/cKISxY4XA0ZWE
 mmqno9pEWuJATIEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCapcGygAKCRAk1otyXVSH
 0FB4B/jUlFlmRbsCnYtLKyHr7MX8IiDWp2IBn0FWw6fqMdglnCaYOIx0pio8sUkLkjFfZiDxpQL
 7VQAYtpjNCcoqCumDbnR1oziUI6A/7VVAnX1tZNj+u0TaM7mXnhy344kTcnVZXIKYEGuW3zBZkR
 t7W1m/kRzX7LwwRzZbpzCGKXc6pXAoD5B8xb8wHanq14mTu/oBpT1ntkmHbQfmtUeJ21xA+/GEp
 c94XVenkGXvMN2VjK2vdfi22rSsJv6GBze7LY9qsrRLyvzIgAgqfIW0AYpotGSz3wM99hXn3bb8
 DaDEPKyY5n9Ej7KadB0F9OShtwGRC37O7jXdlExyuz5oI7M=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

The fp-stress load programs call sched_yield() on each iteration of
their test loops in order to encourage preemption, except for sve-test
where the call is commented out since the SVE state is destroyed by
system calls. This is most likely counterproductive since we are more
likely to notice corruption if preemption happens while setting or
reading the register state, and since fp-stress starts multiple test
programs per CPU we should have no trouble observing preemption anyway.

Remove these calls, including the commented out one in sve-test, both
due to this and in order to prepare for running as KVM guests.

We also remove the inclusions of unistd.h since we no longer need it in
any of the programs. za-test had an unreferenced local label in the
middle of the sched_yield(), remove that too.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/fp/fpsimd-test.S | 5 -----
 tools/testing/selftests/arm64/fp/sve-test.S    | 5 -----
 tools/testing/selftests/arm64/fp/za-test.S     | 5 -----
 tools/testing/selftests/arm64/fp/zt-test.S     | 4 ----
 4 files changed, 19 deletions(-)

diff --git a/tools/testing/selftests/arm64/fp/fpsimd-test.S b/tools/testing/selftests/arm64/fp/fpsimd-test.S
index df040283d076..5e19799f1b2e 100644
--- a/tools/testing/selftests/arm64/fp/fpsimd-test.S
+++ b/tools/testing/selftests/arm64/fp/fpsimd-test.S
@@ -10,7 +10,6 @@
 // (leave it running for as long as you want...)
 // kill $pids
 
-#include <asm/unistd.h>
 #include "assembler.h"
 #include "asm-offsets.h"
 
@@ -185,10 +184,6 @@ function main
 	cmp	x21, #NVR
 	b.lo	0b
 
-// Can't do this when SVE state is volatile across SVC:
-	mov	x8, #__NR_sched_yield	// Encourage preemption
-	svc	#0
-
 	mov	x21, #0
 0:	mov	x0, x21
 	bl	check_vreg
diff --git a/tools/testing/selftests/arm64/fp/sve-test.S b/tools/testing/selftests/arm64/fp/sve-test.S
index c7d9514f964e..fdb295bde45c 100644
--- a/tools/testing/selftests/arm64/fp/sve-test.S
+++ b/tools/testing/selftests/arm64/fp/sve-test.S
@@ -10,7 +10,6 @@
 // (leave it running for as long as you want...)
 // kill $pids
 
-#include <asm/unistd.h>
 #include "assembler.h"
 #include "asm-offsets.h"
 #include "sme-inst.h"
@@ -378,10 +377,6 @@ function main
 	cmp	x21, #NZR + NPR
 	b.lo	0b
 
-// Can't do this when SVE state is volatile across SVC:
-//	mov	x8, #__NR_sched_yield	// Encourage preemption
-//	svc	#0
-
 #ifdef SSVE
 	mrs	x0, S3_3_C4_C2_2	// SVCR should have ZA=0,SM=1
 	and	x1, x0, #3
diff --git a/tools/testing/selftests/arm64/fp/za-test.S b/tools/testing/selftests/arm64/fp/za-test.S
index a0165a81a937..8d449e114301 100644
--- a/tools/testing/selftests/arm64/fp/za-test.S
+++ b/tools/testing/selftests/arm64/fp/za-test.S
@@ -10,7 +10,6 @@
 // (leave it running for as long as you want...)
 // kill $pids
 
-#include <asm/unistd.h>
 #include "assembler.h"
 #include "asm-offsets.h"
 #include "sme-inst.h"
@@ -203,10 +202,6 @@ function main
 	subs	x21, x21, #1
 	b.ne	0b
 
-	mov	x8, #__NR_sched_yield	// encourage preemption
-1:
-	svc	#0
-
 	mrs	x0, S3_3_C4_C2_2	// SVCR should have ZA=1,SM=0
 	and	x1, x0, #3
 	cmp	x1, #2
diff --git a/tools/testing/selftests/arm64/fp/zt-test.S b/tools/testing/selftests/arm64/fp/zt-test.S
index 1c7db1298fb1..2333e72760a5 100644
--- a/tools/testing/selftests/arm64/fp/zt-test.S
+++ b/tools/testing/selftests/arm64/fp/zt-test.S
@@ -6,7 +6,6 @@
 // Repeatedly writes unique test patterns into ZT0
 // and reads them back to verify integrity.
 
-#include <asm/unistd.h>
 #include "assembler.h"
 #include "asm-offsets.h"
 #include "sme-inst.h"
@@ -143,9 +142,6 @@ function main
 	mov	x1, x22
 	bl	setup_zt
 
-	mov	x8, #__NR_sched_yield	// Encourage preemption
-	svc	#0
-
 	mrs	x0, S3_3_C4_C2_2	// SVCR should have ZA=1,SM=0
 	and	x1, x0, #3
 	cmp	x1, #2

-- 
2.47.3

