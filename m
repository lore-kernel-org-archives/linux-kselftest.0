Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10E048A2A8
	for <linux-kselftest@vger.kernel.org>; Wed,  1 Jul 2026 12:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782910387; cv=none; b=MgLezg/68lpPgnuRuOq7r8qVeT9gW1W0WfKZvBD987VGPu4pe5QNskxUt2oZpm0ZJck96jR0qMDSHmas9m2QjvHCppwhFNeLbLszxbYud5GUzdTwNIjkg9YFWOOJgRYAG3pT0rx4+J4l8Bweb6NNoMRcxm4hJcXtm1Q0AoCDBVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782910387; c=relaxed/simple;
	bh=Mj/jc48sV87uDVzvatYAwc8BfoVVAQ4Az5OASSMTFWY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X2PczmtMiIZteNLO2+TFNkbbILoYpK+YRkZ7gx6zSoLHriVUTUf1cKkPLK6E7npDflz0mZvmforvy3nTZxdylQynPvoY//srHZZqFZzEWBvvDOgL30wHBpfkjj3U7MyPAOnbQCHWn8Pq+t0JmeSxXCDU2L4ODBaMMQHqEjQcdfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MMCCo6KB; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MMCCo6KB"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8454160043aso418096b3a.3
        for <linux-kselftest@vger.kernel.org>; Wed, 01 Jul 2026 05:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782910385; x=1783515185; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EHQ0LcaMXNLnejiZpmBDaHZFQC9wnXmjmMb8Eu8ttio=;
        b=MMCCo6KBnvBBPiKMEFhP45+z/TGW990SiQm1EJ7k7rxblYFLTSFwyOSw+BvHkhADYk
         W4C0ZqthA7iS/E3ZUCDdIKgthfZ0hrutteil8MRjBNfgEyfCRGv4nD5OD+xyPcycXz8W
         jsl+Nsg3/g3WAZLFRE8y/+1wXwmxYC8dIpuL2me/lP7SYza39XKVZ3+V9cm1k606wkMX
         u0gl6I/yX9wh4Pigc0gKR07wZNB7lPe6B1bog/wh3aU2atlvroS1YNqjnwDPKZjn9s+4
         ngGBFr60/Hk2NTwpY4vfmrSyqhMV3r5bjWaLtnOl/03artCwHxB5Pl0Fvz+48oddcqgW
         9fRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782910385; x=1783515185;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EHQ0LcaMXNLnejiZpmBDaHZFQC9wnXmjmMb8Eu8ttio=;
        b=Ek1QkY9oi/Tm0yTc19Hdjq919MeS0Skm8sWp9j/frbL1GThiraLBIFS5fUItHSfV7l
         LdloZTSH1SfaUn23NN7DNihCnkobqLAi2JWfkJtxDCB00aZ/Cg2/2I3y1IOAnwtxw6qE
         hw98SYdt72MI4c8M1jF3V997ee5r/sRYjcpC0IlGXeFfrc9lmKc453sMZxBRV9qVb2UV
         qabTij5gmgY7UzKweqJSA+SqptynO5uIc8eRRr1Q+h0yysrpTFzak5rs32CLzazC979C
         s9kwKC6v+CHQ3WzIyNb++uH5+3HZ7p5uY6X6/bJm7KUR2JD1mny+6AMUU6E3q8qm2DXt
         fB2w==
X-Forwarded-Encrypted: i=1; AFNElJ8Q0+dR1ewOEhOjSPSpilKRKU3uxn/pg2/QS0fY3g7KmkdSv4xZgZKBl6jCE8baiklf549tucBD3Ako3QcYRwA=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywwd1Yw471hrfNqGOIOxCxoucW4pXCJy1sfek0HEIfSnvY73Wly
	4e2jgMGhavmAN7J8dgvoHZGx9hmOAA9oF1nbnNNXRVOl/qbqNqaOH8FX
X-Gm-Gg: AfdE7cmeA1gLBh+6bbDwmTiRPlNAXkDhbyCSnVcNF3tmuv7HgIvPPUBRRD1yA2FUwwP
	355p5mnmvwQ4Hwk98bn0XewEWZFVBGLn7fDFs4ACSMSO6NNKfv/etNz52y4syG9xcFaB3o3gQEc
	O2KIF7tn1u8nPC3zthBBmtm9rirjRs1OTUdlBtKijWk4pExa8lxfwR36lBjS7nMLqWsZLV3NI82
	/U2rPQJr8eVbgphK6qfmyiMsjIFo5B4c8xeIatehiRn/KtXGKhYDEIJiJelzkq8RuuhOwCAYrll
	IZisAlAC2dY/z/wF4lfYx8wLOetMLQpmlFLIYSYWMAfR2+Ad1xhr2aQxQMg0DqX0Gll+kjHRxzO
	gqRgJdNn79UVLX358jJBwjgKdnPgInfWAyVMxQeECwj5gh6sB1uDxau8fz620Fpn4tZBQBCMO+h
	GbjPA0Ozl1Cfe9ng1/M4pu
X-Received: by 2002:a05:6a00:1807:b0:842:614e:cc94 with SMTP id d2e1a72fcca58-847c07c470bmr1457464b3a.26.1782910384742;
        Wed, 01 Jul 2026 05:53:04 -0700 (PDT)
Received: from [127.0.1.1] ([120.244.9.45])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a03778basm3999403b3a.49.2026.07.01.05.52.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 05:53:04 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Wed, 01 Jul 2026 08:52:16 -0400
Subject: [PATCH v5 03/17] riscv: hwprobe.rst: Document EXT_ZICFISS and
 EXT_ZICFILP
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-rva23u64-hwprobe-v2-v5-3-2c61f94a695a@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2247; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=Mj/jc48sV87uDVzvatYAwc8BfoVVAQ4Az5OASSMTFWY=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhixX3mZJjpaMfwwzVXI/rvz6L/tgtcy6pWL2lXrhyT2qs
 1vW9bR3lLIwiHExyIopshw+2pK99ZVPtO9zzh8wc1iZQIYwcHEKwETCJRj+Gf5ueu5RxNO+z0s8
 M0cw7Vlw5erEXQ/m7J4Vf2HuA9Vp3xj+x/R4lX5ZzDh3gswrDceiPfqPlsr5iyi1vcx8+Ev9e2I
 6IwA=
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE

RISCV_HWPROBE_EXT_ZICFISS and RISCV_HWPROBE_EXT_ZICFILP are defined in
the hwprobe uAPI but are not documented in
Documentation/arch/riscv/hwprobe.rst.  Add documentation for them.

Link: https://github.com/riscv/riscv-cfi/commit/302a2d45c2435940d9a63571c66bc038adc74133
Reviewed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Signed-off-by: Guodong Xu <docular.xu@gmail.com>
---
v5: No change.
v4:
- Update the commit message.
- Cite riscv-cfi commit 302a2d45c243 (tag v1.0) instead of ff03d8485a04,
  per Andrew.
- Add a Link: tag for this citation.
v3:
- Also document RISCV_HWPROBE_EXT_ZICFILP (bit 63 of IMA_EXT_0), the
  sibling enumeration to ZICFISS (Andrew).
v2: New patch.
---
 Documentation/arch/riscv/hwprobe.rst | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index a09a8f16bd16f..d9928641deb99 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -289,6 +289,11 @@ The following keys are defined:
     defined in the RISC-V ISA manual starting from commit f88abf1 ("Integrating
     load/store pair for RV32 with the main manual") of the riscv-isa-manual.
 
+  * :c:macro:`RISCV_HWPROBE_EXT_ZICFILP`: The Zicfilp extension is supported,
+    as defined in version 1.0 of the RISC-V Control-flow Integrity (CFI)
+    extensions specification, ratified in commit 302a2d45c243
+    ("Update build-pdf.yml") of riscv-cfi.
+
 * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: Deprecated.  Returns similar values to
   :c:macro:`RISCV_HWPROBE_KEY_MISALIGNED_SCALAR_PERF`, but the key was
   mistakenly classified as a bitmask rather than a value.
@@ -391,3 +396,8 @@ The following keys are defined:
 * :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_1`: A bitmask containing additional
   extensions that are compatible with the
   :c:macro:`RISCV_HWPROBE_BASE_BEHAVIOR_IMA`: base system behavior.
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZICFISS`: The Zicfiss extension is supported,
+    as defined in version 1.0 of the RISC-V Control-flow Integrity (CFI)
+    extensions specification, ratified in commit 302a2d45c243
+    ("Update build-pdf.yml") of riscv-cfi.

-- 
2.43.0

