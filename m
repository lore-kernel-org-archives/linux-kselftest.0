Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A21884582EF
	for <linux-kselftest@vger.kernel.org>; Sat, 10 Oct 2026 13:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791638846; cv=none; b=RMCMQENto/ZKLKCw7qcNZ913ei8fDkGFodP07rD7PZDWH882l4Di5D4lsoUNbjmsXBmQYdVivDA7jLwmEKagVf9e9kM1FcRqCsQCv0gTsTbJQNOPNHnfIRvXyTJn9rZa9VCxI8jbx+Iy6T+VIbWZRrM0KsDTa44BC/b+IoeJiPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791638846; c=relaxed/simple;
	bh=AZByuRCwVxuo1OqUk43wDcKkWuQ/H405dhd+SVqeJmM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oGj9s226bneLmLkHcNaT2ymzGhJqGT15Vlm2yx5fg45Lbt9n6CPr5zheHC//iaXXSH+OHdqU0tbLCswOeO7YZXfINdFX0Ps+OJl1+fDHxQlbx4dqCaFRzE0+LUSbX/nu+kz2w1Upnk4cxZZOG2bJy3ZyOhsjt8fQ1h+rpUdi7k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F0tOp7WS; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F0tOp7WS"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1698ea378so4879455e9.2
        for <linux-kselftest@vger.kernel.org>; Sat, 10 Oct 2026 06:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791638842; x=1792243642; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=howgOP9h5nUKpogRLZsugGiXSDW33UsJon93r8D0E18=;
        b=F0tOp7WSnGMLBFnTZes+NU/Xpzj6lXzy4G206ui5cGoDA0+7lk1/LgC0fKyd+F+amA
         PN3ZvzFv6W1DIpACQ6uOAeV9Hz2uDvJsw9shF9DV43HHMpRPFrO8LcuwVPoA1NOW+iQ+
         TYvgAKQRSuPx2W9GflPd75ARs/Ys4ftMpQ0u6wd+2+B5XrNx+Q1jR3EAC0y3szkEgovt
         jYz306d69AFkocf33ynbUmlCBHTU4iycCpDoOhx/jwPiV0f/MQJO86sl6BT0wsQY3tIq
         I8U/IsZ9F+oHXX1bOBX0q8cpFpU019GA9OvPMEpClV5UhQClM9umxu+4LJC6JaNPfGVO
         88hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791638842; x=1792243642;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=howgOP9h5nUKpogRLZsugGiXSDW33UsJon93r8D0E18=;
        b=UE5IGwHt7aa//0cuIOCXCCVNvn1jqhN9N4Qkgdn90DDJYp9Tb8FkFtEb5BwfhI9xRf
         I1dALksQBNZ9hkjN8eMBm5t/jzhjxsxdHOiAaxkYyZ6gp+pFcwlRpqoFTva+90JVu3ND
         ZvTRea8Y/Snt9xMCC+DXJYKdvdfQg3hjmqg1zYpGmpbFpZ+VAhwDv3V+0JTIe8MvSMnY
         EBtCI6ingKgb22paKh6J9lMtBtuAthsm84vJpvbrnU4ZKRScWaRc+fIUom7tG7C2EU7B
         K82ytgfyJPs0XysJrFJJplCzs9Erpq4ndpX6jyRk3WruxWRcrB5qm2rxqCq4zc79thP4
         D9Vg==
X-Forwarded-Encrypted: i=1; AKwUvBwbFRoGgbPuC+0XIROnvM3H2SDMqvk+OhBs2g4uRVsn5aT2r14TmfulqlnRwN9cOztY0/Xl+ffOkE/kn7cUx/Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYKjWv4pEkrepnFFtCVYPNDAUxfC9SDb3tqEsrOuc7aIzsYKXR8F
	qTjiWhfqixncti2fijiffG8OCfTKObG2ga7San8hm4eGF4qU+a2OI4Jp
X-Gm-Gg: AYBFou1fCcu+D/+QLdJMpO3QnbU9qJ5vScTjW2qjfIv7eBmo25nfgDydINjPHDlUIgG
	BSHwPPqf8ujLBlLwKemLEaITEB32WHEr2tUQw9pMlu3xDeiOWQJ2Nuc42s4IXYF7uK02mogHmj9
	HN9Y9jswTIrqPpv2Ey52wl98+9+I23ByBv0d0NImvGXYccFU5WTz6M5Jt1ftqMCgYDa4RS5ZVeZ
	WW21azFdBNSuBl3YlDRyWkClsruO/N0Y4ehD1vJdRMR5KytzcmmSQw6EsMC+KCNkOm/UwKRBD36
	sXRmJ/iKcrAuUAG0IxEKcaMc0upqoBim54vokau8TpY+llfCgA981S3YqkHtoh3uglNqxzmJxa2
	2RFxrkSuU1XrYEpJWEgO/EYMXEZuIuXdH2BGJeQ6sxN/me/drR/xG9RnrAhWCnJhWa5MOEGuVSH
	JHaQx8V+/e8Ulfif3aLQQq1jAvjFJoLgcoD7ZtAjmkBWnxuq39RYEBV/yD8dkXXmsg8p89sxA+F
	azC6OcQWt+u35S/i3iQP1OoUPHVLqzD7rbQUWsQirqAsuCOtY6TolT29vWd4luNawLhdidEujB6
	1kDxAVMikPkxTHVBjcgYzEl7O20S0M5MYYnF54ErDPLGG1/6CY1CM7WlkXwS3aRPUhcgBkPMfAo
	=
X-Received: by 2002:a05:600c:c172:b0:4a0:1c0e:b2a8 with SMTP id 5b1f17b1804b1-4a18e4cc2a2mr86751495e9.28.1791638841556;
        Sat, 10 Oct 2026 06:27:21 -0700 (PDT)
Received: from imx93-evk.localdomain (dynamic-2a02-3100-9d3f-0d01-48c7-5d76-0ec6-9dac.310.pool.telefonica.de. [2a02:3100:9d3f:d01:48c7:5d76:ec6:9dac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf21276sm215410405e9.8.2026.10.10.06.27.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 10 Oct 2026 06:27:21 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Changbin Du <changbin.du@intel.com>,
	Shuai Xue <xueshuai@linux.alibaba.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>,
	Rae Moar <raemoar63@gmail.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com
Subject: [PATCH 1/2] riscv: stacktrace: do not report the walker's own frame from arch_stack_walk()
Date: Sat, 10 Oct 2026 15:27:11 +0200
Message-Id: <20261010132712.46931-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

stack_trace_save() uses skipnr + 1 because arch_stack_walk() is expected
to first report the return into stack_trace_save(). With FRAME_POINTER,
the RISC-V arch_stack_walk() calls walk_stackframe(), which starts from
its own frame and first reports the return into arch_stack_walk().
stack_trace_save() therefore starts one frame too early. For example,
page_owner records begin at __set_page_owner() instead of the allocation
site.

Move the walker into an always-inlined helper and call it directly from
arch_stack_walk(). Keep walk_stackframe() as a wrapper for its existing
callers.

return_address() skips level + 3 entries, while the arm64 implementation
skips level + 2. After removing the extra frame, use level + 2 so
ftrace_return_address() and CALLER_ADDR results do not shift by one caller.

Fixes: 6a00ef449370 ("riscv: eliminate unreliable __builtin_frame_address(1)")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Tested with the KUnit suite from patch 2 on QEMU's virt machine, clang 22
(LLVM=1), on af32da41b032:

  mainline                        stack_trace_save 0/3, return_address 2/2
  stacktrace.c change alone       stack_trace_save 3/3, return_address 0/2
  this patch                      stack_trace_save 3/3, return_address 2/2

A BeagleV Ahead (TH1520) booted with this patch passes all five cases.
The stack_trace_save() result on mainline (0/3) was also reproduced with
GCC 15.2 and QEMU 10.2.1.

Without CONFIG_FRAME_POINTER the walker scans the stack for anything that
looks like a text address and its start frame is not exact before or
after this patch. What return_address() returns there is unchanged: the
walk loses one leading entry and the skip count goes down by one.

The reliable unwinder series [1] rewrites this walker and has the correct
start frame for stack_trace_save() as a side effect, but leaves
return_address() at level + 3. This patch conflicts with 5/7 of that
series; if that goes in first, only the return_address.c hunk is needed.

[1] https://lore.kernel.org/r/20260914092648.51254-1-xueshuai@linux.alibaba.com

 arch/riscv/kernel/return_address.c |  2 +-
 arch/riscv/kernel/stacktrace.c     | 40 +++++++++++++++++++++++++++++-----
 2 files changed, 36 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/kernel/return_address.c b/arch/riscv/kernel/return_address.c
index c8115ec8fb30..4da1cfd249d3 100644
--- a/arch/riscv/kernel/return_address.c
+++ b/arch/riscv/kernel/return_address.c
@@ -33,7 +33,7 @@ noinline void *return_address(unsigned int level)
 {
 	struct return_address_data data;
 
-	data.level = level + 3;
+	data.level = level + 2;
 	data.addr = NULL;
 
 	arch_stack_walk(save_return_addr, &data, current, NULL);
diff --git a/arch/riscv/kernel/stacktrace.c b/arch/riscv/kernel/stacktrace.c
index c7555447149b..28c5744889ba 100644
--- a/arch/riscv/kernel/stacktrace.c
+++ b/arch/riscv/kernel/stacktrace.c
@@ -45,8 +45,16 @@ static inline int fp_is_valid(unsigned long fp, unsigned long sp)
 	return !(fp < low || fp > high || fp & 0x07);
 }
 
-void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
-			     bool (*fn)(void *, unsigned long), void *arg)
+/*
+ * Always inlined so that the frame the walk starts from is the caller's own,
+ * and the first entry reported for the current task is the caller's return
+ * address.  arch_stack_walk() relies on that to report the same frames as
+ * the other architectures, see the comment there.
+ */
+static __always_inline void __walk_stackframe(struct task_struct *task,
+					      struct pt_regs *regs,
+					      bool (*fn)(void *, unsigned long),
+					      void *arg)
 {
 	unsigned long fp, sp, pc;
 	int graph_idx = 0;
@@ -59,6 +67,7 @@ void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
 	} else if (task == NULL || task == current) {
 		fp = (unsigned long)__builtin_frame_address(0);
 		sp = current_stack_pointer;
+		/* Placeholder for the frame the walk starts from, never reported. */
 		pc = (unsigned long)walk_stackframe;
 		level = -1;
 	} else {
@@ -102,10 +111,18 @@ void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
 	}
 }
 
+void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
+			     bool (*fn)(void *, unsigned long), void *arg)
+{
+	__walk_stackframe(task, regs, fn, arg);
+}
+
 #else /* !CONFIG_FRAME_POINTER */
 
-void notrace walk_stackframe(struct task_struct *task,
-	struct pt_regs *regs, bool (*fn)(void *, unsigned long), void *arg)
+static __always_inline void __walk_stackframe(struct task_struct *task,
+					      struct pt_regs *regs,
+					      bool (*fn)(void *, unsigned long),
+					      void *arg)
 {
 	unsigned long sp, pc;
 	unsigned long *ksp;
@@ -133,6 +150,12 @@ void notrace walk_stackframe(struct task_struct *task,
 	}
 }
 
+void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
+			     bool (*fn)(void *, unsigned long), void *arg)
+{
+	__walk_stackframe(task, regs, fn, arg);
+}
+
 #endif /* CONFIG_FRAME_POINTER */
 
 static bool print_trace_address(void *arg, unsigned long pc)
@@ -176,10 +199,17 @@ unsigned long __get_wchan(struct task_struct *task)
 	return pc;
 }
 
+/*
+ * The generic code expects the first entry for the current task to be the
+ * return address of arch_stack_walk() itself, the way x86 and arm64 report
+ * it, and stack_trace_save() sizes its skip count accordingly.  Walking from
+ * inside a called walk_stackframe() adds that function's own frame on top,
+ * so inline the walker here and start from this frame instead.
+ */
 noinline noinstr void arch_stack_walk(stack_trace_consume_fn consume_entry, void *cookie,
 		     struct task_struct *task, struct pt_regs *regs)
 {
-	walk_stackframe(task, regs, consume_entry, cookie);
+	__walk_stackframe(task, regs, consume_entry, cookie);
 }
 
 /*
