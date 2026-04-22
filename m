Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 037E031F995;
	Wed, 22 Apr 2026 17:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776879791; cv=none; b=qMIFmwd1Cmwx77lzEQnqiACX5TBzTJGPdqe5YNuEAJ9HyViQV9LkjG2kmmRLXAMbqjHadkK14NSfjSwKyTiW/4omBwterB+RhgXQn4NWGUdA/VqVvq/VgnxVLF69DJQCBjY2V35BX6yi4J/XdoNyb5WsD7frggU3vbCKiYvW9n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776879791; c=relaxed/simple;
	bh=OD5QrNLGVy+fEi3oiasM4441515XOrsFM0gTO7JatFM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=prwJxmeyW+Ln222BQmcOAYccW7M93nUqM1cXFKakgg+Mz37rn36C4lYL/lBx3rc5oYvE41312t6T5Nds1AFTUJq32e44ZBLk0bhvpd+7J7hT1flnHxmRTjrxNnLP6oNjfAeBD9hUcDIWSgfK6JlJkCnb4wxLgWHHM4FTP1QvGvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=viOR4vre; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="viOR4vre"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C28361E4D;
	Wed, 22 Apr 2026 10:43:03 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 15CAF3F641;
	Wed, 22 Apr 2026 10:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776879789; bh=OD5QrNLGVy+fEi3oiasM4441515XOrsFM0gTO7JatFM=;
	h=From:Date:Subject:To:Cc:From;
	b=viOR4vre1hbR8DXudh803GvGFD1B3tYM07XGjMnQPgaQUuwIRv/J6THMaZoh8KIY5
	 b3hVgQGy/1oazano3iRqt5l+lr2SI6jAz5hk2AGWtQgLikmumSssq0nrPW+rotF5Rq
	 xWW6e015aZGQ8x1lE0VAdAA5sZElpTsLJBVzR/88=
From: Leo Yan <leo.yan@arm.com>
Date: Wed, 22 Apr 2026 18:42:54 +0100
Subject: [PATCH v2] kselftest/arm64: Fix build failure with GCC-15
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260422-selftests_arm64_gcc15-v2-1-c0134de8838a@arm.com>
X-B4-Tracking: v=1; b=H4sIAJ0I6WkC/4WNwQrCMAxAf2X0bKUpbXWe/A8Zo7TpVnCbNGMoo
 /9uN8SjktNLeC8rI0wRiV2qlSVcIsVpLCAPFXO9HTvk0RdmUkgjlAROeA8z0kytTYNRbeccaA4
 6mGC8OHl/ZsV9JAzxuXdvTeE+0jyl1/5mgW37r7gALxMMSuUAtK2v5Xp007DlP6785QpfQ41WW
 6fD121yzm8ylrh39AAAAA==
X-Change-ID: 20260421-selftests_arm64_gcc15-15f6f6d07dd8
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>, 
 Mark Brown <broonie@kernel.org>, 
 Thiago Jung Bauermann <thiago.bauermann@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776879788; l=1657;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=OD5QrNLGVy+fEi3oiasM4441515XOrsFM0gTO7JatFM=;
 b=BHlrn2gPuJk7Hm7WAa21pX6Bkogi8AxrTHk3EGTk6oYFKUUBAAHbQOP4/N5dhH88CQEbfP0ed
 nx7BJMxIuX2BfkFIYNWWwL/Sv5a+fBgeElNmG3MVZvypYZGfVfhYi4D
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=

Building on Debian sid with GCC 15 fails:

    CC       libc-gcs
  libc-gcs.c: In function 'ptrace_read_write':
  libc-gcs.c:142:25: error: storage size of 'child_gcs' isn't known
    142 |         struct user_gcs child_gcs;
        |                         ^~~~~~~~~
  libc-gcs.c:142:25: warning: unused variable 'child_gcs' [-Wunused-variable]

For GCC-15, NT_ARM_GCS is defined in the libc header, causing gcs-util.h
to skip its fallback definition of struct user_gcs. This leads to the
compiler error.

Fix this by including <asm/ptrace.h> to provide the proper definition.

Fixes: a505a52b4e29 ("kselftest/arm64: Add a GCS test program built with the system libc")
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
Changes in v2:
- Refined commit log (Mark Brown).
- Moving header to gcs-util.h (Mark Brown).
- Link to v1: https://lore.kernel.org/r/20260422-selftests_arm64_gcc15-v1-1-0d919ea5ac5f@arm.com
---
 tools/testing/selftests/arm64/gcs/gcs-util.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/arm64/gcs/gcs-util.h b/tools/testing/selftests/arm64/gcs/gcs-util.h
index c99a6b39ac147b4efbc9b5fbadb43daf4da2c85e..f583d4dbd0bfd964e08cf40b3951664c70bb031a 100644
--- a/tools/testing/selftests/arm64/gcs/gcs-util.h
+++ b/tools/testing/selftests/arm64/gcs/gcs-util.h
@@ -7,6 +7,7 @@
 #define GCS_UTIL_H
 
 #include <stdbool.h>
+#include <asm/ptrace.h>
 
 #ifndef __NR_map_shadow_stack
 #define __NR_map_shadow_stack 453

---
base-commit: 4ee64205ffaa587e8114d84a67ac721399ccb369
change-id: 20260421-selftests_arm64_gcc15-15f6f6d07dd8

Best regards,
-- 
Leo Yan <leo.yan@arm.com>

