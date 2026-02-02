Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE084396D1D
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Feb 2026 22:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770071478; cv=none; b=obndMHJRO1n3gl3UzbTHR7ShyOSJXhgaQ8sMrYr+d3Rlg5oquA4yDnusWyxZ4UvhA5buJPbzQX0RP+TdCdoEGh1iivjygH4IK+WnSLPfv53CmzNpCcND4186Dj2lCIt5IJoyBFD/jOi74RctCk9GUxK3Aua9je33UzOjDhdrCWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770071478; c=relaxed/simple;
	bh=paRY902jSAmTETjDD1hZGcuiwxsRB/2HetR0hPmkoIc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Reh8GdqXGNBqYOMkc94v8pE8JaRX3KCecfiSJyRzz3wt04UTQmuHdtAVvwWPJxUAr85/TplFKb8g3Qe/u/mDLT8ckOdJ8lnxn04MyWldgcRrZcU1G+fS6kjjZXNUvH4IgWu9nZ/I1g9I9Y9dMCQ+Yr5RcoDOeS6t1Usl1Jl1ISI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=35amO8b+; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="35amO8b+"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-c61dee98720so2935132a12.0
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Feb 2026 14:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770071476; x=1770676276; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=CIRzZ36BxJeE+zHVaNnE1NZJiOjcnY3uuksWluhV1Js=;
        b=35amO8b+AvdeYXZMd1IdozUBZTpfsOIg3DRoDyLqqXxx8zp3PsAH178kiz4ENkDfUp
         ffMExAxNn4HS/qB77ndlruXg/I9o5rK+1D059F9HUT4XbMxeb+Jc9wyHf8MyKv8pqb/c
         IVTaYztJ4/o8/uLjVfvlOg390wqJbpj/EBN+8xNCGFU8MYIGZBTQ3QNm1CZ5SKuDBo3w
         b5S1TAZYYPvUINR9+C9+/+X6Kbw8wUOAHZJ/MlU58eguNXgIh2/N6HnkAwVJ+wAAtx3i
         B2aj/pOZ/uNHBZiEha51ddtu0ElgDE5X5j3wfRHeqqtQFYG60e+N7DIRfUz1fnMLDHiM
         0Qpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770071476; x=1770676276;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CIRzZ36BxJeE+zHVaNnE1NZJiOjcnY3uuksWluhV1Js=;
        b=R9F/aWQTG3nIJXoa50nblEJsY1ivnYqJFOPHYlJPEZK1bGmxYT5X5AQqcSC/Xo5Kv9
         WsxJAC2Rb9H+X3SFLt+fQzNUgAOnGRnUQdBI4FYuR6r4TMV18sDp0u57p7R69AtAbto0
         ELJFFVlYOk46wGiClQ1EIIO4D1WVe6O7rp8hIshDKgvZi5aSWZal0Gpq7UuqEV3MXhJE
         19Ux2deoCHJ9eVD8C9MJGceePuSxvZdRt5z74VwfcfepQNBOGki+jggvL6/9J7JWGSxL
         tT5mXEzv9/VMUXufTA0lOXh+9vGo2YwDa3b5wzyl7HBAcFzFIEbU/fiUGhOyutI/lkYd
         VIOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnDxghmSs2hIvGFjGHdvqZspk6EUDk7YY5XR/4zunQ2aNy/w1KfDJoq4SdIQdmAZmbgZAWKAdVy8uF+noE84o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2Gwh9PTRmn2t6QvOSxs+12uEEiDeL+Y7/sTSegw1rlWCX01pS
	dLJjMwqhS4L7TiInJGN+o92iJ0Y/I+YV92Cb4aUYyfm9PZbGBG/QEu8Mnj8MPP3yZ+W6fnS2CGi
	+t+Z8Uxai2qYpiW4sIgwX9RyHOQ==
X-Received: from pgbca8.prod.google.com ([2002:a05:6a02:688:b0:c66:bca:633a])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:2d21:b0:350:55e0:5522 with SMTP id adf61e73a8af0-392e011a856mr12193174637.37.1770071476213;
 Mon, 02 Feb 2026 14:31:16 -0800 (PST)
Date: Mon,  2 Feb 2026 14:30:11 -0800
In-Reply-To: <cover.1770071243.git.ackerleytng@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1770071243.git.ackerleytng@google.com>
X-Mailer: git-send-email 2.53.0.rc1.225.gd81095ad13-goog
Message-ID: <995398ca18fcb192444799a520cab5ea8e43df7b.1770071243.git.ackerleytng@google.com>
Subject: [RFC PATCH v2 33/37] KVM: selftests: Make TEST_EXPECT_SIGBUS thread-safe
From: Ackerley Tng <ackerleytng@google.com>
To: kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, x86@kernel.org
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	bp@alien8.de, brauner@kernel.org, chao.p.peng@intel.com, 
	chao.p.peng@linux.intel.com, chenhuacai@kernel.org, corbet@lwn.net, 
	dave.hansen@linux.intel.com, david@kernel.org, hpa@zytor.com, 
	ira.weiny@intel.com, jgg@nvidia.com, jmattson@google.com, jroedel@suse.de, 
	jthoughton@google.com, maobibo@loongson.cn, mathieu.desnoyers@efficios.com, 
	maz@kernel.org, mhiramat@kernel.org, michael.roth@amd.com, mingo@redhat.com, 
	mlevitsk@redhat.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	pbonzini@redhat.com, prsampat@amd.com, qperret@google.com, 
	ricarkol@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	rostedt@goodmis.org, seanjc@google.com, shivankg@amd.com, shuah@kernel.org, 
	steven.price@arm.com, tabba@google.com, tglx@linutronix.de, 
	vannapurve@google.com, vbabka@suse.cz, willy@infradead.org, wyihan@google.com, 
	yan.y.zhao@intel.com, Ackerley Tng <ackerleytng@google.com>
Content-Type: text/plain; charset="UTF-8"

The TEST_EXPECT_SIGBUS macro is not thread-safe as it uses a global
sigjmp_buf and installs a global SIGBUS signal handler. If multiple threads
execute the macro concurrently, they will race on installing the signal
handler and stomp on other threads' jump buffers, leading to incorrect test
behavior.

Make TEST_EXPECT_SIGBUS thread-safe with the following changes:

Share the KVM tests' global signal handler. sigaction() applies to all
threads; without sharing a global signal handler, one thread may have
removed the signal handler that another thread added, hence leading to
unexpected signals.

The alternative of layering signal handlers was considered, but calling
sigaction() within TEST_EXPECT_SIGBUS() necessarily creates a race. To
avoid adding new setup and teardown routines to do sigaction() and keep
usage of TEST_EXPECT_SIGBUS() simple, share the KVM tests' global signal
handler.

Opportunistically rename report_unexpected_signal to
catchall_signal_handler.

To continue to only expect SIGBUS within specific regions of code, use a
thread-specific variable, expecting_sigbus, to replace installing and
removing signal handlers.

Make the execution environment for the thread, sigjmp_buf, a
thread-specific variable.

Signed-off-by: Ackerley Tng <ackerleytng@google.com>
---
 .../testing/selftests/kvm/include/test_util.h | 29 +++++++++----------
 tools/testing/selftests/kvm/lib/kvm_util.c    | 18 ++++++++----
 tools/testing/selftests/kvm/lib/test_util.c   |  7 -----
 3 files changed, 26 insertions(+), 28 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/test_util.h b/tools/testing/selftests/kvm/include/test_util.h
index 2871a4292847..0e4e6f7dab8f 100644
--- a/tools/testing/selftests/kvm/include/test_util.h
+++ b/tools/testing/selftests/kvm/include/test_util.h
@@ -80,22 +80,19 @@ do {									\
 	__builtin_unreachable(); \
 } while (0)
 
-extern sigjmp_buf expect_sigbus_jmpbuf;
-void expect_sigbus_handler(int signum);
-
-#define TEST_EXPECT_SIGBUS(action)						\
-do {										\
-	struct sigaction sa_old, sa_new = {					\
-		.sa_handler = expect_sigbus_handler,				\
-	};									\
-										\
-	sigaction(SIGBUS, &sa_new, &sa_old);					\
-	if (sigsetjmp(expect_sigbus_jmpbuf, 1) == 0) {				\
-		action;								\
-		TEST_FAIL("'%s' should have triggered SIGBUS", #action);	\
-	}									\
-	sigaction(SIGBUS, &sa_old, NULL);					\
-} while (0)
+extern __thread sigjmp_buf expect_sigbus_jmpbuf;
+extern __thread bool expecting_sigbus;
+
+#define TEST_EXPECT_SIGBUS(action)                                     \
+	do {                                                           \
+		expecting_sigbus = true;			       \
+		if (sigsetjmp(expect_sigbus_jmpbuf, 1) == 0) {         \
+			action;                                        \
+			TEST_FAIL("'%s' should have triggered SIGBUS", \
+				  #action);                            \
+		}                                                      \
+		expecting_sigbus = false;			       \
+	} while (0)
 
 size_t parse_size(const char *size);
 
diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index aec7b24418ab..18ced8bdde36 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -2314,13 +2314,20 @@ __weak void kvm_selftest_arch_init(void)
 {
 }
 
-static void report_unexpected_signal(int signum)
+__thread sigjmp_buf expect_sigbus_jmpbuf;
+__thread bool expecting_sigbus;
+
+static void catchall_signal_handler(int signum)
 {
+	switch (signum) {
+	case SIGBUS: {
+		if (expecting_sigbus)
+			siglongjmp(expect_sigbus_jmpbuf, 1);
+
+		TEST_FAIL("Unexpected SIGBUS (%d)\n", signum);
+	}
 #define KVM_CASE_SIGNUM(sig)					\
 	case sig: TEST_FAIL("Unexpected " #sig " (%d)\n", signum)
-
-	switch (signum) {
-	KVM_CASE_SIGNUM(SIGBUS);
 	KVM_CASE_SIGNUM(SIGSEGV);
 	KVM_CASE_SIGNUM(SIGILL);
 	KVM_CASE_SIGNUM(SIGFPE);
@@ -2332,12 +2339,13 @@ static void report_unexpected_signal(int signum)
 void __attribute((constructor)) kvm_selftest_init(void)
 {
 	struct sigaction sig_sa = {
-		.sa_handler = report_unexpected_signal,
+		.sa_handler = catchall_signal_handler,
 	};
 
 	/* Tell stdout not to buffer its content. */
 	setbuf(stdout, NULL);
 
+	expecting_sigbus = false;
 	sigaction(SIGBUS, &sig_sa, NULL);
 	sigaction(SIGSEGV, &sig_sa, NULL);
 	sigaction(SIGILL, &sig_sa, NULL);
diff --git a/tools/testing/selftests/kvm/lib/test_util.c b/tools/testing/selftests/kvm/lib/test_util.c
index 8a1848586a85..03eb99af9b8d 100644
--- a/tools/testing/selftests/kvm/lib/test_util.c
+++ b/tools/testing/selftests/kvm/lib/test_util.c
@@ -18,13 +18,6 @@
 
 #include "test_util.h"
 
-sigjmp_buf expect_sigbus_jmpbuf;
-
-void __attribute__((used)) expect_sigbus_handler(int signum)
-{
-	siglongjmp(expect_sigbus_jmpbuf, 1);
-}
-
 /*
  * Random number generator that is usable from guest code. This is the
  * Park-Miller LCG using standard constants.
-- 
2.53.0.rc1.225.gd81095ad13-goog

