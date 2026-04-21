Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 831103D47B8;
	Tue, 21 Apr 2026 14:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776782601; cv=none; b=FcTiPRZar4WjCAuTGdzY1U6lPduOk6wF5ZOxVQqAWOpCb3AYyeMG0LxSp6qMRY1sO/Zr9obh7DE76T447uKJaqyXzRaQs0vc5K9QhCWfpgjZC+Upa9csMqPPLKsbeYEdzPXnjBNNMs2324KpYKc7SscHgc98J4z/NKIuw95lr3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776782601; c=relaxed/simple;
	bh=MxsGc+EBx86vViVnJi5hkAtx/3njsI58R9adW1EOEhM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TJLXVlPs+kT0M/QqWVnEzeGF5sB8qzWFvQjGWRTHpINjTvOlfu+Om/vacxSiScrHCHVAkL1aKyWdrDlCBv/8FliV7avcljMgcjRo7ghNB97jbIPN1N811FXSX15qfVTkgyIaahZVGMrW3VT5oyAZfz0OQNTobpfaOvFT26e915U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=FwSQrg72; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="FwSQrg72"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5AC53302C;
	Tue, 21 Apr 2026 07:43:13 -0700 (PDT)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8AE743FAF5;
	Tue, 21 Apr 2026 07:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776782598; bh=MxsGc+EBx86vViVnJi5hkAtx/3njsI58R9adW1EOEhM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FwSQrg72snbYiBgDHmR8iZL9vVLCGskUN9cWjinaurZnVDh0UizatL9rkSSH27eV8
	 yih9/Yypu4gmi6fXvdG3q75fJfAGZf1njQ+YQ/IT7k4I9bVTl8KuQwjpIMiUltfAaQ
	 gOD2ycw3G9mTXWspT0VKRXLH0VvN53JrI17rOPP8=
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Will Deacon <will@kernel.org>,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 1/4] arm64: signal: Preserve POR_EL0 if poe_context is missing
Date: Tue, 21 Apr 2026 15:42:49 +0100
Message-ID: <20260421144252.1440365-2-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260421144252.1440365-1-kevin.brodsky@arm.com>
References: <20260421144252.1440365-1-kevin.brodsky@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 2e8a1acea859 ("arm64: signal: Improve POR_EL0 handling to
avoid uaccess failures") delayed the write to POR_EL0 in
rt_sigreturn to avoid spurious uaccess failures. This change however
relies on the poe_context frame record being present: on a system
supporting POE, calling sigreturn without a poe_context record now
results in writing arbitrary data from the kernel stack into POR_EL0.

Fix this by adding a valid_fields member to struct
user_access_state, and zeroing the struct on allocation.
restore_poe_context() then indicates that the por_el0 field is valid
by setting the corresponding bit in valid_fields, and
restore_user_access_state() only touches POR_EL0 if there is a valid
value to set it to. This is in line with how POR_EL0 was originally
handled; all frame records are currently optional, except
fpsimd_context.

restore_user_access_state() is also called if setting up the signal
frame fails, so we also initialise valid_fields in that case. For
consistency, setup_sigframe() now also checks valid_fields to decide
whether to write a poe_context record, avoiding another call to
system_supports_poe().

Fixes: 2e8a1acea859 ("arm64: signal: Improve POR_EL0 handling to avoid uaccess failures")
Reported-by: Will Deacon <will@kernel.org>
Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 arch/arm64/kernel/signal.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kernel/signal.c b/arch/arm64/kernel/signal.c
index 08ffc5a5aea4..3f17aed5b4f0 100644
--- a/arch/arm64/kernel/signal.c
+++ b/arch/arm64/kernel/signal.c
@@ -67,6 +67,8 @@ struct rt_sigframe_user_layout {
 	unsigned long end_offset;
 };
 
+#define UA_STATE_HAS_POR_EL0	BIT(0)
+
 /*
  * Holds any EL0-controlled state that influences unprivileged memory accesses.
  * This includes both accesses done in userspace and uaccess done in the kernel.
@@ -74,8 +76,12 @@ struct rt_sigframe_user_layout {
  * This state needs to be carefully managed to ensure that it doesn't cause
  * uaccess to fail when setting up the signal frame, and the signal handler
  * itself also expects a well-defined state when entered.
+ *
+ * The valid_fields member is a bitfield (see UA_STATE_HAS_*), specifying which
+ * of the remaining fields is valid (has been set to a value).
  */
 struct user_access_state {
+	unsigned int valid_fields;
 	u64 por_el0;
 };
 
@@ -95,6 +101,7 @@ static void save_reset_user_access_state(struct user_access_state *ua_state)
 			por_enable_all |= POR_ELx_PERM_PREP(pkey, POE_RWX);
 
 		ua_state->por_el0 = read_sysreg_s(SYS_POR_EL0);
+		ua_state->valid_fields |= UA_STATE_HAS_POR_EL0;
 		write_sysreg_s(por_enable_all, SYS_POR_EL0);
 		/*
 		 * No ISB required as we can tolerate spurious Overlay faults -
@@ -122,7 +129,7 @@ static void set_handler_user_access_state(void)
  */
 static void restore_user_access_state(const struct user_access_state *ua_state)
 {
-	if (system_supports_poe())
+	if (ua_state->valid_fields & UA_STATE_HAS_POR_EL0)
 		write_sysreg_s(ua_state->por_el0, SYS_POR_EL0);
 }
 
@@ -352,8 +359,10 @@ static int restore_poe_context(struct user_ctxs *user,
 		return -EINVAL;
 
 	__get_user_error(por_el0, &(user->poe->por_el0), err);
-	if (!err)
+	if (!err) {
 		ua_state->por_el0 = por_el0;
+		ua_state->valid_fields |= UA_STATE_HAS_POR_EL0;
+	}
 
 	return err;
 }
@@ -1095,7 +1104,7 @@ SYSCALL_DEFINE0(rt_sigreturn)
 {
 	struct pt_regs *regs = current_pt_regs();
 	struct rt_sigframe __user *frame;
-	struct user_access_state ua_state;
+	struct user_access_state ua_state = {0};
 
 	/* Always make any pending restarted system calls return -EINTR */
 	current->restart_block.fn = do_no_restart_syscall;
@@ -1302,7 +1311,7 @@ static int setup_sigframe(struct rt_sigframe_user_layout *user,
 		err |= preserve_fpmr_context(fpmr_ctx);
 	}
 
-	if (system_supports_poe() && err == 0) {
+	if ((ua_state->valid_fields & UA_STATE_HAS_POR_EL0) && err == 0) {
 		struct poe_context __user *poe_ctx =
 			apply_user_offset(user, user->poe_offset);
 
@@ -1507,7 +1516,7 @@ static int setup_rt_frame(int usig, struct ksignal *ksig, sigset_t *set,
 {
 	struct rt_sigframe_user_layout user;
 	struct rt_sigframe __user *frame;
-	struct user_access_state ua_state;
+	struct user_access_state ua_state = {0};
 	int err = 0;
 
 	fpsimd_save_and_flush_current_state();
-- 
2.51.2

