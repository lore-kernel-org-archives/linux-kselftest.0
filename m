Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F4E391E4C
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Mar 2026 20:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774556321; cv=none; b=IDFXWlqSHtSNu1EHFlcwj7Ntf+U7nGBiX+1C1qfcXVivkrZFgmP6Y9CIs4f4TVfboiVFCvqUKYTyp7WLZaAM+yt5bs5UmGXGpYQO2sC8QOgtj48HJyX4krgG8EFR5Sr8yhk8WgdxjyWrSCrCZxXDXv6Kw6uDHxBPcnDYM4Tb1Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774556321; c=relaxed/simple;
	bh=K5v5TTWH4F+mh+Qb1H4gG6uq2C0QCi+Bgcw9bKObD+A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SJ/X1A21mXcT/Nhkv/5W6nXt3QB/13oOTnwRGQCKRlfCwOkG7YROXGLsflCFPbAPwV6q6NVmwm0PuK0PhajcADukhLaRa3Y6+strWzgSqOIohGEPklKwQu3z1HgZ1zU1ntDnQKEAiDg3oyKEAsE2uaOSie67rIyBFcdyP2hvqUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X7LdI/I9; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X7LdI/I9"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso12840285e9.1
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Mar 2026 13:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774556318; x=1775161118; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xycnlm/h8VsaAluVGkMfR2izvoHRISt/YiMCwALMUO4=;
        b=X7LdI/I9ozAE4Yw7QpZTVLe0TVjjbwjkLo4fu+3hGtce21mmaUdC4OIPhErpiiyGuP
         bz0kNorxBGWvMMmzvyd3s/Xo5cWy5CBjYJoPSXvL29mJPE+/BZaiXMYaQd5DdeXOquqK
         Iw8wSgfOZZbTQy6KXGyZl7p0UkmMJMRoe1xlLiW70VwJ1GerVbquxPOV35asHCvaL1Cz
         LDRLoNfNgqhksj1zCBNXQyc7OAhRIF9dTzI3b7/rnzyZSUYli6u+eTRUri3eQ/D//Esd
         rhykzrYRgLFZzF0mfaYReGEZ/mbl7E1ldobRHiCXUD8inSXqd6dEwCiZu6B+LqOVvKOv
         SmjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774556318; x=1775161118;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xycnlm/h8VsaAluVGkMfR2izvoHRISt/YiMCwALMUO4=;
        b=KNOGSPibVUq32NF8Ykkf1kdUbDgU8URyeqfWdQGMWQ0PwOgDZ2Jr3RdfvfXXniXcsD
         MFqHSggn4m9i+Hos3q7mhwf/VTzJ+HiMlFWq/TnjiCIhZrJLMjqK2V6TE6a3SHKc4vFV
         z9pauBIA6jbV8i5nD0kBRbII1S5Pk0mlQEpUnJLLSVaUfwLTeiYnHC2ERcsTsQcMYkDB
         tK7KlP+5syIBQX5mgWDT8PREP3gCIM3eDG9dC5v9JK8EmNleE7nvMd9jt4Kl0vacDNIa
         V3b08y1/rXrPrius0D6Rlul6xpoEQ1G4JHUT0SCJ8g8okyYLGfB+XWCFPjnUn0YHGVQb
         7qHA==
X-Forwarded-Encrypted: i=1; AJvYcCUDjVquCt0udH4fAqU7eHaRa4yotjFhmGx2k/bCo6vp1FXZeVR1v9YwtMD2vEqp/WOpD9vDtUARi0Xs2YOsxzE=@vger.kernel.org
X-Gm-Message-State: AOJu0YylfHOMJjJBKuEJ2Jv8RqeOLiQuvCaKDnXtFrHpfs6XNFkFcETi
	oW/KutGVhl7tLiaHrhc11DgufE6EETPaPIt1CoiA5jmzuHySQKOCdw8q
X-Gm-Gg: ATEYQzxl6goWa6ASgAJkoMHXL7Nda3rgMWnqr8YM3Dj3VtRWSd3VQXAxjUeBNMCYY6s
	I6CGrDJCHOZaQADXvBuIuOJ1pZfKUlKPiuSVd1G+e/m1REKD92RXIbYhzd+uPUEtWwofL4lNIfo
	vqGFU05S08TQT7qQJN64JNVKywoxdFdqQjCw3Gnw5MbpPizJ9dZHfOG8fZa846o0AfQeF9AE9ze
	IPbv29SkJOWKh9lhKTvy6/uJ89nfXS92lDDG+0wX1XJRi+qnhLB60vZdQuv+Eom9wUD6wyXzQ5T
	gLfwE+qn7juv5m748q6wETiDfk3ic1UBez4KwImP/ntXTb8F0Jl1koNwoK6/O2kx1wdZQT45ypz
	exycgNn7YalzVh6ZBuLl/IsPixjqJyA7/eQmtcIptkiKDS4g+mHQ0+XXYpaXMeJZdYhH1Q2ClAg
	p/41WKuEL97rk0QXyBPN+DQB5ykGmomnxbUlNJIp2IkREJOdMmeAuItlhZ+yADlslZAvwCfGz3O
	8x3Hvc0c/dI
X-Received: by 2002:a05:600c:8708:b0:483:b505:9db7 with SMTP id 5b1f17b1804b1-48727f1b5f1mr442955e9.32.1774556317978;
        Thu, 26 Mar 2026 13:18:37 -0700 (PDT)
Received: from snowdrop.snailnet.com (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48725d9acb9sm3330475e9.1.2026.03.26.13.18.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 13:18:37 -0700 (PDT)
From: david.laight.linux@gmail.com
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
	Shuah Khan <shuah@kernel.org>,
	wireguard@lists.zx2c4.com,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: David Laight <david.laight.linux@gmail.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Petr Mladek <pmladek@suse.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH next] wireguard: selftests: Remove spurious precision from banner printf
Date: Thu, 26 Mar 2026 20:18:36 +0000
Message-Id: <20260326201836.3957-1-david.laight.linux@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: David Laight <david.laight.linux@gmail.com>

Change ("%*.s", len, "") to ("%*s", len, "").
The former is equivalent to "%*.0s" but is really a typing mistake.
No actual change to the output.

Signed-off-by: David Laight <david.laight.linux@gmail.com>
---
 tools/testing/selftests/wireguard/qemu/init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/wireguard/qemu/init.c b/tools/testing/selftests/wireguard/qemu/init.c
index 3e49924dd77e..c87570494d30 100644
--- a/tools/testing/selftests/wireguard/qemu/init.c
+++ b/tools/testing/selftests/wireguard/qemu/init.c
@@ -53,7 +53,7 @@ static void print_banner(void)
 		panic("uname");
 
 	len = strlen("    WireGuard Test Suite on       ") + strlen(utsname.sysname) + strlen(utsname.release) + strlen(utsname.machine);
-	printf("\x1b[45m\x1b[33m\x1b[1m%*.s\x1b[0m\n\x1b[45m\x1b[33m\x1b[1m    WireGuard Test Suite on %s %s %s    \x1b[0m\n\x1b[45m\x1b[33m\x1b[1m%*.s\x1b[0m\n\n", len, "", utsname.sysname, utsname.release, utsname.machine, len, "");
+	printf("\x1b[45m\x1b[33m\x1b[1m%*s\x1b[0m\n\x1b[45m\x1b[33m\x1b[1m    WireGuard Test Suite on %s %s %s    \x1b[0m\n\x1b[45m\x1b[33m\x1b[1m%*s\x1b[0m\n\n", len, "", utsname.sysname, utsname.release, utsname.machine, len, "");
 }
 
 static void seed_rng(void)
-- 
2.39.5

