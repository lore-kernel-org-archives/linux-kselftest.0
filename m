Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9277B3CE48F
	for <linux-kselftest@vger.kernel.org>; Tue,  2 Jun 2026 23:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780442122; cv=none; b=q389AksjEX8+2Rt4+/VJJz9jLxgich+/YxM0UGQTD685Tv75ec0RDR+XkCGrFcPK0J1I65a8NsQxam8G3TiI8b+AvD3GTLXfdb2RuA/BXc5B2QbXDnpPX8/wNjyrifugzGduQUu37Pa6ODpyTCCy0kvyQ0FYUcwf8nc3fnuZbkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780442122; c=relaxed/simple;
	bh=sOGp0iB3i67htt/vt0YyWfexKgE348qHxnlSOAaqgUc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N3QQC5BO7/i0OvafHN68I3xSNiJ+WEZfx6DRtHCOWO2RnD/3PvrcTEpEmkIcCOto4n8A7Jfj1iqpClbZmSBQmhysJH56+aTbfiQS/+2mENGpe6elDMyttKrI7q2TFViMvxbkSzkkkEmNvtlaUAbkOwL2vvVQXzcnsPc7qaHq1zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vdp7FyRI; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vdp7FyRI"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-36ab8816a35so5918454a91.1
        for <linux-kselftest@vger.kernel.org>; Tue, 02 Jun 2026 16:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780442121; x=1781046921; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iPBQ++ePsPMFHRPcO/XS56r+jXgkNVBk54cuehJ0cRo=;
        b=Vdp7FyRI45B5zevlEpnX7YixDmJW8LBoZlbpIQMj4afwObPf4c0ec/jfwz1Pz8YcOJ
         0q9KEKxgBDjcFe9U/VUlAcLC5I/zUwuZUrIT6iV1jQx0bmRUUapCiRPwyqJBQ56sdSD9
         nwMqxISQ40Qc3PrYR3mlVc/7dm6FB0vXvUVACAHQmERYeRpn94gLbzSdDS31iD1ZWzSC
         dxpA+7MtNSdCMUD+ATghE/91W1qN8GTEQGGtWolIEweBqLlTTXFq47WGCTk3QBmUVWKC
         8ykrxuQ6zBAEAMUUoD70jK94XheNgn2H+2WcHsdNUvYjM2jd9O8wphMtToRDAabCzPIu
         L9MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780442121; x=1781046921;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iPBQ++ePsPMFHRPcO/XS56r+jXgkNVBk54cuehJ0cRo=;
        b=WT9U3xeKxR+566grLoQtwXRPwDT33yhTWNulMK5OwRp2bpRF7E9xn6wGZUag2TuBxC
         BsnPJkY7MMzoAGDm9F2qFzB1rwdqDEVDk+bov+6U4EJhG8OGs6K7ve/1fR+lfMlS6c32
         yKShdflm0lSOxYaKltWr4+MqIEcW/R5iep+JiB7zNtWeO+q4jcYLN0bi5auARmD/Jtrk
         StrWOKjU8i33bQ+E0+JFOpMFycVE/XySjHBvk5Wxs+pnU0N+NhyzJJLd/6dnVPokh09J
         7D2WIqz9vLTCw8Wiyaszr3I5wa3aH8QFX1BaIId+5RROWVgr8ylCSERIUXsKwj394F97
         2ewA==
X-Forwarded-Encrypted: i=1; AFNElJ8SV9uHakJE/FjvM6QEgk+5Ym2aFSddIa89qFbrkP71ZLvwT7NJd0om89P5AXxMslqhvXU9O7OrzcOIXgA4fCI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUrHXYCh+NobW7dgY2brm1CmG1wW+UU/YS1ER6HLz21nfT7xl4
	Ov/Jz6bhniw2UXxvStLG3wG5j64w1De6YYhWjzYnnfPOzNmFKOM6txN0
X-Gm-Gg: Acq92OFS6au1G7nQSVNj6BLRFplxB6u7zmlvFrOoCTy3bFzy6+tcl50vlV77snOmHlr
	KlZ/J0I/hqx1yVkrndVzsadBFlnsOHhkMv/qOkH+h+qBQgJzcLHiWIF+xzCV0EPtoc28P2FV9hi
	O6bRbryQ6IuqDXZPx1/qeWgCfQAIBiCcmLyCpkmP4F5AssWtXtlHqOdeUQUr81MdwgOlwy8UCtq
	PvsI8d0vxjax8y0NdRPCJ4Dvws5PzStcfQ0T32PEC11/FLsWRqrEyWxnxsqorYeBrb05B5FjBi9
	kqCzd/rAkoYCGNFN6zB317NaDvt1YoNIyScmgIWa65EpeKSxuH8YupMVUVeoRm9OyvAju8sYKJs
	RvueGrqoRXzqRuHnYVeAjzdjHHTksq4tiGV5NPohfN804da8E17+i3h/skpqO383UDyI81HgVN5
	K3MqotmnKE9w==
X-Received: by 2002:a17:90b:1fc7:b0:36d:8f51:fe29 with SMTP id 98e67ed59e1d1-36e32285958mr783171a91.17.1780442120719;
        Tue, 02 Jun 2026 16:15:20 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::40e9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16649d2dfsm3302965ad.75.2026.06.02.16.15.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 16:15:20 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Wed, 03 Jun 2026 07:12:09 -0400
Subject: [PATCH v3 14/15] riscv: cpu: Output isa bases lines in cpuinfo
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-rva23u64-hwprobe-v2-v3-14-5529a7b28384@gmail.com>
References: <20260603-rva23u64-hwprobe-v2-v3-0-5529a7b28384@gmail.com>
In-Reply-To: <20260603-rva23u64-hwprobe-v2-v3-0-5529a7b28384@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Zong Li <zong.li@sifive.com>, 
 Deepak Gupta <debug@rivosinc.com>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@linux.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>, Shuah Khan <shuah@kernel.org>, 
 Christian Brauner <brauner@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 devicetree@vger.kernel.org, spacemit@lists.linux.dev, 
 sophgo@lists.linux.dev, linux-kselftest@vger.kernel.org, 
 Andrew Jones <andrew.jones@oss.qualcomm.com>, 
 Charles Jenkins <thecharlesjenkins@gmail.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Guodong Xu <docular.xu@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2801; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=sOGp0iB3i67htt/vt0YyWfexKgE348qHxnlSOAaqgUc=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhiwFHvbsu0dSf3uxan3W+P3ws4linXtVZZ/tdq3sy5l8B
 wK7f5t2lLIwiHExyIopshw+2pK99ZVPtO9zzh8wc1iZQIYwcHEKwET8VjIybPJi3bXcy+RQWf6x
 r3t0GIXNS9Yy3+L21ZSRiO683bLhOSPD3YeMk3iVKxc06qYfmb89acLLpOA9pQsPtry7kjdFtju
 CBQA=
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE

Output two new lines per processor in /proc/cpuinfo:

  isa bases       : <bases that all harts conform to>
  hart isa bases  : <bases that this specific hart conforms to>

These read directly from the cached riscv_isa_bases and
hart_isa[cpu].isa_bases bitmaps populated at boot by
riscv_init_isa_bases().

Example output on qemu booted with -cpu rva23s64,sv39=on,pmp=on
(showing only the new lines plus their neighbors for context):

  processor       : 0
  hart            : 4
  isa bases       : rv64ima rva23u64
  isa             : rv64imafdcbvh_zicbom_zicbop_...
  mmu             : sv39
  ...
  mimpid          : 0x0
  hart isa bases  : rv64ima rva23u64
  hart isa        : rv64imafdcbvh_zicbom_zicbop_...

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Signed-off-by: Guodong Xu <docular.xu@gmail.com>
---
v3: No change.
v2:
- Read from the cached riscv_isa_bases and hart_isa[cpu_id].isa_bases
  bitmaps populated by riscv_init_isa_bases() at init time.
---
 arch/riscv/kernel/cpu.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 3dbc8cc557dd1..31e2857dcdcf1 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -305,6 +305,26 @@ static void print_mmu(struct seq_file *f)
 	seq_printf(f, "mmu\t\t: %s\n", sv_type);
 }
 
+static const char * const riscv_isa_base_names[] = {
+#ifdef CONFIG_32BIT
+	[RISCV_ISA_BASE_IMA] = "rv32ima",
+#else
+	[RISCV_ISA_BASE_IMA] = "rv64ima",
+#endif
+	[RISCV_ISA_BASE_RVA23U64] = "rva23u64",
+};
+
+static void print_isa_bases(struct seq_file *m, const unsigned long *isa_bases)
+{
+	unsigned int i;
+
+	for (i = 0; i < RISCV_NR_ISA_BASES; i++) {
+		if (test_bit(i, isa_bases))
+			seq_printf(m, " %s", riscv_isa_base_names[i]);
+	}
+	seq_puts(m, "\n");
+}
+
 static void *c_start(struct seq_file *m, loff_t *pos)
 {
 	if (*pos == nr_cpu_ids)
@@ -336,6 +356,9 @@ static int c_show(struct seq_file *m, void *v)
 	seq_printf(m, "processor\t: %lu\n", cpu_id);
 	seq_printf(m, "hart\t\t: %lu\n", cpuid_to_hartid_map(cpu_id));
 
+	seq_puts(m, "isa bases\t:");
+	print_isa_bases(m, riscv_isa_bases);
+
 	/*
 	 * For historical raisins, the isa: line is limited to the lowest common
 	 * denominator of extensions supported across all harts. A true list of
@@ -360,6 +383,9 @@ static int c_show(struct seq_file *m, void *v)
 	seq_printf(m, "marchid\t\t: 0x%lx\n", ci->marchid);
 	seq_printf(m, "mimpid\t\t: 0x%lx\n", ci->mimpid);
 
+	seq_puts(m, "hart isa bases\t:");
+	print_isa_bases(m, hart_isa[cpu_id].isa_bases);
+
 	/*
 	 * Print the ISA extensions specific to this hart, which may show
 	 * additional extensions not present across all harts.

-- 
2.43.0

