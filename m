Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56589494A05
	for <linux-kselftest@vger.kernel.org>; Wed,  1 Jul 2026 12:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782910510; cv=none; b=gBMKyGMcON2MkOYCzLpILxuTDU0uIgj+qczN0dYLp2oeLavTSQFO9Xpz7wCmabXEU6EeP9tc83TSF3xGVWN571lslPUZUJDX9s3bEfiV1VqLeuQZTyDtCg2VVLdA2NB45J1ZRwFk0zZOcdhs+0JbqPyTuyhd52qWwjNE02IyXcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782910510; c=relaxed/simple;
	bh=SVIa4L8k84ckCPyHRMWQbuV12ITePXE/vVAii5SjE4s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J8aToHdjHbdjULAg1Uov0kteWv6fSHxSn38JiEMXFnk2H5SVN96WGdGWWRKJUn1jjkiqjcAJX1OGQkASYDBOaZDu4kIUMUm4HZqF+10Hn7Rkrl9r8uw10MQdsXhkMsutPxJi/4Jr1yWH1M64KMiIDfqZ4jP7P0OjL1NCkML0av8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cTzS1Vrm; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cTzS1Vrm"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8423f236418so309244b3a.1
        for <linux-kselftest@vger.kernel.org>; Wed, 01 Jul 2026 05:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782910508; x=1783515308; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EroqQiItWF/5lEtz72HFMxBsfBPJ4HAZsMtLOvEmqnc=;
        b=cTzS1Vrm7CO7mIltOpjaTc3g/KiQDVdSIIGWseSDIzaavDa6oG/X7UCJHOqh9SGbk9
         CCg5Sipj/3qxWqKUZ1Kn4VQebedt6bE0oX745n5TRJEmNc2XADNO8EGdWe/wLErJ1W2V
         nsljagUMswVikRnp3u8yrceDsfRBH4+oURkp3+zvyFSMXduX5vm//HlHyqEE8G+iSiwO
         WvbgEjNBCBKQphzpwknwPy2ijDFhkXu5CErA7f4/Qt5XWcaXA3dRLLckfdbS/OneMUcI
         ZiuliSi7YcAsnCWcwCtXgprRxFYL/VvWVzR6/ImheD3Z5/uRZXNqVBWjBUStnB2HKOK/
         1BIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782910508; x=1783515308;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EroqQiItWF/5lEtz72HFMxBsfBPJ4HAZsMtLOvEmqnc=;
        b=sLOjcejTC/UrHip+QOafRvwLFAA17lcYhgTxiyELjHBOFvp35FYZoaFfIwNYaH6CKG
         Va0RsE9OgXfSwmERKyDeU7TYbmT65JUa0xwHM9qQkXOALQ78XkeCyDtAHGVyiqUiBN7M
         HVrAGsPsHPoQJmnEZO7rn0dZVUPgQQwZrRSetIsTj/3YT0uVpa2ox3WdOOjXk9Z735QJ
         wQUlYjbeT9vL7mtBNAewrE/M0QC6rkg6DbOa6NcrecAH53AXTvxQZ0eS4E+VSi3B92rT
         bYFCZl+42OC92yFjuiHSg8QMCnXo/JkQ5gJGACFxl7UPpBrFily+O2F0p+R07lrvAbC2
         uWxA==
X-Forwarded-Encrypted: i=1; AHgh+RrIJ5ClYdBckhwKCs7U7vcxbDC5qNbuO7j7zfLL9iT7gBBkgHikKtKBfM6PK9GS0adm2kd9nA2tec9LXym4YLE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yym+wa2OlAdQeK6Ajy2LZdZJ8xmBkYae2CSL4x0e5TlWreEWEzN
	744bZ3DMznSOTK+YhWjccO7pvg+XIBkwHY7Vd1xDnclWpiNK8f6yRsGZ
X-Gm-Gg: AfdE7clTNcEDP1QxZgwYmkZQNiwBpzXzOtb+XK5960XKtadp7MSOcvCLH9jZhqubVIE
	DXRSO+recZiB21sJ6TpJH0G1k/sxf73sVe42NQ1DsAtS5vKqFZaaZcX+tnAyv/wjw6oW2Q+FQJ5
	TFlaq9Wl7t4yoUNL5ukKV6hjfktUOP/BMmTngoUCyEsBAW/AgELnMNxrfwfHnd5souz+8q8LpOL
	0V9JN+0gsF9ZZa6hX2rXWlaUdu7tWRBbWN610EW01HJ8osQxP344AZV2D8PdotcXEgtDlROGbhr
	N1CyiM+BIaEyXrai14mXXnHsWwsHEuCw4lH+OF8ckzvSxBsAgWmAPSgtJPbN3t+TB0dIK13SVH0
	UsUGX47u+8vkokdR5IVGfT2668MNTDDhRueSs/820Q6HBdV+cMu1lT+skdWNQyhkLIuFaNMGspl
	eG5eB0dMc0BnrQVwbF+Zda
X-Received: by 2002:a05:6a00:4299:b0:845:d274:c024 with SMTP id d2e1a72fcca58-847c51eff2bmr594580b3a.61.1782910507939;
        Wed, 01 Jul 2026 05:55:07 -0700 (PDT)
Received: from [127.0.1.1] ([120.244.9.45])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a03778basm3999403b3a.49.2026.07.01.05.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 05:55:07 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Wed, 01 Jul 2026 08:52:28 -0400
Subject: [PATCH v5 15/17] riscv: cpufeature: Introduce ISA bases bitmap and
 rva23u64 detection
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-rva23u64-hwprobe-v2-v5-15-2c61f94a695a@gmail.com>
References: <20260701-rva23u64-hwprobe-v2-v5-0-2c61f94a695a@gmail.com>
In-Reply-To: <20260701-rva23u64-hwprobe-v2-v5-0-2c61f94a695a@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Zong Li <zong.li@sifive.com>, 
 Deepak Gupta <debug@rivosinc.com>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@linux.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Chen Wang <chen.wang@linux.dev>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 Conor Dooley <conor@kernel.org>, Jesse Taube <jtaubepe@redhat.com>, 
 Charlie Jenkins <thecharlesjenkins@gmail.com>, 
 Andrew Jones <andrew.jones@oss.qualcomm.com>, devicetree@vger.kernel.org, 
 spacemit@lists.linux.dev, sophgo@lists.linux.dev, 
 linux-kselftest@vger.kernel.org, Guodong Xu <docular.xu@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=6016; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=SVIa4L8k84ckCPyHRMWQbuV12ITePXE/vVAii5SjE4s=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhixX3vbKL4XCy56dmdCTfL13h/g5z9/zTESLDzx4rOa37
 YTe3pDFHaUsDGJcDLJiiiyHj7Zkb33lE+37nPMHzBxWJpAhDFycAjCR4gOMDJts5O7KtM5beqor
 6MtRLmZtzvajOpL55t//if5Rm+Tyy5rhn/qeOwf+P8wT5ufQmXriU9G58k/5Z46smxZ3oCUp74S
 IPBMA
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE

Introduce a per-hart and host-wide bitmap of conformant ISA "bases"
(named profile-class sets such as IMA and RVA23U64), computed at init
time by riscv_init_isa_bases().

Register riscv_init_isa_bases() as a subsys_initcall so it executes
after core_initcall(tagged_addr_init), which probes senvcfg.PMM and
populates have_user_pmlen_*.  Without that ordering,
riscv_have_user_pmlen(7) would still return its default false and the
RVA23U64 detection path would always bail.

Consider this as the cache that subsequent consumers (hwprobe's
RVA23U64 base behavior bit, /proc/cpuinfo's "isa bases" lines, etc.)
can read without recomputing. System-wide consistency are ensured.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Signed-off-by: Guodong Xu <docular.xu@gmail.com>
---
v5: No change.
v4:
- In riscv_set_isa_base(), reorder those __setbit(RISCV_ISA_EXT_X,m)
  lines to make them conform to the order they appear in the RVA23 1.0
  Profile.
v3:
- Add a blank line before the subsys_initcall() registration (Andrew).
- Set the local ext_mask with __set_bit() and test the mandate set with
  !bitmap_subset() (Sashiko).
- Require the Zic64b ISA extension in the RVA23U64 mask,
  instead of open-coded cache block-size check. (New, thoughts from Andrew)
v2:
- Implement riscv_init_isa_bases() that runs at system init time,
  after tagged_addr_init() populates have_user_pmlen_*.
- Split RVA23S64 placeholder into a future patch.
---
 arch/riscv/include/asm/cpufeature.h | 14 ++++++
 arch/riscv/kernel/cpufeature.c      | 90 +++++++++++++++++++++++++++++++++++++
 2 files changed, 104 insertions(+)

diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index 739fcc84bf7b2..facc31b2960c6 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -25,10 +25,24 @@ struct riscv_cpuinfo {
 	unsigned long mimpid;
 };
 
+enum {
+	RISCV_ISA_BASE_IMA,
+	RISCV_ISA_BASE_RVA23U64,
+	RISCV_NR_ISA_BASES,
+};
+
+/**
+ * struct riscv_isainfo - per-hart ISA state
+ * @isa: bitmap of ISA extensions this hart implements
+ * @isa_bases: bitmap of profile bases this hart conforms to
+ */
 struct riscv_isainfo {
 	DECLARE_BITMAP(isa, RISCV_ISA_EXT_MAX);
+	DECLARE_BITMAP(isa_bases, RISCV_NR_ISA_BASES);
 };
 
+extern unsigned long riscv_isa_bases[BITS_TO_LONGS(RISCV_NR_ISA_BASES)];
+
 DECLARE_PER_CPU(struct riscv_cpuinfo, riscv_cpuinfo);
 
 extern const struct seq_operations cpuinfo_op;
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 4c3bf813af052..fa8471aef42ee 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -41,6 +41,9 @@ unsigned long elf_hwcap __read_mostly;
 /* Host ISA bitmap */
 static DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX) __read_mostly;
 
+/* Host ISA bases bitmap */
+DECLARE_BITMAP(riscv_isa_bases, RISCV_NR_ISA_BASES) __read_mostly;
+
 /* Per-cpu ISA extensions. */
 struct riscv_isainfo hart_isa[NR_CPUS];
 
@@ -1304,3 +1307,90 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
 	}
 }
 #endif
+
+/*
+ * Compute the set of profile bases (IMA, RVA23U64, ...) a hart
+ * conforms to, given its resolved ISA bitmap.
+ *
+ * If @isa_bitmap is NULL, the host ISA bitmap (the AND across all harts) is
+ * used.
+ */
+static void riscv_set_isa_bases(unsigned long *bases, const unsigned long *isa_bitmap)
+{
+	const unsigned long *isa = isa_bitmap ? isa_bitmap : riscv_isa;
+	DECLARE_BITMAP(ext_mask, RISCV_ISA_EXT_MAX) = { 0 };
+
+	/* IMA */
+	__set_bit(RISCV_ISA_EXT_I, ext_mask);
+	__set_bit(RISCV_ISA_EXT_M, ext_mask);
+	__set_bit(RISCV_ISA_EXT_A, ext_mask);
+
+	if (!bitmap_subset(ext_mask, isa, RISCV_ISA_EXT_MAX))
+		return;
+
+	set_bit(RISCV_ISA_BASE_IMA, bases);
+
+	/* RVA23U64 */
+
+	/* Supm with PMLEN=7 */
+	if (!riscv_have_user_pmlen(7))
+		return;
+
+	__set_bit(RISCV_ISA_EXT_F, ext_mask);
+	__set_bit(RISCV_ISA_EXT_D, ext_mask);
+	__set_bit(RISCV_ISA_EXT_C, ext_mask);
+	__set_bit(RISCV_ISA_EXT_B, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICSR, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICNTR, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZIHPM, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICCIF, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICCRSE, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICCAMOA, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICCLSM, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZA64RS, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZIHINTPAUSE, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZIC64B, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICBOM, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICBOP, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICBOZ, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZFHMIN, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZKT, ext_mask);
+	__set_bit(RISCV_ISA_EXT_V, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZVFHMIN, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZVBB, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZVKT, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZIHINTNTL, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICOND, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZIMOP, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZCMOP, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZCB, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZFA, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZAWRS, ext_mask);
+	__set_bit(RISCV_ISA_EXT_SUPM, ext_mask);
+
+	if (!bitmap_subset(ext_mask, isa, RISCV_ISA_EXT_MAX))
+		return;
+
+	set_bit(RISCV_ISA_BASE_RVA23U64, bases);
+}
+
+/*
+ * Populate the host ISA bases bitmap (riscv_isa_bases) and each
+ * hart's per-cpu isa_bases.
+ */
+static int __init riscv_init_isa_bases(void)
+{
+	int cpu;
+
+	for_each_possible_cpu(cpu)
+		riscv_set_isa_bases(hart_isa[cpu].isa_bases, hart_isa[cpu].isa);
+
+	riscv_set_isa_bases(riscv_isa_bases, NULL);
+	return 0;
+}
+
+/*
+ * Registered as subsys_initcall so it runs after
+ * core_initcall(tagged_addr_init) populates have_user_pmlen_*.
+ */
+subsys_initcall(riscv_init_isa_bases);

-- 
2.43.0

