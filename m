Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A153451AA
	for <linux-kselftest@vger.kernel.org>; Wed, 15 Apr 2026 21:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776286807; cv=none; b=dOwYM+9RqcmlY9aRKFAipV1U/uaeCggIzjUV3+M/EHZ7bl233vu2bcSueDB4JGdekDf57JpSi8oeJOgXUSRI35O8kxW8nTxSWW+yNMT3qHb8KNe67KTy6xpiWv9iaencNxSgQECDtU08nVrjgh1LGfqH9dVNkFSphPe4pGjkBiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776286807; c=relaxed/simple;
	bh=ku5U3Ka0ndjPXP92siQHnGkpd1bCq2hgtWQ4GejuUdw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YAYHjrQ22Vf09Q0zOUV7xFvFxs5mUWiJZEj06KmgSQbrGNBBeIL139oHsXIiu5ySY9JJQZphczQ3ee56rlsGExEHP+CErOQmlGETajtnELNp/ekZ1CHO6ykRWQWndkjw7A7SJUobLl3CxHDpTBISsOlAveYx0OMzFBSNax+hH7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=QgZkpRs+; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="QgZkpRs+"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4888375f735so72236805e9.3
        for <linux-kselftest@vger.kernel.org>; Wed, 15 Apr 2026 14:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776286804; x=1776891604; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oynt2x6SXKNaRU8MrrgQe7iSYgm0Zd6fxbgaEr/IL1k=;
        b=QgZkpRs+o36/snY4PKLY3V+obmxXuEBjGTbZqdjTLZ7KUMwG851EqbFNaNF7Kf8M/9
         PRL1UnNr0vDfgLEElZhNSucJCdFAXlVe6fW59S/qcnO268GqUUQrKl++ninKec2ywCNB
         UmNiEPArRxNe240AY/9Cp/AIhXFJ7C/5FsO3bTVYEixk2zg+a9vhbsANvXq7XkvX9COf
         d7yFchn7aCJeZ4VgKPe0Kzyk5td/poCEIjEP8v6Q+eAfKzqErrAfSzjKNr78OjZ9gsQh
         GYcQseTWfMDNi8WiA2ChuRVP68Zv7cOtZcBpOUJ50StbJBkynulVjtk+54wdqBmTaPE1
         IsXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776286804; x=1776891604;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Oynt2x6SXKNaRU8MrrgQe7iSYgm0Zd6fxbgaEr/IL1k=;
        b=gngFQ4WNWPy2SUG2VQPXqJqeoVOA/UMPx4nAk2+1vxC+yf8+/Wbmq/w9w2kzJCCt9i
         2gtGrPpuZMgxFly8+9kZWj7+Q3vz9v/YO7/oYMI3uAUp66+AAhObCbxyEA24tsjM5QxQ
         JyHnmC0m/0P3TsZhrJq97IWpFCj3jYeKZmCBSRYGRNZ+m4PBTuBecZllEeOJIYFmPwgY
         GCuP5PoMucpgptYwUzic+KlBDDVuYoNZWdJJeh8zHbhSK2f4WM6Ygyn9tauITAYo3ICS
         bNllBDHZDsHssSB7xMBKFFO5cyaUSMuL//uIP+JyilRS4xwyIJyp7tVvrQzFzXR/Gmcp
         qYxg==
X-Forwarded-Encrypted: i=1; AFNElJ8u2p7UCDfy6cM0Kx7PwT/L2NeMho2jJUVNlFOLXEtD71rmfTDnMU2TARHVu64d57ZUsKgrAbY/XrAsI2uzBdg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNzrYnpQsn95UnuUk30gc6mXmU5AIHknZl+5zT1XWEY9O0clwc
	f5U9NMV7tnqdeimgCgZHY8w9yNz9eaI9ZLrP8++V7MPCgUsEYavUDA0pT5cG3lx5bPs=
X-Gm-Gg: AeBDietwMVmxXwFSX/PEOpQPNYcpafRhCKq4cCshMDCCYEjDCp1Ny5qvuVBQvmBDKKL
	UoZXFtMXhovuP1+z9uIqLiXsKSU+VSYaPqa0RLtHvFqXO4+1lTo4M8q6UD4xGM02zH90Kl3EDAX
	NB/2qqRffsCWqCc2/4kbwYDrPKomndDQInqGl3qWTlTvkXrB3t7PmQM42cnHr2rMPXORgAvivpk
	WaXA9IA078yiUv1TTltfpkCh/9OgJzpH1lnpVmYBpejpVHhXk9tkg27AWTbahtgXQ5CzapurIwg
	om76r0Jnz5BxHiXMPNpkuLdOIc5Guo4DznfDphO6EyaUcUMg3xVjanXQJ9eNkYTMESWiEz/krFO
	m9iaknpbNtTJPSemO4wSrsHsFm1yuynvFn5dQ8hZXqDiJcqT1Ga8hEGsNnD+0a5yqtyvYZC472w
	ntD41xl/Nn4QMZhoFoYFWPbQ==
X-Received: by 2002:a05:600c:64cf:b0:485:b6dd:5066 with SMTP id 5b1f17b1804b1-488d67ce664mr310218145e9.7.1776286803497;
        Wed, 15 Apr 2026 14:00:03 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:e41:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c5e61cd32sm3511245c88.3.2026.04.15.14.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 14:00:02 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Wed, 15 Apr 2026 17:59:27 -0300
Subject: [PATCH bpf-next v5 09/11] selftests/bpf: Provide weak definitions
 for cross-test functions
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260415-selftests-bpf_misconfig-v5-9-03d0a52a898a@suse.com>
References: <20260415-selftests-bpf_misconfig-v5-0-03d0a52a898a@suse.com>
In-Reply-To: <20260415-selftests-bpf_misconfig-v5-0-03d0a52a898a@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1776286765; l=5376;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=ku5U3Ka0ndjPXP92siQHnGkpd1bCq2hgtWQ4GejuUdw=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QO7e/UYxw746hiXYJlNuN3lkdDoM2pGfqMjqiIc/PWW1OKv557/Zt0rqGkWmOTbeCyjKNsW6hSl
 L8udp9uaFdQY=
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
 tools/testing/selftests/bpf/prog_tests/iters.c     |  3 +--
 tools/testing/selftests/bpf/prog_tests/test_lsm.c  | 22 ----------------------
 tools/testing/selftests/bpf/testing_helpers.c      | 17 +++++++++++++++++
 tools/testing/selftests/bpf/testing_helpers.h      |  1 +
 5 files changed, 30 insertions(+), 30 deletions(-)

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
index a539980a2fbe..7c0b59fdf498 100644
--- a/tools/testing/selftests/bpf/prog_tests/iters.c
+++ b/tools/testing/selftests/bpf/prog_tests/iters.c
@@ -7,6 +7,7 @@
 #include <unistd.h>
 #include <malloc.h>
 #include <stdlib.h>
+#include <linux/compiler.h>
 #include <test_progs.h>
 #include "cgroup_helpers.h"
 
@@ -202,8 +203,6 @@ static void subtest_task_iters(void)
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
2.53.0

