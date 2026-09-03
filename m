Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9838368941;
	Thu,  3 Sep 2026 07:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788421109; cv=none; b=A4PTSxCcpvze6znrLmxbdUFbkJ1d6kBtt8E0wh9fKeYbB2lQsw+HZ1rWX0QpTsKR46M++9DMebCof3UebulXHCVgpv347coSF5dqe0nc8TZajjhxraejNTvg9qvZebEqbKpA5vRTg8Koq2Cqz+4MCOjW4B+uyatEa7WP71KtiJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788421109; c=relaxed/simple;
	bh=am8ORWYYrdZY9YvmvzxzTF8duuviOrKYIO8My2YnSEE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hsDEZCtw/Qqxla93YTvJMdR41Qb1JgDLq45fYP9sl5nHLr+bm0FAiywxy+1nfk99te+bGGKUU2A/n5z2HZUDqIidOdBM2DejjNPRXDlsF0KIDFOuX8F98Nt4Zi4fE8Gbt3i9fksg9wZ7ja/YwxbXYF3CHxuG0o8pHxR2i5wGa+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=y3M6duGN; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=6Ng6v4Qd; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="y3M6duGN";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="6Ng6v4Qd"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788421099;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a0HxrzKPhU3lF9wxgKboXGl5FTfDIVJGsi91Sr5qIi4=;
	b=y3M6duGNyR41zHesueauFEZ52foIVB/PKx2mWRnWlth5F21qvxESkB8badJn3hL0QxhL/+
	88Cvxl0NoVaWERl5iJdDCWr8vd49CRbFaDTVMl7KuhubWm761RzmQrhtsQ25l5IjEeIU30
	3ZNT5N3xOHG0qar52gjXG0hmoq7ifxVzvAU0Tn5iPcr6xtuWjl0PBg1NOZCSx8p6FPAG0S
	9urR/t5k1PBFsFIr7a2OS+jtz8oDFznd8FQfeFlzDyUQ+G2QZ6BGm2LIkKQtweg4TxQIYQ
	pnMLsVvQiPKRDlqqd/vYYYhjXBUAxs/RZjK5Fzn6VRCCz2PQpr6N3gNztjq83g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788421099;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a0HxrzKPhU3lF9wxgKboXGl5FTfDIVJGsi91Sr5qIi4=;
	b=6Ng6v4QddXG74MOLNC1/liwERIv4PrUjmb61k6rXwLq6sm5hiSp6lfBLjz04gKEuuG/oOK
	LPv+7d1l9x94BZBw==
Date: Thu, 03 Sep 2026 09:38:14 +0200
Subject: [PATCH v2 2/8] selftests: vDSO: Introduce vdso_syscalls.h
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260903-vdso-test-types-v2-2-1eec04eb3658@linutronix.de>
References: <20260903-vdso-test-types-v2-0-1eec04eb3658@linutronix.de>
In-Reply-To: <20260903-vdso-test-types-v2-0-1eec04eb3658@linutronix.de>
To: Andy Lutomirski <luto@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Shuah Khan <shuah@kernel.org>, Thomas Gleixner <tglx@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788421097; l=3955;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=am8ORWYYrdZY9YvmvzxzTF8duuviOrKYIO8My2YnSEE=;
 b=ECBxjtst6Dc2uC+JXKCAKcbHfEeRFKq4G1vGNkwTPdlKhcjkMh94tAvCmmC61V2MF1f9++a2M
 eXchBH+MLN9Bjabv+HXIT2PPyGkzeiMxt2m4TNXajwQj9AcBmG/U4rc
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The vDSO selftests use raw system call wrapper to validate the
correctness of the vDSO implementation. The exactly available system
calls differ between architectures and kernel configurations.
Raw system calls should not use libc types as these are not necessarily
compatible.

Introduce a helper header which uses the correct types and fallbacks.

Link: https://lore.kernel.org/lkml/29dd9e11-9ae8-415a-acb3-b96af56550b0@app.fastmail.com/
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 tools/testing/selftests/vDSO/vdso_syscalls.h | 92 ++++++++++++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/tools/testing/selftests/vDSO/vdso_syscalls.h b/tools/testing/selftests/vDSO/vdso_syscalls.h
new file mode 100644
index 000000000000..d4ed95b50eb5
--- /dev/null
+++ b/tools/testing/selftests/vDSO/vdso_syscalls.h
@@ -0,0 +1,92 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2025 Thomas Weißschuh <thomas.weissschuh@linutronix.de>, Linutronix GmbH
+ *
+ * System call wrappers to use for vDSO testing.
+ *
+ * vDSO calls are expected to return the same data as the equivalent system call.
+ * To ensure this the tests need to trigger system calls. Calling into libc may
+ * silently use the vDSO, so explicit system calls are necessary.
+ * Not all system calls are available on all platforms, so some fallback logic
+ * is needed. Use __NR_ constants from the kernel's UAPI headers over SYS_ from
+ * ones from libc to avoid any potential interference from libc.
+ * Always prefer the 64-bit time variants of the system calls as 32-bit ones
+ * may not be present on the platform or disabled in the kernel configuration.
+ * No fallback to the 32-bit ones is necessary, as the vDSO function
+ * availability always mirrors the system call one.
+ */
+#ifndef __VDSO_SYSCALLS_H__
+#define __VDSO_SYSCALLS_H__
+
+#include "vdso_types.h"
+
+#include <stddef.h>
+#include <sys/syscall.h>
+#include <linux/unistd.h>
+
+#define typeof_member(T, m)	typeof(((T *)0)->m)
+#define sizeof_member(T, m)	sizeof(typeof_member(T, m))
+
+/*
+ * To keep the fallback logic simple we assume that, although the types between
+ * the wrapper and the system call are different, they are compatible.
+ * Validate that assumption.
+ */
+#define ASSERT_MEMBER_COMPATIBLE(T1, T2, m)						\
+	do {										\
+		_Static_assert(sizeof_member(T1, m) == sizeof_member(T2, m), "");	\
+		_Static_assert(offsetof(T1, m) == offsetof(T2, m), "");			\
+	} while (0)
+
+#define ASSERT_TIMESPEC_COMPATIBLE(ts1, ts2)					\
+	do {									\
+		_Static_assert(sizeof(ts1) == sizeof(ts2), "");			\
+		ASSERT_MEMBER_COMPATIBLE(typeof(ts1), typeof(ts2), tv_sec);	\
+		ASSERT_MEMBER_COMPATIBLE(typeof(ts1), typeof(ts2), tv_nsec);	\
+	} while (0)
+
+static inline
+int sys_clock_getres(__kernel_clockid_t clock, struct __kernel_timespec *ts)
+{
+#ifdef __NR_clock_getres_time64
+	return syscall(__NR_clock_getres_time64, clock, ts);
+#else
+	ASSERT_TIMESPEC_COMPATIBLE(*ts, struct __kernel_old_timespec);
+	return syscall(__NR_clock_getres, clock, ts);
+#endif
+}
+
+static inline
+int sys_clock_gettime(__kernel_clockid_t clock, struct __kernel_timespec *ts)
+{
+#ifdef __NR_clock_gettime64
+	return syscall(__NR_clock_gettime64, clock, ts);
+#else
+	ASSERT_TIMESPEC_COMPATIBLE(*ts, struct __kernel_old_timespec);
+	return syscall(__NR_clock_gettime, clock, ts);
+#endif
+}
+
+static inline
+int sys_gettimeofday(struct __kernel_old_timeval *tv, struct kernel_timezone *tz)
+{
+#ifdef __NR_gettimeofday
+	return syscall(__NR_gettimeofday, tv, tz);
+#else
+	errno = ENOSYS;
+	return -1;
+#endif
+}
+
+static inline
+__kernel_old_time_t sys_time(__kernel_old_time_t *tloc)
+{
+#ifdef __NR_time
+	return syscall(__NR_time, tloc);
+#else
+	errno = ENOSYS;
+	return -1;
+#endif
+}
+
+#endif /* __VDSO_SYSCALLS_H__ */

-- 
2.55.0

