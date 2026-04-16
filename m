Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D846A3AE1A8
	for <linux-kselftest@vger.kernel.org>; Thu, 16 Apr 2026 19:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776367872; cv=none; b=cDSigxMMGHwBlpuSahjv8S7p/pVZwzKtU1zDSKOIwkluNucB4LvUtint6tkGRY6WdgJWCK04wMpTEXdu24UlbWpv1etjIk6ha7FCBQot4pfHYsPjQbo0Zl8Mm4ME2A6mxViRWra9EhwlW9iG1NF2waOzohEKredvLOoenJj7mgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776367872; c=relaxed/simple;
	bh=f11SXZe+WQHJaklmN8C/g2Xt195t+y0z9AhtKSHsNYI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mPjjf0b8Hd9cRCg6/Vqau628BM5G0wjRrSnnKsz8czvD11qoPp6ApJm1mXPgauenm5RqWgO4NP70Z6qIMFFuHnsHyxJ68exQov58oOWu18tORaZez1RgROEcCM4taDkv2MKXwhn/QJDZeH91KeeOcx4/fyOsHyjcSIOAwzzom+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=D8L3gqFH; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="D8L3gqFH"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48896199cbaso86892025e9.1
        for <linux-kselftest@vger.kernel.org>; Thu, 16 Apr 2026 12:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776367865; x=1776972665; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oR0RAEV+sroGN90lpwROKTuzfL00axzp/LpV4EpeGlc=;
        b=D8L3gqFH8W1HvvUGbDXOHXMW7tP1UVzCbFUChAcCimIcUAmqTIzJp2xzHET/20C+Gc
         wLiu0Y3hPP+RH6DBIesz7/PC0KLn3BYVB0bs6IC5xP1KtaSy9M+YeYcnWX4BVa/tV/gG
         GUxYWIxf7/XrlmgKggRs33I+JhkohPoS+NNNW/BbLPV5bybrdWybQdtE6OrtejKQnCwG
         LB1qL94knhidNVHHqEP+CQckkKpuGlFyfouNZ5bx5vAvygAltqQj8YLNWEYMck1iIanZ
         GP80JgR689BZJAJpOe9f2kPg/bIzh1Z1YdvfwOb9mmcpImEi2+U5lSY8/eFZCUONLNbO
         vXCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776367865; x=1776972665;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oR0RAEV+sroGN90lpwROKTuzfL00axzp/LpV4EpeGlc=;
        b=AAHfDrHCMmih5thV5nqJSirOh9d4AC1sxr7cuGTTW1D0VTAbGe6CCctzk30Xrn1KMK
         7lX1frLHwLzWhTCs+q11VBZ6HoIVMJsTPBzJRvE2QD+k1S/dp7KxHF84fx4Ze48ro9aA
         s/jU1c0cuL6bahSh2QoS4KXMNNNzt5GYuTcOjDgR0ciyX5OTBcvuFXTGTrBSUTWm7VpX
         JlXuP7zeABTRdkw8mw7RNGdefgJJ05SFvajfv7yZDjxxSyGA+/Z/USDE1Xah5fkr86XC
         STc27CUz5V82daX/W9b0FKpfUFG8O+aYzl5oAK2hmNyxt+ht/fSk4xVfw0WQ2Y7QQXT2
         KFTg==
X-Forwarded-Encrypted: i=1; AFNElJ9I6RUIm4VrkuUlx7CsX2/zze5pOegVCsDaSb7j0JEbNfyH8A86ypmDhDoKdU/D28YikIo//zSz2dYjm2OgwVQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkNXIJ7pSfdRdWutvxB35hwIAWgSTdbHQZLebB6aJTXuV1UKUK
	B6o5wxGAZ8DddXqeEY5V+8yV/ctHMsDo2cMeacrFuUFA87jRY8YD0ejCiNAr+dZLDsk=
X-Gm-Gg: AeBDieu1c/L8x/3FyOuhsclJej0wzkkEnpCrEiXVCyCA+Yx/9fs9s2VgPeg4/e7lBob
	1Xrm6NeKc5zbcJLtu42+St1QLcrTDIhJ0sa+Dzgljg2hSJHqZugQ26GliBMeTWmoKpNBxD/sLm7
	1Bs/aB19Z4GTwROxrjwScGPc3b49E3ju7cBHlG0mfyTmxwSCxewuNsQ0yrrAO6pl/1JK3kSTeM1
	xb0rz6pQtIWMUP5LkY//uZgjWXPJFROz2/5f2qlEmNSRttmKQ/Kglj0E+oFIg+2Xg7+BKtqnzwW
	9cN8ZuglCG9jvOGm2226MA4jswiXXgc+7G6JQ9plz/B9oG+I/r51jbBSGOZgmJKLMO6WwR1u5hW
	X7Ec8ye0y10A6n5Xz1L+VXef3jCeoJivzo9xZvhnCnMtotlSbQepxJ0aEsoIUI2V7+IwD/02THh
	NX0NOru6pVLy8xdw0u9Mubeqo=
X-Received: by 2002:a05:600c:35d6:b0:488:ba5f:984f with SMTP id 5b1f17b1804b1-488fb25687emr3801095e9.6.1776367865550;
        Thu, 16 Apr 2026 12:31:05 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:dc8:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2de8c606222sm10959044eec.8.2026.04.16.12.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 12:31:04 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Thu, 16 Apr 2026 16:30:51 -0300
Subject: [PATCH bpf-next v7 02/11] selftests/bpf: Fix test_kmods KDIR to
 honor O= and distro kernels
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260416-selftests-bpf_misconfig-v7-2-a078e18012e4@suse.com>
References: <20260416-selftests-bpf_misconfig-v7-0-a078e18012e4@suse.com>
In-Reply-To: <20260416-selftests-bpf_misconfig-v7-0-a078e18012e4@suse.com>
To: Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, 
 Martin KaFai Lau <martin.lau@linux.dev>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Shuah Khan <shuah@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 Alan Maguire <alan.maguire@oracle.com>, 
 "Ricardo B. Marliere" <rbm@suse.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1776367852; l=3692;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=f11SXZe+WQHJaklmN8C/g2Xt195t+y0z9AhtKSHsNYI=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QGEqwf9dlE76lZ5IeGnsI6DMxcaVhpenNsPLey7kjYgCDwh8n/q3cOelnT/IV1dCgTNowTPqcOp
 uGrPga6130Qs=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

test_kmods/Makefile always pointed KDIR at the kernel source tree root,
ignoring O= and KBUILD_OUTPUT. On distro kernels where the source tree has
not been built, the Makefile had no fallback and would fail
unconditionally.

When O= or KBUILD_OUTPUT is set, pass it through so kbuild can locate the
correct kernel build directory (Module.symvers, scripts, etc.). Note that
the module artifacts themselves still land in the M= directory, which is
test_kmods/; O= only controls where kbuild finds its build infrastructure.
Fall back to /lib/modules/$(uname -r)/build when neither an explicit build
directory nor an in-tree Module.symvers is present.

Guard both all and clean against a missing KDIR so the step is silently
skipped rather than fatal. Make the parent Makefile's cp conditional so it
does not abort when modules were not built.

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/bpf/Makefile            |  4 ++--
 tools/testing/selftests/bpf/test_kmods/Makefile | 21 ++++++++++++++++++---
 2 files changed, 20 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
index c8ba8ccc2c6d..52176dc226f1 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -296,7 +296,7 @@ $(addprefix test_kmods/,$(subst .ko,%ko,$(TEST_KMODS))): $(VMLINUX_BTF) $(RESOLV
 
 $(TEST_KMOD_TARGETS): $(addprefix test_kmods/,$(TEST_KMODS))
 	$(call msg,MOD,,$@)
-	$(Q)cp test_kmods/$(@F) $@
+	$(Q)$(if $(PERMISSIVE),if [ -f test_kmods/$(@F) ]; then )cp test_kmods/$(@F) $@$(if $(PERMISSIVE),; fi)
 
 
 DEFAULT_BPFTOOL := $(HOST_SCRATCH_DIR)/sbin/bpftool
@@ -711,7 +711,7 @@ $(TRUNNER_LIB_OBJS): $(TRUNNER_OUTPUT)/%.o:$(TOOLSDIR)/lib/%.c
 $(TRUNNER_BINARY)-extras: $(TRUNNER_EXTRA_FILES) | $(TRUNNER_OUTPUT)
 ifneq ($2:$(OUTPUT),:$(shell pwd))
 	$$(call msg,EXT-COPY,$(TRUNNER_BINARY),$(TRUNNER_EXTRA_FILES))
-	$(Q)rsync -aq $$^ $(TRUNNER_OUTPUT)/
+	$(Q)rsync -aq $(if $(PERMISSIVE),--ignore-missing-args) $$^ $(TRUNNER_OUTPUT)/
 endif
 
 # some X.test.o files have runtime dependencies on Y.bpf.o files
diff --git a/tools/testing/selftests/bpf/test_kmods/Makefile b/tools/testing/selftests/bpf/test_kmods/Makefile
index 63c4d3f6a12f..ba6f6ed6ab8c 100644
--- a/tools/testing/selftests/bpf/test_kmods/Makefile
+++ b/tools/testing/selftests/bpf/test_kmods/Makefile
@@ -1,5 +1,7 @@
 TEST_KMOD_DIR := $(realpath $(dir $(abspath $(lastword $(MAKEFILE_LIST)))))
-KDIR ?= $(abspath $(TEST_KMOD_DIR)/../../../../..)
+SRCTREE_KDIR := $(abspath $(TEST_KMOD_DIR)/../../../../..)
+KMOD_O := $(abspath $(or $(O),$(KBUILD_OUTPUT)))
+KDIR ?= $(if $(KMOD_O),$(SRCTREE_KDIR),$(if $(wildcard $(SRCTREE_KDIR)/Module.symvers),$(SRCTREE_KDIR),/lib/modules/$(shell uname -r)/build))
 
 ifeq ($(V),1)
 Q =
@@ -14,8 +16,21 @@ $(foreach m,$(MODULES),$(eval obj-m += $(m:.ko=.o)))
 
 CFLAGS_bpf_testmod.o = -I$(src)
 
+# When BPF_STRICT_BUILD != 0, a missing KDIR is fatal (the default).
+# When permissive, skip silently.
+PERMISSIVE := $(filter 0,$(BPF_STRICT_BUILD))
+
 all:
-	$(Q)$(MAKE) -C $(KDIR) M=$(TEST_KMOD_DIR) modules
+ifeq ($(PERMISSIVE),)
+	$(Q)$(MAKE) -C $(KDIR) $(if $(KMOD_O),O=$(KMOD_O),KBUILD_OUTPUT=) \
+		M=$(TEST_KMOD_DIR) modules
+else ifneq ("$(wildcard $(KDIR))", "")
+	$(Q)$(MAKE) -C $(KDIR) $(if $(KMOD_O),O=$(KMOD_O),KBUILD_OUTPUT=) \
+		M=$(TEST_KMOD_DIR) modules
+endif
 
 clean:
-	$(Q)$(MAKE) -C $(KDIR) M=$(TEST_KMOD_DIR) clean
+ifneq ("$(wildcard $(KDIR))", "")
+	$(Q)$(MAKE) -C $(KDIR) $(if $(KMOD_O),O=$(KMOD_O),KBUILD_OUTPUT=) \
+		M=$(TEST_KMOD_DIR) clean
+endif

-- 
2.53.0

