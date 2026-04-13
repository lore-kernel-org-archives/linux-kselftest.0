Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC68B34B66F
	for <linux-kselftest@vger.kernel.org>; Mon, 13 Apr 2026 17:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776101189; cv=none; b=I6WSaOjlxN4PyDynbv+ej5/vXkthV2KfkEQjWYwPny2U/Yx1lfgbiqqeVuiewiNcwZrfpZh1mcG/DrBasIbWuF47LO94rXbb/ssAVZ+2FuvOfmo5MAWSfvcU7Go3H4x0HhYdXDgvaNu989vO5yPs4Xw4xvyne6JCUw6ZenvWdqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776101189; c=relaxed/simple;
	bh=rr2RR+x0HeR1UdbTO0pKuZtUObXU97RoB+HEOcwaOdM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bzLdS92oRZdnTNlhAWkjHZNLfAQtU0bQZVqoYwYYF0L+xV+2jpe/nc5kmZKwpyCVxWcL3KDsaV9c/IY5unE2lQqXaX4ZBgYX8SYCT4DCkbYhQWQuWYUJW2pTBlKeN7TB6gSts8q7iOultGyxC83u+dPvIcEO2i1pY5J1gNuvx2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=LlkZM9pY; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="LlkZM9pY"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488ba6366a7so58609245e9.0
        for <linux-kselftest@vger.kernel.org>; Mon, 13 Apr 2026 10:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776101184; x=1776705984; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lT7L7ZV1IaRLBgX9aPy3VkyvToZXmMkItn9sA5MqUEw=;
        b=LlkZM9pYr+/bdBE623ije+y31ICCNO8C9PTd7pA3vxFTVtQe4Z5ZAYyXq4oR7FItnV
         HmsNbJ8QwaMDm3WBHg8vtHhz4WJ/76yRxYbnEK+w8fBJiFgl9F+eNR68zJwc0idZjGk1
         +F8LE9bpBPRZDS2gCszttXhlvZ9dhjk3IAMruSbqFWK/jKpEEJsKcdpvAHYpNB5PSrIm
         +4gJ/62XIOHftQZ5kEX79UAaRg4CthBGuRVtXEZO1wdwHBUlciVg3M16AwdqiFkr/6U/
         AhusHH1awTu0YxfaXwdjuLIecpNp70at/j+qrF5fOsVD7j7+YWHNUPBSilJWleJJAyeD
         vPmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776101184; x=1776705984;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lT7L7ZV1IaRLBgX9aPy3VkyvToZXmMkItn9sA5MqUEw=;
        b=OkVhoDQsTTTtALEf4qHaptIywKorB4bUVe5+4p14Eb3G2zRyAdz1lvQZvu+0SCWe8j
         RfwZ/JpsJ+eZDfeftWV11u/4wTDK0Bla2cgWzt7npHsuC0R6Qv9ZHm9NtfeDT1+qgJSD
         B/bh8GjUCOQVs0WbTUbkacOlZH7xso1qtohpkBtIV2FkM157oRp10GFum4KrugfTssMD
         WUI0fVdrJgPt6kYOuLPmCTj/+o3EsulRVq8qMV0Mtlmxz7lpZGVrKPbBOiEWLpXhtVQh
         d47h5xH6K5sHgNSMu0neFCfIMr9emEEc4xo9kr5+kDMbPXN3r6rASqcl/yL2TSLZAhbK
         Ugkw==
X-Forwarded-Encrypted: i=1; AFNElJ/6bzvAHtw6oTZfQaFj+Nr0HPA3CRzS6LV+iKIXiE4vP41Y2ozrN+q8hJms2yYK9LC+M834FJWokyyJq5mVtUc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQinkgnMSCkEkjFw4BZf3fhJSiACxa42oGIwJDjRm4+COu+ARB
	yosM4NrMXJnTLguSVgmWZ/TFCzGhpslnYCWZ2RyRGZLmmkEO+D2mE8ZVRGwC9NGhIWU=
X-Gm-Gg: AeBDieumal1Z55QktwCDx+Q+cMab5L5OhhQtGjvPl7nN9Q4LBWUHO/D9VrVMS1pETno
	rwq53V4SlizdJtua+mUk/GRvOTYQmIg4tTlZfb+uBBBTjmmEIFJtDh7idTta32nOus13NQfVefM
	eyoqGkhqPhodUspKSbz6CayRgS6KQZjYkxhCAdLibto2eCwaQQU6pUrJ2kPdaQPlhLon6l5rl+y
	JGPHCxOQZlHmDflMl+qjlFDsehyJxO5QAAbRW/EcS0xasPJDnkKbpyTZwu53U2c09PTO1doI7vG
	11lXfTmIZM+ptgQUI1BkqAR/NnNNWq7TJtdnUAkdom2sE1GaUn6lsxVms4mgtSlzieXsK+KBYMO
	DcDr8XKX28SwlWFL+fOtoPhE/vHatMyqXt5SSW1Q4dye8neAY6jzXLE/e8rE0yMIZ+eri60M7cw
	mNxMyoOZf6wxYViCNr8jFaVYE=
X-Received: by 2002:a05:600c:1c0a:b0:485:4388:3492 with SMTP id 5b1f17b1804b1-488d67f4e67mr195662795e9.11.1776101183656;
        Mon, 13 Apr 2026 10:26:23 -0700 (PDT)
Received: from [127.0.0.1] ([2804:1bc4:224:7800:585c:db3a:fcb:e21f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5734a94sm298657835e9.0.2026.04.13.10.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 10:26:23 -0700 (PDT)
From: Marcos Paulo de Souza <mpdesouza@suse.com>
Date: Mon, 13 Apr 2026 14:26:12 -0300
Subject: [PATCH v2 1/6] selftests: livepatch: Check for
 ARCH_HAS_SYSCALL_WRAPPER config
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260413-lp-tests-old-fixes-v2-1-367c7cb5006f@suse.com>
References: <20260413-lp-tests-old-fixes-v2-0-367c7cb5006f@suse.com>
In-Reply-To: <20260413-lp-tests-old-fixes-v2-0-367c7cb5006f@suse.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
 Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, 
 Joe Lawrence <joe.lawrence@redhat.com>, Shuah Khan <shuah@kernel.org>
Cc: live-patching@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Marcos Paulo de Souza <mpdesouza@suse.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776101176; l=1832;
 i=mpdesouza@suse.com; s=20231031; h=from:subject:message-id;
 bh=rr2RR+x0HeR1UdbTO0pKuZtUObXU97RoB+HEOcwaOdM=;
 b=hdn6jheR3lzQFjoGWchyhG3rl3D/g59+JC33wwwmYVHOSJ0XZJRcKHAbOHyDsKVA2+0/KLpbe
 0knQ66N73cYBunFNbaXFS/yCdrGwWgPCQHTsU+OG46Oo+otluUbxuTK
X-Developer-Key: i=mpdesouza@suse.com; a=ed25519;
 pk=/Ni/TsKkr69EOmdZXkp1Q/BlzDonbOBRsfPa18ySIwU=

Older kernels that lack CONFIG_ARCH_HAS_SYSCALL_WRAPPER config don't
have any prefixes for their syscalls. The same applies to current
powerpc and loongarch, covering all currently supported architectures
that support livepatch.

The other supported architectures have specific prefixes, so error out
when a new architecture adds livepatch support with wrappes but didn't
update the test to include it.

Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
---
 .../selftests/livepatch/test_modules/test_klp_syscall.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/livepatch/test_modules/test_klp_syscall.c b/tools/testing/selftests/livepatch/test_modules/test_klp_syscall.c
index dd802783ea84..b5527a288a7c 100644
--- a/tools/testing/selftests/livepatch/test_modules/test_klp_syscall.c
+++ b/tools/testing/selftests/livepatch/test_modules/test_klp_syscall.c
@@ -12,15 +12,26 @@
 #include <linux/slab.h>
 #include <linux/livepatch.h>
 
-#if defined(__x86_64__)
+/*
+ * Before CONFIG_ARCH_HAS_SYSCALL_WRAPPER was introduced there were no
+ * prefixes for system calls.
+ * Both ppc and loongarch does not set prefixes for their system calls either.
+ */
+#if !defined(CONFIG_ARCH_HAS_SYSCALL_WRAPPER) ||  defined(__powerpc__) || \
+	defined(__loongarch__)
+#define FN_PREFIX
+#elif defined(__x86_64__)
 #define FN_PREFIX __x64_
 #elif defined(__s390x__)
 #define FN_PREFIX __s390x_
 #elif defined(__aarch64__)
 #define FN_PREFIX __arm64_
-#else
-/* powerpc does not select ARCH_HAS_SYSCALL_WRAPPER */
+#elif defined(__powerpc__)
+#define FN_PREFIX
+#elif defined(__loongarch__)
 #define FN_PREFIX
+#else
+#error "Missing syscall wrapper for the given architecture."
 #endif
 
 /* Protects klp_pids */

-- 
2.52.0

