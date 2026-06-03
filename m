Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8199A3CD8C5
	for <linux-kselftest@vger.kernel.org>; Tue,  2 Jun 2026 23:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780442036; cv=none; b=hA3L13o5waHYq0s+BJV1Pp07TWhbDwA7NpPwU4jSruXPdncizj90FE3y4WCLpK+OZEDbsTTjZEV2c9s0Cc3IzUwPJiYwSace7goZmPqYH8W6RbMfQMGoH1fAyE9ImTLYs91F0sbYfn/Luj0U0iS42PXkFdCXXmb87iqZm8pNAJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780442036; c=relaxed/simple;
	bh=xNkpTSkaIkqroNzaTuMyYXOXZTYqZyfliGS84YviPGg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gPnSefnDvaEyhg5mEcsdVyXVgbxGlFDWNB7JCJRPdgUwLBxR1tinjP6EnrnGZQAb16NyHsQD12XKj8M7ctWBLzWjZGkaOAWIvA3WjRH+MllmlocY2rVz06CTH6xzSsw/2UnDzWGItBHiO7DEbdVE8HRHsdz99ILVu9Ci5Ee8+Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CaG2vxJo; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CaG2vxJo"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2c0c2d792c8so20158755ad.1
        for <linux-kselftest@vger.kernel.org>; Tue, 02 Jun 2026 16:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780442034; x=1781046834; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rhj+nvBHQ+CacSRsmI/cyKsZedwbZNdref0NZfEXqHA=;
        b=CaG2vxJo3nA4uoU4TgnV1HCByUzbuBcehAtoMObEJCLlnOFALgUY6u52m4/TGRuwu/
         F355MEDRhv6IW49mnSKpFpSTs4TjBp5UeWRfdEiBFu8eCPEdozaVob6mWNsK2Qr4NtKN
         Qw8qTOGcfiUC125rwN0zgTprtQNMFKiLSXlpE+zkEmItznSTRlcofVdmz+9kActSWkGL
         7GxciA9jO+rmmHKv0Yq1NJXWXKmnLjmIR9KUkxN7mw2FGBL4kJpDIzDwEsRw4Aae3KGh
         /HAEMZ3lmtam4voaANYVPOUuOKX7iITHVGr+k4k2ZLpzgn4EUQyVvewI4fDkWEX3DFMz
         lqHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780442034; x=1781046834;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Rhj+nvBHQ+CacSRsmI/cyKsZedwbZNdref0NZfEXqHA=;
        b=qtEGc28oHP2EjJgMDspYXNKKsvFYMimfZLhRrTid6sMkN8F75JYiIibl6tN4y7nuIa
         DVFp3R6zH4FyfYyQBF7f2DBGsmLOumx7Ej5Jy5apJgq4gUrzBmyPQvMOt8cf/W4bTsgK
         AOVTlBroUuBBe5LqWlb+i7O9BEwAZfhC+D6PBtod/frzlIt5g8tkdzGhGqV6IJTZW+j8
         XMSUv1iqQZqosfbpmED8xxg5g2OGMSL6M1qhJUAkSfEtgy0YrKx/rFWCbb0aVz033zys
         yjpgGznHkAODneMMQHKKGHhLEWIZcfLe+KyMF9vn+AQ1nt44aG8sl+BWfT+ZhxJLZSjK
         kQXQ==
X-Forwarded-Encrypted: i=1; AFNElJ9p9eScTTxcEqpgVAHLZIipsY/kPwN2ytA0K2ilD3HB0WrEg25Ke4EGXZYXHJzQsUlKZNd6RXS1iHQuAxpZgOw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYijgEUnH5aQM/zMaBDDt6SaB59U2Ily+pJuA1XTm3OZ/vqkF9
	qv1niFXH1bEaqpdm0HaZxrfl8/Zb8X5rBrbhWypENa2w2kOqvAFjMbLK
X-Gm-Gg: Acq92OGhrDPs2yauXd1WQEAiWZUQYhEFdg82PfnjjZeUsfXxUeN0wjXlIUoUIojbcfh
	wEBdW+ouzs4trvAX8U7HsOqOExWcKtqqkklfg7wPj4RTrhD5zUyXNU8BIe6CyvdY5a3GYeL9+I+
	FmeP6oBT4/UhuqTbmukDiw6phih8T1ToAku6TUhwPCzgiABOe/ME1BdaXOe7V6DAULPqL2xTf05
	xnOrNE2l5WtqVxM21lmGpxzMRhaI7kG2TcJotmlG8p8tfwlE6ZpA0lKLaNaS6l8nnjC16IZcgf2
	LlJk5DnCo0ygXG7JEX2gH+l38yK4AK6E+5xNVd1F+EELlDXkXxTAOJn1vITA6y/nN/rZ06sjNHK
	nrjqGPJvdav6c4nPfoJ7Lo6zPbZvFU+Bdi7Tl+L+XGQCmCSin5RK3FIzeNNwlW79dKZEoV3xzEw
	kyj3gaGxPMipdqhcmcOVYf
X-Received: by 2002:a17:903:3808:b0:2bf:26d:3f42 with SMTP id d9443c01a7336-2c163a43429mr7020065ad.18.1780442033831;
        Tue, 02 Jun 2026 16:13:53 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::40e9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16649d2dfsm3302965ad.75.2026.06.02.16.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 16:13:53 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Wed, 03 Jun 2026 07:12:01 -0400
Subject: [PATCH v3 06/15] riscv: Add B to hwcap and hwprobe
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-rva23u64-hwprobe-v2-v3-6-5529a7b28384@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5356; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=NxvCb+UtcmfgO40y2Ax6jmE3kx7ULzNHJSgIED+/XZU=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhiwFHhZ+FavHaUpXTARZTOadzV9/W3xZ/Nt0/87vsRM6k
 yqW6zB3lLIwiHExyIopshw+2pK99ZVPtO9zzh8wc1iZQIYwcHEKwETmLWD4X+B+vt4scxnbmZVf
 7BKi501N/dJbyRLZtc3qVURaf9S76Qx/pdacVp2tks223PJ3BPtptiN9Vj++MCvsmRnKvfPYzeP
 V/AA=
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE

From: Andrew Jones <andrew.jones@oss.qualcomm.com>

Add B to hwcap and ensure when B is present that Zba, Zbb, and Zbs
are all set. Also expose B via hwprobe (RISCV_HWPROBE_EXT_B in
RISCV_HWPROBE_KEY_IMA_EXT_1) so that userspace can probe B directly,
mirroring the F/D/C/V pattern where each is reported via both hwcap
and hwprobe.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
[Add B to hwprobe]
Signed-off-by: Guodong Xu <docular.xu@gmail.com>
---
v3:
- Indent the added hwprobe.rst entry to match the normalized style.
- Rebased onto v7.1-rc6: index isa2hwcap[] via RISCV_ISA_EXT_B to match the
  macro-ization in commit 41337097f2823.
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
index b1b2d8803e5c2..002d5046ab689 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -421,3 +421,7 @@ The following keys are defined:
   * :c:macro:`RISCV_HWPROBE_EXT_ZA64RS`: The Za64rs extension is supported,
     as defined in the RISC-V Profiles specification starting from commit
     b1d80660 ("Updated to ratified state.")
+
+  * :c:macro:`RISCV_HWPROBE_EXT_B`: The B extension is supported, as defined
+    in version 1.0 of the Bit-Manipulation ISA extensions, and implies the
+    presence of the Zba, Zbb, and Zbs sub-extensions.
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
index b9538e69fa1b3..e0197160af6dd 100644
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
@@ -1133,6 +1140,7 @@ void __init riscv_fill_hwcap(void)
 	isa2hwcap[RISCV_ISA_EXT_F] = COMPAT_HWCAP_ISA_F;
 	isa2hwcap[RISCV_ISA_EXT_D] = COMPAT_HWCAP_ISA_D;
 	isa2hwcap[RISCV_ISA_EXT_C] = COMPAT_HWCAP_ISA_C;
+	isa2hwcap[RISCV_ISA_EXT_B] = COMPAT_HWCAP_ISA_B;
 	isa2hwcap[RISCV_ISA_EXT_V] = COMPAT_HWCAP_ISA_V;
 
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

