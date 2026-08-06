Received: from canpmsgout11.his.huawei.com (canpmsgout11.his.huawei.com [113.46.200.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9940E428464;
	Thu,  6 Aug 2026 11:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786014933; cv=none; b=SM+ibHA9JmRhGEqDG2xOE2yoeJCao6f/rcfh9o0gwG+FOcWsLV+lpr3wNpL3mzgxjCMDvydYF1Z/QzbdfU3zqoHBpxxrzlrJzqce39KEPii/g/4l5CuYeSFNl7++mBcLkmnjaQzqrYykgHQZrEH3s1ycEpLDMLVW2Ggbiq2ss48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786014933; c=relaxed/simple;
	bh=pQTFtNONy7t54BpNTXiyF9tZMoR+ik4uWp06Q/w9WoA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cZR5BX0BnsF3hEyQbmUg/h266VRjVu/DmssJ4WP4GaaeRGOggfNT6t8ZMIR245O9RrPI4jspmWsA9KN5IAnVAxZHkh7aA9ssH0R9LMzIvHiTkVUd9JDJEFSd/4e32a1WY4hrA4VAjMLS6RMF0dc0SINJJ8Y4lQVoBrO8lCWAXR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=vLURiIrR; arc=none smtp.client-ip=113.46.200.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="vLURiIrR"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=OUuBkFxHQvwLfZspjM/sL2r1bsrZ8568UGlPJR00gZM=;
	b=vLURiIrRe2aniUPa3vhtR2xoPLvnEnOkMzsE7OFjqr5v7rpJ89POYkYCTV53/q3RMr8tz5Z/l
	3xVIxPIsorJZPvcsKRC3mqsJ4eV/DCuS+IXsoSUrXXvErQOBF2kGMp2InXpMtFB7+Zh6gLv75lj
	qK2PKr/uE5GVtG92FO/XOZM=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4hG4Fg6cPMzKm9N;
	Thu,  6 Aug 2026 19:05:43 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 7103240586;
	Thu,  6 Aug 2026 19:15:18 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 6 Aug
 2026 19:15:17 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <shuah@kernel.org>,
	<ruanjinjie@huawei.com>, <broonie@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kselftest@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH RESEND] kselftest/arm64: Fix abi test compilation errors
Date: Thu, 6 Aug 2026 19:15:46 +0800
Message-ID: <20260806111546.42042-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 dggpemf500011.china.huawei.com (7.185.36.131)

The arm64 ABI selftests fail to compile due to missing include paths
for kernel headers, causing errors like incomplete type struct sock_filter
and implicit BPF macro declarations.

Add $(KHDR_INCLUDES) and -I$(top_srcdir)/tools/include to CFLAGS
to resolve the header search path. Also remove the hardcoded __NR_write
macro and include <asm/unistd.h> to obtain the correct syscall number.

Fixes: 21e37da12071 ("kselftest/arm64: Add testcase for SECCOMP_RET_TRACE orig_x0 bypass")
Fixes: 2fcbc4adf997 ("kselftest/arm64: Add seccomp ptrace x0 bypass test")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/r/202608021842.jp6IBrFi-lkp@intel.com/
Suggested-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
v1->resend:
- Cc public email.
---
 tools/testing/selftests/arm64/abi/Makefile                   | 2 ++
 tools/testing/selftests/arm64/abi/seccomp_ptrace_x0_bypass.c | 5 +----
 .../selftests/arm64/abi/seccomp_ret_trace_x0_bypass.c        | 5 +----
 3 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/arm64/abi/Makefile b/tools/testing/selftests/arm64/abi/Makefile
index a01d3806eba8..e91d4cdf17ad 100644
--- a/tools/testing/selftests/arm64/abi/Makefile
+++ b/tools/testing/selftests/arm64/abi/Makefile
@@ -1,6 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0
 # Copyright (C) 2021 ARM Limited
 
+CFLAGS += $(KHDR_INCLUDES) -I$(top_srcdir)/tools/include
+
 TEST_GEN_PROGS := hwcap ptrace syscall-abi tpidr2 seccomp_ptrace_x0_bypass seccomp_ret_trace_x0_bypass
 
 include ../../lib.mk
diff --git a/tools/testing/selftests/arm64/abi/seccomp_ptrace_x0_bypass.c b/tools/testing/selftests/arm64/abi/seccomp_ptrace_x0_bypass.c
index a00621a8949c..4ee8e5aaad6f 100644
--- a/tools/testing/selftests/arm64/abi/seccomp_ptrace_x0_bypass.c
+++ b/tools/testing/selftests/arm64/abi/seccomp_ptrace_x0_bypass.c
@@ -34,13 +34,10 @@
 #include <linux/elf.h>
 #include <linux/filter.h>
 #include <linux/seccomp.h>
+#include <asm/unistd.h>
 
 #include "kselftest.h"
 
-#ifndef __NR_write
-#define __NR_write 64
-#endif
-
 #define EXPECTED_TESTS 1
 
 #if __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__
diff --git a/tools/testing/selftests/arm64/abi/seccomp_ret_trace_x0_bypass.c b/tools/testing/selftests/arm64/abi/seccomp_ret_trace_x0_bypass.c
index 3a69f53f4f88..a23081763328 100644
--- a/tools/testing/selftests/arm64/abi/seccomp_ret_trace_x0_bypass.c
+++ b/tools/testing/selftests/arm64/abi/seccomp_ret_trace_x0_bypass.c
@@ -44,13 +44,10 @@
 #include <linux/filter.h>
 #include <linux/seccomp.h>
 #include <linux/ptrace.h>
+#include <asm/unistd.h>
 
 #include "kselftest.h"
 
-#ifndef __NR_write
-#define __NR_write 64
-#endif
-
 #define PTRACE_EVENT_MASK(status) ((status) >> 16)
 
 #if __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__
-- 
2.34.1

