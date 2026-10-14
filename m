Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D65486BBF;
	Wed, 14 Oct 2026 20:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792008104; cv=none; b=SaXf9+EBYNO8j36miRZL6GV1tmvBLoyWT8lKfIU5+VRcwak7CNZLF7g8vkcDgcaa6MrwYotylt9uz2oRxEeU2kfG/oPT46BI54QTtaPaPcUXd7ahZa8R5B+xc0rhUTH9HW5zSSNXeL+O5nfAcU0RtuR6MgBijHD1yq+1/eqBfRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792008104; c=relaxed/simple;
	bh=WAsHgZsGk64Ci2c8n3RdN3pdKT/+dahk9wgGJUMt4JE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XnNrwb0C9CN91TS9Ry3YbBV9bRcFqeDlnytyV2/IBrp2Eot820VR7gqEZVH0YfCreCCSlC3ZLReiMTx/bJsXohGX2TAe6DgIzsZVU9b5Q8GubhIc0Texi56lQL8pvRIVdfofph1/Ldetc+jCNzSu+yfzfJimTbh8+pAOdWF5RFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=afg5s7wY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="afg5s7wY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A8B11F000C6;
	Wed, 14 Oct 2026 20:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792008094;
	bh=pUU6GZFqMSNYXOwJs6Za3b0uigEcrfPKq411zI1Oteg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=afg5s7wYZxjtRm5X1k10FyzdSHWgtQlQauEBDuFRVFEIQlJlGfT3/vdfc2TQE10Yn
	 FjjrRX/dbLBBas0S+c0D0AvR4d/ehcxyBwLAdTzF8kGwnz3zQVIOn8dUAzf/ZbbjrH
	 A4Tobzd6frYYVHOSuiq6k5AFb4k1CyMbFzpPVktySyb8rSmX3uFb5Fs8SBpd9OOdol
	 x5wqyTuHbjBZmR+IJ381XuGitbn1GbkUgpEEQR5WS56BjnA8ZibfJnyfP0VTPHZl8g
	 HIi8vezZ6o5cz8wprsuiAq3S8056uFz5LpewgBVgIl2+zznbZv58C0MxFGvWXpPJFv
	 Dw0WnNOdEot2w==
From: Sasha Levin <sashal@kernel.org>
To: Shuah Khan <shuah@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Nageswara R Sastry <rnsastry@linux.ibm.com>,
	kexec@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] selftests/kexec: select tests using the target compiler
Date: Wed, 14 Oct 2026 16:01:26 -0400
Message-ID: <20261014200127.1363472-5-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261014200127.1363472-1-sashal@kernel.org>
References: <20261014200127.1363472-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
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

