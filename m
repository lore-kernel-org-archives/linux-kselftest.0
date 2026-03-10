Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940112F25F0;
	Tue, 10 Mar 2026 01:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773107539; cv=none; b=W13ikuJfGNpLgFkh3E+mMeKALdCTx2UKH6G/5arg9B7hma79m5vuuebVw/bL/tP9m0jnucYzTWmtOa069sEw/wHCkISpSKxRIvjfyJcD+J4AllQHnSz7cUF8bToWz4eZYWSvLBDIvuYfvAYkGkEhYbMPeZbRvb//zFtE7Kerumg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773107539; c=relaxed/simple;
	bh=v2pWrgmnDeGNP0dGg82smLMiBXVJnwAzUgpAkAP6yks=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NULUkbcB512PWNOT41FZGlLL+pNavxKIhPbH/9OEMJ9IoIlan0d+m9/IkYeJf3tgXC9v3msGbX5wEjpd+uSV2TAnxo+fblq9vsXofmBz9vHF5toNyfwkbU7p803F7O2KMalem/x2UjpVcv7rtCpNoreCrREadlWP/lBu11Q8gHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vF3nY55c; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vF3nY55c"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 31929C19423;
	Tue, 10 Mar 2026 01:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773107539;
	bh=v2pWrgmnDeGNP0dGg82smLMiBXVJnwAzUgpAkAP6yks=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=vF3nY55cr1M70uyokfXKLfrMPo6O/N33FcJGvus4aqlZWZdjC1repl9nhWGB63Hqw
	 9agH5laEFUBLB/joFaYmS0LjM6oNhLGCqyVIRqgd0O4r8Q8QCp5lk8JUyMGoQuVVZm
	 durdBouZOZns2QJK7KS8sESCJZ3IEkbNTbFC7cYb8nIK980r4gIiV1VJUtIvSINg2V
	 It5rOBbwY5ONtFkTr9d+gWXoZwCgXDiCIkLzBZzb0AbSTSJT0JKw8WPwo518LtMN64
	 YfCG3qFjvf5E+Vs/y6pbnXc+8HtdZ6M0pFDvH3ZOHrxynhc8t1qkWGnJZwVpB3aJwh
	 XDrMKMZnns8fQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23DACFCC9A8;
	Tue, 10 Mar 2026 01:52:19 +0000 (UTC)
From: Charlie Jenkins via B4 Relay <devnull+thecharlesjenkins.gmail.com@kernel.org>
Date: Mon, 09 Mar 2026 18:52:10 -0700
Subject: [PATCH v2 1/4] selftests: riscv: Add definition of BIT() macro
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-fix_selftests-v2-1-9d5a553a531e@gmail.com>
References: <20260309-fix_selftests-v2-0-9d5a553a531e@gmail.com>
In-Reply-To: <20260309-fix_selftests-v2-0-9d5a553a531e@gmail.com>
To: Shuah Khan <shuah@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Sergey Matyukevich <geomatsi@gmail.com>, Andy Chiu <andybnac@gmail.com>, 
 Deepak Gupta <debug@rivosinc.com>
Cc: linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Charlie Jenkins <thecharlesjenkins@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773107537; l=2501;
 i=thecharlesjenkins@gmail.com; s=2026030; h=from:subject:message-id;
 bh=fSLPxH6GsBiaH5osUs3h11f7ItiKygcEvbUUMu8KVw8=;
 b=fBBjwRxbvodjq3RWghDxm+Dx/Qr/g8qqQkr3tyPeEL/UlTWkFSdguEjJ2AjRozlUJh2HkvnX7
 a0HUuIEIGH2BBtujgBtaN1UncVFwSqiGg8GtLvfObXDfUeBCaSvFPJL
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=vpF2USrG+aB6CTbSt34rzJKsAVe/l+GAXo1IomCMETk=
X-Endpoint-Received: by B4 Relay for thecharlesjenkins@gmail.com/2026030
 with auth_id=663
X-Original-From: Charlie Jenkins <thecharlesjenkins@gmail.com>
Reply-To: thecharlesjenkins@gmail.com

From: Charlie Jenkins <thecharlesjenkins@gmail.com>

The BIT() macros is used by the validate_v_ptrace() test case, but not
defined. Include linux/bits.h to pull in this definition. To ensure that
the header in the kernel source is used, add tools/include to the header
search path.

Fixes: 30eb191c895b ("selftests: riscv: verify ptrace rejects invalid vector csr inputs")
Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
---
 tools/testing/selftests/riscv/vector/Makefile            | 7 +++++--
 tools/testing/selftests/riscv/vector/validate_v_ptrace.c | 1 +
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/riscv/vector/Makefile b/tools/testing/selftests/riscv/vector/Makefile
index 326dafd739bf..f74a3aa63c87 100644
--- a/tools/testing/selftests/riscv/vector/Makefile
+++ b/tools/testing/selftests/riscv/vector/Makefile
@@ -2,6 +2,9 @@
 # Copyright (C) 2021 ARM Limited
 # Originally tools/testing/arm64/abi/Makefile
 
+NO_LIBC_CFLAGS := $(CFLAGS)
+CFLAGS += -I$(top_srcdir)/tools/include
+
 TEST_GEN_PROGS := v_initval vstate_prctl vstate_ptrace validate_v_ptrace
 TEST_GEN_PROGS_EXTENDED := vstate_exec_nolibc v_exec_initval_nolibc
 TEST_GEN_LIBS := v_helpers.c sys_hwprobe.c
@@ -21,14 +24,14 @@ $(OUTPUT)/vstate_prctl: vstate_prctl.c $(OUTPUT)/sys_hwprobe.o $(OUTPUT)/v_helpe
 
 $(OUTPUT)/vstate_exec_nolibc: vstate_exec_nolibc.c
 	$(CC) -nostdlib -static -include ../../../../include/nolibc/nolibc.h \
-		-Wall $(CFLAGS) $(LDFLAGS) $^ -o $@ -lgcc
+		-Wall $(NO_LIBC_CFLAGS) $(LDFLAGS) $^ -o $@ -lgcc
 
 $(OUTPUT)/v_initval: v_initval.c $(OUTPUT)/sys_hwprobe.o $(OUTPUT)/v_helpers.o
 	$(CC) -static -o$@ $(CFLAGS) $(LDFLAGS) $^
 
 $(OUTPUT)/v_exec_initval_nolibc: v_exec_initval_nolibc.c
 	$(CC) -nostdlib -static -include ../../../../include/nolibc/nolibc.h \
-		-Wall $(CFLAGS) $(LDFLAGS) $^ -o $@ -lgcc
+		-Wall $(NO_LIBC_CFLAGS) $(LDFLAGS) $^ -o $@ -lgcc
 
 $(OUTPUT)/vstate_ptrace: vstate_ptrace.c $(OUTPUT)/sys_hwprobe.o $(OUTPUT)/v_helpers.o
 	$(CC) -static -o$@ $(CFLAGS) $(LDFLAGS) $^
diff --git a/tools/testing/selftests/riscv/vector/validate_v_ptrace.c b/tools/testing/selftests/riscv/vector/validate_v_ptrace.c
index 3589549f7228..257de36274e9 100644
--- a/tools/testing/selftests/riscv/vector/validate_v_ptrace.c
+++ b/tools/testing/selftests/riscv/vector/validate_v_ptrace.c
@@ -6,6 +6,7 @@
 #include <unistd.h>
 #include <errno.h>
 
+#include <linux/bits.h>
 #include <linux/ptrace.h>
 #include <linux/elf.h>
 

-- 
2.52.0


