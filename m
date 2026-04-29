Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 224611ADFE4;
	Wed, 29 Apr 2026 14:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777473025; cv=none; b=YwL+x8nhb9X/R3f7ccObdNI2INx9PjXjbfgaapfWBBggYBopOqribvl2KUyg3NKHdYgfqeO02ilHb7lg1uhxNlMflzysbt11adqppbdtXlZl4ydHZQuTHzPQ+DMwyScg3NGccQuOhblKIet0+g6tPAd0eLg9mJ/bCm7lfAYSD3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777473025; c=relaxed/simple;
	bh=NeTi0hcg9k2DhscAT1pWi2bTz0jNI0ckGm9XSnnSZtg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=buCQdWyf/nkPm4lmouN6U+zlh8Ka6WupMXOnQ0dd9g6opa8TpQDVc6iahwyNtGfG2B21zGVTCyQk7EK8i0JItNGuxRtBCxTlBypwBW0j9bb6ZdBl6r5MoJdfVCejKUsQoYb3HEX2FQXcga+kGZ7tQtc2FERTbsumplB8+SGyobM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=GoHYCE88; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="GoHYCE88"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3A0C31BCB;
	Wed, 29 Apr 2026 07:30:15 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 266573F62B;
	Wed, 29 Apr 2026 07:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777473020; bh=NeTi0hcg9k2DhscAT1pWi2bTz0jNI0ckGm9XSnnSZtg=;
	h=From:Date:Subject:To:Cc:From;
	b=GoHYCE886zt5RciRweVcm4eYf4raaP/Z1bsOcZu9zlaWV/ApmSxpYRcUq/nwebda7
	 JnvoxAqOi66YbIhecxeQz3kJx0JF5gd3QCN1iY3Hy9Uo76Suwv9ry1tyrlynoLIljB
	 TM9BjdVGQ6zmQURohswcej8WlJax9YiT4R8i6hTE=
From: Leo Yan <leo.yan@arm.com>
Date: Wed, 29 Apr 2026 15:30:10 +0100
Subject: [PATCH v3] kselftest/arm64: Include <asm/ptrace.h> for user_gcs
 definition
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-selftests_arm64_gcc15-v3-1-7fd68be56b83@arm.com>
X-B4-Tracking: v=1; b=H4sIAPEV8mkC/4WOQQrCMBBFryJZW8mkSUxdeQ+REpJJG7CtJCUop
 Xc3LaJuVGb1Z3jvz0QiBo+RHDYTCZh89EOfQ7ndENPqvsHC25wJo0xSzqCIeHEjxjHWOnSS140
 xIAoQTjpp6d5aRTJ7Dej8bfWezjm3Po5DuK81CZbtP2OCIo+TyLgBELo65uvODN2if7LsF0ttB
 RVqoY1wL3b5JbHP/q8Olh2GQsktKlUq/XbM8/wAqf5YHzgBAAA=
X-Change-ID: 20260421-selftests_arm64_gcc15-15f6f6d07dd8
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>, 
 Mark Brown <broonie@kernel.org>, 
 Thiago Jung Bauermann <thiago.bauermann@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777473018; l=2139;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=NeTi0hcg9k2DhscAT1pWi2bTz0jNI0ckGm9XSnnSZtg=;
 b=nCAdQH9kseptMnD4vgoZwFhM1LLWcbMCmI7saEWkM1WwAGkQcUVAWjj0uLqHyD4gUknNIvGE4
 g+dYNpkD0Q6AlyE6QWMDsH4cj0WkXoYKotr/2ubEHr2K9BKpau8IKCq
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=

kselftest includes kernel uAPI headers with option:

  -isystem $(top_srcdir)/usr/include

Include <asm/ptrace.h> in libc-gcs.c for the definition of struct
user_gcs from the uAPI headers, and remove the redundant
definition in gcs-util.h.

Fixes: a505a52b4e29 ("kselftest/arm64: Add a GCS test program built with the system libc")
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
Changes in v3:
- Moved to include <asm/ptrace.h> in libc-gcs.c (Catalin).
- Removed the redundant definition in gcs-util.h (Catalin).
- Link to v2: https://lore.kernel.org/r/20260422-selftests_arm64_gcc15-v2-1-c0134de8838a@arm.com

Changes in v2:
- Refined commit log (Mark Brown).
- Moving header to gcs-util.h (Mark Brown).
- Link to v1: https://lore.kernel.org/r/20260422-selftests_arm64_gcc15-v1-1-0d919ea5ac5f@arm.com
---
 tools/testing/selftests/arm64/gcs/gcs-util.h | 6 ------
 tools/testing/selftests/arm64/gcs/libc-gcs.c | 1 +
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/tools/testing/selftests/arm64/gcs/gcs-util.h b/tools/testing/selftests/arm64/gcs/gcs-util.h
index c99a6b39ac147b4efbc9b5fbadb43daf4da2c85e..7a81bb07ed4b8b82ee90d93b336b26760703d55b 100644
--- a/tools/testing/selftests/arm64/gcs/gcs-util.h
+++ b/tools/testing/selftests/arm64/gcs/gcs-util.h
@@ -18,12 +18,6 @@
 
 #ifndef NT_ARM_GCS
 #define NT_ARM_GCS 0x410
-
-struct user_gcs {
-	__u64 features_enabled;
-	__u64 features_locked;
-	__u64 gcspr_el0;
-};
 #endif
 
 /* Shadow Stack/Guarded Control Stack interface */
diff --git a/tools/testing/selftests/arm64/gcs/libc-gcs.c b/tools/testing/selftests/arm64/gcs/libc-gcs.c
index 17b2fabfec386e523e788d8bcfcafa553c93bd9b..72e82bfbecc99e34da71d56cf5401c137d6e9a48 100644
--- a/tools/testing/selftests/arm64/gcs/libc-gcs.c
+++ b/tools/testing/selftests/arm64/gcs/libc-gcs.c
@@ -16,6 +16,7 @@
 
 #include <asm/hwcap.h>
 #include <asm/mman.h>
+#include <asm/ptrace.h>
 
 #include <linux/compiler.h>
 

---
base-commit: 4ee64205ffaa587e8114d84a67ac721399ccb369
change-id: 20260421-selftests_arm64_gcc15-15f6f6d07dd8

Best regards,
-- 
Leo Yan <leo.yan@arm.com>

