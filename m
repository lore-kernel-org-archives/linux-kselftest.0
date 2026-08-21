Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2948E4BC032;
	Fri, 21 Aug 2026 14:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787321765; cv=none; b=YS9IL7PBqFn7cD4urGlYzQ8qo3+muxwdF1FPlsyhxjg5d6WQTx7R/9vmTPAt4Bt81yksCF5lScvzUjltyhdZEeDNcRWqxcO9pwTtaULtDN8jH7oKiG9b46jQ0Uv9TDGNvJIgOGf6nDdDB8JXukZyaicY1STl2Y9Un2/quU+/Z9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787321765; c=relaxed/simple;
	bh=GkgEk4wxjMWjKEYIzr+cfZNkqDaG360hz+dtvjwvXSM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y2U1jC32rZfWcJySXnCLo6ScUniCguQS8JOFooqQt/BaHHUAnSALrkFinDjWuQBuRGQU7QkNPdY4L9BULyaG2f95uEgpun0rWnCeWcTfwibuRs7rc3DBZj53PDtcVf/Yq4Rwenv8noyQkDD8meBMsJqflPNbGzkso5S8xzLnvmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=b1vFUYxh; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="b1vFUYxh"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A92F722C8;
	Fri, 21 Aug 2026 07:15:59 -0700 (PDT)
Received: from e142334-100.cambridge.arm.com (e142334-100.cambridge.arm.com [10.2.198.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6D6EE3F85F;
	Fri, 21 Aug 2026 07:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787321763; bh=GkgEk4wxjMWjKEYIzr+cfZNkqDaG360hz+dtvjwvXSM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=b1vFUYxhNizbO0Ief3w0B/1HpfE0vGXsMMmU8mcpFtaSACD7vU+7JBBLOcNQwFi1v
	 iQItNHweUyu5fTGH1wXyzpzyuYc+oDxtas9l1EKVFUSv5vMHk5yQzadcjIoFxUMyQ/
	 7/IgeY0vNePWaH4IwO1SM0/mtPvzdrAd6nmBX01Y=
From: Muhammad Usama Anjum <usama.anjum@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Amit Daniel Kachhap <amit.kachhap@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)),
	linux-kselftest@vger.kernel.org (open list:KERNEL SELFTEST FRAMEWORK)
Cc: Muhammad Usama Anjum <usama.anjum@arm.com>
Subject: [PATCH v2 1/5] selftests/arm64: Print TAP header
Date: Fri, 21 Aug 2026 15:15:49 +0100
Message-ID: <20260821141556.4065894-2-usama.anjum@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260821141556.4065894-1-usama.anjum@arm.com>
References: <20260821141556.4065894-1-usama.anjum@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GCR_EL1 context-switch test prints its TAP plan before forking 1,024
child processes. When stdout is fully buffered, the plan remains in the
stdio buffer. Each child inherits the pending "1..1" line and flushes its
copy from exit(), producing repeated plan lines.

ksft_print_header() enables line buffering before printing the TAP
header. Call it before the plan so the plan is flushed before the child
processes are forked.

Fixes: 29f080881601 ("kselftest/arm64: check GCR_EL1 after context switch")
Reviewed-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Muhammad Usama Anjum <usama.anjum@arm.com>
---
Changes since v1:
- Explain how line buffering prevents duplicate plan lines.
- Use the selftests/arm64 subject prefix.
---
 tools/testing/selftests/arm64/mte/check_gcr_el1_cswitch.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/arm64/mte/check_gcr_el1_cswitch.c b/tools/testing/selftests/arm64/mte/check_gcr_el1_cswitch.c
index 325bca0de0f6e..d23f154d3288c 100644
--- a/tools/testing/selftests/arm64/mte/check_gcr_el1_cswitch.c
+++ b/tools/testing/selftests/arm64/mte/check_gcr_el1_cswitch.c
@@ -131,6 +131,7 @@ int main(int argc, char *argv[])
 	if (err)
 		return err;
 
+	ksft_print_header();
 	ksft_set_plan(1);
 
 	evaluate_test(mte_gcr_fork_test(),
-- 
2.47.3

