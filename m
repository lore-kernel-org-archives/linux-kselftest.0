Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055B63F164A
	for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 13:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778506627; cv=none; b=HPUJRtSWHQu94tyutgyZL3V2kD+68n/McN4XPx4d7gA9jL5jKXd1PkLN7UeuEQVdAMEF/vXGmj5XovrfbTxd/y7dgOUDbgCJn6NgyhGVNa/KkttmhII0ZCCLHIObAgHFJ7+XAEJpt1Yk9jOBhfoBteBXqh69ufeS3QsjcNC6aVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778506627; c=relaxed/simple;
	bh=Zchx4Swg0DTFLCGInbowGnxvp0evlz4O3qxP/+lXcAM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mJhn40AMBrPzmTn/CkvI6yizJNZZv+a/WbBH1GpfWgEtqiTrsFG1yEmc3YKBqR3bXnpGmTsZ15QU5czUY92zSf8TTLCv27owaGA/dGF/d3/btIThEvMuRkZSVp70WQM6LY+/Un+X3kk5txHpGYi2pGb+qHgtvua+ReOOag9fziM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=qo4Nv8Sy; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="qo4Nv8Sy"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-365eecc5885so4207111a91.0
        for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 06:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1778506625; x=1779111425; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FCAHQLPVgITPnmWoIAz29HJLtXLEuf81viuVntKgbwI=;
        b=qo4Nv8SyfRd52z2UGmvvRtvB6DyYWaSjrZ51mBp1J+4+zdB2cZAZeOS4MNh3NgfDTb
         KIsWv6ONdaY2THPRaS9ooHhgj52Y6L+QHzpzzzZ/1Vv2PE72rYfQJ7YIhAPzKqL003ku
         GXko3/cJeD1aUWDAXFE6OEZ7D80cyg0xmCpiIcVxTcCzc6lwH4eS+TtELOjgmiLbHU/8
         6dLmTsz78PFtkVyFg9QW6Q5oO186r/hsaQQnoMiJyzeTFDkKAWwnu+/XRSGvQogArqKm
         lgPdGZx1XXdvCJmKQzyr6KA+fFd1D03VGt2Ro30naunil/UOmQLKupGxLVpFa8Y/Wk/Q
         EoYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778506625; x=1779111425;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FCAHQLPVgITPnmWoIAz29HJLtXLEuf81viuVntKgbwI=;
        b=gF+CRuiiZvGteF8j11zqKInr5vjN4W5/elHzJhZpWM7PRcOMozbMyGowb46u+f5Pb6
         7qbdUwQ3NMXRQSHma2BOTIRq3BPmdKKOpbncdBjyyC58QD2MyFJ9O+I53mpNu9abbcBu
         12l9AmddiPMQBtnsDs2OAfLV7mUnSfg0Bq/jnPCA7PfND3d6Uv5vxUuUsaLrI9iDtmqD
         W3tS4ysqakWB/soAvlesWioHTQLFIfGh65KC5YQ1aPHqSe9dr0anc97icBRDloWRRvL7
         PjKfgitrKZw5NKheXNDrrh5S8TvZOiihafk/gDQyTbDRZ4YN0Eead88gl2tURldLt12J
         v4TA==
X-Forwarded-Encrypted: i=1; AFNElJ92sYEtkftWeishptP7/EmnlglUGUI7rYdlXejrStCzIC4tba0ShDB+uuUFnWG1Ch4+JHnJ/evJwd4csQNnLbg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEHBJARDJRg3A//HzDAaHPAMtuHGTdEHxNW52HYM8M8U3U5u8X
	Et2f64nNM75yKRP0OPoxLH65gM0xhlAwISwyR8UJL80jQ090AiI2kisV4yp1u7I+P1w=
X-Gm-Gg: Acq92OHfr6V1n3ysO1jhy0IRyh8CpL79KjRKGpOj+PewvN7HkWmrWK+BLIb88n0wgZW
	sq+87FX3CfTuqGPs4MGgTizx7VPDXAUijygZh9OMPvbwLVm1ce2FZfhs1Cz9goiWtCcrs06hvJO
	ptGc0tgV4FPiaEdrvmltHNTVqlTSMnliVrCSZ4iyf15DNWkCzIbBJIgUVYPwFxPw2IlNWnJK7G0
	MOx51C2CEXLhsqd6j+TnPSYkf965eXjwVkRgTOpdXPrtfUd0C2jcbRw+LsBPIG1FqsJwQcj4qdZ
	1pw6x2xgCtJsss9I4rzWOwPGrEWpBHWvigaC9n+GYtd/BCQsfXohfna9+JSqVao9I9wo6LmR+cK
	5KLr+byG8bsTd/NwiWMq+88XmbqCFLA88QhnGNP5cvpen5SGHMAr+CixBaVwtBd9VP33Uojwzn2
	ynINt1rNEJsa2PZG5V8Of5tUZ0wBEI3eDqFSHSdFUw9Mc=
X-Received: by 2002:a17:90b:48c9:b0:35d:a861:36de with SMTP id 98e67ed59e1d1-367d487d1d6mr11741973a91.24.1778506625373;
        Mon, 11 May 2026 06:37:05 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::30f3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367be3daafesm3034326a91.8.2026.05.11.06.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 06:37:05 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
Date: Mon, 11 May 2026 21:34:51 -0400
Subject: [PATCH v2 06/10] riscv: Add B to hwcap and hwprobe
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-rva23u64-hwprobe-v2-v2-6-21c5a544f1dc@riscstar.com>
References: <20260511-rva23u64-hwprobe-v2-v2-0-21c5a544f1dc@riscstar.com>
In-Reply-To: <20260511-rva23u64-hwprobe-v2-v2-0-21c5a544f1dc@riscstar.com>
To: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Shuah Khan <shuah@kernel.org>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@linux.dev>, Shuah Khan <skhan@linuxfoundation.org>, 
 Deepak Gupta <debug@rivosinc.com>, Zong Li <zong.li@sifive.com>, 
 Christian Brauner <brauner@kernel.org>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>, 
 Charlie Jenkins <charlie@rivosinc.com>, 
 Samuel Holland <samuel.holland@sifive.com>, linux-doc@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.15.1

From: Andrew Jones <andrew.jones@oss.qualcomm.com>

Add B to hwcap and ensure when B is present that Zba, Zbb, and Zbs
are all set. Also expose B via hwprobe (RISCV_HWPROBE_EXT_B in
RISCV_HWPROBE_KEY_IMA_EXT_1) so that userspace can probe B directly,
mirroring the F/D/C/V pattern where each is reported via both hwcap
and hwprobe.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
[Add B to hwprobe]
Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v2:
- Rebased to v7.1-rc2
- Add B to hwprobe (RISCV_HWPROBE_EXT_B at IMA_EXT_1 bit 6) and
  document it in hwprobe.rst, so userspace can probe B directly.
---
 Documentation/arch/riscv/hwprobe.rst  | 4 ++++
 arch/riscv/include/asm/hwcap.h        | 1 +
 arch/riscv/include/uapi/asm/hwcap.h   | 1 +
 arch/riscv/include/uapi/asm/hwprobe.h | 1 +
 arch/riscv/kernel/cpufeature.c        | 8 ++++++++
 arch/riscv/kernel/sys_hwprobe.c       | 1 +
 6 files changed, 16 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 73f50dc1ce7a2..cb31fd3b12017 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -415,3 +415,7 @@ The following keys are defined:
   * :c:macro:`RISCV_HWPROBE_EXT_ZA64RS`: The Za64rs extension is supported,
        as defined in the RISC-V Profiles specification starting from commit
        b1d80660 ("Updated to ratified state.")
+
+  * :c:macro:`RISCV_HWPROBE_EXT_B`: The B extension is supported, as defined
+       in version 1.0 of the Bit-Manipulation ISA extensions, and implies the
+       presence of the Zba, Zbb, and Zbs sub-extensions.
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 0acb7a01ecc0f..58523b3a1998a 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -11,6 +11,7 @@
 #include <uapi/asm/hwcap.h>
 
 #define RISCV_ISA_EXT_A		('a' - 'a')
+#define RISCV_ISA_EXT_B		('b' - 'a')
 #define RISCV_ISA_EXT_C		('c' - 'a')
 #define RISCV_ISA_EXT_D		('d' - 'a')
 #define RISCV_ISA_EXT_F		('f' - 'a')
diff --git a/arch/riscv/include/uapi/asm/hwcap.h b/arch/riscv/include/uapi/asm/hwcap.h
index c52bb7bbbabe9..96b7cf854e090 100644
--- a/arch/riscv/include/uapi/asm/hwcap.h
+++ b/arch/riscv/include/uapi/asm/hwcap.h
@@ -21,6 +21,7 @@
 #define COMPAT_HWCAP_ISA_F	(1 << ('F' - 'A'))
 #define COMPAT_HWCAP_ISA_D	(1 << ('D' - 'A'))
 #define COMPAT_HWCAP_ISA_C	(1 << ('C' - 'A'))
+#define COMPAT_HWCAP_ISA_B	(1 << ('B' - 'A'))
 #define COMPAT_HWCAP_ISA_V	(1 << ('V' - 'A'))
 
 #endif /* _UAPI_ASM_RISCV_HWCAP_H */
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 58d1e86e47ae7..430dc49a82863 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -121,6 +121,7 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZICCIF	(1ULL << 3)
 #define		RISCV_HWPROBE_EXT_ZICCRSE	(1ULL << 4)
 #define		RISCV_HWPROBE_EXT_ZA64RS	(1ULL << 5)
+#define		RISCV_HWPROBE_EXT_B		(1ULL << 6)
 
 /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 46ea2cbcf881a..81145621dc378 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -468,6 +468,12 @@ static const unsigned int riscv_c_exts[] = {
 	RISCV_ISA_EXT_ZCD,
 };
 
+static const unsigned int riscv_b_exts[] = {
+	RISCV_ISA_EXT_ZBA,
+	RISCV_ISA_EXT_ZBB,
+	RISCV_ISA_EXT_ZBS,
+};
+
 /*
  * The canonical order of ISA extension names in the ISA string is defined in
  * chapter 27 of the unprivileged specification.
@@ -515,6 +521,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA_VALIDATE(d, RISCV_ISA_EXT_D, riscv_ext_d_validate),
 	__RISCV_ISA_EXT_DATA(q, RISCV_ISA_EXT_Q),
 	__RISCV_ISA_EXT_SUPERSET(c, RISCV_ISA_EXT_C, riscv_c_exts),
+	__RISCV_ISA_EXT_SUPERSET(b, RISCV_ISA_EXT_B, riscv_b_exts),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(v, RISCV_ISA_EXT_V, riscv_v_exts, riscv_ext_vector_float_validate),
 	__RISCV_ISA_EXT_DATA(h, RISCV_ISA_EXT_H),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicbom, RISCV_ISA_EXT_ZICBOM, riscv_xlinuxenvcfg_exts, riscv_ext_zicbom_validate),
@@ -1135,6 +1142,7 @@ void __init riscv_fill_hwcap(void)
 	isa2hwcap['f' - 'a'] = COMPAT_HWCAP_ISA_F;
 	isa2hwcap['d' - 'a'] = COMPAT_HWCAP_ISA_D;
 	isa2hwcap['c' - 'a'] = COMPAT_HWCAP_ISA_C;
+	isa2hwcap['b' - 'a'] = COMPAT_HWCAP_ISA_B;
 	isa2hwcap['v' - 'a'] = COMPAT_HWCAP_ISA_V;
 
 	if (!acpi_disabled) {
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index b15ac9adf7920..dcc102bf8f183 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -210,6 +210,7 @@ static void hwprobe_isa_ext1(struct riscv_hwprobe *pair,
 		EXT_KEY(isainfo->isa, ZICCIF, pair->value, missing);
 		EXT_KEY(isainfo->isa, ZICCRSE, pair->value, missing);
 		EXT_KEY(isainfo->isa, ZA64RS, pair->value, missing);
+		EXT_KEY(isainfo->isa, B, pair->value, missing);
 	}
 
 	/* Now turn off reporting features if any CPU is missing it. */

-- 
2.43.0

