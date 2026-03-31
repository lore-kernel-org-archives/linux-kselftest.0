Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4083C3D811A
	for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 13:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774964650; cv=none; b=AQBdxmNXI8tJGkCQevDBv+Kib6Qd+wE7AlNwGWAAFTXUHitp8YrP6OG1m1u3vkag9DVywZhCor2GO93fo3h1fJzBknbMPQXyGIhMrrcsMpb3IslhH/zYrmfo2PrSVwPeRGm5TB9e8//EsIFPLkjd6I2aBN3lmo9pl5oK6wXv5tE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774964650; c=relaxed/simple;
	bh=2K20XJ/gwG1IJLQsa/W5M4bLVpssMeZ6ebI1hXmyhUg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CZuSMC4AZCasukXIWReSE84fZZ+Iu7WdHscURnagrp/wpwbHvL0ESg9fT1A/SOhlGHKHwEHnHIizkbzzxbaCagf91IsnMsoT4gEoMOQVEA30Eds7HXS428u2+R6KPmGFvyjUQBPEmc7Xdi3RrfKY9DeJ4p7FLI57UJRS3GtU6uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com; spf=pass smtp.mailfrom=amutable.com; dkim=pass (2048-bit key) header.d=amutable-com.20230601.gappssmtp.com header.i=@amutable-com.20230601.gappssmtp.com header.b=bPH5FtEf; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20230601.gappssmtp.com header.i=@amutable-com.20230601.gappssmtp.com header.b="bPH5FtEf"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-40f1a1f77a6so3798135fac.2
        for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 06:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20230601.gappssmtp.com; s=20230601; t=1774964643; x=1775569443; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gQ99ZO5QOycXZmDuvJz1p/CKA7WICxsOG1IqStLAtuk=;
        b=bPH5FtEfxBdStchc5SgtDHg1M3QrgYv5RZVm6nFMr+dc7dwWKsNiw3yLdL/C/tMjJq
         xf+BkdUcFcTHQQPHdew07/gs+AaJALL+SZsLE+Ody7CUI3Luc8YePLkGZg20/wYL0gsq
         8Ed7fXSLDhb1P1sh8BajnR6LYNWEQgCfFpB20VgT4aT1We738S7X8c3Fw+XLDHWSNXVY
         24uzgMpXj7p2K4FtJd8vzwwQeBaDB0Son/dIjahjii6ZyDIe86STeUHzOfwsgeiI/oxh
         ECQEgZ72ACtoOlvm1XGmmB6h2LjMw5lYmgElOShFYKc5BCeI9YiPv3NMWCcmqy0Tc+VC
         i3JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774964643; x=1775569443;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gQ99ZO5QOycXZmDuvJz1p/CKA7WICxsOG1IqStLAtuk=;
        b=UgGQW1Ry6mA+cy5P/oqI+iMJHc/cYmI1T+4upsW9smVjiQakgkeS4wA4hny0YJZkk9
         RokAnlJ5wpsTNIC6J9f6OVq2UmEMIKUq3QuTw9hVAxBhg+SbOHtBVs0ShhcRT/EVtXej
         azsGtQWVQg/5mZXYtMt4n04ApUA2tgL6B2WqPiOxXVqbeo1aP4twy8yRq7tjRKCqyeZi
         Iy6N0CD9E3z8VtVV6pxS797scNr7y244CermIXwG/85m2Hgcb29HBMesmbd9i7zXHiGN
         KrnIjKrmn9WJ6ChS5EERs5GBytzpzJsP2SL75hnKOmWFAUrfinO0nZTW36ceueMEoHpi
         xkLA==
X-Forwarded-Encrypted: i=1; AJvYcCX7o9bDHzSILvvEA+qIChjfgoTggtx5l88VV0kBaGGvnHlesPrlMu2wfyZlxj1WynANqKXdQjfMjdShOAAhQGE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+r8BT9oagN/JPSVnEPkAsOEP6d/3i0P0Nn1/BLN/IbE3F96O4
	L4n52u1U9hnnyYEa4wdS/WbaWV3q9jT4XkodBy01QXdgRpK6MDRcY8WEFmFFe/UPG/sb
X-Gm-Gg: ATEYQzzfrWAQXmePze6+VkvZPcZ3TO9qD9WPsiDesVinpB+7gd6E6BcMip8w9TkUCbT
	jHF/tVTZ3KOOUqy56oUYFtT9kSUBFm5Jr6ug3w9Yccp1agi5jDgN/jJgxFR+nykRA7TtwFusIAc
	sDyIUn/Jr0/99HXuL/4m1hHY3gCq3aX50j+6dE1wF8X2Qv34pZSiKqHLrgvRO+64ayjYx1i0ynh
	idSeqjEqAbPZGmNgjXOKqc7gfoczcnqLQfoJqKBxnWGbRBxoV4D4mXZc9FQvTp3MVchNFOSVtGw
	FYa1gJLWkOkuHEDkq8L2UxLYAmJhkiphtm8zoD+fKHWLUbsriTbhipfT66udnn7nHshX3WcMJJ+
	h+mmRmMN3dUQGiLKXQwpwz109vx6h0kOkqH3iJGm/M7KpKczoMuDKsqBvkzqeNX7k66+A3Z5f1V
	2RmPmIxJ3ruwrZhS5Axt98j4CYVwLWEFjCTkegQFHl/GbbahMmBFgN66YhCyUsyxMrH74boOepv
	np8FogoZ1B/XjebnHL4hshQ
X-Received: by 2002:a05:6870:a552:b0:409:6227:d313 with SMTP id 586e51a60fabf-41cec31a53amr8250852fac.35.1774964643278;
        Tue, 31 Mar 2026 06:44:03 -0700 (PDT)
Received: from thesius.dot.cyphar.com (2403-5809-a2fc-2-a90-9fd7-aedd-d405.ip6.aussiebb.net. [2403:5809:a2fc:2:a90:9fd7:aedd:d405])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-41d04d95bcasm7470456fac.17.2026.03.31.06.43.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 06:44:02 -0700 (PDT)
From: Aleksa Sarai <aleksa@amutable.com>
Date: Wed, 01 Apr 2026 00:43:32 +1100
Subject: [PATCH 2/3] selftests: openat2: switch from custom ARRAY_LEN to
 ARRAY_SIZE
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-openat2-selftests-kunit-v1-2-5819ac6cadf5@amutable.com>
References: <20260401-openat2-selftests-kunit-v1-0-5819ac6cadf5@amutable.com>
In-Reply-To: <20260401-openat2-selftests-kunit-v1-0-5819ac6cadf5@amutable.com>
To: Shuah Khan <shuah@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>, linux-fsdevel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Aleksa Sarai <aleksa@amutable.com>, Aleksa Sarai <cyphar@cyphar.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2991; i=aleksa@amutable.com;
 h=from:subject:message-id; bh=2K20XJ/gwG1IJLQsa/W5M4bLVpssMeZ6ebI1hXmyhUg=;
 b=owGbwMvMwCWmMf3Xpe0vXfIZT6slMWSePj/9pJz3xo8KtwRPHP3m562hZjbxueKp8tCTqwu+q
 C95VuMzq2MiC4MYF4OlmCLLNj/P0E3zF19J/rSSDWYOKxPIEGmRBgYGBgYWBr7cxLxSIx0jPVNt
 Qz1DIx0jHSMGLk4BmOqPuxgZvkT9lO+9tiVabPK0qKIqk0wZF7V/jrmuXKc3yn1qKJe8xMhwrJ7
 Z0OkSD8vD8kOH/0lItEZo/k4ziWt25Tvo/uLImWd8AA==
X-Developer-Key: i=aleksa@amutable.com; a=openpgp;
 fpr=C9C370B246B09F6DBCFC744C34401015D1D2D386

For whatever reason, the original version of the tests used a custom
version of ARRAY_SIZE, but ARRAY_SIZE works just as well.

Signed-off-by: Aleksa Sarai <aleksa@amutable.com>
---
 tools/testing/selftests/openat2/helpers.h      |  1 -
 tools/testing/selftests/openat2/openat2_test.c | 12 ++++++------
 tools/testing/selftests/openat2/resolve_test.c |  4 ++--
 3 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/tools/testing/selftests/openat2/helpers.h b/tools/testing/selftests/openat2/helpers.h
index 975de513af86..f56c0c6e3ad1 100644
--- a/tools/testing/selftests/openat2/helpers.h
+++ b/tools/testing/selftests/openat2/helpers.h
@@ -17,7 +17,6 @@
 #include <linux/unistd.h>
 #include "kselftest.h"
 
-#define ARRAY_LEN(X) (sizeof (X) / sizeof (*(X)))
 #define BUILD_BUG_ON(e) ((void)(sizeof(struct { int:(-!!(e)); })))
 
 /*
diff --git a/tools/testing/selftests/openat2/openat2_test.c b/tools/testing/selftests/openat2/openat2_test.c
index 0e161ef9e9e4..c6c26652ac1b 100644
--- a/tools/testing/selftests/openat2/openat2_test.c
+++ b/tools/testing/selftests/openat2/openat2_test.c
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
diff --git a/tools/testing/selftests/openat2/resolve_test.c b/tools/testing/selftests/openat2/resolve_test.c
index a76ef15ceb90..f7acb4300641 100644
--- a/tools/testing/selftests/openat2/resolve_test.c
+++ b/tools/testing/selftests/openat2/resolve_test.c
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

