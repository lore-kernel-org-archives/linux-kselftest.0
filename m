Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E196536F8EA
	for <linux-kselftest@vger.kernel.org>; Sun, 21 Jun 2026 14:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782053004; cv=none; b=YnR7Z2tmefds5ilRRGSoVfib1PEe7hJwyXGw/ONfXpzWejgLWgOb2XDjJ9pKc1m2GnsSOnylSeVLYWWQZxvwSvIkp9wwNTbBdGap3R9oz0Oy2UefTK9RdCiuOtkEHNeCiQDKRSMeP6X2JeCTLP88tcLkv656R3xvREgJwEM52w4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782053004; c=relaxed/simple;
	bh=LuZmuPo7NBI49qfo5dqm9dDda3AwTNdLDnJ+voAMLbo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A9znQ/eKyDngxTq5XN5aljQx/kaQw22JTK/7yHBOsgMTYTfHVtz+LBPLLfMQkxxoAWj5yFwDOSPDajUCkrO8yHRJm/Xm24T8eO6ev00H5CIjdgHh9Do1b7ILYl4+PNETW1Yce8qVKWysbyTRhCj+fEI18B7DpcTx+S36yKC27tU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f33McxTw; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f33McxTw"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-84237c55ef9so2045725b3a.0
        for <linux-kselftest@vger.kernel.org>; Sun, 21 Jun 2026 07:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782053002; x=1782657802; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GNsH4BL2x48/RDSlyC16c618fm7E62DwUpEzysGk8xY=;
        b=f33McxTw2X556JPGTtT7uSrLeOmeX+99wZ7eTzR3sKnU3cZjClY/exb+TqmtJsMNoP
         58GDAAMX3fll32q+DMxNf/EDQQ7RE7jAsSrt3I+O/D34AuGTA81hDzpsXuQyrI3azSu1
         RN6V+W5EC1tZfGz+TTZ/irHmyMITYev0Wmy7/zMESBD/mOAWI55PsBdDZ2jKgC7eKKL2
         LA8gmNDuoYVdHKCI9gfKAnUtR5rm87pTUaNoXQCS9wm1vdWI5IjIcSL0MpH2AlO9YKxB
         w+uX29pE/vkpzEblbSydjsJlb92sCXudVVwD77xrHXPEwBRxO7kzLKco+Yw4QwWctN//
         Ky9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782053002; x=1782657802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GNsH4BL2x48/RDSlyC16c618fm7E62DwUpEzysGk8xY=;
        b=Qt8dEOMTY4n1eQzf5CoyqiXKl6EVYpjk2Ke+d9PaIJqivhPayIhHAcvZPU86zwQPsI
         aS9FLAp911/z8GloeJtsUmhnEKJE0l2cUnAKOw3G3Pbp27LdKKmE7Hmh4Ldz8J4Z17wh
         Uy7y5KqYn7Omln+XJoraYfuQ4DyEPiCc6eZtBC+U1buXhpnkYaXBB+5k9Dx3ly1lu/1N
         Z66Uur9g171dyQVbsp/fcoVET7kbw36XpPDt9CG4eBoAWFsE6AmxLtOumhf8QynmCPkx
         WB6iyELhVZ/QhqBxeKJZ1hTdY/dQBuAvgz8iFredC3B4uKv99gvDiWzmpDLx7yaW/GjW
         bp2w==
X-Forwarded-Encrypted: i=1; AFNElJ+RygHYQfgpqS87u9WQt35Fnw686oMHmNYwWMFpBMie3tKg7FjbTSaOh/oUunXxl9Lw6r2NwAnSEUMLxdA9K04=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUxIc4/xRoF3qH2wOqhmieHBxSYSs4apY9ErOong8gqmXveEBl
	kqg4ANpwMbn6t4bNt4mhW7yAZ0K+oZ6JdN49xUkp75P8raFOVr9x5cN5
X-Gm-Gg: AfdE7clXTDsh0Op24iThqxWmQMwsJruCdIiHy/B2TQjeZNQFMUHxAibGSGO2BbAHuL3
	7pfKdoTXJ4UeZoXZIBuoRygQAdIuszRqKpFY3OzAj+4PxfYQJ1ZoTP7wX04MHHqWO0JWThhzwLK
	9blr7xGDwtgz1DnV9fOAXuA+p28cEXvs4+iPaEHD3AnY6FKK5T1zo5fAXzQiBvveBIKoPgzmsJF
	u317fd3fMMee2YMyu2Ie2EFHdWoEtHMStMWJhKQ1mMyXnPPCJNrQQ26XFe9CfFahIh1YGDgi6TO
	ArDerx0biu7b6mreH4lydrVK1YnLS9hw+xlm5TUnACOlILDX0w2GN0/f1+6f/arHF9zTCoA0NPI
	dWWKUWug/931XGHqTTLh9hH6E0IQGG291BtOmXVIY96Fcn0L5P3wsqwq6L+YxcZ/XQQxvM5Cz1L
	xNxaol37qPD6WOUFvDaNmuO9TyoBuB
X-Received: by 2002:a05:6a00:993:b0:845:44c7:5e1a with SMTP id d2e1a72fcca58-845561140c0mr10722477b3a.25.1782053002122;
        Sun, 21 Jun 2026 07:43:22 -0700 (PDT)
Received: from computer ([2a09:bac5:3b4a:8aa::dd:17])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564e7687csm4963254b3a.35.2026.06.21.07.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 07:43:20 -0700 (PDT)
From: Varun R Mallya <varunrmallya@gmail.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	bjorn@kernel.org
Cc: alex@ghiti.fr,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	pulehui@huawei.com,
	puranjay@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	varunrmallya@gmail.com
Subject: [PATCH bpf-next 1/3] riscv: stacktrace: Implement arch_bpf_stack_walk() for BPF
Date: Sun, 21 Jun 2026 20:12:57 +0530
Message-ID: <20260621144259.288135-2-varunrmallya@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260621144259.288135-1-varunrmallya@gmail.com>
References: <20260621144259.288135-1-varunrmallya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This will be used by bpf_throw() to unwind till the program marked as
exception boundary and run the callback with the stack of the main
program.
This is required for supporting BPF exceptions on RISC-V.
This depends on the frame pointer unwinder, so it is only built under
CONFIG_FRAME_POINTER, else falls back to the weak no-op.

Signed-off-by: Varun R Mallya <varunrmallya@gmail.com>
---
 arch/riscv/kernel/stacktrace.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/riscv/kernel/stacktrace.c b/arch/riscv/kernel/stacktrace.c
index b41b6255751c..a4c2411f4038 100644
--- a/arch/riscv/kernel/stacktrace.c
+++ b/arch/riscv/kernel/stacktrace.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/export.h>
+#include <linux/filter.h>
 #include <linux/kallsyms.h>
 #include <linux/sched.h>
 #include <linux/sched/debug.h>
@@ -102,6 +103,33 @@ void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
 	}
 }
 
+void notrace arch_bpf_stack_walk(bool (*consume_fn)(void *cookie, u64 ip, u64 sp, u64 bp),
+				 void *cookie)
+{
+	unsigned long fp, sp, pc;
+
+	fp = (unsigned long)__builtin_frame_address(0);
+	sp = current_stack_pointer;
+	pc = (unsigned long)arch_bpf_stack_walk;
+
+	for (;;) {
+		struct stackframe *frame;
+
+		if (unlikely(!__kernel_text_address(pc)))
+			break;
+		/* pc belongs to the function whose frame pointer is fp */
+		if (!consume_fn(cookie, pc, sp, fp))
+			break;
+		if (unlikely(!fp_is_valid(fp, sp)))
+			break;
+
+		frame = (struct stackframe *)fp - 1;
+		sp = fp;
+		fp = READ_ONCE_TASK_STACK(current, frame->fp);
+		pc = READ_ONCE_TASK_STACK(current, frame->ra);
+	}
+}
+
 #else /* !CONFIG_FRAME_POINTER */
 
 void notrace walk_stackframe(struct task_struct *task,
-- 
2.54.0

