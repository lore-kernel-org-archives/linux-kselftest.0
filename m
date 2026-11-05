Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793883426;
	b=5elI8CoJaXhct+iyj5QUoiAps2GwRf6HMAFfBqB5vc9rrgdzZtjaNqiL79M1ZD3QZt4x
	 w5TXlX0V5qs+aes8ehUHkN+pSawekVlDdaU4xWK2Fg4PcRkDmUx41z8/0kB+U+8MiyhFf
	 cec6hiCH6365rEuRJaywuQtIx/l+M0NXN/fEVd5NvxYmN238uFuGRcuO63JqhSTT4khMs
	 zujej7IS+m4hVH/HBjHnEcKyGzfPL3wq9lE557785HveJeSU7OSQHp4IcFDUPI5tu9uTp
	 O4Ir0J8sHo7nNyTvgR47AbJkKSq2B7inMSRMhBUdFGb9X6bud7x9dtRCHpLlRKm2OkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793883426;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=pUU6GZFqMSNYXOwJs6Za3b0uigEcrfPKq411zI1Oteg=;
	b=mY6qBOkP/49fYniijv7cgPvuM8kYXuCsUW4Rn1TbejMDuQ+rkrbUR2+Ze8QcthoxPwFO
	 EyQwEeIHnzyxcGKOnTKXbPGMkEbhuXAd7DKJ9yGg/9Q6arqW0zksm5PtArG0hSdB7OxqI
	 DXbQQPZmeBo7864VgwkMLU2SvbX5mCLVamcZ/E9N4OETd9eeHwQr4UWG8wnD6SSRJLimB
	 GOjUsrrm/du+k4XxV0TOjo+BTVm6Dph9JPFsYkuaSBnYyNvbYtFqcLit5lozqwkevHDNc
	 Ked0wMViVqYqayJfYzqz1ANa+f0B3/kR/B+b90LfPXyIoMkPd0n0HqRdWtd2ESseABw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aUZTqZgG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06518606D801;
	Thu,  5 Nov 2026 12:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aUZTqZgG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E932D1F00A1A;
	Thu,  5 Nov 2026 12:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793883425;
	bh=pUU6GZFqMSNYXOwJs6Za3b0uigEcrfPKq411zI1Oteg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=aUZTqZgGZjpNIVQkZlEbARfTHj4j5rWM8onxafzORfzfz938Lcgvm/wANgl+x1UNA
	 GVoKKpIJQa0L7cy0xhS0cvVXZzER1RtAAYPOoqIZtb8OFRTeX2fP7TAWaBGJi16yJM
	 G9xq3GEK686LoTzj3iOsybnaTCVjUK1G2uClO/cdcdtNGxrFiNlHif2WuQrmna5A/Q
	 y47huBo6LX9NV3O+zUw0ypSN0iMsv8It+3mqJSkMUmaK4AZ4SuulY5PrFIzsaetC+f
	 8j5/+uawtWF5DaD9n91ucfQfjaTzX+Z9ATz4/RQL5797ZzmNO13QPKo27XvJe9sf64
	 jWtkEQXAi+0mQ==
From: Sasha Levin <sashal@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <shuah@kernel.org>
Cc: David Woodhouse <dwmw@amazon.co.uk>,
	Nageswara R Sastry <rnsastry@linux.ibm.com>,
	kexec@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 2/3] selftests/kexec: select tests using the target compiler
Date: Thu,  5 Nov 2026 07:57:00 -0500
Message-ID: <20261105125701.1605281-3-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105125701.1605281-1-sashal@kernel.org>
References: <20261105125701.1605281-1-sashal@kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kexec Makefile recognizes PowerPC only through the ppc64le spelling
of ARCH, so the canonical ARCH=powerpc used for cross builds omits the
tests. The x86 jump test is selected with IS_64_BIT from
scripts/Makefile.arch, which describes the build host rather than the
compiler being used. On other architectures the Makefile includes no
lib.mk rules at all, so installation and runlist generation fail with
missing targets.

Select x86 and PowerPC from the target ARCH when it is given and from
the host's SUBARCH otherwise, without assigning ARCH, so that lib.mk
keeps choosing the compiler's native clang target. Ask the selected
compiler, including USERCFLAGS, whether it targets a 64-bit x86 ABI
and whether it targets little-endian 64-bit PowerPC. lib.mk expands the
generated program list before it appends USERCFLAGS to CFLAGS, so the
flags are passed explicitly to keep both probes consistent. If the
compiler cannot be run, select the jump test so that the build fails
instead of silently dropping it. Include lib.mk unconditionally so that
unsupported targets build, install and emit an empty runlist.

Fixes: 65e38e32a959 ("selftests/kexec: Enable secureboot tests for PowerPC")
Fixes: 7615b94b6371 ("selftests/kexec: Add x86_64 selftest for kexec-jump and exception handling")
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 tools/testing/selftests/kexec/Makefile | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/tools/testing/selftests/kexec/Makefile b/tools/testing/selftests/kexec/Makefile
index 874cfdd3b75b3..97d5dd10208a1 100644
--- a/tools/testing/selftests/kexec/Makefile
+++ b/tools/testing/selftests/kexec/Makefile
@@ -1,20 +1,22 @@
 # SPDX-License-Identifier: GPL-2.0-only
 # Makefile for kexec tests
 
-ARCH ?= $(shell uname -m 2>/dev/null || echo not)
-ARCH_PROCESSED := $(shell echo $(ARCH) | sed -e s/i.86/x86/ -e s/x86_64/x86/)
+top_srcdir = ../../../..
+include $(top_srcdir)/scripts/subarch.include
+ARCH_PROCESSED := $(shell echo $(or $(ARCH),$(SUBARCH)) | sed -e s/i.86/x86/ -e s/x86_64/x86/)
 
-ifeq ($(ARCH_PROCESSED),$(filter $(ARCH_PROCESSED),x86 ppc64le))
-TEST_PROGS := test_kexec_load.sh test_kexec_file_load.sh
-TEST_FILES := kexec_common_lib.sh
+PROBE_CC = $(filter-out -fuse-ld=%,$(CC)) $(CFLAGS) $(USERCFLAGS) -E -P -x c -
+CC_IS_64BIT = $(shell echo __SIZEOF_LONG__ | $(PROBE_CC) || echo 8)
+PPC64LE = $(shell printf '\043if defined(__powerpc64__) && __BYTE_ORDER__ == \
+	__ORDER_LITTLE_ENDIAN__\n1\n\043endif\n' | $(PROBE_CC))
 
-include ../../../scripts/Makefile.arch
-
-ifeq ($(IS_64_BIT)$(ARCH_PROCESSED),1x86)
-TEST_PROGS += test_kexec_jump.sh
-TEST_GEN_PROGS := test_kexec_jump
+ifeq ($(ARCH_PROCESSED),x86)
+TEST_PROGS = test_kexec_load.sh test_kexec_file_load.sh \
+	$(if $(filter 8,$(CC_IS_64BIT)),test_kexec_jump.sh)
+TEST_GEN_PROGS = $(if $(filter 8,$(CC_IS_64BIT)),test_kexec_jump)
+else ifneq (,$(filter powerpc ppc64le,$(ARCH_PROCESSED)))
+TEST_PROGS = $(if $(filter 1,$(PPC64LE)),test_kexec_load.sh test_kexec_file_load.sh)
 endif
+TEST_FILES = $(if $(TEST_PROGS),kexec_common_lib.sh)
 
 include ../lib.mk
-
-endif
-- 
2.53.0

