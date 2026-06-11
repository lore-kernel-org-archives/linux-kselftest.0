Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A7C39EF25
	for <linux-kselftest@vger.kernel.org>; Thu, 11 Jun 2026 20:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781208896; cv=none; b=m20Uanmf7Z84HzCmTZ+1SwEf5eQNVyP6vJwI2L6/oQgV52EchtNjIs2+dqz1BjWD2tKePZwFO+6wU4SlkH90hlhxUG7nU96PzkFItcpLqUSVjjBtsbuYfPFcKr+o7dtb/taPlDPDyCRYuFZuJIeGP/GH7TgYDDpxVbcrrgGqyR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781208896; c=relaxed/simple;
	bh=KC+KeP2JowBZu3gamRptd0wuDLOAfNANiP0q+wCsnA8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EjP1RmQOeQDF4qVEaLw8fiIRr617y9VmN6CUnUOIYX0qjnoJmvXXULUqspDMUqKofagFPa9HCrI+HtXzWUNsK3X7ssWM+HgA80VrbIZN8WInqhQXeAhiLlkbbYerStm0HBoHiwPlGQbWqqCdvCzBFvmBFkJhsaHHxtn5HlsP9Jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R25zVrp1; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R25zVrp1"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2c0c2d8b95bso2083145ad.1
        for <linux-kselftest@vger.kernel.org>; Thu, 11 Jun 2026 13:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781208894; x=1781813694; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1EvRjKx0eOYE4LeiPY86wRBYHx+SwyyhRAbMXyCGdk8=;
        b=R25zVrp17BCEqRvVoxi8QbpyhsuYRx2YZ5r//Ak6kUxL8XdBJ89lQ2egfQBazBcsZx
         NYwe7G6qlbQ0Dqz5qIPzI384UCHCMGgEpC+KJlAC/R3Xj8TIMME2ogeNhavkjQc5ReAy
         iStnfY/NuPdbhI02oJIey+HkAavNudVe3hwMSFEhpfDuZXDjH06e+9aWhuTXMDQ27U0d
         vhsGGSI23PRlsWFuQxmcCI9XmCORFP/+rc1FVKeWI7sWDi8WrKX7sn2nBR3xuRj0ZOOg
         f42hjcv9cxahcgR9XXgOYOsZcnwe6+Fjk82B2QY6gY+NoRyNEqqpDxADygBntVRSExj4
         4OIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781208894; x=1781813694;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1EvRjKx0eOYE4LeiPY86wRBYHx+SwyyhRAbMXyCGdk8=;
        b=snVkAb9fenbQQs4nvJ/rd+VIEMb62Ke5bPeQHhxBTBLfdbkz+rUplyiP7NLZZRTbwA
         SajlQ9UAHrzqXep5GI+U7dVuQ1jEyh8Sux0KkmFSr3oRvG/PED6brIiOWggjC3n2IQgB
         F1xLnL1UE6X1BPes6qauIz8TrR1/kFnlZ+ka/lZE27TyZ5aK8cQ/TEIlyXhQeRO5yaZv
         3o3ij7OUXpWKKouju1XCR+fCzbfTEZgs4H4kCEmN/QwXOqQnjoMlV72+uYrq7cadmjoP
         fRZ50RCfb91hnzQZRMjR166hMIgz1EFzfM5ak3ZOAnqvmMtcD4GbTsx+agtgQx++SiiX
         N4GQ==
X-Forwarded-Encrypted: i=1; AFNElJ8hKGrSj76Yb5xXk8nTohgu9WzqRIJYR2DoPZdl4+eFJl4OPXytpQUBAnr+Mcyrl5OhyK8TmHUP5TlohAfwXZ0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo/QN9SncQP4g212JXKhB6+CzNBkWBImjkzQWISjoMQ3xWRdqj
	Mvy8zgHnFHY5gLKkMhGpY0xjDrLhPlDLu/jp0S3CIEn1pJVlm1SZvoJy
X-Gm-Gg: Acq92OFGHZBoT+WPZyGrvbfoygajzWqtMCwKk1K+673mfruHYUxHCd5BubS9r0mesPt
	uGJqrj2KUYg85YedzGBAuhiIsK7eK9uMifp5+2NLAAok4YhURmbhSHR/yDlP+lONlzfb07ihaQJ
	hOz7x+fXYBusKZ09NoYVtf22rUOEWj8ClT/b+Io9oLOT2Uv0icZPuj2gL34kUUw0xePypPCh0Uf
	lsAh9rsJrqQiqYiC1OnpT1j/XYCGGQsK5L37EEG6DBOQsOk3gj5bJwMaLHlin2xRGZDOX3IZA7H
	kq+5yGsfGHAv1ic41b7dVyP23HWOqxwpR9kNDKfNqK2YIrvlVTw42wprcSXLj/U7NzDV0i0/uLl
	xQ0BWm6r7oGsDvg9l9A1vyA3xNJ7Rqb+rAN35ORe22Wv27VfhV1z/7foug6BqirfpAhZg8KyCXw
	==
X-Received: by 2002:a17:902:e78b:b0:2bd:2de3:5181 with SMTP id d9443c01a7336-2c2f092ad9dmr52178155ad.9.1781208894311;
        Thu, 11 Jun 2026 13:14:54 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::302d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f875casm288730475ad.22.2026.06.11.13.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 13:14:54 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Thu, 11 Jun 2026 16:12:50 -0400
Subject: [PATCH v4 13/16] riscv: Add a getter for user PMLEN support
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-rva23u64-hwprobe-v2-v4-13-3f01a2449488@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1927; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=aIDENBFY4Tz1hqn0W61EOefEH19QM+HExbm6+TQTBeI=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhixtscO7srcsmPNoumimeNn3glenWfu11coN68yXLxOYZ
 /5uzdfPHaUsDGJcDLJiiiyHj7Zkb33lE+37nPMHzBxWJpAhDFycAjAReV6G/yUubxnmvF/+6MZL
 l8/SJWbvGHYUuhnHuDRumFUzqUhm+xuG/wlJztWWR8uzsl2qWjYVRu3cF/DJ6M3TP4cnOldPNJr
 zmx0A
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE

From: Andrew Jones <andrew.jones@oss.qualcomm.com>

Querying whether a given user PMLEN is supported is needed for
RVA23U64 base detection from outside arch/riscv/kernel/process.c.
Add riscv_have_user_pmlen() to expose this.

Link: https://lore.kernel.org/linux-riscv/rfuwa7a3ebe76udmnwyrssjy7shkkgxntvhwzn6oquysj4tuyp@xzvpylcfhz53/
Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
[Guodong: replace exported booleans with getter per Andrew's suggestion]
Signed-off-by: Guodong Xu <docular.xu@gmail.com>
---
v4: No change.
v3: No change.
v2: Add a getter for user PMLEN.
---
 arch/riscv/include/asm/processor.h |  4 ++++
 arch/riscv/kernel/process.c        | 12 ++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index 812517b2cec13..febf51e127f70 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -214,6 +214,10 @@ long set_tagged_addr_ctrl(struct task_struct *task, unsigned long arg);
 long get_tagged_addr_ctrl(struct task_struct *task);
 #define SET_TAGGED_ADDR_CTRL(arg)	set_tagged_addr_ctrl(current, arg)
 #define GET_TAGGED_ADDR_CTRL()		get_tagged_addr_ctrl(current)
+
+bool riscv_have_user_pmlen(u8 len);
+#else
+static inline bool riscv_have_user_pmlen(u8 len) { return false; }
 #endif
 
 #endif /* __ASSEMBLER__ */
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index b2df7f72241a5..5d9cb108a6232 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -302,6 +302,18 @@ enum {
 static bool have_user_pmlen_7;
 static bool have_user_pmlen_16;
 
+bool riscv_have_user_pmlen(u8 len)
+{
+	switch (len) {
+	case PMLEN_7:
+		return have_user_pmlen_7;
+	case PMLEN_16:
+		return have_user_pmlen_16;
+	default:
+		return false;
+	}
+}
+
 /*
  * Control the relaxed ABI allowing tagged user addresses into the kernel.
  */

-- 
2.43.0

