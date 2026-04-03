Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3123CBE91
	for <linux-kselftest@vger.kernel.org>; Fri,  3 Apr 2026 14:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775228378; cv=none; b=C6ZRvlihya0tpyMrct4Fo5M1Xy4VKeTb03RsBYDKP1I1oAgCzvFd7RhNRSZ1cx5PVuBhsSDKsoAQhJeeCBe2aOrHKbFJxXwoz2W1Aofp5nXLATh7KfjWasTrg10dywIdN5m8bnF0IlzVKGTsGzQw2LHxnd2F3jkW6dc7xPSFq58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775228378; c=relaxed/simple;
	bh=CWrUl3nngNLLkNWUjGrRyYauYMa3BfaOEPnf4E9SCrw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G1z2PkeIfCWixKD2WWTL15moiwqaEQFwdJQTozfTeM5C6B7Frscm89YL+R099y7ggRyCAT2FjNXLtrHnbhrqrJEmRl4H8W65BEDlGa/uRgVZR8UB4LxnLetJeyXCkK7QBkvJJMWJ47te/cqGFKsD7ZeDQY3IS+9gVNlAjHvkYGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ZyWt+E+q; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ZyWt+E+q"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-486b9675d36so17286865e9.0
        for <linux-kselftest@vger.kernel.org>; Fri, 03 Apr 2026 07:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775228375; x=1775833175; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WCZbMI7HRv+cCcgpbRQIHtBN+KMA+UT3Ct0Z9N6Znxg=;
        b=ZyWt+E+qDi/yeqe01rCNwzfuUvOm+WaEIt+z6oxlcRdi0Vkhhz1uzKwvrM7ERG2Utj
         QsMyzbDR5/auAqObuEAvzCZT78mIWjfxGL0ChzMxH6gvmIjwWWA4DfsEoDuFn0WPH+if
         UmfFCEIqQgqFF68H0MzEru4YVNuVv4PTANk5LstmkXRY02GGHGD3Um/amyjy0Kh1ysp1
         sRe53+pwYmWNCkBbaxj2JdI1J/sQxCs2yTNavXs2B4hjiWhQvXl1f6xfKjoxbwz0pwQm
         mGWtOxUoU2rYODhP0a2x+3wiZL6J/8RSfH1H4+dcSGLdBPuQ56lNb2gTM1V5m+0dEgZp
         EVoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775228375; x=1775833175;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WCZbMI7HRv+cCcgpbRQIHtBN+KMA+UT3Ct0Z9N6Znxg=;
        b=LF1Y7EH5s9aTVSKCd4lKzyszzyFuxnVdNlzKbWMOcuGPlVYKiRs6Ysoq75yxYkI/dR
         Pedlw5FqGCajapJhtYNhMAR0NVrMn8gBIZ1R3aVXt0F09uF+MqqL85NfTWe6rVnX4M6B
         bGmq/C/35CsfZvlI4NY+9lmNR4/FYN3uUR056+Va6aDwEfh5O5pBknctGfDzZoWlPSNX
         TajVFcdvAa3g4YDq88fUfftIi83U50S97NyNMDVw5xViA6M+8Q3axQ2KTg3f1md50ybw
         PTiuUyp57sezHHYGgc/vBtW3NdGJALv3RYqxZaN9sz6u+avEtvt6o+1l/BWWVvdTecbn
         H58w==
X-Forwarded-Encrypted: i=1; AJvYcCVPq5ib+r9wxHKtp+Vr5cVEMsdZNgxxpqqEg1CTtrqcSsacy0U2ztZ+vKPjvylxAWaZyjddVuFrPFjK/y3P0W8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx49H044Oy0nTJaquI8Az5Gj6AVztwS2Et+m8zu7AelC9QuEuT1
	lJzImJBisqlnVWmJeK3IpIDgr1zonWwYDRf0/ydsbpPuuZjPISuikzId8jeNaxiZ8m8=
X-Gm-Gg: ATEYQzyYduROHqxPPdwM8cMipVtDgRtylioJLzgMvzVw6eOgNjCGLyll0IqbSrSdJP1
	frh6trz5SymdHYhZpdbLxG35cnnqpq7hRFs0GxbZuucaTIhn71zO9YoJS6b94qgPgRXhZ1hW9LB
	9qNa9gDpGHj40ZvCKTPDNaebv79YncU4FBIx+1iT5c8K6EFAK85sh9326K0waR/om+HcTo2S6N6
	d8Gn2vI6do61Z8WjTFUQC+bFC/u/rMEeq5mtAHkm/ePcQsWHkunw/y8jl/t10ZdhlpP58Z7ei/A
	Mp6pokxoXGUxqzsZqPlO13C4vqjrTdifquTrdNFEH1hOFmfRHSi0Jr5RgwHiEA2M6u6/t+Je4mQ
	leVmdYfZ8acWt417A0YFju309DjfpiVKC4tuJEixOFW3DLFfBs9mdKsQrCf3q4+ynKXHOvjIa44
	Q2r/7Z0SVS
X-Received: by 2002:a05:600c:a117:b0:485:3ff1:d5c5 with SMTP id 5b1f17b1804b1-488996ecd84mr36638675e9.7.1775228375430;
        Fri, 03 Apr 2026 07:59:35 -0700 (PDT)
Received: from localhost ([189.99.238.3])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d9bae1117sm7077289e0c.7.2026.04.03.07.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 07:59:34 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Fri, 03 Apr 2026 11:59:01 -0300
Subject: [PATCH v2 08/10] selftests/bpf: Provide weak definitions for
 cross-test functions
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-selftests-bpf_misconfig-v2-8-f06700380a9d@suse.com>
References: <20260403-selftests-bpf_misconfig-v2-0-f06700380a9d@suse.com>
In-Reply-To: <20260403-selftests-bpf_misconfig-v2-0-f06700380a9d@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1775228344; l=2984;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=CWrUl3nngNLLkNWUjGrRyYauYMa3BfaOEPnf4E9SCrw=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QFKqWxNUQWIxjTYwXeOcrrf5lpFtWyHGdFp5HF1OQSM6+NpS9VOMq88Mg+K2mWsWEjq24pC3OGP
 MnTrRG99BHgg=
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

Signed-off-by: Ricardo B. Marliere <rbm@suse.com>
---
 tools/testing/selftests/bpf/prog_tests/bpf_cookie.c | 20 +++++++++++++++-----
 tools/testing/selftests/bpf/prog_tests/iters.c      | 10 +++++++++-
 2 files changed, 24 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/bpf_cookie.c b/tools/testing/selftests/bpf/prog_tests/bpf_cookie.c
index 35adc3f6d443..1619490f1e5c 100644
--- a/tools/testing/selftests/bpf/prog_tests/bpf_cookie.c
+++ b/tools/testing/selftests/bpf/prog_tests/bpf_cookie.c
@@ -252,10 +252,13 @@ static void kprobe_multi_attach_api_subtest(void)
 	kprobe_multi__destroy(skel);
 }
 
-/* defined in prog_tests/uprobe_multi_test.c */
-void uprobe_multi_func_1(void);
-void uprobe_multi_func_2(void);
-void uprobe_multi_func_3(void);
+/*
+ * Weak stubs; the noinline definitions in uprobe_multi_test.c take
+ * precedence when that translation unit is compiled and linked.
+ */
+noinline __weak void uprobe_multi_func_1(void) {}
+noinline __weak void uprobe_multi_func_2(void) {}
+noinline __weak void uprobe_multi_func_3(void) {}
 
 static void uprobe_multi_test_run(struct uprobe_multi *skel)
 {
@@ -574,7 +577,14 @@ static void tracing_subtest(struct test_bpf_cookie *skel)
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

