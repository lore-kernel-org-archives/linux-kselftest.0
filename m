Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5454D25393B
	for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 03:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778470163; cv=none; b=moJmFNF1UxAWekYZbxJ86UlVCiYudKnN/BxpX7dJwYhoCzkFnnnaGZZZ6KMBsCczMkvEILSFcERfnjfXe9HCgJFsUTJUavxF1Yag9u6UsqXurUvK1KfpwQbfvb5QrlU+m+v93/ZThRmsbviv70hVELpKiZQaWT8gkPb6CUsDkcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778470163; c=relaxed/simple;
	bh=uARdaHq3AAQjZuZeOgb45uXepUqXDbV/qJDqRcrrBbw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UGE6QN2x6CqqLGLOptfgOaIS6bmCxgz1pRKuTMgirPkvrw1pmbIUDpU3NTlTyNXW5fyZHOUOHDbsz5rsMQ2cfQvD8CAnjymA7Li8TZQLN1Tkd3pBTVXvFPxW5szU/GQtIla511/cHpub8s4R/Wn3vO49MQ644SaDozjAxYsaRt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=YRS0xspX; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="YRS0xspX"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2c15849aa2cso4652698eec.0
        for <linux-kselftest@vger.kernel.org>; Sun, 10 May 2026 20:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1778470160; x=1779074960; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y/0AIvK8BCcj8XqdwEdcIT92Ta29adSchEewMFBK5y0=;
        b=YRS0xspX4RcxijsD+IYjLxdeXwvrdzbxwemyCuQn/cRbQTJ2/PEq6icfdpfKKMD0K8
         iigA7o+ak9bCA1T589/PVgW4MoZvNZtv3aFsRO+2DssubWtmi33Nb8a0nRSb9XGrwANv
         Z/aUGkyf6u/SVdLslnVUL/syL7vDXE/RkUAJZ0XKjciQnWfNmW3BeHFUM4xBc9CJIqrX
         /LWoGbnK5rfH5zSWEsaQ+3oy/MeMXfdrtmL2pZRETVYAksxXYVTRsyMHFCTL45bz66sH
         xeLiD2CcggnPiaLDpHT7UHp4M/0j9mc7Uqz+/CGmnqrNAoblQ4tk804e1sZcVHs8NtyG
         l7xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778470160; x=1779074960;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y/0AIvK8BCcj8XqdwEdcIT92Ta29adSchEewMFBK5y0=;
        b=nipWrfOTEEHEbO6Sr1nd9f6d0Ps8bqUsv7Znxga08NPu7karUcdT8XfT4wv5xf3nfV
         Rxfk5jdfV5TUAtFEMltoMIuY+uKHcxdLoCPXMK83Z4faH6RO7+U4dDB7BzDU8ClQmvkH
         TCuLIUJiHLwsjSDRHTcXOuDEB0F3abvMK1ppxGOOfnclRCYJwjOmTa6/vcdPyeI6IeP5
         ARTYJh36DKUOA2PLk/UOr2pbTD4U21KkdKvye+yUkaJqGUwTI4AoajwBcbYHgbkiJ/T/
         P9aLv5sWAYFdHJwYNzFaybcoQhWrC2P8clYupz9rVq7FphTsg4V3CmQxcQmb83OBIEJY
         3Z0A==
X-Forwarded-Encrypted: i=1; AFNElJ9PE9cwJMZL2xZBHEhFtm06jm3xbmb9QWWeUBGQVBYkiD1uc55kZ1xWHD4mvnvQJARACea0IG2VfFXQf5GKbXk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo9J2hMtPTxgxD1S+DAam9PFFozAakQtc2gUADOodjmepXxu/j
	7/AtX4ebUgsbDylHLB+sPmO6sYjYNuwd/N1ymzFCfoPQx4HTzrcccqKEYHUM5l8L5oY=
X-Gm-Gg: Acq92OHu3djWnrbQtUfGJ/BJyRnit62BMi2vfBEHStF6SgdQxr+eQ69t/hx9ne2RCkY
	VCkcmfqb/B2trW9MuyOG9YN9hnZyA1JybEDzETN5Vy3gHxIYmmvwuTP7olt6kcLBU7UBjPhKEEm
	XmYQbqKvCf4x8qg/aIHJLVqa/e9/7ObZKRHtHC7DZoSAZ99AYMjphTNOwfR8+z2jYP50Q1fasHf
	RqU1QPYWV3JEHeD06F/u/h5z6ZL5g9CGWYJtWWwzbywWdg9xHuNNMvEJTQmHC7hESSIyhdpBkOX
	xHZAbvLyYhFI4lqLvzWejvWoEBqkDiS26WAAySBDLbKoOlvT3NPTXf5W1roQBa4gwAWbLPebXSc
	3S6AUSbkxAoh1rujlCnwy3so7R+mFO2RO/IGIqHYpIN9X2ilDGVjtCykYHpbENHhPlE1Zo/2db7
	Hf3/MAO43w1A436vJgj5c9uA0s+QQeq1gvT6I=
X-Received: by 2002:a05:7301:128b:b0:2d3:f3fc:bb6b with SMTP id 5a478bee46e88-2f5482664b0mr11091502eec.1.1778470160415;
        Sun, 10 May 2026 20:29:20 -0700 (PDT)
Received: from sw04.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8859eafc2sm15049827eec.4.2026.05.10.20.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 20:29:19 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH] selftests/riscv: fix compiler output flag spacing in all Makefiles
Date: Sun, 10 May 2026 20:29:17 -0700
Message-ID: <20260511032917.3542802-1-zong.li@sifive.com>
X-Mailer: git-send-email @GIT_VERSION@
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Standardize the compiler output flag format across all RISC-V
selftests by adding a space between '-o' and '$@'.

Although '-o$@' is perfectly valid for GCC/Clang to parse, But
changing it to '-o $@' with a space could align with the GNU
official documentation conventions, improves readability by
visually separating the flag from the target variable, and
ensures consistency with other architectures

Currently, RISC-V selftests use '-o$@' (without space) in 13
instances across 6 Makefiles, while all other architectures
consistently use '-o $@' (with space). This inconsistency makes
RISC-V an outlier in the kernel's selftest infrastructure.

Signed-off-by: Zong Li <zong.li@sifive.com>
---
 tools/testing/selftests/riscv/abi/Makefile       |  2 +-
 tools/testing/selftests/riscv/cfi/Makefile       |  2 +-
 tools/testing/selftests/riscv/hwprobe/Makefile   |  6 +++---
 tools/testing/selftests/riscv/mm/Makefile        |  2 +-
 tools/testing/selftests/riscv/sigreturn/Makefile |  2 +-
 tools/testing/selftests/riscv/vector/Makefile    | 12 ++++++------
 6 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/tools/testing/selftests/riscv/abi/Makefile b/tools/testing/selftests/riscv/abi/Makefile
index ed82ff9c664e..041114675ad5 100644
--- a/tools/testing/selftests/riscv/abi/Makefile
+++ b/tools/testing/selftests/riscv/abi/Makefile
@@ -7,4 +7,4 @@ TEST_GEN_PROGS := pointer_masking
 include ../../lib.mk
 
 $(OUTPUT)/pointer_masking: pointer_masking.c
-	$(CC) -static -o$@ $(CFLAGS) $(LDFLAGS) $^
+	$(CC) -static -o $@ $(CFLAGS) $(LDFLAGS) $^
diff --git a/tools/testing/selftests/riscv/cfi/Makefile b/tools/testing/selftests/riscv/cfi/Makefile
index 93b4738c0e2e..418b4b5325a5 100644
--- a/tools/testing/selftests/riscv/cfi/Makefile
+++ b/tools/testing/selftests/riscv/cfi/Makefile
@@ -16,7 +16,7 @@ ifeq ($(shell $(CC) $(CFLAGS) -nostdlib -xc /dev/null -o /dev/null > /dev/null 2
 TEST_GEN_PROGS := cfitests
 
 $(OUTPUT)/cfitests: cfitests.c shadowstack.c
-	$(CC) -o$@ $(CFLAGS) $(LDFLAGS) $^
+	$(CC) -o $@ $(CFLAGS) $(LDFLAGS) $^
 else
 
 $(shell echo "Toolchain doesn't support CFI, skipping CFI kselftest." >&2)
diff --git a/tools/testing/selftests/riscv/hwprobe/Makefile b/tools/testing/selftests/riscv/hwprobe/Makefile
index cec81610a5f2..71e3f26c541b 100644
--- a/tools/testing/selftests/riscv/hwprobe/Makefile
+++ b/tools/testing/selftests/riscv/hwprobe/Makefile
@@ -9,10 +9,10 @@ TEST_GEN_PROGS := hwprobe cbo which-cpus
 include ../../lib.mk
 
 $(OUTPUT)/hwprobe: hwprobe.c sys_hwprobe.S
-	$(CC) -static -o$@ $(CFLAGS) $(LDFLAGS) $^
+	$(CC) -static -o $@ $(CFLAGS) $(LDFLAGS) $^
 
 $(OUTPUT)/cbo: cbo.c sys_hwprobe.S
-	$(CC) -static -o$@ $(CFLAGS) $(LDFLAGS) $^
+	$(CC) -static -o $@ $(CFLAGS) $(LDFLAGS) $^
 
 $(OUTPUT)/which-cpus: which-cpus.c sys_hwprobe.S
-	$(CC) -static -o$@ $(CFLAGS) $(LDFLAGS) $^
+	$(CC) -static -o $@ $(CFLAGS) $(LDFLAGS) $^
diff --git a/tools/testing/selftests/riscv/mm/Makefile b/tools/testing/selftests/riscv/mm/Makefile
index 4664ed79e20b..24122453e3d0 100644
--- a/tools/testing/selftests/riscv/mm/Makefile
+++ b/tools/testing/selftests/riscv/mm/Makefile
@@ -12,4 +12,4 @@ TEST_PROGS := run_mmap.sh
 include ../../lib.mk
 
 $(OUTPUT)/mm: mmap_default.c mmap_bottomup.c mmap_tests.h
-	$(CC) -o$@ $(CFLAGS) $(LDFLAGS) $^
+	$(CC) -o $@ $(CFLAGS) $(LDFLAGS) $^
diff --git a/tools/testing/selftests/riscv/sigreturn/Makefile b/tools/testing/selftests/riscv/sigreturn/Makefile
index eb8bac9279a8..8c77508641f3 100644
--- a/tools/testing/selftests/riscv/sigreturn/Makefile
+++ b/tools/testing/selftests/riscv/sigreturn/Makefile
@@ -9,4 +9,4 @@ TEST_GEN_PROGS := sigreturn
 include ../../lib.mk
 
 $(OUTPUT)/sigreturn: sigreturn.c
-	$(CC) -static -o$@ $(CFLAGS) $(LDFLAGS) $^
+	$(CC) -static -o $@ $(CFLAGS) $(LDFLAGS) $^
diff --git a/tools/testing/selftests/riscv/vector/Makefile b/tools/testing/selftests/riscv/vector/Makefile
index 326dafd739bf..7e0017b3fb8b 100644
--- a/tools/testing/selftests/riscv/vector/Makefile
+++ b/tools/testing/selftests/riscv/vector/Makefile
@@ -11,29 +11,29 @@ include ../../lib.mk
 TEST_GEN_OBJ := $(patsubst %.c, $(OUTPUT)/%.o, $(TEST_GEN_LIBS))
 
 $(OUTPUT)/sys_hwprobe.o: ../hwprobe/sys_hwprobe.S
-	$(CC) -static -c -o$@ $(CFLAGS) $^
+	$(CC) -static -c -o $@ $(CFLAGS) $^
 
 $(OUTPUT)/v_helpers.o: v_helpers.c
-	$(CC) -static -c -o$@ $(CFLAGS) $^
+	$(CC) -static -c -o $@ $(CFLAGS) $^
 
 $(OUTPUT)/vstate_prctl: vstate_prctl.c $(OUTPUT)/sys_hwprobe.o $(OUTPUT)/v_helpers.o
-	$(CC) -static -o$@ $(CFLAGS) $(LDFLAGS) $^
+	$(CC) -static -o $@ $(CFLAGS) $(LDFLAGS) $^
 
 $(OUTPUT)/vstate_exec_nolibc: vstate_exec_nolibc.c
 	$(CC) -nostdlib -static -include ../../../../include/nolibc/nolibc.h \
 		-Wall $(CFLAGS) $(LDFLAGS) $^ -o $@ -lgcc
 
 $(OUTPUT)/v_initval: v_initval.c $(OUTPUT)/sys_hwprobe.o $(OUTPUT)/v_helpers.o
-	$(CC) -static -o$@ $(CFLAGS) $(LDFLAGS) $^
+	$(CC) -static -o $@ $(CFLAGS) $(LDFLAGS) $^
 
 $(OUTPUT)/v_exec_initval_nolibc: v_exec_initval_nolibc.c
 	$(CC) -nostdlib -static -include ../../../../include/nolibc/nolibc.h \
 		-Wall $(CFLAGS) $(LDFLAGS) $^ -o $@ -lgcc
 
 $(OUTPUT)/vstate_ptrace: vstate_ptrace.c $(OUTPUT)/sys_hwprobe.o $(OUTPUT)/v_helpers.o
-	$(CC) -static -o$@ $(CFLAGS) $(LDFLAGS) $^
+	$(CC) -static -o $@ $(CFLAGS) $(LDFLAGS) $^
 
 $(OUTPUT)/validate_v_ptrace: validate_v_ptrace.c $(OUTPUT)/sys_hwprobe.o $(OUTPUT)/v_helpers.o
-	$(CC) -static -o$@ $(CFLAGS) $(LDFLAGS) $^
+	$(CC) -static -o $@ $(CFLAGS) $(LDFLAGS) $^
 
 EXTRA_CLEAN += $(TEST_GEN_OBJ)
-- 
2.43.7

