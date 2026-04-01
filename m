Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7677E0FF
	for <linux-kselftest@vger.kernel.org>; Wed,  1 Apr 2026 00:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775003316; cv=none; b=FFI3MaxOBFW/npLWWXWV+s6PzXl3n1otSMG9KrGasBwqWxfazRbvi8+gWWH7cNwC8+eMlOPvvKOUFabak0gM95Y/5JHIGiy6l9TjVxfIuwQXFh9U8ZQdFLB/pcxLxnr1Xw3+60/Z1Qal3OXxalOZPsS7P+hDPPQhKc/y3W2qRi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775003316; c=relaxed/simple;
	bh=PpofUhHFeqNmF2EPmF0nTEHj8cWFrIuv18vLhSjs8c4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XpzQjwLBHTZee+7iknpvRyhOqUPfPlnu5GRfVjAVRb9AhvPqk3kk52ZSfLg0cLDkK59KiHmyn/mb49s4nNL6rJK46e3WERlAq53KpuJsLfvaDZCYY/hoyGHLqMWfZSOmafIhsewSoo3yBzx+mvbpv9+VfjJrCaOaZ76GNrKXXiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com; spf=pass smtp.mailfrom=amutable.com; dkim=pass (2048-bit key) header.d=amutable-com.20230601.gappssmtp.com header.i=@amutable-com.20230601.gappssmtp.com header.b=Ya0bOa0k; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20230601.gappssmtp.com header.i=@amutable-com.20230601.gappssmtp.com header.b="Ya0bOa0k"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c06cb8004e8so2522623a12.0
        for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 17:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20230601.gappssmtp.com; s=20230601; t=1775003315; x=1775608115; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8xdtigM1MnP5nQv3PSNQ++1o7F4yals5CCvEBR8RONk=;
        b=Ya0bOa0kuuzoQ5vOCszGNOybkZ2dOnuJrXOpyFC1Y3JELAN+t2b0zwM0SwqP0Mmxvi
         XWRpXz0+7RL+Suu/LMaQFg2eZ+/OH5tXzLPkod/qpN0+Esqy3sEwJlzCOaq2Tjhc86Y4
         0l7lPxHO0FZHa+xklttApkP1icTw0JHf3BZrUOLcYOJ2FxzJ/jgnVsN/SytdtIDWgs+B
         1L1hJL6XX4LIXdTAk+lYaug4Lu7O7GTyl3WP2qkwzwV7gZ4z3b54RbcCWxxSWYoqOg21
         3OYgCt1KZSwGdlt0HktiBRRxo9RE7d18iDm6ZUj/1RznVhGYC9N0U4glSOJx8hX0no00
         +9Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775003315; x=1775608115;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8xdtigM1MnP5nQv3PSNQ++1o7F4yals5CCvEBR8RONk=;
        b=lgGxp6cQaBFBATK+V/nEATWNC0ZVwchyVT0OCNYdb+speKgvV1s+jIbYV1J2c6A8Ps
         QQKU9JkMiLc/kIq8nmK9T776E7OZuGwYNlPMU19cnYiamFmkvm8447A2ibaFaK25hTDK
         paR4Gs8nOvn2IrKQkR5YNe0886ap9alp/8i01O7t8k+6otn7TgJ1PpSyJkqj/lnJBYhW
         PibdplL5SlCh3zMbquWgCAXqrVTnCT7Lny3GH3LKSQM1uEw6vFz5QNSwh0vJRvOHMiK2
         DyyHzrTcS9BmMbls7WwvMhPQrPsg/cgx7+86bfEtc1ccr+0OCpXeM0ByFMNMx4xOieE4
         rEyQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0q+W/flYhXBT7QRe03RNV2paeCQ8Uv5jNEM9EBIH5qF7mLPM38DZiyHug5Iy+MHg+3GDojZ9IW96eSGEIKIY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrI9bowG67vW8viiykxC2xNyLxBIVAr2bxkCL8CGF9bafm8GLF
	metRaOfS1XfpVVh96c8BLCw36eHA7vQ7J5mT3Mafbd0foX8wP4M53bKLjLnFoQjoNXDVa0+ba80
	rSOuzmOGkRrs=
X-Gm-Gg: ATEYQzyLMav2bzFifM42uqlWBM1v2QsSJktxIMK1aZkr0pBIXgMjoXS79+MErQJR8hk
	Daoz+SZMG8+fkpAAF4N04v0htgTJRh255p5QSMlIjM/rhN+2+4M9MWbuQ7kM1NQektmjh0UgXGH
	K5fgb0HTiyXKetcG27KEvu71g/MtOtuVtzDBYoIUTsBv9jziRf3xUi6H+RZ0kSqFQe+WflGaRtC
	mgpXqgk+59wrUO60gcS4coW39ey3FmZBehO33KzXvYnyxFqiX3VYqISJM4CxUmxIifaJpXW/6Ky
	bx7PAPAmWd9f1BfONx7W/i2wQuwR795yHOVZ+EyR7o4w0iaCqRPKakoJQkmOG7D/6DRG1ZXIvSr
	42Mhy/GmECVIaEZ7+2PVr16GAvgcqEsIlBSgfwSf2b+eufu23bycBifKxbpLArXIOlw/kUYp4wh
	n1FMeUoQbjXV+zsslxwxHEum3zXCXWizYClCYQ5woJF7mMNcpCH8j4RFE6nxAE9E/S8+lsC25o2
	CEVCXudvn/enL2MR9FQ2BrHDw==
X-Received: by 2002:a17:902:e551:b0:2b2:5840:8089 with SMTP id d9443c01a7336-2b269c42c9emr11858965ad.27.1775003314973;
        Tue, 31 Mar 2026 17:28:34 -0700 (PDT)
Received: from thesius.dot.cyphar.com (2403-5809-a2fc-2-a90-9fd7-aedd-d405.ip6.aussiebb.net. [2403:5809:a2fc:2:a90:9fd7:aedd:d405])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b24264264fsm157057825ad.2.2026.03.31.17.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 17:28:34 -0700 (PDT)
From: Aleksa Sarai <aleksa@amutable.com>
Date: Wed, 01 Apr 2026 11:28:04 +1100
Subject: [PATCH v2 3/4] selftests: openat2: switch from custom ARRAY_LEN to
 ARRAY_SIZE
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-openat2-selftests-kunit-v2-3-ad153a07da0c@amutable.com>
References: <20260401-openat2-selftests-kunit-v2-0-ad153a07da0c@amutable.com>
In-Reply-To: <20260401-openat2-selftests-kunit-v2-0-ad153a07da0c@amutable.com>
To: Shuah Khan <shuah@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>, linux-fsdevel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Aleksa Sarai <cyphar@cyphar.com>, Aleksa Sarai <aleksa@amutable.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3171; i=aleksa@amutable.com;
 h=from:subject:message-id; bh=PpofUhHFeqNmF2EPmF0nTEHj8cWFrIuv18vLhSjs8c4=;
 b=owGbwMvMwCWmMf3Xpe0vXfIZT6slMWSeSVsSzr95Z/OdUyW7ph4XnbVwseiK4DfKh6Tlr3Qqb
 j6Tvu7xyY6JLAxiXAyWYoos2/w8QzfNX3wl+dNKNpg5rEwgQ6RFGhgYGBhYGPhyE/NKjXSM9Ey1
 DfUMjXSMdIwYuDgFYKo/XmRk6F4Zy7Vpz24nk37hii7T6d+1ll/gZygKXr10qoh666H/lxh+Moq
 ZT7nLtF9mgdnkpg+sNam8lx+IPDydmBejcEefMXEaNwA=
X-Developer-Key: i=aleksa@amutable.com; a=openpgp;
 fpr=C9C370B246B09F6DBCFC744C34401015D1D2D386

For whatever reason, the original version of the tests used a custom
version of ARRAY_SIZE, but ARRAY_SIZE works just as well.

Signed-off-by: Aleksa Sarai <aleksa@amutable.com>
---
 tools/testing/selftests/filesystems/openat2/helpers.h      |  1 -
 tools/testing/selftests/filesystems/openat2/openat2_test.c | 12 ++++++------
 tools/testing/selftests/filesystems/openat2/resolve_test.c |  4 ++--
 3 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/tools/testing/selftests/filesystems/openat2/helpers.h b/tools/testing/selftests/filesystems/openat2/helpers.h
index 975de513af86..f56c0c6e3ad1 100644
--- a/tools/testing/selftests/filesystems/openat2/helpers.h
+++ b/tools/testing/selftests/filesystems/openat2/helpers.h
@@ -17,7 +17,6 @@
 #include <linux/unistd.h>
 #include "kselftest.h"
 
-#define ARRAY_LEN(X) (sizeof (X) / sizeof (*(X)))
 #define BUILD_BUG_ON(e) ((void)(sizeof(struct { int:(-!!(e)); })))
 
 /*
diff --git a/tools/testing/selftests/filesystems/openat2/openat2_test.c b/tools/testing/selftests/filesystems/openat2/openat2_test.c
index 0e161ef9e9e4..c6c26652ac1b 100644
--- a/tools/testing/selftests/filesystems/openat2/openat2_test.c
+++ b/tools/testing/selftests/filesystems/openat2/openat2_test.c
@@ -83,14 +83,14 @@ void test_openat2_struct(void)
 		  .size = sizeof(struct open_how_ext), .err = -E2BIG },
 	};
 
-	BUILD_BUG_ON(ARRAY_LEN(misalignments) != NUM_OPENAT2_STRUCT_VARIATIONS);
-	BUILD_BUG_ON(ARRAY_LEN(tests) != NUM_OPENAT2_STRUCT_TESTS);
+	BUILD_BUG_ON(ARRAY_SIZE(misalignments) != NUM_OPENAT2_STRUCT_VARIATIONS);
+	BUILD_BUG_ON(ARRAY_SIZE(tests) != NUM_OPENAT2_STRUCT_TESTS);
 
-	for (int i = 0; i < ARRAY_LEN(tests); i++) {
+	for (int i = 0; i < ARRAY_SIZE(tests); i++) {
 		struct struct_test *test = &tests[i];
 		struct open_how_ext how_ext = test->arg;
 
-		for (int j = 0; j < ARRAY_LEN(misalignments); j++) {
+		for (int j = 0; j < ARRAY_SIZE(misalignments); j++) {
 			int fd, misalign = misalignments[j];
 			char *fdpath = NULL;
 			bool failed;
@@ -241,9 +241,9 @@ void test_openat2_flags(void)
 		  .how.resolve = 0, .err = -EINVAL },
 	};
 
-	BUILD_BUG_ON(ARRAY_LEN(tests) != NUM_OPENAT2_FLAG_TESTS);
+	BUILD_BUG_ON(ARRAY_SIZE(tests) != NUM_OPENAT2_FLAG_TESTS);
 
-	for (int i = 0; i < ARRAY_LEN(tests); i++) {
+	for (int i = 0; i < ARRAY_SIZE(tests); i++) {
 		int fd, fdflags = -1;
 		char *path, *fdpath = NULL;
 		bool failed = false;
diff --git a/tools/testing/selftests/filesystems/openat2/resolve_test.c b/tools/testing/selftests/filesystems/openat2/resolve_test.c
index a76ef15ceb90..f7acb4300641 100644
--- a/tools/testing/selftests/filesystems/openat2/resolve_test.c
+++ b/tools/testing/selftests/filesystems/openat2/resolve_test.c
@@ -436,9 +436,9 @@ void test_openat2_opath_tests(void)
 		  .out.err = -ELOOP,		.pass = false },
 	};
 
-	BUILD_BUG_ON(ARRAY_LEN(tests) != NUM_OPENAT2_OPATH_TESTS);
+	BUILD_BUG_ON(ARRAY_SIZE(tests) != NUM_OPENAT2_OPATH_TESTS);
 
-	for (int i = 0; i < ARRAY_LEN(tests); i++) {
+	for (int i = 0; i < ARRAY_SIZE(tests); i++) {
 		int dfd, fd;
 		char *fdpath = NULL;
 		bool failed;

-- 
2.53.0

