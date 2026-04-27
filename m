Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 202BF3B895A;
	Mon, 27 Apr 2026 12:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777291447; cv=none; b=XgKrcfhJqxbfyyFOVTILBl4Xww7VJ9/BALn6iiNqWt+z1ZKTRIbptk5IOS7g7nl+L7sfPtDSm4SOHzHVZtjmEKtojmirRCmlJFcK/qiCXluaUBEsKYORJPw05KW7MqcNi+fcAS0gqbkVw+uH8ItqWMNjMDNKFiejRpH0WSYfj5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777291447; c=relaxed/simple;
	bh=9abFZKGlP5VpbpK/xo3o3sS4A3nxNboOdLQrnuFuT/8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J31xuadGO5E81xUZZJAnqZvKxXOrtC7aXJx/7Dc2Xe4H0iZww/a36WvNZG7osnMHbwCZag8E60WfvhfZXQAvJDIGLNriXhQ6+O074ROpJHH7iw80kmgPPudXW3AXqHf7aB9bCGhq4egC64aRY+FY353EyADJZnmdWr8/TU7Fpzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=E5HTbU93; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="E5HTbU93"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 143C72403;
	Mon, 27 Apr 2026 05:04:00 -0700 (PDT)
Received: from localhost.localdomain (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EB5743F62B;
	Mon, 27 Apr 2026 05:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777291445; bh=9abFZKGlP5VpbpK/xo3o3sS4A3nxNboOdLQrnuFuT/8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=E5HTbU93SQIM8aVlcAPTi1uVCP1N/6UdLlfw1iB5ICYPNgHuTUaYxBrlXZgdkCuLz
	 doZig4NlvoPQiazZPffunLwI4WTyOjdLVOfj9yPtNMeOvm4Vk+J/9q1RbO1OEzZETK
	 uAgOe2oVcTpbcNK3SbT3QQTP8ajcOnuOP6toOKG4=
From: Kevin Brodsky <kevin.brodsky@arm.com>
Date: Mon, 27 Apr 2026 13:03:35 +0100
Subject: [PATCH v2 3/5] kselftest/arm64: Add POE as a feature in the signal
 tests
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-poe_signal-v2-3-2bd9d6f16ab4@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777291437; l=1828;
 i=kevin.brodsky@arm.com; s=20260427; h=from:subject:message-id;
 bh=9abFZKGlP5VpbpK/xo3o3sS4A3nxNboOdLQrnuFuT/8=;
 b=GTnr1c7p2Hin4jCm+yjPTqqelCqtlEX6rcqi1gm5BLqDAdM07xRTBou5V5Li0RVM+66g0W9+y
 P/t1n7po+HfAW3auqpcikvxL2xVW1CvymzvFNUOTdPkAlcmJ39/fx4f
X-Developer-Key: i=kevin.brodsky@arm.com; a=ed25519;
 pk=N2QG+eJKrvkNovwhhwJhnJ4+ScVfsGCHldmqLfcMTFs=

Add the POE feature to the signal tests framework, to allow tests to
require it.

Reviewed-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 tools/testing/selftests/arm64/signal/test_signals.h       | 2 ++
 tools/testing/selftests/arm64/signal/test_signals_utils.c | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/tools/testing/selftests/arm64/signal/test_signals.h b/tools/testing/selftests/arm64/signal/test_signals.h
index ee75a2c25ce7..c7c343494cb8 100644
--- a/tools/testing/selftests/arm64/signal/test_signals.h
+++ b/tools/testing/selftests/arm64/signal/test_signals.h
@@ -36,6 +36,7 @@ enum {
 	FSME_FA64_BIT,
 	FSME2_BIT,
 	FGCS_BIT,
+	FPOE_BIT,
 	FMAX_END
 };
 
@@ -45,6 +46,7 @@ enum {
 #define FEAT_SME_FA64		(1UL << FSME_FA64_BIT)
 #define FEAT_SME2		(1UL << FSME2_BIT)
 #define FEAT_GCS		(1UL << FGCS_BIT)
+#define FEAT_POE		(1UL << FPOE_BIT)
 
 /*
  * A descriptor used to describe and configure a test case.
diff --git a/tools/testing/selftests/arm64/signal/test_signals_utils.c b/tools/testing/selftests/arm64/signal/test_signals_utils.c
index 5d3621921cfe..4b12dbd7669d 100644
--- a/tools/testing/selftests/arm64/signal/test_signals_utils.c
+++ b/tools/testing/selftests/arm64/signal/test_signals_utils.c
@@ -31,6 +31,7 @@ static char const *const feats_names[FMAX_END] = {
 	" FA64 ",
 	" SME2 ",
 	" GCS ",
+	" POE ",
 };
 
 #define MAX_FEATS_SZ	128
@@ -341,6 +342,8 @@ int test_init(struct tdescr *td)
 			td->feats_supported |= FEAT_SME2;
 		if (getauxval(AT_HWCAP) & HWCAP_GCS)
 			td->feats_supported |= FEAT_GCS;
+		if (getauxval(AT_HWCAP2) & HWCAP2_POE)
+			td->feats_supported |= FEAT_POE;
 		if (feats_ok(td)) {
 			if (td->feats_required & td->feats_supported)
 				fprintf(stderr,

-- 
2.51.2

