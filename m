Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D3883B8D78;
	Mon, 27 Apr 2026 12:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777291449; cv=none; b=KeohPGCJ4GAZh7iF4vBJo2EzsshlltpQoVng9gXa9sZjsdikObWluVciUb20dro5gllO1L+1MFxHvOyapqCOcG5gYSvxLo2g4nkTzPrIVME8dZcnYbUx7j1Ds/U8SALhq4SDZtyA1JipHeowikhNJ3rdy9VdkTuJyavSGJuIIdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777291449; c=relaxed/simple;
	bh=ldcRjHyX3ikGZr7TkP8sF4TKynkn1s47t2JOAAGYL7E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XiEsPdtWPxcbsUKqCxySlyk2IrY+B2UiKNrCTRvWh+wY3CRCdzZu55wYHHHxqAcfI3/yjGndz8JEZxQbSwfaZ027vR4FPTxXAuJYzU70ih4HU7czdyCABoefLV/ZR+snd4z0nbICY/+turiBdJPcn3TnSLyLjAgiGCT5vW2rQiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Miik+htN; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Miik+htN"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 023032437;
	Mon, 27 Apr 2026 05:04:02 -0700 (PDT)
Received: from localhost.localdomain (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DA85A3F62B;
	Mon, 27 Apr 2026 05:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777291447; bh=ldcRjHyX3ikGZr7TkP8sF4TKynkn1s47t2JOAAGYL7E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Miik+htNqUHD8vM0xx8JqEjpijJJ/3fmWSdcOzhiUxUJX8LFyjsOuhSbRJ6QTtLCF
	 x98ojX4IXXUjskp5T8b8iUrxWEOkFCf6JjJnIoySQSzjTKSt/V1TDI4v64H/FLFMrg
	 9YAfKQxrgNv/njWtR81B9dfN559OxTMw8e1GvVXQ=
From: Kevin Brodsky <kevin.brodsky@arm.com>
Date: Mon, 27 Apr 2026 13:03:36 +0100
Subject: [PATCH v2 4/5] kselftest/arm64: Move/add POE helpers to
 test_signals_utils.h
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-poe_signal-v2-4-2bd9d6f16ab4@arm.com>
References: <20260427-poe_signal-v2-0-2bd9d6f16ab4@arm.com>
In-Reply-To: <20260427-poe_signal-v2-0-2bd9d6f16ab4@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Kevin Brodsky <kevin.brodsky@arm.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 "David Hildenbrand (Arm)" <david@kernel.org>, 
 Joey Gouly <joey.gouly@arm.com>, Mark Brown <broonie@kernel.org>, 
 Shuah Khan <shuah@kernel.org>, Will Deacon <will@kernel.org>, 
 linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777291437; l=2017;
 i=kevin.brodsky@arm.com; s=20260427; h=from:subject:message-id;
 bh=ldcRjHyX3ikGZr7TkP8sF4TKynkn1s47t2JOAAGYL7E=;
 b=r24fR4zGfLVsqC3/BUO4grJOZYk9vXPaWiQGFFkqbpPG0E3bWUZYasLlLJnROsUstdfZcv6rz
 l5q3dEkmPbMB4V4cqfkWkRZN/jzikVM6ShcRdFYHENfVT5ULyQjmCrh
X-Developer-Key: i=kevin.brodsky@arm.com; a=ed25519;
 pk=N2QG+eJKrvkNovwhhwJhnJ4+ScVfsGCHldmqLfcMTFs=

In preparation to adding further POE signal tests, move
get_por_el0() to test_signals_utils.h and add set_por_el0().

Reviewed-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 .../testing/selftests/arm64/signal/test_signals_utils.h  | 16 ++++++++++++++++
 .../selftests/arm64/signal/testcases/poe_siginfo.c       | 15 ---------------
 2 files changed, 16 insertions(+), 15 deletions(-)

diff --git a/tools/testing/selftests/arm64/signal/test_signals_utils.h b/tools/testing/selftests/arm64/signal/test_signals_utils.h
index 36fc12b3cd60..2c7b8c64a35a 100644
--- a/tools/testing/selftests/arm64/signal/test_signals_utils.h
+++ b/tools/testing/selftests/arm64/signal/test_signals_utils.h
@@ -57,6 +57,22 @@ static inline __attribute__((always_inline)) uint64_t get_gcspr_el0(void)
 	return val;
 }
 
+#define SYS_POR_EL0 "S3_3_C10_C2_4"
+
+static inline uint64_t get_por_el0(void)
+{
+	uint64_t val;
+
+	asm volatile("mrs %0, " SYS_POR_EL0 "\n" : "=r"(val));
+
+	return val;
+}
+
+static inline void set_por_el0(uint64_t val)
+{
+	asm volatile("msr " SYS_POR_EL0 ", %0\n" :: "r"(val));
+}
+
 static inline bool feats_ok(struct tdescr *td)
 {
 	if (td->feats_incompatible & td->feats_supported)
diff --git a/tools/testing/selftests/arm64/signal/testcases/poe_siginfo.c b/tools/testing/selftests/arm64/signal/testcases/poe_siginfo.c
index 36bd9940ee05..e15fedf4da6e 100644
--- a/tools/testing/selftests/arm64/signal/testcases/poe_siginfo.c
+++ b/tools/testing/selftests/arm64/signal/testcases/poe_siginfo.c
@@ -21,21 +21,6 @@ static union {
 	char buf[1024 * 128];
 } context;
 
-#define SYS_POR_EL0 "S3_3_C10_C2_4"
-
-static uint64_t get_por_el0(void)
-{
-	uint64_t val;
-
-	asm volatile(
-		"mrs	%0, " SYS_POR_EL0 "\n"
-		: "=r"(val)
-		:
-		: );
-
-	return val;
-}
-
 int poe_present(struct tdescr *td, siginfo_t *si, ucontext_t *uc)
 {
 	struct _aarch64_ctx *head = GET_BUF_RESV_HEAD(context);

-- 
2.51.2

