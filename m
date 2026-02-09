Received: from mail-ot1-f73.google.com (mail-ot1-f73.google.com [209.85.210.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D222318ECB
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Feb 2026 22:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770676871; cv=none; b=J3Umzh1AmfaEVkP3zfDAL4rs0ScxJIPIuruMMGx+0jEYlHw1erCicdcO7vjRya4aRTKmNx1CSiXEqYCihJeHPgcZXUvzeBmEIlw6GTxK66r1e5p6kCmsDjvjJ6RVlXbC/14v3Mh73s+z1lL0GCePahv5rBFwobEzbR3WnZ34xtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770676871; c=relaxed/simple;
	bh=SHVJoQZ+YflPOx5JrxGn/C/DEC5GjFnR/d7ZsgewPiA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=uwyOPwG1rYin/0rVAwOkNNKymjb/mOiNnkS+NiCPsXCatozB00RyxvdFlzRkBwS/LcTqFOcynfF55PGD3gMgrBrN4Hj20pbX5iJN6wEhkv69I3EpUC/pBb1ASbxlE42/akt2hgPkcqcHkD6UEAyf7ydUgc6YpsgUZ513HtpuQ3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Pw/KYaU+; arc=none smtp.client-ip=209.85.210.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Pw/KYaU+"
Received: by mail-ot1-f73.google.com with SMTP id 46e09a7af769-7cfd0f357dcso5736920a34.2
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Feb 2026 14:41:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770676865; x=1771281665; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/TKm1gU8lTLqEcn/8yRmMV0Zp5pYjSJjWs0bsDB+GUI=;
        b=Pw/KYaU+p47J7laFb8fSu+8hF3BsYRID8xNIgkrXkcmy+RRBqixWMeT9jZhtrlVw+Y
         ixbrgc00LemqRbOGxA1onA2IiqPtldaMvXiEKm9lnSZn5RLSjy8mLzm/vPyfOEh3MCMU
         EZErxxS7e1QLWSLAU60HhwxYSSTKl45QBBi93y03k32/SpD30eDXeJaapGZKwIEm4k++
         uKSFGpifrk7ibEsUghklcJ269upu9a7BM1PxHGzSZhq1QBbmoDgFJPOnIcjrkErti90E
         2LkjWOCYZWrtBWOPRefkt54hopSRjAN95dx17iR1rVb8maf6uaUOxIxLACkJwLcs17p4
         H8ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770676865; x=1771281665;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/TKm1gU8lTLqEcn/8yRmMV0Zp5pYjSJjWs0bsDB+GUI=;
        b=dvzkr5LTHTcU4KQRfo1Ir+wcPfku10YZddbr7WLYxTD6MCjfXww8QR+mJsRhlFZggd
         QV/yatdfFg5zdFPVexZVEm0YL2EyJLdIppo3aKN1gGcpMXfYf3DxzCmbNTbg0K998HbG
         mF5MebQAcCh1cCN7TaUM6NyQ68w1qIAPa4eSBo76W9vCuRdmM20b5Wr43qKo3F3Xqg5J
         TRPQZHA3tJGKLkymBGXkuBQVKoEg9SpyKzhUaRaractGUiqdnaAwzh9EflJ8Y09bg4Kf
         3Uf9aOjJGCZaf2Q0K/vsrW+A32g5XoZnWSpOvGQIAvKao8MONR8ZTzneuAHx5BO7Jxbz
         QdyA==
X-Forwarded-Encrypted: i=1; AJvYcCUDp5szmCAQYpqed1maMF7TYRKUbivORR+PQkJJLnDYwvqo3bWykYK9QwupKCT/9JFHwIUp0d1OhorEhPb0dkk=@vger.kernel.org
X-Gm-Message-State: AOJu0YykJppeVfTpKQpMJmZDzNtitaoBIn/AfMjEkLZGles+4AY1udvG
	VIRuSj/fHXfY+SIh6+xT2LCDDwt+oL95vDCjAwkGFy7+jQSTMJyJ0hkPDgJrka+iyA2xriHBste
	fV0IhCBtpDviqbbpWGN7+cqrTyA==
X-Received: from jaox17.prod.google.com ([2002:a05:6638:111:b0:5ca:fdfb:2007])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6820:f015:b0:663:610:cb67 with SMTP id 006d021491bc7-66d0a477b40mr5663839eaf.28.1770676865086;
 Mon, 09 Feb 2026 14:41:05 -0800 (PST)
Date: Mon,  9 Feb 2026 22:14:14 +0000
In-Reply-To: <20260209221414.2169465-1-coltonlewis@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260209221414.2169465-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.53.0.rc2.204.g2597b5adb4-goog
Message-ID: <20260209221414.2169465-20-coltonlewis@google.com>
Subject: [PATCH v6 19/19] KVM: arm64: selftests: Relax testing for exceptions
 when partitioned
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Alexandru Elisei <alexandru.elisei@arm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Mingwei Zhang <mizhang@google.com>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Mark Rutland <mark.rutland@arm.com>, 
	Shuah Khan <shuah@kernel.org>, Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"

Because the Partitioned PMU must lean heavily on underlying hardware
support, it can't guarantee an exception occurs when accessing an
invalid pmc index.

The ARM manual specifies that accessing PMEVCNTR<n>_EL0 where n is
greater than the number of counters on the system is constrained
unpredictable when FEAT_FGT is not implemented, and it is desired the
Partitioned PMU still work without FEAT_FGT.

Though KVM could enforce exceptions here since all PMU accesses
without FEAT_FGT are trapped, that creates further difficulties. For
one example, the manual also says that after writing a value to
PMSELR_EL0 greater than the number of counters on a system, direct
reads will return an unknown value, meaning KVM could not rely on the
hardware register to hold the correct value.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 .../selftests/kvm/arm64/vpmu_counter_access.c | 20 ++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c b/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c
index 9702f1d43b832..27b7d7b2a059a 100644
--- a/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c
+++ b/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c
@@ -38,10 +38,14 @@ const char *pmu_impl_str[] = {
 struct vpmu_vm {
 	struct kvm_vm *vm;
 	struct kvm_vcpu *vcpu;
+};
+
+struct guest_context {
 	bool pmu_partitioned;
 };
 
 static struct vpmu_vm vpmu_vm;
+static struct guest_context guest_context;
 
 struct pmreg_sets {
 	uint64_t set_reg_id;
@@ -342,11 +346,16 @@ static void test_access_invalid_pmc_regs(struct pmc_accessor *acc, int pmc_idx)
 	/*
 	 * Reading/writing the event count/type registers should cause
 	 * an UNDEFINED exception.
+	 *
+	 * If the pmu is partitioned, we can't guarantee it because
+	 * hardware doesn't.
 	 */
-	TEST_EXCEPTION(ESR_ELx_EC_UNKNOWN, acc->read_cntr(pmc_idx));
-	TEST_EXCEPTION(ESR_ELx_EC_UNKNOWN, acc->write_cntr(pmc_idx, 0));
-	TEST_EXCEPTION(ESR_ELx_EC_UNKNOWN, acc->read_typer(pmc_idx));
-	TEST_EXCEPTION(ESR_ELx_EC_UNKNOWN, acc->write_typer(pmc_idx, 0));
+	if (!guest_context.pmu_partitioned) {
+		TEST_EXCEPTION(ESR_ELx_EC_UNKNOWN, acc->read_cntr(pmc_idx));
+		TEST_EXCEPTION(ESR_ELx_EC_UNKNOWN, acc->write_cntr(pmc_idx, 0));
+		TEST_EXCEPTION(ESR_ELx_EC_UNKNOWN, acc->read_typer(pmc_idx));
+		TEST_EXCEPTION(ESR_ELx_EC_UNKNOWN, acc->write_typer(pmc_idx, 0));
+	}
 	/*
 	 * The bit corresponding to the (unimplemented) counter in
 	 * {PMCNTEN,PMINTEN,PMOVS}{SET,CLR} registers should be RAZ.
@@ -459,7 +468,7 @@ static void create_vpmu_vm(void *guest_code, enum pmu_impl impl)
 		vpmu_vm.vcpu, KVM_ARM_VCPU_PMU_V3_CTRL, KVM_ARM_VCPU_PMU_V3_ENABLE_PARTITION);
 	if (!ret) {
 		vcpu_ioctl(vpmu_vm.vcpu, KVM_SET_DEVICE_ATTR, &part_attr);
-		vpmu_vm.pmu_partitioned = partition;
+		guest_context.pmu_partitioned = partition;
 		pr_debug("Set PMU partitioning: %d\n", partition);
 	}
 
@@ -511,6 +520,7 @@ static void test_create_vpmu_vm_with_nr_counters(
 		TEST_ASSERT(!ret, KVM_IOCTL_ERROR(KVM_SET_DEVICE_ATTR, ret));
 
 	vcpu_device_attr_set(vcpu, KVM_ARM_VCPU_PMU_V3_CTRL, KVM_ARM_VCPU_PMU_V3_INIT, NULL);
+	sync_global_to_guest(vpmu_vm.vm, guest_context);
 }
 
 /*
-- 
2.53.0.rc2.204.g2597b5adb4-goog

