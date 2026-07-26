Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92AE5377004
	for <linux-kselftest@vger.kernel.org>; Sun, 26 Jul 2026 10:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785060801; cv=none; b=CQyrIdejjaLPMPF/H8WCJ/VPiX5GuvdDkieT0+x0lQ+cM97cBQrZTaH0K/Miu2mWCwrrcqpr344XA122pyNpTw2kejsN7fvESd4RbqfNGlLkHw/8agjH/QngasorCHc03uXBcSNE/s+Hz198XQ2RU0ozJRQUtCfGa+jDjkNyxkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785060801; c=relaxed/simple;
	bh=ZTVsyCMmNTiYhRegmleQ63YdYf87zoFj0XuRPlTwKTc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tKd9F/UQSVeWi4E729IWCEBkgWWbYWGlFzsaBhi2qilftTFSMCFDvtbNdxxgzqQODKhwK72EqVO38YsK9kbFvxXjU49Kt1RhvNXjUP0AZMubVpsfepL/xVuVYet9bff0xvaeYgv6+fjrGX1TgqpyRmRDUUtGchC/jXin81PuzU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openresty.com; spf=pass smtp.mailfrom=openresty.com; dkim=pass (2048-bit key) header.d=openresty.com header.i=@openresty.com header.b=Xh2Uh3ZE; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openresty.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openresty.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openresty.com header.i=@openresty.com header.b="Xh2Uh3ZE"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-ca913a601fbso1332176a12.3
        for <linux-kselftest@vger.kernel.org>; Sun, 26 Jul 2026 03:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openresty.com; s=google; t=1785060799; x=1785665599; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6vm5tLIDnBxoRlmuntR1gC/2V5EsdXXeIFZY5yD6sLc=;
        b=Xh2Uh3ZEIa0Li2nuVBeDd0C4CxOKcv8BfAtSLDbtsw7U/UtSeLehDqTsVocOO+bldx
         VNxA/dxCpRoNNP49eMALhsnz5pPNFAWc85PMVGMzjEoEkqLwwwgZ+gRm1pqeNTmFuIsg
         +A2NrpMWgViiYfLSRzIEgmXhuytcYKJ5tnOy2fcHbZC2Iexc2m5sLMJ6D2PLi1tvxWIp
         FONlj+VG7yqgtpKzuGRZfTGypL0vpJHPEqrRboZU7AkM2Txhl+9amF1042/hpJj+SJ4X
         8wSkTXQS7p6VnWF313ImAmT7JaNhcW/n5Vdn4qAWVOfSurYb3btKjhieMq8QRfj7FNf2
         skwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785060799; x=1785665599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6vm5tLIDnBxoRlmuntR1gC/2V5EsdXXeIFZY5yD6sLc=;
        b=rD/ObAO1JKidvBWAgnCBWVCXq0Axu+HT7SMmqkaG0da4PEFfqI6hrRX1K8S4IC3/Xj
         hgHE2NMOoIYGqGnpmCEK2IPvdFvzoJ7pSJEKQQQcgml8Rvj+aleif0XGpNS4fiwCgwik
         TF0EtxXHeiRNeyYGgAVJxhhWbsKF7M4mEtPGxeE6g0WwCUCD/E/Gt6nG1kbHSo2Wj2Vf
         JYuy+BSjRdQcERvqiKMtgdC7TmGU8/DmgCwZprgE0GLZZB7HSL5bh0oB5EyJpo/kDiHR
         xIWQNea6u2xtGI4LV0Fq+I/wZBxNuH6jxT2GntXI48dRGT7SSjqcpfX9xgd6UXI0Ap8L
         fEuQ==
X-Forwarded-Encrypted: i=1; AHgh+RoD1Wi26qqgLUoRai8CMwsMxzi8lQIE9LUml7mfTNwgk0DuKgnMj5O2N784/34+g+3RQILNGYvfm0OAF6ZjGkA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDAFoVyoStPDiy+Y/yus11AB0MvCeR32YlONnXD38E0IwEzxaE
	tQjATf9x+9WUOhQDESZhqt8Dy4jQKV2Aya6shuPQOynSdBDeacHkCPWV0Cd55JnsYxk=
X-Gm-Gg: AR+sD12AuYSR1+CiIjRJEqCUNbnagppO4bOW6EzGob/i47kZSwOycaP2ulcFtBqFWBC
	ld5ak+Swr+7RUmRjrAEZ57aIxxyObXYz8AOxfqNDgYNSYi5j4ykVsbDBvmE7yV8Phg/qFL6y3Ud
	wOhZMvI2E2I94GFpfcfcWZ741ZmpX+GsJZN2oBeXngwfL7Oghyaz+6h8O+zzqPXS1r7Lr2N7gg0
	2u6lTSyBZ9NLhFfu5SIZoWhjPovA+bBmdZxE+7ZhjdAv32pOotfzJ2QtGpqB15V5MDK1Dflvdhs
	EFj1XsgPsMpEEvXKHazX+8J4kYwVbGMQ3Rggjc38VwG7/NbVrfTOVcbfRKqXz/PDqlA/MScopK6
	sbBonA6gcK7WfjwV9NxYjzzzWBui8rB8LtTFV/JLhdQ9NMi1anWoYfMs7Rq0NO7PFtc20tSeIVH
	EJMykJLzVv5L4EMunxmWxvKt63
X-Received: by 2002:a05:6a20:c79a:b0:3c3:7a0a:18a7 with SMTP id adf61e73a8af0-3c67e13a7a8mr4326893637.55.1785060799033;
        Sun, 26 Jul 2026 03:13:19 -0700 (PDT)
Received: from integral2.. ([2402:8780:1329:2779:9db7:a8ec:2e1c:53e1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc59e9fesm17243981eec.27.2026.07.26.03.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 03:13:18 -0700 (PDT)
From: Ammar Faizi <ammarfaizi2@openresty.com>
To: Willy Tarreau <w@1wt.eu>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Ammar Faizi <ammarfaizi2@openresty.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Kselftest Mailing List <linux-kselftest@vger.kernel.org>,
	LLVM Mailing List <llvm@lists.linux.dev>,
	Yichun Zhang <yichun@openresty.com>,
	Alviro Iskandar Setiawan <alviro.iskandar@gnuweeb.org>,
	Shuah Khan <shuah@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	gwml@gnuweeb.org
Subject: [PATCH 1/4] tools/nolibc: evaluate syscall() arguments before the arch macros
Date: Sun, 26 Jul 2026 17:13:02 +0700
Message-Id: <20260726101306.3772237-2-ammarfaizi2@openresty.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260726101306.3772237-1-ammarfaizi2@openresty.com>
References: <20260726101306.3772237-1-ammarfaizi2@openresty.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Per the GCC docs, local `register` variables aren't guaranteed to
survive a function call, and you shouldn't put code between the
register assignment and the `asm` block:

    https://gcc.gnu.org/onlinedocs/gcc/Local-Register-Variables.html

The __nolibc_syscallN() macros put their arguments into local register
variables. syscall() drops caller expressions straight into those
macros, so this:

    static char msg[] = "Hello, World!\n";
    syscall(__NR_write, 1, msg, strlen(msg));

runs the wrong syscall. On x86-64, GCC doesn't reload %rax, %rdi, and
%rsi after the strlen() call, so only %rdx ends up correct.

Fix it by evaluating the arguments into temporaries first, before they
reach the arch macros.

Before this patch (bug):
```
0000000000401000 <main>:
    pushq  %rcx
    movl   $0x403000,%edi
    callq  401153 <strlen>  # strlen() clobbers %rax, %rdi, %rsi.
    movq   %rax,%rdx        # BUG: %rax, %rdi, %rsi are wrong.
    syscall                 # Only %rdx is correct.
    [...]
    popq   %rdx
    retq
```

After this patch (fixed):
```
0000000000401000 <main>:
    pushq  %rcx
    movl   $0x403000,%edi
    callq  40116c <strlen>
    movl   $0x1,%edi       # %rdi = 1 (stdout)
    movl   $0x403000,%esi  # %rsi = msg
    movq   %rax,%rdx       # %rdx = strlen(msg)
    movl   $0x1,%eax       # %rax = __NR_write
    syscall
    [...]
    popq   %rdx
    retq
```

Reproduced with gcc on i386 and x86-64 at -O0, -O1, -O2, -O3 and -Os.

Found this bug after a chat with Alviro. I also attempted to report a
similar problem to the GCC bugzilla:

    https://gcc.gnu.org/bugzilla/show_bug.cgi?id=126290

The solution from GNU developers is: use hard register constraints
(introduced in GCC 16) to reliably force asm operands into specific
registers, though Clang hasn't merged its version yet:

    https://gcc.gnu.org/onlinedocs/gcc-16.1.0/gcc/Hard-Register-Constraints.html
    https://github.com/llvm/llvm-project/pull/85846

Once hard register constraints are widely available (in the future),
a reliable inline asm for a syscall may look like this:
```
    #define syscall6(N, ARG1, ARG2, ARG3, ARG4, ARG5, ARG6) ({ \
        long long ret = (N);  \
        __asm__ volatile(     \
            "syscall"         \
            : "+{rax}"(ret)   \
            : "{rdi}"(ARG1),  \
              "{rsi}"(ARG2),  \
              "{rdx}"(ARG3),  \
              "{r10}"(ARG4),  \
              "{r8}"(ARG5),   \
              "{r9}"(ARG6)    \
            : "rcx", "r11", "memory"); \
        (ret);  \
    })
```

Cc: Yichun Zhang <yichun@openresty.com>
Fixes: 53fcfafa8c5c ("tools/nolibc/unistd: add syscall()")
Reported-by: Alviro Iskandar Setiawan <alviro.iskandar@gnuweeb.org>
Signed-off-by: Ammar Faizi <ammarfaizi2@openresty.com>
---
 tools/include/nolibc/sys/syscall.h | 72 +++++++++++++++++++++++++++++-
 1 file changed, 71 insertions(+), 1 deletion(-)

diff --git a/tools/include/nolibc/sys/syscall.h b/tools/include/nolibc/sys/syscall.h
index 7f06314fcf0d..b91b82846fe4 100644
--- a/tools/include/nolibc/sys/syscall.h
+++ b/tools/include/nolibc/sys/syscall.h
@@ -10,9 +10,79 @@
 #ifndef _NOLIBC_SYS_SYSCALL_H
 #define _NOLIBC_SYS_SYSCALL_H
 
+/*
+ * The __nolibc_syscallN() macros assign their arguments to local register
+ * variables. A compiler only has to keep such a variable in its register
+ * right before the asm statement it feeds, so an argument expression which
+ * contains a function call gets evaluated once the earlier arguments already
+ * sit in their registers, and the call then clobbers them.
+ *
+ * Caller-supplied expressions enter here, so bind them to temporaries first
+ * and only hand plain variables over. __auto_type preserves the original
+ * type, so nothing gets truncated on the way.
+ */
+#define __nolibc_syscall_eval0(_n)					\
+({									\
+	__auto_type __sc_n = (_n);					\
+	__nolibc_syscall0(__sc_n);					\
+})
+#define __nolibc_syscall_eval1(_n, _a1)					\
+({									\
+	__auto_type __sc_n = (_n);					\
+	__auto_type __sc_a1 = (_a1);					\
+	__nolibc_syscall1(__sc_n, __sc_a1);				\
+})
+#define __nolibc_syscall_eval2(_n, _a1, _a2)				\
+({									\
+	__auto_type __sc_n = (_n);					\
+	__auto_type __sc_a1 = (_a1);					\
+	__auto_type __sc_a2 = (_a2);					\
+	__nolibc_syscall2(__sc_n, __sc_a1, __sc_a2);			\
+})
+#define __nolibc_syscall_eval3(_n, _a1, _a2, _a3)			\
+({									\
+	__auto_type __sc_n = (_n);					\
+	__auto_type __sc_a1 = (_a1);					\
+	__auto_type __sc_a2 = (_a2);					\
+	__auto_type __sc_a3 = (_a3);					\
+	__nolibc_syscall3(__sc_n, __sc_a1, __sc_a2, __sc_a3);		\
+})
+#define __nolibc_syscall_eval4(_n, _a1, _a2, _a3, _a4)			\
+({									\
+	__auto_type __sc_n = (_n);					\
+	__auto_type __sc_a1 = (_a1);					\
+	__auto_type __sc_a2 = (_a2);					\
+	__auto_type __sc_a3 = (_a3);					\
+	__auto_type __sc_a4 = (_a4);					\
+	__nolibc_syscall4(__sc_n, __sc_a1, __sc_a2, __sc_a3, __sc_a4);	\
+})
+#define __nolibc_syscall_eval5(_n, _a1, _a2, _a3, _a4, _a5)		\
+({									\
+	__auto_type __sc_n = (_n);					\
+	__auto_type __sc_a1 = (_a1);					\
+	__auto_type __sc_a2 = (_a2);					\
+	__auto_type __sc_a3 = (_a3);					\
+	__auto_type __sc_a4 = (_a4);					\
+	__auto_type __sc_a5 = (_a5);					\
+	__nolibc_syscall5(__sc_n, __sc_a1, __sc_a2, __sc_a3, __sc_a4,	\
+			  __sc_a5);					\
+})
+#define __nolibc_syscall_eval6(_n, _a1, _a2, _a3, _a4, _a5, _a6)	\
+({									\
+	__auto_type __sc_n = (_n);					\
+	__auto_type __sc_a1 = (_a1);					\
+	__auto_type __sc_a2 = (_a2);					\
+	__auto_type __sc_a3 = (_a3);					\
+	__auto_type __sc_a4 = (_a4);					\
+	__auto_type __sc_a5 = (_a5);					\
+	__auto_type __sc_a6 = (_a6);					\
+	__nolibc_syscall6(__sc_n, __sc_a1, __sc_a2, __sc_a3, __sc_a4,	\
+			  __sc_a5, __sc_a6);				\
+})
+
 #define ___nolibc_syscall_narg(_0, _1, _2, _3, _4, _5, _6, N, ...) N
 #define __nolibc_syscall_narg(...) ___nolibc_syscall_narg(__VA_ARGS__, 6, 5, 4, 3, 2, 1, 0)
-#define __nolibc_syscall(N, ...) __nolibc_syscall##N(__VA_ARGS__)
+#define __nolibc_syscall(N, ...) __nolibc_syscall_eval##N(__VA_ARGS__)
 #define __nolibc_syscall_n(N, ...) __nolibc_syscall(N, __VA_ARGS__)
 #define _syscall(...) __nolibc_syscall_n(__nolibc_syscall_narg(__VA_ARGS__), ##__VA_ARGS__)
 #define syscall(...) __sysret(_syscall(__VA_ARGS__))
-- 
Ammar Faizi

