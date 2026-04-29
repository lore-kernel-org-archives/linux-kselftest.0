Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8DE9372B59
	for <linux-kselftest@vger.kernel.org>; Wed, 29 Apr 2026 14:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777473335; cv=none; b=E4NL9RmzbICRxHqYE4+cMMq5fFhBlEtatfpGr5H4aPxW7fqP0zlL4Mg6zehRiv9TFY4IGzoKczFrG+ZEN3UI2cjLFYOh7ZxnKsZ1zW6kMwgwoiJn8+L9QaGspOIIBuxtF5m4X9p2w+HGaRMi8aqQ7p//2u8K/Rucwhc4COec2nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777473335; c=relaxed/simple;
	bh=bsQGxHVEbWFMcU98H+Usr8BrpVvRynWHs4uJrO7ovMk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uD4CooQvdL6uPLgjyMTCMTqKttnYI+Ls9XqhNmGcGDcSwtepD4qqwBkSD/n4ByO4MaCGKcTqOYKJvTnYtWRZuHsNV9oxxUNUp5uIWEbxFJGTm0dzwNZ7kJsB1C8L7/7kQKuhrryyNY1/FhVI4PuatYIBSqb6oOwMz9otf/sqn2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ZEkVqEDX; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ZEkVqEDX"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4891c00e7aeso98499305e9.2
        for <linux-kselftest@vger.kernel.org>; Wed, 29 Apr 2026 07:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777473332; x=1778078132; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0N/qPZtLyDR9JYuc7La36zdYueKjOOpudQKv7E6xcTI=;
        b=ZEkVqEDXS5a8xENdLT/u/17+JJpbvEhFqqPvnB0gmhv2ZVVHOZk9QlT0yVekSIV8o0
         uzsPMW4UgMdqT7N5n32r2wfljd4WRaV9oYaHBelLmqHhtRpryXtbGGoHNcF+Y1BlF6R8
         As0O33MTVFcWRAEX8kNZBp4GKFu+g54XgVPEgRCGNCcMGxjI/XOP8BkTGfEGLOufplrB
         SGnjrNGx54IqKWWBgrX7fmgY94cfXTYaguOKMh8R9QpP3dTLeWqVcWE6TOjHBQ8y/BJl
         IUk8IkBakosb7ELVpKkmX8g1/gXC/C106FxhHEQKA8F8RdTR6U1aXLfYCAes2Zved8H2
         g/LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777473332; x=1778078132;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0N/qPZtLyDR9JYuc7La36zdYueKjOOpudQKv7E6xcTI=;
        b=Crrj7kAnVOhMbbeKpQsHCUXXYLs+oEiEBC2m00ge8Y4YBykJNYtbmpNXJUDUz3l+WX
         CDZfdtWcub+gzIoHktZuJIMGaT/TgQw3dDD+fsCW6Fwkb9zFEKOmLsfcRglWVYDArDRm
         SMjz5KH/R3Pr22YRwilZUKAFqkF8XrRcKGUf6pa/BZQR+QX6+htRN1Wai70lUv0SQS9p
         5bS42veuWRz4inB4E+ot6L2nCERXSsiIap4PWrNL4lk61xAGf+mT/CPqjjteCJbeTLo8
         TJV7+tWVYny8GmelURnaLg/IsN0Z0TeDjdd/y/Yo1aeadfOlSYCu9MlOxwrpK2YbpsKd
         RQ4Q==
X-Forwarded-Encrypted: i=1; AFNElJ/kT29PziOVnpLvjphQ1b37crg28eENaIT+Yl9VaIC+T1tXm8G6mTrpSOLH2PC2sFaj6futW+nykB6rnBLrxfU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzp5ZPKEzD5TxcxYvpS8pvKKvRCQ9uEAq/OU3Ma9sUo66EgHDB4
	vbj8RZpJyI0jw6+yTBtIVtbGrWZj02wsex90WzXXXqlSivY0lcB9JE9GPfo8GJUf7+8yy16qkYq
	Yf2AAo2o=
X-Gm-Gg: AeBDietqdsqFIQSSo2HcFupjfSGsukz1iRTDWJLoD5LosQswcc8Gw1GRQhMGtN6KqxV
	FZKf3KQllbsjUGxKqVqFAJhFw2lKLCOdLbxbLtpfvrj0FAD9haCZpQ3oAAimVKZLk1j4GrAvAPN
	+Nmga61PgfSPvIZs92J2IL/S87no4igUPLO6sxtHLkjobNedFtIlB3IWBWX7QhVkqdzQppVmnY3
	tCUKoWnE0v3xxtqstTRSTN1WY8C4+DbpatkIOUWL5EflByO7DJnCCuNXhZiN5u+80h5Ne1+2bz5
	Nk8FVS7SR7JwkWG5An0RmPL0ah8UcT3ddDxmTKDp12sfQ/bOjgIbgPg7StAsjw66MvHjfeGS4p0
	tkYkw76FPji4FAJ6N1eatCMYcO0D3oGovbWynp3isdsGbfBz4dzD8rNlr5nQwPct461iGF2vVsN
	3W722esjX1vrmNDLdQaGoU8hdgZPkIIea45bV4rvzXzz4M
X-Received: by 2002:a05:600c:4341:b0:48a:53ea:1408 with SMTP id 5b1f17b1804b1-48a77afcf0amr63409555e9.8.1777473331729;
        Wed, 29 Apr 2026 07:35:31 -0700 (PDT)
Received: from [127.0.0.1] ([2804:1bc4:224:7800:585c:db3a:fcb:e21f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7c305371sm19982835e9.18.2026.04.29.07.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 07:35:30 -0700 (PDT)
From: Marcos Paulo de Souza <mpdesouza@suse.com>
Date: Wed, 29 Apr 2026 11:35:15 -0300
Subject: [PATCH v4 1/6] selftests: livepatch: Check for
 ARCH_HAS_SYSCALL_WRAPPER config
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-lp-tests-old-fixes-v4-1-59b9741989d0@suse.com>
References: <20260429-lp-tests-old-fixes-v4-0-59b9741989d0@suse.com>
In-Reply-To: <20260429-lp-tests-old-fixes-v4-0-59b9741989d0@suse.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
 Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, 
 Joe Lawrence <joe.lawrence@redhat.com>, Shuah Khan <shuah@kernel.org>
Cc: live-patching@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Marcos Paulo de Souza <mpdesouza@suse.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777473323; l=1999;
 i=mpdesouza@suse.com; s=20231031; h=from:subject:message-id;
 bh=bsQGxHVEbWFMcU98H+Usr8BrpVvRynWHs4uJrO7ovMk=;
 b=tvmzg76o/nu6Ldl32Hq08Kp/ieaTRU6Q+seXgfYYcQaFHBNyqt47Rl0yDMlUCxGPdyjY+T6tJ
 oiFKI6R3eiCBdTM2/oaeYPX+5HZRrmRfkyJEhZ4saJrDz4ve6P4wZad
X-Developer-Key: i=mpdesouza@suse.com; a=ed25519;
 pk=/Ni/TsKkr69EOmdZXkp1Q/BlzDonbOBRsfPa18ySIwU=

Older kernels that lack CONFIG_ARCH_HAS_SYSCALL_WRAPPER config don't
have any prefixes for their syscalls. The same applies to current
powerpc and loongarch, covering all currently supported architectures
that support livepatch.

The other supported architectures have specific prefixes, so error out
when a new architecture adds livepatch support with wrappers but didn't
update the test to include it.

Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
---
 .../livepatch/test_modules/test_klp_syscall.c      | 27 +++++++++++++++-------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/livepatch/test_modules/test_klp_syscall.c b/tools/testing/selftests/livepatch/test_modules/test_klp_syscall.c
index dd802783ea84..0630ffd9d9a1 100644
--- a/tools/testing/selftests/livepatch/test_modules/test_klp_syscall.c
+++ b/tools/testing/selftests/livepatch/test_modules/test_klp_syscall.c
@@ -12,15 +12,26 @@
 #include <linux/slab.h>
 #include <linux/livepatch.h>
 
-#if defined(__x86_64__)
-#define FN_PREFIX __x64_
-#elif defined(__s390x__)
-#define FN_PREFIX __s390x_
-#elif defined(__aarch64__)
-#define FN_PREFIX __arm64_
+/*
+ * Before CONFIG_ARCH_HAS_SYSCALL_WRAPPER was introduced there were no
+ * prefixes for system calls.
+ * powerpc set this config based on configs, so it can be enabled or not.
+ */
+#if defined(CONFIG_ARCH_HAS_SYSCALL_WRAPPER)
+  #if defined(__x86_64__)
+    #define FN_PREFIX __x64_
+  #elif defined(__s390x__)
+    #define FN_PREFIX __s390x_
+  #elif defined(__aarch64__)
+    #define FN_PREFIX __arm64_
+  #elif defined(__powerpc__)
+    #define FN_PREFIX
+  #else
+    #error "Missing syscall wrapper for the given architecture."
+  #endif
 #else
-/* powerpc does not select ARCH_HAS_SYSCALL_WRAPPER */
-#define FN_PREFIX
+  /* Do not set a prefix for architectures that do not enable wrappers. */
+  #define FN_PREFIX
 #endif
 
 /* Protects klp_pids */

-- 
2.54.0

