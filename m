Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE7FF39DBCF
	for <linux-kselftest@vger.kernel.org>; Thu, 11 Jun 2026 20:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781208864; cv=none; b=Uk0b/Q51EwaHX4CmWNDEtAAJkMjQg5Dg0JU8ZyDvNkQlr69+y48F0DKOdLcOujmbaO3dqeO76Ib+pUKrRxUfJ4E76/wUX7Y2BGYY7suHfSWPu5YkBYSAYyW4BPgQcLzZ02yMUaI85T/xb3GV7qwMhoM3Xl5pf6qz0fZ2lt6kDDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781208864; c=relaxed/simple;
	bh=GUC8kvko49SeLpQio5c73u8anxlTnIalYE6ydi19kAw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=koT0LB6bRthWEi8HFuZ7j+aWRvjol43YlcNkQVGN3Pgj7cHgBGYjQ74lokaiKcLeKMpLaFz1HC22V9pjZooFPXnm8LhJfQZhybgJVRvJlVcom0GvUdyFwtpWPZrGz+A/PHaDtkM2NSzS8GanPs+xRPLK19x35mEpJzi+mNVyzyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LoM+XRG8; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LoM+XRG8"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2c0c3546924so1972935ad.3
        for <linux-kselftest@vger.kernel.org>; Thu, 11 Jun 2026 13:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781208860; x=1781813660; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yMGfGczB0NxDEd0np6M2cDGmk32GLLRpI8e709o6daA=;
        b=LoM+XRG8lvBBzFVFAJmFYWBzxkoQP7Sg8Zus5HBBmvJoBlIjj8NfvrsqYAlwDbslip
         UwUFlfV7nfb0OwHWze2ipX81Ev+St77Ukwjcib2fOC82orRbJTFQTi2oRz7maRDONgs+
         CPIQnUwBdUQd9eC7qRRlVE0IE8CRxh1v+GICXJFyIhYDLAXiQrwdZrKgYkX/wyZQgYez
         xGXHvq8nn8PobIh5dgweUGCS1tePrK+1fMK6QutuIZ8yENzgy+OOrTP2JtHqH7i1Rv5P
         tEyOlpwz0WnUHucnajj2MS46n3P2BJ7F9Cf4lHjnVvacElyolHUGI4hZlGVXo/ol78C7
         in/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781208860; x=1781813660;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yMGfGczB0NxDEd0np6M2cDGmk32GLLRpI8e709o6daA=;
        b=C0oizzrq3B/E2+x0IfkRuiwmkF/iVPiXmDie+vuntehXRr1O+li9IkbKkc5WXGhS9+
         /Z6rOuLPgr07PNN1ItgDFmhZ5LODFDRlJFY+5Fl8vS6X24vSbUkDKpnMiqs9lfm6S2CG
         hkBLIwh6xJFrjdrN2axeqFA8XCbmLVbMTWbnX88B1L6Japv3KLCfTrJFBLrbyOMGqOfw
         vj5Xtobm1AA6OmdCvJcvtj7B11eqfj0WrteMKymrYVhyzw2iwbw5UwEi/pC3xPkH+muU
         62tQlTEvTOVPUlDYbk30HON4IDv1pXTJ0BX4nwOTSu7E8zt+vsxo9gOeB0gweegHzir0
         eX7w==
X-Forwarded-Encrypted: i=1; AFNElJ9iO0bhNFd4Ji9SBkRJGJb0p+EWZDERcxVmuJIFMinSFwjfk0ZC0OvVKC5LCf+itgIuLQZaC3hsjAsNJULluoY=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywyxr9+IApvylloXU2OQDCB6+kUUZt0Hqx5WTP4VvNTc7Z7fXSN
	haRjcz+W7HDGzbv4m72FYWUpfVCzAJPAN6RjWc1x/OzuM2vixeWYe7VB
X-Gm-Gg: Acq92OEEEE29EGAUf4ekOw09KO/GhNpoaiHQ/hrYTVI/O3bK7Qlub814C5VN3uYkZ7f
	jl7BkvH2Uuro11HzSuNyNlxsEKO0/stX36buu+4kMNQjdQNHwS4XhpMovmmoytTTcr5AdVLFajN
	enhH11GyOwl8o4s85QF0vw6OUvIPswOATZfXgTmkWfR+rLD8CvAcvsN22P9XaRVxyr40E/qnMoI
	F6xpCyiwwEpa0a7ZDk64sMheX+0ukig7XdDgmmBbIANyDJhO1iT9xV2zqz5Ep2etv0JP9Y73fkl
	6il9Z+56FnScUt5cZAbeZpCyKbXx7HmapWjveRlyHc7GyK38d1JZ4kdKidcMB2DPnFa6iLHOCde
	iXo9C6F1Z99tnkqc8og45V/qm6q+97+oEnkMEYmNIpFy0O9lgmNrKd/55R9lnxbkcOJi7iH3cOg
	==
X-Received: by 2002:a17:903:1a06:b0:2c0:e5ee:f56c with SMTP id d9443c01a7336-2c2f21a0ademr49861065ad.20.1781208860004;
        Thu, 11 Jun 2026 13:14:20 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::302d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f875casm288730475ad.22.2026.06.11.13.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 13:14:19 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Thu, 11 Jun 2026 16:12:46 -0400
Subject: [PATCH v4 09/16] riscv: Add Zic64b to cpufeature and hwprobe
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-rva23u64-hwprobe-v2-v4-9-3f01a2449488@gmail.com>
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
 Guodong Xu <docular.xu@gmail.com>, Qingwei Hu <qingwei.hu@bytedance.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5498; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=nGcs7EOITyjoy7uSccUTn+y3G2TeXfDwFJQsTGZZRmY=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhixtsUPmOxf9nXjyoMnC1vs5VV/yvwq8uZhwmOPzB2/lR
 w8uh2z51lHKwiDGxSArpshy+GhL9tZXPtG+zzl/wMxhZQIZwsDFKQATuRHDyNC+8ZLz+e1PLxQG
 PeDeacx92vPirw9eCru37O0+63JQWJyD4Q+Xmn6uoIng/eC0tWdzPFyk35ySKTl26hUbx4kFh7P
 8jPgA
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE

From: Qingwei Hu <qingwei.hu@bytedance.com>

Zic64b mandates 64-byte naturally aligned cache blocks and is a
mandatory extension of the RVA22 and RVA23 profiles.  Allocate a
RISCV_ISA_EXT_ZIC64B id, parse "zic64b" from the ISA string with a
validate callback that requires each cbom/cbop/cboz cache block size to
be 64 bytes when it is present, and export it through hwprobe.

Link: https://lists.riscv.org/g/tech-unprivileged/topic/question_about_zic64b_and/119631059
Signed-off-by: Qingwei Hu <qingwei.hu@bytedance.com>
Co-developed-by: Guodong Xu <docular.xu@gmail.com>
Signed-off-by: Guodong Xu <docular.xu@gmail.com>
---
v4:
- Credit Qingwei Hu's earlier Zic64b cpufeature patch: set him as
  author, with Co-developed-by (Guodong Xu).
- Validate only the cbom/cbop/cboz block sizes that are present; Zic64b
  does not imply the CMO extensions (Conor, Qingwei, Greg).
- Add a Link: to Greg's confirmation on the tech-unprivileged list.
- Add the missing blank line before the ZIC64B hwprobe.rst entry
  (Andrew).
- Did not carry Andrew Jones's v3 Reviewed-by: the validation was
  rewritten (present block sizes only) and the patch is now authored by
  Qingwei, so it warrants a fresh review.
v3: New patch.
---
 Documentation/arch/riscv/hwprobe.rst  |  4 ++++
 arch/riscv/include/asm/hwcap.h        |  1 +
 arch/riscv/include/uapi/asm/hwprobe.h |  1 +
 arch/riscv/kernel/cpufeature.c        | 19 +++++++++++++++++++
 arch/riscv/kernel/sys_hwprobe.c       |  1 +
 5 files changed, 26 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index fc68dea397aae..32a14331eb9de 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -425,3 +425,7 @@ The following keys are defined:
   * :c:macro:`RISCV_HWPROBE_EXT_B`: The B extension is supported, as defined
     in version 1.0 of the Bit-Manipulation ISA extensions, and implies the
     presence of the Zba, Zbb, and Zbs sub-extensions.
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZIC64B`: The Zic64b extension is supported,
+    as defined in the RISC-V Profiles specification starting from commit
+    b1d80660 ("Updated to ratified state.")
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 58523b3a1998a..36572c1ff438a 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -117,6 +117,7 @@
 #define RISCV_ISA_EXT_ZICCAMOA		107
 #define RISCV_ISA_EXT_ZICCIF		108
 #define RISCV_ISA_EXT_ZA64RS		109
+#define RISCV_ISA_EXT_ZIC64B		110
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 430dc49a82863..36ec8ab470423 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -122,6 +122,7 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZICCRSE	(1ULL << 4)
 #define		RISCV_HWPROBE_EXT_ZA64RS	(1ULL << 5)
 #define		RISCV_HWPROBE_EXT_B		(1ULL << 6)
+#define		RISCV_HWPROBE_EXT_ZIC64B	(1ULL << 7)
 
 /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index e0197160af6dd..29dff41313e65 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -154,6 +154,24 @@ static int riscv_ext_zicbop_validate(const struct riscv_isa_ext_data *data,
 	return 0;
 }
 
+static int riscv_ext_zic64b_validate(const struct riscv_isa_ext_data *data,
+				     const unsigned long *isa_bitmap)
+{
+	/*
+	 * Zic64b mandates 64-byte naturally aligned cache blocks; cross-check the
+	 * cbom/cbop/cboz block-size (when declared) device-tree properties to
+	 * avoid inconsistency.
+	 */
+	if ((riscv_cbom_block_size && riscv_cbom_block_size != 64) ||
+	    (riscv_cbop_block_size && riscv_cbop_block_size != 64) ||
+	    (riscv_cboz_block_size && riscv_cboz_block_size != 64)) {
+		pr_err("Zic64b detected in ISA string, disabling as a CBO block size is not 64 bytes\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int riscv_ext_f_validate(const struct riscv_isa_ext_data *data,
 				const unsigned long *isa_bitmap)
 {
@@ -524,6 +542,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_SUPERSET(b, RISCV_ISA_EXT_B, riscv_b_exts),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(v, RISCV_ISA_EXT_V, riscv_v_exts, riscv_ext_vector_float_validate),
 	__RISCV_ISA_EXT_DATA(h, RISCV_ISA_EXT_H),
+	__RISCV_ISA_EXT_DATA_VALIDATE(zic64b, RISCV_ISA_EXT_ZIC64B, riscv_ext_zic64b_validate),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicbom, RISCV_ISA_EXT_ZICBOM, riscv_xlinuxenvcfg_exts, riscv_ext_zicbom_validate),
 	__RISCV_ISA_EXT_DATA_VALIDATE(zicbop, RISCV_ISA_EXT_ZICBOP, riscv_ext_zicbop_validate),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicboz, RISCV_ISA_EXT_ZICBOZ, riscv_xlinuxenvcfg_exts, riscv_ext_zicboz_validate),
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index dcc102bf8f183..3e80e5551ae0d 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -211,6 +211,7 @@ static void hwprobe_isa_ext1(struct riscv_hwprobe *pair,
 		EXT_KEY(isainfo->isa, ZICCRSE, pair->value, missing);
 		EXT_KEY(isainfo->isa, ZA64RS, pair->value, missing);
 		EXT_KEY(isainfo->isa, B, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZIC64B, pair->value, missing);
 	}
 
 	/* Now turn off reporting features if any CPU is missing it. */

-- 
2.43.0

