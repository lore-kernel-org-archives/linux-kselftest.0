Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D8537D114
	for <linux-kselftest@vger.kernel.org>; Mon,  6 Jul 2026 02:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783304506; cv=none; b=ThGAI6bHOZYSD4eSV5o6CY909BZDfQSDDIOpCE47Vpiv8IVSbl+Ysk1hsCwQzhiSX+Q3FhHpUnB25pVubz0fsIjnX2fc48684qn8eWlCRmqGziJcJsx7H+rX0Xruns2Ml2CVLAg0uxqwm9hp+vvbFoI2C4ejWQ9xuSstsPFT/zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783304506; c=relaxed/simple;
	bh=8W95h9pioucOk6mrrNHL0UllepTkkotEJTZXjD/sveQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gsEEIciU0XfvVg1yxd1WpzlIalGCzxuWC3+qfXahFr9QBH0IXf06lm7k+p/LEPmirSa38St94MWle5Wv94D7M36ikBkXhrtD2VPAdEjT6AdMXZNEsualcCNWisBmm2WSooHAUwMH2xn9GiA0kDSTAm1inuDOHRCl4ZyWB7ask1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TuDXpZIE; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TuDXpZIE"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2cca24023edso4618745ad.1
        for <linux-kselftest@vger.kernel.org>; Sun, 05 Jul 2026 19:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783304504; x=1783909304; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rpV1zK6+w2gomPz2kgJsMZZImbuU17m/e3kCCv0XAXs=;
        b=TuDXpZIE4zi9iKDad2qiVplxc0TlFAS5/7O/x59SDFX9O2yEQijgJNbDv1UfFwewUe
         5/tN+k+c4xP4pvp7xayMdRyqXDXYPwcPHbJg2SPt/WSU4C5qZ21P+dANfPXxeHlUnU+K
         8WkI+XP4l81NB4zjBmzbB92IyZUP4p+vvHUBVMAJqsVvxemOiT4rhsUJY/ex0Bw5LMYM
         1GYhbITnI1hKNtxWglovMdVBQ3FUP3I/ktkREwcv/fifb2piSM3OGoMHl/cAst72t/nS
         OFyogG4tanM/A4wh4f5mt/9AFdKu15e0RydBR8Cr+YwHzhswheZX0ntfOs0uVEhz29qM
         OGhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783304504; x=1783909304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rpV1zK6+w2gomPz2kgJsMZZImbuU17m/e3kCCv0XAXs=;
        b=FEyDRTnC/zJGM/QI+NQSZsE8Hqhql00hbSQn/K1qZer8bpBEtBW+D2mDB4KPex+KBW
         NDqFIJPJa6VZNckhp4PCKjCLq8/LI2/m2FsnWbWDGu/5lQV0y+YfeKTjryC7DMq8sUdn
         DL+FiWK6hmBPRlaOvChVAJ0A/b8Z+lbCPsnt5pE9r+gn6mZt7aR5ILf1VyfQ0H98oNH1
         d7Jje3Tz7WyfOm5BCQnNQMRxPqTdQhZEUUoLUJFCJYlNHc6c9SctfxWTerIFKuk+SJSY
         QSwISF7uslonvCDatnbnsw1Ak2ACsfnARhjf7r+GdZEh9Y6Z3pNS1L9bD55KXehgeDBc
         dacw==
X-Forwarded-Encrypted: i=1; AHgh+Rpwq9fm0MUqmx3L8Ip9f2gw4CrtaRqd9DlCHzN113ULdvIOSGX4YR9PWneHn2Utg5q/iSfZqPBmcqDLwzJJek0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfLC+3zFooQh88d8QmewpIMOHbuJ/IqKTWqJAMTgvdt4x5PITl
	07Xpj9nwf8hIzGqo9US42rAVnaYbOYC9lQcsXJSfJLSXusrIcLYJyNg8
X-Gm-Gg: AfdE7cmbJyBqU4gQr8ufVM0uEk2i+omSkCRkgI1mqcobu5jsc75A1PY2vvlZ5jLl/ES
	3qAia1jyXkxZ3evxM813+hCuX6WVqpCkjKNu/DoWViQkw2grV7uSDP8p1nxDQ007ygc2KNj/XPS
	C93E9XKkPc6asz6CxNtOMhTrFa0cXJ1awPZzo2CGEC5pltQN5VTzr0uJP7xYoXLkuGkeviF8E/d
	HTbnr5cZCf+y62gkkJrPSGAXLTtH8W/f0YPQNysskgMoRJsMjysrfssxFK3dNBujED+bg453Vam
	eHj7CzBxOCk4mOmSa8wLRcyy9aUAAaXCaYAZirohG5zPItSWvgwS0ceEsi3gxSnmxCzFbpYB6kk
	CJ3BseanmH86FJbDFboc5LNUzRCkhuTZ89JojwtwwbHL0hygaXA2cVVKd0rRgQ/79
X-Received: by 2002:a17:903:2341:b0:2cc:864b:539 with SMTP id d9443c01a7336-2cc864b08c2mr41134205ad.6.1783304504462;
        Sun, 05 Jul 2026 19:21:44 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad776516dsm39837995ad.52.2026.07.05.19.21.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 19:21:44 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Sergey Matyukevich <geomatsi@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Deepak Gupta <debug@rivosinc.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Quan Zhou <zhouquan@iscas.ac.cn>
Subject: [PATCH v5 5/8] RISC-V: KVM: Handle software-check exits for VCPU
Date: Mon,  6 Jul 2026 10:20:41 +0800
Message-ID: <20260706022046.214956-6-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260706022046.214956-1-inochiama@gmail.com>
References: <20260706022046.214956-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The extension Zicfiss/Zicfilp introduces a software-check exception
to the privilege architecture. Delegate this exception to VS mode
when vCPU enable Zicfiss/Zicfilp so the CFI violations in VU/VS could
be reported.

Assisted-by: YuanSheng:claude-4.7-opus
Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/include/asm/csr.h | 1 +
 arch/riscv/kvm/vcpu_exit.c   | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 31b8988f4488..224af9facf1f 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -117,6 +117,7 @@
 #define EXC_INST_PAGE_FAULT	12
 #define EXC_LOAD_PAGE_FAULT	13
 #define EXC_STORE_PAGE_FAULT	15
+#define EXC_SOFTWARE_CHECK		18
 #define EXC_INST_GUEST_PAGE_FAULT	20
 #define EXC_LOAD_GUEST_PAGE_FAULT	21
 #define EXC_VIRTUAL_INST_FAULT		22
diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
index 0bb0c51e3c89..12eebeabdf14 100644
--- a/arch/riscv/kvm/vcpu_exit.c
+++ b/arch/riscv/kvm/vcpu_exit.c
@@ -243,6 +243,10 @@ int kvm_riscv_vcpu_exit(struct kvm_vcpu *vcpu, struct kvm_run *run,
 		run->exit_reason = KVM_EXIT_DEBUG;
 		ret = 0;
 		break;
+	case EXC_SOFTWARE_CHECK:
+		if (vcpu->arch.cfg.henvcfg & (ENVCFG_LPE | ENVCFG_SSE))
+			ret = vcpu_redirect(vcpu, trap);
+		break;
 	default:
 		break;
 	}
-- 
2.55.0

