Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1059037F72C;
	Wed, 22 Apr 2026 17:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776877310; cv=none; b=ESiFASrNOmiggBjz9nPhMtvfw0axtmOG3xwhMs2zeAJgr+zZ1OGvwqmMvu6yfJglFBS1U+Lm032rVTLnNFAyPKrHAHYY9y4HtudvtgvhQzJvsCkOhAp8aCBaRY+3Bk9vR4Mr2v/hHm/Yz4H2yhfhYbZV0FQijLW1QiQMPZ/OjFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776877310; c=relaxed/simple;
	bh=Ag1z714621KJWO6QLszbpXo2w9rPzOsLA0Qccy4x9ww=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=qiGhyafHVhpTeJxzM8EI6MW2tTlSApnUwwkN99OuXZJUVN7PlWaqifG7p75AFKPjT30OGqDkSOLjjUgQACYnBUJ9U4z5gLs0bJW9fgTfsekORPWn6ga8ec5fuLvdELvKu0dji7aXdwkuXRpdmu1NasqOFNe1rLHOo1XLpfLMd74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=WfhZ5nIv; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="WfhZ5nIv"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D3E1F1F37;
	Wed, 22 Apr 2026 10:01:42 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 280343F23F;
	Wed, 22 Apr 2026 10:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776877308; bh=Ag1z714621KJWO6QLszbpXo2w9rPzOsLA0Qccy4x9ww=;
	h=From:Date:Subject:To:Cc:From;
	b=WfhZ5nIvh4+srijbQLeL9vlDBmWVvbBi+1pNt6QeMrKzpF5pBoV374YsgSuxd34DK
	 8ov9UnxJ0xxIbnz1yX8GnCW1K7+o5OL7arHcDi85OZP5zmb2J0lYjaSzYVXBPDbgfl
	 OtOvtFiDsV4ysvLpoE2L9Bkij2Zfomh5dZwYUv4Y=
From: Leo Yan <leo.yan@arm.com>
Date: Wed, 22 Apr 2026 18:01:39 +0100
Subject: [PATCH] kselftest/arm64: Fix build failure with GCC-15
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260422-selftests_arm64_gcc15-v1-1-0d919ea5ac5f@arm.com>
X-B4-Tracking: v=1; b=H4sIAPL+6GkC/4WNXQrDIBCErxL2uZasqP156j1KCKJrIjQ/uBJag
 nevzQXKPH0zzMwOTCkSw73ZIdEWOS5zBTw14EY7DySirwyylaZVEgXTK2TizL1Nk1H94BxqgTq
 YYHx78f4KtbsmCvF97D67ymPkvKTPcbPhz/23uKGoCoakcoja3h41Pbtlgq6U8gWavh75uAAAA
 A==
X-Change-ID: 20260421-selftests_arm64_gcc15-15f6f6d07dd8
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>, 
 Mark Brown <broonie@kernel.org>, 
 Thiago Jung Bauermann <thiago.bauermann@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776877306; l=1427;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=Ag1z714621KJWO6QLszbpXo2w9rPzOsLA0Qccy4x9ww=;
 b=/KKGMRaK6Jw8UqSVDKa5FC28/dFLr10q+zpEQ9zp/SxTOily3TNBjAHGDaKskULHLkaIZ3goB
 5IoBo6hedfBBD5PvOY3cd0Fsr17EQT6SaZJGSLRRUxGrtQgVrdMGjlS
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=

Building on Debian sid with GCC 15 fails:

    CC       libc-gcs
  libc-gcs.c: In function 'ptrace_read_write':
  libc-gcs.c:142:25: error: storage size of 'child_gcs' isn't known
    142 |         struct user_gcs child_gcs;
        |                         ^~~~~~~~~
  libc-gcs.c:142:25: warning: unused variable 'child_gcs' [-Wunused-variable]

GCC-15 defines NT_ARM_GCS in the toolchain headers, causing gcs-util.h
to skip its fallback definition of struct user_gcs. This leads to the
compiler error.

Fix this by including <asm/ptrace.h> to provide the proper definition.

Fixes: a505a52b4e29 ("kselftest/arm64: Add a GCS test program built with the system libc")
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/testing/selftests/arm64/gcs/libc-gcs.c | 1 +
 1 file changed, 1 insertion(+)

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

