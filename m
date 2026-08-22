Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2953C4B91
	for <linux-kselftest@vger.kernel.org>; Sat, 22 Aug 2026 09:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787392449; cv=none; b=CNBuSx2S0s12gcaJApfS7qirlhWclAeHohLNc9tk3S3+Y0j0adFznQXDvRyNWK+vZQhG0d2QPBN5pxTMmecJfPyRxSKyzMaUtO1fywsnfwLLP4QPDpilewk/UCrIQ6CQ85GC/e5Rj0jHk/G80aNJ2xcQPpOCcHcidzoC0yEm908=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787392449; c=relaxed/simple;
	bh=rv7xXdolg6NQjjtjnJt7VT86OJEL0RCm3VxCHe4ILRc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GSV1Zqp3NSk/L/LJInux0bQehDgwVrrq6CVe+LIX2lnyk02PZew/J6ZlG/EdTCqoJ872Xx1biPoYP5I/bGqq37Lbh6sqe229FWgIq/LXLh0INrsRsw2mXi6HtmH9CQTzUv4QmoiSxFQhTCfS0dV0JFVSvNjML8Igd+AXtNqC3xU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qBZFXAV9; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qBZFXAV9"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6a36982a875so2909560a12.0
        for <linux-kselftest@vger.kernel.org>; Sat, 22 Aug 2026 02:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787392446; x=1787997246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1GYqiFSBk6xbMl7ANfKl+0h07k1nsbqa00/KuNdgbGU=;
        b=qBZFXAV9HTSYCJnfWizpOD7rUT4nbCHbFnOCqe9sz4zMi9gBse8w41rh6F++cwKbZM
         942PO/Vy0S+EdfGPB99CaL1yuzxv9zYee/NP5umuYlIBQU1HtrlyY//PEpiXQp3r/D8i
         PhkOuHdeVBMZFK8zoZZ3zVNQ0lthZ2XcgziKJGxwqw2mRrzZgDsm77a+GPyqGF44rsit
         oD27aFwhINFbZtWtSbaBCLrmSyPiGC+LILEP2DNakC30gP5qFDfcaBn7Yl/OG1CEiZyr
         m9YoiNUf8zSlOhWFyTBr6KZTBz+S4/DVPoRSPjHJecpT5NGeMagkPmCmBK4c5TZ6CjrC
         VX3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787392446; x=1787997246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1GYqiFSBk6xbMl7ANfKl+0h07k1nsbqa00/KuNdgbGU=;
        b=tU0qr2aTKWE5lAjEsZjqNuXBTqgShduubcU3GNgCPXRW8YYFYGNM0vxxTa7wWiN1dl
         2M8oKbEzRYHkocL2i5BdE4at2TrVTRZJHctOvqjbwB+WDioH451/AMrEoN4Xr5Ne1UYI
         9VY07zy2bgFOGK8gIjlDwJAxEWBLVPrf0Ux4B/lN0kJRTLSjVfK92naWF4hcc7854GOA
         4J2zcfw4+e2wBmdMIiUGE5FQ1yvZR9WfA7hK/KiQ9HQUXfWNQDRAISTb38tkqzUzQV3b
         QG2BpVedEDMZhVWm9u2YXOrtVZwzNXDDaoaINrtmERg3zXJYj8DEZ3mRwBhEdUuB72Tw
         c2nQ==
X-Forwarded-Encrypted: i=1; AHgh+RrDhf2PCJCyNBDmbMSJpa1/Pi7zUebOqowcHOW8qphKeox1Hr1TJ4VLeV1sA5ZiG5ptsfapOygX+WHjt5sc6wQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kJ9KS4IaUj7z3EEyDmrl1FCh3AP1t5vSPEOL/EavrsBsZY5hFS
	2NCDtD+tRab8DQ+oj3R2PCrdi5UT0rk2WzHqv7QyV+BTtXtrMNPcCW3O
X-Gm-Gg: AR+sD10ggLZkxyGEPO5BXTa/UVsMDDiEv1ZOlFPuhO/lK4EvLyTpjGHG9uDpzubURVi
	Vj7iVG84yrFsqjJsHPNxZd9lf/u/HLlHeFTb34fJTCOXCizultn13WuvS/4n2nRBOWUt1gFEYpv
	0Lkrv68g/drAqbq3wN9mX4CRq9RHXW1qxG3AMv93qfZdbKeNFREWouC0XxKHs8DgQybXxyi+Thd
	bzTI43V3g6lUetA2OSJVrt7uy64iylVRTmMvJ6sS602aNJLc2oznnnMlg5kohJCc7C4ljUtArek
	TcdC79CEkwjl6OHSVF3Qmk/DrF/K3p2UtKWw36Val1XhtdyIL0P6zZoJk1PX8Q0xZNDJOUF+a1d
	TQfa4ps8RSrb5kaClYiJJLIba1vZfQI35XEIC19TVD0/1128tMoQcjVNNB4TKY0U9BPjwFZ+8cj
	0D/qJGF6uFzaupnqX4GJNWzfJSKfMjb0IL8peuMghCDM4+nazL+rEZoEt8YVcrVxS0tWcqleBhK
	aOxKVShPN6AtU9pWFZ9lYBOhYDG2xIo9vfo8RV573wTVLlLsrGtNycG62BRScMQvv+PEEgYxpyZ
	7qnHgXcgGTHkFBDEYT5RoM90GBxajQ/KSm8/jb9Fpfs9Atolana4Cu+NkAPrsS9Tohre
X-Received: by 2002:a05:6402:42c4:b0:6a3:e813:8457 with SMTP id 4fb4d7f45d1cf-6a42f1f9e90mr13698572a12.12.1787392446101;
        Sat, 22 Aug 2026 02:54:06 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a0f5-8c01-3de3-cd62-aa6f-2fb0.310.pool.telefonica.de. [2a02:3100:a0f5:8c01:3de3:cd62:aa6f:2fb0])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3ff0c327asm11151586a12.8.2026.08.22.02.54.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 22 Aug 2026 02:54:05 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Eric Auger <eric.auger@redhat.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v3 5/5] KVM: arm64: selftests: Test VGICv3 redistributor region retry
Date: Sat, 22 Aug 2026 11:53:46 +0200
Message-Id: <20260822095346.53882-6-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260822095346.53882-1-kmehltretter@gmail.com>
References: <20260822095346.53882-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A failed REDIST_REGION write can remove redistributor iodevs without
clearing their cached vCPU assignments. A retry then skips those
assignments and leaves the redistributors absent from the MMIO bus.

Create two partial regions, reject a third region that overlaps the
distributor, and retry at a valid address. After initializing the VGIC,
have the guest read GICR_TYPER from all four redistributors and check their
processor numbers. This verifies the final configuration without assuming
that assignments survive the failed write.

Keep the redistributor IPAs outside the guest RAM memslot and install only
the stage-1 mappings needed for the MMIO accesses. If an iodev is missing,
KVM_RUN therefore exits with KVM_EXIT_MMIO. Without the fix, the first
redistributor access exits at 0x8030008.

Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 tools/testing/selftests/kvm/arm64/vgic_init.c | 92 +++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/tools/testing/selftests/kvm/arm64/vgic_init.c b/tools/testing/selftests/kvm/arm64/vgic_init.c
index 84aa97204b7f..5a30f3cb039b 100644
--- a/tools/testing/selftests/kvm/arm64/vgic_init.c
+++ b/tools/testing/selftests/kvm/arm64/vgic_init.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2020, Red Hat, Inc.
  */
 #include <linux/kernel.h>
+#include <linux/sizes.h>
 #include <sys/syscall.h>
 #include <asm/kvm.h>
 #include <asm/kvm_para.h>
@@ -13,12 +14,21 @@
 
 #include "test_util.h"
 #include "kvm_util.h"
+#include "gic.h"
 #include "processor.h"
 #include "vgic.h"
 #include "gic_v3.h"
 
 #define NR_VCPUS		4
 
+#define REDIST_RETRY_REGION0_BASE	GICR_BASE_GPA
+#define REDIST_RETRY_REGION1_BASE	\
+	(REDIST_RETRY_REGION0_BASE + 2 * KVM_VGIC_V3_REDIST_SIZE)
+#define REDIST_RETRY_DIST_BASE		\
+	(REDIST_RETRY_REGION1_BASE + KVM_VGIC_V3_REDIST_SIZE)
+#define REDIST_RETRY_REGION2_BASE	\
+	(REDIST_RETRY_DIST_BASE + KVM_VGIC_V3_DIST_SIZE)
+
 #define REG_OFFSET(vcpu, offset) (((u64)vcpu << 32) | offset)
 
 #define VGIC_DEV_IS_V2(_d) ((_d) == KVM_DEV_TYPE_ARM_VGIC_V2)
@@ -65,6 +75,23 @@ static void guest_code(void)
 	GUEST_DONE();
 }
 
+static void guest_check_redist_retry(void)
+{
+	unsigned int i;
+
+	/* The first three redistributors span adjacent regions 0 and 1. */
+	for (i = 0; i < NR_VCPUS; i++) {
+		u64 base = i < 3 ? REDIST_RETRY_REGION0_BASE +
+				       i * KVM_VGIC_V3_REDIST_SIZE :
+				       REDIST_RETRY_REGION2_BASE;
+		u64 typer = readq((void *)(unsigned long)(base + GICR_TYPER));
+
+		GUEST_ASSERT_EQ(GICR_TYPER_CPU_NUMBER(typer), i);
+	}
+
+	GUEST_DONE();
+}
+
 /* we don't want to assert on run execution, hence that helper */
 static int run_vcpu(struct kvm_vcpu *vcpu)
 {
@@ -462,6 +489,70 @@ static void test_v3_new_redist_regions(void)
 	vm_gic_destroy(&v);
 }
 
+static void test_v3_redist_region_retry(void)
+{
+	struct kvm_vcpu *vcpus[NR_VCPUS];
+	struct vm_gic v;
+	struct ucall uc;
+	u64 addr;
+	int ret;
+
+	v = vm_gic_create_with_vcpus(KVM_DEV_TYPE_ARM_VGIC_V3, NR_VCPUS,
+				     guest_check_redist_retry, vcpus);
+
+	addr = REDIST_REGION_ATTR_ADDR(2, REDIST_RETRY_REGION0_BASE, 0, 0);
+	kvm_device_attr_set(v.gic_fd, KVM_DEV_ARM_VGIC_GRP_ADDR,
+			    KVM_VGIC_V3_ADDR_TYPE_REDIST_REGION, &addr);
+
+	addr = REDIST_REGION_ATTR_ADDR(1, REDIST_RETRY_REGION1_BASE, 0, 1);
+	kvm_device_attr_set(v.gic_fd, KVM_DEV_ARM_VGIC_GRP_ADDR,
+			    KVM_VGIC_V3_ADDR_TYPE_REDIST_REGION, &addr);
+
+	addr = REDIST_RETRY_DIST_BASE;
+	kvm_device_attr_set(v.gic_fd, KVM_DEV_ARM_VGIC_GRP_ADDR,
+			    KVM_VGIC_V3_ADDR_TYPE_DIST, &addr);
+
+	addr = REDIST_REGION_ATTR_ADDR(1, REDIST_RETRY_DIST_BASE, 0, 2);
+	ret = __kvm_device_attr_set(v.gic_fd, KVM_DEV_ARM_VGIC_GRP_ADDR,
+				    KVM_VGIC_V3_ADDR_TYPE_REDIST_REGION,
+				    &addr);
+	TEST_ASSERT(ret && errno == EINVAL,
+		    "register redist region colliding with dist");
+
+	addr = REDIST_REGION_ATTR_ADDR(1, REDIST_RETRY_REGION2_BASE, 0, 2);
+	kvm_device_attr_set(v.gic_fd, KVM_DEV_ARM_VGIC_GRP_ADDR,
+			    KVM_VGIC_V3_ADDR_TYPE_REDIST_REGION, &addr);
+
+	virt_map(v.vm, REDIST_RETRY_REGION0_BASE, REDIST_RETRY_REGION0_BASE,
+		 vm_calc_num_guest_pages(v.vm->mode,
+					 3 * KVM_VGIC_V3_REDIST_SIZE));
+	virt_map(v.vm, REDIST_RETRY_REGION2_BASE, REDIST_RETRY_REGION2_BASE,
+		 vm_calc_num_guest_pages(v.vm->mode,
+					 KVM_VGIC_V3_REDIST_SIZE));
+
+	kvm_device_attr_set(v.gic_fd, KVM_DEV_ARM_VGIC_GRP_CTRL,
+			    KVM_DEV_ARM_VGIC_CTRL_INIT, NULL);
+
+	vcpu_run(vcpus[0]);
+	switch (get_ucall(vcpus[0], &uc)) {
+	case UCALL_DONE:
+		break;
+	case UCALL_ABORT:
+		REPORT_GUEST_ASSERT(uc);
+		break;
+	case UCALL_NONE:
+		if (vcpus[0]->run->exit_reason == KVM_EXIT_MMIO)
+			TEST_FAIL("Unexpected MMIO exit at 0x%llx",
+				  vcpus[0]->run->mmio.phys_addr);
+		fallthrough;
+	default:
+		TEST_FAIL("Unexpected ucall %lu, exit_reason %u",
+			  uc.cmd, vcpus[0]->run->exit_reason);
+	}
+
+	vm_gic_destroy(&v);
+}
+
 static void test_v3_typer_accesses(void)
 {
 	struct vm_gic v;
@@ -986,6 +1077,7 @@ void run_tests(u32 gic_dev_type)
 
 	if (VGIC_DEV_IS_V3(gic_dev_type)) {
 		test_v3_new_redist_regions();
+		test_v3_redist_region_retry();
 		test_v3_typer_accesses();
 		test_v3_last_bit_redist_regions();
 		test_v3_last_bit_single_rdist();
-- 
2.39.5 (Apple Git-154)

