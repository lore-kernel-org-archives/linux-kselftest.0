Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186E0280329
	for <linux-kselftest@vger.kernel.org>; Wed, 27 May 2026 05:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779861187; cv=none; b=r5VO4qquUePnvpHzWSaDbCUW/5r6hGCS+22C1GUq0lx7ROCLwJhnQvZtL3zojgSTR24HPAI4A0dGBkFHZu2Kf1NjAAZ5oqwbyqE6nTQRYawxWfvBBSld6qhRKS8/92VVTJ7U26h/R5TBhlIJ8RVkcCmMZlqOwnQHB7l3+MxdMKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779861187; c=relaxed/simple;
	bh=4DPizMp5c9ZYd5J6eYtnzgZrFa5iDZWYGDJjDrKQguI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mx94iixjsR4WS/jqfn/SJWSEIFNqg3Bx+4f1AfpV3EsVftRXt5Cdyh8OX/T16xsnlXtjlPntfa1yLOJ/EveqgYNtJb4AjuiNJB/2vhE6FV10sExELC0j1Pl7PWBHyJM99W4312KimhfrN3bihYWQqAupWhhP4KrCIBbGUxF5csQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=QDU4CIuO; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="QDU4CIuO"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2ef2a1cc06dso4231064eec.0
        for <linux-kselftest@vger.kernel.org>; Tue, 26 May 2026 22:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1779861183; x=1780465983; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xXN4gEKCKsU7orTDwjAmupylz86Cq+DRK2X72vksDBs=;
        b=QDU4CIuO7gvMZMqW6+S+tcanAAobhkTZoWgUc1iP0QtiqtCkf0yzez4EBNq0eDA5vb
         v8iN8Puaqmdu36vQXQ302yb9yim4aFj9TIsW3Q4QDIJ+IVrNcBRUjmgxEUXWHrd8kZKG
         kNyXyyeRcWQLkYXoVG7rn76wL9y8c/Hvg2T0iRbvMhMIvbIJ17O2QARXtolyf0XNcoJz
         p1U78LB+bhtOTudyzKdd/BTuTSicv1GLQYwTRc0Iv0V291CQi+thA1734W79ph3wF6oa
         n9jiTLGCeoqWPXPwtB6wZlQI83bRDdfcDwjCmpH6Bmi4NMtxLNVVIGg+yXftPgcxEvvs
         6IyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779861183; x=1780465983;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xXN4gEKCKsU7orTDwjAmupylz86Cq+DRK2X72vksDBs=;
        b=O9MXoZqD4QIcKF/hNSNa7HZjaz5rzfVygVxrCjIHCa8SPekRDPs0GynDGC27LY7jH+
         w5qwiGnuXIuFteqCuO4P2SElx5jI2gwkuNVEfrI09MBSCDbb9CIlXgcF3vPnCJFxn4HS
         GeZazztBfOodCYrtdoJ+KzgWg+2T6Xgr3qDctMOaypqc5smMDsqNqkqSfdxFFf+T0HUX
         4Yq4LTqzxIuITUUFmhVzkPsnnN5Wn6iIbEt3CdxyGK0zP55IiIPSCg8P7nTO+tc2evtH
         g/SR78YSVfGXhZ5E4g0qp/nArIDQBgcwhTVxKtkLE6KKjsLxYLSFk6xi25YkK6p0BMoI
         DnDA==
X-Forwarded-Encrypted: i=1; AFNElJ+WpYnp5BwSmhT6IsYfYy3Rem77RGzpoxUdqRqSBf0wr6byHtTq/Q96CNusDniUZJMpS2T+JWjk4pLocGiEfec=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyv+t5Nb/FXK8wy9+t5jFkcFtaweEoS7n4XdUZSg5JaD6fXviUe
	jJbtk8qsdaByG4ndKYK23tFQyE5j3IJYprLfEiCLwOd06zusx7zOJqkW2je3RcEFJNwQkcyXuLd
	70hbkCNA=
X-Gm-Gg: Acq92OEl5DhuVH4ofHHyP9+zAticenJaWizPOwVuffeYFEt13d0nuCtS6VtczyhdywO
	uAFGGk/S4jeT2fbPVuactVtgLQ/w3VacCvljgyrs0qEkPgQGcYgitL8AVcGCtLOyERUaNhdX6/L
	b94p0COT62cosYtHs/GTIdyAicJNLf+yVyvfSyp44GMFDaGjyXEshHGCIYniItLbUiFv99qnjsD
	YwxDmX/qTJURPj0LQXK0b/ZL42XexN+PFLnx6HgoxYCLibkoATWQ9vMxjK/L2STxW8VdQSJW58r
	eRs4M3xP/aiivMSB/4gsVHdhqVQJPwfXI44LJtTRr5PS6YkrhpPYRGUPh0Lp4zfrjgPvwDUVdmF
	dQtpZvS/+ILfevlhdNcyyRpjBWueAE1eu1VI997+Bxyvjjl+/BSEk9VA3w7/BchZxywS14dHX10
	BivAvHey0KfNnSgTrUNZoNIaB6bBS8D0kCP0BiDeF9dYF95U3kpzAbAA==
X-Received: by 2002:a05:7300:e805:b0:304:ba84:a0cc with SMTP id 5a478bee46e88-304ba84ac6cmr546957eec.33.1779861183142;
        Tue, 26 May 2026 22:53:03 -0700 (PDT)
Received: from sw07.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304be0851c9sm613202eec.23.2026.05.26.22.53.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 22:53:02 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Tue, 26 May 2026 22:52:39 -0700
Subject: [PATCH v2 2/3] KVM: riscv: selftests: Refactor ISA and SBI
 extension sublist macros
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-kvm-get_reg_list-v2-v2-2-7940a401454a@sifive.com>
References: <20260526-kvm-get_reg_list-v2-v2-0-7940a401454a@sifive.com>
In-Reply-To: <20260526-kvm-get_reg_list-v2-v2-0-7940a401454a@sifive.com>
To: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Andrew Jones <ajones@ventanamicro.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: greentime.hu@sifive.com, vincent.chen@sifive.com, zong.li@sifive.com, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Yong-Xuan Wang <yongxuan.wang@sifive.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779861178; l=6156;
 i=yongxuan.wang@sifive.com; s=20260424; h=from:subject:message-id;
 bh=4DPizMp5c9ZYd5J6eYtnzgZrFa5iDZWYGDJjDrKQguI=;
 b=S7fRaOZsRn89YBqQxmsVvW+ybsBc4X5m6GfdOSpXsQoaqsaJjtbEtjGTpoBsIwuapMZzGmgK0
 kWhQZBuxDB7CX0+PG8/0CblcxP79ieiSW4fKv7xcyp6H4A2PQSrsCTB
X-Developer-Key: i=yongxuan.wang@sifive.com; a=ed25519;
 pk=+8NCHB1ZJvZthQAmZspOAaqjo+/snaW8mFSiDx45HxY=

Refactor the get-reg-list test to use unified sublist macros for ISA
and SBI extensions, eliminating code duplication and improving
maintainability.

Previously, each extension had its own hand-coded sublist definition
(e.g., SUBLIST_ZICBOM, SUBLIST_AIA, etc.) and the config structures
repeated the same pattern. This made the code verbose and error-prone.

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
---
 tools/testing/selftests/kvm/riscv/get-reg-list.c | 80 +++++++++---------------
 1 file changed, 29 insertions(+), 51 deletions(-)

diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
index 8d6fdb5d38b8..cb16c638ce1a 100644
--- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
+++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
@@ -1057,37 +1057,17 @@ static __u64 vector_regs[] = {
 #define SUBLIST_BASE \
 	{"base", .regs = base_regs, .regs_n = ARRAY_SIZE(base_regs), \
 	 .skips_set = base_skips_set, .skips_set_n = ARRAY_SIZE(base_skips_set),}
-#define SUBLIST_SBI_BASE \
-	{"sbi-base", .feature_type = VCPU_FEATURE_SBI_EXT, .feature = KVM_RISCV_SBI_EXT_V01, \
-	 .regs = sbi_base_regs, .regs_n = ARRAY_SIZE(sbi_base_regs),}
-#define SUBLIST_SBI_STA \
-	{"sbi-sta", .feature_type = VCPU_FEATURE_SBI_EXT, .feature = KVM_RISCV_SBI_EXT_STA, \
-	 .regs = sbi_sta_regs, .regs_n = ARRAY_SIZE(sbi_sta_regs),}
-#define SUBLIST_SBI_FWFT \
-	{"sbi-fwft", .feature_type = VCPU_FEATURE_SBI_EXT, .feature = KVM_RISCV_SBI_EXT_FWFT, \
-	 .regs = sbi_fwft_regs, .regs_n = ARRAY_SIZE(sbi_fwft_regs),}
-#define SUBLIST_ZICBOM \
-	{"zicbom", .feature = KVM_RISCV_ISA_EXT_ZICBOM, .regs = zicbom_regs, .regs_n = ARRAY_SIZE(zicbom_regs),}
-#define SUBLIST_ZICBOP \
-	{"zicbop", .feature = KVM_RISCV_ISA_EXT_ZICBOP, .regs = zicbop_regs, .regs_n = ARRAY_SIZE(zicbop_regs),}
-#define SUBLIST_ZICBOZ \
-	{"zicboz", .feature = KVM_RISCV_ISA_EXT_ZICBOZ, .regs = zicboz_regs, .regs_n = ARRAY_SIZE(zicboz_regs),}
-#define SUBLIST_AIA \
-	{"aia", .feature = KVM_RISCV_ISA_EXT_SSAIA, .regs = aia_regs, .regs_n = ARRAY_SIZE(aia_regs),}
-#define SUBLIST_SMSTATEEN \
-	{"smstateen", .feature = KVM_RISCV_ISA_EXT_SMSTATEEN, .regs = smstateen_regs, .regs_n = ARRAY_SIZE(smstateen_regs),}
-#define SUBLIST_FP_F \
-	{"fp_f", .feature = KVM_RISCV_ISA_EXT_F, .regs = fp_f_regs, \
-		.regs_n = ARRAY_SIZE(fp_f_regs),}
-#define SUBLIST_FP_D \
-	{"fp_d", .feature = KVM_RISCV_ISA_EXT_D, .regs = fp_d_regs, \
-		.regs_n = ARRAY_SIZE(fp_d_regs),}
-
-#define SUBLIST_V \
-	{"v", .feature = KVM_RISCV_ISA_EXT_V, .regs = vector_regs, .regs_n = ARRAY_SIZE(vector_regs),}
+
+#define SUBLIST_ISA(ext, extu)				\
+	{						\
+		.name = #ext,				\
+		.feature = KVM_RISCV_ISA_EXT_##extu,	\
+		.regs = ext##_regs,			\
+		.regs_n = ARRAY_SIZE(ext##_regs),	\
+	}
 
 #define KVM_ISA_EXT_SIMPLE_CONFIG(ext, extu)			\
-static __u64 regs_##ext[] = {					\
+static __u64 ext##_regs[] = {					\
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG |			\
 	KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE |	\
 	KVM_RISCV_ISA_EXT_##extu,				\
@@ -1095,18 +1075,22 @@ static __u64 regs_##ext[] = {					\
 static struct vcpu_reg_list config_##ext = {			\
 	.sublists = {						\
 		SUBLIST_BASE,					\
-		{						\
-			.name = #ext,				\
-			.feature = KVM_RISCV_ISA_EXT_##extu,	\
-			.regs = regs_##ext,			\
-			.regs_n = ARRAY_SIZE(regs_##ext),	\
-		},						\
+		SUBLIST_ISA(ext, extu),				\
 		{0},						\
 	},							\
 }								\
 
+#define SUBLIST_SBI(ext, extu)					\
+	{							\
+		.name = "sbi-"#ext,				\
+		.feature_type = VCPU_FEATURE_SBI_EXT,		\
+		.feature = KVM_RISCV_SBI_EXT_##extu,		\
+		.regs = sbi_##ext##_regs,			\
+		.regs_n = ARRAY_SIZE(sbi_##ext##_regs),		\
+	}
+
 #define KVM_SBI_EXT_SIMPLE_CONFIG(ext, extu)			\
-static __u64 regs_sbi_##ext[] = {				\
+static __u64 sbi_##ext##_regs[] = {				\
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG |			\
 	KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE |	\
 	KVM_RISCV_SBI_EXT_##extu,				\
@@ -1114,13 +1098,7 @@ static __u64 regs_sbi_##ext[] = {				\
 static struct vcpu_reg_list config_sbi_##ext = {		\
 	.sublists = {						\
 		SUBLIST_BASE,					\
-		{						\
-			.name = "sbi-"#ext,			\
-			.feature_type = VCPU_FEATURE_SBI_EXT,	\
-			.feature = KVM_RISCV_SBI_EXT_##extu,	\
-			.regs = regs_sbi_##ext,			\
-			.regs_n = ARRAY_SIZE(regs_sbi_##ext),	\
-		},						\
+		SUBLIST_SBI(ext, extu),				\
 		{0},						\
 	},							\
 }								\
@@ -1129,7 +1107,7 @@ static struct vcpu_reg_list config_sbi_##ext = {		\
 static struct vcpu_reg_list config_##ext = {			\
 	.sublists = {						\
 		SUBLIST_BASE,					\
-		SUBLIST_##extu,					\
+		SUBLIST_ISA(ext, extu),				\
 		{0},						\
 	},							\
 }								\
@@ -1138,14 +1116,14 @@ static struct vcpu_reg_list config_##ext = {			\
 static struct vcpu_reg_list config_sbi_##ext = {		\
 	.sublists = {						\
 		SUBLIST_BASE,					\
-		SUBLIST_SBI_##extu,				\
+		SUBLIST_SBI(ext, extu),				\
 		{0},						\
 	},							\
 }								\
 
 /* Note: The below list is alphabetically sorted. */
 
-KVM_SBI_EXT_SUBLIST_CONFIG(base, BASE);
+KVM_SBI_EXT_SUBLIST_CONFIG(base, V01);
 KVM_SBI_EXT_SUBLIST_CONFIG(sta, STA);
 KVM_SBI_EXT_SIMPLE_CONFIG(pmu, PMU);
 KVM_SBI_EXT_SIMPLE_CONFIG(dbcn, DBCN);
@@ -1153,10 +1131,10 @@ KVM_SBI_EXT_SIMPLE_CONFIG(susp, SUSP);
 KVM_SBI_EXT_SIMPLE_CONFIG(mpxy, MPXY);
 KVM_SBI_EXT_SUBLIST_CONFIG(fwft, FWFT);
 
-KVM_ISA_EXT_SUBLIST_CONFIG(aia, AIA);
-KVM_ISA_EXT_SUBLIST_CONFIG(fp_f, FP_F);
-KVM_ISA_EXT_SUBLIST_CONFIG(fp_d, FP_D);
-KVM_ISA_EXT_SUBLIST_CONFIG(v, V);
+KVM_ISA_EXT_SUBLIST_CONFIG(aia, SSAIA);
+KVM_ISA_EXT_SUBLIST_CONFIG(fp_f, F);
+KVM_ISA_EXT_SUBLIST_CONFIG(fp_d, D);
+KVM_ISA_EXT_SUBLIST_CONFIG(vector, V);
 KVM_ISA_EXT_SIMPLE_CONFIG(h, H);
 KVM_ISA_EXT_SIMPLE_CONFIG(smnpm, SMNPM);
 KVM_ISA_EXT_SUBLIST_CONFIG(smstateen, SMSTATEEN);
@@ -1240,7 +1218,7 @@ struct vcpu_reg_list *vcpu_configs[] = {
 	&config_fp_f,
 	&config_fp_d,
 	&config_h,
-	&config_v,
+	&config_vector,
 	&config_smnpm,
 	&config_smstateen,
 	&config_sscofpmf,

-- 
2.43.7

