Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ADB53644CA
	for <linux-kselftest@vger.kernel.org>; Wed,  1 Jul 2026 02:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782871703; cv=none; b=hodCIVhJHJKWPTtGL4d55AJsDi+2OBFaR9fnGYNOyyPgx7wFzK8u/4PLMWtv43GjuEKhdWhL/8jLKVyHk8vvrwzLSCjMKsPQQwK7AZyNzS7/80y6zk0f1HJOPTciEUo4D7XuOqYx8cif78lfO8q87fSdLwXA89iBvSq9o3KIKKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782871703; c=relaxed/simple;
	bh=jKX7yCJzLXTBm7/RoRGPTwNXXmYDIrIjrn7OXhM9jJQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GeLqv5KwgDMaBJzvalALNt9ai4VDLrbhM4Vp/+FdIgMNDaKk3bxBt+07szO34gdB5CVgbo7SELbFEFYz//ubV8oqyg1h3ODGlPg3khG9yRfq/TOeBWqy5C8/jJH0QtCha2futdDEbwwdJ+wy9x3WpxvtKx/c1iOOQwT58RRc6Gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iIsCrXe3; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iIsCrXe3"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-37fb434c547so89337a91.0
        for <linux-kselftest@vger.kernel.org>; Tue, 30 Jun 2026 19:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782871700; x=1783476500; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MI4l7nifRnfxUSWJkRHmALVeDUyVcPjbpLqiu+zme2g=;
        b=iIsCrXe3VnO3v4l0dxWS8me0huAeTpkN0yis0L7smQJfK/hpHppmy/nw4Vsr6USv8L
         GCF1cV30rovv90VhDRP5lintAprqoX3EL+2UANC3is4KL5rWyY+jxBH68MIgrnZavpFD
         QKopcUf2KZzJvzy4IvR0ppm5f6zZn/pmm7+6n3PhlNAQ9KDxkIyRwKKN7o4l9CQTjEb3
         Njjqxw3cYvgHx2/8p1WjAdNyXMO95LIRU42H8RfaK1vpyNtS6UEPIT7u5Eft6Y83twle
         eraphhNJ5D7iAjVDxVWAPdCfxTyH9jQY0en97NmWTRU6pWTy35kIEoVRheG9MHt+Ph1u
         5K4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782871700; x=1783476500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MI4l7nifRnfxUSWJkRHmALVeDUyVcPjbpLqiu+zme2g=;
        b=Jfer0voePWRLuS9N0W1i2XTWOmPlA63NpZGL34q9qxwkCPotxUq5BIPBkJaqOd0Y2j
         0lmthUE9PRHo2tLvGH3nd3yoORb4ppDaOzbcS9y19+spx7AcUvd1VaT1TAXOV1ccjyBJ
         6VrKbt83Vn5syI+ZKRjEh1+luRM7JtrRz31gda0bxvFNVpN+xw+Hpz4CBc2cdE3JubOq
         CcGY2lIrG0gx9mEBkxbxyeLvzOb/VSchd1sTGdW5ltBmAj6K2+bqnvqXEo6Af7QS2er2
         1dabfIBcLpTq8MqWEnTR4Fyuu+hjRNT7zMt9aFLdrTkSwqD+2qhSqy0PbtMC5khPCzWk
         TIoQ==
X-Forwarded-Encrypted: i=1; AHgh+RonpjWPHATT5X1ABBQ8c7RqARwgXDVPTOyCkf2Mt5nBC/gdY6z2uLc48/Tyxl8MqNStgMNkZO6maJrK7wjzdGk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yywx77wNPpPxxMv7SQfnfZF9VuNizQXOT28cj0FFrrEbAEqqv9b
	f3k3DRT+Jw5JThOgGbZM4cNzupExPVlDYJ9oGgSOP72qQllzgr/NSnmd
X-Gm-Gg: AfdE7cnbHx9tHHkEGc/ylZCXM9IvsOLzeRnHN0zCz9/OLfxOo6gDrE/Wfj6qgcHNgEV
	0tMx25jGVbgiPSKqC3FmNu5JZ2SNGhyKe5WNJTxHxOt3xZ4mAlPOjKZswz5Clfdn8pTXl+oluSl
	L+8NVe/UzyA+cLKlruGo4L8STaj9Ougg6sOldWb3V06ahJAFoiJZKxA4s3JV2o5NDzLc8VyDeC3
	mcQKM2UyQ8XEGMUSOJGmZshPtyiqXeRkqSl0l7PTL7yghstak+amFbsBbDApgkfHvhUGnX9ij1L
	yxOkg1rWgWuGUWtPhTDWQrDbrws9dKDI4oU5UterOKcYAsn+VFs5IZHLMVh8i4iCNjQUegG7HeT
	XiRKEKV94yyLBxAQsK4aqozcJCPSe7mG0zv99a9SdTIIlXMsFyBBjixkAe7aNuvgb73/xk3Oxsl
	C8GIiA8wJTqTc=
X-Received: by 2002:a17:90b:5204:b0:37f:bfa2:1887 with SMTP id 98e67ed59e1d1-3808bd62c54mr2410952a91.8.1782871700388;
        Tue, 30 Jun 2026 19:08:20 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3809645185dsm801518a91.15.2026.06.30.19.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 19:08:19 -0700 (PDT)
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
	Longbin Li <looong.bin@gmail.com>,
	Quan Zhou <zhouquan@iscas.ac.cn>
Subject: [PATCH v4 2/8] KVM: riscv: selftests: add Svadu FWFT extension to get-reg-list test
Date: Wed,  1 Jul 2026 10:07:39 +0800
Message-ID: <20260701020746.170157-3-inochiama@gmail.com>
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
2.55.0

