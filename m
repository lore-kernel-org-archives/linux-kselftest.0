Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45548358368
	for <linux-kselftest@vger.kernel.org>; Mon,  1 Jun 2026 08:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780303437; cv=none; b=lVfufK4NiChIq1AuzJDyNXunHWA/BnWiPwyEvaqLTlb9B+27h5v8zJ//lbM4ZEGBTiqhNp5/jMdxmRzQIqIvSLZsr5LLxQdJYnfoUJmg/+C+7HGD44APFntZQMrMjv6eNfDAkJlpdmtVn86MPC7edo/U+ZU1tpDTnfqQihKQ+MU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780303437; c=relaxed/simple;
	bh=TPYXcb7NTPeTtSBE0jbJJ3YqX1brvRp+y6VAFNMl9U8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bx+kQtCBR6J/EHBlNueSLOiTxMG964SKamPJutWA65NHKMJGgdLc6j4wg2AGqbQYToH7mzNmJDNaPP+6gEEe2QqjIQZW9wee14aP4zw2iRSA6u1XkAOIIypDtdm9j3UX+wrOdNvgi+KMS44/SyAyobGh01lV+GqA4x1lHmD5YoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gz52vw4E; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gz52vw4E"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8423f626a65so349490b3a.2
        for <linux-kselftest@vger.kernel.org>; Mon, 01 Jun 2026 01:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780303435; x=1780908235; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bMOIBVqvBN09I3lKcw/r64Gz2Mu49nZfhySphfExOPY=;
        b=gz52vw4Et1TODApcj6xibkKpThz1OeokL5r6FOtEUg8NN0cNlwfzvi7DD558Vpc3rM
         RORYyx+5/7oxczcEPVkbxJyWIL2Asp9EWVvlOK4JpC8yJTTDy6gNQgKV62sOBbmplM1G
         OKwTsbg52YZt0STCLKmnMlbX9AutguDzw7Y/pF9in7z5exJxA9N8PlTZ/w9tUGmugIYM
         0IH/EjZDvc2L2Q0CM/iQNOllPQaq3mOTA5VBJ085Jl8jQTEEjA++h75CZagnG382cqkl
         BnpybAOU85BYm6ljI1d0j1oxOeXSOjsfO1W7LWI1vCl946rtXEyuhPdGfV6QLs0djAmj
         JU9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780303435; x=1780908235;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bMOIBVqvBN09I3lKcw/r64Gz2Mu49nZfhySphfExOPY=;
        b=dp9G4Mu3SwukUE+THYG7XqMbFBHADcaSYvlh31nqrATyjH9LhFaQE1xIORBOe+oq7h
         3k/qSK63v3opohobEG7NIYjtG4JOiVdshEqArUO9DB5++7LC5AIv3Abyl2M74u1keF6+
         LbmIcdwXpGoMXoXir+q9riXnkYPrRmq5X5CO3GvXf7AXzIJl9gCrLmv6bS843jg6lrV2
         VL4+UPNPhRASaMLsLQTQpsUwnzZd5+HQV9msB2OcB71wQSvKM8yOZ8SpMt+nTrR/VLP3
         9XcOUctLyRpx7IXPJ+RiwxGLOTg9VGDw4mmzeeLNdtaCh+aC5iV4HV2wEUisatY6iUFb
         xY/Q==
X-Forwarded-Encrypted: i=1; AFNElJ9f9302G0g8UcvSPX1dtHNDmx4VwqKKzOYis3x7eXVMgS2s48AhvrTsjnJcHV/uqM4ZHJ4aHBUrcZ1ieZvbbX4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbPht04r/wYDs54GMwlXRGi/KCf515DEojHHW//qq7GwW16oWg
	VfCXv+z9xr6kyUuTkdqUtJj7Ge3GkdKly2uNKR3Nb5SrXPZklEL27uji
X-Gm-Gg: Acq92OHvxw3wMGC+h83l8EmXyRqUAfzP2YJ0b+rrK+CBwT73SNzbS5u3n58ckNgtqWx
	AR8C4WJHTEP3QISbM5NF76drEu/7UBIbydKj6np25ohakZnB/22jLpsyGnBVsGum38jufqnOLIe
	oVIHeS+MOGTyJhMJe+EBS7xghayR+WAt49RxuFS82ngmDq5GeGp97bjA12Tq0CU08c6zuTPa4bp
	UAzDOb3MpVKzDRgjjO/PJxpSRvdhodZBcCVXiw8i9/FtLiwMvQI9DxFYb/DQnmlZMjlnGRsyeWv
	VTM/uUDb4dL0taPKkn+2kwcw8KVVG0x3x+uXMXa5M+rMMUl8WbO99XEknJRFVT29VV8lgyBFJRQ
	UvhQoNpf0AqfIWqGvqM2us5l8+Ezt9UVXK8yljrmrcRJbgjbOJNa5/oi/ZUxGRS2Iul7sg141PX
	XsjqwsCCpMuMtg5SG9rq2kE0ATSliLnEIWpA==
X-Received: by 2002:a05:6a00:b50:b0:842:3aee:12c0 with SMTP id d2e1a72fcca58-8423aee3251mr6260126b3a.23.1780303435411;
        Mon, 01 Jun 2026 01:43:55 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8423828159esm5376710b3a.35.2026.06.01.01.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 01:43:54 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Deepak Gupta <debug@rivosinc.com>,
	Thomas Huth <thuth@redhat.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Sergey Matyukevich <geomatsi@gmail.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 0/7] RISC-V: KVM: Add Svadu/Zicfiss/Zicfilp FWFT support
Date: Mon,  1 Jun 2026 16:43:28 +0800
Message-ID: <20260601084336.2601675-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset based on the patchset "RISC-V: KVM: Add Zicfiss/Zicfilp
support".

The patch includes all the function of original patchset from Quan:
adding the Svadu/Zicfiss/Zicfilp FWFT for the RISC-V KVM. And this
patchset already passes the KVM unit test.

Changed from Quan's v1:
- https://lore.kernel.org/kvm/cover.1764509485.git.zhouquan@iscas.ac.cn/
1. rebase to the latest master.
2. Split Svadu change as separate patch
3. Fix all build error from the original series
4. Remove the Svadu check in kvm_riscv_vcpu_config_ran_once() and in
   favor of the FWFT.
5. Remove the LPE/SSE setting bit in kvm_riscv_vcpu_config_ran_once()
   (kvm_riscv_vcpu_setup_config() in original patchset)

Inochi Amaoto (7):
  RISC-V: KVM: Add support for Svadu FWFT features
  KVM: riscv: selftests: add Svadu FWFT extension to get-reg-list test
  RISC-V: KVM: Only enable Svadu extension when Guest/VM requests
  RISC-V: KVM: Allow Zicfiss/Zicfilp extensions for Guest/VM
  RISC-V: KVM: Handle software-check exits for VCPU
  RISC-V: KVM: Add support for control-flow integrity FWFT features
  KVM: riscv: selftests: add Zicfiss/Zicfilp extension to get-reg-list
    test

 arch/riscv/include/asm/csr.h                  |   1 +
 arch/riscv/include/uapi/asm/kvm.h             |   5 +
 arch/riscv/kvm/isa.c                          |   2 +
 arch/riscv/kvm/vcpu_config.c                  |   8 +-
 arch/riscv/kvm/vcpu_exit.c                    |   3 +
 arch/riscv/kvm/vcpu_sbi_fwft.c                | 142 ++++++++++++++++++
 .../selftests/kvm/riscv/get-reg-list.c        |  22 +++
 7 files changed, 179 insertions(+), 4 deletions(-)

--
2.54.0

