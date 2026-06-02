Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D62D13939D7
	for <linux-kselftest@vger.kernel.org>; Tue,  2 Jun 2026 20:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780433965; cv=none; b=T3B6OoRbGvewFoOmmsC1tpk8jM1/OUieST5j4ZHHOVj9Warv0maT4+jeUm4EMJZeY/Pyn7+Vlcxq7YsXC86lZr3Y3MamSfpuj1R8PQmYyp4846+eJDyuUhaGjhPt/rMSY+W9xyyVD4sSFNyFJuZtBw6RniYEESTd2tOwzG+umOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780433965; c=relaxed/simple;
	bh=OIL4u1059wQePR4fBxdtuuk+4+q2KWiT2f5tiuzz13M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sHkpkTBjMUB7T0OzBVW89TPmERcGI0CcFEZTfSn+cY5J1u+q3QFDjil8gvgVB+4uLVhQajHA00ep4kkmbhwLPQy5ei59Y2eloIRuFvYUWhlDC2pkpwEOog42qX5+BLcw8mwxlH41ammMTfb8vmMnSXoEjroZZPfd/qI1A6rBjyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X3rnsinv; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X3rnsinv"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-36b95eb4bb4so2730101a91.3
        for <linux-kselftest@vger.kernel.org>; Tue, 02 Jun 2026 13:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780433963; x=1781038763; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ea3yw5dmVH/Wal3jfG05beYzbzDpKpyYIVD2MX/4oR4=;
        b=X3rnsinvLeEIbf83NUNYYy7Bw6LQVHa4Gzuz18eiLNaRBPAOb0hxcZRtAxMmS82VoW
         VNt5SI0rXyKiZ8TzkU26gzdKqQt9zNCuVuiE1ohrQiLz45y5M8J6ow2CIOnFnaag8NIv
         idNygrWig9WQQQE8e+kJLtkXnjG6qTIvoq6kSzL3U1fan1UWimk5L8XlnD+9vUQurT75
         LCrdFnZk8CDksdgOFEkYsmSdbJqowzHsWa7ZLzLQCwtDhCvUAV8aEwnmXmt3LkUhsUyP
         Zj3q5FP1eRY7plChpcPolE56iUyDNYvDt7J8haU54C9rjAV23qywgk9/iBL2/vozY2pC
         GN8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780433963; x=1781038763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ea3yw5dmVH/Wal3jfG05beYzbzDpKpyYIVD2MX/4oR4=;
        b=fPZlo+LlyStoFXI3+axwOU56ACeoNc0PV/eE4jy/sH9Zw6fcdlNmBkxdYB3qRDVJg5
         B/PNWRcw2/1afbXiLerdC5pfQ2l41clevMvQJnbXRvAzA6tH5EQ4l5PCMJPwox6EQx77
         0MiKi19/wq0GNo+/Hq4Pbaz7rcP2+A2sHFkZ53tMo6cWQ+b/FdlpXyG8FRbhZwih+bcb
         1EXOwFMwxd5ZIJYS3IJcxxSD2tF1YeSSMxYhxajQm4whqc284DwrRKWlsGlbJMaiwUdC
         3+XIiFAvx4V1eAFOD8pTkQE0URtdTXya9J9DmjKU8uBBPqCzDIRLS9PLsm4AQxt/YwhF
         L/Yg==
X-Forwarded-Encrypted: i=1; AFNElJ9YgIzo6me7SfTgoj0CaJ3N7J8CEtjxxnYtY8Z1D7RRWIJgKwbm8Gw2WEZQi6OjgUJMRi9WIKLgreAz6kNvrks=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQCWNfx5zj21Wb6KVsfaxiGBGHrBjESAfccj13e+YNPycc5AF1
	4yX2oB4Rlt+eisQVxUywbBgyPamYDe3nnM22x+6FDfehAg2oz91A99Xv
X-Gm-Gg: Acq92OGgxpT8Kq10a9LWtVkVEi6p817ym0cIkQaynFg4JGh6aJapc7FT2FZCLCtMtWJ
	MujxhQg1yZIaq+OIRQ2dvmWNYdMjjrknPgcioYNhomDRVSQs5NQqfQ6c1LbCXlPTqoC9HkLF5/1
	UC3pnaNcSSALV3pUbnwZnMnlTsatHXQRzgVGmFPNez6EuSo7Qjo262ziV2j5+xjdvbNKZs2OwFm
	OIgeFTcdnIt5caxoiy7r9OfxClCjsQzdnfcCuG7p5Vre78AGOjXvDMI6fjBkHuFPt0j2gA2Lrup
	r4znOXQFDzHnYCEi2LqxG9NJ1fOZ4pv3L8u+Aev+TA15P3SSET5iV2sx/8ishsfGtwUZ536B6ZE
	sXJCQRcBPaVTNnZ6xyPnz/w21ENFN+f0ODIht4cD8iLc88MyxkLaYukHBfgMRZUhX1N2+DYbLRz
	Ej1XyibiQKCJOz1WHM/j4/O+aT1Tu/R/ffr2IAfx0Z/QTiWaZkyZqUPHIuXOM+0f6UC3EHu9L6E
	pFCjEILTjsMkBFY
X-Received: by 2002:a17:90a:b401:b0:36b:5b82:4834 with SMTP id 98e67ed59e1d1-36e30c213bfmr311928a91.7.1780433963026;
        Tue, 02 Jun 2026 13:59:23 -0700 (PDT)
Received: from computer.goose-salary.ts.net ([2a09:bac5:3b4a:11cd::1c6:2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df043223sm157354a12.8.2026.06.02.13.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 13:59:22 -0700 (PDT)
From: Varun R Mallya <varunrmallya@gmail.com>
To: bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	bjorn@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	puranjay@kernel.org,
	menglong8.dong@gmail.com
Cc: martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	pulehui@huawei.com,
	alex@ghiti.fr,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	varunrmallya@gmail.com
Subject: [PATCH bpf-next 1/2] selftests/bpf: use host CPU features in JIT disassembler
Date: Wed,  3 Jun 2026 02:28:46 +0530
Message-ID: <20260602205847.102825-2-varunrmallya@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260602205847.102825-1-varunrmallya@gmail.com>
References: <20260602205847.102825-1-varunrmallya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Pass the host CPU name and feature string to
LLVMCreateDisasmCPUFeatures() instead of using LLVMCreateDisasm(), so
the disassembler correctly decodes CPU-specific instructions and
extensions such as RISC-V compressed and vector instructions.

Signed-off-by: Varun R Mallya <varunrmallya@gmail.com>
---
 tools/testing/selftests/bpf/jit_disasm_helpers.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/bpf/jit_disasm_helpers.c b/tools/testing/selftests/bpf/jit_disasm_helpers.c
index 364c557c5115..3558fe10e28c 100644
--- a/tools/testing/selftests/bpf/jit_disasm_helpers.c
+++ b/tools/testing/selftests/bpf/jit_disasm_helpers.c
@@ -96,10 +96,19 @@ static int disasm_one_func(FILE *text_out, uint8_t *image, __u32 len)
 	__u32 *label_pc, pc;
 	int i, cnt, err = 0;
 	char buf[64];
+	char *cpu, *features;
 
 	triple = LLVMGetDefaultTargetTriple();
-	ctx = LLVMCreateDisasm(triple, &labels, 0, NULL, lookup_symbol);
-	if (!ASSERT_OK_PTR(ctx, "LLVMCreateDisasm")) {
+
+	cpu = LLVMGetHostCPUName();
+	features = LLVMGetHostCPUFeatures();
+
+	ctx = LLVMCreateDisasmCPUFeatures(triple, cpu, features, &labels, 0, NULL, lookup_symbol);
+
+	LLVMDisposeMessage(cpu);
+	LLVMDisposeMessage(features);
+
+	if (!ASSERT_OK_PTR(ctx, "LLVMCreateDisasmCPUFeatures")) {
 		err = -EINVAL;
 		goto out;
 	}
-- 
2.54.0

