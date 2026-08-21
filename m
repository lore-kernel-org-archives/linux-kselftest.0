Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7772D4C77D3;
	Fri, 21 Aug 2026 14:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787321772; cv=none; b=O3m1tI2j4nrhT6ZfgrOUo+SdkE8wvFP39UFrLJIEa+SqnMaL7xwRp0Sjd6NdqjgcP4gLHrmzZhZpOnfXyUS/kEuqYexq1NB17+YAPgiq/Ybhcll4gmaiGqvWhN5jwM1b2Ut1zdvaDxd426aA2DpMfiDWiM4HVRy/q/D7+RSZ4y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787321772; c=relaxed/simple;
	bh=P7OYcyFhp0FOazsEulZVO/ysmQGGewaznoTVnl08A+w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=djuFzxbKIZftWYaKxQw6QZeeP1+zSgyLMe4dGlcq4YoeALmuCMFH8yNmb/YZw549gVTUKlckn6CZf8om7uwZmOazxDeCCzi1YmI606ha4v4LVd2NtAtn+gSu/qbBMh9GcI5p8FRdFCuHkOT22zqKDccBFpnHrHdiaq3sli71rj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=DZsXHl8o; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="DZsXHl8o"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0C4E1153B;
	Fri, 21 Aug 2026 07:16:07 -0700 (PDT)
Received: from e142334-100.cambridge.arm.com (e142334-100.cambridge.arm.com [10.2.198.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BA7AD3F85F;
	Fri, 21 Aug 2026 07:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787321770; bh=P7OYcyFhp0FOazsEulZVO/ysmQGGewaznoTVnl08A+w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DZsXHl8o5s1wdXyMnL/7ixTPhIj6HJ2FLidCCW0srvfe6JG9F/Yk1W0ZcMQnH6i9k
	 F4w8IC2EsaauQW/Sl+gzq8JT4NNIXaF6rb9IR1IvP3SuN+KvKkmzf956rnNNsbUJK5
	 i0vSw0Ft/UiJ0aTj26Cdxge8VtDs0oZeBl3pUpsQ=
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
Subject: [PATCH v2 4/5] selftests/arm64: Fix MTE prctl TAP plan
Date: Fri, 21 Aug 2026 15:15:52 +0100
Message-ID: <20260821141556.4065894-5-usama.anjum@arm.com>
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

