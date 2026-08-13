Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF955353A69
	for <linux-kselftest@vger.kernel.org>; Thu, 13 Aug 2026 06:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786602854; cv=none; b=BP5y1LWYbTyBvIjorZQxwVejnIgXw5dD1y64DlipugMbcVDf2vS6JvAPTwe0C+wmZ9KTjY07BIcPsDa1CtAP4easDRkJLrfpaD2aDSS/AW5v8ZD3Lfi6LKXN5uxL3LQOhK4Va36U+An0shyf/2VxkUuIHyPHRLl5D5ZaqK8Wf9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786602854; c=relaxed/simple;
	bh=XY6mEq9nMRwoQvnuhdnTySRAhIH37n6ebI1jWdJPUF4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=njvvVEVJ9bKwgHrnbvIqzNp2pznf3dQx1/TsH09U0Eja0cB8D6Ddbnrhl+T57jqeYACC1uCC+VsXMGvpmd5fFiVBHNmpy1nqKnGSAHkstDPy35aYuRqw1J53JIm+E1Fby67meDqqaWxHEmmPgRDin8ge4YcWWNvraR19VCFvkik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bCcqjJEr; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bCcqjJEr"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38e7109321dso1550185a91.3
        for <linux-kselftest@vger.kernel.org>; Wed, 12 Aug 2026 23:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786602852; x=1787207652; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rl6igOnyCyLcIUIdrNjrR0vSvz5V+iB+/lHA2MvB5zU=;
        b=bCcqjJErDmsyRFXKHkgbMon06QShlHjQzEBzlrpbOi7yIc8QNI1GcCoNJ0Fb+NYSwc
         pT59DODpKhNtTqNWtL7QuPVviYIKzLLouK/JlesRUYUqcZcAG+01/JLtg55MaXWmJZNU
         ND01Q+zZ1OqGlDu7qO/MVICmvYToWKwggEd4kPzmCzLUIaOVr5mlfKy/j/sZgC/WRWtB
         X+nhDQk34FXijCkCP0q44Px8Q612in+HbzsJ8AzXJuHTmJUNtNPvdWaYzhBJPb9EfqX9
         YGEIfTy3PsIY0aLMVzS6fXy3vj+lFInoKAPIPW/ACzgZ4wzBa1btaXlsXZpB0EFvB6aK
         eGxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786602852; x=1787207652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Rl6igOnyCyLcIUIdrNjrR0vSvz5V+iB+/lHA2MvB5zU=;
        b=RpznTQouZovBLzzXXD2LW7wJzw17Lvm7OX/FTbawjbLIqKMJgz1jsFKkt9MVFH4TVQ
         +mVhaCx8zC4UKoEA8QRSMW125DQo61mWa6vAdChi/AM6y/4SKeGPVOvEnJalwwiMRB6C
         uDSHiStEHYMIYAaVQIV26aK8P5qLtc/uO+V+yLf/WH6eUMeqgnboYuJH3vUZpp+yj+2w
         rnrVirGuuU+t1VYqQP+kxlKrLwodH/tJhbUPtWRBhyfkAt6J/nu4uYJE61Knac6UCUvt
         GOhn6RunAAIroToR9UShGVxTtVkgtzpQdW8ndUFgseR4+kMidVB3CHn8gqUwIt37yIqK
         gYLQ==
X-Forwarded-Encrypted: i=1; AHgh+RrIcMnxt+0lAI1m3aC0jLXRFwSyIjaGMCuCLAT9sjTseFqoBE0bujgha6cB4XnAlbxj1bkvJXk7k28SWZ7HcZc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxACd6NK/Vxu6vgfCKpMwiuEuWly4d58uFPNg6FT5SdH9soPcGQ
	x6Geh/CKYonpsL5pXnMMb2X74ZmfbwvyVywor6T3AqN+91Xf/o5GhQbu
X-Gm-Gg: AR+sD12tX4a9qgs0i85Q5QhZTsknn6tDCnshMnUEqSn16g7rdIpQtjxQpG0fWW07dsu
	LATZL3+NIuRRq55e0Qbf+xTOrFmgUXMiI/60rDnsOGrEmvny3rdiO1Mq1AT9XBmQW93zOa7ZZsE
	LkU+M9LBIKQmn8In8NtHh3qtzrJ2DhvnbkWY41HJqgnbQTQe5FmXAFQaGHElM+XErgWqMe09jRB
	JC4qOn1WTIPkNzcO4jSNJdrl7PhOsxAo0KlLAUvuNTSWoJm96+Tsx9Tj8ONunsGdwGlvg2O35Zg
	2IjtSCJILftQR5HcVjTY7TIbVag8cMnuT7vHS/pgkZSAM0LhVxbbt/cq2cG+/KcmwcUDoAESsrj
	qtl6LbMlPXfonuDqx/2jzmYvo5IMepolhZPwA/hLMfNZ/VrKcDRXB/LfIri0c61koZFFy4TrdF0
	KHrd7e5vjwX1BUX2Puq8zZ4C9pwIaV/3ajKUF1f4li6JsB3IUv4QJGbdf82ofuhhRrooBfDpt2W
	FQBHDEizKQ9RbiTy0KjaCdvt4xrhw0C9Z0KEj1qPF2xVyfdXOdxJJajk1LxIc4mKQ==
X-Received: by 2002:a17:90b:52cf:b0:380:21b7:e727 with SMTP id 98e67ed59e1d1-3931e29780bmr3917272a91.14.1786602852144;
        Wed, 12 Aug 2026 23:34:12 -0700 (PDT)
Received: from ikb-h07-29-noble.in.iijlab.net ([202.214.97.5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3931f44dcbbsm1650400a91.16.2026.08.12.23.34.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 23:34:11 -0700 (PDT)
Received: by ikb-h07-29-noble.in.iijlab.net (Postfix, from userid 1010)
	id A203E15B0431; Thu, 13 Aug 2026 15:34:10 +0900 (JST)
From: Hajime Tazaki <thehajime@gmail.com>
To: linux-mm@kvack.org
Cc: geert@linux-m68k.org,
	daniel@thingy.jp,
	Hajime Tazaki <thehajime@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	linux-kselftest@vger.kernel.org,
	linux-um@lists.infradead.org
Subject: [RFC PATCH 4/6] selftests: fix build errors on alpine linux
Date: Thu, 13 Aug 2026 15:33:59 +0900
Message-ID: <20260813063401.1786548-5-thehajime@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260813063401.1786548-1-thehajime@gmail.com>
References: <20260813063401.1786548-1-thehajime@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some nommu architectures only work on Alpine Linux, which doesn't use
glibc for the standard library.  It uses musl-libc and is implemented in
a different way as glibc, resulting build failures.

This commit fixes this issue by adding missing definitions. The fixes
are now only covered to TARGETS=mm which was tested for the moment;
future contributions are needed to fully build/execute tests on nommu
platforms.

Cc: Shuah Khan <shuah@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>
Cc: "Liam R. Howlett" <liam@infradead.org>
Cc: Vlastimil Babka <vbabka@kernel.org>
Cc: Mike Rapoport <rppt@kernel.org>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Michal Hocko <mhocko@suse.com>
Cc: linux-kselftest@vger.kernel.org
Cc: linux-mm@kvack.org
Cc: linux-um@lists.infradead.org
Signed-off-by: Hajime Tazaki <thehajime@gmail.com>
---
 tools/testing/selftests/kselftest.h      | 43 ++++++++++++++++++++++++
 tools/testing/selftests/lib.mk           |  2 +-
 tools/testing/selftests/mm/hugetlb_dio.c |  8 ++---
 tools/testing/selftests/mm/mdwe_test.c   |  4 +--
 4 files changed, 50 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/kselftest.h b/tools/testing/selftests/kselftest.h
index ae18c491ae53..ac21bf3d802e 100644
--- a/tools/testing/selftests/kselftest.h
+++ b/tools/testing/selftests/kselftest.h
@@ -58,6 +58,7 @@
 #include <string.h>
 #include <stdio.h>
 #include <sys/utsname.h>
+#include <stdint.h>
 #endif
 
 #ifndef ARRAY_SIZE
@@ -81,6 +82,48 @@
 #endif
 #endif /* end arch */
 
+#if !defined(NOLIBC) && !defined(__GLIBC__)
+#ifdef __LP64__
+typedef int64_t __fsword_t;
+#else
+typedef int32_t __fsword_t;
+#endif
+
+/*
+ * for a workaround to avoid struct conflict under
+ * musl-libc (<sys/prctl.h> v.s. <linux/prctl.h>)
+ */
+#include <sys/prctl.h>
+#ifndef _LINUX_PRCTL_H
+#define _LINUX_PRCTL_H
+#endif
+
+#ifndef PR_SET_MDWE
+#define PR_SET_MDWE 65
+#endif
+
+#ifndef PR_MDWE_REFUSE_EXEC_GAIN
+#define PR_MDWE_REFUSE_EXEC_GAIN (1UL << 0)
+#endif
+
+#ifndef PR_MDWE_NO_INHERIT
+#define PR_MDWE_NO_INHERIT (1UL << 1)
+#endif
+
+#ifndef PR_GET_MDWE
+#define PR_GET_MDWE 66
+#endif
+
+#ifndef PR_SET_MEMORY_MERGE
+#define PR_SET_MEMORY_MERGE 67
+#endif
+
+#ifndef PR_GET_MEMORY_MERGE
+#define PR_GET_MEMORY_MERGE 68
+#endif
+
+#endif
+
 /* define kselftest exit codes */
 #define KSFT_PASS  0
 #define KSFT_FAIL  1
diff --git a/tools/testing/selftests/lib.mk b/tools/testing/selftests/lib.mk
index f02cc8a2e4ae..2cc819006424 100644
--- a/tools/testing/selftests/lib.mk
+++ b/tools/testing/selftests/lib.mk
@@ -197,7 +197,7 @@ clean: $(if $(TEST_GEN_MODS_DIR),clean_mods_dir)
 	$(CLEAN)
 
 # Build with _GNU_SOURCE by default
-CFLAGS += -D_GNU_SOURCE=
+CFLAGS += -D_GNU_SOURCE= -D_LARGEFILE64_SOURCE
 
 # Additional include paths needed by kselftest.h and local headers
 CFLAGS += -I${top_srcdir}/tools/testing/selftests
diff --git a/tools/testing/selftests/mm/hugetlb_dio.c b/tools/testing/selftests/mm/hugetlb_dio.c
index fb4600570e13..aee6be530ccb 100644
--- a/tools/testing/selftests/mm/hugetlb_dio.c
+++ b/tools/testing/selftests/mm/hugetlb_dio.c
@@ -22,12 +22,9 @@
 #include "kselftest.h"
 #include "hugepage_settings.h"
 
-#ifndef STATX_DIOALIGN
-#define STATX_DIOALIGN		0x00002000U
-#endif
-
 static int get_dio_alignment(int fd)
 {
+#ifdef STATX_DIOALIGN
 	struct statx stx;
 	int ret;
 
@@ -43,6 +40,9 @@ static int get_dio_alignment(int fd)
 		return 1;
 
 	return stx.stx_dio_offset_align;
+#else
+	return -1;
+#endif
 }
 
 static bool check_dio_alignment(unsigned int start_off,
diff --git a/tools/testing/selftests/mm/mdwe_test.c b/tools/testing/selftests/mm/mdwe_test.c
index 647779653da0..031c79ed067e 100644
--- a/tools/testing/selftests/mm/mdwe_test.c
+++ b/tools/testing/selftests/mm/mdwe_test.c
@@ -1,5 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 
+#include "kselftest_harness.h"
+
 #ifdef __aarch64__
 #include <asm/hwcap.h>
 #endif
@@ -14,8 +16,6 @@
 #include <sys/wait.h>
 #include <unistd.h>
 
-#include "kselftest_harness.h"
-
 #ifndef __aarch64__
 # define PROT_BTI	0
 #endif
-- 
2.43.0

