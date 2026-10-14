Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B6D49BD73;
	Wed, 14 Oct 2026 20:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792008120; cv=none; b=UVqPZhWRzbHCFX482IiFEXWtZnrbo06/JmLnhMncNYpqXFlG7/LhYF4h8Yss3SEu3+4dCt0yXADb8iMkdJz0em210NqVC98r3Lo/DUOFDNBn3vBVv8Mr6tmfGgdvgz8jU6ySjns3VkshdPj3E4dS/yaLLIdbxCYM3vdRV8px0UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792008120; c=relaxed/simple;
	bh=WOPCz5R4ZL7IugFNyoW7miShFa6Nxm0w+91VWMGWwPY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HqQLeVKU2gdzwJic4vvI9GJHrs74CXcwFbxhQDsYyId7YAAE3Rg4NxCPteoqj93TFzPoQQS0M9S563OBkCWUWJGtD9KMOuJTryTaNjKB2yDZ+7Nvy+S//1oSmsp4cFpN+tVEJwEEiRH2sjZAYjVqS4Q7hN8Vc0jewGkXco8bFV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dR2lxZ4z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dR2lxZ4z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA59C1F000C5;
	Wed, 14 Oct 2026 20:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792008119;
	bh=LUquCq1+GBaxmyjWgHuN6jZLbjQlFxwQdoCrwmLyUH4=;
	h=From:To:Cc:Subject:Date;
	b=dR2lxZ4zl4C43mGxRS//XxnQX/C4ROHjUBQO5F2OSQ84Otm5DNLvMFvhjhE/ra3KO
	 Q14sonVrp4alSV3RPIXc5bjANyJAdUFVHP3dzbyqseeLRs+U8F3cEGcU4KXyczNDj4
	 vqeS2k1mWBpbsGyzEGP4VZ4jQpbqd3rD7awUGT1OuFtFunXP+4jFn2OA3aDrE+T+lz
	 T1WQwdvgTxCw5fueu2hMbI9HjhF/gMFWz0XPPXKcGQCa18rKrVLGi4xDa4E+7bKQFB
	 KuKWe8UuSNXSbc2y+bKM3lclTSlm5qvwCVSmMuWha7XJ4pOx1w7NgzXeESv9zzSEua
	 1TO9vtsfPdQGQ==
From: Sasha Levin <sashal@kernel.org>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Sasha Levin <sashal@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] selftests/rseq: select only implemented architecture variants
Date: Wed, 14 Oct 2026 16:01:57 -0400
Message-ID: <20261014200157.1365258-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The rseq headers implement a limited set of targets, and only the
little-endian ARM, arm64 and RISC-V variants. Building the suite for
LoongArch or for the unsupported endian variants fails in the
architecture dispatch of rseq.h.

Ask the target compiler which architecture it builds for before
selecting the tests and scripts, so that unsupported targets build,
install and emit an empty runlist through the ordinary lib.mk rules.
Pass USERCFLAGS to the probe as well, since lib.mk expands the
generated program lists before it appends USERCFLAGS to CFLAGS, and
filter out only the linker options that the preprocessor would warn
about. If the compiler cannot be run, select the tests so that the
build fails instead of turning the problem into an empty suite.

This does not add LoongArch support and does not address the remaining
compiler-specific build failures on supported targets.

Fixes: ccba8b64452b ("rseq/selftests: Provide Makefile, scripts, gitignore")
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 tools/testing/selftests/rseq/Makefile | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/rseq/Makefile b/tools/testing/selftests/rseq/Makefile
index aba6317f6cb8e..6875ab493ed74 100644
--- a/tools/testing/selftests/rseq/Makefile
+++ b/tools/testing/selftests/rseq/Makefile
@@ -18,10 +18,22 @@ LDLIBS += -lpthread -ldl
 # still track changes to header files and depend on shared object.
 OVERRIDE_TARGETS = 1
 
-TEST_GEN_PROGS = basic_test basic_percpu_ops_test basic_percpu_ops_mm_cid_test \
+comma := ,
+RSEQ_ARCH_SUPPORTED = $(shell printf '\043if defined(__x86_64__) || defined(__i386__) || \
+	defined(__ARMEL__) || defined(__AARCH64EL__) || \
+	defined(__PPC__) || defined(__mips__) || defined(__s390__) || \
+	defined(__or1k__) || (defined(__riscv) && __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__)\n1\n\043endif\n' | \
+	$(filter-out -fuse-ld=%,$(CC)) $(filter-out -L% -Wl$(comma)%,$(CFLAGS) $(USERCFLAGS)) \
+	-E -P -x c - || echo 1)
+
+TEST_GEN_PROGS = $(if $(filter 1,$(RSEQ_ARCH_SUPPORTED)),$(RSEQ_TEST_GEN_PROGS))
+TEST_GEN_PROGS_EXTENDED = $(if $(filter 1,$(RSEQ_ARCH_SUPPORTED)),$(RSEQ_TEST_GEN_PROGS_EXTENDED))
+TEST_PROGS = $(if $(filter 1,$(RSEQ_ARCH_SUPPORTED)),$(RSEQ_TEST_PROGS))
+
+RSEQ_TEST_GEN_PROGS = basic_test basic_percpu_ops_test basic_percpu_ops_mm_cid_test \
 		 param_test_benchmark param_test_mm_cid_benchmark
 
-TEST_GEN_PROGS_EXTENDED = librseq.so \
+RSEQ_TEST_GEN_PROGS_EXTENDED = librseq.so \
 	param_test \
 	param_test_compare_twice \
 	param_test_mm_cid \
@@ -31,7 +43,7 @@ TEST_GEN_PROGS_EXTENDED = librseq.so \
 	slice_test \
 	check_optimized
 
-TEST_PROGS = run_param_test.sh run_syscall_errors_test.sh run_legacy_check.sh run_timeslice_test.sh
+RSEQ_TEST_PROGS = run_param_test.sh run_syscall_errors_test.sh run_legacy_check.sh run_timeslice_test.sh
 
 TEST_FILES := settings
 

base-commit: 4eb2586bd40db27d77cc5b724ca9386ed0c71d53
-- 
2.53.0

