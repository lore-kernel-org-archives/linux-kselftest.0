Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 506C6494A14;
	Tue, 14 Jul 2026 15:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784044098; cv=none; b=l71F1yMxBlcKl1mQrB84qAORVBqduxdJu5NAihMkdhc+yYftjT+ca62XTrAhZYLVvH2bz1IRtUEe+vneMrV5N06zaa3tmASfWSoqkVJTesNyHBCYmXkdHmiiwMPNOLdYUCn8xA/ce8UbgqgQo1MdukjGFN9gKGxmvA+snItZ5j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784044098; c=relaxed/simple;
	bh=AiaPVYwyyN7ONJ0y8wfnHDlaVFMqonq/XsnQGNf6ZJ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HRhgVFO5EwFDiHRkCJ4QlYw97SL31LWkHHsUGu/nPng4MNAxiHH0MwH/ThLtnBj3+5d73AzZ4YK64vvj8DIrAHuLuZQ7kf5teoUAkO4V1qEXlgcUHP1Lz9b/FiUY/Jnzb5/2kyrIAvc+zryc0p5vybuqISdBt08sbh/gQ7fHTE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=dvZqzeNL; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="dvZqzeNL"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D12D01477;
	Tue, 14 Jul 2026 08:48:08 -0700 (PDT)
Received: from fedora (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6BF583FBB1;
	Tue, 14 Jul 2026 08:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784044093; bh=AiaPVYwyyN7ONJ0y8wfnHDlaVFMqonq/XsnQGNf6ZJ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dvZqzeNLPKEfdzv8EnOaSpzjeujtphTEaptqYk87kQ72nZ6dYV7CEhw1BR8r0RnGL
	 FnSwM/EBRaojOwTF1UlVA045X1M64cy0c+YIz1i0cb7qmfoSUGI9DkHKIKH4y/FJLA
	 T/5xCWJI5VnoDTFnbzVqfhEsIu81lbKqtZOnghAE=
From: Bill Roberts <bill.roberts@arm.com>
To: "H. Peter Anvin" <hpa@zytor.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Bill Roberts <bill.roberts@arm.com>
Subject: [PATCH 1/2] x86/shstk: support via prctl
Date: Tue, 14 Jul 2026 10:47:39 -0500
Message-ID: <20260714154740.140431-2-bill.roberts@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260714154740.140431-1-bill.roberts@arm.com>
References: <20260714154740.140431-1-bill.roberts@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Historically, managing the user-space shadow stack state on x86 has
been handled exclusively through the arch_prctl() interface via the
ARCH_SHSTK_* operations. However, other architectures (such as arm64 and
riscv) do not implement arch_prctl() and instead utilize the newer,
arch-agnostic, prctl() interface (i.e. PR_GET_SHADOW_STACK_STATUS and
PR_SET_SHADOW_STACK_STATUS).

To provide language runtimes, toolchains, and libc implementations with a
consistent, cross-architecture interface for managing control-flow
integrity, wire up the generic shadow stack prctl handlers for x86.

Map the generic PR_SHADOW_STACK_ENABLE, PR_SHADOW_STACK_DISABLE, and
PR_SHADOW_STACK_LOCK operations onto the underlying x86 internal CET helper
routines. This allows portable userspace applications to toggle or query
shadow stack states without relying on architecture-specific system calls,
while maintaining backward compatibility with existing arch_prctl() calls.

Signed-off-by: Bill Roberts <bill.roberts@arm.com>
---
 arch/x86/kernel/shstk.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/x86/kernel/shstk.c b/arch/x86/kernel/shstk.c
index 0ca64900192f..ef3db94eec6a 100644
--- a/arch/x86/kernel/shstk.c
+++ b/arch/x86/kernel/shstk.c
@@ -18,6 +18,7 @@
 #include <linux/sizes.h>
 #include <linux/user.h>
 #include <linux/syscalls.h>
+#include <linux/prctl.h>
 #include <asm/msr.h>
 #include <asm/fpu/xstate.h>
 #include <asm/fpu/types.h>
@@ -630,3 +631,37 @@ bool shstk_is_enabled(void)
 {
 	return features_enabled(ARCH_SHSTK_SHSTK);
 }
+
+/* We assume the prctl() feature bits line up with the arch_prctl() specific ones. */
+static_assert(PR_SHADOW_STACK_ENABLE == ARCH_SHSTK_SHSTK);
+static_assert(PR_SHADOW_STACK_WRITE  == ARCH_SHSTK_WRSS);
+
+/* Handles the generic prctl interface for PR_SET_SHADOW_STACK_STATUS and its feature bits */
+int arch_set_shadow_stack_status(struct task_struct *t, unsigned long status)
+{
+	int rc;
+
+	/* x86 arch_prctl is single bit at a time, so handle these one at time */
+	if (!status & PR_SHADOW_STACK_ENABLE)
+		return shstk_prctl(t, ARCH_SHSTK_DISABLE, ARCH_SHSTK_SHSTK);
+
+	rc = shstk_prctl(t, ARCH_SHSTK_ENABLE, ARCH_SHSTK_SHSTK);
+	if (rc)
+		return rc;
+
+	if (status & PR_SHADOW_STACK_WRITE)
+		return shstk_prctl(t, ARCH_SHSTK_ENABLE, ARCH_SHSTK_WRSS);
+
+	return shstk_prctl(t, ARCH_SHSTK_DISABLE, ARCH_SHSTK_WRSS);
+}
+
+/* Handles the generic prctl interface for PR_LOCK_SHADOW_STACK_STATUS and its feature bits */
+int arch_lock_shadow_stack_status(struct task_struct *t, unsigned long status)
+{
+	return shstk_prctl(t, ARCH_SHSTK_LOCK, status);
+}
+
+int arch_get_shadow_stack_status(struct task_struct *t, unsigned long __user *status)
+{
+	return shstk_prctl(t, ARCH_SHSTK_STATUS, (unsigned long)status);
+}
-- 
2.54.0

