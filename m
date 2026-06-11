Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A92E38F621
	for <linux-kselftest@vger.kernel.org>; Thu, 11 Jun 2026 20:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781208837; cv=none; b=gbR1B4PKUeV+0mXP7XHF9n1SAJn/jo6eIm0l3cprlnBpGqwqvmqGOFCAFHvCY6PKJ4M1pdd1dOh/A1qw2d9fRWrGuOahQ2nhzX2tC0pD6WJu33RBvPeYfchWytil1OhCZG5GyEzb01g1lDCMOtqfNbJwKTbvAzUl8JL1tQqwoGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781208837; c=relaxed/simple;
	bh=wxIMux4s2Lg8V483oagVs/H8o1b+tlSAkTGv9uXSFbw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LEOaYRjM4MSKJlxT0SbjRG1dlUJVUGQrfAa30YSTz3Txoo5HJRu82pjYweYB2jRugOW5G/rpQcVo8wog7c0x5hkeMFDnaMGOprUWHkbLwrzIeQ5HC5o3bA+Rdr4FAFkPweN3kb97w3LQYT0e+6W6E+OJr5bhWWn7vRbJq2FE7XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wz3UPZop; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wz3UPZop"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-36d9794d82aso235798a91.0
        for <linux-kselftest@vger.kernel.org>; Thu, 11 Jun 2026 13:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781208835; x=1781813635; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WS0rWWpsi14GvxPL/X8PguzM8SKO3VATlxFp0qEp/fw=;
        b=Wz3UPZopRYeO6BoHoTqKjQnYKsow113dCC1hBrYYFKTs57ouEi53V2zFksFYJgFTH+
         oDXtQTJcdxMyEXfJCgarEFmCWgyRAHskqzIyYMF8oIvgHjgiUWRBIJn4y2uWMrfKLV6A
         WJITZYsGd9WvEsVQQylwQgtWhmhfkJcM5uKiJJWmgDvpI9XYPkpuo0YfPxYxwCU6GUQ5
         uVvOvmk2xHwEYTdx3qY+etP0jJOb27KUjZgtyNFkidIjsgR23I37anE0rdJnYyT4n6HC
         ZGkb2rQUKTeWYRVNdAxksWx6+PK3RjENQanG7yIundGwVmQRByz9HZJJ1IcrnW4NgjfR
         tVyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781208835; x=1781813635;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WS0rWWpsi14GvxPL/X8PguzM8SKO3VATlxFp0qEp/fw=;
        b=ap40XbxX03ucY5tZAliX88M9B64YnjNMUgoPU20FXoSLsx+ebgip2CfcNb+yaYOVOV
         Q30cYznTjJeU3HsmPcL49kOs0OqOLILB0byb2pP/J1uBPEGGJP829yNdYsMVWVP0S077
         UdUXSvrpyhI6uAcndw6DI9yHj62V+6EfBrbE4cJpmZLyRDSjpzHB0fBV+RYYfkwc2MHp
         EGf5OoiZ+Rg5SU9/VdX3jLXsmjvqU+zRHY+MjFfh41f/jfkaISdgQYSxf88I7pbvem3P
         EO9uF/k4kEI4zVeT0CM19/akEvk4BH5eFsJxqQb5M9wakcVsT8i16Syq0bT/ZM6ccsoi
         GQLA==
X-Forwarded-Encrypted: i=1; AFNElJ9oxg0DtRXMCc2dY7Qqliisi0FWZKsUz67rhj4v30tJVhUckx4jEc+NjqqK6o4/0jb4/+Q6soiN0MasUMmq6wA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOysBLIk3VEIccqTkjtj+fDdt20NMgfFO2Xt8c57eEsdZqCrUZ
	EQjRPrYJ6GSrFMjmQ3+8zltaT/C57zDqjjMa67axeYjNl2OZmiqB0aYN
X-Gm-Gg: Acq92OFYUVvfprxfb2rtqBFL8ZTLjtaOkl8pG7B3p7Gh+NHx6MVM92heThVPOIVqIVp
	4E71sLBftoJaRG3nVdCS6BOW8i/QYFn+1juTr4eEQPfzip5MXemg6ZCern/0aIf5iRAXLZUC7HU
	RGKTBc01t9LDwAKMyEiC9GXRO3ZbwHKsT0AeZqemjcdC1rUPHvfTSXOTCOPmx4fOEg5DwI4ZeD/
	Xr+JAPXUN6S+YR630WRKXl7UCSiUqAB/K34k0ZD1zCy9ojfslTahp8qH8LOqNK6UNkaTIzHCWp/
	iUaXdQKj1XiJJ/D+B+whltgJQ8PQJIrNtq8qu054GklhxQJFfj87AJpdc4ci0NZLumqtJm95N05
	5F8jPYf5zYBTCNLBZdZoiEqeCHBf3OjF7Z9Fc6H6VF/i/eNviCQmqGCMKoXbQfB2KAG9Pn/LqiQ
	==
X-Received: by 2002:a17:902:d2c8:b0:2c0:ee6c:c53c with SMTP id d9443c01a7336-2c2f0b21db3mr49681805ad.1.1781208835361;
        Thu, 11 Jun 2026 13:13:55 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::302d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f875casm288730475ad.22.2026.06.11.13.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 13:13:55 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Thu, 11 Jun 2026 16:12:43 -0400
Subject: [PATCH v4 06/16] riscv: Add Ziccamoa, Ziccif, Ziccrse, and Za64rs
 to cpufeature and hwprobe
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-rva23u64-hwprobe-v2-v4-6-3f01a2449488@gmail.com>
References: <20260611-rva23u64-hwprobe-v2-v4-0-3f01a2449488@gmail.com>
In-Reply-To: <20260611-rva23u64-hwprobe-v2-v4-0-3f01a2449488@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Zong Li <zong.li@sifive.com>, 
 Deepak Gupta <debug@rivosinc.com>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@linux.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, 
 spacemit@lists.linux.dev, sophgo@lists.linux.dev, 
 linux-kselftest@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>, 
 Guodong Xu <docular.xu@gmail.com>, 
 Andrew Jones <andrew.jones@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=7498; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=yNvYOT8c1VRmNPuEc/Kz8/rNNg4lB26dA3zMssylORU=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhixtsYOh/c7VbRct4g+vNNW/r1bkf8RPas/tR7XaD+KtF
 e8r6Hl3lLIwiHExyIopshw+2pK99ZVPtO9zzh8wc1iZQIYwcHEKwES2yjAy3D/Av2FuzaXVeaum
 bDb0TxQuXeh46gA7x9YX2nPCPPeHHWX4K1q+LdzzkMHZx2ZC77dlpH/KW8qodS43q+Pj4adST5Y
 WsQAA
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE

From: Andrew Jones <andrew.jones@oss.qualcomm.com>

Add Ziccamoa, Ziccif, and Za64rs to riscv_isa_ext[] so they can be
parsed from devicetree/ACPI ISA strings. Ziccrse is already present
in cpufeature; this patch only adds its hwprobe exposure.

Expose all four extensions via hwprobe through new bits in
RISCV_HWPROBE_KEY_IMA_EXT_1 (RISCV_HWPROBE_EXT_ZICCAMOA, _ZICCIF,
_ZICCRSE, _ZA64RS), so userspace can probe each of these
RVA23U64-mandatory extensions individually.

Rationale for the validation dependencies added for Ziccamoa and Za64rs:

1) Ziccamoa depends on Zaamo.  The RVA23 profile prose was updated
post-ratification to spell out the Zaamo reference: commit
2b218613752d in riscv/riscv-profiles ("Improve description of
Ziccamoa (#224)") reworded the rva23-profile.adoc (and other profiles
that include Ziccamoa) text from "must support all atomics in A" to
"must support all atomics in the Zaamo extension" [1].

2) Za64rs depends on Zalrsc. The unprivileged ISA manual src/zars.adoc,
integrated in commit ebe06adc22cd ("Integrate profiles as Volume III
(#2771)"), defines Za64rs as: "The Za64rs extension requires that the
reservation sets used by the instructions in the Zalrsc extension be
contiguous, naturally aligned, and at most 64 bytes in size" [2].

Link: https://github.com/riscv/riscv-profiles/commit/2b218613752d63287286b5ae801b820cbd8cc10c [1]
Link: https://github.com/riscv/riscv-isa-manual/blob/main/src/unpriv/zars.adoc [2]
Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Signed-off-by: Guodong Xu <docular.xu@gmail.com>
---
v4: No change.
v3: Indent the added hwprobe.rst entries to match the normalized style; no other change.
v2:
- Rebased to v7.1-rc2.
- Reworded subject and expanded commit message.
- Validation added for Ziccamoa depending on Zaamo and Za64rs depending
  on Zalrsc.
---
 Documentation/arch/riscv/hwprobe.rst  | 16 ++++++++++++++++
 arch/riscv/include/asm/hwcap.h        |  3 +++
 arch/riscv/include/uapi/asm/hwprobe.h |  4 ++++
 arch/riscv/kernel/cpufeature.c        | 21 +++++++++++++++++++++
 arch/riscv/kernel/sys_hwprobe.c       |  4 ++++
 5 files changed, 48 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 49d9fb68632d0..893e1a1215d23 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -405,3 +405,19 @@ The following keys are defined:
   * :c:macro:`RISCV_HWPROBE_EXT_ZICCLSM`: The Zicclsm extension is supported,
     as defined in the RISC-V Profiles specification starting from commit
     b1d80660 ("Updated to ratified state.")
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZICCAMOA`: The Ziccamoa extension is supported,
+    as defined in the RISC-V Profiles specification starting from commit
+    b1d80660 ("Updated to ratified state.")
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZICCIF`: The Ziccif extension is supported,
+    as defined in the RISC-V Profiles specification starting from commit
+    b1d80660 ("Updated to ratified state.")
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZICCRSE`: The Ziccrse extension is supported,
+    as defined in the RISC-V Profiles specification starting from commit
+    b1d80660 ("Updated to ratified state.")
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZA64RS`: The Za64rs extension is supported,
+    as defined in the RISC-V Profiles specification starting from commit
+    b1d80660 ("Updated to ratified state.")
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index e8f4a7dd96a93..0acb7a01ecc0f 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -113,6 +113,9 @@
 #define RISCV_ISA_EXT_ZICFILP		104
 #define RISCV_ISA_EXT_ZICFISS		105
 #define RISCV_ISA_EXT_ZICCLSM		106
+#define RISCV_ISA_EXT_ZICCAMOA		107
+#define RISCV_ISA_EXT_ZICCIF		108
+#define RISCV_ISA_EXT_ZA64RS		109
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 6819df159c51e..58d1e86e47ae7 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -117,6 +117,10 @@ struct riscv_hwprobe {
 #define RISCV_HWPROBE_KEY_IMA_EXT_1		16
 #define		RISCV_HWPROBE_EXT_ZICFISS	(1ULL << 0)
 #define		RISCV_HWPROBE_EXT_ZICCLSM	(1ULL << 1)
+#define		RISCV_HWPROBE_EXT_ZICCAMOA	(1ULL << 2)
+#define		RISCV_HWPROBE_EXT_ZICCIF	(1ULL << 3)
+#define		RISCV_HWPROBE_EXT_ZICCRSE	(1ULL << 4)
+#define		RISCV_HWPROBE_EXT_ZA64RS	(1ULL << 5)
 
 /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 1fb595581adcf..b9538e69fa1b3 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -90,6 +90,24 @@ static int riscv_ext_f_depends(const struct riscv_isa_ext_data *data,
 	return -EPROBE_DEFER;
 }
 
+static int riscv_ext_zaamo_depends(const struct riscv_isa_ext_data *data,
+				   const unsigned long *isa_bitmap)
+{
+	if (__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_ZAAMO))
+		return 0;
+
+	return -EPROBE_DEFER;
+}
+
+static int riscv_ext_zalrsc_depends(const struct riscv_isa_ext_data *data,
+				    const unsigned long *isa_bitmap)
+{
+	if (__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_ZALRSC))
+		return 0;
+
+	return -EPROBE_DEFER;
+}
+
 static int riscv_ext_zicbom_validate(const struct riscv_isa_ext_data *data,
 				     const unsigned long *isa_bitmap)
 {
@@ -502,6 +520,8 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicbom, RISCV_ISA_EXT_ZICBOM, riscv_xlinuxenvcfg_exts, riscv_ext_zicbom_validate),
 	__RISCV_ISA_EXT_DATA_VALIDATE(zicbop, RISCV_ISA_EXT_ZICBOP, riscv_ext_zicbop_validate),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicboz, RISCV_ISA_EXT_ZICBOZ, riscv_xlinuxenvcfg_exts, riscv_ext_zicboz_validate),
+	__RISCV_ISA_EXT_DATA_VALIDATE(ziccamoa, RISCV_ISA_EXT_ZICCAMOA, riscv_ext_zaamo_depends),
+	__RISCV_ISA_EXT_DATA(ziccif, RISCV_ISA_EXT_ZICCIF),
 	__RISCV_ISA_EXT_DATA(zicclsm, RISCV_ISA_EXT_ZICCLSM),
 	__RISCV_ISA_EXT_DATA(ziccrse, RISCV_ISA_EXT_ZICCRSE),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicfilp, RISCV_ISA_EXT_ZICFILP, riscv_xlinuxenvcfg_exts,
@@ -516,6 +536,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
 	__RISCV_ISA_EXT_DATA(zihpm, RISCV_ISA_EXT_ZIHPM),
 	__RISCV_ISA_EXT_DATA(zimop, RISCV_ISA_EXT_ZIMOP),
+	__RISCV_ISA_EXT_DATA_VALIDATE(za64rs, RISCV_ISA_EXT_ZA64RS, riscv_ext_zalrsc_depends),
 	__RISCV_ISA_EXT_DATA(zaamo, RISCV_ISA_EXT_ZAAMO),
 	__RISCV_ISA_EXT_DATA(zabha, RISCV_ISA_EXT_ZABHA),
 	__RISCV_ISA_EXT_DATA(zacas, RISCV_ISA_EXT_ZACAS),
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 9cf62266f1890..b15ac9adf7920 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -206,6 +206,10 @@ static void hwprobe_isa_ext1(struct riscv_hwprobe *pair,
 		 */
 		EXT_KEY(isainfo->isa, ZICFISS, pair->value, missing);
 		EXT_KEY(isainfo->isa, ZICCLSM, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZICCAMOA, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZICCIF, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZICCRSE, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZA64RS, pair->value, missing);
 	}
 
 	/* Now turn off reporting features if any CPU is missing it. */

-- 
2.43.0

