Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 635A622083
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Mar 2026 00:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773879211; cv=none; b=Rp1WnVevJ8iFowDnqIR7+hq20sGhw38/XM6P2A0ujTzbNddIGb6VtVqKmb7VYeBq7GNTrGpN1jIQSjaUFGgR4SCDX+Z23P4mqr3vD5Hpfkp1vSwdZ4B2Qru9ejc+B2w9eEJ9p4NQ/PcIAGHiXB2XCDrX8hv+zHg/XTluLLcWVew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773879211; c=relaxed/simple;
	bh=f8uvFrDubU4oOhXNlCQqhnRLfgNBkZw1tWtV4CEa0KM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YNP38V1UAw72dsWwTmkbz67SdUuMqB5Bb+yszxe7Wa5tW9f8dh3U346tyacchklhYh+QrZLrU7HtW9PKOzbRxBvxqb5OccgmvPYDijsLu96rCkQ6D7vlslmJwcxORR19QRxdepRQXN8vfvbiWZBhW9DR3JMKOEdbaTgv9t/OMYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HwycfhF4; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HwycfhF4"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-483487335c2so2777755e9.2
        for <linux-kselftest@vger.kernel.org>; Wed, 18 Mar 2026 17:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773879209; x=1774484009; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nTjxE3JQqOolAqKstJpX9T/NdJfvt6h9kQqpuq86OH0=;
        b=HwycfhF4BjwkWgoq0tKiPgH+meH5nr6TL2jwyBk8cK6QefDJxEUph2Cdea620ckA/w
         WymxbYJlrNfLjraO5fL0rbTFhRucWz/DR98zNUfBfi04TUHXVhOiIcO6ay4UZ+Le0OMM
         CFunkAC1YOe3PIV+vNHsSJJQC5aC6voHX913WSqq3h+N1+JkuR/QT/x+PPiGpU0oKuxR
         84xiOder6ELKqCNUGtWA1wbLQ31tIltp4fwuszo/q6fx5uGvTeasWnlfBb+YvMlAYNaJ
         J0IdwD39hqNjFADUEdOBq7zvTInCg16M+3C0QLJgnD2G9kwloasNQMRAEU95anwLsm36
         yYhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773879209; x=1774484009;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nTjxE3JQqOolAqKstJpX9T/NdJfvt6h9kQqpuq86OH0=;
        b=gtsJY7K0aXwcPKSEG3gdznaa6mOIsqWFRkO4x/PUrjpxpIhy7khEvsHw2ObaGfVh5D
         upX7H9XmETb+Op8mgjSu8b4+VgP/W0n7+gDnxzH3qPs/2xILGyG9OTzu0QqFEsaJHbSx
         e6UZ3cIDTXf44p9SAywyXDMfcBD/lHzAZlkTYVE4nc1SBZ85UinADgCENWv+3TbLTyl5
         PH6mx6Zgkse0ZCgS8SvnIRo3BpnIHi+2/TwgJxf8gEiV1Kv57JIRCFQUwHJlDRcFRnog
         B1VmyufTWUNtZfpq9IYbtUkYLteUg5lVBbgO/t9N2KyziZhdjtDEGQyWT/Zwb+SUjQrc
         GK/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXbJ6i7K85hJpBHGl4ZH3XnUAaSnQF4+jaq+w5pV4vZUuh0Hp2B8KnBOBCUqUE/1qXdGqU1yRDZXQzYqvpV88U=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTjpDNtqu0bf/o89oF9Vhu/WNp5jk0R72FdPN2OJPRR/rbzUsY
	aWYj0TjDCrKzQ+Nw2ixKgpStkDlwYuNtqblWWgFP71rcJxlct/dQQOon
X-Gm-Gg: ATEYQzy4iUj6nXtAXKAUjS101ayCXUomSJ1+XoR7Bj6ISIyH4kaNYeA0XnaTX1i854q
	VLwtbDeCnu2OnwRWhUgp9TJYhdPWhnL3HYV2SLJZJqPVLvAL30s0f8GkDKNw0EN302NnG+HwaKU
	Qo49X5CH6LQ9Wz8NXo+hOusYGIznMkPjX6+riO4bUl2Ua6BWVA0/6V6ZxrGMm+Z/NTjIJ9UsfBd
	nGUiczPjF0yfQ5iKZSzV/ovZJHzBGHjAgTKpdUMQhNmFkm0/Z1MnRo8SR3B8EEq/IwzMj8f8Wz/
	ABAH+mi3as2kyWmZkqnM+5B2txa9K3wCI/l15uCMTXrrToG9o4DiXunvkw/7Shajb8M8s3AL+7i
	l6/s6sZJ0hrg2syv0P5iQGA/t8DnD8ez4GP789PwakEYXyev4d8X6JgzRbBpalsdJzpgOiLZ2xe
	FERuMu0z2VCrLmI5GCLvfLk3gycQ==
X-Received: by 2002:a05:600c:1f10:b0:485:3d3e:1675 with SMTP id 5b1f17b1804b1-486f4429137mr85938665e9.8.1773879208383;
        Wed, 18 Mar 2026 17:13:28 -0700 (PDT)
Received: from hisam ([2402:ad80:86:fe00:bbdd:7f3:b302:5b46])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f8c5318dsm24682245e9.14.2026.03.18.17.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 17:13:28 -0700 (PDT)
From: Hisam Mehboob <hisamshar@gmail.com>
To: pbonzini@redhat.com,
	shuah@kernel.org,
	seanjc@google.com
Cc: kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hisam Mehboob <hisamshar@gmail.com>,
	Aqib Faruqui <aqibaf@amazon.com>
Subject: [PATCH] KVM: selftests: Guard execinfo.h inclusion for non-glibc builds
Date: Thu, 19 Mar 2026 05:08:43 +0500
Message-ID: <20260319000842.1213426-2-hisamshar@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The backtrace() function and execinfo.h are GNU extensions available
in glibc but not in non-glibc C libraries such as musl. Building KVM
selftests with musl-gcc fails with:

  lib/assert.c:9:10: fatal error: execinfo.h: No such file or directory

Guard the inclusion of execinfo.h under #ifdef __GLIBC__, and wrap
all backtrace() usage under the same guard with a fallback message
for non-glibc builds indicating that stack traces are not available.

Unlike the approach of adding a weak stub for backtrace(), this
explicitly handles the non-glibc case rather than silently providing
an empty implementation.

Link: https://lore.kernel.org/kvm/20250829142556.72577-7-aqibaf@amazon.com/

Suggested-by: Aqib Faruqui <aqibaf@amazon.com>
Signed-off-by: Hisam Mehboob <hisamshar@gmail.com>
---
 tools/testing/selftests/kvm/lib/assert.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tools/testing/selftests/kvm/lib/assert.c b/tools/testing/selftests/kvm/lib/assert.c
index b49690658c60..3442b80c37c1 100644
--- a/tools/testing/selftests/kvm/lib/assert.c
+++ b/tools/testing/selftests/kvm/lib/assert.c
@@ -6,7 +6,9 @@
  */
 #include "test_util.h"
 
+#ifdef __GLIBC__
 #include <execinfo.h>
+#endif
 #include <sys/syscall.h>
 
 #include "kselftest.h"
@@ -15,6 +17,7 @@
 static void __attribute__((noinline)) test_dump_stack(void);
 static void test_dump_stack(void)
 {
+#ifdef __GLIBC__
 	/*
 	 * Build and run this command:
 	 *
@@ -56,6 +59,10 @@ static void test_dump_stack(void)
 #pragma GCC diagnostic ignored "-Wunused-result"
 	system(cmd);
 #pragma GCC diagnostic pop
+
+#else /* !__GLIBC__ */
+	fputs("  (stack trace not available: compiled without glibc)\n", stderr);
+#endif
 }
 
 static pid_t _gettid(void)
-- 
2.51.0

