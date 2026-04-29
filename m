Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E18364057
	for <linux-kselftest@vger.kernel.org>; Wed, 29 Apr 2026 14:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777473283; cv=none; b=QHYl+7nxwaC0pF8q8t4zMrDh7c14Xt1gyCwF9aWqXxDI/WKxuBVKlWUGogN8ZdzyB5HR4P63/nOQnXJQjy4fy3WCmZ2VD08eSGjLRy+Ud0QkUE1EB3kjwBDVab4rYB4xigUplgI8VLUTeJmvU+JcpCaJeUSZS+CoBYIsGwh2gio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777473283; c=relaxed/simple;
	bh=P1kmeBBxz6oLlrcr3TGMtgJ39fvP2CkFwTpn0Vo40DI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d5mXRba8LxsE5EABQH+rssRVodZFub5F3m3evLqhENYvCrRJt8j4xdbxBfV5yEkLi3ZNCxehOBTtzFJidV3fSQhmG/cuw0JR+/EhNiGNLZdZeyZ76p9T6A3GS+S8T8smPUNoSMMZo05hoKfvnFCeLo4psPOGPUbkYIUphHIahxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=XnJvhO5B; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="XnJvhO5B"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488ba840146so113261865e9.1
        for <linux-kselftest@vger.kernel.org>; Wed, 29 Apr 2026 07:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777473279; x=1778078079; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gzn0A233UxptBOFA9FIvgdlvl14jtwnlOOk9eQvvLMU=;
        b=XnJvhO5B1lUnINDyhfj9GqG0kU/o2NlQX0TfHJOHprZ2OZNuAKQJJ0pVJYwTlLk/Ge
         ILlexkEPCWxfA0lcGOtMXGqtIgMZ52OilawzJnMrZvk/3JM342QbVo9lifb2SPEG693Z
         Z36HkshPSLlvM8oymr+LeiusJGjt2WOzeo+Uhvesyr35JoHdBh2+hJyUzqK7UNorygx0
         Jr7g7YwdiBr7CrlMef+sKGOMKjvM/2Q2CcoHbr9OZVMZpH+Jpe7EfaEC8leqNfW1ygPL
         Ovhth4+EMGkZ6lmAKgiUui8aE/7RIZzL2BMWxlUAChcE3qwzGxEWyyz15N2k3Rsd+7iu
         boAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777473279; x=1778078079;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gzn0A233UxptBOFA9FIvgdlvl14jtwnlOOk9eQvvLMU=;
        b=c6vSDuXgpjTh4APCnAvI6IxB03YWRB0XOUS6g3FPrIDXyueQrTQPSbA0wSXUQtAnOW
         rjuGGDWa8pqlmdS+SA1TfZT7A7gGE0jnlI02xVISQXTQuPk7Z0rWZZWYsMe21Oz97pra
         Ib4iYGYZXL6MREaNHHeHa/r5NlC2z+ve/y5B+CGb4f6sOR2ZHP7AUS1xPsi5kRRWzo5t
         NROH5mROHYcHDbSE7hfLYcYa39X0mPFgR+HdqAza/kcjCNE8+tN7Yw7nh94rfdmY+YJn
         CoSAPA+sllPl1txKZA1rJtHSeUXbapBckPb23Sj/fF/4XW2ysqEOG257W3ql0NMl2LHY
         xCFw==
X-Forwarded-Encrypted: i=1; AFNElJ9weZJsXc/OpCVCVLR9r+5yzxe7E9miTXwQCCMeg4TWXcSp2vsSsbCUI5JQk3NYRFh3nGhaOitQaoVhezKba5E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9N8ka/gvvr7n+5GX7Qwu+n9ueHyhtElzzJHtaiiPDk8ofH/C+
	zOx8NzrRuZIwJXCJgLz9OZtL7tcpP8BinLOwEaXelBay0o/mJuDiSjNNcncN8qWOELY=
X-Gm-Gg: AeBDieu17CaofUctTv8ZHYzrwuywLPtRwAbrdZHFivOFftImjhOXSVXnfXmXnzjh7KI
	roDL+eLixLYTu2HZh3NPAc7ZywhZoJirVz6i0rjtatGvtPs0gOJpa/h9Ku83TFq818CaKA+zIkB
	bBNmClurosKTi54pv47v/EB4YfE0lHasuMHayDHy0mtGylrRt6vKYMdutpcpI5m0gu6WtA+MdiW
	suVgHX4l3elGNuQo/ganB+WXzQf70a0tgp1uhICO+o8NpNI+P6Uepi3rIfr1Ia6JUXjc9YiwIk8
	3zEO0Nww5MKVh7xWSoqr0hoyfkmglDF1rBFAspCdqOpUhjnxAtC/MB7YeHFgZJHmTU7NilPfxv/
	aNpUHyVOnutwmJwW9OfIbLimE0kB0GzURfPf6iGB+4roPA9nMgmp9ql9xpnUcQoxdgo2OT2wJZf
	7oNc9z6Ym6p6LyQWobg4HVJqw1
X-Received: by 2002:a05:600c:a315:b0:485:ae14:8191 with SMTP id 5b1f17b1804b1-48a77af3e1bmr89089225e9.5.1777473279194;
        Wed, 29 Apr 2026 07:34:39 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:105d:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-573b6bbace7sm1225062e0c.5.2026.04.29.07.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 07:34:38 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Wed, 29 Apr 2026 11:33:52 -0300
Subject: [PATCH bpf-next v9 10/11] selftests/bpf: Provide weak definitions
 for cross-test functions
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260429-selftests-bpf_misconfig-v9-10-c311f06b4791@suse.com>
References: <20260429-selftests-bpf_misconfig-v9-0-c311f06b4791@suse.com>
In-Reply-To: <20260429-selftests-bpf_misconfig-v9-0-c311f06b4791@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1777473237; l=5203;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=P1kmeBBxz6oLlrcr3TGMtgJ39fvP2CkFwTpn0Vo40DI=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QA1luf9LI1pFBWCJfQKemsD66feofwmQVmFsvvd6r8/8TrTb5z+2GlnP2XaRKBkpj8E7Gx00e/A
 gIUUIg8AjpAM=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

Some test files reference functions defined in other translation units that
may not be compiled when skeletons are missing. Replace forward
declarations of uprobe_multi_func_{1,2,3}() with weak no-op stubs so the
linker resolves them regardless of which objects are present.

Move stack_mprotect() from test_lsm.c into testing_helpers.c so it is
always available. The previous weak-stub approach returned 0, which would
cause callers expecting -1/EPERM to fail their assertions
deterministically. Having the real implementation in a shared utility
avoids this problem entirely.

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 .../testing/selftests/bpf/prog_tests/bpf_cookie.c  | 17 +++++++++++------
 tools/testing/selftests/bpf/prog_tests/iters.c     |  2 --
 tools/testing/selftests/bpf/prog_tests/test_lsm.c  | 22 ----------------------
 tools/testing/selftests/bpf/testing_helpers.c      | 17 +++++++++++++++++
 tools/testing/selftests/bpf/testing_helpers.h      |  1 +
 5 files changed, 29 insertions(+), 30 deletions(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/bpf_cookie.c b/tools/testing/selftests/bpf/prog_tests/bpf_cookie.c
index 35adc3f6d443..5a864cd8ad1b 100644
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
+noinline __weak void uprobe_multi_func_1(void) {}
+noinline __weak void uprobe_multi_func_2(void) {}
+noinline __weak void uprobe_multi_func_3(void) {}
 
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
index 6fbe1e995660..3f7ae76c209b 100644
--- a/tools/testing/selftests/bpf/testing_helpers.c
+++ b/tools/testing/selftests/bpf/testing_helpers.c
@@ -5,6 +5,7 @@
 #include <stdlib.h>
 #include <string.h>
 #include <errno.h>
+#include <sys/mman.h>
 #include <bpf/bpf.h>
 #include <bpf/libbpf.h>
 #include "disasm.h"
@@ -516,3 +517,19 @@ bool is_jit_enabled(void)
 
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

