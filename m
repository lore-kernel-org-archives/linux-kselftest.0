Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 482573FD956;
	Tue, 25 Aug 2026 11:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787656781; cv=none; b=b+QxQQiOiwDOAkeapiw08BlErt/2UDfweQ1+NDpyEcaKHevIQhOWPr9DsuN79Tb8kgSoLmtzc5m7dWBO0zO7+Nxxv2WobAWnZOOHh4jxMsTRF1JfLCUKp/RbP6bQvhzeHpRVf7gdrmVwTWRJM3F9NAVV5AH/4CvMzUfRY5kmTHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787656781; c=relaxed/simple;
	bh=P7OYcyFhp0FOazsEulZVO/ysmQGGewaznoTVnl08A+w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W9kO3iciwNiFIxh8XQq0AcF2go1Nh12ZGTHHxDvzI+BsckiOisNz/Y5BYySHAwRIdMwxSTCL2Oys7zmn3YZzyVm8npCq5WezNkRf/LV/CgCX9OLidP+zNk0mVE84JNy9mp9BbSceMQP2h+Kz7IEWD/4KTXKCoqTWmNv1/c50zR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=cFk9WPLV; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="cFk9WPLV"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DB0981688;
	Tue, 25 Aug 2026 04:19:34 -0700 (PDT)
Received: from e142334-100.cambridge.arm.com (e142334-100.cambridge.arm.com [10.2.198.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F1B833F66F;
	Tue, 25 Aug 2026 04:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787656778; bh=P7OYcyFhp0FOazsEulZVO/ysmQGGewaznoTVnl08A+w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cFk9WPLVQgepJwAoS50dyvTqjKvWQiFi55eaaR6zTPVlI8V/Lh4Ldg56lFMWfRLkn
	 ZxjkIJVwAUzr/+sNcCnKBZs+7mkSvkwO/uvNhgE+JvAZWEFpaziXN17YcwHSeMkCgY
	 cZ1gtZ8ngBJmGh2jyApTbLz1vJOxQ5An52wYq4Wk=
From: Muhammad Usama Anjum <usama.anjum@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Amit Daniel Kachhap <amit.kachhap@arm.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Mark Brown <broonie@kernel.org>,
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)),
	linux-kselftest@vger.kernel.org (open list:KERNEL SELFTEST FRAMEWORK)
Cc: Muhammad Usama Anjum <usama.anjum@arm.com>
Subject: [PATCH v3 3/4] selftests/arm64: Fix MTE prctl TAP plan
Date: Tue, 25 Aug 2026 12:18:36 +0100
Message-ID: <20260825111929.2882324-4-usama.anjum@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260825111929.2882324-1-usama.anjum@arm.com>
References: <20260825111929.2882324-1-usama.anjum@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MTE prctl test emits one result from check_basic_read() followed by
one result for each of the seven entries in mte_modes[]. However, the TAP
plan only accounts for the array entries, producing:

  # Planned tests != run tests (7 != 8)

Include the basic read check in the plan so that all eight emitted results
are declared.

Reviewed-by: Mark Brown <broonie@kernel.org>
Fixes: 1f488fb91378 ("kselftest/arm64/mte: Add MTE_STORE_ONLY testcases")
Signed-off-by: Muhammad Usama Anjum <usama.anjum@arm.com>
---
Changes since v1:
- Use the selftests/arm64 subject prefix.
---
 tools/testing/selftests/arm64/mte/check_prctl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/arm64/mte/check_prctl.c b/tools/testing/selftests/arm64/mte/check_prctl.c
index f7f320defa7b9..d16a91117eef9 100644
--- a/tools/testing/selftests/arm64/mte/check_prctl.c
+++ b/tools/testing/selftests/arm64/mte/check_prctl.c
@@ -119,7 +119,7 @@ int main(void)
 	int i;
 
 	ksft_print_header();
-	ksft_set_plan(ARRAY_SIZE(mte_modes));
+	ksft_set_plan(ARRAY_SIZE(mte_modes) + 1);
 
 	check_basic_read();
 	for (i = 0; i < ARRAY_SIZE(mte_modes); i++)
-- 
2.47.3

