Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77287477987;
	Thu, 20 Aug 2026 15:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787240054; cv=none; b=HEi5w+yIBcP9CpFdw2KnTBmoS5Dt4zxRDntQ/v5dqR3+POI5avfFlTNCmcMF8FbCbV5iSnAk9oTguI50eFCXd+B1w8KoWwSkb7d+Xq4w1PLyXK792SvswLnx43sLJaxVYh1eIh1NaIoXG65wMHCR0APyphzxDyfeJEXJHBN3b0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787240054; c=relaxed/simple;
	bh=CvlsiaC9CEj3pqCNXtrP9ggl485N6tB8uCE1Z39SSLg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fA1w9LYCxZEV038yQ9jIPMLZkEah3UusBp6FQpdd1BUwwKBPfbk6vwttUlCOG4sISb5ZXhCZbGlHZvrSMdOtTiyZxTAfC7tMZo2/1NiIXFUNJPbzbfn7p4SKgANzDXBV/hw9FWSwTx2HDzEJofynK3JzdteyenF0l6QWELJAcBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Um62joE4; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Um62joE4"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F32501691;
	Thu, 20 Aug 2026 08:34:06 -0700 (PDT)
Received: from e142334-100.cambridge.arm.com (e142334-100.cambridge.arm.com [10.2.198.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 049683F763;
	Thu, 20 Aug 2026 08:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787240050; bh=CvlsiaC9CEj3pqCNXtrP9ggl485N6tB8uCE1Z39SSLg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Um62joE45H0VQ9/7gE3OxZ939G0p3RxMOG9cGPNx0c0qP3jmYB0NCT9QRGyAPaF3E
	 wgkyOnEYxEMu8Q2xTVVZqmxxe6T8aJhhYGu1VaPN+B06kgJjcm4+ObFbabuPo0CPK1
	 wc2/vvWCjJqzcnrzuaUw2ab7F0b80Yrf1PYs5Uec=
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
Subject: [PATCH 1/4] selftest/arm64: Print TAP header
Date: Thu, 20 Aug 2026 16:33:23 +0100
Message-ID: <20260820153331.2448875-2-usama.anjum@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260820153331.2448875-1-usama.anjum@arm.com>
References: <20260820153331.2448875-1-usama.anjum@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The test sets a TAP plan and emits a result but does not print the TAP
version header. Direct execution therefore starts with:

  1..1

instead of "TAP version 13", leaving the output malformed for TAP
consumers.

Print the kselftest header before the plan, matching the other arm64 MTE
tests.

Fixes: 29f080881601 ("kselftest/arm64: check GCR_EL1 after context switch")
Signed-off-by: Muhammad Usama Anjum <usama.anjum@arm.com>
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

