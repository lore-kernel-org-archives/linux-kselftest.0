Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F8E15A85A
	for <linux-kselftest@vger.kernel.org>; Wed,  1 Apr 2026 00:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775003309; cv=none; b=PObWxPYNZ1mbb3PqZR6iWqQvujoszemGGWq1P3AlqXS/eM+7ZLqpqIGB3jrP5LK8GBoDdjq0LhOuaiWZmLZEfDxBt7yFzDbyJW0RG3E5HoCkrOl8VQN27tLarzmOjXxYE/ozF/4mG3ZGQfgeaZxgcHVmF0CVJFshoCGq9TgFvJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775003309; c=relaxed/simple;
	bh=nt2OPfJr2A+6voG3mvjcDolBFXkCYdVhtEbTUQY3tSw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gzStT1W1VAyxyK0QO0Jx84W+dpKjKsLkPbhdCfvmyWt7YmQ/55ls3Wpv8zNZ7QJw6r3wbdD5CDINzgU0ZKfo8/SVwhHZg53dIBhKjJKze5sY1bqjy+d6yuyjz7txrzI3tmO8Y4WSa+lkAIP0//tEItfyXyl9DUmtL67SbMbvN3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com; spf=pass smtp.mailfrom=amutable.com; dkim=pass (2048-bit key) header.d=amutable-com.20230601.gappssmtp.com header.i=@amutable-com.20230601.gappssmtp.com header.b=Yhw9p1cd; arc=none smtp.client-ip=209.85.214.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20230601.gappssmtp.com header.i=@amutable-com.20230601.gappssmtp.com header.b="Yhw9p1cd"
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-2addb31945aso46498365ad.1
        for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 17:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20230601.gappssmtp.com; s=20230601; t=1775003308; x=1775608108; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V8tetMUp6n642BPcIc1AXM/henp9pQA12IUGi6Zqs5U=;
        b=Yhw9p1cdCVXmygXl8tgkFTYuTC84BEiFVHpnNt5KQ1HB/DA09FV0u5CjZoDa+I0dK5
         is2WMgr3dvu+PEkjx/ogcnS+n1ayGIipYeH4Dqy7/ud8M4ObzW04omPp8qiYFOF7XyM5
         pf0xVxi+jTzEyFDHOUlinGgrU8OVWXH7gPYa3dzUtg7rJSMZZ73Vj+SokaPV0L23MArK
         muGccG/hmdj5CnZHx70KoVPSIKgkQozLiJ60I1VISGqVKo0SvMHFqhIYxTF4ZSQt7GxC
         RmGbuYM5OTjviJyZIvzsaRtHK8TcNpswPGx9hVKdHmuq5EXnvA70sh5xcLfCi0LCeUOz
         ZsuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775003308; x=1775608108;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=V8tetMUp6n642BPcIc1AXM/henp9pQA12IUGi6Zqs5U=;
        b=SGuGLp+Ob73UsSU0qWMPoX1hyiKFLyMMAgIg9qmw/yxsFcKxck7OVsomrVNSaqvoEE
         kl/ygi8YJ8p6sWuS3A//WEUuo5/x6fV9O60J0bv2U5PO5qRMO1crTV2XEQ02cD5Vp9Wa
         d8m4+k9BXRIa33dPq8E1VHgy9okdL9cW+tRL1CiX6/M1j2U7IxzI6161SrO4jmijfHBz
         SMdC//1gvdh+42we1r/nzob9/sAajjiSs5kEX6SJsfo144VDjNaa+vQQQarmJgVYLvhA
         eYlzblKImbd17lcVv8Gqo+3O9U2q+LvCFK+uL+hJobxdaPkVOrWZyBM70B6whiSpbp92
         wyEA==
X-Forwarded-Encrypted: i=1; AJvYcCXg0fed3/M+Fjkj0b3o0BZbSap2uQi88cnJdEVKK/xzgY+64yRC/mlEIG9BRbZK5kd2Ua2b0ZU0LXsFoKAaHcA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQQODmJoF78/oW6RlCCOcSS4W5hlRD0qlTQxH0AGiwU5XZk9kE
	drI6pa4G5yg82FPQQWY2pb7D7LFSEBTy+dfR+X9mmWbc1bSdRZ8sj1YP2tvUoYU8zv9O
X-Gm-Gg: ATEYQzw5IZYe/HKJQKtLAL3Lt7Yp5HZBHy5EhESWP0JK6m4ydbwzH0xq5+r7LNaqZps
	JdHJ1shk0QNP82OxWloLhApPtrnKEzQtDU6MFF7lwshstzbSb2bHvN0mRHYN+Rs0Bu8QMSrZexg
	STSEucE90G8WfOcSA2lLV690CpkBcQLocaAevV5loTyLhN1cD9RFkTPlwPFJnEz4XNO2MUDt+2h
	Od/RM+J8v7QNvdzxXUBem1zOBAX963i0xkREh8gYkLrSrIBnkHuC9M46x1r51P+jUoDQIKbc+Pn
	Zi6qGRJA/2PP0cx4xcdoBeUzoFgTFdLyIJpLDnpSqEnbhaxJpclFq2xAw7KP7nuO4ogILIkQlxT
	da5eddkPCQ7y6Dy4tWx1QvbHUCHyDi6UuxSxiIm9SmZyaZKBUfUcm1GNbr6yYo+kYvyLM2l5i9q
	WzjIqY6fUlIFophUuqDgRhuDFqkn2QWhaVdmSOBzfC8lbiSwHCjwQDAvZMPVbBsosDm02O2BYTl
	6bJp3YSuDjZRKO4jsZNSAkU+w==
X-Received: by 2002:a17:902:db06:b0:2b2:4d36:7aa with SMTP id d9443c01a7336-2b269cee6d6mr12173595ad.35.1775003307800;
        Tue, 31 Mar 2026 17:28:27 -0700 (PDT)
Received: from thesius.dot.cyphar.com (2403-5809-a2fc-2-a90-9fd7-aedd-d405.ip6.aussiebb.net. [2403:5809:a2fc:2:a90:9fd7:aedd:d405])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b24264264fsm157057825ad.2.2026.03.31.17.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 17:28:27 -0700 (PDT)
From: Aleksa Sarai <aleksa@amutable.com>
Date: Wed, 01 Apr 2026 11:28:02 +1100
Subject: [PATCH v2 1/4] selftests: move openat2 tests to
 selftests/filesystems/
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-openat2-selftests-kunit-v2-1-ad153a07da0c@amutable.com>
References: <20260401-openat2-selftests-kunit-v2-0-ad153a07da0c@amutable.com>
In-Reply-To: <20260401-openat2-selftests-kunit-v2-0-ad153a07da0c@amutable.com>
To: Shuah Khan <shuah@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>, linux-fsdevel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Aleksa Sarai <cyphar@cyphar.com>, Aleksa Sarai <aleksa@amutable.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3236; i=aleksa@amutable.com;
 h=from:subject:message-id; bh=nt2OPfJr2A+6voG3mvjcDolBFXkCYdVhtEbTUQY3tSw=;
 b=owGbwMvMwCWmMf3Xpe0vXfIZT6slMWSeSVv8bStjLYftrEeNjZlM/PbZv4Lz7nHO6usslHM7k
 5bUUizaMZGFQYyLwVJMkWWbn2fopvmLryR/WskGM4eVCWSItEgDAwMDAwsDX25iXqmRjpGeqbah
 nqGRjpGOEQMXpwBM9a9+hv+xj+o6XU/PqS+6Z73BaddJszPveN9P3MDNnJF8Zoao6B5mRoZHfW2
 nnoovaOPav/e1oMjWH8GLf393Yn4WU9vr+8k524wPAA==
X-Developer-Key: i=aleksa@amutable.com; a=openpgp;
 fpr=C9C370B246B09F6DBCFC744C34401015D1D2D386

These tests really should've always belonged there, doubly so now that
they include a lot of other generic filesystem-related tests.

Suggested-by: Christian Brauner <brauner@kernel.org>
Signed-off-by: Aleksa Sarai <aleksa@amutable.com>
---
 tools/testing/selftests/{ => filesystems}/openat2/.gitignore           | 0
 tools/testing/selftests/{ => filesystems}/openat2/Makefile             | 3 ++-
 tools/testing/selftests/{ => filesystems}/openat2/helpers.c            | 0
 tools/testing/selftests/{ => filesystems}/openat2/helpers.h            | 0
 tools/testing/selftests/{ => filesystems}/openat2/openat2_test.c       | 0
 tools/testing/selftests/{ => filesystems}/openat2/rename_attack_test.c | 0
 tools/testing/selftests/{ => filesystems}/openat2/resolve_test.c       | 0
 7 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/openat2/.gitignore b/tools/testing/selftests/filesystems/openat2/.gitignore
similarity index 100%
rename from tools/testing/selftests/openat2/.gitignore
rename to tools/testing/selftests/filesystems/openat2/.gitignore
diff --git a/tools/testing/selftests/openat2/Makefile b/tools/testing/selftests/filesystems/openat2/Makefile
similarity index 91%
rename from tools/testing/selftests/openat2/Makefile
rename to tools/testing/selftests/filesystems/openat2/Makefile
index 185dc76ebb5f..f36dedccedb6 100644
--- a/tools/testing/selftests/openat2/Makefile
+++ b/tools/testing/selftests/filesystems/openat2/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-or-later
 
+CFLAGS += $(KHDR_INCLUDES)
 CFLAGS += -Wall -O2 -g -fsanitize=address -fsanitize=undefined
 TEST_GEN_PROGS := openat2_test resolve_test rename_attack_test
 
@@ -13,6 +14,6 @@ endif
 
 LOCAL_HDRS += helpers.h
 
-include ../lib.mk
+include ../../lib.mk
 
 $(TEST_GEN_PROGS): helpers.c
diff --git a/tools/testing/selftests/openat2/helpers.c b/tools/testing/selftests/filesystems/openat2/helpers.c
similarity index 100%
rename from tools/testing/selftests/openat2/helpers.c
rename to tools/testing/selftests/filesystems/openat2/helpers.c
diff --git a/tools/testing/selftests/openat2/helpers.h b/tools/testing/selftests/filesystems/openat2/helpers.h
similarity index 100%
rename from tools/testing/selftests/openat2/helpers.h
rename to tools/testing/selftests/filesystems/openat2/helpers.h
diff --git a/tools/testing/selftests/openat2/openat2_test.c b/tools/testing/selftests/filesystems/openat2/openat2_test.c
similarity index 100%
rename from tools/testing/selftests/openat2/openat2_test.c
rename to tools/testing/selftests/filesystems/openat2/openat2_test.c
diff --git a/tools/testing/selftests/openat2/rename_attack_test.c b/tools/testing/selftests/filesystems/openat2/rename_attack_test.c
similarity index 100%
rename from tools/testing/selftests/openat2/rename_attack_test.c
rename to tools/testing/selftests/filesystems/openat2/rename_attack_test.c
diff --git a/tools/testing/selftests/openat2/resolve_test.c b/tools/testing/selftests/filesystems/openat2/resolve_test.c
similarity index 100%
rename from tools/testing/selftests/openat2/resolve_test.c
rename to tools/testing/selftests/filesystems/openat2/resolve_test.c

-- 
2.53.0

