Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A1737A826
	for <linux-kselftest@vger.kernel.org>; Wed,  8 Jul 2026 03:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783481787; cv=none; b=C9a6wkdDAz9L5dQ0BbSfpyNJn/qnvL+I/obmmtEKCquoSsaJ6sNAZgYV/kYzb5mWDuHdfqqhNRi2Ehj9X0Rj+I62TBBzkS/Zr5fBurzo9h4b+C/37BY/H7QZ/umuH+3T9DDFSLYew7VgslhhR1EYdgEEUKy1lZGWkVCF0wRj8qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783481787; c=relaxed/simple;
	bh=IjVaLmAyDsdmOm3A507KtKDP292jEnsVxwzZ/J7AzEQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X8kVV+RxD7c18jvD//aHPq/ynGSfmajCoToVFYfBqCQQtsA9jrYHDRHxVlebwU7oz1V4WHS1Ifdp7F6gq+dhQ58eehtjTdbMAyeX6J/JbffXabY+O2+StS81QvWMjUVXe8sfxWBvM5nVDJDCkC0h1PEF2Z7NGJDP+f9OoYVknFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nxD9yx4X; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nxD9yx4X"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cc84e77e78so2063415ad.2
        for <linux-kselftest@vger.kernel.org>; Tue, 07 Jul 2026 20:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783481784; x=1784086584; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BvffsWlG6NIDI4wpXBTvJiGnizG3fIiSLad7tqLqNo8=;
        b=nxD9yx4XGIORG9UGZ0bg3/yBPKqOATKU57FZZKU9q4NUocEQQMwdbTKnCTuY6dQw2j
         8fwWHfdBoiPguYMx1xAVFG6rZXGoFEOGwCMH/oqWgPbSp5Pc/O2bkXFPLbomUZfh6Mf3
         YvR04uoTaK/p0c3faUKqr4kBQ+WYefiQd+r3wcbR2rcOvsmhpW1lXxsI/KK02VbueFnV
         x07QzQpxKL/jMBsHU9/csNmMsUTBQvwG4h7+JplK4sqswgJm2iESstR3IzJS/P3hggXQ
         fch9LHrWz9GuZg9BNEUmRZrbNeU9Xpx49ScTyiTV28vGNyl4P/ggd9CVBh+FG1nAsKWa
         xLwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783481784; x=1784086584;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BvffsWlG6NIDI4wpXBTvJiGnizG3fIiSLad7tqLqNo8=;
        b=dBdUzTqvPM9bt37bGgiBepj1uCk3pDikDwN9sYWlfz+wYKdFEJGzcyEgcy9j662+u0
         yBw/h802aB/+D0Hz/hDf/OTphuGyw5KPicKzExTBDpxYvvj/3qA7FkF4VIFax8btpIaa
         lQNQZfzXF4/iLm2oU8VE2xTwHPfkiCjEaTCEFIipIc/jSzhYReKRgtT+JiqUvYJjGGrP
         92OPFMAk8br4lGKbpoT3nsYmWXzRtpHThDZj/M6TLtw/AJbqxFIRRyt5dTU4TEhxviQr
         DgKpxHF51MIZRkkSp59H9O1fiw75wdDbUL1Wi8R6bCMNHDV7U7YzTrZbFHHHKaHXQ6d2
         kdVg==
X-Forwarded-Encrypted: i=1; AHgh+RoHdckWDF9ZzawM2M/Zqo5E5YTS9AxJE0uZxZclt8IClrHaUIldznkeBweLOFvkmsv69sPCWLkbQlBFsNX7B0Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcXwo9FTxgSO27TWOyFfKUjHTOx3oXwUCoXYq5fxlO1jReRV4j
	/jszNYOvghHieJ2pcx29aUUhuNArHNvTve5UVzIOcGIjXib4HPth771fCZfiAZNU
X-Gm-Gg: AfdE7clJP22v8xZ8fmHt1vpOccBH6CQgp2raN/gyesSNaK97u6w8ZQt7kHyyUepW8q1
	WdRhDR8CiAnHx/8Aw2oHXRyUDZ4fC/jt8v24f7/s7gRMOJtqNKfvnGUtnEzsNx1O+m/Dz1x3jAE
	Zy8k1L57+4qx/oM2Mj/7V4l2yRA85rRVlfCB9YIRQaVhx38X55JCWmyxPz5F7sICZO5h7YprYAD
	VVUO3zDW/Xfmh4eEk/o5qnbBLJHQalmHUh69InTZHQxA+oQYOJi2aWQZ3VGfbo86dlx93np7PtT
	hJBW2FhyRPwOQ16Vsy5yNqRqkZNb41hI/GCq+HPugJJzMP4SNa5jzTKjWSxgBzqBq/XPzJ6r0rX
	tKQ+3xaNG4SqP9nidjB2PHgyc4t9fedLBSqjcYOL/YQI1RMOLKZIPShCbFXzBY6B7Mmme+26ace
	RPCf20lx1ADvBr+LnEseJPaeLYGac54/wP35o2BZY=
X-Received: by 2002:a05:6a20:428b:b0:3c0:9c19:658f with SMTP id adf61e73a8af0-3c0bd00234cmr649122637.73.1783481784340;
        Tue, 07 Jul 2026 20:36:24 -0700 (PDT)
Received: from [10.0.0.65] ([2601:647:6700:64d0::94ac])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174accae5sm21092850eec.29.2026.07.07.20.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 20:36:23 -0700 (PDT)
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
Date: Tue, 07 Jul 2026 20:34:26 -0700
Subject: [PATCH v3 03/17] riscv: kgdb: Use generated instruction headers
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-riscv_insn_table-v3-3-3f8e5f75ba97@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783481777; l=7745;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=IjVaLmAyDsdmOm3A507KtKDP292jEnsVxwzZ/J7AzEQ=;
 b=mBC0UXZEz49zdrNmAX+X8iCdHwZI8pY0Y8/OGEoAve1HO2d2ZHbPUA3ECdGF8IjqpPMzn/c/h
 vQ+Yx+OV20OCyC33LTSB7DIlSCICWxDFemHYeAoWep7czBEeu1Y3L8R
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=

Migrate the code that is decoding instructions for the use of kgdb
single stepping to use the generated instruction headers instead of the
hand-written instruction functions.

Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>

---

I tested this again by comparing the original get_step_address()
function with this new version and input all possible 32 bit numbers and
checked that the next_addr was the same in every case.

This is the code I used:

void check_step()
{
	for (unsigned long opcode = 0; opcode < ((1ULL << 32) - 1); opcode++) {
		unsigned long next_addr, next_addr2;
		get_step_address(opcode, &next_addr);
		get_step_address2(opcode, &next_addr2);
		if (next_addr != next_addr2) {
			printf("opcode: %lu -> %lu != %lu\n", opcode, next_addr, next_addr2);
		}
	}
}
---
 arch/riscv/include/asm/insn.h |  21 +++++++++
 arch/riscv/kernel/kgdb.c      | 102 ++++++++++++++++--------------------------
 2 files changed, 60 insertions(+), 63 deletions(-)

diff --git a/arch/riscv/include/asm/insn.h b/arch/riscv/include/asm/insn.h
index d0e137f9bcd7..b92c71896c00 100644
--- a/arch/riscv/include/asm/insn.h
+++ b/arch/riscv/include/asm/insn.h
@@ -514,4 +514,25 @@ static __always_inline bool riscv_insn_is_branch(u32 code)
 
 #define RVV_EXTRACT_VL_VS_WIDTH(x) RVFDQ_EXTRACT_FL_FS_WIDTH(x)
 
+static inline unsigned long riscv_insn_reg_get_val(unsigned long *regs, u32 index)
+{
+	/* register 0 is always 0 and not stored in the register struct */
+	return index ? *(regs + index) : 0;
+}
+
+#define riscv_insn_branch(_insn, regs_ptr, _opcode, _pc, _comparison, type)     \
+	({                                                                      \
+		unsigned long _ret;                                             \
+		if ((type)riscv_insn_reg_get_val(                               \
+			    regs_ptr,                                           \
+			    riscv_insn_##_insn##_extract_xs1(_opcode))          \
+			    _comparison(type) riscv_insn_reg_get_val(           \
+				    regs_ptr,                                   \
+				    riscv_insn_##_insn##_extract_xs2(_opcode))) \
+			_ret = _pc + riscv_insn_##_insn##_extract_imm(_opcode); \
+		else                                                            \
+			_ret = _pc + 4;                                         \
+		_ret;                                                           \
+	})
+
 #endif /* _ASM_RISCV_INSN_H */
diff --git a/arch/riscv/kernel/kgdb.c b/arch/riscv/kernel/kgdb.c
index 0bf629204c76..fcf7cda3cc33 100644
--- a/arch/riscv/kernel/kgdb.c
+++ b/arch/riscv/kernel/kgdb.c
@@ -23,97 +23,73 @@ enum {
 static unsigned long stepped_address;
 static unsigned int stepped_opcode;
 
-static int decode_register_index(unsigned long opcode, int offset)
-{
-	return (opcode >> offset) & 0x1F;
-}
-
-static int decode_register_index_short(unsigned long opcode, int offset)
-{
-	return ((opcode >> offset) & 0x7) + 8;
-}
-
-/* Calculate the new address for after a step */
 static int get_step_address(struct pt_regs *regs, unsigned long *next_addr)
 {
 	unsigned long pc = regs->epc;
 	unsigned long *regs_ptr = (unsigned long *)regs;
-	unsigned int rs1_num, rs2_num;
+	unsigned int rs1_num;
 	int op_code;
 
 	if (get_kernel_nofault(op_code, (void *)pc))
 		return -EINVAL;
+
 	if ((op_code & __INSN_LENGTH_MASK) != __INSN_LENGTH_GE_32) {
-		if (riscv_insn_is_c_jalr(op_code) ||
-		    riscv_insn_is_c_jr(op_code)) {
-			rs1_num = decode_register_index(op_code, RVC_C2_RS1_OPOFF);
-			*next_addr = regs_ptr[rs1_num];
-		} else if (riscv_insn_is_c_j(op_code) ||
-			   riscv_insn_is_c_jal(op_code)) {
-			*next_addr = RVC_EXTRACT_JTYPE_IMM(op_code) + pc;
+		if (riscv_insn_is_c_jalr(op_code)) {
+			*next_addr = regs_ptr[riscv_insn_c_jalr_extract_xs1(op_code)];
+		} else if (riscv_insn_is_c_jr(op_code)) {
+			*next_addr = regs_ptr[riscv_insn_c_jr_extract_xs1(op_code)];
+		} else if (riscv_insn_is_c_j(op_code)) {
+			*next_addr = riscv_insn_c_j_extract_imm(op_code) + pc;
+		} else if (riscv_insn_is_c_jal(op_code)) {
+			*next_addr = riscv_insn_c_jal_extract_imm(op_code) + pc;
 		} else if (riscv_insn_is_c_beqz(op_code)) {
-			rs1_num = decode_register_index_short(op_code,
-							      RVC_C1_RS1_OPOFF);
-			if (!rs1_num || regs_ptr[rs1_num] == 0)
-				*next_addr = RVC_EXTRACT_BTYPE_IMM(op_code) + pc;
+			rs1_num = riscv_insn_c_beqz_extract_xs1(op_code);
+			if (regs_ptr[8 + rs1_num] == 0)
+				*next_addr = riscv_insn_c_beqz_extract_imm(op_code) + pc;
 			else
 				*next_addr = pc + 2;
 		} else if (riscv_insn_is_c_bnez(op_code)) {
-			rs1_num =
-			    decode_register_index_short(op_code, RVC_C1_RS1_OPOFF);
-			if (rs1_num && regs_ptr[rs1_num] != 0)
-				*next_addr = RVC_EXTRACT_BTYPE_IMM(op_code) + pc;
+			rs1_num = riscv_insn_c_bnez_extract_xs1(op_code);
+			if (regs_ptr[8 + rs1_num] != 0)
+				*next_addr = riscv_insn_c_bnez_extract_imm(op_code) + pc;
 			else
 				*next_addr = pc + 2;
 		} else {
 			*next_addr = pc + 2;
 		}
 	} else {
-		if ((op_code & __INSN_OPCODE_MASK) == __INSN_BRANCH_OPCODE) {
-			bool result = false;
-			long imm = RV_EXTRACT_BTYPE_IMM(op_code);
-			unsigned long rs1_val = 0, rs2_val = 0;
-
-			rs1_num = decode_register_index(op_code, RVG_RS1_OPOFF);
-			rs2_num = decode_register_index(op_code, RVG_RS2_OPOFF);
-			if (rs1_num)
-				rs1_val = regs_ptr[rs1_num];
-			if (rs2_num)
-				rs2_val = regs_ptr[rs2_num];
-
-			if (riscv_insn_is_beq(op_code))
-				result = (rs1_val == rs2_val) ? true : false;
-			else if (riscv_insn_is_bne(op_code))
-				result = (rs1_val != rs2_val) ? true : false;
-			else if (riscv_insn_is_blt(op_code))
-				result =
-				    ((long)rs1_val <
-				     (long)rs2_val) ? true : false;
-			else if (riscv_insn_is_bge(op_code))
-				result =
-				    ((long)rs1_val >=
-				     (long)rs2_val) ? true : false;
-			else if (riscv_insn_is_bltu(op_code))
-				result = (rs1_val < rs2_val) ? true : false;
-			else if (riscv_insn_is_bgeu(op_code))
-				result = (rs1_val >= rs2_val) ? true : false;
-			if (result)
-				*next_addr = imm + pc;
-			else
-				*next_addr = pc + 4;
+		if (riscv_insn_is_beq(op_code)) {
+			*next_addr = riscv_insn_branch(beq, regs_ptr, op_code,
+						       pc, ==, unsigned long);
+		} else if (riscv_insn_is_bne(op_code)) {
+			*next_addr = riscv_insn_branch(bne, regs_ptr, op_code,
+						       pc, !=, unsigned long);
+		} else if (riscv_insn_is_blt(op_code)) {
+			*next_addr = riscv_insn_branch(blt, regs_ptr, op_code,
+						       pc, <, long);
+		} else if (riscv_insn_is_bge(op_code)) {
+			*next_addr = riscv_insn_branch(bge, regs_ptr, op_code,
+						       pc, >=, long);
+		} else if (riscv_insn_is_bltu(op_code)) {
+			*next_addr = riscv_insn_branch(bltu, regs_ptr, op_code,
+						       pc, <, unsigned long);
+		} else if (riscv_insn_is_bgeu(op_code)) {
+			*next_addr = riscv_insn_branch(bgeu, regs_ptr, op_code,
+						       pc, >=, unsigned long);
 		} else if (riscv_insn_is_jal(op_code)) {
-			*next_addr = RV_EXTRACT_JTYPE_IMM(op_code) + pc;
+			*next_addr = riscv_insn_jal_extract_imm(op_code) + pc;
 		} else if (riscv_insn_is_jalr(op_code)) {
-			rs1_num = decode_register_index(op_code, RVG_RS1_OPOFF);
+			rs1_num = riscv_insn_jalr_extract_xs1(op_code);
 			if (rs1_num)
-				*next_addr = ((unsigned long *)regs)[rs1_num];
-			*next_addr += RV_EXTRACT_ITYPE_IMM(op_code);
+				*next_addr = regs_ptr[rs1_num];
+			*next_addr += riscv_insn_jalr_extract_imm(op_code);
 		} else if (riscv_insn_is_sret(op_code)) {
 			*next_addr = pc;
 		} else {
 			*next_addr = pc + 4;
 		}
 	}
+
 	return 0;
 }
 

-- 
2.54.0

