Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9920E388397
	for <linux-kselftest@vger.kernel.org>; Mon,  6 Apr 2026 16:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775491925; cv=none; b=MZjsma5hGe2AzNylBfs/2+wfOjsB6/jXXLBsdRyYZ7p5SPc35Ec3e2HzM+W1Q0wGoqmU78iURd4yxgzwhM1W3BAISZWrkDsI4+RXZkn18pGE5HTAddBHky6Oej9jSXXTWyzLEO/i8hJYMauYLW7FUp27sogjTSxqPjuerIMnF/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775491925; c=relaxed/simple;
	bh=oi9iikLLALiEnY24VFCpWcYTkvvNa+ktRrLGnTBV65k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LwCi7f0o58bt+doTUdBUHHmfKY5Knm6CAu4moBv6o5ugQjSPTc0+vEgI7iQlFPUWXW2KfMiJv0+Tv6UjwS/ryn5tLmC12C9G+0is1c7bRZZh5FBL5sk4kPndd9U1HVGDJt+oBvU8IYV51tmZ5GNPzKbQyoAmeFliZyMSyBT+CLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Iw/Q0MOO; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Iw/Q0MOO"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488a8ca4aadso19824505e9.3
        for <linux-kselftest@vger.kernel.org>; Mon, 06 Apr 2026 09:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775491922; x=1776096722; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hnBUcaHO1k2gTBLDn9MaOizJd/ELdZ7iIsdz0Nzo7xE=;
        b=Iw/Q0MOO9EGQyvFst/bpU55xiB9CXZjX7sUQ2iBmjRVXFLDcnSlRbUgjYiuoQfV67H
         rBRFq4sVxLR483O1GzgqK34jrISddxUAVvlpet6itQHZxHIxXobklP7tEu9nddGsyUMz
         c95gEieLBm4s+o0dFiPZiIMj3uWVHkmFnJhgGGP2llDBJQHlHVJ3sSUBcElsuhsBLTRL
         mTlD4yHIrpVByZTSAAWZ3uDNGoIRgeoE+il7aJe0JdZy8fj71mp6UqUlMXEcPsv03JQ1
         ps+caFHiVS7Rrt0citmDfIlZPFur3mwIXTMcU1PK0KBmZC+9snVWmXofgFxQKVbABmZn
         eGQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775491922; x=1776096722;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hnBUcaHO1k2gTBLDn9MaOizJd/ELdZ7iIsdz0Nzo7xE=;
        b=ihldS4/0b5ewjxyjvkKIUnbJxb3O6t4v9/rAJHmsyFrxYc7tIdUTF/rbNOXIEOmIoP
         lsZkcuXlnJoh6/ghui+hUBTjBFEX+L3Vl9foLO7iDPN5KILve6DvS7Y69vY6baBamP6O
         KiVz0P2yis0qT8X86VjKn1kps2tHtPcbN7QKR3xQPCt84SE/cHdJUqZfi8CYmz2bLcD1
         c4q0q/46j/Dshj5JDmiUI1buqJfaLXAJAijC0iXy0ruOKA4wxMwCDYmp6H+Gwx2mUZct
         Rhwp5VmkkSbXywfAvigki5FLY+J+XWyKq/ZGr3BLdEupjPmgi1pDZv3GnvISVve5g662
         ePAA==
X-Forwarded-Encrypted: i=1; AJvYcCX+eZOHrByOIsVhbj/x9GBnz+cnM5/o3b1q2NXh24z+v1QnDN45PNM7O7MAH9OZSLu+AWP3VMfhmWxAtHjqOhY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzprmDz+KM0hEWKfnU7eL4Hwd1+kA25C1DTLGHAdzCHNYKh3nGh
	PhUBEI7eTbycp0GKZhA+BXLwLFctGzXPdRnPdVCIOKBHn8eXSVv/gVTIz27812Uhc3o=
X-Gm-Gg: AeBDiesWKcodvSWXe6BV/FOA1ImrupSnRZG0jI8PACWMveXgohW4UveG1VT4jC08iO1
	Khmb0lnM0jl2IgKNQK083R6eMvQi23sXmny76KNJxOevIpXS7JIMHO3Vlqp3oVsIr3SeowxUSjB
	EZlpCNR2zlFjPyhvOGGJrY4dMaHqObxr90SQpbMLBo5U8S7S2ErNSUvT/b132UZtlZS5mIsqZ4N
	FbS+jFo3Hl0RetpP/e9NkmNyMs0U4vfaWofeTQ1R9SdgWut1jnUOX3t8Frw8fKzs+f3d9jEBkax
	k/gXQvgzLCel4VSJyu4kzMps/sy3QKl0rwe3d7v9mI3/wHIRSQVorVtL+ZM/uf7ImwKr021w4Ot
	nd8pT66jIoXIF9eS21fBwqyTpDpbFS5aa0CbX4lWh7Dg8AmNYut5pKS/BfUEnaKVDKCD3ZeN81Q
	m4ModJiC62UBEB
X-Received: by 2002:a05:600c:a009:b0:488:ab26:8fe0 with SMTP id 5b1f17b1804b1-488ab26986cmr87380265e9.15.1775491921954;
        Mon, 06 Apr 2026 09:12:01 -0700 (PDT)
Received: from localhost ([2804:7f0:b767:120d:a4df:3777:2c55:2b95])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d9bc9b75dsm16666413e0c.12.2026.04.06.09.12.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 09:12:01 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Mon, 06 Apr 2026 13:11:31 -0300
Subject: [PATCH v3 09/11] selftests/bpf: Provide weak definitions for
 cross-test functions
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260406-selftests-bpf_misconfig-v3-9-587a1114263c@suse.com>
References: <20260406-selftests-bpf_misconfig-v3-0-587a1114263c@suse.com>
In-Reply-To: <20260406-selftests-bpf_misconfig-v3-0-587a1114263c@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1775491886; l=3476;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=oi9iikLLALiEnY24VFCpWcYTkvvNa+ktRrLGnTBV65k=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QMRTO33ERhhKfJ3eGSF1yW6vRg+Wttw4K4j+X0ZxQTzTC1K0lH5zSBwBokSdV6FtplgSEFDUijf
 DN7iSGsqSWQ0=
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

