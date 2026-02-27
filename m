Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE37523A984;
	Fri, 27 Feb 2026 06:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772174762; cv=none; b=joUbC5okdnbMhgBReLbD32EDDmK/5goEufwcLr9hpTYZ7P+8aTemTKJXHl00TEaCDB2oT0hP4tekEoh5hAO65HcSz78qnDgY3SuUe9n/2EZLr1qDewAgtmLx+fvUreN/lq3WeKJUWvD21M+MMKkgvNVpUMAmAFxZNyN8lhn2x6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772174762; c=relaxed/simple;
	bh=MTmWB0bXTOPbqEKxHXK4MezAC5ZE1vjLmKBCWVLi5SU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r0ywVsTl6+hsILN9JzEznt8niChEe5NCXpB7UzKFjgxsbFRYjJAGdcqayrKiOsIROOAW4pJDb86gIkC6jK6loiVi460dOpvW5lxnYpN+c+a0ySfGLZmrISr/agNr/s6xPfRx1QOINrnSQhF7dDNbrwC58kDUj/8i516eErGBxok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=eMMztogJ; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=I+k8ZGU7; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="eMMztogJ";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="I+k8ZGU7"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772174760;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SAjxhN5A2qW4aDOymQOc+aoMJsVeojoM0YwpR0hVCk4=;
	b=eMMztogJkD3TN06jB5QjKTDgeOOjC9CTIlpdX0W3Le9EAUOiD6qc+Ol6ZfwdxntUoi5oGX
	kAEtYLhCpi2Eb6xzJK0KZwBSGJxZ6lyJAWCRGMhIlWLsEAgEbXHRm1f2iF02Qd9va4lKqe
	mpwx8hvvWE6cTVxJFWZBRYzAcS0GkNIJmwWrYcTtSyBW2oW2YkNdpF2KzJMbCkGxyQgLPb
	W68xFYfIez2VdwOiVm/N1PiFZypESVOrZPn7B5D8OHwA3rZNNCBRUYh+vnTOufyQiljqQ0
	q8TkeOKQTBr30yow2SojhOYVzf9YJmXYSqAqdY4etK4a587CEJodZjPWkHAVvA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772174760;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SAjxhN5A2qW4aDOymQOc+aoMJsVeojoM0YwpR0hVCk4=;
	b=I+k8ZGU7NH49Xlc01XPoc8zQ7VPslXlXfbUb0cs6bFU/YV+zZDGjgxBB90AHrfIB0u9Rbh
	7r0Mia/QyuAIrTAQ==
Date: Fri, 27 Feb 2026 07:45:56 +0100
Subject: [PATCH v2 1/6] Revert "selftests: vDSO: parse_vdso: Use UAPI
 headers instead of libc headers"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260227-vdso-selftest-cleanups-v2-1-d84830fa8beb@linutronix.de>
References: <20260227-vdso-selftest-cleanups-v2-0-d84830fa8beb@linutronix.de>
In-Reply-To: <20260227-vdso-selftest-cleanups-v2-0-d84830fa8beb@linutronix.de>
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772174759; l=1734;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=MTmWB0bXTOPbqEKxHXK4MezAC5ZE1vjLmKBCWVLi5SU=;
 b=OBjNjAzH7ojy/cuA40LgwrUracQA7jM9jjEZn6O16tn0JpwGrKI494NE0pX1jkVA8sWJq1Tjg
 PBKE+c9RwmGCjYD/3/rLEhAWMfmMiWgeW6onEjC+ckYCPCk8Nad5qDf
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

This reverts commit c9fbaa879508 ("selftests: vDSO: parse_vdso: Use UAPI
headers instead of libc headers")

The kernel headers were used to make parse_vdso.c compatible with
nolibc.  Unfortunately linux/elf.h is incompatible with glibc's
sys/auxv.h. When using glibc it is therefore not possible build
parse_vdso.c as part of the same compilation unit as its caller
as sys/auxv.h is needed for getauxval().

In the meantime nolibc gained its own elf.h, providing compatibility
with the documented libc interfaces.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 tools/testing/selftests/vDSO/Makefile     | 2 --
 tools/testing/selftests/vDSO/parse_vdso.c | 3 +--
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/tools/testing/selftests/vDSO/Makefile b/tools/testing/selftests/vDSO/Makefile
index e361aca22a74..2de5cef311c8 100644
--- a/tools/testing/selftests/vDSO/Makefile
+++ b/tools/testing/selftests/vDSO/Makefile
@@ -19,8 +19,6 @@ endif
 
 include ../lib.mk
 
-CFLAGS += $(TOOLS_INCLUDES)
-
 CFLAGS_NOLIBC := -nostdlib -nostdinc -ffreestanding -fno-asynchronous-unwind-tables \
 		 -fno-stack-protector -include $(top_srcdir)/tools/include/nolibc/nolibc.h \
 		 -I$(top_srcdir)/tools/include/nolibc/ $(KHDR_INCLUDES)
diff --git a/tools/testing/selftests/vDSO/parse_vdso.c b/tools/testing/selftests/vDSO/parse_vdso.c
index 3ff00fb624a4..c6ff4413ea36 100644
--- a/tools/testing/selftests/vDSO/parse_vdso.c
+++ b/tools/testing/selftests/vDSO/parse_vdso.c
@@ -19,8 +19,7 @@
 #include <stdint.h>
 #include <string.h>
 #include <limits.h>
-#include <linux/auxvec.h>
-#include <linux/elf.h>
+#include <elf.h>
 
 #include "parse_vdso.h"
 

-- 
2.53.0

