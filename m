Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23FFE3EC2E3
	for <linux-kselftest@vger.kernel.org>; Tue,  2 Jun 2026 13:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780405436; cv=none; b=KX/plBJjbQm0PL2i1CJpEdbKwNuZKomI7Tgjs7AV5GEPtoYbHkIEfm9G80GYe1esc8vozWPVu8wcJNUNAeTHMOZDOUM9XIhhvSCRgoRHSzEDKL1HbewbN4BTZo73ZSBhZzPv+zZ/AUcBCZacvsZng9LtiCsI0X1NC5wxYFeTJzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780405436; c=relaxed/simple;
	bh=PEQ/hH8f9EfEO3m9jfnl1sYEE2Fvx6y97vzN398bHFI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ijC3mnN7+dvr46BEoE8AK4XHNn4j15VoMBsuxSvDf+QbGQJ2BBf+S8Py4IDgx1YprjqDNGAS/5K+J3XE1fX7tYiL548IJp8eoc7E0p89i9fphnhsOo72HEqqwgTv+dBQSqBty4wbt2GGgStO7Tg/HRgB84R9YkO5PNc/yctuntg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=awcJThJM; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="awcJThJM"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-bec49f7e35eso326020366b.2
        for <linux-kselftest@vger.kernel.org>; Tue, 02 Jun 2026 06:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1780405432; x=1781010232; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=da/3P3gWrWPT2pVZ+wpt21mcmTeD9JLfhBM9QpqBcIo=;
        b=awcJThJMdlJPj+rBAMyST3ZbKi+/sLdyJcFbLSZk4OaYlZJlbnNPaaWqXrJgMuKszp
         RUa2ayYx7zDF+jCeAxGWWUxN+Ljilhgdwa+Eq+xL4yH4a0D5EbTN1Bxogb6OH4AtkOSq
         YvLeUh3opdM+zVbLko1YM3FzkDc4p5IKKPaPAhbJoFdTjkv17OyTzdpOgqJBGb/398SM
         oClzw7QOrqbnXJkRGipm4vdQET0Dd4p1858lnHYk4iqapmgiw76ssjJOhOP0cn1Uyh1E
         mi+V4mjG1aEfuSTLN0xORZcVw7R7y2Q5AwZaY6o5eRj30wXYLttz8TVq3wZGqIHxqXCU
         m7qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780405432; x=1781010232;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=da/3P3gWrWPT2pVZ+wpt21mcmTeD9JLfhBM9QpqBcIo=;
        b=QXC1KvlBVgIzD5WOZc0WPQ7qIEWRr6xdLoOEcA9Lue5N6dBL1XIxF4p6Dqka05+TBx
         tAJjPLwj53n3bZ5P+4nLpF+mGtaToMGdObcFb9MnfGfLe7giulHKVfDV7lernaxVeh5D
         meNflUCTogZ8j7c43zDtKve/LYe98no6IPci5OTl4jfb517I78vl1kK5VZVIp5nFgnHT
         YdL4bfbkQ1yNh40orlfpGaMXqvJVgI/Vz/XbMb3eR/3Xt4xPKEAgT7sAZ9bvsng2OYuL
         V+HdSmP1iSuRNpavM/VdwgGLLEo6Gu76l7XTFz/bEu+66f65Ppu0QbGqVL/m7Ue7J1VA
         UlGA==
X-Forwarded-Encrypted: i=1; AFNElJ/dIi85PkR4DQiMiBOort36BuJ21yR6PeSyKff67erMbKBR51GKVo2GGsdUadZRHbO+67cKL7YWR5rM/ZK6ot4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwabQDB85NJ9apB8DB/0hNWs8dnC30LJsSwUXSAOU6GHVk04AIt
	jVaB9ecXb3fs5yfy1djRSmtviLiBAQYHSXTi3W4ONayf7v0/5XxBOMI2DwkYWhrRlaw=
X-Gm-Gg: Acq92OGezVbmoga7n2b8offJsbYxlWTx+n9z44R/9f0gaCIWnbolnKyiUSSH1+kqS61
	WmxdrQB8UCwBspIM7/WHSEfa6GLeokCCYqINxeEHMcWt7zMsbyPizaXywx/wHeXo/NEL/93H9mI
	jyYmgngq2Cm5ePb7bcilNYxpZbCfA2Uv13PY3cuAaQxdO47hSLsj91avSmoDdQi9xrdGgeGhoAP
	wBB3zVWiF2+ic/tcSyvWg4/taXIUoDw3otddIgy/R4XKOuthe3eXHN850mocSOIWyShPVNo7U1e
	OI8dVh4j5SRQq+HF9y39wQgAt398rZeurAhYQYmrkksSrNaCCTVQ1AP5eBE3H9JDXLlLkVmFk/V
	jBLpnNGNAksWb4zQ28YoE4AhN9/hhLRC0lF4k1WrxS79INmScpdb6ErcA8spFpadpw86oAft7WR
	fVHtbyWax6oVk7aHyCQ+qHWQ==
X-Received: by 2002:a17:907:c5c5:b0:bed:5774:7c17 with SMTP id a640c23a62f3a-bed577482b9mr538543966b.5.1780405432457;
        Tue, 02 Jun 2026 06:03:52 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:e15:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-beed0fc69b3sm146958666b.39.2026.06.02.06.03.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 06:03:52 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Tue, 02 Jun 2026 10:02:59 -0300
Subject: [PATCH bpf-next RESEND v12 10/11] selftests/bpf: Provide weak
 definitions for cross-test functions
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260602-selftests-bpf_misconfig-v12-10-27f898b3ba26@suse.com>
References: <20260602-selftests-bpf_misconfig-v12-0-27f898b3ba26@suse.com>
In-Reply-To: <20260602-selftests-bpf_misconfig-v12-0-27f898b3ba26@suse.com>
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Martin KaFai Lau <martin.lau@linux.dev>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1780405395; l=5710;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=PEQ/hH8f9EfEO3m9jfnl1sYEE2Fvx6y97vzN398bHFI=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QBTVRNTxzUi2XqPufZT6zDHYVbUJnRE3O4cjr+vAN+hD8V/ct6HjyUPc1u/rn/AEEo5GqZ65Kw3
 praTwzC1ksQA=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

Some test files reference functions defined in other translation units that
may not be compiled when skeletons are missing. Replace forward
declarations of uprobe_multi_func_{1,2,3}() with weak no-op stubs so the
linker resolves them regardless of which objects are present.

The stub bodies are `asm volatile ("")` rather than empty, matching the
shape of the strong definitions in prog_tests/uprobe_multi_test.c. This
keeps the weak and strong sides on the same footing for the optimiser
(noinline + asm-barrier), which is the form upstream already relies on
for these functions.

Move stack_mprotect() from test_lsm.c into testing_helpers.c so it is
always available. The previous weak-stub approach returned 0, which would
cause callers expecting -1/EPERM to fail their assertions
deterministically. Having the real implementation in a shared utility
avoids this problem entirely.

Include <alloca.h> for alloca() so the build does not rely on glibc's
implicit declaration via <stdlib.h>.

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 .../testing/selftests/bpf/prog_tests/bpf_cookie.c  | 17 +++++++++++------
 tools/testing/selftests/bpf/prog_tests/iters.c     |  2 --
 tools/testing/selftests/bpf/prog_tests/test_lsm.c  | 22 ----------------------
 tools/testing/selftests/bpf/testing_helpers.c      | 18 ++++++++++++++++++
 tools/testing/selftests/bpf/testing_helpers.h      |  1 +
 5 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/bpf_cookie.c b/tools/testing/selftests/bpf/prog_tests/bpf_cookie.c
index 35adc3f6d443..fa484d00a7a5 100644
--- a/tools/testing/selftests/bpf/prog_tests/bpf_cookie.c
+++ b/tools/testing/selftests/bpf/prog_tests/bpf_cookie.c
@@ -252,10 +252,17 @@ static void kprobe_multi_attach_api_subtest(void)
 	kprobe_multi__destroy(skel);
 }
 
-/* defined in prog_tests/uprobe_multi_test.c */
-void uprobe_multi_func_1(void);
-void uprobe_multi_func_2(void);
-void uprobe_multi_func_3(void);
+/*
+ * Weak uprobe target stubs. noinline is required because
+ * uprobe_multi_test_run() takes their addresses to configure the BPF
+ * program's attachment points; an inlined function has no stable
+ * address in the binary to probe. The strong definitions in
+ * uprobe_multi_test.c take precedence when that translation unit is
+ * linked.
+ */
+noinline __weak void uprobe_multi_func_1(void) { asm volatile (""); }
+noinline __weak void uprobe_multi_func_2(void) { asm volatile (""); }
+noinline __weak void uprobe_multi_func_3(void) { asm volatile (""); }
 
 static void uprobe_multi_test_run(struct uprobe_multi *skel)
 {
@@ -574,8 +581,6 @@ static void tracing_subtest(struct test_bpf_cookie *skel)
 		close(fmod_ret_fd);
 }
 
-int stack_mprotect(void);
-
 static void lsm_subtest(struct test_bpf_cookie *skel)
 {
 	__u64 cookie;
diff --git a/tools/testing/selftests/bpf/prog_tests/iters.c b/tools/testing/selftests/bpf/prog_tests/iters.c
index a539980a2fbe..c0b6082f345a 100644
--- a/tools/testing/selftests/bpf/prog_tests/iters.c
+++ b/tools/testing/selftests/bpf/prog_tests/iters.c
@@ -202,8 +202,6 @@ static void subtest_task_iters(void)
 	iters_task__destroy(skel);
 }
 
-extern int stack_mprotect(void);
-
 static void subtest_css_task_iters(void)
 {
 	struct iters_css_task *skel = NULL;
diff --git a/tools/testing/selftests/bpf/prog_tests/test_lsm.c b/tools/testing/selftests/bpf/prog_tests/test_lsm.c
index bdc4fc06bc5a..d7495efd4a56 100644
--- a/tools/testing/selftests/bpf/prog_tests/test_lsm.c
+++ b/tools/testing/selftests/bpf/prog_tests/test_lsm.c
@@ -5,36 +5,14 @@
  */
 
 #include <test_progs.h>
-#include <sys/mman.h>
 #include <sys/wait.h>
 #include <unistd.h>
-#include <malloc.h>
-#include <stdlib.h>
 
 #include "lsm.skel.h"
 #include "lsm_tailcall.skel.h"
 
 char *CMD_ARGS[] = {"true", NULL};
 
-#define GET_PAGE_ADDR(ADDR, PAGE_SIZE)					\
-	(char *)(((unsigned long) (ADDR + PAGE_SIZE)) & ~(PAGE_SIZE-1))
-
-int stack_mprotect(void)
-{
-	void *buf;
-	long sz;
-	int ret;
-
-	sz = sysconf(_SC_PAGESIZE);
-	if (sz < 0)
-		return sz;
-
-	buf = alloca(sz * 3);
-	ret = mprotect(GET_PAGE_ADDR(buf, sz), sz,
-		       PROT_READ | PROT_WRITE | PROT_EXEC);
-	return ret;
-}
-
 int exec_cmd(int *monitored_pid)
 {
 	int child_pid, child_status;
diff --git a/tools/testing/selftests/bpf/testing_helpers.c b/tools/testing/selftests/bpf/testing_helpers.c
index 6fbe1e995660..c970e7793dfc 100644
--- a/tools/testing/selftests/bpf/testing_helpers.c
+++ b/tools/testing/selftests/bpf/testing_helpers.c
@@ -5,6 +5,8 @@
 #include <stdlib.h>
 #include <string.h>
 #include <errno.h>
+#include <sys/mman.h>
+#include <alloca.h>
 #include <bpf/bpf.h>
 #include <bpf/libbpf.h>
 #include "disasm.h"
@@ -516,3 +518,19 @@ bool is_jit_enabled(void)
 
 	return enabled;
 }
+
+int stack_mprotect(void)
+{
+	void *buf;
+	long sz;
+	int ret;
+
+	sz = sysconf(_SC_PAGESIZE);
+	if (sz < 0)
+		return sz;
+
+	buf = alloca(sz * 3);
+	ret = mprotect((void *)(((unsigned long)(buf + sz)) & ~(sz - 1)), sz,
+		       PROT_READ | PROT_WRITE | PROT_EXEC);
+	return ret;
+}
diff --git a/tools/testing/selftests/bpf/testing_helpers.h b/tools/testing/selftests/bpf/testing_helpers.h
index 2ca2356a0b58..2edc6fb7fc52 100644
--- a/tools/testing/selftests/bpf/testing_helpers.h
+++ b/tools/testing/selftests/bpf/testing_helpers.h
@@ -59,5 +59,6 @@ struct bpf_insn;
 int get_xlated_program(int fd_prog, struct bpf_insn **buf, __u32 *cnt);
 int testing_prog_flags(void);
 bool is_jit_enabled(void);
+int stack_mprotect(void);
 
 #endif /* __TESTING_HELPERS_H */

-- 
2.54.0

