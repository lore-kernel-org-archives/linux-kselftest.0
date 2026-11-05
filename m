Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793888063;
	b=hzzoT2yFmGEAJsqV7KjvmWOXQhj5Wb0BvlRJTA3/r5SMGfqNNdFrvftUvLPZBasOyXE2
	 h8SQS9c5yFag3XQ+l9UuARFIeO4YTxA/NmKOhHVAk+WJZ/HO5rAFb6ve6uvr9RPneyBlx
	 M3WzN71WR9ShfNiFVIGu2bU/lze8uzsbmT3TF8L4mmK6NFwqK/ncheY0YirdoGg3k1aEq
	 xOAYtCM1O35qD4Ld6I6Pd/Q6XZ84VwSZGY9FiSfIij4FV5Du1zJR3QAbApeM410sMXIcv
	 d1WUNYIT0AAk8v5OfMQ0L3YCM+TLf03aIBop6RhmYfQ4mEA8S9fwWTjbNldndPh1aKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793888063;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=/dUPChM36fEOq5RatfFduVj/PCS4a3EA+BbbiPd9JRk=;
	b=CLdohniwvMlD8Tq6nOKN4ZwZva3Tec8YCuXhTV4otZp0CHK6bSx895Iwrx256oMwyK6Y
	 S7s8e4LMU7gwg1H2WezlWXM/SR5w7qd2+NYsFlwF0otkD6lO61nVyLAtk4j9TiBLzDbxa
	 XsX9rV9qwWNpRLJJJ4It0E41eOg7EuQqjh9SAI+yupjQDR/PcC5G9Vfc+qs9zlUVzhOhP
	 9aO1/jXZck9FTICJfhSXMrcFoVdcznBmOm7BRtiPRM7jFW0fdUF2L7sbsNpYhYUU24EfF
	 WQTcQHcMfpS5p661Me3EP52DjcFItPIixi7OTSwQcynpjENY+28k7Mv5PHz8f12pFjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RAnSSEDd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F12F606D813;
	Thu,  5 Nov 2026 14:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RAnSSEDd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECD711F00A20;
	Thu,  5 Nov 2026 14:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793888063;
	bh=/dUPChM36fEOq5RatfFduVj/PCS4a3EA+BbbiPd9JRk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=RAnSSEDdt2rc9JuQ7xyi9axOsqVZQhg0C53O8wTP9NwhkHBYC3Mwp+t0CwY/egp+s
	 6vovMZOgkdwRjIBO0QntDn9p3oyUd2OIFaB+aPJIztX9asdscuVmLdawPSSLPzssmq
	 v/w57FIW9FPyqej7k7TFC+SdX3tutHSgo5gonzrlElF5hLKK6xYCSl6y3tES3JQWFp
	 AQOIoRMpbMn+JZ9okv2eBFrABKK8CQiDgBI0nuEQVCWQbXPb7QeQ9ygRCP1nUO8UO9
	 rdiYFTeyhaTpIE/O9Z+SwCSAXB03Y9jdPKm/g5DiZfaNbODRQj7YjOVN67XEkZ1qFA
	 eP+LOMsVySHbg==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 05 Nov 2026 14:01:20 +0000
Subject: [PATCH v2 07/11] kselftest/arm64: Remove the sched_yield()s from
 the fp-stress loads
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-arm64-fp-stress-kvm-v2-7-81a5172468f0@kernel.org>
References: <20261105-arm64-fp-stress-kvm-v2-0-81a5172468f0@kernel.org>
In-Reply-To: <20261105-arm64-fp-stress-kvm-v2-0-81a5172468f0@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
 Fuad Tabba <fuad.tabba@linux.dev>, Mark Rutland <mark.rutland@arm.com>, 
 Lorenzo Stoakes <ljs@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3955; i=broonie@kernel.org;
 h=from:subject:message-id; bh=5x8N4bXqqqnWonSWnXppjGE2ctQ+hVuF3ZdQ+mOZ/5A=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLe9GuYrWHal5F8L/l5hZfX5meXT226abfO1uFG3s5uV
 QMm7W8FHaUsDGJcDLJiiixxWdwv60ter+E7uLANZg4rE8gQBi5OAZhIRy/DXwknX8e9W77rmJit
 Yb5npbYsly+d7YPInZlSPWGc96ryRRn+8P1a+vd8+O+QoOJshqbP2t3LT97R3yJ5ZIHjhxv7mw1
 3swAA
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

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
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
index a1925761ae39..113411055afa 100644
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
index 3fb9ac5c8f8b..3036b165e81c 100644
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
index 39af1c96a4e5..ae851c139d28 100644
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

