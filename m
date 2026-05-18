Received: from mail-108-mta124.mxroute.com (mail-108-mta124.mxroute.com [136.175.108.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A72FF31196F
	for <linux-kselftest@vger.kernel.org>; Mon, 18 May 2026 18:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779129928; cv=none; b=rgLgM5BFjLWiXYBqiEmiFZdEBc418e0Zoff5nO7GB3gFJ0IspD7qL9+WQ532x3r5H9QmiKfG8o+VuxroYPfbnG+EWUglvPTsGyzf+ntZCpcYFKXlieHGzJqPyT1rKIkCTiljcb8hLrjksC2Ltqc/f6MP7kLvuHxNxNNbnWad6pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779129928; c=relaxed/simple;
	bh=42TfcMNnmV26s1UbjHYRxQb3o2AReRZYTCKI+U+diRI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i7++/SVAufxoY5Zh0xIx2tHLOXJKE1BPMzu/sa3fesg4kOo9HxR4UO1sbsnSvPpcsjADr3U+uEMnq40tL3ogFs8lkPug31jTPiECbHSy4hVxwHSVwWV1qtsTvKIKDqVwoxi7mNT9yE+TFhoLG6G9eCE/pe50B4EPeu41IL5RPJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wii.dev; spf=pass smtp.mailfrom=wii.dev; dkim=pass (2048-bit key) header.d=wii.dev header.i=@wii.dev header.b=JLKavkVW; arc=none smtp.client-ip=136.175.108.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wii.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wii.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wii.dev header.i=@wii.dev header.b="JLKavkVW"
Received: from filter006.mxroute.com ([136.175.111.3] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta124.mxroute.com (ZoneMTA) with ESMTPSA id 19e3c63705800067f7.00b
 for <linux-kselftest@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 18 May 2026 18:40:10 +0000
X-Zone-Loop: 28fc1a6959b45d8bdd6cc021ce78c896cfb72f658614
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=wii.dev;
	s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:
	From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
	List-Owner:List-Archive; bh=Gc6e4om4uJVepREiLY2m7U5l7KL9JaLr6L1SAM/U0bo=; b=J
	LKavkVWGOQ2OxnYcJqJDo+8ezNJq2vKesRKQU0figJfKVtjLucvm2qO9KfKaP7441iz/VQmITI7GA
	T0mBHgQcaQWMCIi6tREoKeSiRtNP1UWlAMRqsRtNZAaAlygyBHExRv0U/peiDhAcPs7cGbw4ZabTL
	CRW3uLYn4+YvZmQxva9RfBAKNE7NweT6IBz2X/IsJmRqdHcLGbz4CEtqO4Kq3J2jFoh3o/htSeuOS
	EPK7Ktxy0wHfwFnVqGKggj6wKHfL/uR9JcMLPvh7CRcPqZsWQYoIp3QzI1B+KXGXMIbn1d4yqtJmU
	MOaRfJZ9VozvQyOsGouc+c908pqZQOwJw==;
From: Richard Patel <ripatel@wii.dev>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Deepak Gupta <debug@rivosinc.com>,
	Zong Li <zong.li@sifive.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Richard Patel <ripatel@wii.dev>
Subject: [PATCH] riscv: cfi: reject unknown flags in PR_SET_CFI
Date: Mon, 18 May 2026 18:39:18 +0000
Message-ID: <20260518183918.322545-1-ripatel@wii.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Id: ripatel@wii.dev

prctl(PR_SET_CFI,PR_CFI_BRANCH_LANDING_PADS) silently ignored
unknown control values. Only PR_CFI_{ENABLE,DISABLE,LOCK} should
be permitted.

This is a uABI breaking change (fails previously accepted bits
with EINVAL).

Fixes: 08ee1559052b ("prctl: cfi: change the branch landing pad prctl()s to be more descriptive")
Signed-off-by: Richard Patel <ripatel@wii.dev>
---
 arch/riscv/include/asm/usercfi.h             | 1 +
 arch/riscv/kernel/usercfi.c                  | 3 +++
 tools/testing/selftests/riscv/cfi/cfitests.c | 6 ++++++
 3 files changed, 10 insertions(+)

diff --git a/arch/riscv/include/asm/usercfi.h b/arch/riscv/include/asm/usercfi.h
index f56966edbf5c..61ee02cee297 100644
--- a/arch/riscv/include/asm/usercfi.h
+++ b/arch/riscv/include/asm/usercfi.h
@@ -50,6 +50,7 @@ void set_indir_lp_status(struct task_struct *task, bool enable);
 void set_indir_lp_lock(struct task_struct *task, bool lock);
 
 #define PR_SHADOW_STACK_SUPPORTED_STATUS_MASK (PR_SHADOW_STACK_ENABLE)
+#define PR_CFI_SUPPORTED_STATUS_MASK (PR_CFI_ENABLE | PR_CFI_DISABLE | PR_CFI_LOCK)
 
 #else
 
diff --git a/arch/riscv/kernel/usercfi.c b/arch/riscv/kernel/usercfi.c
index cbfb4e495e9f..5a7113d69bad 100644
--- a/arch/riscv/kernel/usercfi.c
+++ b/arch/riscv/kernel/usercfi.c
@@ -467,6 +467,9 @@ int arch_prctl_set_branch_landing_pad_state(struct task_struct *t, unsigned long
 	if (!is_user_lpad_enabled())
 		return -EINVAL;
 
+	if (state & ~PR_CFI_SUPPORTED_STATUS_MASK)
+		return -EINVAL;
+
 	/* indirect branch tracking is locked and further can't be modified by user */
 	if (is_indir_lp_locked(t))
 		return -EINVAL;
diff --git a/tools/testing/selftests/riscv/cfi/cfitests.c b/tools/testing/selftests/riscv/cfi/cfitests.c
index 39d097b6881f..0e3943461e7d 100644
--- a/tools/testing/selftests/riscv/cfi/cfitests.c
+++ b/tools/testing/selftests/riscv/cfi/cfitests.c
@@ -141,6 +141,12 @@ int main(int argc, char *argv[])
 
 	ksft_print_msg("Starting risc-v tests\n");
 
+	/* Test unknown PR_CFI bits */
+	ret = my_syscall5(__NR_prctl, PR_SET_CFI, PR_CFI_BRANCH_LANDING_PADS,
+			  PR_CFI_ENABLE | 0xffff0, 0, 0);
+	if (!ret)
+		ksft_exit_fail_msg("PR_SET_CFI accepted reserved branch landing pad bits\n");
+
 	/*
 	 * Landing pad test. Not a lot of kernel changes to support landing
 	 * pads for user mode except lighting up a bit in senvcfg via a prctl.
-- 
2.47.3

