Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD5F36EA9F
	for <linux-kselftest@vger.kernel.org>; Sun,  7 Jun 2026 08:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780819884; cv=none; b=HXT0pdIkbudyoJmEEZgx6DVWtHTq8DGN5mjMqn6APvolvLiux3Ahq5+Ig7OPVBQq5z0FIRBwx7BN+EFpmqQ0PWjNnanxJ+2SzvsiP1V3sppttuG9j4MUWeT6o4hHT/+deA3rI8eDwaPhVlEXBCXngypSNR2t2Tyl604c9+6fzc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780819884; c=relaxed/simple;
	bh=P9oXlIsV+MegZELpI7GDef37LAa8lF8oXfLkAh3JFiQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yjnbnb1kLuDqBoD458cgCGJ82J/H1QOCb/OqTnVdWfQo3o7lAqlnnRQCUYGWmwrWwhBHsbVEX+lNhVM+nCtu1es4/8B3FOwnOJwGpunR7Utki1TGzRItAG0R4ON9cRCNGe/7rm45AuYu4SRQ70t1/CFSeELmFdfYeoW2iKdYvVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nK3bZgLz; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nK3bZgLz"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2c0c1e0b0faso22682285ad.0
        for <linux-kselftest@vger.kernel.org>; Sun, 07 Jun 2026 01:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780819882; x=1781424682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nysJeNyvG9UILI1DFzn2wsHy9N8jdjLD2gqQX3bP48I=;
        b=nK3bZgLzyge5RA37eHJ1QWVS4JOoDjJLI8mak1XkmONAPMuaDgxaiSx2sK8ckO8So1
         ggKwguGMpZiRVYiicPcIE77CJIO31dQQQGIQtHL2hpid+22ewF8xv1dqobBW8NJ8ZBF6
         K2nr8cB42mE/Icm7g/TksWm+rGe7YYddDDNwR2j4M4SW8WrBcl1+bLwgVxukbTwYzpNY
         TN6OAqEEffJHqtH2ZeYkCfV0ZsRgGZZnDiEiYXy0fm/cy4CCgJusarWGomzXVBg9tdkR
         0+8EhnhTngJ/YwAKjw9yH4aDT/m7GFJiS4yF8vLLfDzcKxB6UalGoKH+paj8dGUC4048
         71sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780819882; x=1781424682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nysJeNyvG9UILI1DFzn2wsHy9N8jdjLD2gqQX3bP48I=;
        b=UubdP7RngchC+iGkxRyDQ87v6wk4LlyhCUIzlSjDjkReSLlliMG/VDx/2jHX5Wgt0E
         EhmkK4eUx55Bv3b+iHEJwSSaEoG+ZzznPk+dwdPSJfc6iA2vFfO99ziP1tqtchqsvllD
         UQ4lO+N51gx/f5zcKJgFwR+xK+ijQs52unMsrPSXllPStXn6t2et88smBsoZw9yJx8W+
         zJ+WTM0hblyZPpYBVq/iq0gi63A+RiFqsRycGLoLufvlJlmFkuK9kFJnJJfMlvwojlTq
         FQ0bCr1I0wY9SWHGOE2/QLfGON+qx5DOWPUHhTbLAukYx/ojdy9FP03yF1pwnRXPMxwc
         tpkQ==
X-Forwarded-Encrypted: i=1; AFNElJ9KYTo3lCyGgYFm9bwcrlzee983MVDXPI8km4Qu+mE6D0gDlwYtGUD/rmT4n8upTtQMUymRsAq3JjG8/E/NsV0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlMIxH23/5UIzgiADJBo2PQYNKeHMo3DIwDFuzbFKa/WpXHTeU
	s2qZ4BOYbl+cHZfN4vnuaLytobUgyL6GeLGPITHQQx0us9dhbRqveTFO
X-Gm-Gg: Acq92OEEaMRA/MPFwLgfGPzxlzh1xYzKdNEXbB86yqbXJHRo0L57GcVqn9gb28Exh4m
	OPHHrFQTIOfeCdtHib8m1Vzpw96mLcaT5Qj7r4Gx90PNtiTOxbPNNqhJfOznjqwRmjcgB4OMGGu
	foURC74NNbVyZ6aPGovW4iWkPmZ4ZPLut8IGTQbadSALqarY/mNDaijFZmQbMUCER1XiSKVDPc3
	3lIjOsEGh8JEM68AG+tkYWKV4hoTZbXHzM77ygp4ihvXIMhicRQSo32ClVVGbOfu8VdCeOruWrH
	WSdDHD1Kmk60z+Yb48bZOiSVGqxujNBT8pO7lQr+WyFkaU9I1dh0jC6iLGOxHW2v2EDCOwxpcif
	FYgbWhTwy0PMOtqaWwvRwFG1O83k/XSFk1BmjObwKZYE21e7pKe6I1DURFMc9JgNShGxrJ6LSAr
	4ruYInWKYOLCzbabUSqwbsB/zxu2lraOKpHQ==
X-Received: by 2002:a17:903:2987:b0:2c1:88a1:9830 with SMTP id d9443c01a7336-2c1e7e74ecamr126056945ad.17.1780819881941;
        Sun, 07 Jun 2026 01:11:21 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c24edbb49bsm15223135ad.38.2026.06.07.01.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 01:11:21 -0700 (PDT)
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
Subject: [PATCH v3 2/8] KVM: riscv: selftests: add Svadu FWFT extension to get-reg-list test
Date: Sun,  7 Jun 2026 16:10:58 +0800
Message-ID: <20260607081105.993908-3-inochiama@gmail.com>
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

The KVM RISC-V allows Svadu FWFT for Guest/VM so add this extension
to get-reg-list test.

Assisted-by: YuanSheng:claude-4.7-opus
Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../selftests/kvm/riscv/get-reg-list.c        | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
index cb86cb6b3635..94e33b2ee796 100644
--- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
+++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
@@ -745,6 +745,9 @@ static const char *sbi_fwft_id_to_str(__u64 reg_off)
 	case 3: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pointer_masking.enable)";
 	case 4: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pointer_masking.flags)";
 	case 5: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pointer_masking.value)";
+	case 6: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pte_ad_hw_updating.enable)";
+	case 7: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pte_ad_hw_updating.flags)";
+	case 8: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pte_ad_hw_updating.value)";
 	}
 	return strdup_printf("KVM_REG_RISCV_SBI_FWFT | %lld /* UNKNOWN */", reg_off);
 }
@@ -944,6 +947,13 @@ static __u64 sbi_fwft_pointer_masking_regs[] = {
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pointer_masking.value),
 };
 
+static __u64 sbi_fwft_pte_ad_hw_updating_regs[] = {
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_FWFT,
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pte_ad_hw_updating.enable),
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pte_ad_hw_updating.flags),
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pte_ad_hw_updating.value),
+};
+
 static __u64 zicbom_regs[] = {
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_CONFIG | KVM_REG_RISCV_CONFIG_REG(zicbom_block_size),
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICBOM,
@@ -1259,6 +1269,16 @@ static struct vcpu_reg_list config_sbi_fwft_pointer_masking = {
 	},
 };
 
+static struct vcpu_reg_list config_sbi_fwft_pte_ad_hw_updating = {
+	.sublists = {
+		SUBLIST_BASE,
+		SUBLIST_ISA(svade, SVADE),
+		SUBLIST_ISA(svadu, SVADU),
+		SUBLIST_SBI(fwft_pte_ad_hw_updating, FWFT),
+		{0},
+	},
+};
+
 struct vcpu_reg_list *vcpu_configs[] = {
 	&config_sbi_base,
 	&config_sbi_sta,
@@ -1268,6 +1288,7 @@ struct vcpu_reg_list *vcpu_configs[] = {
 	&config_sbi_mpxy,
 	&config_sbi_fwft_misaligned_deleg,
 	&config_sbi_fwft_pointer_masking,
+	&config_sbi_fwft_pte_ad_hw_updating,
 	&config_aia,
 	&config_fp_f,
 	&config_fp_d,
-- 
2.54.0

