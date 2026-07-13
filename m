Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93FCC8CE
	for <linux-kselftest@vger.kernel.org>; Mon, 13 Jul 2026 01:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783904640; cv=none; b=QOj89RTBI2kMaL613mcYaqjRaCJh6jtNjXg0z4gU7oQCG4t6qAQFbuXAUsTJT5eynLsWKpRK9/Pf7vYR6kpf58yVM9q05x08KDG5NUv7ZYsYT2980CzIQWzxapxU/686QSqlrQOPHDoc3EmnqeGVzGQFWKFYu06e+j1lzLD0rcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783904640; c=relaxed/simple;
	bh=BtT0ls6YmM9d9nGGoTkQaPA0Kw5pw1Vw17vs5G6vw7o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VVlKRmsWFWJhFs/abDsLQDHLCaYgCK7w2Rgo5yDQJt4P05UvULln6eW/lrkX1PAPsvHEZODG6ZLCrUTfAjNjE2hyAgzS+B4dTcw8SBjBgGWe4119p3AeiTmcKIN94L+RT1TKnlHpsViIkYhpUjqUoTOU/zUcVofVLXJRv36xwgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UZ+SJFoC; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UZ+SJFoC"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8486ac3f347so2923980b3a.1
        for <linux-kselftest@vger.kernel.org>; Sun, 12 Jul 2026 18:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783904637; x=1784509437; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rwFDdkksbt790fLoy4tClBNp4x5JbRI/xOADu+E9kr0=;
        b=UZ+SJFoCP7d6Avl9rGmaPJ7E7wong/iaLX+vKvIUfaXE9Td28SM83f8Iq5IDPxmtMp
         JtF1nHbZvRoa/hnT70limYeT6TMTXpINmJcGJuMSv3X3ys31gORnZxydPCSiL3GI9wrR
         i3HuB19lFkbtt2zAtglWuR81VOmH8wgQsBV4ObkScZeYTgiygmVQ8HFTxGSI1lyzgzMx
         1VgsgNd0DCIy6VywpBCL/SB18mhH0xvL/yikqdhJRsyIHIfd9tOipEDk4xuro1WvYEH7
         lw+roRqe77HvCi25A5DxozP4tGYI4n2PgxnoGISXkMuLvOK9rnVc7sDS1ThEeMLYGkE0
         /ZbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783904637; x=1784509437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rwFDdkksbt790fLoy4tClBNp4x5JbRI/xOADu+E9kr0=;
        b=V7eNv+FhGa4u4igEH9nu3/hJuqL2eDAp869EioJ3VvIi8FeYxJM+0gbZWwWvqIIlwz
         joual2/jv9zjlKZro2pmfd9ZqUq/afVTw4YVFV2AIJ8VLxeDJXlCrZek/CB58em9Oz6Q
         y0nyDl8stGumRG95SyBZ0r3gKZumsgl8gvBySiMNPifLBrO5RAJh6r+j7IeHp+LEGIfp
         6hAJdaiaP3M14ch9XbdyngT+XELSucGflh6bHDwCyu5KgJZ6qXH0pUEQRWeafGiX/RBR
         ygGwkSseKTe3HGHsdlOW0HdfPrw+FpHfpSdtrL1bGqs/8oq9kcJPmnkm7rGLXkJfj+X6
         TroA==
X-Forwarded-Encrypted: i=1; AHgh+RoZ92AKAaTb8NIZ5qfNnp0b8w4VEb2nK4LdM+yIyH6tMVh7xNG+e5lnPSPHB5GqDqGdvPsJVYSLHGFCNfUNRaA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg9rvCmhxWOLcLwvWp9FlHskEYBQRb2glEemhv9dkxXZs1Nf/L
	kvl8c/wPaKgxKt8mPCdtlRRuTwaw6tiBoA13gil9Z4M+mGs8ptqj2Ayw
X-Gm-Gg: AfdE7cmDYOFG5z9BFNYnJxaqvm0+SYRQjgnlA+1j1WDy+ON0D6JlMx5d1K0OFeKnXt1
	k1WtnhqWrS/btBxPSmguPcUP2ET1HLTReMOtzTNEGzbmTxhift2hYkzarJW3D0sNjrC/VIokxcj
	hTQhy50qlcEaTfbliZLZj3pthSkLfL2KSozGlAeS1Ovdq96kfcoeAcaSTYjMlyAgWIOVubKHMFC
	AleZlHNE/RG7OTPKSM7nzZO+dlwOMm2B1vZCQq10A1tHP4CLnK0L8WrO4jyM7TDMFmpktERaytO
	ziWhy8CqJWmd4mYSuhIBi0bQ1TUfdX8thKpOEZR0w0PBd4dUGKoein/0s7iPMok14aGZDLCBIOj
	S5WNU5DV6FAtmIIoAWH/0fXprhDPMNJ+bdwnrfLo2yWq1Nyw8VpuiaAhtmZ6dZajYlUgudUQeC4
	HFjfv5EiGwh2U=
X-Received: by 2002:a05:6a20:431c:b0:3c0:9acb:3fd with SMTP id adf61e73a8af0-3c112e0b020mr6533016637.34.1783904637089;
        Sun, 12 Jul 2026 18:03:57 -0700 (PDT)
Received: from localhost ([121.250.214.124])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b3643cd6sm7790717a12.26.2026.07.12.18.03.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 18:03:56 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Andy Chiu <andybnac@gmail.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Deepak Gupta <debug@rivosinc.com>,
	Thomas Huth <thuth@redhat.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Sergey Matyukevich <geomatsi@gmail.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Quan Zhou <zhouquan@iscas.ac.cn>
Subject: [PATCH v6 3/8] RISC-V: KVM: Allow Zicfiss/Zicfilp extensions for Guest/VM
Date: Mon, 13 Jul 2026 09:02:56 +0800
Message-ID: <20260713010302.303278-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260713010302.303278-1-inochiama@gmail.com>
References: <20260713010302.303278-1-inochiama@gmail.com>
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
2.55.0

