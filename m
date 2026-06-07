Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD4942980A8
	for <linux-kselftest@vger.kernel.org>; Sun,  7 Jun 2026 08:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780819890; cv=none; b=SNYSErAb8iWZIUDh8WYS/jaICGdLM8uzgxqB5kxtY97jBx5LnEYaewwXt+2OpeWFFsOZXjPd5ffjVhIuf8iRDykhR+cW6+ZeIOXXk4Fy328y6jtyqog9pDxN02mcUuIVpGP1US+1QZRzQ8kU8ndK6aBPyc3tJN4FXy+sX1hOF+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780819890; c=relaxed/simple;
	bh=4iPsNUtzE30oTKcIRucvHW4DlaBGh7JBBtN09w1GgM0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ezuOn4xxThSoAqnfV7j6WJMGvnWIqRHuj+L1uHWRAVcnMrGRNq8CxlrmA4eb2rlOFOzQjQrirXArC8iobW9Pj0HCbC4UmQYfUJWlqvTcM9q6ddO507eeNKgDAp32XqcalqouZ0xsjfN990ANMVXUk+uNQSomB8Nar/B9SjHCgy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BRB+T106; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BRB+T106"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-84237c55ef9so1528238b3a.0
        for <linux-kselftest@vger.kernel.org>; Sun, 07 Jun 2026 01:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780819887; x=1781424687; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CVZv/CJK3pxFXw0CmJrNpu82Z7U/XAS/kFgsWo152uk=;
        b=BRB+T106En5o9FO8XyyYdQkpw4TWg+qMm9H4HW8cQSBR142fQO0xJKudyEdpV4Laog
         Hc0qPkSS4FSNmOelgFZkunLZ81xWHwD+knA8aqP0rlCYc3UOC2LY+3r2Gcirh1gTwR/7
         ELtJBp8YoiEO0eMgOcx1FDMB2AZrGq7MFNpLCcPu/gjjxGOemr9iihO5A4P/4Ji1RWLe
         QnAUW1J73Phv9SP1lDWiT7NBBjhHynLAMebSvW0n6b8tqs/KdKhXXKBPgzCrOkiGwkua
         x3JP+tgktMNn8aG+JUS3XP4CDFdtbnGUnYUYNEIx8vbcbkqOE8269H+qvn06PQG6WVHV
         467Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780819887; x=1781424687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CVZv/CJK3pxFXw0CmJrNpu82Z7U/XAS/kFgsWo152uk=;
        b=gcHKDQB6hZK/HQGz3GS3irp/VQ3fkuFhiXb6SNJJaarF6wkS+mPDi/lX3OP+mlMRrd
         Pxm1SnDJYmPMCh3WsABkJRD9UsgtC+EE4MELNadANQgNxDBAjOzKuPhOa4kMx2ZVKDo8
         ZL6G5v5qYA7JjeOQ4XN1aKNmGtIw25w7keT80xOqKAtzpLqUxPy0AEZ9VpwqB34P2cof
         hL5mIaXlsXjThy8FjncmIN3u49PW+/L0qL0DAINDzxEfb8D7T+DtBPhdC1IbC4c6eRpn
         vjFnuShPa6dnPdcuUaHGnFnvxAMRWRZ0fqxMerLaiBtrVSHlhedHZnHbUZWJoS4odlYj
         TMhQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Rlgq1eKtEQ837B6uHXR2pD9pYGBz+skIl0lFbcGuVDVkRlimbg2mgHPH+zJ5/nsI8XTAv00IvyE65a6eQwlc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzCRjkrpjRApSCYxk5ZdGaGMAdVwN2BHjhU/TTrAnzMz2Jhl9a
	7CmfcubCg7SlH2bubP+1/wSbBdpRB5EYMPyfjTv/tQLmonbUhjUmtx9J
X-Gm-Gg: Acq92OHwSrwxjUVqJh7VJq5EsZ4NYf3Mzvx4zEPI55nQU3fucW2E3UEwz/Zul/Uz/4D
	vpZr9Qh3So92kIaWkhgV1ztNYnZbV5H/Q672p4BnBUokg3A4dFPcRYB8Osw0NnfZ2u4TqK/Yp3O
	d1UMtICW1S53NM0Dm8jel0IaATxthyWtkkUVvnlYkrIuPW0mBz51u5gx3HqGSJ/xNle9irq50mr
	h1ZWkxeN5oXUu14U6lKVfKnQgSxid9+WgfeyQBph91VM28EngKU+oHFWVniUU9JzgQaFzAtVKXs
	FadVm5ZdvM2Uf0BgHb5AvmkjpVvjzqCvf7IcCWYwUVRqXGpclP3EDS1Copa4Bn6bvthGHSQfZDd
	QdU2cGB9jHBmfSaNbfLwKomf8yr7cDz1fom3jFrvy6pIXWdL9jYyBvgrK9P/0xB1Ewnqm5ldP5D
	/3wh3I07CQUe6yQvqa041HgDZnsA3P8UPp2Q==
X-Received: by 2002:a05:6a00:2e1c:b0:842:6c02:2fa1 with SMTP id d2e1a72fcca58-842b10af99dmr11276089b3a.39.1780819887080;
        Sun, 07 Jun 2026 01:11:27 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428325d9a3sm14192864b3a.34.2026.06.07.01.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 01:11:26 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Thomas Huth <thuth@redhat.com>,
	Deepak Gupta <debug@rivosinc.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Sergey Matyukevich <geomatsi@gmail.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v3 4/8] RISC-V: KVM: Add ssp context save/restore
Date: Sun,  7 Jun 2026 16:11:00 +0800
Message-ID: <20260607081105.993908-5-inochiama@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260607081105.993908-1-inochiama@gmail.com>
References: <20260607081105.993908-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add ssp context save/restore for guest VCPUs and also add it to the
ONE_REG interface to allow its access from user space.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/include/asm/kvm_host.h |  7 ++++
 arch/riscv/include/uapi/asm/kvm.h |  8 ++++
 arch/riscv/kvm/vcpu.c             |  6 +++
 arch/riscv/kvm/vcpu_onereg.c      | 66 ++++++++++++++++++++++++++++++-
 4 files changed, 85 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index 75b0a951c1bc..54ef83ac2d1e 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -161,6 +161,10 @@ struct kvm_vcpu_smstateen_csr {
 	unsigned long sstateen0;
 };
 
+struct kvm_vcpu_zicfiss_csr {
+	unsigned long ssp;
+};
+
 struct kvm_vcpu_reset_state {
 	spinlock_t lock;
 	unsigned long pc;
@@ -201,6 +205,9 @@ struct kvm_vcpu_arch {
 	/* CPU Smstateen CSR context of Guest VCPU */
 	struct kvm_vcpu_smstateen_csr smstateen_csr;
 
+	/* CPU Zicfiss CSR context of Guest VCPU */
+	struct kvm_vcpu_zicfiss_csr zicfiss_csr;
+
 	/* CPU reset state of Guest VCPU */
 	struct kvm_vcpu_reset_state reset_state;
 
diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index a27de850fa4c..fd4c81697617 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -102,6 +102,11 @@ struct kvm_riscv_smstateen_csr {
 	unsigned long sstateen0;
 };
 
+/* Zicfiss CSR for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
+struct kvm_riscv_zicfiss_csr {
+	unsigned long ssp;
+};
+
 /* TIMER registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
 struct kvm_riscv_timer {
 	__u64 frequency;
@@ -266,12 +271,15 @@ struct kvm_riscv_sbi_fwft {
 #define KVM_REG_RISCV_CSR_GENERAL	(0x0 << KVM_REG_RISCV_SUBTYPE_SHIFT)
 #define KVM_REG_RISCV_CSR_AIA		(0x1 << KVM_REG_RISCV_SUBTYPE_SHIFT)
 #define KVM_REG_RISCV_CSR_SMSTATEEN	(0x2 << KVM_REG_RISCV_SUBTYPE_SHIFT)
+#define KVM_REG_RISCV_CSR_ZICFISS	(0x3 << KVM_REG_RISCV_SUBTYPE_SHIFT)
 #define KVM_REG_RISCV_CSR_REG(name)	\
 		(offsetof(struct kvm_riscv_csr, name) / sizeof(unsigned long))
 #define KVM_REG_RISCV_CSR_AIA_REG(name)	\
 	(offsetof(struct kvm_riscv_aia_csr, name) / sizeof(unsigned long))
 #define KVM_REG_RISCV_CSR_SMSTATEEN_REG(name)  \
 	(offsetof(struct kvm_riscv_smstateen_csr, name) / sizeof(unsigned long))
+#define KVM_REG_RISCV_CSR_ZICFISS_REG(name)  \
+	(offsetof(struct kvm_riscv_zicfiss_csr, name) / sizeof(unsigned long))
 
 /* Timer registers are mapped as type 4 */
 #define KVM_REG_RISCV_TIMER		(0x04 << KVM_REG_RISCV_TYPE_SHIFT)
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index a73690eda84b..783455db1d4d 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -719,6 +719,7 @@ static void kvm_riscv_update_hvip(struct kvm_vcpu *vcpu)
 
 static __always_inline void kvm_riscv_vcpu_swap_in_guest_state(struct kvm_vcpu *vcpu)
 {
+	struct kvm_vcpu_zicfiss_csr *zicficsr = &vcpu->arch.zicfiss_csr;
 	struct kvm_vcpu_smstateen_csr *smcsr = &vcpu->arch.smstateen_csr;
 	struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
 
@@ -726,10 +727,13 @@ static __always_inline void kvm_riscv_vcpu_swap_in_guest_state(struct kvm_vcpu *
 	vcpu->arch.host_senvcfg = csr_swap(CSR_SENVCFG, csr->senvcfg);
 	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SMSTATEEN))
 		vcpu->arch.host_sstateen0 = csr_swap(CSR_SSTATEEN0, smcsr->sstateen0);
+	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_ZICFISS))
+		csr_write(CSR_SSP, zicficsr->ssp);
 }
 
 static __always_inline void kvm_riscv_vcpu_swap_in_host_state(struct kvm_vcpu *vcpu)
 {
+	struct kvm_vcpu_zicfiss_csr *zicficsr = &vcpu->arch.zicfiss_csr;
 	struct kvm_vcpu_smstateen_csr *smcsr = &vcpu->arch.smstateen_csr;
 	struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
 
@@ -737,6 +741,8 @@ static __always_inline void kvm_riscv_vcpu_swap_in_host_state(struct kvm_vcpu *v
 	csr->senvcfg = csr_swap(CSR_SENVCFG, vcpu->arch.host_senvcfg);
 	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SMSTATEEN))
 		smcsr->sstateen0 = csr_swap(CSR_SSTATEEN0, vcpu->arch.host_sstateen0);
+	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_ZICFISS))
+		zicficsr->ssp = csr_swap(CSR_SSP, 0);
 }
 
 /*
diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index bb920e8923c9..bd59aebc8b2e 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -355,6 +355,44 @@ static int kvm_riscv_vcpu_smstateen_get_csr(struct kvm_vcpu *vcpu,
 	return 0;
 }
 
+static inline int kvm_riscv_vcpu_zicfiss_set_csr(struct kvm_vcpu *vcpu,
+						 unsigned long reg_num,
+						 unsigned long reg_val)
+{
+	struct kvm_vcpu_zicfiss_csr *csr = &vcpu->arch.zicfiss_csr;
+	unsigned long regs_max = sizeof(struct kvm_vcpu_zicfiss_csr) /
+		sizeof(unsigned long);
+
+	if (!riscv_isa_extension_available(vcpu->arch.isa, ZICFISS))
+		return -ENOENT;
+	if (reg_num >= regs_max)
+		return -ENOENT;
+
+	reg_num = array_index_nospec(reg_num, regs_max);
+
+	((unsigned long *)csr)[reg_num] = reg_val;
+	return 0;
+}
+
+static int kvm_riscv_vcpu_zicfiss_get_csr(struct kvm_vcpu *vcpu,
+					  unsigned long reg_num,
+					  unsigned long *out_val)
+{
+	struct kvm_vcpu_zicfiss_csr *csr = &vcpu->arch.zicfiss_csr;
+	unsigned long regs_max = sizeof(struct kvm_vcpu_zicfiss_csr) /
+		sizeof(unsigned long);
+
+	if (!riscv_isa_extension_available(vcpu->arch.isa, ZICFISS))
+		return -ENOENT;
+	if (reg_num >= regs_max)
+		return -ENOENT;
+
+	reg_num = array_index_nospec(reg_num, regs_max);
+
+	*out_val = ((unsigned long *)csr)[reg_num];
+	return 0;
+}
+
 static int kvm_riscv_vcpu_get_reg_csr(struct kvm_vcpu *vcpu,
 				      const struct kvm_one_reg *reg)
 {
@@ -381,6 +419,9 @@ static int kvm_riscv_vcpu_get_reg_csr(struct kvm_vcpu *vcpu,
 	case KVM_REG_RISCV_CSR_SMSTATEEN:
 		rc = kvm_riscv_vcpu_smstateen_get_csr(vcpu, reg_num, &reg_val);
 		break;
+	case KVM_REG_RISCV_CSR_ZICFISS:
+		rc = kvm_riscv_vcpu_zicfiss_get_csr(vcpu, reg_num, &reg_val);
+		break;
 	default:
 		rc = -ENOENT;
 		break;
@@ -423,6 +464,9 @@ static int kvm_riscv_vcpu_set_reg_csr(struct kvm_vcpu *vcpu,
 	case KVM_REG_RISCV_CSR_SMSTATEEN:
 		rc = kvm_riscv_vcpu_smstateen_set_csr(vcpu, reg_num, reg_val);
 		break;
+	case KVM_REG_RISCV_CSR_ZICFISS:
+		rc = kvm_riscv_vcpu_zicfiss_set_csr(vcpu, reg_num, reg_val);
+		break;
 	default:
 		rc = -ENOENT;
 		break;
@@ -688,7 +732,7 @@ static int copy_csr_reg_indices(const struct kvm_vcpu *vcpu,
 				u64 __user *uindices)
 {
 	int n1 = sizeof(struct kvm_riscv_csr) / sizeof(unsigned long);
-	int n2 = 0, n3 = 0;
+	int n2 = 0, n3 = 0, n4 = 0;
 
 	/* copy general csr regs */
 	for (int i = 0; i < n1; i++) {
@@ -740,7 +784,25 @@ static int copy_csr_reg_indices(const struct kvm_vcpu *vcpu,
 		}
 	}
 
-	return n1 + n2 + n3;
+	/* copy Zicfiss csr regs */
+	if (riscv_isa_extension_available(vcpu->arch.isa, ZICFISS)) {
+		n4 = sizeof(struct kvm_riscv_zicfiss_csr) / sizeof(unsigned long);
+
+		for (int i = 0; i < n4; i++) {
+			u64 size = IS_ENABLED(CONFIG_32BIT) ?
+				   KVM_REG_SIZE_U32 : KVM_REG_SIZE_U64;
+			u64 reg = KVM_REG_RISCV | size | KVM_REG_RISCV_CSR |
+					  KVM_REG_RISCV_CSR_ZICFISS | i;
+
+			if (uindices) {
+				if (put_user(reg, uindices))
+					return -EFAULT;
+				uindices++;
+			}
+		}
+	}
+
+	return n1 + n2 + n3 + n4;
 }
 
 static inline unsigned long num_timer_regs(void)
-- 
2.54.0

