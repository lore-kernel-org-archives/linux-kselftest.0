Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C30A38AC72
	for <linux-kselftest@vger.kernel.org>; Mon,  1 Jun 2026 08:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780303450; cv=none; b=OYWuxxM9hOBM8fm/OOclPi5RMsnxt/bni8tWqaDLLFSB3/gHkNy+OxHvPk9t4TQ/JP+C2xuBCYJ3MP+Dai4/qOhQTCJWMqztHylK9oy9hZ9XpkWL4nNlY7ZipgScq+UOjJSn/iW1vrNemTMJO4Jus8zVbEHSh0tAZV5u5LNUv2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780303450; c=relaxed/simple;
	bh=OTV4YLKyi5/pvTHkFBjt0E6xg4+vUA3MN6cMYdsyzSc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S7EKOv6413wpGm8L3PlnhjzFE4dAwhtEH50eu4IjSzhovQPtZGAyP348ODmKlsSGgDTVwkLRn1MdK2VmFvP9VIG6uNow85DqpsbRQbc+SVXZYH27XjjqWaC3r5nMjO5DEbaUt5HASC09jwpacJg5I6lQg9UhQgm1YuS20Bd1lmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Curd/gtg; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Curd/gtg"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8422f148dfcso570921b3a.3
        for <linux-kselftest@vger.kernel.org>; Mon, 01 Jun 2026 01:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780303445; x=1780908245; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RiMpL3okPlrr37XPCPDIwMU1jHFLDEyhgttQYYvX9pI=;
        b=Curd/gtgQeFH/Ad/pTi+OIDpgOw5VQghLAWpTwE4bd5BYD7AURZ3p/C2AGpQ4RYoO+
         +RCs4yHkgPByodzFmMJHlKZ6j2OyKk2Liwezl/H4P1EYL3M3qt7LTW5EzaNItAJQaBTN
         oiuSnvrRQqTfPILmZG545x6JlKgjnfJlz3zZmrBcfAGwG5Op/Cr8Cy0IdD+UZdXvaM5B
         lCYyUBC+0TZwXQ0v0JYnAVxo22aOw9LkWmzdBpZDoeKwKsgYQNOJjAkt7jLydD4b/vvt
         isHkKpZWFHNfSBrk+SlKwsyrldD5Fsh49PkPxoMc1UzOwZzCB9wEfUT+Umv0CmcdZ6cV
         MCgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780303445; x=1780908245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RiMpL3okPlrr37XPCPDIwMU1jHFLDEyhgttQYYvX9pI=;
        b=pTJkKb9DpHnLNhfdCsBjHQ1EUM0POuE/Bf+/i9l8OnLQVyQ0pTUrOSpBebnXHxbaoa
         QyCwE3Y8lbO7YrN3BrEoNxKAWcqB2BoevlUUbFo06tMI55MJg7YerovHvUzHhiNT9x7N
         FHVXZDCOrkRpKCB7Xme9Fk7dismi6TjEuBzWDwcVN9Y97wo9qocGHHom+ScSgnLsdMJV
         9RdIq1XfC9/GIlFHzmLNRHt+gYfxSwjNAARbAQrXL/UfJAviHaZYnCbM0nbDO8GL++TQ
         w1VP96+KXTATkxTRUQFOGuFdZmP09ku7w31rGBO5BHeSsWLaIXI3KLXW8pXyBvc8Xg+4
         xFTA==
X-Forwarded-Encrypted: i=1; AFNElJ+80nZijQJRU43wcYRrMU6kbo5NZ+ENjEKQlTLHXeS+k0htawvbQjx5YP1s3nufOES3sljqNHM8F0yezapKRFA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3zTtpmuugE48kI7jtP7LdeuvEZwY48+p5jxfAj1jBf4K+8106
	wCJGBb49iT1tlbVPCBeyUf8RhOAqMXBxbmS3GJLaDzzQ9DX+qajKGTyZ
X-Gm-Gg: Acq92OHq3i2dtij+AT7tpzUX/EMOkOutxTyF2OQZOmf5B64FBdcWzG8kXSQold03e3j
	lRme0fJsTCt4aHTpk/lm6OgrEW0JToV6E2GsYGWmXZ30GVGSKEBv7FPihVv4kSv0aMOq9+4m6ig
	f/aSxDBTzO3NDMsupVHLMIXWJPHcozsdOuNzfV5QQr6IjEdpl96EHyNhVtcyAcqaeuZ9Z5FVUlW
	QCPGpCOA4BrbvEsYlmvY+y/lleDS1M/g915P3hAreXBMpSP6tDTgP55mqCAJOQRbbWPyh6ynOPo
	4yE+sdZymIgexPJ7M+KHJnjN1wzEEmJTfI7KoKpCujDht3WKzKFnA1CIVWh+tfSJI69aWe0zlor
	OVMzU+utZsEmIaD2JJ396q+tjxXE7XdYtahLDCdPhbOKRWgrjl5uMfyeF7fBZ7GIcKC09J3Vv0x
	sPVIVX8WyBPH/gy/TiAZpO63NWKC313ATLPQ==
X-Received: by 2002:a05:6a00:3982:b0:822:6830:5900 with SMTP id d2e1a72fcca58-84225320cd2mr9410764b3a.6.1780303445292;
        Mon, 01 Jun 2026 01:44:05 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84214affe1dsm9556085b3a.1.2026.06.01.01.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 01:44:04 -0700 (PDT)
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
Subject: [PATCH v2 3/7] RISC-V: KVM: Only enable Svadu extension when Guest/VM requests
Date: Mon,  1 Jun 2026 16:43:31 +0800
Message-ID: <20260601084336.2601675-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260601084336.2601675-1-inochiama@gmail.com>
References: <20260601084336.2601675-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since the Svadu extension can be controlled by the FWFT, there is
no need to enable Svadu at startup. Only enable it when it is
requested.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/kvm/vcpu_config.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_config.c b/arch/riscv/kvm/vcpu_config.c
index 238418fed2b9..b2a1028106d5 100644
--- a/arch/riscv/kvm/vcpu_config.c
+++ b/arch/riscv/kvm/vcpu_config.c
@@ -53,10 +53,6 @@ void kvm_riscv_vcpu_config_ran_once(struct kvm_vcpu *vcpu)
 	if (riscv_isa_extension_available(isa, ZICBOZ))
 		cfg->henvcfg |= ENVCFG_CBZE;
 
-	if (riscv_isa_extension_available(isa, SVADU) &&
-	    !riscv_isa_extension_available(isa, SVADE))
-		cfg->henvcfg |= ENVCFG_ADUE;
-
 	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SMSTATEEN)) {
 		cfg->hstateen0 |= SMSTATEEN0_HSENVCFG;
 		if (riscv_isa_extension_available(isa, SSAIA))
-- 
2.54.0

