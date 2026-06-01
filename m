Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A52F38D3E2
	for <linux-kselftest@vger.kernel.org>; Mon,  1 Jun 2026 08:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780303456; cv=none; b=rUwxMwGmHlIeUAY4AGu9f0lLPNBk7sQgwusuVUE9UcHp147W+LdgF4o83qDfFlAQNaRNParIQM7N+1DLCsVRWfS9YrDcj1+hjeYeMwYk1j6vVGSNBpv1ZC5ZjWTuOrZQvs/XmN3odbNM14a1mvt2H2IM1+JMZx+BfbfdUKmKSqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780303456; c=relaxed/simple;
	bh=CATGD4oGrzQh1/EsHsvVFO8RwSsQAdGWsawSj+YcGoI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h8QgKkJxQinfSXo9W7hsQe0Pkmz26h30CKbcuHP0yVHQmflN28K9Csi9QMEqXaqNb2mhEgbLb52SjNiE0TlmTIpQaLVRoOSdBoDbx6fGuKmnx0G2KHXBK2QQ7zAiTvmubM9Xe20KGtF3bKl5Wt9nHX2CV8wZo1Ost1JRruUf7DI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fgvdr/qd; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fgvdr/qd"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2bf30d530bdso24807605ad.3
        for <linux-kselftest@vger.kernel.org>; Mon, 01 Jun 2026 01:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780303452; x=1780908252; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6RmuO/Bh/pyYNP3lYnfVLduBl3NGvkZrBTGIwUHKLT0=;
        b=Fgvdr/qduOaN2q0nr7nHzDMUatg7H3zZrCitT7tDVsVs7ktgDgakNxrrCSaTstJhmD
         4yfdVtJXoM2ow8G6tvFpXXOo4rM3q9NgwnZ/7minPSSWOrD3CpWK4HaXnY4uV5RwLS1V
         Ck0mpH5XpdkqA9LoybifKm8q3GwLT36mwZq9ZzE6OZ4iuiYkaXj8F4PYrbPIblhiSIP4
         ql5Tg9GxpA6XGJrJrm7Yug50sCMQhsv4NNlAfFR6nAg4hXbfpPSAub/L6PZpBLEeV97V
         IXKAblVsqQZgsnt02ZM8FdXhuDMV3TWe21Uvovp6rvsuFaksGJ5RKpG2s04azMeVz9+N
         zhaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780303452; x=1780908252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6RmuO/Bh/pyYNP3lYnfVLduBl3NGvkZrBTGIwUHKLT0=;
        b=HCND371Yi+GxcsjQuHneZw1psavWRogrxIl+yL60A1gpLCblzX8QBkNQC8ZYn0Hc4H
         qS9QJ5kP8700gwwWdrJ8bBKrEAs9qD3v2LjVLzcoEAHcDE7Uj0UPzUt/wPPcAL3xYyev
         L44ynEUiJ3K6U940RVOA4Qnrf1iSYKuEu8Z/BP6rVOOB+M3J7InSXH9BZLyRvk21oDeQ
         xca61PzM2xvyIEj4Opb2IpoTIz4UjyaBA4U9g0zPLdeLG4/OkHGyets1qz1TbC5Tl7tP
         VCDN0OF8UDy7EKa9+jTlYs8+gmqB1wvFZu1js0cWit3zR33tY3gNpECpiJ9/UeV0fCN2
         UwPQ==
X-Forwarded-Encrypted: i=1; AFNElJ9ofcgaRZwsml4rTNmuA18RHTYuH1t39DkDEgc+EhxHc0nu+HuZG6KX+gQQg2akifDxTTcxj/pmIDk8XS9ugrc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyvad4+GkWD53STtJpRYgUC2QcUIbbXMUaQIQcqAnxR40ebTtwL
	5mrCeM0TtP6D7X2YBsW2eLlWwvnzGtUy2Qh2UCsnrtFUSt8nnUfkawjhcX/NqLt/
X-Gm-Gg: Acq92OGUUyBHKL+pkBU/CWXATVFCRwWCpruDDwsmineopx9ES68fsCVVVPomdqbN2Tx
	4whk1Az6IsVlNmuvS+CTXcr8LxL4Ai+UzX36IlH+nAAJ7eau6qdofv9ZmlJZebeqXs1kOjyMOzX
	uXnOg8G2CU01tAT5zESPyTGyQftWk6mnz7EoIy+Id6JnMqPe+oUHMGjqd5ZNKg/ICfFT+ofcZPF
	3AkgItTVg/1pBbZ/58YP+uYyngbi5lOlo4+X5GJsbMVC7hymuLQDguo63dJwWhBNlQLyL6EaMT1
	uPWt2C4zfhL4eKek/1VW5+WRFtzNwNbuTfVisx/zNwaAdFHsrHguVU3xQgt76hWI1KSwuZfq5Dh
	jjepWo0yYFhidrBHPsEf3THt51DTYcFIoxBL/6gkVWnR+j7l4XAChyYkA69AXNIuZLkL+IgsRNi
	/YCCd3q8heyJFcEDXff89QezpULjGa0Pdyu7OhlAhUlT92
X-Received: by 2002:a17:903:41ce:b0:2c0:bcff:e198 with SMTP id d9443c01a7336-2c0bcffe31cmr77989875ad.41.1780303451867;
        Mon, 01 Jun 2026 01:44:11 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239fd8dbsm101815365ad.21.2026.06.01.01.44.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 01:44:11 -0700 (PDT)
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
	Longbin Li <looong.bin@gmail.com>,
	Quan Zhou <zhouquan@iscas.ac.cn>
Subject: [PATCH v2 5/7] RISC-V: KVM: Handle software-check exits for VCPU
Date: Mon,  1 Jun 2026 16:43:33 +0800
Message-ID: <20260601084336.2601675-6-inochiama@gmail.com>
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

The extension Zicfiss/Zicfilp introduces a software-check exception
to the privilege architecture. Delegate this exception to VS mode so
the CFI violations in VU/VS could be reported.

Assisted-by: YuanSheng:claude-4.7-opus
Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/include/asm/csr.h | 1 +
 arch/riscv/kvm/vcpu_config.c | 4 ++++
 arch/riscv/kvm/vcpu_exit.c   | 3 +++
 3 files changed, 8 insertions(+)

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
diff --git a/arch/riscv/kvm/vcpu_config.c b/arch/riscv/kvm/vcpu_config.c
index b2a1028106d5..dbe4167ac4f1 100644
--- a/arch/riscv/kvm/vcpu_config.c
+++ b/arch/riscv/kvm/vcpu_config.c
@@ -65,6 +65,10 @@ void kvm_riscv_vcpu_config_ran_once(struct kvm_vcpu *vcpu)
 
 	if (vcpu->guest_debug)
 		cfg->hedeleg &= ~BIT(EXC_BREAKPOINT);
+
+	if (riscv_isa_extension_available(isa, ZICFILP) ||
+	    riscv_isa_extension_available(isa, ZICFISS))
+		cfg->hedeleg |= BIT(EXC_SOFTWARE_CHECK);
 }
 
 void kvm_riscv_vcpu_config_load(struct kvm_vcpu *vcpu)
diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
index 0bb0c51e3c89..5ab8e87ed248 100644
--- a/arch/riscv/kvm/vcpu_exit.c
+++ b/arch/riscv/kvm/vcpu_exit.c
@@ -243,6 +243,9 @@ int kvm_riscv_vcpu_exit(struct kvm_vcpu *vcpu, struct kvm_run *run,
 		run->exit_reason = KVM_EXIT_DEBUG;
 		ret = 0;
 		break;
+	case EXC_SOFTWARE_CHECK:
+		ret = vcpu_redirect(vcpu, trap);
+		break;
 	default:
 		break;
 	}
-- 
2.54.0

