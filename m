Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A213DA7E3
	for <linux-kselftest@vger.kernel.org>; Thu,  9 Apr 2026 15:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775749627; cv=none; b=hhcRpsCMAgcfwC4XBKaG8t45TX3utlWQXqG0J2SnzmD/dVooi1p4HFk1C54iATwc/w7KAw+452w5LLzQs+Hfcz2lFyveROuUrnpfqlK0Och1FuxANOEKW71WeIzoRCNidzcnrFLFKeiH9YX/Wh6YMCBhW3AgXfyr0hrCJRDWBYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775749627; c=relaxed/simple;
	bh=ltl8tl7LY9Yc/LcZI9NUoPzqx2MsoXnzCioP2vkGbtQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=geb9+v/gqwB3nyiLW972vdhHObhpWjDtvV+6i8YSf4JkclGSHV3+myG3X3ftngJ9689m77V8rvcwnr+viWYbuzXnUjrukAKoNMQgisYa1Iyl175T2HmKVJmgU1RIJ65mp3iNJp8A7Cfi4KETth9iPrptMuhhEHMqJ4tIxGlDYqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U2hU6F7x; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U2hU6F7x"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48896199cbaso10909385e9.1
        for <linux-kselftest@vger.kernel.org>; Thu, 09 Apr 2026 08:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775749620; x=1776354420; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MEV02bcyH2Pdvd6Qd6GHWOafkuvPxsNvzJnUHt7jdc0=;
        b=U2hU6F7xrGf1BDgipo1KriCq4y6rc1AvyZNoNByCS+5ECFYnXHVvqsFROCKe9wIgqp
         tgUku+jW4rV/N43+mbn3UJSyaJEV/PhJ9yzfFpQLKs8odvWJLJM+XcolA0N4Dci8+MBx
         8tPCt4nDBBW5odlzRSQghsEJPOKIQPoBnRttKPUK7JN/YMw8jHRi3cVCLzlyGZhC0UHF
         Uz8UtdC6/qPAwRnU/zYsYIUwltvwx4ulGWfXvxHzUNv5iuVaUDDKyxVytYjIMT7wucKe
         MNwrnxBvWtOyLzKoaWMKBDl1/pHBccerLMqo2NFlN3hQVY/rgqvXMa5w5cQRXvEHJ82f
         lbAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775749620; x=1776354420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MEV02bcyH2Pdvd6Qd6GHWOafkuvPxsNvzJnUHt7jdc0=;
        b=NIWyC9JPPw+FRDtl6ObXSFlhXkUsQpliJMCC6NT49ghi7dbkozVbPWc7uAGX1zU7vz
         O7O4BuCGhGXOyhKklsypwUTyQwtqUm7OZhbiLGbXwwgYr2xc/UOiYVFVAecr6LzE6oHt
         nz5eIAxJBdMHFs8hE7TszeSZWWK1kMN8nxvZJkSdaTSnyCUeMHZRTfM6Px3cOKxTOb4i
         /fx72DpCWujmM3y9FGhgzoyPp/pGUGzje4xBJnq22kFcmMK1qOBFfYcNxBj6on/XFuIO
         iJLLmFW5a063Hq610aWjIofStnMNGr5oypXO6sYFFCNanSydsvSHBGpQ8eOLx4cUMo0F
         vQMA==
X-Forwarded-Encrypted: i=1; AJvYcCWh9nyaDU6XTvZmzL7sotZ8ao8KrytPLMdFsb7NBV0LEs5+fH88k8SJVJjfOz4XO5+dob0nKr5qMI6efD2IzjE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJ0nfsPBWJaXdsrsgV1Eryp+qOe2RvlBNj8vacmqQ0ANcR652l
	Brob+lncNZzxAioOVABWXJjGRcogQgIbAoFvrx7Lhu++Wbj+mS8L9rrX
X-Gm-Gg: AeBDies4UNBEXVv1FgtErjVpuT4nVBJFsmbuwHVe9cFN9hqL34ipmtaZxWZdA7ujYam
	YTkCynOp98xP0Xs1m0FNXUpto893kXe8oz+NKjF1bWlbBjZE64pxWCLTIr30lIEZ2jOejWzPaY3
	XSRPeMTQcaEWvpnWI51bdMUE8TaXoq7OZQG2JC1ue5mzHVvpLvqErmust9/pkYRDKxMLOe72XJ8
	PcysxlJwja0lmyN95hRG3EXLZIppnDArNbSVfnBXkIKFtwgtorY4Ic7BHdM1NCYqCxXzCqELIqj
	TOxgVoNKZENwYY/HWCpK0WMlwMWtP699ZWaS5pMhSrz7NmtQCOmB+m75vfZmX3tSuJRY3xNvBJC
	pocpHwb/MmYgCIhaCySQJ3IF/FNP1xyyvbiNSa1r8AknZg8smlWNDPDD2LW+p9OL084akuhiH1q
	iSeDPat4Vhe66WBGFHPWe/x0sByXUttko1oMbL7DA=
X-Received: by 2002:a05:600c:37c7:b0:485:9a50:3384 with SMTP id 5b1f17b1804b1-488cd05a06dmr58089375e9.25.1775749619783;
        Thu, 09 Apr 2026 08:46:59 -0700 (PDT)
Received: from hisam ([2400:adcc:119:1300:e749:40f7:4497:4ea7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488cd1d171dsm41612405e9.5.2026.04.09.08.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 08:46:59 -0700 (PDT)
From: Hisam Mehboob <hisamshar@gmail.com>
To: Sean Christopherson <seanjc@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aqib Faruqui <aqibaf@amazon.com>,
	shuah@kernel.org,
	pbonzini@redhat.com,
	Hisam Mehboob <hisamshar@gmail.com>
Subject: [PATCH v2] KVM: selftests: Guard execinfo.h inclusion for non-glibc builds
Date: Thu,  9 Apr 2026 20:38:47 +0500
Message-ID: <20260409153846.1502656-2-hisamshar@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260319000842.1213426-2-hisamshar@gmail.com>
References: <20260319000842.1213426-2-hisamshar@gmail.com>
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

Fix this by guarding the inclusion of execinfo.h and the stack dumping
logic under #ifdef __GLIBC__. For non-glibc builds, provide a local
stub for test_dump_stack().

Suggested-by: Aqib Faruqui <aqibaf@amazon.com>
Suggested-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Hisam Mehboob <hisamshar@gmail.com>
---
Changes in v2:
- Replaced the __weak stub approach with a single #ifdef __GLIBC__
  and a local stub inside assert.c as suggested by Sean Christopherson.

 tools/testing/selftests/kvm/lib/assert.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/lib/assert.c b/tools/testing/selftests/kvm/lib/assert.c
index b49690658c60..8be0d09ecf0f 100644
--- a/tools/testing/selftests/kvm/lib/assert.c
+++ b/tools/testing/selftests/kvm/lib/assert.c
@@ -6,11 +6,14 @@
  */
 #include "test_util.h"
 
-#include <execinfo.h>
+
 #include <sys/syscall.h>
 
 #include "kselftest.h"
 
+#ifdef __GLIBC__
+#include <execinfo.h>
+
 /* Dumps the current stack trace to stderr. */
 static void __attribute__((noinline)) test_dump_stack(void);
 static void test_dump_stack(void)
@@ -57,6 +60,9 @@ static void test_dump_stack(void)
 	system(cmd);
 #pragma GCC diagnostic pop
 }
+#else
+static void test_dump_stack(void) {}
+#endif
 
 static pid_t _gettid(void)
 {
-- 
2.51.0

