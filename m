Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B614481FA2
	for <linux-kselftest@vger.kernel.org>; Wed,  1 Jul 2026 12:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782910520; cv=none; b=ULijazTV/+JWGpABGdkj+ilcQydg4uNiAvrbR2b1XYsyC8h/bXVv0wS+BXnxRfXktVh83JFgPmLIk3kgYgW3Ym9VRbKjwSaFh6NLjOsI5lqw2CcmeGkUsr0+UhuyI7e/KbdDmA8kWkh6hQs+WuGp7OpjQfo7jvFLTAXDOFKkIVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782910520; c=relaxed/simple;
	bh=AZMqGWE/1kDk6APgiFn067C7/pSKrIkfc/qqQaj5N6U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tbOaX/6C5WKgfZXT8SZPDCXV8vOQRUh16uYKw5cJmtYI1UIRvIQhM2r/R8AYff+fZVGHyuFZFcb2bQI8PZ4BxWxoXa8TThFIWZojv1IMJUkY6maB2pOaXFfHZfeNFvsjkZ+kYp+LqD2zja0882hsc+eqfI5LF24OOIOLSROQUPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=klvnarsl; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="klvnarsl"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-84532e3dbf7so311128b3a.1
        for <linux-kselftest@vger.kernel.org>; Wed, 01 Jul 2026 05:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782910518; x=1783515318; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LiBQQxNYM4uZUtFA87RPryKjgpX8pd16ygJCO2DXwWg=;
        b=klvnarslDNru7qq0H4tgLPfBpFx6mHXXaGeJy7K+dFPEYDFoV5wEa53PZCZRJpTIcf
         pAukk9ECk1ans6TaRaY+X9jE2QTKrZ/rZIp9Vji3eqFSVQ5AZRqcGKmskJ9J0s8mYggx
         X2S3onhXK3UssKwmkiiTnQVKWV4yLR03tbH/OMyqw98A9Yo4PYNtDFs18MUOkS5Ej9F9
         ZkS4akc6FZLMfRDcu6bau7Iy/pNwWtT1Vf+l/czE0ycDIU3/T9dsjx9/Lnnf6XY1ljAD
         12UJRlgZVWSzIxDGR7/Bu9L8Q0TtPRnwQ/AFk9Dx9g0mpt148Dpwpy0flXzk7Ussaj8G
         yiZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782910518; x=1783515318;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LiBQQxNYM4uZUtFA87RPryKjgpX8pd16ygJCO2DXwWg=;
        b=aExevnQ/FdbFapXffTYuugIFGVO+FXo64wsN7vvbRYk6tqErrNcORyyAnoWBD1lSOu
         erhPQuquZSR3ArxlAkFsJAMdgPcXVpVo2iAjvdsuMKcOdCZ5sfCSK+tK2jzp1Rm0eGwJ
         0ORBFRMsTpIhKLMzs1iQ3Q1Gg9BHoJtvxVqcb7JNdL9hqZetBtXconlSLoDpF6RVY/4J
         O2piuowYchx4Y+FBpRWfWU+CvV8gwjT0REQ8vh3O3xD7WRPCgutLLuCwUiWtPFd6eu68
         gxQlRe0EDmoIFf15IuzNrNM/GxABEvwm1PApRirfjU4J7n1NuWGDI2QMVCjNyqixK15c
         6HGw==
X-Forwarded-Encrypted: i=1; AHgh+RreL7p8zJ+14QZWQHFYhkwwpzI0dJCKFl0VJAutOffnFm+uXYIccbjcsyi/AVY6fIuJSBcQ6WXQR+Na964d4pM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8GGz+Uin0+w5irAwq3P74YeojiLNNt2EGD1O9TINeXiFh8V/8
	PwQ8iki+RVymw0rs52tdFsoRlbEhNBvUHV75IMph0S+WctbIWT3o9kCd
X-Gm-Gg: AfdE7cmSNGcdaldgS/LpUJK+30bvGT4Fha1bWYNHHuyvIimJvmIRrVNMlqWsMd+84w0
	lQ7G+JV0C6zF6h9xtAdRjojPw/+OclZZx0FDkyJd4elTNjZ+e0gTLqq3ZAq2Y5gPz6KgFJFSZ5s
	Zoe2S6SobR3xYTyUk1ZiWOC+C4FHz9eObnYjJ1a+VuikSF8qbgl1gth/Qn3cSgbrSXlUQzYufgz
	LRSsQsj083rW1kgEo8KoyMdlHz7CePuJFiFAqlT3lSwzftWY0O79C1gcR8NuLOLEDv2cr2Il3UC
	W7fn8r4Dpkpt4CcQebIt9FgdeJtYcH763PnULpwXf1fnFeavs+t55G5ip2Mtnt8QYTZzGfrVS3S
	B5K+VNATaIIV6MqtpBYIGtbsjda0U2xX8UnkajYLhEjm4mPCZ2YSPUX09cJvVV/+e4plFMWj5Kf
	wLWc45b4oIbUEFDUdpNjIMjc7yJpcr1tg=
X-Received: by 2002:a05:6a00:3d0f:b0:846:7fb0:4ca2 with SMTP id d2e1a72fcca58-847c0ad5539mr1299225b3a.61.1782910517479;
        Wed, 01 Jul 2026 05:55:17 -0700 (PDT)
Received: from [127.0.1.1] ([120.244.9.45])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a03778basm3999403b3a.49.2026.07.01.05.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 05:55:17 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Wed, 01 Jul 2026 08:52:29 -0400
Subject: [PATCH v5 16/17] riscv: cpu: Output isa bases lines in cpuinfo
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-rva23u64-hwprobe-v2-v5-16-2c61f94a695a@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2714; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=AZMqGWE/1kDk6APgiFn067C7/pSKrIkfc/qqQaj5N6U=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhixX3vZ0bcszqXWzr7H3vl/xnun9rDRel9u3b78RzeZ9K
 Pl8q/7BjlIWBjEuBlkxRZbDR1uyt77yifZ9zvkDZg4rE8gQBi5OAZgImz4jw8/3Bw6vvM7R6vxn
 zpxcu+Ste19xJK+qf7zmv0FxXf+P4GJGhv2zd2Q0h4gHqRl26a6cfqCR0Ynj2U9pH0c7rRNzT/v
 EcgMA
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE

The "isa" line in /proc/cpuinfo lists a hart's extensions as
concatenated string, but not which profile base it satisfies. Add two
lines that report them directly:

  isa bases       : <bases that all harts conform to>
  hart isa bases  : <bases that this specific hart conforms to>

Example output on qemu booted with -cpu rva23s64,sv39=on,pmp=on:

  processor       : 0
  hart            : 4
  isa bases       : rv64ima rva23u64
  isa             : rv64imafdcbvh_zicbom_zicbop_...
  ...
  hart isa bases  : rv64ima rva23u64
  hart isa        : rv64imafdcbvh_zicbom_zicbop_...

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Signed-off-by: Guodong Xu <docular.xu@gmail.com>
---
v5: Simplified the commit message.
v4: No change.
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

