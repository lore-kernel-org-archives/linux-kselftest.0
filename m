Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75AB91C5D5E
	for <linux-kselftest@vger.kernel.org>; Wed, 29 Jul 2026 00:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785283593; cv=none; b=oPxLBO6kq5tYxsj76pWPUXOB5O1tgOfiPemhc8JDQIY55BBJBjkcR5wyfoDz6DuzJdbj93nqBR6EE1v0fGxRDEVOJDoT2jQSxJ6HpPGfd2YFQqTWGpM9dJ57G3YVNHV6PQn4iLcWBDjvajYv6PprVwaTjugRcptkJrdCQ2Fkfhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785283593; c=relaxed/simple;
	bh=n6B0m/+R9mN5iX6PJBomszTE8W1zcQIZoUz1pg5+JyE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LQPY1y4l0pPXcnOQG3EKcPi4z/wLVneQJf77yQBbTKXZFoIy0o7bbE/VgUs6U524bYgbqYb/2aTjdhm1I/eaPzsAD5ulbAskeqSFZWCZf2BsT2zKsMY40lG1mO/LnAcUmnUn3fPY4NXLIXAg2mbKUcyQqNyacXJPVAPf6ugXTng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marliere.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=marliere.net header.i=@marliere.net header.b=LqawIfoB; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marliere.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marliere.net header.i=@marliere.net header.b="LqawIfoB"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-6ab06473488so203409eaf.0
        for <linux-kselftest@vger.kernel.org>; Tue, 28 Jul 2026 17:06:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785283590; x=1785888390;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6jVe2SJOqGG1SvAsoVGiyJK19dwvcga29gSaKO426pw=;
        b=DuW9/ctmF1iZ4hiI8S/VEtyYJqs1LLmb0lqaYM+qTw/BLfK/m+w4zr2vMRmUeupbPC
         FkoNItdcVhCMgPoQLUBS08rTtimSLYa/SrcvnDsrjQZIi8lB7dXlkDuSNcZykK3hslih
         zJRTruhscNL7RbP9bMpTaNX5Rsk73EUnlpjQRy+KdehTVsGda4k5jm92fC7WMITsP/mG
         ZeKefzdv4P9ZfBg0Z0CRfUHlIryGLxBpR4x8e8NnLJdZdd4whx87bv1MnrJ8MXrDoo3X
         4Cyn6eGddvyaUU0hhGTh6k79vFOpr4nBk4moMonad9QyGVuCmqIiRx5L9KUuzchZ6LsV
         E+tg==
X-Forwarded-Encrypted: i=1; AHgh+RpipzvujeMRyz2dTAPEaRN2HvrfeomtmD6XztuLBVT9dKMLSRis8iFlI5ZKIZajQV3qn0robgs9GxZa6GRbf+o=@vger.kernel.org
X-Gm-Message-State: AOJu0YyegQzqDdOt01qB7Qhivd9q0Q7vxRlzV3QC5JlaKvKYv1ZDPOqS
	sQ8TdrSFv8+tE4+uxpIkMJemBlqKvZ/LwAfzqayImwAnxXn62JNN2H8K
X-Gm-Gg: AR+sD13KUetlIK7YawEmolApFJfOUTqWoKZ9spH90jHHD242416s+yk5RoueZ2UL3FE
	zHUHUVgW6XcMjsi8eyXxCqWAW8iRqC6Dg/aub/xGq+4UphC5IOYqPtcDJ0IfqgVSwCr1qnuDx3z
	31p4CYzrOzsnVBs38Ij5XJw4aUFkB7iN7Xy0jq/exBM/OTSJOE0nBHAXY5E04yiITryijY0ju5R
	WxnTOk/rHvsdZCyrh1KQL2nanW+AjgXZdHo/HpK0V78AXfTkeazn2ZhwCdRVJbAQHVDkhfV37J4
	NcrVKANqESmpiJUL9vasIctS8nlZjSpbOnlNGYEakSsFFjxaIhwfpgYVkrKsBnoAy8JZXsyZs9K
	NzHX+qnAm6DW2c5kc0PveUoq9aIjiGNV+Gt3jv73G9UGzPlEgYucy5UeCuBITVubYTc2Nq0Xt7n
	yjrTQFZLPHhcqKcBdo/Cf2/0nKTs0fuPMQQPAJyaNms+CwFPPCtc8zQQcYRnE/D2lj0Iao305ca
	QneTDvFdOrRGemMqcvVhBpIgU8Os7FU4a5fXrx/3wF1DWtK1Qzp5y5G6s8Xf/Mutj5Fi8IoD0H/
X-Received: by 2002:a05:6820:f005:b0:6aa:dadb:454f with SMTP id 006d021491bc7-6ac96972091mr2358636eaf.7.1785283590263;
        Tue, 28 Jul 2026 17:06:30 -0700 (PDT)
Received: from mail.marliere.net (137.65.66.34.bc.googleusercontent.com. [34.66.65.137])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f00d8d397asm926314a34.17.2026.07.28.17.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 17:06:29 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 57DB460A0A;
	Wed, 29 Jul 2026 00:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
	s=dkim; t=1785283589;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=6jVe2SJOqGG1SvAsoVGiyJK19dwvcga29gSaKO426pw=;
	b=LqawIfoBR6+8GigFrjy0t+CvYSKND9u3viEfkgzsuSJA7D8leZiS9qTKSlHqkwBtA87KyR
	ygxoOb4LIGcDzTxSjjHF6wjFAd+6jqaCcQdCFtQuFPAVIO34eht7tNeyWp/VDSeIIU6+Cj
	/AAQs7Ltq32NdayMoqqIt1Hf+kzQG71wz9ET3cM6ErWu3JQtpapyllIICKYjM10KfgLBOY
	455zyGm0L5gK4A8OQMohgglUdFV+YQOZ52YchJgX9YNjcu5N9zqeVqql0iPSaW7UP3qkf2
	YJC+qYC5vBL+rsviFIevr0S9X+Z4zVSqJGfh5WpPlhgcZzcVDrDC72gw6exyUg==
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re_=28SUSE=29?= <ricardo@marliere.net>
Date: Tue, 28 Jul 2026 21:06:13 -0300
Subject: [PATCH 3/3] selftests/bpf: Route test_kmods build artifacts to
 OUTPUT
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260728-selftests-bpf_oot-v1-3-05feb15d94db@marliere.net>
References: <20260728-selftests-bpf_oot-v1-0-05feb15d94db@marliere.net>
In-Reply-To: <20260728-selftests-bpf_oot-v1-0-05feb15d94db@marliere.net>
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, Shuah Khan <shuah@kernel.org>
Cc: bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re_=28SUSE=29?= <ricardo@marliere.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1785283576; l=5078;
 i=ricardo@marliere.net; h=from:subject:message-id;
 bh=n6B0m/+R9mN5iX6PJBomszTE8W1zcQIZoUz1pg5+JyE=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QKHw7ZLG4TsiAIVGlXkPRX25iNSsGGnLqHmwnL4UDvjNghR1nmi2H/KXhxPN7ouXdai/aUxnlSr
 eKmOnnXp79wc=
X-Developer-Key: i=ricardo@marliere.net; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g
X-Last-TLS-Session-Version: TLSv1.3

When building bpf selftests with O=, the kernel module intermediates (.ko,
.o, .mod.*, .cmd files, Module.symvers, modules.order) produced by the
test_kmods sub-make are placed in the source tree instead of the
out-of-tree directory, because kbuild external-module builds always write
output to the M= source directory by default.

Introduce TEST_KMODS_OUTDIR in bpf/Makefile that resolves to
$(OUTPUT)/test_kmods when OUTPUT is set, and fall back to the in-tree
test_kmods/ directory for standalone builds. Update the pattern rule, the
RM invocation, and the copy rule to use this variable, and pass
OUTPUT=$(OUTPUT)/test_kmods to the test_kmods sub-make.

In test_kmods/Makefile, forward the received OUTPUT value as MO= to the
kernel Makefile. The top-level kernel Makefile maps MO= to
KBUILD_EXTMOD_OUTPUT, which redirects all external-module build output to
the specified directory. The kernel also creates that directory
automatically, so no explicit mkdir is needed.

Also update the CLEAN target in bpf/Makefile to propagate OUTPUT to both
the test_kmods and libarena sub-makes so that clean removes from the
correct location.

Signed-off-by: Ricardo B. Marlière (SUSE) <ricardo@marliere.net>
---
 tools/testing/selftests/bpf/Makefile            | 16 ++++++++++------
 tools/testing/selftests/bpf/test_kmods/Makefile |  3 +++
 2 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
index 7d42632f9d42..b150a66f3c25 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -135,6 +135,9 @@ TEST_PROGS_EXTENDED := \
 TEST_KMODS := bpf_testmod.ko bpf_test_no_cfi.ko bpf_test_modorder_x.ko \
 	bpf_test_modorder_y.ko bpf_test_rqspinlock.ko
 TEST_KMOD_TARGETS = $(addprefix $(OUTPUT)/,$(TEST_KMODS))
+# Build directory for kernel modules: routed to $(OUTPUT)/test_kmods when
+# OUTPUT is set so that kbuild intermediates stay out of the source tree.
+TEST_KMODS_OUTDIR := $(if $(OUTPUT),$(OUTPUT)/test_kmods,test_kmods)
 
 # Compile but not part of 'make run_tests'
 TEST_GEN_PROGS_EXTENDED = \
@@ -163,8 +166,8 @@ override define CLEAN
 	$(Q)$(RM) -r $(TEST_GEN_FILES)
 	$(Q)$(RM) -r $(TEST_KMODS)
 	$(Q)$(RM) -r $(EXTRA_CLEAN)
-	$(Q)$(MAKE) -C test_kmods clean
-	$(Q)$(MAKE) -C libarena clean
+	$(Q)$(MAKE) -C test_kmods $(if $(OUTPUT),OUTPUT=$(OUTPUT)/test_kmods) clean
+	$(Q)$(MAKE) -C libarena $(if $(OUTPUT),OUTPUT=$(OUTPUT)/libarena) clean
 	$(Q)$(MAKE) docs-clean
 endef
 
@@ -301,17 +304,18 @@ $(OUTPUT)/sign-file: ../../../../scripts/sign-file.c
 # support that for regular rules. However, pattern matching rules are implicitly
 # treated as grouped even with older versions of make, so as a workaround, the
 # subst() turns the rule into a pattern matching rule
-$(addprefix test_kmods/,$(subst .ko,%ko,$(TEST_KMODS))): $(VMLINUX_BTF) $(RESOLVE_BTFIDS) $(wildcard test_kmods/Makefile test_kmods/*.[ch])
-	$(Q)$(RM) test_kmods/*.ko test_kmods/*.mod.o # force re-compilation
+$(addprefix $(TEST_KMODS_OUTDIR)/,$(subst .ko,%ko,$(TEST_KMODS))): $(VMLINUX_BTF) $(RESOLVE_BTFIDS) $(wildcard test_kmods/Makefile test_kmods/*.[ch])
+	$(Q)$(RM) $(TEST_KMODS_OUTDIR)/*.ko $(TEST_KMODS_OUTDIR)/*.mod.o # force re-compilation
 	$(Q)$(MAKE) $(submake_extras) -C test_kmods				\
 		$(if $(O),O=$(abspath $(O)))					\
 		$(if $(KBUILD_OUTPUT),KBUILD_OUTPUT=$(abspath $(KBUILD_OUTPUT)))\
+		$(if $(OUTPUT),OUTPUT=$(OUTPUT)/test_kmods)			\
 		RESOLVE_BTFIDS=$(RESOLVE_BTFIDS)				\
 		EXTRA_CFLAGS='' EXTRA_LDFLAGS=''
 
-$(TEST_KMOD_TARGETS): $(addprefix test_kmods/,$(TEST_KMODS))
+$(TEST_KMOD_TARGETS): $(addprefix $(TEST_KMODS_OUTDIR)/,$(TEST_KMODS))
 	$(call msg,MOD,,$@)
-	$(Q)$(if $(PERMISSIVE),if [ -f test_kmods/$(@F) ]; then )cp test_kmods/$(@F) $@$(if $(PERMISSIVE),; fi)
+	$(Q)$(if $(PERMISSIVE),if [ -f $(TEST_KMODS_OUTDIR)/$(@F) ]; then )cp $(TEST_KMODS_OUTDIR)/$(@F) $@$(if $(PERMISSIVE),; fi)
 
 
 DEFAULT_BPFTOOL := $(HOST_SCRATCH_DIR)/sbin/bpftool
diff --git a/tools/testing/selftests/bpf/test_kmods/Makefile b/tools/testing/selftests/bpf/test_kmods/Makefile
index 031c7454ce65..53e47e715ec4 100644
--- a/tools/testing/selftests/bpf/test_kmods/Makefile
+++ b/tools/testing/selftests/bpf/test_kmods/Makefile
@@ -32,14 +32,17 @@ PERMISSIVE := $(filter 0,$(BPF_STRICT_BUILD))
 all:
 ifeq ($(PERMISSIVE),)
 	$(Q)$(MAKE) -C $(KDIR) $(if $(KMOD_O_VALID),O=$(KMOD_O_VALID) KBUILD_OUTPUT=$(KMOD_O_VALID),KBUILD_OUTPUT=) \
+		$(if $(OUTPUT),MO=$(OUTPUT)) \
 		M=$(TEST_KMOD_DIR) modules
 else ifneq ("$(wildcard $(KDIR))", "")
 	$(Q)$(MAKE) -C $(KDIR) $(if $(KMOD_O_VALID),O=$(KMOD_O_VALID) KBUILD_OUTPUT=$(KMOD_O_VALID),KBUILD_OUTPUT=) \
+		$(if $(OUTPUT),MO=$(OUTPUT)) \
 		M=$(TEST_KMOD_DIR) modules
 endif
 
 clean:
 ifneq ("$(wildcard $(KDIR))", "")
 	$(Q)$(MAKE) -C $(KDIR) $(if $(KMOD_O_VALID),O=$(KMOD_O_VALID) KBUILD_OUTPUT=$(KMOD_O_VALID),KBUILD_OUTPUT=) \
+		$(if $(OUTPUT),MO=$(OUTPUT)) \
 		M=$(TEST_KMOD_DIR) clean
 endif

-- 
2.55.0

