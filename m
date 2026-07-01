Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA53A367F59
	for <linux-kselftest@vger.kernel.org>; Wed,  1 Jul 2026 02:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782871710; cv=none; b=QsA/t/BbDOqW8QONF+FeRABVm7kG/UpAImOW8D1hX7Ode1PqxOijDLXjCFYiNndLXgp+D5BfTu+fffCm94XUgGZC8uc33/EL8j4PKOfPGZAurPGHAQT9E4WouUDfRr6WAUByBfd7HahUxJTONxdJXb+crCTg6L3HqgpJdXew/Lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782871710; c=relaxed/simple;
	bh=8W95h9pioucOk6mrrNHL0UllepTkkotEJTZXjD/sveQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r4ZMa/Bm8CXT3MicHH6UAkkk8+1rdWS6sVhD9t2EX4vxw8NIkwCBEephCrUvViUtkfH2By9bYUiOdrGQg7w7D/UUbpzDuUWMhPHNpIjOQ9bmouFuZcX2Y00VESP8XNMXZjAFzN/54epx4vrSPSfhlcg++fpbc+XQDfAH7oRVFSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Czgex0fM; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Czgex0fM"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c9b373d5af0so47746a12.2
        for <linux-kselftest@vger.kernel.org>; Tue, 30 Jun 2026 19:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782871708; x=1783476508; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rpV1zK6+w2gomPz2kgJsMZZImbuU17m/e3kCCv0XAXs=;
        b=Czgex0fMMDOEe63je5QsPqiTlirekc244s5o1A7kCN5kdpMKziA1qS2KNdUAjMKpkJ
         2ZXhR1BMLcC/GBn2Ci7J56xPADKnvw1a41vrlyW95zg9QZQUzEUA7+VW0huPZjYeCh8M
         Zbc5x0Ui3iiR9dzVZ/sTlaX/w3JYspse90ZWxLHDAgmKFSW8RmP/yDhC8s7vtaE2/kOJ
         P64x8ZsOXZWIWVLplNtkwtI+UNL2sAB/v7tT8TZferM0Ysxo7hMOeyEw2dBqcRRa29eS
         rNaQcvHfuH3yHswvJyXic7YdFs12apG2RjpJvvYUvMq6UMvtg4fd87y3TkIc/MVvtb/T
         RfNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782871708; x=1783476508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rpV1zK6+w2gomPz2kgJsMZZImbuU17m/e3kCCv0XAXs=;
        b=i+KC/T6Qhj02+NxxsByhzO0lxHLvuiPt88n77tO2+cJdwLED8fqD2XodVmGs8EccgG
         1AuFTksISSXyYKCYUxLoi2tFdYFGYCNdOWpvBGAQp8c7OkrvoUFGWCcwSASXt8fLEUM+
         qVFG4m5+2CcBd9Gp0mGToJtd81ITvgkHiZAqjkj4c/UUtRgHIpemDiOhrbkSxFFTbP9a
         Qg16813/vlZLSx01puSUXtx7lBI3lcMCiPArAWMrJMs5Esfka9FIlAQI/CzRXrPIJarh
         H7qca56SkcopmJqogwnql5/G70RWxHBCy7WztTVMeujED7Zuf2vdpZbEw8OzD7VmjbrZ
         UjEg==
X-Forwarded-Encrypted: i=1; AHgh+Rr157E7QT0worki3uasjx/TLJhCD7ckrTMJnU8G/Jc4YJG7FTgjueI/QclCBPrpKnTnoA81p4krakCESk98648=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3K7QUqhyDMfDYBKG5e72AWoHPQU8NSZi8l45riLNNt9l/6+gt
	dXlp6fZmVyfHXXvnJqahYW2o5o1kqJUMhYJXT+0mJvGB4KghPordg7M1
X-Gm-Gg: AfdE7cmF7Rb2Qb25BXXw4HMfyAwEj9VFx516CujJs+GDqKIuVvgo6Xlibg91H0PGc6h
	PLOeUWyK/30ZOa3sNH1TPtqaBjC1Kj0NUZPhNHTanJgoN0cxhJ1+MTPrz01Lll/laYKZIbu6csK
	An+1XlUpAe8DSn0DFE9aIWyKVZeXVXf5+0dgEJYGcHRB17+RFUHS78xqYcabjnVSSQSlLLXDARY
	bORUTS/Jz0QwHbS65+Yn0YIa9Z1YXhA7hdx/CCWeHpPQFcDadqSgVpXruVWbqNYtegK+DXxMPaY
	Sywrf8fODwCcfkJAY22c2x+lVpM9rXUSsbWYz1d7vg5a9k5JeGO7T/jCEm+szS1lbKbZ3gn0gEW
	n9gBtfWxNfZgMpQsvTiQNRZIsM4H0zjKcTmitjxNolWokBZjeLbSKLMJXRgTaV8dRIfs502pACa
	YHlahmfOq1Fr8=
X-Received: by 2002:a05:6a00:988:b0:845:e44c:2e5 with SMTP id d2e1a72fcca58-847addb218amr2835089b3a.22.1782871708161;
        Tue, 30 Jun 2026 19:08:28 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02d41c0sm2957918b3a.33.2026.06.30.19.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 19:08:27 -0700 (PDT)
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
	Sergey Matyukevich <geomatsi@gmail.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Andy Chiu <andybnac@gmail.com>,
	Deepak Gupta <debug@rivosinc.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Quan Zhou <zhouquan@iscas.ac.cn>
Subject: [PATCH v4 5/8] RISC-V: KVM: Handle software-check exits for VCPU
Date: Wed,  1 Jul 2026 10:07:42 +0800
Message-ID: <20260701020746.170157-6-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260701020746.170157-1-inochiama@gmail.com>
References: <20260701020746.170157-1-inochiama@gmail.com>
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

