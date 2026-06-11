Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F2C35E1C1
	for <linux-kselftest@vger.kernel.org>; Thu, 11 Jun 2026 20:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781208785; cv=none; b=V2iRB7Bh6n/aPeN8yvwnZOmUlKUlbiRxbTCPESipDDa1E9wPQ2+kjSrcmlsckjI21pNqTaDJ480i8uKWVj9GRKsK8egG3RzLGGf1QZ5Quaq0BwLM0hUJ1IdWuKdqpd7ZsbVwwLO9QuWUO1kyQ7duYGVlDBA/oDbvedZzJTMzeZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781208785; c=relaxed/simple;
	bh=GS7X8iSTN4N+xNNFv8PFB8oM/gEHO+PcXo/VZaIMAiM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=EYvPWMcLuB4M+zmTBODcFx1cfzpVWDDXghiQyHDu7oc8SSpQ9NwpHBTLygUxgcn1oMuclGdhgtDKEkhPf0HkCy/8oPYlXxCXBTXl8mhIDX6DJM6cf3aDfW3DMMXxn8PinJdy0JbKzIMLCVYsIlw+DQW3Oj8Nw3dyjnDffWjumx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H7RXnyuX; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H7RXnyuX"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-36d98c9b596so247883a91.3
        for <linux-kselftest@vger.kernel.org>; Thu, 11 Jun 2026 13:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781208783; x=1781813583; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4z0hl6gf2+Flj5FX9Tlv/6+ud0tivr1GWz8vDmFJRDs=;
        b=H7RXnyuXE6HWmmX59z4uWJW6Sei/mMN8nkLdTTx9/tou5QzKxwe5wuWSIbmRLs4E2B
         zmg+4WrkhkGJR+PA67dEfiAopBrRmqr78XXU37nYksMGV3LI5ZSye8G4qhgJIhTA6bSu
         07HBnaOvR+Z/JNr4Sl6X2Lk3va1vu01YC0WzlO+oN6aO6m4TasvBPCap+fYyRpsiVg7i
         DqTFxT2QxFDDbgm6mwDj5eAw/zoBY5NaoGLllq3IAXE3kTqT8tTeR31C+2NkUNJAVLQt
         1hcKXuEAbCzLMUik5svCpgMFxRndDIT/+KNOjMQtRKcjQBdK9vnzHfB+X7LrSzgMtSLz
         rzZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781208783; x=1781813583;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4z0hl6gf2+Flj5FX9Tlv/6+ud0tivr1GWz8vDmFJRDs=;
        b=Pkhb4cT9X419HSPnXpz/mnQ3Tq2Dv/blZSERN6l9gah3s65aE/rhti1/7PPUsal7ze
         WiaJJox25MV6JBRv0g+h3x51wbrYaOwk6HQTIGfuaAGEjAgKtvZPqRebIifPMhmLvxTt
         m6xjrQ+fjf9mowMQSG5EMmlRfaXHgBLIhM3zIREQfXkl/YK5hQfr2L7ZBkd48TwrRr8A
         +woLos36j3tCbYS6CE+6J47MuCHouvcn6eIYBXyUVRvrYjyHyAlBKdnVITlV+yYFfTpx
         uLMtaVdpIWSoI48g9ZNSYRzs1cOAA1UM/ZGMyNURPd+vp4UR0biWwvKRNKCv02NZlvq7
         vRPA==
X-Forwarded-Encrypted: i=1; AFNElJ8P/utuhFQO1dAp7lHujY0LBX8wUpa9zHKGTHcd/TdP8AXQXobSX8dAemJ5wB4Y87ROmPgbA0PO7zstW1e+tTY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdTumEYyD0XogCSBeiGu+2xpQjsfqAElfJwIbkW6HadwKxv3/x
	/KDeA2Xe3zy6UaBV/wPpmDrmhkPBtu4m/o8pQN6PuR7A5XNrx8McKHal
X-Gm-Gg: Acq92OFn/jroFJZoIxK9LYjWNbUnRY3fn9TvF9m28TrgXVTuG9k7ePikxo+U9mlxDBy
	aQ7oCUG5WYOLFlT8mDSqGKmSmmqfy7mA4FUbYDGhAKIYrfEBO+LwXJlPxCbKvpR53rYBVQqeE7k
	4Bi/s8Y//BgNDvsX9AUaBbpT+vlM6KwjarfTCsIiBAo7FBglJaHxzKxkl78H3f9aiSpAmQlnKwQ
	POmFB/wSiDx2Euy4DlZ2U87mNYCjeYPC0r689jz8Sw7DZDu4CAtC/QdVMFHILAWvdiwA0Io4IIP
	wvf7iOKH/H9/YkZxB7tktUdP+vIQv36I0uMrM3oKWjhJPcBaW7YBrG8xqvo5n1KGu/wHQy3FCSb
	Ohc4WbcfhHud5LFrEgAHL2XX/Hv4Xedk+g7sLtivjvt0a/yswd0WQuaRJBC7+45tSyFFV/zr6WQ
	==
X-Received: by 2002:a17:903:2ac4:b0:2c0:ab82:6b99 with SMTP id d9443c01a7336-2c2f36399f1mr48272375ad.33.1781208782464;
        Thu, 11 Jun 2026 13:13:02 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::302d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f875casm288730475ad.22.2026.06.11.13.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 13:13:02 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Subject: [PATCH v4 00/16] riscv: hwprobe: Expose RVA23U64 base behavior
Date: Thu, 11 Jun 2026 16:12:37 -0400
Message-Id: <20260611-rva23u64-hwprobe-v2-v4-0-3f01a2449488@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALUWK2oC/22Nyw6DIBBFf8WwLg0M4KMr/6PpAhCVpj4CStsY/
 72oTbppMpuT3DlnQd44azy6JAtyJlhvhz4CPyVIt7JvDLZVZAQEUiJIjl2QwOaU4/Y5ukEZHAD
 TCkjGCq1UblD8HJ2p7Wu3Xm8H+1ndjZ421bZorZ8G996zAbbdt0Dp30I8goFqIQXnNa106azXf
 pLurIcObZHAfpqUsP8aFjVCQCEzBTnLedl00j4Ox7quH99o0TcPAQAA
X-Change-ID: 20260508-rva23u64-hwprobe-v2-1d20739cbb8e
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
 Andrew Jones <andrew.jones@oss.qualcomm.com>, 
 Charlie Jenkins <charlie@rivosinc.com>, 
 Charlie Jenkins <thecharlesjenkins@gmail.com>, 
 Jesse Taube <jesse@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, 
 Qingwei Hu <qingwei.hu@bytedance.com>, Andy Chiu <andybnac@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=6838; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=GS7X8iSTN4N+xNNFv8PFB8oM/gEHO+PcXo/VZaIMAiM=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhixtsV1M0pIfS9dk2yi2XM1WDGhwi7udZ9gdveG2q2WYZ
 j+vCGdHKQuDGBeDrJgiy+GjLdlbX/lE+z7n/AEzh5UJZAgDF6cATMRiLSPDg+TlLVX8a+yfbl9t
 2r/hz+rlrwSWn6pJWV70QN5nc6zEIkaGbqX1iR89tTSW8ExSSvUNTtynVWnroCbXe2hv8LV8q3n
 8AA==
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE

This series builds on Andrew Jones's earlier RFC [1]. It lets userspace
check for RVA23U64 conformance in one call, instead of walking hwprobe +
prctl across every mandatory extension.

The series adds a small framework that resolves profile-class bases (IMA
and RVA23U64) from the kernel's ISA extension bitmap at init time, and
surfaces the result through both /proc/cpuinfo and hwprobe. Later patches
can add RVA23S64, and backward RVA22 / RVA20 detection, to
riscv_set_isa_bases() without changes to the surrounding code.

Series outline (v4):

  Housekeeping, clean-ups:
   1.  dt-bindings: sort the multi-letter Z extensions alphanumerically.
   2.  hwprobe.rst: normalize indentation.
   3.  hwprobe.rst: document EXT_ZICFISS / EXT_ZICFILP.
   4.  Standardize the single-letter extension macros to uppercase
       (RISCV_ISA_EXT_a -> RISCV_ISA_EXT_A, etc.).

  Per-extension cpufeature parsing + hwprobe export:
   5.  Zicclsm.
   6.  Ziccamoa, Ziccif, Ziccrse, Za64rs.
   7.  B (the Zba/Zbb/Zbs set).

  Zic64b (new first-class extension):
   8.  dt-binding, with a schema check.
   9.  cpufeature parsing + hwprobe export.
  10-12. dts: declare zic64b in the SpacemiT K3, SpacemiT K1, and Sophgo
         SG2044 device trees.

  RVA23U64 base detection and exposure:
  13.  riscv_have_user_pmlen(): accessor for user pointer-masking PMLEN
       support.
  14.  cpufeature: per-hart and host-wide isa_bases bitmaps; IMA and
       RVA23U64 detection lives here.
  15.  /proc/cpuinfo: print "isa bases:" and "hart isa bases:", e.g.
       rva23u64.
  16.  hwprobe: expose RVA23U64.

Tested on both K3 Pico ITX and QEMU with -cpu rva23s64,sv39=on:
  - /proc/cpuinfo reports "isa bases : rv64ima rva23u64" on both the
    aggregated and per-hart lines.
  - hwprobe RISCV_HWPROBE_KEY_BASE_BEHAVIOR returns
    BASE_BEHAVIOR_IMA | BASE_BEHAVIOR_RVA23U64.

Based on v7.1-rc6 plus [2]; happy to rebase onto another tree if needed.
A branch is available for all patches in the series: [3].

Note: [2] is only required to save the merge effort for adding 'Zic64b'
      and 'Ziccrse' into the same k3.dtsi file.

Link: Andrew's RFC v1:
      https://lore.kernel.org/linux-riscv/20260206002349.96740-1-andrew.jones@oss.qualcomm.com/ [1]
Link: Prerequisite for applying on K3 w/Ziccrse:
      https://lore.kernel.org/all/20260602070257-KYC5031219@kernel.org/ [2]
Link: Branch: https://github.com/docularxu/linux/commits/b4/rva23u64-hwprobe-v4/ [3]

Changes in v4:
- New patch: sort the multi-letter Z extensions alphanumerically in the
  dt-binding (Conor), and place zic64b at its sorted position.
- Zic64b cpufeature: validate only the CBO block sizes that are present;
  overlaps Qingwei Hu's earlier patch, so it is now authored by Qingwei.
- Document EXT_ZICFISS / EXT_ZICFILP: cite the riscv-cfi v1.0 tag commit.
- Picked up Inochi Amaoto's Acked-by (SG2044 dts) and Andrew Jones's
  Reviewed-by (documentation patch).
- Link to v3: https://patch.msgid.link/20260603-rva23u64-hwprobe-v2-v3-0-5529a7b28384@gmail.com

Changes in v3:
- Add Zic64b as a first-class ISA extension: dt-binding, cpufeature
  parsing with a validate check, hwprobe export, and device-tree
  declarations for K3/K1/SG2044.
- Patch 1 is now a clean up of hwprobe.rst indentation.
- Document RISCV_HWPROBE_EXT_ZICFILP alongside ZICFISS.
- Move the Zicclsm hwprobe.rst entry to the IMA_EXT_1 section to match
  its bit allocation.
- Collect Anup Patel's Acked-by/Reviewed-by on Patch 3, the capitalization.
- In cpufeature.c, set the local ext_mask with __set_bit().
- Update Guodong Xu's email to docular.xu@gmail.com.
- Link to v2: https://patch.msgid.link/20260511-rva23u64-hwprobe-v2-v2-0-21c5a544f1dc@riscstar.com

Changes in v2 (since Andrew's RFC v1):
- Rebased onto v7.1-rc2.
- Reworked rva23u64 detection into per-hart and host isa_bases bitmaps,
  shared by /proc/cpuinfo and hwprobe.
- Scoped to IMA and RVA23U64 (RVA23S64, RVA20/RVA22 cpuinfo output deferred).
- Link to v1:  https://lore.kernel.org/linux-riscv/20260206002349.96740-1-andrew.jones@oss.qualcomm.com

Signed-off-by: Guodong Xu <docular.xu@gmail.com>
---
Andrew Jones (4):
      riscv: hwprobe.rst: Make indentation consistent
      riscv: Add Ziccamoa, Ziccif, Ziccrse, and Za64rs to cpufeature and hwprobe
      riscv: Add B to hwcap and hwprobe
      riscv: Add a getter for user PMLEN support

Charlie Jenkins (1):
      riscv: Standardize extension capitalization

Guodong Xu (9):
      dt-bindings: riscv: sort multi-letter Z extensions alphanumerically
      riscv: hwprobe.rst: Document EXT_ZICFISS and EXT_ZICFILP
      dt-bindings: riscv: Add Zic64b extension description
      riscv: dts: spacemit: k3: Add Zic64b ISA extension
      riscv: dts: spacemit: k1: Add Zic64b ISA extension
      riscv: dts: sophgo: sg2044: Add Zic64b ISA extension
      riscv: cpufeature: Introduce ISA bases bitmap and rva23u64 detection
      riscv: cpu: Output isa bases lines in cpuinfo
      riscv: hwprobe: Introduce rva23u64 base behavior

Jesse Taube (1):
      riscv: Add Zicclsm to cpufeature and hwprobe

Qingwei Hu (1):
      riscv: Add Zic64b to cpufeature and hwprobe

 Documentation/arch/riscv/hwprobe.rst               | 240 ++++++++++++---------
 .../devicetree/bindings/riscv/extensions.yaml      | 204 ++++++++++--------
 arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi        | 128 +++++------
 arch/riscv/boot/dts/spacemit/k1.dtsi               |  80 +++----
 arch/riscv/boot/dts/spacemit/k3.dtsi               |  48 ++---
 arch/riscv/include/asm/cpufeature.h                |  14 ++
 arch/riscv/include/asm/hwcap.h                     |  24 ++-
 arch/riscv/include/asm/processor.h                 |   4 +
 arch/riscv/include/asm/switch_to.h                 |   4 +-
 arch/riscv/include/uapi/asm/hwcap.h                |   1 +
 arch/riscv/include/uapi/asm/hwprobe.h              |  10 +-
 arch/riscv/kernel/cpu.c                            |  26 +++
 arch/riscv/kernel/cpufeature.c                     | 183 ++++++++++++++--
 arch/riscv/kernel/process.c                        |  12 ++
 arch/riscv/kernel/sys_hwprobe.c                    |  34 ++-
 arch/riscv/kvm/isa.c                               |  16 +-
 arch/riscv/kvm/main.c                              |   2 +-
 arch/riscv/kvm/vcpu_fp.c                           |  20 +-
 arch/riscv/kvm/vcpu_onereg.c                       |   6 +-
 arch/riscv/kvm/vcpu_vector.c                       |  10 +-
 tools/testing/selftests/riscv/hwprobe/which-cpus.c |   2 +-
 21 files changed, 680 insertions(+), 388 deletions(-)
---
base-commit: 99c201dabc35bbd21252c4c682488209dcb4295e
change-id: 20260508-rva23u64-hwprobe-v2-1d20739cbb8e

Best regards,
--  
Guodong Xu <docular.xu@gmail.com>

