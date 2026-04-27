Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5674937B413;
	Mon, 27 Apr 2026 12:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777291444; cv=none; b=jRlQmPkefJNVUHUjBaAduQH7cTm2B09z3bl9Cp4nb4NMyvPiBm1Xp/1PFCt0dmIIrSJbl2/EFBvH5L6QN/STx70iREH6e7d/H73FhH0Du8Aac7MzjnNgKAJQqHpB5otHdaQVRb3TWSsFyixbyq/cXPA2dj6ligekqfttX1Ww+hU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777291444; c=relaxed/simple;
	bh=slrafw9MOFyBo/v8zwX3peiajbdJyOH74VvtDwDB9UQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CFks1C1jLzN7a1belVCjOdcI+qivI81GYywjkLwzvgL1cMeuVZNDH9OZeUg9u6idDveOnkEMeSV98S40CRrZFoAYalA9XFFEP4EKPRYRNYtAbPl5uy8GVX7C5OXJ3EJeBQfWLx1l2OgN0fnsKnIzKL8srEbvXTNLQ8nqMSlELko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=vxg2AMkE; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="vxg2AMkE"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 360C91FC7;
	Mon, 27 Apr 2026 05:03:56 -0700 (PDT)
Received: from localhost.localdomain (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 177223F62B;
	Mon, 27 Apr 2026 05:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777291441; bh=slrafw9MOFyBo/v8zwX3peiajbdJyOH74VvtDwDB9UQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=vxg2AMkEnOQuZ6mDO6cV3q3P+xPWKKgasAMEAyIb23+H/+HglfDlScLV73Cp5qVaD
	 Nyg1f0E/85GwcF2+uUWgldgKYrq9DOcI1gg40nhD3hcgHWReH/d20w7e8SiUQyk/k3
	 Fuyna3CGcPTJzFlnulf41IrAk0CI+0/cZriDXirA=
From: Kevin Brodsky <kevin.brodsky@arm.com>
Date: Mon, 27 Apr 2026 13:03:33 +0100
Subject: [PATCH v2 1/5] arm64: signal: Preserve POR_EL0 if poe_context is
 missing
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-poe_signal-v2-1-2bd9d6f16ab4@arm.com>
References: <20260427-poe_signal-v2-0-2bd9d6f16ab4@arm.com>
In-Reply-To: <20260427-poe_signal-v2-0-2bd9d6f16ab4@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Kevin Brodsky <kevin.brodsky@arm.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 "David Hildenbrand (Arm)" <david@kernel.org>, 
 Joey Gouly <joey.gouly@arm.com>, Mark Brown <broonie@kernel.org>, 
 Shuah Khan <shuah@kernel.org>, Will Deacon <will@kernel.org>, 
 linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777291437; l=5608;
 i=kevin.brodsky@arm.com; s=20260427; h=from:subject:message-id;
 bh=slrafw9MOFyBo/v8zwX3peiajbdJyOH74VvtDwDB9UQ=;
 b=MVsLaSQUtzBk2Ysh4JQTsUjt2XFmOZOJwMNMNpWEaLRYmDd/XLhfcN+XZK55TQq7hob0Tic8i
 xh0wf54gogVBQSsnRVBsRaTMZDoZe+ks2YKFfERfHz6ssnWNIe2zmFS
X-Developer-Key: i=kevin.brodsky@arm.com; a=ed25519;
 pk=N2QG+eJKrvkNovwhhwJhnJ4+ScVfsGCHldmqLfcMTFs=

Commit 2e8a1acea859 ("arm64: signal: Improve POR_EL0 handling to
avoid uaccess failures") delayed the write to POR_EL0 in
rt_sigreturn to avoid spurious uaccess failures. This change however
relies on the poe_context frame record being present: on a system
supporting POE, calling sigreturn without a poe_context record now
results in writing arbitrary data from the kernel stack into POR_EL0.

Fix this by adding a __valid_fields member to struct
user_access_state, and zeroing the struct on allocation.
restore_poe_context() then indicates that the por_el0 field is valid
by setting the corresponding bit in __valid_fields, and
restore_user_access_state() only touches POR_EL0 if there is a valid
value to set it to. This is in line with how POR_EL0 was originally
handled; all frame records are currently optional, except
fpsimd_context.

To ensure that __valid_fields is kept in sync, fields (currently
just por_el0) are now accessed via accessors and prefixed with __ to
discourage direct access.

Fixes: 2e8a1acea859 ("arm64: signal: Improve POR_EL0 handling to avoid uaccess failures")
Reported-by: Will Deacon <will@kernel.org>
Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 arch/arm64/kernel/signal.c | 54 ++++++++++++++++++++++++++++++++++++----------
 1 file changed, 43 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/kernel/signal.c b/arch/arm64/kernel/signal.c
index 08ffc5a5aea4..38e6fa204c17 100644
--- a/arch/arm64/kernel/signal.c
+++ b/arch/arm64/kernel/signal.c
@@ -67,6 +67,9 @@ struct rt_sigframe_user_layout {
 	unsigned long end_offset;
 };
 
+#define TERMINATOR_SIZE round_up(sizeof(struct _aarch64_ctx), 16)
+#define EXTRA_CONTEXT_SIZE round_up(sizeof(struct extra_context), 16)
+
 /*
  * Holds any EL0-controlled state that influences unprivileged memory accesses.
  * This includes both accesses done in userspace and uaccess done in the kernel.
@@ -74,13 +77,35 @@ struct rt_sigframe_user_layout {
  * This state needs to be carefully managed to ensure that it doesn't cause
  * uaccess to fail when setting up the signal frame, and the signal handler
  * itself also expects a well-defined state when entered.
+ *
+ * The struct should be zero-initialised. Its members should only be accessed
+ * via the accessors below. __valid_fields tracks which of the fields are valid
+ * (have been set to some value).
  */
 struct user_access_state {
-	u64 por_el0;
+	unsigned int __valid_fields;
+	u64 __por_el0;
 };
 
-#define TERMINATOR_SIZE round_up(sizeof(struct _aarch64_ctx), 16)
-#define EXTRA_CONTEXT_SIZE round_up(sizeof(struct extra_context), 16)
+#define UA_STATE_HAS_POR_EL0	BIT(0)
+
+static void set_ua_state_por_el0(struct user_access_state *ua_state,
+				 u64 por_el0)
+{
+	ua_state->__por_el0 = por_el0;
+	ua_state->__valid_fields |= UA_STATE_HAS_POR_EL0;
+}
+
+static int get_ua_state_por_el0(const struct user_access_state *ua_state,
+				u64 *por_el0)
+{
+	if (ua_state->__valid_fields & UA_STATE_HAS_POR_EL0) {
+		*por_el0 = ua_state->__por_el0;
+		return 0;
+	}
+
+	return -ENOENT;
+}
 
 /*
  * Save the user access state into ua_state and reset it to disable any
@@ -94,7 +119,7 @@ static void save_reset_user_access_state(struct user_access_state *ua_state)
 		for (int pkey = 0; pkey < arch_max_pkey(); pkey++)
 			por_enable_all |= POR_ELx_PERM_PREP(pkey, POE_RWX);
 
-		ua_state->por_el0 = read_sysreg_s(SYS_POR_EL0);
+		set_ua_state_por_el0(ua_state, read_sysreg_s(SYS_POR_EL0));
 		write_sysreg_s(por_enable_all, SYS_POR_EL0);
 		/*
 		 * No ISB required as we can tolerate spurious Overlay faults -
@@ -122,8 +147,10 @@ static void set_handler_user_access_state(void)
  */
 static void restore_user_access_state(const struct user_access_state *ua_state)
 {
-	if (system_supports_poe())
-		write_sysreg_s(ua_state->por_el0, SYS_POR_EL0);
+	u64 por_el0;
+
+	if (get_ua_state_por_el0(ua_state, &por_el0) == 0)
+		write_sysreg_s(por_el0, SYS_POR_EL0);
 }
 
 static void init_user_layout(struct rt_sigframe_user_layout *user)
@@ -333,11 +360,16 @@ static int restore_fpmr_context(struct user_ctxs *user)
 static int preserve_poe_context(struct poe_context __user *ctx,
 				const struct user_access_state *ua_state)
 {
-	int err = 0;
+	int err;
+	u64 por_el0;
+
+	err = get_ua_state_por_el0(ua_state, &por_el0);
+	if (WARN_ON_ONCE(err))
+		return err;
 
 	__put_user_error(POE_MAGIC, &ctx->head.magic, err);
 	__put_user_error(sizeof(*ctx), &ctx->head.size, err);
-	__put_user_error(ua_state->por_el0, &ctx->por_el0, err);
+	__put_user_error(por_el0, &ctx->por_el0, err);
 
 	return err;
 }
@@ -353,7 +385,7 @@ static int restore_poe_context(struct user_ctxs *user,
 
 	__get_user_error(por_el0, &(user->poe->por_el0), err);
 	if (!err)
-		ua_state->por_el0 = por_el0;
+		set_ua_state_por_el0(ua_state, por_el0);
 
 	return err;
 }
@@ -1095,7 +1127,7 @@ SYSCALL_DEFINE0(rt_sigreturn)
 {
 	struct pt_regs *regs = current_pt_regs();
 	struct rt_sigframe __user *frame;
-	struct user_access_state ua_state;
+	struct user_access_state ua_state = {};
 
 	/* Always make any pending restarted system calls return -EINTR */
 	current->restart_block.fn = do_no_restart_syscall;
@@ -1507,7 +1539,7 @@ static int setup_rt_frame(int usig, struct ksignal *ksig, sigset_t *set,
 {
 	struct rt_sigframe_user_layout user;
 	struct rt_sigframe __user *frame;
-	struct user_access_state ua_state;
+	struct user_access_state ua_state = {};
 	int err = 0;
 
 	fpsimd_save_and_flush_current_state();

-- 
2.51.2

