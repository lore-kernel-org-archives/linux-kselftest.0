Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37AF82192FA
	for <linux-kselftest@vger.kernel.org>; Mon, 13 Jul 2026 01:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783904646; cv=none; b=cBiSFmWhH7WofPpO6Znhva8BVy51pnvSc8uVpjYHeEN0hSZMuNQ/kUOPI8zFUBSRKWRcY9aLnyUd+b2xoGiDWa+ZsxXGkYudtCC7M7s9uqPvDy1HuIXBTgqLT5kvT8xGLzKnPnvhch2vNLAvR0pF51hhUmNK0Pi35XzCtzbgg98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783904646; c=relaxed/simple;
	bh=8W95h9pioucOk6mrrNHL0UllepTkkotEJTZXjD/sveQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UQfWz+FTS9WiGVNMVBk7bEqnrqiD+CGMnXDvF28n356gKpFvAV0fW7qDDyBbLGsGz84kyjpGAHGIt/s5sLpxDVLs4ia2cYypEWlltZnHHLQDxSUtqAFv2uZgsk1dF6gBFQllaEgxAnG/0iwXi+Fjh2w2s+ocpDNxFO3S8fGtbU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kD5I4P3r; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kD5I4P3r"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ceaf8a1265so11266445ad.2
        for <linux-kselftest@vger.kernel.org>; Sun, 12 Jul 2026 18:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783904642; x=1784509442; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rpV1zK6+w2gomPz2kgJsMZZImbuU17m/e3kCCv0XAXs=;
        b=kD5I4P3rh4PO2aZvQoKIa3PHRjDzWCA0wAJpLokbdZjmWpB8V3gOmYV17tNeMq2bpL
         mLxQSRArAKNeWPxygg4AvotBdRAM5iNwvpjho0krWmwc8oJHl46LbzzcYvspVS/hK8vf
         YaPbnvoU1iBCyc3XuZO/Z+MkZxj4QSYeo8H4k4RSU0urpvfF89EcbSCT8RA+uxn0J6JN
         ZmxX7zQgn/pH2787W1JqbRHdofeFrxvvIyK1amc8OMqCe2Hl4j2QD0ockYhYosXKGf9P
         1ZBiEO0De/evJdxNtL1p2TfGQQXFbcQ0H5ZrTqj7Diy1xSMis4EhAVdnp34R2FH3XDS+
         2xjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783904642; x=1784509442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rpV1zK6+w2gomPz2kgJsMZZImbuU17m/e3kCCv0XAXs=;
        b=Z+Q8oOLjuDi7D0KgVzpOs/G0iJQGzuclf5z0QN7viDb3MPsrt0Y52XAEktq1cudaAy
         gJig/CS/COjq+3JN0FH/axAjP90O/nf6NHWxXB7VxU9xRE5HM+TpxrKTzOIgyp4U8z1i
         CPQI6hzKxb0NaEeoSNma7CB5dz/sr8b5ttlMgtmjbHLGd/fv8JarAzO8jO8gP0roUwgW
         NTHGCROBa7sCW4vcampasHG8WVYsOTJhvCNLWeDhc8+M4ahq8TiUx4uUa3ZU+soep4q1
         VBMUxgSCXvB5Zb4MGn7wK5yo9g1peCXhhiha51vl7VJHQaKLBdNkMbRaP4JZLgAgl78e
         iXpw==
X-Forwarded-Encrypted: i=1; AHgh+RqfDrpQCVBSHs2Xa47QpmnQ6U1PN29ifbPlQFs2RDpCeIjIKySDMj3Eh1jNLd8wxge0J3+ynDGAew5doP4M17o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnabjHNnjCjfR6In9UfhM0+fBzqHXFalPBlMAzGE60nup/lZ9C
	o0mUl6wjJk9fzoltx79EzH03l0I3naUqLPSiA5G+UsDNcp2NqPU2Mk3e
X-Gm-Gg: AfdE7ck9l1KQrQpUR0gY7bcZyfz+Hq+yWSVTkba4cLKv4+2Xc4sq3rr43zWgQsbdmDB
	KbYu4Hxu4heSaBGvwGc6UKXw8UZOUb+Y47/SuVmSARU40998YaOIAHbtgpzuzMFfFroq84OXjY8
	s2O3CyV/WBAId+k3xd0iDh1FSAD6MQXQuCNoQXQD7/c0XE3odYHMb4u2VsZtbWUsiVoZJYU2gCv
	kVdk5TVKLCAc1FTKeFmHfKaPxoc6CUuOlUgJgXFEqybaRGSHyhb5q4NBVipihC27sYEjmgQLNSf
	3rpGE05QUD7BNG6l1M/PL3GQsWPStzS+2d44lRed8sZpmpE/E6o5hc4i4jZAtJ1LqlvShwxkqyf
	yt2BnEES7Fh3QostFTaFKl4PrBPnfNMpcAXL4mzq6xJEYTG+Jjb5ONKPiLcvPlYqwCw1LJFDHsa
	hgqW0r7z/IUz8=
X-Received: by 2002:a17:902:e806:b0:2ca:619f:9733 with SMTP id d9443c01a7336-2ce9eac58f9mr71900625ad.17.1783904642652;
        Sun, 12 Jul 2026 18:04:02 -0700 (PDT)
Received: from localhost ([121.250.214.124])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bdb746sm89165375ad.7.2026.07.12.18.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 18:04:02 -0700 (PDT)
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
Subject: [PATCH v6 5/8] RISC-V: KVM: Handle software-check exits for VCPU
Date: Mon, 13 Jul 2026 09:02:58 +0800
Message-ID: <20260713010302.303278-6-inochiama@gmail.com>
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

