Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A962980A8
	for <linux-kselftest@vger.kernel.org>; Sun,  7 Jun 2026 08:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780819901; cv=none; b=Yidmc/J7tNsQr/7fWR20Jzbw6Q58n3/DmyHWXAzr4PY6igQj9xjq3aiupxxuci9dk8DTep6YJGEUCHv2/S/9fFzbHZtnsBLtUDNGAcnLcQChdm1DqeL9WLaL1aviNrG1zc5c/exgmKJjtIt+4D7bfgwmywJ+iafu1a69KOUHLZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780819901; c=relaxed/simple;
	bh=uyn2dNJyA4cKjLwp4vVfaQAL8UBMIpfWld1+6gZkZTo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YWVM79hteuetcoyKNyJv7XNMt9gJpr571hYtq6/G9whuEHmuxpqiQhUVBKoahO+m54YrH0KX08QTkLyZpAA+/lEJddvmaBft6GtYH8mT4e3c+XpwvqffAUtMnFX8lECkrdZkuttgBHFIA09cHErwFIwOFiug5mtH0GgidPIRct0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GCj7hlrh; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GCj7hlrh"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-84234c83142so1301834b3a.1
        for <linux-kselftest@vger.kernel.org>; Sun, 07 Jun 2026 01:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780819896; x=1781424696; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yx3cr1sKd9IkeONfNrG9dwv6CzzoeR2u5J6twX8ldLE=;
        b=GCj7hlrhK15FjMagzLIkGUUH8ThFLX8xdczEtE4vQKjTthRqPvET9D2wVFP218hFrP
         5pcSGleLmmo0aQI7UuZiFe0kx/ppOdOVN9pEapl1CevIsHtr2tUoAGquXv7FZEsrxCL6
         xlx55gxQ6wu4si2SHc9V7LgCrBHJ/9qJou2vmRCZRN5uObhy3h4VMe00fM1B/bSXs+EA
         BgwCVpAyuDDKC65yBhPwaMPviNKeH3p3JuZAOiOJlG2roW/7yRkhwquwoT5Rs/VxWLoz
         mDYD//umzZZqn9PumBUnAwKK5JSGsZsMWd8cPpAjie/bzQj1SHLYHD+7lkRRzPhni/sF
         7i6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780819896; x=1781424696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Yx3cr1sKd9IkeONfNrG9dwv6CzzoeR2u5J6twX8ldLE=;
        b=Pam94+fkSzZm4SgM5ZJQxm6qRKsp0KkXUB02kmtSVEXL1yy389X5s1A/g+vbytJbt0
         jy3JdnWXVH5l3o75Hiqyf/potZY7U2qGhd7BCHwYbgf2Tiv0QspgKL5YOLH926JqHtct
         hK+u9RxOYhvafWFG/tN0II4PVOvF7XqmC+uQhhucG/TmEnP4CpSsNSC3HoSbNrmLSetq
         Y4z1p3lGLXLxDXyFepuyANiXO5MJDNjtkzATU50NwPzq1jKndWh5anxD/00XXJpH3YlY
         bGDk4SJvVzOk174bBzokcfnxz1XETSpLPfHOakFQkqeQXPictClGtxpMamxjxMF15030
         eTMg==
X-Forwarded-Encrypted: i=1; AFNElJ8mZw+ybZMnOEBcZHcsyuUweM32xbSZJDN0sx8BaX7N5Sjezz3cSJEimpT6LJvT8/pOlAs89GEK7XWbrg94cp0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+laLz3ST93RBoi8LpBmloIHDt4Deh+AyRLMax9nKMok65bISa
	C9k7tPAB0OiPJDE7yTAHr2QhjbGykeaiggLv709Wd119EtuBruJ2wfra
X-Gm-Gg: Acq92OF1afmSOKauJwLrfaGQaLbaA5P9Tf8Xiev9mghDY3Z6f4M6FrPw8ZQxi/y3t1x
	bfaxPm+0Z3rFYHP42iSv9ny9SCxczJpLJfojpjOUcx1mW60e31YLIzy3wJsF12eqxlg5cytsovG
	a3HDdQ+fEU9WkRhuJvxurWoUIJD5ZohfHwCu6RwWsvKxzVxT9OcVMZvC53eaoJSTSgmpg6PiEkg
	hqTRqWPIkoFB0wVeVg4C/Dxb22TmiATgmv6NAUtwUAizaFG08Cpa+5cEQfHDNo1iaMfhndBxz9S
	1V4kcHpCwdWt0MMj5GblAmTWeBL3dhKAo50Eo/gid6hkOxYokHWeRgSnAh2HwbtqxpFmoytx2N8
	RhCb0XrhrMdZFwI3CYKOEHnU1t5hrqaZyOQoOm1kIEHL/p/smiLC8vb1aKzh0tNCIFSG98AhbC3
	iohuW4zQlC0NnZWhPtiYN4UP2cd3Vhy4g2Uw==
X-Received: by 2002:a05:6a00:928a:b0:842:5a8d:3036 with SMTP id d2e1a72fcca58-842b0fb6e13mr10610810b3a.35.1780819896276;
        Sun, 07 Jun 2026 01:11:36 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428221c3e4sm14946343b3a.5.2026.06.07.01.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 01:11:36 -0700 (PDT)
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
	Longbin Li <looong.bin@gmail.com>,
	Quan Zhou <zhouquan@iscas.ac.cn>
Subject: [PATCH v3 8/8] KVM: riscv: selftests: add Zicfiss/Zicfilp extension to get-reg-list test
Date: Sun,  7 Jun 2026 16:11:04 +0800
Message-ID: <20260607081105.993908-9-inochiama@gmail.com>
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

The KVM RISC-V allows Zicfiss/Zicfilp extensions for Guest/VM so
add these extensions to get-reg-list test.

Assisted-by: YuanSheng:claude-4.7-opus
Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../selftests/kvm/riscv/get-reg-list.c        | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
index 94e33b2ee796..5963f62ce730 100644
--- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
+++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
@@ -90,6 +90,8 @@ bool filter_reg(__u64 reg)
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICBOP:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICBOZ:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICCRSE:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICFILP:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICFISS:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICNTR:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICOND:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICSR:
@@ -358,6 +360,8 @@ static const char *core_id_to_str(const char *prefix, __u64 id)
 	"KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CSR_REG(" #csr ")"
 #define RISCV_CSR_SMSTATEEN(csr) \
 	"KVM_REG_RISCV_CSR_SMSTATEEN | KVM_REG_RISCV_CSR_REG(" #csr ")"
+#define RISCV_CSR_ZICFISS(csr) \
+	"KVM_REG_RISCV_CSR_ZICFISS | KVM_REG_RISCV_CSR_REG(" #csr ")"
 
 static const char *general_csr_id_to_str(__u64 reg_off)
 {
@@ -425,6 +429,18 @@ static const char *smstateen_csr_id_to_str(__u64 reg_off)
 	return NULL;
 }
 
+static const char *zicfiss_csr_id_to_str(__u64 reg_off)
+{
+	/* reg_off is the offset into struct kvm_riscv_cfi_csr */
+	switch (reg_off) {
+	case KVM_REG_RISCV_CSR_ZICFISS_REG(ssp):
+		return RISCV_CSR_ZICFISS(ssp);
+	}
+
+	TEST_FAIL("Unknown zicfiss csr reg: 0x%llx", reg_off);
+	return NULL;
+}
+
 static const char *csr_id_to_str(const char *prefix, __u64 id)
 {
 	__u64 reg_off = id & ~(REG_MASK | KVM_REG_RISCV_CSR);
@@ -441,6 +457,8 @@ static const char *csr_id_to_str(const char *prefix, __u64 id)
 		return aia_csr_id_to_str(reg_off);
 	case KVM_REG_RISCV_CSR_SMSTATEEN:
 		return smstateen_csr_id_to_str(reg_off);
+	case KVM_REG_RISCV_CSR_ZICFISS:
+		return zicfiss_csr_id_to_str(reg_off);
 	}
 
 	return strdup_printf("%lld | %lld /* UNKNOWN */", reg_subtype, reg_off);
@@ -585,6 +603,8 @@ static const char *isa_ext_single_id_to_str(__u64 reg_off)
 		KVM_ISA_EXT_ARR(ZICBOP),
 		KVM_ISA_EXT_ARR(ZICBOZ),
 		KVM_ISA_EXT_ARR(ZICCRSE),
+		KVM_ISA_EXT_ARR(ZICFILP),
+		KVM_ISA_EXT_ARR(ZICFISS),
 		KVM_ISA_EXT_ARR(ZICNTR),
 		KVM_ISA_EXT_ARR(ZICOND),
 		KVM_ISA_EXT_ARR(ZICSR),
@@ -748,6 +768,12 @@ static const char *sbi_fwft_id_to_str(__u64 reg_off)
 	case 6: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pte_ad_hw_updating.enable)";
 	case 7: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pte_ad_hw_updating.flags)";
 	case 8: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pte_ad_hw_updating.value)";
+	case 9: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(landing_pad.enable)";
+	case 10: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(landing_pad.flags)";
+	case 11: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(landing_pad.value)";
+	case 12: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(shadow_stack.enable)";
+	case 13: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(shadow_stack.flags)";
+	case 14: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(shadow_stack.value)";
 	}
 	return strdup_printf("KVM_REG_RISCV_SBI_FWFT | %lld /* UNKNOWN */", reg_off);
 }
@@ -954,6 +980,18 @@ static __u64 sbi_fwft_pte_ad_hw_updating_regs[] = {
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pte_ad_hw_updating.value),
 };
 
+static __u64 sbi_fwft_landing_pad_regs[] = {
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(landing_pad.enable),
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(landing_pad.flags),
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(landing_pad.value),
+};
+
+static __u64 sbi_fwft_shadow_stack_regs[] = {
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(shadow_stack.enable),
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(shadow_stack.flags),
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(shadow_stack.value),
+};
+
 static __u64 zicbom_regs[] = {
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_CONFIG | KVM_REG_RISCV_CONFIG_REG(zicbom_block_size),
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICBOM,
@@ -969,6 +1007,11 @@ static __u64 zicboz_regs[] = {
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICBOZ,
 };
 
+static __u64 zicfiss_regs[] = {
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_ZICFISS | KVM_REG_RISCV_CSR_ZICFISS_REG(ssp),
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICFISS,
+};
+
 static __u64 aia_regs[] = {
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CSR_AIA_REG(siselect),
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CSR_AIA_REG(iprio1),
@@ -1220,6 +1263,8 @@ KVM_ISA_EXT_SUBLIST_CONFIG(zicbom, ZICBOM);
 KVM_ISA_EXT_SUBLIST_CONFIG(zicbop, ZICBOP);
 KVM_ISA_EXT_SUBLIST_CONFIG(zicboz, ZICBOZ);
 KVM_ISA_EXT_SIMPLE_CONFIG(ziccrse, ZICCRSE);
+KVM_ISA_EXT_SIMPLE_CONFIG(zicfilp, ZICFILP);
+KVM_ISA_EXT_SUBLIST_CONFIG(zicfiss, ZICFISS);
 KVM_ISA_EXT_SIMPLE_CONFIG(zicntr, ZICNTR);
 KVM_ISA_EXT_SIMPLE_CONFIG(zicond, ZICOND);
 KVM_ISA_EXT_SIMPLE_CONFIG(zicsr, ZICSR);
@@ -1279,6 +1324,24 @@ static struct vcpu_reg_list config_sbi_fwft_pte_ad_hw_updating = {
 	},
 };
 
+static struct vcpu_reg_list config_sbi_fwft_landing_pad = {
+	.sublists = {
+		SUBLIST_BASE,
+		SUBLIST_ISA(zicfilp, ZICFILP),
+		SUBLIST_SBI(fwft_landing_pad, FWFT),
+		{0},
+	},
+};
+
+static struct vcpu_reg_list config_sbi_fwft_shadow_stack = {
+	.sublists = {
+		SUBLIST_BASE,
+		SUBLIST_ISA(zicfiss, ZICFISS),
+		SUBLIST_SBI(fwft_shadow_stack, FWFT),
+		{0},
+	},
+};
+
 struct vcpu_reg_list *vcpu_configs[] = {
 	&config_sbi_base,
 	&config_sbi_sta,
@@ -1289,6 +1352,8 @@ struct vcpu_reg_list *vcpu_configs[] = {
 	&config_sbi_fwft_misaligned_deleg,
 	&config_sbi_fwft_pointer_masking,
 	&config_sbi_fwft_pte_ad_hw_updating,
+	&config_sbi_fwft_landing_pad,
+	&config_sbi_fwft_shadow_stack,
 	&config_aia,
 	&config_fp_f,
 	&config_fp_d,
@@ -1332,6 +1397,8 @@ struct vcpu_reg_list *vcpu_configs[] = {
 	&config_zicbop,
 	&config_zicboz,
 	&config_ziccrse,
+	&config_zicfilp,
+	&config_zicfiss,
 	&config_zicntr,
 	&config_zicond,
 	&config_zicsr,
-- 
2.54.0

