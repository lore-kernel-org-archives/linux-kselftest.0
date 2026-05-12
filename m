Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454C43ED132
	for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 13:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778506586; cv=none; b=NzGVp/gH/zqYZG2CLlUy6E2xuOVlN8cIEb0PljOoRbLqwSTz2F2e4CoEMlKXY/TpV/4UJwQ2ER554859KpSsgNTQ4zFmbAVpC9cPO+ldIvZhyI3e6eNvlwLvxcndDEv32eJ8ZK1IZNgIKOi7ShNrfSk4EVF8z36K01Pso1dooW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778506586; c=relaxed/simple;
	bh=AI7+PC+wO6PLDRtpdw2bXlws667UYCRwcBeEHIMSovA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=h3X85HIfzKRCmz5smlh+C7sp9c25qVJUrDL7kpzjqoebygriPMpJC5n8asYNg5LQ5BfIFF9RrzAJVb1AcgwHjOdGUTDLUiVMg1U2Q/uEJ0HoHOPMcs/+RkOpSZROZQ683mvwDasfFfBTa0mHqDUFzYqzAavZSHxz6q8GW3f7RfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=HrC2uyz6; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="HrC2uyz6"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3664df32e91so2821798a91.3
        for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 06:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1778506583; x=1779111383; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+Z29fhkBQbknShosTsnNNQxT5IXOqOhrJTIx7eoQ358=;
        b=HrC2uyz6M4ftAjkf3RaKqtm7xosMoYcaRoNSA2Ho/WQidy9vLT3CPQw2it2gjR2uc2
         LqLrJvSkFR9CsDOGytE0aufchCTsU84CnR/jC7xJhDyfMD1i0JIdxpnvhNWm+B6TjzD/
         39do8w+h6ovm6IbH9noFsTZeW2da6+T6xFZETmcFioOV7TYb0PtkBIv8KBD0T7uTuKgA
         SVJ/eFWbDUB/q3lLS/FbafH2yU+b0F+bhRCJao8aMaLmPT3sniMYVD/SLDso/dRh39rR
         IZndLAbNyysk9zecUv+PQg1XDld21I5ebLhXyDQJ0V+UimRdnLTxna/i0OCQVxTSU6cY
         T2BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778506583; x=1779111383;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Z29fhkBQbknShosTsnNNQxT5IXOqOhrJTIx7eoQ358=;
        b=Y5cXoj4LnPB2HOuwDVswliDq0R4KPS36SmbmMORuPL0+pzCnmW5iy5w6A1GU6VX65o
         hGiFU4D8fHKbFx3NtiEaDE5TNv28LeJYhSOV7HQE+tmuB9qMHCLahGLf5FMvXesKIDV0
         9p/l6p7k86vDUrjeLDA5e9hVh0S5DgIn4V2PDdISuoxDsr6/6CBX+Ep5dk82CQ53iQWz
         77LASXtKZ6Krh33ZLsvp/4KBdKvBc0vbrZJpGuj93Rx+2gFPSKNrvQlNOKfPLlSDo3PB
         8e0vN0+DMmwsiAm777SI3gl8pmrQPQYiThqFTLnHemKwOTEnATV3kvsS8wYg8h6ckxpm
         DxMg==
X-Forwarded-Encrypted: i=1; AFNElJ+3+IMBhSy8J/65FWWpASB9Z4lv2L5pEIMPXERrSUqXak3I8ExEIsvR8sVMbftT9qg4qb2kuGOTF+bkIJeOFck=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfiYbg+7Mgm+G0Oyott9bX2nw2jl5lsvS8tZ1PdgnTdjXfJG4T
	LN329CNtCI3Ct/M/brbUy3I/fIcBNZO/BIGv+izi5wIF1ujetQTUq9RUUni+MLeOOGs=
X-Gm-Gg: Acq92OG2C9Q7M+U/rykfg+HVcJzwrEI+Nzzo1A0nDuUjG8P6aBOvFGq9s5gCXQzWZFI
	xaCOvnHYFIKWLrO3Z5a+MKiDNG2NXywfP2G8N8c00XZ7Xwnx/hQD2VQKTwgL+OAIoEuJ34PSL0o
	iP8kSwY+Tb47VBK4NMrcRYPigz3v/xyvGEMI4g2qvIDAtMYLKKHYNSW4rZQpgOKJj7cSb1IAnjQ
	B7POEC4l00AzkpWbojsZPBGpr1sUGfmwS032Zs1HwaV73EPWQ0qcboESnEJr2ijs36K/fq2W9PJ
	t9flryZdDI9X9iUDhmWskdNyHUnFtk0qx6XX0ReTNLkDoF9moDxD3wpvKWwol9tFBiFqoFrOUK0
	auZS4iMa+mn9IYtichEePl3d7/Yh+Z6sGiwPNGOWKx61KcgsR0rU3u9qNxNyl1kK3s7gwW5ufOU
	eX1iM+5v9Z1W+LKePy9i2NSuqhUKRoH+bDy4Ovk2NyGuA=
X-Received: by 2002:a17:90b:2648:b0:366:479c:59e8 with SMTP id 98e67ed59e1d1-367d46b8be5mr9758495a91.8.1778506583435;
        Mon, 11 May 2026 06:36:23 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::30f3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367be3daafesm3034326a91.8.2026.05.11.06.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 06:36:23 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
Subject: [PATCH v2 00/10] riscv: hwprobe: Expose RVA23U64 base behavior
Date: Mon, 11 May 2026 21:34:45 -0400
Message-Id: <20260511-rva23u64-hwprobe-v2-v2-0-21c5a544f1dc@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALaDAmoC/yXMPQ6DMAxA4asgz1hKzW+5StWBBAPuAMiBtBLi7
 qQwfsN7O3hWYQ9NsoNyEC/zFEFpAm5sp4FRumggQ6UpTI0aWsq2Msfxu+hsGQPhoyNTZU9nbc0
 Qy0W5l991fb1v+81+2K3/FRzHCXxjjPl3AAAA
X-Change-ID: 20260508-rva23u64-hwprobe-v2-1d20739cbb8e
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
 kvm-riscv@lists.infradead.org, Guodong Xu <guodong@riscstar.com>, 
 Charlie Jenkins <thecharlesjenkins@gmail.com>, 
 Jesse Taube <jesse@rivosinc.com>, Andy Chiu <andybnac@gmail.com>
X-Mailer: b4 0.15.1

This series builds on Andrew Jones's earlier RFC [1]. It lets
userspace check for RVA23U64 conformance in one call, instead of
walking hwprobe + prctl across every mandatory extension.

The series adds a small framework that resolves profile-class
bases (IMA and RVA23U64) from the kernel's ISA extension bitmap at
init time, and surfaces the result through both /proc/cpuinfo and
hwprobe. Later patches can add RVA23S64, and backward RVA22 / RVA20
detection, to riscv_set_isa_bases() without changes to the
surrounding code.

To detect RVA23U64 the kernel first has to recognise every extension
it mandates, so patches 4-6 bring Zicclsm; Ziccamoa, Ziccif,
Ziccrse, Za64rs; and B into the cpufeature parser. The framework
then reads the resulting bitmap, and the final patch exposes the
RVA23U64 bit through RISCV_HWPROBE_BASE_BEHAVIOR_RVA23U64.

Series outline:

  1-3. hwprobe.rst clean-ups: document EXT_ZICFISS, normalize
       indentation, and standardize extension capitalization.

   4.  Zicclsm: cpufeature parsing + hwprobe export.
   5.  Ziccamoa, Ziccif, Ziccrse, Za64rs: cpufeature parsing + hwprobe
       export, with cpufeature dependency validation for
       Ziccamoa->Zaamo and Za64rs->Zalrsc.
   6.  B (hwcap + hwprobe), as the Zba/Zbb/Zbs set.

   7.  riscv_have_user_pmlen(): arch-level accessor for user
       pointer-masking PMLEN support, used by RVA23U64 detection.

   8.  cpufeature: per-hart and host-wide isa_bases bitmaps,
       populated at init time. IMA and RVA23U64 detection lives
       here; /proc/cpuinfo and hwprobe both read from these bitmaps.

   9.  /proc/cpuinfo: print "isa bases" / "hart isa bases" lines
       sourced from the cached bitmaps.

  10.  hwprobe: expose RVA23U64 via
       RISCV_HWPROBE_BASE_BEHAVIOR_RVA23U64.

Tested on qemu booted with -cpu rva23s64,sv39=on,pmp=on:
  - /proc/cpuinfo reports "isa bases : rv64ima rva23u64" on both the
    aggregated and per-hart lines.
  - hwprobe RISCV_HWPROBE_KEY_BASE_BEHAVIOR returns
    BASE_BEHAVIOR_IMA | BASE_BEHAVIOR_RVA23U64.

Based on v7.2-rc2; happy to rebase onto another tree if needed.

Link: https://lore.kernel.org/linux-riscv/20260206002349.96740-1-andrew.jones@oss.qualcomm.com/ [1]

BR,
Guodong Xu

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
Andrew Jones (4):
      riscv: hwprobe.rst: Replace tabs with spaces
      riscv: Add Ziccamoa, Ziccif, Ziccrse, and Za64rs to cpufeature and hwprobe
      riscv: Add B to hwcap and hwprobe
      riscv: Add a getter for user PMLEN support

Charlie Jenkins (1):
      riscv: Standardize extension capitalization

Guodong Xu (4):
      riscv: hwprobe.rst: Document EXT_ZICFISS
      riscv: cpufeature: Introduce ISA bases bitmap and rva23u64 detection
      riscv: cpu: Output isa bases lines in cpuinfo
      riscv: hwprobe: Introduce rva23u64 base behavior

Jesse Taube (1):
      riscv: Add Zicclsm to cpufeature and hwprobe

 Documentation/arch/riscv/hwprobe.rst               |  46 +++++-
 arch/riscv/include/asm/cpufeature.h                |  14 ++
 arch/riscv/include/asm/hwcap.h                     |  23 +--
 arch/riscv/include/asm/processor.h                 |   4 +
 arch/riscv/include/asm/switch_to.h                 |   4 +-
 arch/riscv/include/uapi/asm/hwcap.h                |   1 +
 arch/riscv/include/uapi/asm/hwprobe.h              |   9 +-
 arch/riscv/kernel/cpu.c                            |  26 ++++
 arch/riscv/kernel/cpufeature.c                     | 154 ++++++++++++++++++---
 arch/riscv/kernel/process.c                        |  12 ++
 arch/riscv/kernel/sys_hwprobe.c                    |  33 +++--
 arch/riscv/kvm/isa.c                               |  16 +--
 arch/riscv/kvm/main.c                              |   2 +-
 arch/riscv/kvm/vcpu_fp.c                           |  20 +--
 arch/riscv/kvm/vcpu_onereg.c                       |   6 +-
 arch/riscv/kvm/vcpu_vector.c                       |  10 +-
 tools/testing/selftests/riscv/hwprobe/which-cpus.c |   2 +-
 17 files changed, 312 insertions(+), 70 deletions(-)
---
base-commit: 7fd2df204f342fc17d1a0bfcd474b24232fb0f32
change-id: 20260508-rva23u64-hwprobe-v2-1d20739cbb8e

Best regards,
--  
Guodong Xu <guodong@riscstar.com>

