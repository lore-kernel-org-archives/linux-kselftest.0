Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795085791;
	b=x9u2rZrV8WfqPsMBWm+wdkb79KWKt5T54pHYjZ48ps/UxqNRdtmuTrzVgCAHq25DkU6T
	 DyPF7p0hLJYnshgqMGV4kLgOBRfTUJMPZaEG+SIEyN9svDJTKO6NOO0JaPSogNhN3OLbZ
	 5kpx6tafqS/AyK1fJVelyes0lRm+f1uJy8yh052ThPQKHO1CSyopdEr8uK0/oGIfO9bDN
	 SMw7XgmbIqjUoljKyzv8f9PHnffIdcs/GHqZjSI91L7kIQ0n9aUxzEc3AkMqy2BzVCjv/
	 3wd+pp0Mg1nSaQkbJh2UPXxXF33u0HBZW4eUxU0oaDZZFhcs4G9F7UHiuvk+2rnTeew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795085791;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=+QqOX6qRKz2jl5Fwuo4iZMVb3P/jIaq+xtjqBa/w/Os=;
	b=x1Dhwia7jA4zDJk5QEqUl50z7PTybTisYJuSS1unPCRWGL2H1Rc0bb0a9cI3uONTbqGB
	 cgfmBl45hNQfbvya83yfHn6MkqbD2y4/EdRTHCCD11me2+44gD04RIizzAIaxoQsLkmxP
	 fzaroHGfgaYELbhQw0RFqao2phV0Rq52FGhpXqWEUAJYiJGwtn9yXsGMTOyM1lwQUGp0/
	 Ox3BF7jqJnhoUf5RDNBCivKg47GvYX+JiRNWJzjB3DIUwscnhp3YftdIKY+GYqpr127Ye
	 L8jqYv6XX1XM7PrYNNv8I9fh+hio4loj4mqN/bz2GsxmiVUw6lG5Fwmrxx8fbeNqwDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=kL5bGxVv;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD355606A338;
	Thu, 19 Nov 2026 10:56:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD355606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=kL5bGxVv
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8377E1C01;
	Thu, 19 Nov 2026 02:56:27 -0800 (PST)
Received: from localhost.localdomain (e123572-lin.cambridge.arm.com [10.2.208.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E40313F673;
	Thu, 19 Nov 2026 02:56:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795085790; bh=xNlTLs9cWFXvnfMSaMiLNCkTmQLfRvsHS+nhbY131uw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kL5bGxVvzQlOYxSuoqV607E849pAUgvIQrzEqNIfgseJjJkwYEDT7n7ElR92Jo3r2
	 BSy+sXR4EHKRNkuh/kF4fi5SbKBIjQYWKijcztCsFu54VO13dZF7tmETWAvK5kiEe8
	 MEeRYmIccssfQ8DUOud1b3VG/KymjQ4TxuxgKydo=
From: Kevin Brodsky <kevin.brodsky@arm.com>
Date: Thu, 19 Nov 2026 10:56:19 +0000
Subject: [PATCH v3 2/2] kselftest/arm64: Add test for atomic futex uaccess
 with POE
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-poe_futex-v3-2-0baeb0aee0d9@arm.com>
References: <20261119-poe_futex-v3-0-0baeb0aee0d9@arm.com>
In-Reply-To: <20261119-poe_futex-v3-0-0baeb0aee0d9@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Kevin Brodsky <kevin.brodsky@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Joey Gouly <joey.gouly@arm.com>, 
 Linu Cherian <linu.cherian@arm.com>, Mark Brown <broonie@kernel.org>, 
 Shuah Khan <shuah@kernel.org>, Will Deacon <will@kernel.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795085784; l=4303;
 i=kevin.brodsky@arm.com; s=20260427; h=from:subject:message-id;
 bh=xNlTLs9cWFXvnfMSaMiLNCkTmQLfRvsHS+nhbY131uw=;
 b=XQ8aUEdxlmqgGKIDrBG4kTQAb6t014FYWiKzGv18UpCYblROeuzoE1BsWT0fLYIFTUgchpMDt
 xiYrdm2I1C2BnM3n36tpfRdYG/eEQUksbzBPzr3+X3zU1swX+vmZQd+
X-Developer-Key: i=kevin.brodsky@arm.com; a=ed25519;
 pk=N2QG+eJKrvkNovwhhwJhnJ4+ScVfsGCHldmqLfcMTFs=

Add a new test to ensure that atomic futex uaccess succeeds on
memory mapped with a non-default POIndex/pkey.

In the absence of FEAT_LSUI, atomic futex uaccess operations such as
those triggered by FUTEX_WAKE_OP use privileged atomic load/store
instructions and thus cannot have user permission overlays (POR_EL0)
applied. In case the kernel enabled POE at EL1, it is worth
checking that kernel overlays (POR_EL1) are not applied to these
accesses, as that would fail for non-zero pkeys.

Note that if such misconfiguration occurs, futex_wake_op() may get
stuck in an infinite loop because futex_atomic_op_inuser() will fail
but fault_in_user_writeable() will still report success.

Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 tools/testing/selftests/arm64/Makefile        |  2 +-
 tools/testing/selftests/arm64/poe/.gitignore  |  2 +
 tools/testing/selftests/arm64/poe/Makefile    |  6 +++
 tools/testing/selftests/arm64/poe/poe_futex.c | 70 +++++++++++++++++++++++++++
 4 files changed, 79 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/arm64/Makefile b/tools/testing/selftests/arm64/Makefile
index e456f3b62fa1..bad5c3b33dce 100644
--- a/tools/testing/selftests/arm64/Makefile
+++ b/tools/testing/selftests/arm64/Makefile
@@ -4,7 +4,7 @@
 ARCH ?= $(shell uname -m 2>/dev/null || echo not)
 
 ifneq (,$(filter $(ARCH),aarch64 arm64))
-ARM64_SUBTARGETS ?= tags signal pauth fp mte bti abi gcs
+ARM64_SUBTARGETS ?= tags signal pauth fp mte bti abi gcs poe
 else
 ARM64_SUBTARGETS :=
 endif
diff --git a/tools/testing/selftests/arm64/poe/.gitignore b/tools/testing/selftests/arm64/poe/.gitignore
new file mode 100644
index 000000000000..0dce4a3aa38b
--- /dev/null
+++ b/tools/testing/selftests/arm64/poe/.gitignore
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+poe_futex
diff --git a/tools/testing/selftests/arm64/poe/Makefile b/tools/testing/selftests/arm64/poe/Makefile
new file mode 100644
index 000000000000..2af2bbf3f6d3
--- /dev/null
+++ b/tools/testing/selftests/arm64/poe/Makefile
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0
+
+CFLAGS += $(KHDR_INCLUDES)
+TEST_GEN_PROGS := poe_futex
+
+include ../../lib.mk
diff --git a/tools/testing/selftests/arm64/poe/poe_futex.c b/tools/testing/selftests/arm64/poe/poe_futex.c
new file mode 100644
index 000000000000..65c5be8fb9ec
--- /dev/null
+++ b/tools/testing/selftests/arm64/poe/poe_futex.c
@@ -0,0 +1,70 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <stdint.h>
+#include <stdlib.h>
+#include <unistd.h>
+
+#include <linux/futex.h>
+#include <sys/syscall.h>
+
+#include "kselftest_harness.h"
+
+static int sys_pkey_alloc(unsigned long flags, unsigned long init_val)
+{
+	return syscall(__NR_pkey_alloc, flags, init_val);
+}
+
+static int sys_pkey_mprotect(void *ptr, size_t size, int prot, int pkey)
+{
+	return syscall(__NR_pkey_mprotect, ptr, size, prot, pkey);
+}
+
+static int sys_pkey_free(int pkey)
+{
+	return syscall(__NR_pkey_free, pkey);
+}
+
+static int futex_wake_op(uint32_t *uaddr, uint32_t val, uint32_t val2,
+			 uint32_t *uaddr2, uint32_t val3)
+{
+	return syscall(SYS_futex, uaddr, FUTEX_WAKE_OP, val, val2,
+		       uaddr2, val3);
+}
+
+/*
+ * Trigger some atomic uaccess on a page mapped with a non-default pkey.
+ *
+ * This ensures that such access is not mistakenly checked against the
+ * kernel's POR_EL1 register.
+ */
+TEST(poe_futex)
+{
+	int ret, pkey;
+	void *ptr;
+	size_t size = getpagesize();
+
+	pkey = sys_pkey_alloc(0, 0);
+
+	if (pkey == -1 && errno == ENOSPC)
+		SKIP(return, "pkeys are not supported");
+
+	ASSERT_GT(pkey, 0);
+
+	ptr = mmap(NULL, size, PROT_READ | PROT_WRITE,
+		   MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	ASSERT_NE(ptr, MAP_FAILED);
+
+	ret = sys_pkey_mprotect(ptr, size, PROT_READ | PROT_WRITE, pkey);
+	ASSERT_EQ(ret, 0);
+
+	/*
+	 * There is no one to wake up so this syscall boils down to *(ptr+4) = 0
+	 * (arch_futex_atomic_op_inuser() called with FUTEX_OP_SET and op_arg=0).
+	 */
+	ret = futex_wake_op(ptr, 1, 1, ptr + sizeof(uint32_t), 0);
+	ASSERT_EQ(ret, 0);
+
+	sys_pkey_free(pkey);
+	munmap(ptr, size);
+}
+
+TEST_HARNESS_MAIN

-- 
2.56.0

