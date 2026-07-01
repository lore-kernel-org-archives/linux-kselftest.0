Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522C148BD3B
	for <linux-kselftest@vger.kernel.org>; Wed,  1 Jul 2026 12:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782910419; cv=none; b=Kls5MNvKSrwvyt7fWLqMEjztCY0s9GGKmnYKjNdZc7Ymol4YOtsHSf3g7PX7aFkxDUI0SQUgC4TJMBbI8iTf8ME2FauZjjEPa3i2VuTlO49KqwTAqkt3YqDow1X7JJDBSvvZ4L+6BdjH4A55HEwGstwTaNRwmqXqOZXL091Y/m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782910419; c=relaxed/simple;
	bh=fd8TTTX5rQjmm9mhZQb6Cb2xogzQoP+hVRO0Fo9TQTQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RZqp4FkMavo//MQ45LtTMCrNr3uW7poyrN7b1z4yzj08spYczhtzBYBTx6MEg0nHDh0IAcRpIRd1BGa9EE4/vfKK5GfQKoJnkWTANBHdi+l3JVYfTjib+1wktk4Bt5YirvfIJEJu6DUQsGUcY+15BkfHWrD+EB4z16JDgnrzHH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VLk8r/RE; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VLk8r/RE"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8424b00710aso429134b3a.0
        for <linux-kselftest@vger.kernel.org>; Wed, 01 Jul 2026 05:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782910416; x=1783515216; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W3t4vJ0/d9fpvaIXCPeF5rPm5f0szKK7JPQrQORN6C4=;
        b=VLk8r/REmavw4Fr8Nz3QbRZ0l+AUzvPn7AA42oi9jsGYU0RbJZq5WSy6PNn1H0c1Hu
         zo1K51ut2hABrir+ixcX+jM7zZ13r3ysg86DxUdI5r4KAziv1KRRKrHi6CTu9Q1+uPNB
         ppemtnYXzhnVpg0D398mbZt+p2PUc0ykm+5NrZA3r0oiSQttYi/9FuITBdnPBnPSDaQt
         Z1uTh2ruatvimvIn87Y1k/4jclpEozkf4w4OK/heEbuMrI/4EoG87kWBijLvuBwKiwNk
         x/ZWf1aWAXXEUcsDoAN/I6ZclHKjhfNT4XBEs9PhD67WmEGEgFthvzPLcefeOwdhnp/S
         B5Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782910416; x=1783515216;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W3t4vJ0/d9fpvaIXCPeF5rPm5f0szKK7JPQrQORN6C4=;
        b=VCD9xjNNqBUO3NmdX7BhoIxAaznZsyPDGcmUpW1Xj09zRluakN7KivEN4QQ1RxdH4i
         PU7UklfmHU3KlEYXDf9543DrTA0buKbiRb40ekBZN2WmPVtn+sMz1y5nGl5TigTlSTBr
         CDbyF0cirH9H9ErO2s36x2OVzaa37LYm4rUTACuJQKK7dZJp5qksR4S62SqgfbGQWBl0
         dSgpPrb0CyIiJgYoBGoLQ/oPNnp9BCTfUJ6rtHhahY5wQnrB106GSb+PxgJSH6ZgvzKc
         QtiYLsNxMevn+12MrOeXeUfOxWw+PEcPJ0Gdaaqs3as3ixUxZVbn8BgU+d9kYOG8HkUv
         f0Lg==
X-Forwarded-Encrypted: i=1; AHgh+Rq7slD1/n480h/NnBRUGhiDOBSbsvXti5LPEXNCZkrdaZEo8REwoDAKFeZveIGnK5deD/dJ/28cjDI6eRXm7GE=@vger.kernel.org
X-Gm-Message-State: AOJu0YweDM8YAljy8qRyke2wbwhnVIOBUThasf7vwlvErd7fcArlZfFT
	ssMjcFPeq5/UECvFeInHsrTllKPNzvU2ygJ1GR8fdqKTKS1fwSpsbL5s
X-Gm-Gg: AfdE7clsehjg5d61Zpr3h3DYyHP7eshRwQXUR9DZMY98LiboaKJeGmIX3JkBMO2bkVn
	G+P7qZexsaUvfJZP9zvYdJeMWG70SnP5i/A3HkaRYmzFmgYLs3z+6oGv0Ddzh9L+B2E7LBOBq7+
	h3ZTsIJb0JpPwofy6MXcd/+eztl5zgX5NQgnvT4z4bVua9ngZEg6iyKZR1sM4mKYTN6Gphr9Bmu
	S+4oNIKyF1jcY9PbskExXYFmLydVm1sAWrkNdRV1GWcE+sAfq7VBNEDsGg4zB31j4SV7/kqH5UP
	rEAGY3dcroYBM3UTBe6iChAXs03yR11Y52P5NhS8lyU8LXgvFbe9FBVkQGWdEuGDjXuyqp18VDx
	5RgtoTp3Oigguf4Z6WmGL39xBjg6LCEXafoLNANBVqLEz4Ai0RTXt3J+eig7myTiqCRQzeiuE3+
	/zPDhMhxy5emes6yu6JS1W
X-Received: by 2002:a05:6a00:a884:b0:845:e105:1e6b with SMTP id d2e1a72fcca58-847c51d967fmr577251b3a.62.1782910416480;
        Wed, 01 Jul 2026 05:53:36 -0700 (PDT)
Received: from [127.0.1.1] ([120.244.9.45])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a03778basm3999403b3a.49.2026.07.01.05.53.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 05:53:36 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Wed, 01 Jul 2026 08:52:19 -0400
Subject: [PATCH v5 06/17] riscv: Add Ziccamoa, Ziccif, Ziccrse, and Za64rs
 to cpufeature and hwprobe
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-rva23u64-hwprobe-v2-v5-6-2c61f94a695a@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5837; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=FeXh8TsQwuJVD4+D1HP3+HbYDjTmi1GIHiq1GBy5dio=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhixX3hYNy5s8IQW7tpoylt/Il32e5f72SVvU0hDlM3d6f
 T64L6/tKGVhEONikBVTZDl8tCV76yufaN/nnD9g5rAygQxh4OIUgInM8GX4nxb69sSFK5Hsu4Wd
 GTM7Jr2avPLO4e+z6j+0VDTbdYhm2TL8L2jfG7srlSNi2ts9T+8IX1gyrSYw5sLfXYsXrEtRvJ5
 uyg4A
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE

From: Andrew Jones <andrew.jones@oss.qualcomm.com>

Add Ziccamoa, Ziccif, and Za64rs to riscv_isa_ext[] so they can be
parsed from devicetree/ACPI ISA strings. Ziccrse is already present
in cpufeature; this patch only adds its hwprobe exposure.

Expose all four extensions via hwprobe through new bits in
RISCV_HWPROBE_KEY_IMA_EXT_1 (RISCV_HWPROBE_EXT_ZICCAMOA, _ZICCIF,
_ZICCRSE, _ZA64RS), so userspace can probe each of these
RVA23U64-mandatory extensions individually.

Reviewed-by: Jesse Taube <jtaubepe@redhat.com>
Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Signed-off-by: Guodong Xu <docular.xu@gmail.com>
---
v5:
- Drop dependency validate callbacks in ziccamoa and za64rs. (Conor)
- Collected Reviewed-by from Jesse Taube.
v4: No change.
v3: Indent the added hwprobe.rst entries to match the normalized style; no other change.
v2:
- Rebased to v7.1-rc2.
- Reworded subject and expanded commit message.
- Validation added for Ziccamoa depending on Zaamo and Za64rs depending
  on Zalrsc.
---
 Documentation/arch/riscv/hwprobe.rst  | 16 ++++++++++++++++
 arch/riscv/include/asm/hwcap.h        |  3 +++
 arch/riscv/include/uapi/asm/hwprobe.h |  4 ++++
 arch/riscv/kernel/cpufeature.c        |  3 +++
 arch/riscv/kernel/sys_hwprobe.c       |  4 ++++
 5 files changed, 30 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 49d9fb68632d0..893e1a1215d23 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -405,3 +405,19 @@ The following keys are defined:
   * :c:macro:`RISCV_HWPROBE_EXT_ZICCLSM`: The Zicclsm extension is supported,
     as defined in the RISC-V Profiles specification starting from commit
     b1d80660 ("Updated to ratified state.")
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZICCAMOA`: The Ziccamoa extension is supported,
+    as defined in the RISC-V Profiles specification starting from commit
+    b1d80660 ("Updated to ratified state.")
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZICCIF`: The Ziccif extension is supported,
+    as defined in the RISC-V Profiles specification starting from commit
+    b1d80660 ("Updated to ratified state.")
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZICCRSE`: The Ziccrse extension is supported,
+    as defined in the RISC-V Profiles specification starting from commit
+    b1d80660 ("Updated to ratified state.")
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZA64RS`: The Za64rs extension is supported,
+    as defined in the RISC-V Profiles specification starting from commit
+    b1d80660 ("Updated to ratified state.")
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index e8f4a7dd96a93..0acb7a01ecc0f 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -113,6 +113,9 @@
 #define RISCV_ISA_EXT_ZICFILP		104
 #define RISCV_ISA_EXT_ZICFISS		105
 #define RISCV_ISA_EXT_ZICCLSM		106
+#define RISCV_ISA_EXT_ZICCAMOA		107
+#define RISCV_ISA_EXT_ZICCIF		108
+#define RISCV_ISA_EXT_ZA64RS		109
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 6819df159c51e..58d1e86e47ae7 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -117,6 +117,10 @@ struct riscv_hwprobe {
 #define RISCV_HWPROBE_KEY_IMA_EXT_1		16
 #define		RISCV_HWPROBE_EXT_ZICFISS	(1ULL << 0)
 #define		RISCV_HWPROBE_EXT_ZICCLSM	(1ULL << 1)
+#define		RISCV_HWPROBE_EXT_ZICCAMOA	(1ULL << 2)
+#define		RISCV_HWPROBE_EXT_ZICCIF	(1ULL << 3)
+#define		RISCV_HWPROBE_EXT_ZICCRSE	(1ULL << 4)
+#define		RISCV_HWPROBE_EXT_ZA64RS	(1ULL << 5)
 
 /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 1fb595581adcf..d76ce21d4a18a 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -502,6 +502,8 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicbom, RISCV_ISA_EXT_ZICBOM, riscv_xlinuxenvcfg_exts, riscv_ext_zicbom_validate),
 	__RISCV_ISA_EXT_DATA_VALIDATE(zicbop, RISCV_ISA_EXT_ZICBOP, riscv_ext_zicbop_validate),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicboz, RISCV_ISA_EXT_ZICBOZ, riscv_xlinuxenvcfg_exts, riscv_ext_zicboz_validate),
+	__RISCV_ISA_EXT_DATA(ziccamoa, RISCV_ISA_EXT_ZICCAMOA),
+	__RISCV_ISA_EXT_DATA(ziccif, RISCV_ISA_EXT_ZICCIF),
 	__RISCV_ISA_EXT_DATA(zicclsm, RISCV_ISA_EXT_ZICCLSM),
 	__RISCV_ISA_EXT_DATA(ziccrse, RISCV_ISA_EXT_ZICCRSE),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicfilp, RISCV_ISA_EXT_ZICFILP, riscv_xlinuxenvcfg_exts,
@@ -516,6 +518,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
 	__RISCV_ISA_EXT_DATA(zihpm, RISCV_ISA_EXT_ZIHPM),
 	__RISCV_ISA_EXT_DATA(zimop, RISCV_ISA_EXT_ZIMOP),
+	__RISCV_ISA_EXT_DATA(za64rs, RISCV_ISA_EXT_ZA64RS),
 	__RISCV_ISA_EXT_DATA(zaamo, RISCV_ISA_EXT_ZAAMO),
 	__RISCV_ISA_EXT_DATA(zabha, RISCV_ISA_EXT_ZABHA),
 	__RISCV_ISA_EXT_DATA(zacas, RISCV_ISA_EXT_ZACAS),
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 9cf62266f1890..b15ac9adf7920 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -206,6 +206,10 @@ static void hwprobe_isa_ext1(struct riscv_hwprobe *pair,
 		 */
 		EXT_KEY(isainfo->isa, ZICFISS, pair->value, missing);
 		EXT_KEY(isainfo->isa, ZICCLSM, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZICCAMOA, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZICCIF, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZICCRSE, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZA64RS, pair->value, missing);
 	}
 
 	/* Now turn off reporting features if any CPU is missing it. */

-- 
2.43.0

