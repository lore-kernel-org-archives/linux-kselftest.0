Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC812363C51
	for <linux-kselftest@vger.kernel.org>; Wed,  1 Jul 2026 02:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782871708; cv=none; b=fPQyqLXC6lgxT0ih6O8KTBc1cqpvVNXN/5bjxJsqZ04MCADPMh9JV0Xf9oKvm+T+Y59Ix0jUiBQtkKr5Y7e60Uu1h/cMKE+WnrfSHJFTpbu43ayRM6eWDg/L15ltldYMKNlk+qS2lO8S0pp3eX25YEGp7e4ffxyDZz6xC3pWIbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782871708; c=relaxed/simple;
	bh=gb7mClz1iPsHmV7fvbk1TP28extSjFKf5tZQu5KcDr4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JIuhk52UlumsWIHRwjTbj1HfhRwUw7ul9e9WEQcOs4NeSHjMTxonDFolRXpB+RUT1wZLrWkbxIgZB8NyRD5gwiu4la8hpdx85K5aSNZ7ZM2D0QQF24YoEQYQNYfoAu8sHFNah9HoLEs7r0ylTo+tJ59wL4OMdosnAmepl1MFtO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RsXYqNJs; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RsXYqNJs"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2c9878bbe88so5675935ad.0
        for <linux-kselftest@vger.kernel.org>; Tue, 30 Jun 2026 19:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782871706; x=1783476506; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UUgRqFJ2BhFN++AYCVLW2I69ezDqz+uAsqdfUKNMzHE=;
        b=RsXYqNJsfX2LXMN5cn5d0H7Duq7FBw29arA+wfoeOtn/uH2pPIl77LqyQ2ZN5jwjlk
         Re95hoq/cPTtI60vqvtruAarfgr1vDaI+9j8jNaovPadgNyHPyaUgRdiawPdZzEFVHAT
         3YJDMg1XW/9jECbF0hW2gpGj7cL7rri7VCh7Si01ewKBJ5oeC4AYDbnMzonBWUSusWA6
         JyZp+93coxLrNRnPle//YQWj6VmEcswInV71OunMtP0m+1R3i9wt39dQ6PCAAPLBx4SX
         Kno7L7DAnhTYTFPQJKIIsKGus4f7wm6xf7eGJC/VDhs0x5bHJSZxY9/acBvkXaHTO71s
         B06Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782871706; x=1783476506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UUgRqFJ2BhFN++AYCVLW2I69ezDqz+uAsqdfUKNMzHE=;
        b=MERzhjYZ7NkiVCrs8a1RG92q8axLFRnizKbH2cT/q09GJLzGELsbq+Z1RlfzMcz9/n
         btOxfjkmbhXKN66+vY0RoANvQCb1hNH2idBChvEhEKQLXuXniJD/IRai7nfIZLBP/hlT
         n3EXVjKnN9isdgJnaUtKweq8czuud6kEYjLf37vE5NAeDU27zXBJIYQ6OT3lI0ZbxyU1
         dkz7N8v3BolqyRujddY+eFqflMxNnUciIUtIIoMy9CsqAA1S+tRysG6RGPxs+52A/96h
         ubu8GflIO/4N8WqwykslK1sg86DqL0cfpKIJQtDCzb+wUC1JQ/2wQB8LSs07aY7x+e7w
         +xyA==
X-Forwarded-Encrypted: i=1; AHgh+RrxgjgNnOIGxvBjug0E235km4UdXiODc8Cror438KvUSbC6J78VBSrXzkQ4VXEIfOyHlPe35iFnSWTNWfe4XTU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwibX00jbKnZA+vLEFDLPeULhArjQbPlLvcG3Fio3sSSYNQUdaf
	rBQGdC8csg9o+UvuuT3MFAlMutUp9XSZchWxqqNkrQO6mc0is2Hy1mNE
X-Gm-Gg: AfdE7cmBpVuYRqMBuRCuRL1fYkZTUKvqAJ2NmIkw1s/J7DX+Udf++JQIL0LzZTGv+08
	y7yWdp7Owwz2MmCKaywskTOPM5GpfGw2bbe+rpriv+qkHg3r1eYI6NQ1Uga3QkY40nGXEWVHiS7
	/vymi+Mr/d+fnYTMIg0FlBLdOAdMUfCj6HWdkU7BdBEGada0DqJXXS53ZbIPwsRSZ749+EyH/k3
	5tj584dYtFLKwXCrMLutnLxuxWGlnee2ROhdvnFgafDAYGLPUdAW0w8m1dl3+vviw/iiW1muXWG
	LJGOvsuYpJw2VSvE/jyH6DKvMwwQpN7JoTU8xcF2GXisQbJhx2kNLWYcWl0ZzKew8d92WJHoZII
	Bt7UjKHLmmGoFkfcay4Clqcnc4N5mXRz6YWarE3lDky8CxFZi3OOO4ur/6PTmo/rUBteRwONH+0
	5H7XYnN5pryEM=
X-Received: by 2002:a17:902:e749:b0:2ca:6bb:30fe with SMTP id d9443c01a7336-2ca449fcc45mr29959045ad.20.1782871705882;
        Tue, 30 Jun 2026 19:08:25 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca3828c8e8sm22855905ad.42.2026.06.30.19.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 19:08:25 -0700 (PDT)
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
	Sergey Matyukevich <geomatsi@gmail.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Andy Chiu <andybnac@gmail.com>,
	Deepak Gupta <debug@rivosinc.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v4 4/8] RISC-V: KVM: Add ssp context save/restore
Date: Wed,  1 Jul 2026 10:07:41 +0800
Message-ID: <20260701020746.170157-5-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260701020746.170157-1-inochiama@gmail.com>
References: <20260701020746.170157-1-inochiama@gmail.com>
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
index 60017ceec9d2..e5ed3b0e5a55 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -163,6 +163,10 @@ struct kvm_vcpu_smstateen_csr {
 	unsigned long sstateen0;
 };
 
+struct kvm_vcpu_zicfiss_csr {
+	unsigned long ssp;
+};
+
 struct kvm_vcpu_reset_state {
 	spinlock_t lock;
 	unsigned long pc;
@@ -203,6 +207,9 @@ struct kvm_vcpu_arch {
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
index cf6e231e76e2..1c2775a4834e 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -720,6 +720,7 @@ static void kvm_riscv_update_hvip(struct kvm_vcpu *vcpu)
 
 static __always_inline void kvm_riscv_vcpu_swap_in_guest_state(struct kvm_vcpu *vcpu)
 {
+	struct kvm_vcpu_zicfiss_csr *zicficsr = &vcpu->arch.zicfiss_csr;
 	struct kvm_vcpu_smstateen_csr *smcsr = &vcpu->arch.smstateen_csr;
 	struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
 
@@ -727,10 +728,13 @@ static __always_inline void kvm_riscv_vcpu_swap_in_guest_state(struct kvm_vcpu *
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
 
@@ -738,6 +742,8 @@ static __always_inline void kvm_riscv_vcpu_swap_in_host_state(struct kvm_vcpu *v
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
2.55.0

