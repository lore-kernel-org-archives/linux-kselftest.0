Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A7873D9023;
	Tue, 21 Apr 2026 14:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776782602; cv=none; b=onJlQYolojdpbPXsGQArJTWFzVs6yOUW4W4bkZVYzogHUQ+WPpK9jKdOkAm2oUzPA44T5U3mGrWLCrHZPJmsunpTuAr8cI2PBO02D1VF6PhBcZWRgii4yGvx2CgVDm3O/Oa4b3ECNI1QJte7+/eYYvXx0ziFNBtz74IvEIWAitw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776782602; c=relaxed/simple;
	bh=99NNtnuLxi2s8quGtXHfvn6Pw2cy8v6tt353X7vUA+c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SQI7naa3Kz1u4WqGVZ7xmD+Ym06PpJQwEXDZjdfVyyREtCbb+rcgXzhW8G+5JE5Jp2gTTZ11BYA5ceKItAeu7WWWYv09lg7P0wM8o1EuWfXWMH5u66NW+bgbN6euMEwlR1RmwoB6cvNhdh+RylEmNUle84LmMPDIflotSY4J76Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Ig8P47/V; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Ig8P47/V"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 14740302D;
	Tue, 21 Apr 2026 07:43:15 -0700 (PDT)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3F2543FAF5;
	Tue, 21 Apr 2026 07:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776782600; bh=99NNtnuLxi2s8quGtXHfvn6Pw2cy8v6tt353X7vUA+c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ig8P47/VPrUc6cbbK0AOOhF1x2CHw/ZnSTD6dKK4E0oK6LFtGMBmT6xWeQtqr+lM2
	 mzY7JY+XKA5hupSoLRUGoUDCibnxhVNuzniRs0blD2R2JRT9yo8tnI5XbEkb4oGKlY
	 td3grQ0QQNuq4SjWG30c8HYBhc++7h25IWztbqs4=
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
Subject: [PATCH 2/4] kselftest/arm64: Add POE as a feature in the signal tests
Date: Tue, 21 Apr 2026 15:42:50 +0100
Message-ID: <20260421144252.1440365-3-kevin.brodsky@arm.com>
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

Add the POE feature to the signal tests framework, to allow tests to
require it.

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

