Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CCFD48B366
	for <linux-kselftest@vger.kernel.org>; Wed,  1 Jul 2026 12:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782910409; cv=none; b=fnKGjdrlGkk78AdI3rmWY/B70lC9JFqda+HmyStltyiXcowhr+xqdrCponmw/eCUorljUFSfnRR6W/vzHBE8gvbiyOlAyEsSKrrLbygGs7XZMLFtjKaSiWhzMFetkK1npwAVNxu33rbBSPOVZmUdWQgBJOHLFQSvz1mmzgarSYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782910409; c=relaxed/simple;
	bh=McMalR0lms43BUWnBj5MfAGmD1DgwyyMe6CGS4oVWyw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AVQ1r2o6M1faTfyL6HiiyGsYeSxEjw0FwSpWwoULcgbLqEj6PhAy9n7iiW0+TnLlsP3F7cdlVUdd8AvhPh5u2r3/6KWKWwJYp2NYXPtMraWRW7Qm1leRogimV82v8yQPgI2CqZII8fJSqc0Z39U28zYgpRnD/oyR7JFufMTa864=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EfPuKRn4; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EfPuKRn4"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c9e30214d8fso100855a12.3
        for <linux-kselftest@vger.kernel.org>; Wed, 01 Jul 2026 05:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782910407; x=1783515207; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=72IaI52f8cz7AfdFatnymKM5hMQ+G/AeXiG0yhG7q8g=;
        b=EfPuKRn4T41bEazWN0jLV1Ki/iBTClHVNWK4n/8EdY4lEFdrE5fdlcIi16l5WLQVnf
         bnAP+Ea0NsdZTyQp92YnbwwrXtICtur2pTOG+ev9B5f9LxiP2FF9E18YyJCuOkPuGkLk
         p4EjSENRl/7aa4EeZRVXoAVGjCUzfGkHVYgor48UuPFBGAK+3co0SJBG3r8qEFRj3Rdu
         qBOGIz2x9esZUll5cJ0QsUNMGijqYeRDGmr1eObKnneIfnsALa1+5p7TUgBDuJfQlKLJ
         9qgVKcifSWxr7nR+VSdfGcAXFXAV2mrVk/LuKExGgnZzYjdogdXOqbg1BeQwHVuv5njJ
         c8iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782910407; x=1783515207;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=72IaI52f8cz7AfdFatnymKM5hMQ+G/AeXiG0yhG7q8g=;
        b=iysLhvBdQEO1gnHR0xPrle20NWduECQnub51JjaDqOaSr9ZH1X+x4CCPUrT98c+5Ta
         iT6fi+9DTQNJYRsbVMKIrTLgBVBt9S2yNnNravYdK+2aSiBGZVnFCLFo17iWawZZypPl
         ZTD+iT4Iq7toA3Rh4F+Efgw5MGr7yiBv/f3BFze4CWSE9cwA4lHZT9aGq2eVPXSmbhoy
         f0kbSy2BiXcMKmCpjqrgpUl3rq1dW3TgfuIMu96k5W2zBSXZ5nrLw5Lq7hpBhTPO9JzP
         TnXQ/W+7+DYTN19IR97tABuskDTD9OE/kKEEokC/CFQB74nevfyFeiHlQ4CkEgKhE2vH
         6l1w==
X-Forwarded-Encrypted: i=1; AHgh+RrxbUGbWa039DWjXZQdjZCnc+hob4AyHRA1mCA2tMYG/7Wep+oRkjkyR6eXcBRB7G+0PKie9/zTEbFP/hRYmhw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBEd8DN+82KU2Kb3aIbLsHBrIYWkqTtKajLPUbZJWF6jgB+0NB
	WMIShwx5qf3xHSkc6ZkQh8D8Dt5gXLhn1fURYxfXNvSy/JBi5bmc/5p4
X-Gm-Gg: AfdE7cns5qKV+GckNwlsJjeJ5Rg7/De0eEEKizL2Jyh1ENA1mBjz5V6djOxcPkqL60O
	GHd9SOGnWT9sWmXRFOKaeFADwjbJxq8flevsLMXT/Wx0IMZ7jhr+djKv/+bfCDqkn3q29le/KEp
	aUawgPXJ2OwM3jBqR4DYn828IUHy24hbeR6iucdpHTGGc+gNUyDmsZBZGY/Ub/BobnfXP5gLrRw
	hf2Wi/+hJeArV6hBB1SykcS+LhepwEii3h3J9QkXDLubZobumOy6QXb/YwL9ubJf81nCxf5sxbN
	iuCimApHYUo/yJMuY0cLzPtolQh1oYlY5CMXVfcKwjPi9LO0Q3lkAFSXMrw/Irmkr9mOejOiTtW
	GiHHJmKBJ2PH78rG0wwgGj2isp2Er1Ucap+aLdTgwLynkUBRQG5XTNwif9GPxq8gqjgw5ThYba9
	xmI/9KweQIRqQLEjWAwAP4DMytqhNBKsQ=
X-Received: by 2002:a05:6a00:bd0b:b0:846:c7f4:74d with SMTP id d2e1a72fcca58-847c0a005a1mr1296978b3a.41.1782910406514;
        Wed, 01 Jul 2026 05:53:26 -0700 (PDT)
Received: from [127.0.1.1] ([120.244.9.45])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a03778basm3999403b3a.49.2026.07.01.05.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 05:53:26 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Wed, 01 Jul 2026 08:52:18 -0400
Subject: [PATCH v5 05/17] riscv: Add Zicclsm to cpufeature and hwprobe
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-rva23u64-hwprobe-v2-v5-5-2c61f94a695a@gmail.com>
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
 linux-kselftest@vger.kernel.org, Guodong Xu <docular.xu@gmail.com>, 
 Jesse Taube <jesse@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, 
 Charlie Jenkins <charlie@rivosinc.com>, Andy Chiu <andybnac@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4429; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=T8J6F8JD2GSkUodQpbB8hIJ5DiwO5Q99BYhbCDqSwXw=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhixX3pbPWgunsBici1WrecHyvMUv6sfKc1lTesrTuvt3O
 hlaWDF3lLIwiHExyIopshw+2pK99ZVPtO9zzh8wc1iZQIYwcHEKwEQs+RkZXmptcWKPj/oQnjfH
 8oWqw1+x8j9Td95eEL5Afv4n9cdynYwMj1csjFiw8ZrTkbg7rBfuvVjwJ56V75aQ6HFe7WkrRMs
 ecQIA
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE

From: Jesse Taube <jesse@rivosinc.com>

Zicclsm requires misaligned support for all regular load and store
instructions, both scalar and vector, but not AMOs or other
specialized forms of memory access, to main memory regions with both
the cacheability and coherence PMAs, as defined in the profiles spec.
Even though mandated, misaligned loads and stores might execute
extremely slowly. Standard software distributions should assume their
existence only for correctness, not for performance.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Andy Chiu <andy.chiu@sifive.com>
Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
Tested-by: Charlie Jenkins <charlie@rivosinc.com>
Signed-off-by: Jesse Taube <jesse@rivosinc.com>
[Rebased, rewrote doc text, minor commit message revisions]
Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Signed-off-by: Guodong Xu <docular.xu@gmail.com>
---
v5: No change.
v4: No change.
v3:
- Move the hwprobe.rst entry to the IMA_EXT_1 section so its
  documentation matches the IMA_EXT_1 bit it was allocated in v2
  (Sashiko, agreed by Andrew).
v2:
- Rebased onto v7.1-rc2; moved ZICCLSM to IMA_EXT_1 and
  allocated a new bit for it
---
 Documentation/arch/riscv/hwprobe.rst  | 4 ++++
 arch/riscv/include/asm/hwcap.h        | 1 +
 arch/riscv/include/uapi/asm/hwprobe.h | 1 +
 arch/riscv/kernel/cpufeature.c        | 1 +
 arch/riscv/kernel/sys_hwprobe.c       | 1 +
 5 files changed, 8 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index d9928641deb99..49d9fb68632d0 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -401,3 +401,7 @@ The following keys are defined:
     as defined in version 1.0 of the RISC-V Control-flow Integrity (CFI)
     extensions specification, ratified in commit 302a2d45c243
     ("Update build-pdf.yml") of riscv-cfi.
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZICCLSM`: The Zicclsm extension is supported,
+    as defined in the RISC-V Profiles specification starting from commit
+    b1d80660 ("Updated to ratified state.")
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 44bf8c7d8acc5..e8f4a7dd96a93 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -112,6 +112,7 @@
 #define RISCV_ISA_EXT_ZCLSD		103
 #define RISCV_ISA_EXT_ZICFILP		104
 #define RISCV_ISA_EXT_ZICFISS		105
+#define RISCV_ISA_EXT_ZICCLSM		106
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 9139edba0aecb..6819df159c51e 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -116,6 +116,7 @@ struct riscv_hwprobe {
 #define RISCV_HWPROBE_KEY_ZICBOP_BLOCK_SIZE	15
 #define RISCV_HWPROBE_KEY_IMA_EXT_1		16
 #define		RISCV_HWPROBE_EXT_ZICFISS	(1ULL << 0)
+#define		RISCV_HWPROBE_EXT_ZICCLSM	(1ULL << 1)
 
 /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 686dde3ce3b98..1fb595581adcf 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -502,6 +502,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicbom, RISCV_ISA_EXT_ZICBOM, riscv_xlinuxenvcfg_exts, riscv_ext_zicbom_validate),
 	__RISCV_ISA_EXT_DATA_VALIDATE(zicbop, RISCV_ISA_EXT_ZICBOP, riscv_ext_zicbop_validate),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicboz, RISCV_ISA_EXT_ZICBOZ, riscv_xlinuxenvcfg_exts, riscv_ext_zicboz_validate),
+	__RISCV_ISA_EXT_DATA(zicclsm, RISCV_ISA_EXT_ZICCLSM),
 	__RISCV_ISA_EXT_DATA(ziccrse, RISCV_ISA_EXT_ZICCRSE),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicfilp, RISCV_ISA_EXT_ZICFILP, riscv_xlinuxenvcfg_exts,
 					  riscv_cfilp_validate),
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index f8f68ba781b45..9cf62266f1890 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -205,6 +205,7 @@ static void hwprobe_isa_ext1(struct riscv_hwprobe *pair,
 		 * in the hart_isa bitmap, are made.
 		 */
 		EXT_KEY(isainfo->isa, ZICFISS, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZICCLSM, pair->value, missing);
 	}
 
 	/* Now turn off reporting features if any CPU is missing it. */

-- 
2.43.0

