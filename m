Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712BB3EC2E1
	for <linux-kselftest@vger.kernel.org>; Mon, 27 Apr 2026 18:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777314671; cv=none; b=jICvlvv6yGCCNPKFbmyMaUr6ZZJZgKWshCMjJ1HCilAlesPmPGktU5euPg8r6uCqEWn8E5x85AxoBuxfFjVjUJwVjM18tlp9Xz+OaaZUilZmDMutmpiZq3qK1R9Zl6f9nVnyLb7U1tmOrflJQtF+BlaJt8VTxgmjD/deNrzvuSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777314671; c=relaxed/simple;
	bh=bsQGxHVEbWFMcU98H+Usr8BrpVvRynWHs4uJrO7ovMk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dvJByii3YosWVma2znqD2ZyJfj+95K54qvFUyFfipk6IxPieAZgGg8KlgCSJXsU+Wpj93sYumAZnWrTggA5USU83mpvgBTXfmvdEO4mYz6TYfhAnnK0vmVPiwapbZgoOptB5XtiNJCITAx2E58IgcMyJLOzhcQVovhFKfr3NUCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=cSwCjEYi; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="cSwCjEYi"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4891d7164ddso52706245e9.3
        for <linux-kselftest@vger.kernel.org>; Mon, 27 Apr 2026 11:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777314669; x=1777919469; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0N/qPZtLyDR9JYuc7La36zdYueKjOOpudQKv7E6xcTI=;
        b=cSwCjEYingP0i4Rnx0WwAFJJQAy0tbPLsyTJaG2V7DYB3Uk/1XDXLDPe+e6APMU0GP
         3I/SummWkvXARNdaAafJh8qw++6Bt0CFIY61LT6+CdHybxiGitVEvVKS/hCzXN/90LLo
         nrPB4TfKaK9v9E6w48mvkQhhd57NvTS0gKzZR6CY9MXz43gVLay5V0jZOqVxAWIE+Jdn
         KNy3gs2BJdCEC0M1BP8bBYBzU+Mf9F4bs2BKsmtfOzWUL4LWzRiwDEVm4ELxtxe8SoSm
         bb97WIq8xzA4L919ajW50VDJdZUNYn6UYvBEqh5ii7PXLZOJKJrHIZAMTVWq8QjnTTL+
         ebcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777314669; x=1777919469;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0N/qPZtLyDR9JYuc7La36zdYueKjOOpudQKv7E6xcTI=;
        b=ojgt6/FQLKaVFlzgcT4D+iIqUuMSR2e+KZ1kkUHKuIqVPRjWHc+DwwL7ogUrZRvzHf
         Fnk1BaiQ7ATqM1FvRft/mle4xAX5Kta96qHIjD8rKWRE5xdUY/zcSslA0nn+JvIfJXQU
         O1EuYCLeC7w5kahlQwmzT65qcgJa0HwGH540hTo8jynpJL0k+zdSi+O/le9uCHWOv6ay
         Bx/PbkKsMV0uGeNcL38/J8AwEZc04kJFvi5rBQA4fndhJ6vPLnT8sCMI8GNue6AbXFMW
         8o/V+3lNrfHDffCMRhuixpydmHyBRk4lNYfcf2oPEIjcuH3LBEXEFJicow7woZpZxdtI
         OLHA==
X-Forwarded-Encrypted: i=1; AFNElJ+7NmJd9qrBfQdG7fs4ZLe8jY9TQglp7DFd6IkPjXRSG7rNLwRT8kb0GGXc3wRHZ7set+gW93MZc7MwMIKlXCs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyjx7+RCLrov4ydzBMeHvQ5otPb+51VLVSTfAkPLHmEj5PrH2IO
	wXm+7BY82YziQPHxhvk0fxrunr2ykLwCPA4HOoH7kO3VoTuNxpdhqjl0Ebz5Kx/Wg9s=
X-Gm-Gg: AeBDiev4slrI6F2iGYwOnemGqRTBUZeu9s6GASSlSHcCaLbb+cVvPVbLzo6xyWRYAso
	hOG3gyJW/q15bdEeXcC3zh5XGTaHieQ5Mm0nKdewMv9fueZ0tRWpduRxZ6SDqEnq+C/8ca08Srv
	8dH7kB6QbdTtSp8YqoV//uEHdDGm9n0rnhv7SCS9hMuUjqpf2Ugx++n7rH6CmNXEsGtBlWIxflJ
	e61wzS2gIZpr3iSnOyNC0utg5j77iZFnGWcdopqeCBlCSMycd4CmAYS5NIcRbB31BEX1noZH+EM
	e2DIPlYWT+UaWyHvRuO6LRhi6WTM+90tnP4S6hO2eXGD3NxYSUW+Bi3Fu2YPQjqB39ZjkFy64av
	+v9a1m/yqKDThjB9hHsQeqt4Z45fPyKTUgJHU3JpsUjmmYXtiHlkQHzqYpQtZLaE8ilF3M8v2ao
	eHp1dK78SJqCJya51kTU073VpeAAgIYL7sKg==
X-Received: by 2002:a05:600c:a41:b0:489:1ca2:eafd with SMTP id 5b1f17b1804b1-48a76f5817amr7653805e9.11.1777314668841;
        Mon, 27 Apr 2026 11:31:08 -0700 (PDT)
Received: from [127.0.0.1] ([2804:1bc4:224:7800:585c:db3a:fcb:e21f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7749cabdsm1182065e9.9.2026.04.27.11.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 11:31:08 -0700 (PDT)
From: Marcos Paulo de Souza <mpdesouza@suse.com>
Date: Mon, 27 Apr 2026 15:30:57 -0300
Subject: [PATCH v3 1/6] selftests: livepatch: Check for
 ARCH_HAS_SYSCALL_WRAPPER config
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-lp-tests-old-fixes-v3-1-ccf3c90f744c@suse.com>
References: <20260427-lp-tests-old-fixes-v3-0-ccf3c90f744c@suse.com>
In-Reply-To: <20260427-lp-tests-old-fixes-v3-0-ccf3c90f744c@suse.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
 Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, 
 Joe Lawrence <joe.lawrence@redhat.com>, Shuah Khan <shuah@kernel.org>
Cc: live-patching@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Marcos Paulo de Souza <mpdesouza@suse.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777314662; l=1999;
 i=mpdesouza@suse.com; s=20231031; h=from:subject:message-id;
 bh=bsQGxHVEbWFMcU98H+Usr8BrpVvRynWHs4uJrO7ovMk=;
 b=JL5R1tkb4izoTxJFla00P5/7UyXAOGl7QH6mG8IkAUvOFzCVHGM8dCb1cEguqI3G+hg+rBqeK
 yzogw4SsDbXDEUhFdN3HZ/bGRPjJR6HiUGLuTxgownFKczX1zmzUjVx
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

