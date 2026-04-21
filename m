Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0DB63D902B;
	Tue, 21 Apr 2026 14:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776782604; cv=none; b=gvo9m/9USRO0CypYEB2Mw/SpO5yEuIbMIMSk0MboWaq4RcvJu9h0H1pv8yeOrIg///PfcVdQv7TXvWyGFTNyIfLxdLFIiu1C1F24qvOHzhJex6Ra3NQNEDCvcIhejqCI2yBeNqAGJ3ANZfDcGL+XL8lzu2lEsqqqXuBxf0CMWD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776782604; c=relaxed/simple;
	bh=p9bdjlhoG2EqguOOpOu5ObgF3kpj690/lD2+dGUSX94=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gRoQs+Pom51UTTEH07KJeLZgSZ+QA9ofrDndwh7AEx/iVXrjtSRQVGkeTQZZj3Mxo8EQhcNhb0OPf+GP6Tubbsfw9aWGRcj+9vogIiUEr/dT+JzSgU1VvoI3Yu7Z9dxBjx49FwEMjU49d3mTMyTFkEV5dfktQJ173kb/jEopAZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=TiIV33xk; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="TiIV33xk"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B9A4625DE;
	Tue, 21 Apr 2026 07:43:16 -0700 (PDT)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E88403FAF5;
	Tue, 21 Apr 2026 07:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776782602; bh=p9bdjlhoG2EqguOOpOu5ObgF3kpj690/lD2+dGUSX94=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TiIV33xkcYjsI3igqSQxQsbZpSAYHDVc87sh2ssX9mBR5iX8ekC58P+/1IlzbVhlZ
	 R4Ry7oJKdhRqFNqJ2EICuy3g96fZVsOoIfTt2VY6Va4jc7NgitwPL7Jb4Cwv7WBpHP
	 C6kws5bOwd6tovUY5A3PnaOVNDy5dSw69cTzSInI=
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Will Deacon <will@kernel.org>,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 3/4] kselftest/arm64: Add POE helpers to test_signals_utils.h
Date: Tue, 21 Apr 2026 15:42:51 +0100
Message-ID: <20260421144252.1440365-4-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260421144252.1440365-1-kevin.brodsky@arm.com>
References: <20260421144252.1440365-1-kevin.brodsky@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In preparation to adding further POE signal tests, move
get_por_el0() to test_signals_utils.h and add set_por_el0().

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 .../selftests/arm64/signal/test_signals_utils.h  | 16 ++++++++++++++++
 .../arm64/signal/testcases/poe_siginfo.c         | 15 ---------------
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

