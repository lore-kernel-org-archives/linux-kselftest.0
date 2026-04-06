Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451BB394789
	for <linux-kselftest@vger.kernel.org>; Mon,  6 Apr 2026 18:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775499772; cv=none; b=N0kfYl/6Peq2UwX+qp2VOZa59P5IpccWXQb2sgGTTA8vkmd49Yo1mpnJF3FKjz3VOaJElYJqHwIZib+bjRE4ApdjKV4eo6VS7fotOsujDaDEnIV5QjjXhMqcl0hRjJBNioqtofckKREKhLcavB1kgXvRdWybXLx0ubeQ15wNpaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775499772; c=relaxed/simple;
	bh=oi9iikLLALiEnY24VFCpWcYTkvvNa+ktRrLGnTBV65k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mn0HAtT7vWjuOfEUylx1FjPufSShyVEEOw/3JWEqjgFJ4oU8tQ8wcqzXCvF75HXUBqRj0HSVZV+P+ZRmVFi78+pq3xRAR+beSWs7WQSQt+4IojA5NJqi4eRGJXaKS7wNT5IlI6RwaRSJAn550y/DXHkfpeJfWsI5Q8gdMvPCc9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=M5NiXqbo; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="M5NiXqbo"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso19683705e9.3
        for <linux-kselftest@vger.kernel.org>; Mon, 06 Apr 2026 11:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775499766; x=1776104566; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hnBUcaHO1k2gTBLDn9MaOizJd/ELdZ7iIsdz0Nzo7xE=;
        b=M5NiXqboFE0/IJYSuw7fGtXFrnAEsIgjIZ4IfQyW0BzcYL19ToEFz20TyqA9JwHBNS
         CRq9cGclN2kXAEMETbV/M9DaBTuA1PYCx7TMpABbkv3dq3nMSYLvHEZEpJj7M7RTJ/98
         cfCCO++TPzCzMnJoto+9Gt3El8DA74tGF07EW9b86rOBpCazmeW4dVJWMD/gcFknMv/w
         44zKIcaqAFJHJrw2+v+vAVNs4REN0Fi7LlvZmUaLaYQ5nEbhDKYkqgj5DHbGOYHgk4XP
         1duypryJw0b4baVJnICc+uEtSWgYToWoGscXkaY4M7qawyPQYncP4DLPYBIMVzm86C/3
         UOuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775499766; x=1776104566;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hnBUcaHO1k2gTBLDn9MaOizJd/ELdZ7iIsdz0Nzo7xE=;
        b=Nh6AKd2wsQFd82c/CZbGlbkfqbqmoJ/T7IYRrq7bUmV21VWnuNLkXAbnJ8DZPHKMNx
         aZtf0eP7004fBd41hQMKzu4hxLElKUG668cSBy6U59dvqvGk9srSp+RYxBdkY9c27pak
         HsjpsFu9OuP6vIAVcIM/EqPEuH21oMAXf2gaUWNMEEK+rzmR9L0qePd1CTBtZ5gKsY+N
         nnQyx1Rn7iPBM5kUw9rqTDPLLMxz6R6i7L12qPyEjRhZT1Zly2/n9hwRBFJBcS3hXwvl
         XhrmoZxOdk+75ZERuP0wL+QuGjUJT5FnFyuj2OVtKI9gRW149npomeDn7IGtWX1cJA5x
         TINQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOyZUuRYHIMg/fJoP/uqN0rPAa5S9zi1TkOgSAwEdiawwX9cJGE4AftpZ38ETO1m6RU55+ZBbjgGs6+uQfisE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGLYpwf56GX/fmV8WDVU6OROGWTLuG2anOOP29NYb6yYMlivRA
	NjmXgnRlnM68MNmYOzGpF0ecFd9xpKniEUp9IhHsDAaKCVE2qSmbRIadivQnT0ya4m4=
X-Gm-Gg: AeBDieszu2jVtJITlPFr70fCsYm1eAmTlTrjlwJQi5snd1pr70INpZzlIkgeQYDAzDU
	5/A69No6hOVPcEIUcVhNa0nbySoRQ/vWh4La025fW3D+iID4L4v+xkoW710r6eG5yZ37a1KDE0d
	qgGRg5CTAfFpu7Icr7fP1zXmfmiyhJHWa6TCL9x75nNolG1yMDjFiFBCM6mjfYTI6gClM5jMl9t
	P5a6cgKIdE7+TMyU9KoFL4Q1Ozhb5nEbUHxvPogA/TTDfiuUnEFEIOjMQJoLL2uHus6uiwTuwIL
	4/87C0JeaY8R2BO/tiX8nvBWPFtJyqKYRjVvC/YW8apHYppar0UTse1i8SYOdCS58YgLeA5fNl1
	H7S7oQyXXAyeq8tLvk9ob9z0RVg8acFr0PVGoaVsaynYq56cQDJCmtolO570cNSbDiO77a3HLWA
	tQ2pheo0Ifl8sB
X-Received: by 2002:a05:600c:4ec7:b0:485:3a03:ceca with SMTP id 5b1f17b1804b1-488997ee016mr179420795e9.23.1775499765553;
        Mon, 06 Apr 2026 11:22:45 -0700 (PDT)
Received: from localhost ([2804:7f0:b767:120d:a4df:3777:2c55:2b95])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d9bd0a8a3sm18067021e0c.17.2026.04.06.11.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 11:22:44 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Mon, 06 Apr 2026 15:22:20 -0300
Subject: [PATCH v4 08/10] selftests/bpf: Provide weak definitions for
 cross-test functions
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260406-selftests-bpf_misconfig-v4-8-9914f50efdf7@suse.com>
References: <20260406-selftests-bpf_misconfig-v4-0-9914f50efdf7@suse.com>
In-Reply-To: <20260406-selftests-bpf_misconfig-v4-0-9914f50efdf7@suse.com>
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
 =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openssh-sha256; t=1775499736; l=3476;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=oi9iikLLALiEnY24VFCpWcYTkvvNa+ktRrLGnTBV65k=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QDcyKsZj5BbhkMTaLt7zN8tfoxhdaU278E5+BE1RWJOQzirY89Ld9uBt7Bx6eSfNMZOelIVxE3s
 CgmuRL8nbfwc=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

Some test files reference functions defined in other test translation
units. When those units are not compiled (e.g. because a BPF skeleton
could not be generated), the link step fails with undefined references.

Replace forward declarations with weak stub definitions for:

 - uprobe_multi_func_{1,2,3}() in bpf_cookie.c (defined in
   uprobe_multi_test.c)
 - stack_mprotect() in bpf_cookie.c and iters.c (defined in test_lsm.c)

The linker will prefer the strong definitions from the original objects
when they are present, and fall back to the stubs otherwise.

The uprobe stubs are marked noinline because uprobe_multi_test_run()
takes their addresses directly to configure the BPF program's uprobe
attachment points. An inlined function has no stable address in the
binary, which would cause the attachment to probe the wrong location.

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 .../testing/selftests/bpf/prog_tests/bpf_cookie.c  | 24 +++++++++++++++++-----
 tools/testing/selftests/bpf/prog_tests/iters.c     | 10 ++++++++-
 2 files changed, 28 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/bpf_cookie.c b/tools/testing/selftests/bpf/prog_tests/bpf_cookie.c
index 35adc3f6d443..5fc6b2cd0bb9 100644
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
@@ -574,7 +581,14 @@ static void tracing_subtest(struct test_bpf_cookie *skel)
 		close(fmod_ret_fd);
 }
 
-int stack_mprotect(void);
+/*
+ * Weak stub for stack_mprotect(); the real definition lives in
+ * test_lsm.c and takes precedence when that object is linked in.
+ */
+__weak int stack_mprotect(void)
+{
+	return 0;
+}
 
 static void lsm_subtest(struct test_bpf_cookie *skel)
 {
diff --git a/tools/testing/selftests/bpf/prog_tests/iters.c b/tools/testing/selftests/bpf/prog_tests/iters.c
index a539980a2fbe..6888bc9173fd 100644
--- a/tools/testing/selftests/bpf/prog_tests/iters.c
+++ b/tools/testing/selftests/bpf/prog_tests/iters.c
@@ -7,6 +7,7 @@
 #include <unistd.h>
 #include <malloc.h>
 #include <stdlib.h>
+#include <linux/compiler.h>
 #include <test_progs.h>
 #include "cgroup_helpers.h"
 
@@ -202,7 +203,14 @@ static void subtest_task_iters(void)
 	iters_task__destroy(skel);
 }
 
-extern int stack_mprotect(void);
+/*
+ * Weak stub for stack_mprotect(); the real definition lives in
+ * test_lsm.c and takes precedence when that object is linked in.
+ */
+__weak int stack_mprotect(void)
+{
+	return 0;
+}
 
 static void subtest_css_task_iters(void)
 {

-- 
2.53.0

