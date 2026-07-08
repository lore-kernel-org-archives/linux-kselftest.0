Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D12F3BA246
	for <linux-kselftest@vger.kernel.org>; Wed,  8 Jul 2026 03:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783481810; cv=none; b=eJe5cKmV/8SOFYoQDS/ZmbpjZodjAwFDUk0pKxBzmmgffKOHgMG738+zoXavEvXFJxhGzDkozR/kevUinLhQ/ZrKrjUXeLrIW+HjMP5fAcz2vrFgQafW0FSrZ3t3Nlut4YbPW1dj73L66XdxoobI/qzWnl4fOF9Xz8cosWJat68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783481810; c=relaxed/simple;
	bh=34NvWLgWZxGAYVZyLbG0y/AhPlMD8oyGVqDaoGR9FaA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uBcQEB5b6eo4hgZgp6qzygNtdVbGkK3+OR54bhzxAVTIPrHcjp6BahCktiVpvEpUUE49diTPhlSgzptyvr1DvROj8KOH1AkIe8NRVnOcspbEahinpbVe9eVXjxV+wbaTq3zASmXa3qpkByve9UoQ7WQMFg7id1DnysmIVwsj+ME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T0G+k7ym; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T0G+k7ym"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c99eaa1f020so170460a12.2
        for <linux-kselftest@vger.kernel.org>; Tue, 07 Jul 2026 20:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783481806; x=1784086606; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GJBmXlsdV1hfdU5uODx6ZlHlbgxAOvIQb43p46Hii1A=;
        b=T0G+k7ymkdW/jRRg2XXmwMlq32iTY3fcVS7TxbFqjZ2RXfrDDh9tG9Z0l+3kt69FnU
         R7scToplIOH8gm2v/56XV6ovRluVjrZGgju9JMocZA3WYcuvEjeIIzGMxvlElnVDKd3f
         wwhlnopeOmUGedjNVNkNVs3bY77eVMx0SYiHQStj/7nod2vkXE4gBep3pLVC7ob87oEO
         aZSVOKMMG+h2sjwDG/WlES4UpUw+lJIOM7+88UPosXIMqvAXN/MZNjLjgZFXg6z3IhMR
         UqmabPlN3+HccGdEq+YUhApxgtDhd1WDww7gqmcocL9xSI8g1mybLxgDemZ536s8rArm
         BV/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783481806; x=1784086606;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GJBmXlsdV1hfdU5uODx6ZlHlbgxAOvIQb43p46Hii1A=;
        b=i6eZeu6q8VFwPZWXRfxRKOLO1TCiIGNHVzFtaSKMf45Q1zA86M0tFBgDvzYfL+aBW3
         AnDk2Oq6vTcV0xxwbN4YT4J2S1bsuTrtnqaXgoQ9UoSe/kRrtV3Y3BI2BrkbFqRS3NKc
         gKRfnkCgr0NrIfS2AnBGnObrMU36GMU8gDzxpq3hrHCOGJnrZt2Pn7B/18orHlxJMPz6
         bhX4GYuiK6y9SRMgX970HCtys9Y8RUTjSCBZIWT9nRIRFm/90ssV+76/hvCZQLrm2JVQ
         elpZ7zMjsQk54+o7UfBdrtf7dJygApVMNceVH17tCOCoEBO35fwsf5oxCNCxBthbgmUe
         QRmg==
X-Forwarded-Encrypted: i=1; AHgh+Ro7WTZ1//CgCA56qoOlZ7JX/J3QCLlat4ophTZ1gP9k4vtOHgedKuV0A+ukk1oGhUC8GjaYlZcE5s9gwjcrMXo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwB3ZuhjlqsuQN9rymztKZWokbkBqyiJyy8c27P5awqpDxZbZJt
	hLLuiL1SxfgDGQwa/CfiGCZQJuUfK6Q6wKpk9tMOu3eacrEGRYNCHElg8YymxsAg
X-Gm-Gg: AfdE7cle228dtxIDmRZWyczaS1EpsCXN6Ti3pL0Ug8YMuzy3WZNN1iKjObUPzatGSKa
	5gt4t7HBQO7QcbKxZqsRiWaDKmSv/2pH+Z6h6BYbB5947VMUojWmc+b5rYkYOqdHDBIbUSRRwLJ
	MH8a36b6sUbpqbXJg8XY1x3FL6DLKRx4+NTh0aqHyeQaHd1G9TSIs4c5nOxm32tB1bstUNU8Wj/
	sKKGXsTz0WIQPAI5A3E0NVEkpgmNNgaQ/rWOEyzN6gYUQorVN2WHvjihQSIGpvYuA6ky1nX5uRE
	B/yk371O6R6ublTMndDeuhsu7C8Y7KHFffVT/cpPP0LgNnyCWYqpBypnS3fxn/2wKvdLmMPofEW
	/29mSBNalvKwHhkV+4nIzFuvCXVYSNUFQK1MByzd7bwAdkX4tgDCcqDqGo0LGcssaQbv4kCo0fe
	G7S1ISefrXA7k7zgKo6S2e6p4tTZ9FKhTXVgbuihQ=
X-Received: by 2002:a05:6a21:400d:b0:3c0:9c1b:d0b5 with SMTP id adf61e73a8af0-3c0bd2ab6e9mr595240637.64.1783481805671;
        Tue, 07 Jul 2026 20:36:45 -0700 (PDT)
Received: from [10.0.0.65] ([2601:647:6700:64d0::94ac])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174accae5sm21092850eec.29.2026.07.07.20.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 20:36:45 -0700 (PDT)
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
Date: Tue, 07 Jul 2026 20:34:39 -0700
Subject: [PATCH v3 16/17] riscv: kexec: Use generated instruction headers
 for kexec relocations
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-riscv_insn_table-v3-16-3f8e5f75ba97@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783481778; l=3956;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=34NvWLgWZxGAYVZyLbG0y/AhPlMD8oyGVqDaoGR9FaA=;
 b=HHAGABMOnP/KQwIk7NT3288oN7tkMvICA9VbvqP0An0Jr7dhNcfRSg/YZPfDaqToCGW60/N8b
 Vx8IQZDIJiIAoEmMNb7Y6NORWvzqH2Zg06kLdzkam58TbLZddvI5bvS
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=

Migrate the kexec relocation code to use the generated instruction
headers instead of the hand-written instruction composition functions.

Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>

---

This was again tested by brute forcing all possible inputs to the value
fed into the immediates.
---
 arch/riscv/kernel/machine_kexec_file.c | 55 ++++++++++++----------------------
 1 file changed, 19 insertions(+), 36 deletions(-)

diff --git a/arch/riscv/kernel/machine_kexec_file.c b/arch/riscv/kernel/machine_kexec_file.c
index 54e2d9552e93..cad40e4afd86 100644
--- a/arch/riscv/kernel/machine_kexec_file.c
+++ b/arch/riscv/kernel/machine_kexec_file.c
@@ -116,32 +116,6 @@ static char *setup_kdump_cmdline(struct kimage *image, char *cmdline,
 	(((x) + (RISCV_IMM_REACH >> 1)) & ~(RISCV_IMM_REACH - 1))
 #define RISCV_CONST_LOW_PART(x) ((x) - RISCV_CONST_HIGH_PART(x))
 
-#define ENCODE_ITYPE_IMM(x) \
-	(RV_X(x, 0, 12) << 20)
-#define ENCODE_BTYPE_IMM(x) \
-	((RV_X(x, 1, 4) << 8) | (RV_X(x, 5, 6) << 25) | \
-	(RV_X(x, 11, 1) << 7) | (RV_X(x, 12, 1) << 31))
-#define ENCODE_UTYPE_IMM(x) \
-	(RV_X(x, 12, 20) << 12)
-#define ENCODE_JTYPE_IMM(x) \
-	((RV_X(x, 1, 10) << 21) | (RV_X(x, 11, 1) << 20) | \
-	(RV_X(x, 12, 8) << 12) | (RV_X(x, 20, 1) << 31))
-#define ENCODE_CBTYPE_IMM(x) \
-	((RV_X(x, 1, 2) << 3) | (RV_X(x, 3, 2) << 10) | (RV_X(x, 5, 1) << 2) | \
-	(RV_X(x, 6, 2) << 5) | (RV_X(x, 8, 1) << 12))
-#define ENCODE_CJTYPE_IMM(x) \
-	((RV_X(x, 1, 3) << 3) | (RV_X(x, 4, 1) << 11) | (RV_X(x, 5, 1) << 2) | \
-	(RV_X(x, 6, 1) << 7) | (RV_X(x, 7, 1) << 6) | (RV_X(x, 8, 2) << 9) | \
-	(RV_X(x, 10, 1) << 8) | (RV_X(x, 11, 1) << 12))
-#define ENCODE_UJTYPE_IMM(x) \
-	(ENCODE_UTYPE_IMM(RISCV_CONST_HIGH_PART(x)) | \
-	(ENCODE_ITYPE_IMM(RISCV_CONST_LOW_PART(x)) << 32))
-#define ENCODE_UITYPE_IMM(x) \
-	(ENCODE_UTYPE_IMM(x) | (ENCODE_ITYPE_IMM(x) << 32))
-
-#define CLEAN_IMM(type, x) \
-	((~ENCODE_##type##_IMM((uint64_t)(-1))) & (x))
-
 int arch_kexec_apply_relocations_add(struct purgatory_info *pi,
 				     Elf_Shdr *section,
 				     const Elf_Shdr *relsec,
@@ -197,12 +171,14 @@ int arch_kexec_apply_relocations_add(struct purgatory_info *pi,
 
 		switch (r_type) {
 		case R_RISCV_BRANCH:
-			*(u32 *)loc = CLEAN_IMM(BTYPE, *(u32 *)loc) |
-				 ENCODE_BTYPE_IMM(val - addr);
+			/*
+			 * For simplicity, use beq as represenative of all
+			 * branches (they all have the same imm encoding)
+			 */
+			riscv_insn_beq_insert_imm((u32 *)loc, val - addr);
 			break;
 		case R_RISCV_JAL:
-			*(u32 *)loc = CLEAN_IMM(JTYPE, *(u32 *)loc) |
-				 ENCODE_JTYPE_IMM(val - addr);
+			riscv_insn_jal_insert_imm((u32 *)loc, val  - addr);
 			break;
 		/*
 		 * With no R_RISCV_PCREL_LO12_S, R_RISCV_PCREL_LO12_I
@@ -213,16 +189,23 @@ int arch_kexec_apply_relocations_add(struct purgatory_info *pi,
 		case R_RISCV_PCREL_HI20:
 		case R_RISCV_CALL_PLT:
 		case R_RISCV_CALL:
-			*(u64 *)loc = CLEAN_IMM(UITYPE, *(u64 *)loc) |
-				 ENCODE_UJTYPE_IMM(val - addr);
+			riscv_insn_auipc_insert_imm((u32 *)loc, RISCV_CONST_HIGH_PART(val - addr));
+			riscv_insn_jalr_insert_imm((u32 *)loc + 1,
+						   RISCV_CONST_LOW_PART(val - addr));
 			break;
 		case R_RISCV_RVC_BRANCH:
-			*(u32 *)loc = CLEAN_IMM(CBTYPE, *(u32 *)loc) |
-				 ENCODE_CBTYPE_IMM(val - addr);
+			/*
+			 * For simplicity, use c.beqz as represenative of all
+			 * compressed branches (they all have the same imm encoding)
+			 */
+			riscv_insn_c_beqz_insert_imm((u16 *)loc, val - addr);
 			break;
 		case R_RISCV_RVC_JUMP:
-			*(u32 *)loc = CLEAN_IMM(CJTYPE, *(u32 *)loc) |
-				 ENCODE_CJTYPE_IMM(val - addr);
+			/*
+			 * For simplicity, use c.j as represenative of all
+			 * compressed jumps (they all have the same imm encoding)
+			 */
+			riscv_insn_c_j_insert_imm((u16 *)loc, val - addr);
 			break;
 		case R_RISCV_ADD16:
 			*(u16 *)loc += val;

-- 
2.54.0

