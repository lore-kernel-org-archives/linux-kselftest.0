Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2211613D886
	for <linux-kselftest@vger.kernel.org>; Tue, 14 Jul 2026 04:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.121
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784004007; cv=none; b=bvoUOIXZnqF5izdv1E3mK3fBDVtlnSbeQ1kwKXou0BCcV4/cflXfYQN1dPNxd6imOk9D+2ZtGYnPz+Ks2/hIDEYAtMdfVz3/eg8r0scMq4wMXoUU0KUgVt4AcbFy3kEfuuPFQS74AeseRSnyBiArreFkJN9tdPHqFtLfXghv2r8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784004007; c=relaxed/simple;
	bh=9qVrGhPdhq9FjsNNSsb71bZv8WukBF3ygKxpSD8P4E8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h9XY+YDJnDCpAYuMa1r+nbFnVt4PYtkFldBNVxRSzHfWXoQLs0yMpOT2HGiTG416JWI1UwD9AJ9/GXKbDbxQPP+t92F5yN+NociHHAxVEyqXM75bMlG4BmcH20PdMo5HLkGLr3TP2t/wnqkZc9Wmwyv5eZLdQC75C6J3IWKmcWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=EbS3oRv5; arc=none smtp.client-ip=185.125.188.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="EbS3oRv5"
Received: from hwang4-g16.DHCP (unknown [58.248.157.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 7F36B40373;
	Tue, 14 Jul 2026 04:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1784003477;
	bh=Gi0KRZCr7B+KqdLo/T8hwC2wZEnpSHWjct+XZQ6HPwM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=EbS3oRv5AWR9hZU3JpzBgp7gMoSMfw4y/wItycZ5pi6/8h7p4/Qb65NN6KhIcw/i0
	 /pY9IbAlocArtUIV/+cWdOlHuBK+4dtWfTiVcr/qMJa0yX2LAakkUhpEHdkBChpekC
	 fFqdcB+8J5LlQ+E76uxrst6JCLy2LnzTbHwSm4YtC5sSSBRP29MXrMY8aDqMhfp0nt
	 6C0L6sgZkEHSi+GCMPDfRdIJ85Tdkq9JD62cAj8w/CXxIZuAUhbbOHWiKo0ipBwXmZ
	 Zou3FWJ4gwDCRrMhKD7ycdUOOjiRTjEFh4tvdWoTAMpJtT9xsu2ro2k2tXt9l/kHBg
	 +fXVty4PavAz0aOwnbllF1me99glKuKhm2ErnaIJFGv9y6D/2veHmpmkcd048cosL5
	 9JOAGca8BDalfXSU+kCg7gW7zMyRvk8ucZ3YauhKr16X7B8u4s08Y8XsmkDL38uCc9
	 fgOoF5jWiDkJbQ6Bhz2ufN/ig4/5tTxxJfB375k3KIirIN4OLRY1LmE/B6rLslwm80
	 GiqjAv1Z9LmIVcSkllqwkj2IHvtHBCsvEcXoB6DQkF4/hEfaO4WZATk13LdQaXrV94
	 LUZz69cWkAsqR4N7y9EXv/2NlPsGfo+me+EF4uKmyuAtvbXZ6tIX0bUWtoYrvREj3q
	 Biez+F549EY7NDxFV9ET2U2g=
From: Hui Wang <hui.wang@canonical.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	shuah@kernel.org,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	debug@rivosinc.com,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: hui.wang@canonical.com
Subject: [PATCH] kselftest/riscv: Improve building under native riscv64 environment
Date: Tue, 14 Jul 2026 12:31:08 +0800
Message-ID: <20260714043108.24114-1-hui.wang@canonical.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When we build the kselftest natively, we usually don't pass an ARCH=
parameter. In this case if I build kselftest/riscv under a riscv64
environment, the testcase will not be built at all because 'uname -m'
returns riscv64 instead of riscv.

    make -C tools/testing/selftests TARGETS=riscv
    make: Entering directory 'linux/tools/testing/selftests'
    make[1]: Entering directory 'linux/tools/testing/selftests/riscv'
    make[1]: Leaving directory 'linux/tools/testing/selftests/riscv'
    make: Leaving directory 'linux/tools/testing/selftests'

This issue can be fixed by getting ARCH from scripts/subarch.include,
whose SUBARCH normalizes 'riscv64' to 'riscv'. This also aligns with
how other selftests (e.g. arm64, x86) already resolve ARCH.

Signed-off-by: Hui Wang <hui.wang@canonical.com>
---
 tools/testing/selftests/riscv/Makefile | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/riscv/Makefile b/tools/testing/selftests/riscv/Makefile
index 5671b4405a12..43eddb919705 100644
--- a/tools/testing/selftests/riscv/Makefile
+++ b/tools/testing/selftests/riscv/Makefile
@@ -1,8 +1,12 @@
 # SPDX-License-Identifier: GPL-2.0
 # Originally tools/testing/arm64/Makefile
 
+# A proper top_srcdir is needed by KSFT(lib.mk)
+top_srcdir = $(realpath ../../../../)
+
 # When ARCH not overridden for crosscompiling, lookup machine
-ARCH ?= $(shell uname -m 2>/dev/null || echo not)
+include $(top_srcdir)/scripts/subarch.include
+ARCH ?= $(SUBARCH)
 
 ifneq (,$(filter $(ARCH),riscv))
 RISCV_SUBTARGETS ?= abi hwprobe mm sigreturn vector cfi
@@ -12,9 +16,6 @@ endif
 
 CFLAGS := -Wall -O2 -g
 
-# A proper top_srcdir is needed by KSFT(lib.mk)
-top_srcdir = $(realpath ../../../../)
-
 # Additional include paths needed by kselftest.h and local headers
 CFLAGS += -I$(top_srcdir)/tools/testing/selftests/
 
-- 
2.43.0

