Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 121522DECA8
	for <linux-kselftest@vger.kernel.org>; Tue, 29 Sep 2026 04:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790656603; cv=none; b=Q/02HJpZ0q4OTthzbC3W/Y+nqc+OD0rgkkioejnzMSuG2ilozeI/z8ZNNQX02B24/NZQmCWqdivAllHGItoYJfJA+Vp6q7Lt/LlBIbUqJgVsaVg+ThIpJ0wv7aMJfj2ebhonPYSluskOvaAa28HxHxGMOscwW8fomwhc5Kw3ax8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790656603; c=relaxed/simple;
	bh=8BmDe7CieBenlT6QQFs8X3709Irc2hkQ7xYDpghBtVc=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=Xe3sEaLqasZM9EGm9PIXGLjaO45/6oRvvLdiu06OrwzWV7V10r6O9r3HemY9KbHK+sKufUfdGkdFk50qG9ezLmL60Ua2B4Eq8wC+jhBjpRiRS+UCCEtwFkxbkdXi+t/YboaTb31jiASXaleh8kWwpaYiyRvwFUWJIyg0bSj63AQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wakel.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gmlkzkju; arc=none smtp.client-ip=209.85.210.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wakel.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gmlkzkju"
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-882a1e6099aso2977012b3a.0
        for <linux-kselftest@vger.kernel.org>; Mon, 28 Sep 2026 21:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790656601; x=1791261401; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p4X3fobrUTS2dztsfdh4qouH9z1FompKqh33UTTDA4U=;
        b=gmlkzkjuQlVGaAHFQ6N/lp7gT/9FaW5F1K7gWddxiM5fzKPOdZp1wTaIpxXe+NNiUL
         ecJLGr8O0LtbaSONgNokpReoQLZCOkaq8hWOyuvopkkiyhFtEB1Dcrg6U5ymOLoQxfs/
         SXxpfF16fzueYjyJC2Yc8BhvKo958t57acEomd+GSBtB5ctsYwY+0i78joDcnz6Q5TvL
         jdMuS9WQXKCszmv+LtJARt2ESX5ytmYt14b6NNx8riubmn/39917D7j9zTSgXVlfaNiW
         S6wnlBSByMhoKyu7DNcbEoqa3+/r+LrGIK1c7Dh+qiqdUz0MiXRMADBOr2uvESJFH9qd
         XVBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790656601; x=1791261401;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p4X3fobrUTS2dztsfdh4qouH9z1FompKqh33UTTDA4U=;
        b=BkjR4bp7l7MMgAlw6g4VBWnD3i64JrETtC+W7lbDMPFl4ECt8dp2AtDT0vfHysncZQ
         EZ+lk+/QiPeRbWxf2r+p8FKU2GNsOckVpJDzyTlni9Y1nisbsyIBnG/JHGCMDwOlPNjL
         W2NC9pHuvG6jX9Vr+r+JFpZOzyMyn/iornD7i1AGJYL1ycTVtlgGgJ+TbcCkMtD+Spmc
         9Wi/xlTOhp/exVEUOso+DmS7VPdYixj80Y5DGw6e+lkBAZkJknJ709/Dy/+cTdCCqMHs
         R5vPG4UaXHkh77reigrpTwE/Shyd6ULyCoOtOCKSsRjcmFQb11J5xIjUEwqZ0XLsaMJN
         EuHQ==
X-Forwarded-Encrypted: i=1; AKwUvByNlOVhXSLoqBdWfjUntT+ffUj4zNOLRUPf8HjjnvdqrzJevZHGGyvxZhtkPS1E+xibywHLPd7W39q/ORg6EGI=@vger.kernel.org
X-Gm-Message-State: AFuF++kgh7QVV1aJ/djGr5+W2nQ8VW2qppKsSoDtCdBLui/mVgVjLi6V
	+Y9wNHcFj+JS1M2gL7sMo2NxmVfFL89NZTEGXeWsR5WaC2k0NySnsgzzX4ErQq93QsLjqdOv7Ly
	RiA==
X-Received: from pfrg28.prod.google.com ([2002:aa7:9f1c:0:b0:87f:bed6:5016])
 (user=wakel job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4192:b0:885:fcc1:a9b7
 with SMTP id d2e1a72fcca58-885fcc1bda1mr42636b3a.6.1790656601112; Mon, 28 Sep
 2026 21:36:41 -0700 (PDT)
Date: Tue, 29 Sep 2026 04:36:37 +0000
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260929043637.1917707-1-wakel@google.com>
Subject: [PATCH] selftests/size: Fix SIGSEGV on 32-bit x86 due to
 uninitialized vDSO pointer
From: Wake Liu <wakel@google.com>
To: Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org
Cc: Tim Bird <tim.bird@sony.com>, Siddhesh Poyarekar <siddhesh@gotplt.org>, linux-kernel@vger.kernel.org, 
	Wake Liu <wakel@google.com>
Content-Type: text/plain; charset="UTF-8"

Commit 6b64a650f0b2 ("kselftest: Minimise dependency of get_size on C
library interfaces") replaced direct C library calls with syscall() to
avoid accessing uninitialized TLS on x86_64 when built with
-nostartfiles.

However, on 32-bit x86 (i386), the C library's syscall() wrapper itself
relies on CRT startup initialization to dispatch system calls via the
vDSO entry point:
- In glibc (libc.a), syscall() executes "call *%gs:0x10", reading the
  __kernel_vsyscall pointer from the Thread Control Block (TCB).
- In Android Bionic (libc.a), syscall() calls __kernel_syscall(), which
  returns the global __libc_sysinfo pointer in .bss.

Because get_size is compiled with -static -ffreestanding -nostartfiles
and defines its own _start, CRT and TLS initialization never run. As a
result, calling libc's syscall() on 32-bit x86 dereferences an
uninitialized %gs selector or jumps to NULL (0x0), crashing immediately
with SIGSEGV.

Provide a local syscall() implementation on __i386__ that invokes
"int $0x80" directly, avoiding the C library's syscall() wrapper and
its CRT initialization dependency.

Fixes: 6b64a650f0b2 ("kselftest: Minimise dependency of get_size on C library interfaces")
Signed-off-by: Wake Liu <wakel@google.com>
---
 tools/testing/selftests/size/get_size.c | 29 +++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/tools/testing/selftests/size/get_size.c b/tools/testing/selftests/size/get_size.c
index 2980b1a63366..352c90d5c770 100644
--- a/tools/testing/selftests/size/get_size.c
+++ b/tools/testing/selftests/size/get_size.c
@@ -32,6 +32,35 @@
 
 #define STDOUT_FILENO 1
 
+#ifdef __i386__
+#include <stdarg.h>
+
+/*
+ * On 32-bit x86, libc's syscall() wrapper invokes the vDSO entry point
+ * stored in TLS (%gs:0x10 in glibc) or a global variable (__libc_sysinfo
+ * in Bionic) initialized by CRT startup routines. Because this binary is
+ * built with -nostartfiles, those pointers remain uninitialized and
+ * calling libc's syscall() crashes with SIGSEGV. Use int $0x80 directly.
+ */
+long syscall(long num, ...)
+{
+	va_list ap;
+	long a1, a2, a3, ret;
+
+	va_start(ap, num);
+	a1 = va_arg(ap, long);
+	a2 = va_arg(ap, long);
+	a3 = va_arg(ap, long);
+	va_end(ap);
+
+	__asm__ volatile("int $0x80"
+		: "=a"(ret)
+		: "a"(num), "b"(a1), "c"(a2), "d"(a3)
+		: "memory", "cc");
+	return ret;
+}
+#endif
+
 static int print(const char *s)
 {
 	size_t len = 0;
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

