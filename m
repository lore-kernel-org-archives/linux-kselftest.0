Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB4036E493
	for <linux-kselftest@vger.kernel.org>; Sun,  7 Jun 2026 08:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780819891; cv=none; b=a/dK85t6OerplMfVeYHyP8IiIwAgYUwyrKdt9zdnsve6Cqf+LZfd5p1wCeAuapHOZDXvkvqL3q6I82SEOJDZGT4tnB5t5C3REFuo3hVZvYmKurm2mSoAJ7BhnNBtImkltRc6ahZxZHQ4tem+S7i+2QmD1Qn3JHt2nzGLivJ/nn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780819891; c=relaxed/simple;
	bh=8fGKQM/8ZqCo43qm9SlIU3NFaWdy1/A+/assJKzlb5o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JGMDPrInlxk0SqzEIKBdHQ+5NabW2hb2IFSpEBnCysCwNl8U9hDtVfhhZojQyzLgRwFIxuzkE8lyOSNHHDJ3MsDHQ4Bcw+uXKyUYL2tnIdd1OW9mRiYuf6Gh/TqbyQjAJQ2fPH4D984pPkEk4k2BmDcp0Ym+TFeZfP+y1x4PlDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kd29fMNx; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kd29fMNx"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-36b900f350fso3105497a91.0
        for <linux-kselftest@vger.kernel.org>; Sun, 07 Jun 2026 01:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780819884; x=1781424684; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JXyTBTDSB4kJ/NqnyBvVuRSbwI4TemATINDoQruBQBs=;
        b=Kd29fMNxQNgGUdhoqY7aPL5jOAsGnQDTlDlT75BodjRZcK+lDSu9MBuF3gaDu5IJLG
         WP8Jlpdcexptp1/aMYAIbJjbOZDrm5Khup1fn7i8HD+EUODkX7Ga5yy8wPp5YDlkVmjF
         2FP2TMsSN7w0gyhBTTMZLVPs/B7xluCs5KU5L/n1r68z0bbbtlCC4L8oG0oc2EqXmxK3
         ezZ0wHVm7l2xikgpCmvQ35/naYwsAiTRKAkwUeRqWS5K8eb0CqoBko+Mom/uD4MjN9ua
         ifAIvjG78Uk8x97i74HqJmxrvjOVmgnh4TXXob4CVE6sZL/eOhkFYEhQF6seF3m10z96
         bJtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780819884; x=1781424684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JXyTBTDSB4kJ/NqnyBvVuRSbwI4TemATINDoQruBQBs=;
        b=TnkFJPnwCnvZ6iXcWLkEMlXnEZrjgTm3boZrIU9h9nwL+4lnr8P5/4St/ddxBwkHQ+
         VAj7bcDVqXrzpdIU65uBDkSuEBZn5gQkvJgITTbwqc32vo8ZCnaBjjYxwgWOPamb5/jS
         6JRVTMqusON7SK1Xy5QWWbmbleHsQpQEoMjesEUY0LVg9inlcyKLfLYGYLUQZza1WXJH
         AmCqTpy0kCBiC63YGvbELhG56Rr4ZrzsSuP+mpOhwIvUC5WlAI1xPctYOccXlS2p64xJ
         ZzcJyvF3MJDxNGM63jRrnqnnvvYH2Az1mJvtnJIpS35C9HvXmE5AuFAx/1ZmGbwaR4+X
         X5aA==
X-Forwarded-Encrypted: i=1; AFNElJ8NeolRuJphE72G+DeiBYffpAhISXJTBuvPdSm2pzg79Vxb8o7HpDqDMa9ymcM5htH5MOtbJEND3P1C/ZiCtwc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxfs4/XrGwEKbiwEXl2QhKP9aI0VnhlgnLBUPYZ40OU4YExEeOl
	SqB7k8/yIf80JAq2yE1m/Nw08hzwWaYwZXm0y1vh1osBPYB147CkaRR8
X-Gm-Gg: Acq92OH8nKD7v3SmNV5KvaVaABYX3a1Mr30iVdROKHPwoDIGg7iAcnEnoly5qM3uZqG
	ycbczNZ0UiVsDRhEPkqYNDkX7XiW+97rLUZyu+xFvj9HwnwJj+5iWegSTylu3+t4zq3JX8Is6UZ
	AC6nyJShSWY3/97dcDWldcmvXiua0ehn94NJvyjKAfaKg2D6BKafiPH/5XBC3dycNS6wXzglDoO
	oVKsxJmNgRmERIwywQLWYme4LwzTCONmypX07V4vylQ51sCYkQ62EomKJPhhucEkaE0AXUzyT9v
	y0+IGTXmsI0Fdq2ekyueWgKq22WebAoDr6PzXh8zG/gR9sixj2EQuqibmXPZ3b4jCT7qtcgNpje
	3eiJcFVPsXCcZu/dTzGU40KFpz51G39iPdYXiZW+Qm39nvrSpMUxiXXmnUiPIkFYY+4/84GOWlC
	lPsOy73mJQcTejqyq7BAVLE6/Bf7VknpI9cQ==
X-Received: by 2002:a17:90b:6c3:b0:36d:b9c5:e8f6 with SMTP id 98e67ed59e1d1-370f0481909mr12811244a91.19.1780819884574;
        Sun, 07 Jun 2026 01:11:24 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828821ddsm14362164b3a.35.2026.06.07.01.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 01:11:24 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Thomas Huth <thuth@redhat.com>,
	Deepak Gupta <debug@rivosinc.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Sergey Matyukevich <geomatsi@gmail.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Quan Zhou <zhouquan@iscas.ac.cn>
Subject: [PATCH v3 3/8] RISC-V: KVM: Allow Zicfiss/Zicfilp extensions for Guest/VM
Date: Sun,  7 Jun 2026 16:10:59 +0800
Message-ID: <20260607081105.993908-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260607081105.993908-1-inochiama@gmail.com>
References: <20260607081105.993908-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extend the KVM ISA extension array to allow KVM userspace to
detect and enable Zicfiss/Zicfilp extensions for Guest/VM.

Assisted-by: YuanSheng:claude-4.7-opus
Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/include/uapi/asm/kvm.h | 2 ++
 arch/riscv/kvm/isa.c              | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 7bbea8812d92..a27de850fa4c 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -199,6 +199,8 @@ enum KVM_RISCV_ISA_EXT_ID {
 	KVM_RISCV_ISA_EXT_ZCLSD,
 	KVM_RISCV_ISA_EXT_ZILSD,
 	KVM_RISCV_ISA_EXT_ZALASR,
+	KVM_RISCV_ISA_EXT_ZICFILP,
+	KVM_RISCV_ISA_EXT_ZICFISS,
 	KVM_RISCV_ISA_EXT_MAX,
 };
 
diff --git a/arch/riscv/kvm/isa.c b/arch/riscv/kvm/isa.c
index 1132d909cc25..9852a91fdecc 100644
--- a/arch/riscv/kvm/isa.c
+++ b/arch/riscv/kvm/isa.c
@@ -65,6 +65,8 @@ static const unsigned long kvm_isa_ext_arr[] = {
 	KVM_ISA_EXT_ARR(ZICBOP),
 	KVM_ISA_EXT_ARR(ZICBOZ),
 	KVM_ISA_EXT_ARR(ZICCRSE),
+	KVM_ISA_EXT_ARR(ZICFILP),
+	KVM_ISA_EXT_ARR(ZICFISS),
 	KVM_ISA_EXT_ARR(ZICNTR),
 	KVM_ISA_EXT_ARR(ZICOND),
 	KVM_ISA_EXT_ARR(ZICSR),
-- 
2.54.0

