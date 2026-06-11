Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71314369D64
	for <linux-kselftest@vger.kernel.org>; Thu, 11 Jun 2026 20:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781208802; cv=none; b=FquPBAk6crUvDFhsyvBFA8xldvATPPU6jDWn43ytbU64hPNVs/1WV4smvFlJKz7SZHWj7ZeL7HyCB2FtUgSLrQWk8wUQZLTAuXD43WlyrGwNL80wdky5iK43caVSpAIQLylisXYjY4y9zhZAotRZ4FzErduY1k4jn+uwPKOBX2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781208802; c=relaxed/simple;
	bh=WGcOGvqaetbEHQzdF/lWpQ6ABvIWM9LYTrsz4zJlOL0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bNMVuggZWAZpJtUK4x7J1Iv9Je79IkKCQG9SXaNZe676n3kfg9gkoNy9cFxSNdydu6i4mMl04Ono210fsgCtzQRowTvxBlakiuYhqiu4HuvNQkUKr4snqQHJOPb/zMrDhAMiOK8n3x3DXzO+/5sVjJ4Z/oIHrC8SZwIAPTqQDgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=na6/bPsj; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="na6/bPsj"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2bf125989f2so2247235ad.3
        for <linux-kselftest@vger.kernel.org>; Thu, 11 Jun 2026 13:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781208800; x=1781813600; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8I5erXJc2rPSk4mu9K4o3pYu8vzsNMBKJ/Xde8NImfk=;
        b=na6/bPsjkXop4EIdSUZnTaUz12Ix4J6puZJdg9MEZnGyblfOFg8fE4FmPq4BIqTcrV
         RnIoOf9IES0W+XATKk1Gf/vSHXXxzXHB2K8Rlhyx5jN/9SXtKEAGC1efq8P1mS4zkyRW
         fQIqkpX6/IT9JYt6w3VY9UOKjRFPcx7uUDN+i6nNABQjE+A/cAnmsp8iZOQvRZfebwFm
         ED69ldRsbr3GL1k3i20LSYjJOJYPTstGMVZ/WKWtsog4E3oEDH60yCru8nOSw8+3Uj2O
         Sh9jiU2gIs0IfTJI0Ep06uZ+lWOUPQ1u/ld2WaoqdBe7Eu2nou1LCgAdZMqzj1qAVYo7
         PBdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781208800; x=1781813600;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8I5erXJc2rPSk4mu9K4o3pYu8vzsNMBKJ/Xde8NImfk=;
        b=GMMkYiqxe7PITtiK8pJlR4WyoLYGX7gyipkBtTb2GA1sznVXiHOhU0+bpSZqCM+yRI
         CxRIRdCqZDY5cyfQBpg57k+uvbelalHUqkXkiBNOjVEpAjMl7GprMFQ7wD1mftjdgZHe
         8+lIGnm2i80/3gDLsXtvgFzbEsY8dBKlJc21V0YvxmVCGlnaQsHbt+xP4xM22AZl/yvd
         X+xo9PY/4u3tocPWrxZHUItIznRwyRMgKIfIMbltgQc+5OjWrxPXdX03PNTbrHM/hK8N
         TSI6wHSNPk6HTwWX+vTdea+LvgLPyb6by1bD+nX70ljnovHc2FfRwFO3GqthJ0G7it+E
         vmQw==
X-Forwarded-Encrypted: i=1; AFNElJ9+u6pW8/YWhsgzLdC0V9nCp6dw/mEHISA1gyjJ2rAVG8/mVpC0dpJWArnoAw3eGj1vue3VGWgOfhmteC2pems=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMZ0f+X8ShNYC36wleDZiD9GIFABTR5IGLxdQRcUvPyPjTVzvq
	hifw5Mvg/U0YrhYxMM+ZiV2S7HgAHh655+2FG6mLcvwcNI7/z10cAiku
X-Gm-Gg: Acq92OH/W51XgGCQtpNhwQlYTE6LDjXnUF+DVM6wluoeMjbOVo1TGCnsSCqaS8S7EaJ
	fwaZf693P6jUxfbCb40ikL4UwJDH9gXTaTcFyrbfsx6AhPn0tYEWC3z0GJpHbPePLbVwuTEB4+F
	/RdPhT0mNJDh1cSEGICvyKEBAKddD0b6X+E469pY5N1LvmNalk2f4hy5g2f042YD7fltzwd7xAh
	UaBjPsr/rJ3y5hcnmu4QbJBI+r2JxuflNPyerkbJ0vbTl8dzDoRdFqhlkYUVw8W5okorgn/l6/L
	FfPeM1c1dfbu7lbLDiAiPNA50JF03zzGBMXfz7Tq1o73jhAHHkzjDgWe5KmEIhMiMIDEyn6h8g1
	I1O0iikBtdFhpyOUpIpkEZH8O7doEOuOhLfVwrF0ojgrFDnlzK/ULxscikUhlDi+Az8aca5cZOL
	+93VPNIZPQ
X-Received: by 2002:a17:903:2449:b0:2c2:50c7:58a4 with SMTP id d9443c01a7336-2c2f21a17e8mr51191105ad.22.1781208799654;
        Thu, 11 Jun 2026 13:13:19 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::302d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f875casm288730475ad.22.2026.06.11.13.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 13:13:19 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Thu, 11 Jun 2026 16:12:39 -0400
Subject: [PATCH v4 02/16] riscv: hwprobe.rst: Make indentation consistent
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-rva23u64-hwprobe-v2-v4-2-3f01a2449488@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=20524; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=s32nahUhQLj4L2esrJKbW037pNJIi93j499jOhIxbus=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhixtsQO3+PYv4T0TVdi6KGjhvNtist7ply2OeP3qMqt/8
 LT5pHtpRykLgxgXg6yYIsvhoy3ZW1/5RPs+5/wBM4eVCWQIAxenAExkdQDDX4k/6Sc9nublu/7e
 dvupZ7zAmd9fu4LXLt7pvujzWsNHJxcxMjytOpG44VW7QppRs/wdX/3PkRdbLVxPdHVLlD9azFj
 /ghUA
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE

From: Andrew Jones <andrew.jones@oss.qualcomm.com>

A handful of vendor-extension entries indent continuation lines with a
tab character, while the rest of hwprobe.rst uses spaces.  In addition,
many list items align their continuation lines under the 'm' of
':c:macro:' (column 7) rather than under the item text (column 4), so
the file mixes several indentation styles.

Replace the tabs with spaces and align every list item's continuation
lines under the item text, giving the whole file one consistent style.

Whitespace-only change, no functional change.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
[Guodong: extend from tabs->spaces to normalizing all continuation-line
 indentation across the file]
Signed-off-by: Guodong Xu <docular.xu@gmail.com>
---
v4: No change.
v3:
- Move to the front of the series.
- Extend from replacing tabs to normalizing all continuation-line
  indentation, so later patches add documentation on top of a
  consistent base (Andrew).
---
 Documentation/arch/riscv/hwprobe.rst | 194 +++++++++++++++++------------------
 1 file changed, 97 insertions(+), 97 deletions(-)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index c420a8349bc68..a09a8f16bd16f 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -82,121 +82,121 @@ The following keys are defined:
     version 1.0 of the RISC-V Vector extension manual.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZBA`: The Zba address generation extension is
-       supported, as defined in version 1.0 of the Bit-Manipulation ISA
-       extensions.
+    supported, as defined in version 1.0 of the Bit-Manipulation ISA
+    extensions.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZBB`: The Zbb extension is supported, as defined
-       in version 1.0 of the Bit-Manipulation ISA extensions.
+    in version 1.0 of the Bit-Manipulation ISA extensions.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZBS`: The Zbs extension is supported, as defined
-       in version 1.0 of the Bit-Manipulation ISA extensions.
+    in version 1.0 of the Bit-Manipulation ISA extensions.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZICBOZ`: The Zicboz extension is supported, as
-       ratified in commit 3dd606f ("Create cmobase-v1.0.pdf") of riscv-CMOs.
+    ratified in commit 3dd606f ("Create cmobase-v1.0.pdf") of riscv-CMOs.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZBC` The Zbc extension is supported, as defined
-       in version 1.0 of the Bit-Manipulation ISA extensions.
+    in version 1.0 of the Bit-Manipulation ISA extensions.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZBKB` The Zbkb extension is supported, as
-       defined in version 1.0 of the Scalar Crypto ISA extensions.
+    defined in version 1.0 of the Scalar Crypto ISA extensions.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZBKC` The Zbkc extension is supported, as
-       defined in version 1.0 of the Scalar Crypto ISA extensions.
+    defined in version 1.0 of the Scalar Crypto ISA extensions.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZBKX` The Zbkx extension is supported, as
-       defined in version 1.0 of the Scalar Crypto ISA extensions.
+    defined in version 1.0 of the Scalar Crypto ISA extensions.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZKND` The Zknd extension is supported, as
-       defined in version 1.0 of the Scalar Crypto ISA extensions.
+    defined in version 1.0 of the Scalar Crypto ISA extensions.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZKNE` The Zkne extension is supported, as
-       defined in version 1.0 of the Scalar Crypto ISA extensions.
+    defined in version 1.0 of the Scalar Crypto ISA extensions.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZKNH` The Zknh extension is supported, as
-       defined in version 1.0 of the Scalar Crypto ISA extensions.
+    defined in version 1.0 of the Scalar Crypto ISA extensions.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZKSED` The Zksed extension is supported, as
-       defined in version 1.0 of the Scalar Crypto ISA extensions.
+    defined in version 1.0 of the Scalar Crypto ISA extensions.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZKSH` The Zksh extension is supported, as
-       defined in version 1.0 of the Scalar Crypto ISA extensions.
+    defined in version 1.0 of the Scalar Crypto ISA extensions.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZKT` The Zkt extension is supported, as defined
-       in version 1.0 of the Scalar Crypto ISA extensions.
+    in version 1.0 of the Scalar Crypto ISA extensions.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZVBB`: The Zvbb extension is supported as
-       defined in version 1.0 of the RISC-V Cryptography Extensions Volume II.
+    defined in version 1.0 of the RISC-V Cryptography Extensions Volume II.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZVBC`: The Zvbc extension is supported as
-       defined in version 1.0 of the RISC-V Cryptography Extensions Volume II.
+    defined in version 1.0 of the RISC-V Cryptography Extensions Volume II.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZVKB`: The Zvkb extension is supported as
-       defined in version 1.0 of the RISC-V Cryptography Extensions Volume II.
+    defined in version 1.0 of the RISC-V Cryptography Extensions Volume II.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZVKG`: The Zvkg extension is supported as
-       defined in version 1.0 of the RISC-V Cryptography Extensions Volume II.
+    defined in version 1.0 of the RISC-V Cryptography Extensions Volume II.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZVKNED`: The Zvkned extension is supported as
-       defined in version 1.0 of the RISC-V Cryptography Extensions Volume II.
+    defined in version 1.0 of the RISC-V Cryptography Extensions Volume II.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZVKNHA`: The Zvknha extension is supported as
-       defined in version 1.0 of the RISC-V Cryptography Extensions Volume II.
+    defined in version 1.0 of the RISC-V Cryptography Extensions Volume II.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZVKNHB`: The Zvknhb extension is supported as
-       defined in version 1.0 of the RISC-V Cryptography Extensions Volume II.
+    defined in version 1.0 of the RISC-V Cryptography Extensions Volume II.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZVKSED`: The Zvksed extension is supported as
-       defined in version 1.0 of the RISC-V Cryptography Extensions Volume II.
+    defined in version 1.0 of the RISC-V Cryptography Extensions Volume II.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZVKSH`: The Zvksh extension is supported as
-       defined in version 1.0 of the RISC-V Cryptography Extensions Volume II.
+    defined in version 1.0 of the RISC-V Cryptography Extensions Volume II.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZVKT`: The Zvkt extension is supported as
-       defined in version 1.0 of the RISC-V Cryptography Extensions Volume II.
+    defined in version 1.0 of the RISC-V Cryptography Extensions Volume II.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZFH`: The Zfh extension version 1.0 is supported
-       as defined in the RISC-V ISA manual.
+    as defined in the RISC-V ISA manual.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZFHMIN`: The Zfhmin extension version 1.0 is
-       supported as defined in the RISC-V ISA manual.
+    supported as defined in the RISC-V ISA manual.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZIHINTNTL`: The Zihintntl extension version 1.0
-       is supported as defined in the RISC-V ISA manual.
+    is supported as defined in the RISC-V ISA manual.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZVFH`: The Zvfh extension is supported as
-       defined in the RISC-V Vector manual starting from commit e2ccd0548d6c
-       ("Remove draft warnings from Zvfh[min]").
+    defined in the RISC-V Vector manual starting from commit e2ccd0548d6c
+    ("Remove draft warnings from Zvfh[min]").
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZVFHMIN`: The Zvfhmin extension is supported as
-       defined in the RISC-V Vector manual starting from commit e2ccd0548d6c
-       ("Remove draft warnings from Zvfh[min]").
+    defined in the RISC-V Vector manual starting from commit e2ccd0548d6c
+    ("Remove draft warnings from Zvfh[min]").
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZFA`: The Zfa extension is supported as
-       defined in the RISC-V ISA manual starting from commit 056b6ff467c7
-       ("Zfa is ratified").
+    defined in the RISC-V ISA manual starting from commit 056b6ff467c7
+    ("Zfa is ratified").
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZTSO`: The Ztso extension is supported as
-       defined in the RISC-V ISA manual starting from commit 5618fb5a216b
-       ("Ztso is now ratified.")
+    defined in the RISC-V ISA manual starting from commit 5618fb5a216b
+    ("Ztso is now ratified.")
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZACAS`: The Zacas extension is supported as
-       defined in the Atomic Compare-and-Swap (CAS) instructions manual starting
-       from commit 5059e0ca641c ("update to ratified").
+    defined in the Atomic Compare-and-Swap (CAS) instructions manual starting
+    from commit 5059e0ca641c ("update to ratified").
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZICNTR`: The Zicntr extension version 2.0
-       is supported as defined in the RISC-V ISA manual.
+    is supported as defined in the RISC-V ISA manual.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZICOND`: The Zicond extension is supported as
-       defined in the RISC-V Integer Conditional (Zicond) operations extension
-       manual starting from commit 95cf1f9 ("Add changes requested by Ved
-       during signoff")
+    defined in the RISC-V Integer Conditional (Zicond) operations extension
+    manual starting from commit 95cf1f9 ("Add changes requested by Ved
+    during signoff")
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZIHINTPAUSE`: The Zihintpause extension is
-       supported as defined in the RISC-V ISA manual starting from commit
-       d8ab5c78c207 ("Zihintpause is ratified").
+    supported as defined in the RISC-V ISA manual starting from commit
+    d8ab5c78c207 ("Zihintpause is ratified").
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZIHPM`: The Zihpm extension version 2.0
-       is supported as defined in the RISC-V ISA manual.
+    is supported as defined in the RISC-V ISA manual.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZVE32X`: The Vector sub-extension Zve32x is
     supported, as defined by version 1.0 of the RISC-V Vector extension manual.
@@ -214,84 +214,84 @@ The following keys are defined:
     supported, as defined by version 1.0 of the RISC-V Vector extension manual.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZIMOP`: The Zimop May-Be-Operations extension is
-       supported as defined in the RISC-V ISA manual starting from commit
-       58220614a5f ("Zimop is ratified/1.0").
+    supported as defined in the RISC-V ISA manual starting from commit
+    58220614a5f ("Zimop is ratified/1.0").
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZCA`: The Zca extension part of Zc* standard
-       extensions for code size reduction, as ratified in commit 8be3419c1c0
-       ("Zcf doesn't exist on RV64 as it contains no instructions") of
-       riscv-code-size-reduction.
+    extensions for code size reduction, as ratified in commit 8be3419c1c0
+    ("Zcf doesn't exist on RV64 as it contains no instructions") of
+    riscv-code-size-reduction.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZCB`: The Zcb extension part of Zc* standard
-       extensions for code size reduction, as ratified in commit 8be3419c1c0
-       ("Zcf doesn't exist on RV64 as it contains no instructions") of
-       riscv-code-size-reduction.
+    extensions for code size reduction, as ratified in commit 8be3419c1c0
+    ("Zcf doesn't exist on RV64 as it contains no instructions") of
+    riscv-code-size-reduction.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZCD`: The Zcd extension part of Zc* standard
-       extensions for code size reduction, as ratified in commit 8be3419c1c0
-       ("Zcf doesn't exist on RV64 as it contains no instructions") of
-       riscv-code-size-reduction.
+    extensions for code size reduction, as ratified in commit 8be3419c1c0
+    ("Zcf doesn't exist on RV64 as it contains no instructions") of
+    riscv-code-size-reduction.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZCF`: The Zcf extension part of Zc* standard
-       extensions for code size reduction, as ratified in commit 8be3419c1c0
-       ("Zcf doesn't exist on RV64 as it contains no instructions") of
-       riscv-code-size-reduction.
+    extensions for code size reduction, as ratified in commit 8be3419c1c0
+    ("Zcf doesn't exist on RV64 as it contains no instructions") of
+    riscv-code-size-reduction.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZCMOP`: The Zcmop May-Be-Operations extension is
-       supported as defined in the RISC-V ISA manual starting from commit
-       c732a4f39a4 ("Zcmop is ratified/1.0").
+    supported as defined in the RISC-V ISA manual starting from commit
+    c732a4f39a4 ("Zcmop is ratified/1.0").
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZAWRS`: The Zawrs extension is supported as
-       ratified in commit 98918c844281 ("Merge pull request #1217 from
-       riscv/zawrs") of riscv-isa-manual.
+    ratified in commit 98918c844281 ("Merge pull request #1217 from
+    riscv/zawrs") of riscv-isa-manual.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZAAMO`: The Zaamo extension is supported as
-       defined in the in the RISC-V ISA manual starting from commit e87412e621f1
-       ("integrate Zaamo and Zalrsc text (#1304)").
+    defined in the in the RISC-V ISA manual starting from commit e87412e621f1
+    ("integrate Zaamo and Zalrsc text (#1304)").
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZALASR`: The Zalasr extension is supported as
-       frozen at commit 194f0094 ("Version 0.9 for freeze") of riscv-zalasr.
+    frozen at commit 194f0094 ("Version 0.9 for freeze") of riscv-zalasr.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZALRSC`: The Zalrsc extension is supported as
-       defined in the in the RISC-V ISA manual starting from commit e87412e621f1
-       ("integrate Zaamo and Zalrsc text (#1304)").
+    defined in the in the RISC-V ISA manual starting from commit e87412e621f1
+    ("integrate Zaamo and Zalrsc text (#1304)").
 
   * :c:macro:`RISCV_HWPROBE_EXT_SUPM`: The Supm extension is supported as
-       defined in version 1.0 of the RISC-V Pointer Masking extensions.
+    defined in version 1.0 of the RISC-V Pointer Masking extensions.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZFBFMIN`: The Zfbfmin extension is supported as
-       defined in the RISC-V ISA manual starting from commit 4dc23d6229de
-       ("Added Chapter title to BF16").
+    defined in the RISC-V ISA manual starting from commit 4dc23d6229de
+    ("Added Chapter title to BF16").
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZVFBFMIN`: The Zvfbfmin extension is supported as
-       defined in the RISC-V ISA manual starting from commit 4dc23d6229de
-       ("Added Chapter title to BF16").
+    defined in the RISC-V ISA manual starting from commit 4dc23d6229de
+    ("Added Chapter title to BF16").
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZVFBFWMA`: The Zvfbfwma extension is supported as
-       defined in the RISC-V ISA manual starting from commit 4dc23d6229de
-       ("Added Chapter title to BF16").
+    defined in the RISC-V ISA manual starting from commit 4dc23d6229de
+    ("Added Chapter title to BF16").
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZICBOM`: The Zicbom extension is supported, as
-       ratified in commit 3dd606f ("Create cmobase-v1.0.pdf") of riscv-CMOs.
+    ratified in commit 3dd606f ("Create cmobase-v1.0.pdf") of riscv-CMOs.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZABHA`: The Zabha extension is supported as
-       ratified in commit 49f49c842ff9 ("Update to Rafified state") of
-       riscv-zabha.
+    ratified in commit 49f49c842ff9 ("Update to Rafified state") of
+    riscv-zabha.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZICBOP`: The Zicbop extension is supported, as
-       ratified in commit 3dd606f ("Create cmobase-v1.0.pdf") of riscv-CMOs.
+    ratified in commit 3dd606f ("Create cmobase-v1.0.pdf") of riscv-CMOs.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZILSD`: The Zilsd extension is supported as
-       defined in the RISC-V ISA manual starting from commit f88abf1 ("Integrating
-       load/store pair for RV32 with the main manual") of the riscv-isa-manual.
+    defined in the RISC-V ISA manual starting from commit f88abf1 ("Integrating
+    load/store pair for RV32 with the main manual") of the riscv-isa-manual.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZCLSD`: The Zclsd extension is supported as
-       defined in the RISC-V ISA manual starting from commit f88abf1 ("Integrating
-       load/store pair for RV32 with the main manual") of the riscv-isa-manual.
+    defined in the RISC-V ISA manual starting from commit f88abf1 ("Integrating
+    load/store pair for RV32 with the main manual") of the riscv-isa-manual.
 
 * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: Deprecated.  Returns similar values to
-     :c:macro:`RISCV_HWPROBE_KEY_MISALIGNED_SCALAR_PERF`, but the key was
-     mistakenly classified as a bitmask rather than a value.
+  :c:macro:`RISCV_HWPROBE_KEY_MISALIGNED_SCALAR_PERF`, but the key was
+  mistakenly classified as a bitmask rather than a value.
 
 * :c:macro:`RISCV_HWPROBE_KEY_MISALIGNED_SCALAR_PERF`: An enum value describing
   the performance of misaligned scalar native word accesses on the selected set
@@ -326,7 +326,7 @@ The following keys are defined:
 * :c:macro:`RISCV_HWPROBE_KEY_TIME_CSR_FREQ`: Frequency (in Hz) of `time CSR`.
 
 * :c:macro:`RISCV_HWPROBE_KEY_MISALIGNED_VECTOR_PERF`: An enum value describing the
-     performance of misaligned vector accesses on the selected set of processors.
+  performance of misaligned vector accesses on the selected set of processors.
 
   * :c:macro:`RISCV_HWPROBE_MISALIGNED_VECTOR_UNKNOWN`: The performance of misaligned
     vector accesses is unknown.
@@ -348,7 +348,7 @@ The following keys are defined:
   * MIPS
 
     * :c:macro:`RISCV_HWPROBE_VENDOR_EXT_XMIPSEXECTL`: The xmipsexectl vendor
-        extension is supported in the MIPS ISA extensions spec.
+      extension is supported in the MIPS ISA extensions spec.
 
 * :c:macro:`RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0`: A bitmask containing the
   thead vendor extensions that are compatible with the
@@ -357,8 +357,8 @@ The following keys are defined:
   * T-HEAD
 
     * :c:macro:`RISCV_HWPROBE_VENDOR_EXT_XTHEADVECTOR`: The xtheadvector vendor
-        extension is supported in the T-Head ISA extensions spec starting from
-	commit a18c801634 ("Add T-Head VECTOR vendor extension. ").
+      extension is supported in the T-Head ISA extensions spec starting from
+      commit a18c801634 ("Add T-Head VECTOR vendor extension. ").
 
 * :c:macro:`RISCV_HWPROBE_KEY_ZICBOM_BLOCK_SIZE`: An unsigned int which
   represents the size of the Zicbom block in bytes.
@@ -370,20 +370,20 @@ The following keys are defined:
   * SIFIVE
 
     * :c:macro:`RISCV_HWPROBE_VENDOR_EXT_XSFVQMACCDOD`: The Xsfqmaccdod vendor
-        extension is supported in version 1.1 of SiFive Int8 Matrix Multiplication
-	Extensions Specification.
+      extension is supported in version 1.1 of SiFive Int8 Matrix Multiplication
+      Extensions Specification.
 
     * :c:macro:`RISCV_HWPROBE_VENDOR_EXT_XSFVQMACCQOQ`: The Xsfqmaccqoq vendor
-        extension is supported in version 1.1 of SiFive Int8 Matrix Multiplication
-	Instruction Extensions Specification.
+      extension is supported in version 1.1 of SiFive Int8 Matrix Multiplication
+      Instruction Extensions Specification.
 
     * :c:macro:`RISCV_HWPROBE_VENDOR_EXT_XSFVFNRCLIPXFQF`: The Xsfvfnrclipxfqf
-        vendor extension is supported in version 1.0 of SiFive FP32-to-int8 Ranged
-	Clip Instructions Extensions Specification.
+      vendor extension is supported in version 1.0 of SiFive FP32-to-int8 Ranged
+      Clip Instructions Extensions Specification.
 
     * :c:macro:`RISCV_HWPROBE_VENDOR_EXT_XSFVFWMACCQQQ`: The Xsfvfwmaccqqq
-        vendor extension is supported in version 1.0 of Matrix Multiply Accumulate
-	Instruction Extensions Specification.
+      vendor extension is supported in version 1.0 of Matrix Multiply Accumulate
+      Instruction Extensions Specification.
 
 * :c:macro:`RISCV_HWPROBE_KEY_ZICBOP_BLOCK_SIZE`: An unsigned int which
   represents the size of the Zicbop block in bytes.

-- 
2.43.0

