Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D31B3BBFA9
	for <linux-kselftest@vger.kernel.org>; Wed,  8 Jul 2026 03:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783481810; cv=none; b=KT6Eayc0uDRR9HQJ6dsmUhko0VP1TnCkDHrDxCIuY1G+tI3ofqVg2Zq2WNUfV6cZ6q32CcJExilBQYF1V34jjd40JyIKPKywIT7l0rj5qXeGr60Et5oEXYGJL8HQwCK86eyAOQRZArkz547tsdf+PZOqMBG9j8KXAkUuGlGpLzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783481810; c=relaxed/simple;
	bh=oHl0N2vpojWj02TJpZJMDrHhq8G9Cg4fhg6BkSVUMOQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cX9qOZqOAiqORV+cMiZ4sYMgmEbnkQzmxINaVsvrfqkfvRV7B1e3nd5aTUoR5DgUYmbvwU7+ORb6kDOkQ19VKIbnvj0bQNp0VQZTT97Qhi9f0UXozjzQVxPaEAYCJuxcivD16uImtVKTfCEq4Nhdl17zvsHYqzYsAjM0XA8E4Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ALQNp7nC; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ALQNp7nC"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-37ff8e0ad0fso268843a91.2
        for <linux-kselftest@vger.kernel.org>; Tue, 07 Jul 2026 20:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783481801; x=1784086601; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bdv2Ctkz/FW0hn4mHAySYNVwcrKaEen484H6Mm8b//s=;
        b=ALQNp7nCjSaV+L8xQKA5qhW5opNpkN5HmIxJwhtPxPB6qFuyB3gDhHMaZ6dROm4K6u
         00G04EIVDwhBldLffBL6YrBnb65rW7gTV+7CiTsQxi/VREFnLLHZnm+HZzMKa1cU/eW9
         7pDRdePkjEjX1Md+c7NvdiynT4gWZ6iVwAFg1OSlACC5rYRVHfuV+DuATpV1SHH7qOB4
         e6GFXvp2hDExT1jSX/5FLCWTg0e2lGT14iJCfmOc9w7VOX1775Bs3Y9J39n9mutaOB90
         HofagCkO+zV+f6n0Mk0e5xGHk2aWXXkwyD/disJ/mTEIt+zYFAn8uYN1eGxqfq5FPsyM
         Kveg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783481801; x=1784086601;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Bdv2Ctkz/FW0hn4mHAySYNVwcrKaEen484H6Mm8b//s=;
        b=VAseZ6cYuKSb/eHEbNoPSVVQeBeYoV/CcV6B/npJW9p5tsp1YxCPgnE1YUMlvkoDhO
         WlgI0JHzZb7e8HiVxRv769Rao6IQUNNe3uzG/Dp4U0m6YNx7GnCJUjoYG6vuPLrZXnDo
         0Rsnj11iqfJTS05LFFJPUxa0pa7sKCn3BV0QobjWWPIZBSsLMCJqA2Kr4aUaw4DtIxK0
         N7bz0gmg7FtNdfho+kFyF4KYGu5HLWcHus1soa3IR0EDhqmBdMkNHmHsc2yqY/T431Mh
         zYmrMaGGb6RSfafxhnnQ5dKvDvLku7IBXML3xf5tEEvOaZcQvLE85LV6/lp7UBSjUBdJ
         Y/pw==
X-Forwarded-Encrypted: i=1; AHgh+Rq/cYbEEpHRqIpxjb0TQDUYRYOgczqNP8Fa0vDLyu4ksLf74w+C0BH9bkJXkICKaZ662Y1OCf/6zKDIQ+TDDR0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMRviaB5uYqP30EjuB+4DPAa3/k+u5njE9u8uEdyqvKid6ZQRQ
	blR3O054yMuaDp40jlHYf5puoQ5B1Oj08tb9gg/+ZPz0GsP33mtYC9XG5Vgx2v99
X-Gm-Gg: AfdE7ckiD0nBJvyYbPwDWpwZkPkd6U8bDSxJFF5JLbmteuxmxelHLBuKM2S2kkaeh8c
	EBy3sQu3I3uHhkS8wgepbVeJ+dmx0HURgK1/9jDtdFgM2TM0PSOr33nqOXmXPa1/PvdEmvsd8PP
	eKOmCYrgVRxtI3S9IYTj5DzmM5Ep9ycsGkMCleFM4IF7t174yqex1+BoSfRoZqLx+rpQZ3au9Zf
	os1PxfhT6dw0Mvyek/U9kwVNotB6joMOmRqSYK+wnZOKVsluDjwlyzSql66kPN0VL7hAkMptQ8j
	NxsVs87aP2M2lrRm+/Ezyeh95KFpHfW6vxVTsW49m8Iqp2vmir3iiMFqDScZDGjtPfA9h5U2IXJ
	rj0mZzWOHm5i44/ReqwZRhC0DptFgpFQxcmGLeXh+b4ai1UTC002OppSdlbxJQPHDJoZf8zPgBY
	hJ4y8QED5HWI69IU/sSWEyOiRQQOsWAskQSBzqs1M=
X-Received: by 2002:a17:90b:5290:b0:387:e0db:3d8d with SMTP id 98e67ed59e1d1-3894395516amr711810a91.40.1783481801232;
        Tue, 07 Jul 2026 20:36:41 -0700 (PDT)
Received: from [10.0.0.65] ([2601:647:6700:64d0::94ac])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174accae5sm21092850eec.29.2026.07.07.20.36.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 20:36:40 -0700 (PDT)
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
Date: Tue, 07 Jul 2026 20:34:36 -0700
Subject: [PATCH v3 13/17] riscv: kvm: Add emulated test csr
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-riscv_insn_table-v3-13-3f8e5f75ba97@gmail.com>
References: <20260707-riscv_insn_table-v3-0-3f8e5f75ba97@gmail.com>
In-Reply-To: <20260707-riscv_insn_table-v3-0-3f8e5f75ba97@gmail.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Nam Cao <namcao@linutronix.de>, Alexandre Ghiti <alex@ghiti.fr>, 
 Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
 Conor Dooley <conor@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, 
 =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <radim.krcmar@oss.qualcomm.com>, 
 Jesse Taube <jtaubepe@redhat.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <thecharlesjenkins@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783481777; l=5057;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=oHl0N2vpojWj02TJpZJMDrHhq8G9Cg4fhg6BkSVUMOQ=;
 b=f0/7JmOW73SvUy0ZQ6FNsrrekd4jPc1glCSUOAPV1wBR0CHqyzyAdPHvMn6Kgn7F2HQA/J1RT
 JVOWRlWMUMtAgaNQP6Ht6OpkBNnT+1o0lQcFeJd/mP/Dc/RKXZIqzFo
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=

To test the riscv kvm implementation of emulated CSRs, add support to
emulate the vsscratch csr when CONFIG_RISCV_KVM_TEST_CSR is set.

Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
---
 arch/riscv/Kconfig.debug                   |  1 +
 arch/riscv/include/asm/kvm_host.h          | 10 ++++++++++
 arch/riscv/include/asm/kvm_vcpu_test_csr.h | 15 +++++++++++++++
 arch/riscv/kvm/Kconfig.debug               | 16 ++++++++++++++++
 arch/riscv/kvm/Makefile                    |  1 +
 arch/riscv/kvm/vcpu_insn.c                 |  5 +++++
 arch/riscv/kvm/vcpu_test_csr.c             | 21 +++++++++++++++++++++
 7 files changed, 69 insertions(+)

diff --git a/arch/riscv/Kconfig.debug b/arch/riscv/Kconfig.debug
index eafe17ebf710..be202267da6d 100644
--- a/arch/riscv/Kconfig.debug
+++ b/arch/riscv/Kconfig.debug
@@ -1 +1,2 @@
 source "arch/riscv/kernel/tests/Kconfig.debug"
+source "arch/riscv/kvm/Kconfig.debug"
diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index 75b0a951c1bc..4d30d30ebefc 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -167,6 +167,12 @@ struct kvm_vcpu_reset_state {
 	unsigned long a1;
 };
 
+#ifdef CONFIG_RISCV_KVM_TEST_CSR
+struct kvm_test_csr {
+	unsigned long val;
+};
+#endif
+
 struct kvm_vcpu_arch {
 	/* VCPU ran at least once */
 	bool ran_atleast_once;
@@ -265,6 +271,10 @@ struct kvm_vcpu_arch {
 		gpa_t shmem;
 		u64 last_steal;
 	} sta;
+
+#ifdef CONFIG_RISCV_KVM_TEST_CSR
+	struct kvm_test_csr test_csr;
+#endif
 };
 
 /*
diff --git a/arch/riscv/include/asm/kvm_vcpu_test_csr.h b/arch/riscv/include/asm/kvm_vcpu_test_csr.h
new file mode 100644
index 000000000000..a844fccaafc3
--- /dev/null
+++ b/arch/riscv/include/asm/kvm_vcpu_test_csr.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __KVM_VCPU_RISCV_TEST_CSR_H
+#define __KVM_VCPU_RISCV_TEST_CSR_H
+
+#include <asm/kvm_vcpu_insn.h>
+
+#define KVM_RISCV_VCPU_TEST_CSR_FUNCS \
+	{.base = CSR_VSSCRATCH,	.count = 1,	.func = kvm_riscv_vcpu_test_csr },
+
+int kvm_riscv_vcpu_test_csr(struct kvm_vcpu *vcpu, unsigned int csr_num,
+			    unsigned long *val, unsigned long new_val,
+			    unsigned long wr_mask);
+
+#endif /* !__KVM_VCPU_RISCV_TEST_CSR_H */
diff --git a/arch/riscv/kvm/Kconfig.debug b/arch/riscv/kvm/Kconfig.debug
new file mode 100644
index 000000000000..dc76e02120a3
--- /dev/null
+++ b/arch/riscv/kvm/Kconfig.debug
@@ -0,0 +1,16 @@
+# SPDX-License-Identifier: GPL-2.0-only
+menu "arch/riscv/kvm testing"
+
+config RISCV_KVM_TEST_CSR
+        bool "Test KVM CSR emulation"
+        depends on KVM
+        default n
+        help
+            Enable this option to enable the emulation of a test hypervisor csr.
+            The KVM test csr is the vsscratch register. Once this is enabled,
+            reading/writing to the vsscratch register will trap into the host
+            supervisor and reflect the change.
+
+            If unsure, say N.
+
+endmenu # "arch/riscv/kvm testing"
diff --git a/arch/riscv/kvm/Makefile b/arch/riscv/kvm/Makefile
index 296c2ba05089..5092b86751c4 100644
--- a/arch/riscv/kvm/Makefile
+++ b/arch/riscv/kvm/Makefile
@@ -38,6 +38,7 @@ kvm-y += vcpu_sbi_sta.o
 kvm-y += vcpu_sbi_system.o
 kvm-$(CONFIG_RISCV_SBI_V01) += vcpu_sbi_v01.o
 kvm-y += vcpu_switch.o
+kvm-$(CONFIG_RISCV_KVM_TEST_CSR) += vcpu_test_csr.o
 kvm-y += vcpu_timer.o
 kvm-y += vcpu_vector.o
 kvm-y += vm.o
diff --git a/arch/riscv/kvm/vcpu_insn.c b/arch/riscv/kvm/vcpu_insn.c
index 78adc2830819..c3e4cf2cd44b 100644
--- a/arch/riscv/kvm/vcpu_insn.c
+++ b/arch/riscv/kvm/vcpu_insn.c
@@ -10,6 +10,8 @@
 #include <asm/cpufeature.h>
 #include <asm/insn.h>
 
+#include <asm/kvm_vcpu_test_csr.h>
+
 struct insn_func {
 	unsigned long mask;
 	unsigned long match;
@@ -112,6 +114,9 @@ static int seed_csr_rmw(struct kvm_vcpu *vcpu, unsigned int csr_num,
 static const struct csr_func csr_funcs[] = {
 	KVM_RISCV_VCPU_AIA_CSR_FUNCS
 	KVM_RISCV_VCPU_HPMCOUNTER_CSR_FUNCS
+#ifdef CONFIG_RISCV_KVM_TEST_CSR
+	KVM_RISCV_VCPU_TEST_CSR_FUNCS
+#endif
 	{ .base = CSR_SEED, .count = 1, .func = seed_csr_rmw },
 };
 
diff --git a/arch/riscv/kvm/vcpu_test_csr.c b/arch/riscv/kvm/vcpu_test_csr.c
new file mode 100644
index 000000000000..b8aa503cdaba
--- /dev/null
+++ b/arch/riscv/kvm/vcpu_test_csr.c
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/kvm_host.h>
+#include <asm/kvm_vcpu_insn.h>
+#include <asm/kvm_vcpu_test_csr.h>
+
+#define vcpu_to_test_csr(vcpu) (&(vcpu)->arch.test_csr)
+
+int kvm_riscv_vcpu_test_csr(struct kvm_vcpu *vcpu, unsigned int csr_num,
+			    unsigned long *val, unsigned long new_val,
+			    unsigned long wr_mask)
+{
+	struct kvm_test_csr *test_csr = vcpu_to_test_csr(vcpu);
+
+	*val = test_csr->val;
+
+	if (wr_mask)
+		test_csr->val = (test_csr->val & ~wr_mask) | (new_val & wr_mask);
+
+	return KVM_INSN_CONTINUE_NEXT_SEPC;
+}

-- 
2.54.0

