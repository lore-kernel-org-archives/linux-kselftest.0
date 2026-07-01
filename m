Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B71365A1D
	for <linux-kselftest@vger.kernel.org>; Wed,  1 Jul 2026 02:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782871706; cv=none; b=LFpdtE6o9Kegj1Emvq7QEnRIf4wKETa0aAMpqvLnQA2Atbg6rEpoZ4yY8wwIkTO9ENLY4Wd1ig93UX0YifLu9WnBrV2OR5LPd+2SQgmqiCZL+Ap/OBI/Uw/f2flydFWXgq9CUKwWMZRub0xD8JtL0ssS4OV2KuchrZBGoC+Tw+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782871706; c=relaxed/simple;
	bh=BtT0ls6YmM9d9nGGoTkQaPA0Kw5pw1Vw17vs5G6vw7o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kwi0EibId4np0z03kqZr+zOcWQvFnBE7vOhtCU12FJRMhN+DeQtBpRcwhZ291+rFb/zcp1G7HN2NxZTLbl5IqXRz5PTp3y962aYMA3b4p1Iser5YMRVyAJk5qgW24wfoGKh7NdFV6Ua9b03V33wLNm8ic9i9Fa3t3qkilPe3t+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oOxObx1I; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oOxObx1I"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-37df416c44bso76223a91.2
        for <linux-kselftest@vger.kernel.org>; Tue, 30 Jun 2026 19:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782871703; x=1783476503; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rwFDdkksbt790fLoy4tClBNp4x5JbRI/xOADu+E9kr0=;
        b=oOxObx1IwmAeo6A640R/DEGWf2M54gAZOxeDNhjR3wYLjq0RfIfKrKG7DotzPo4kEm
         NLx0bnwnGKlugNIR1UIUb/KdpE24rn/iXFFSr0/A7tPkq2KGrWN0eUDeo1FM45Pir7H8
         8Tw9U72WL3sv1IEEG4/Z9LJR5t2MfzaZ5ckmqRpZzPUh0ZJs06A30vh2hcwZAiC2KEYn
         gTgpxeLP/9vqtnbbyqLXl8Hn2azDDQTbz+kt2MAx6UbD6t9SsaLPslksyH3S1I96mCgS
         V8pYZJHZGzfK9D4IjH+FcvR7vX6h0KWFRGHRI3xIXESOmNlHMcNZU4OXDE5bmj5uCiFV
         pPSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782871703; x=1783476503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rwFDdkksbt790fLoy4tClBNp4x5JbRI/xOADu+E9kr0=;
        b=s3oLu2RDfvzJEOhUor9vRB5v1fSEwsxhYetRSl8Lps0eX8ayZHSc/8VEVdZOg+f0Qv
         XkKrYqDfl0kKnZwQX1vKPflUiQNKNH5xiyQmD4KJ0Y5FzB2yglYlk4Jm0I2Ar0AvHAWl
         XfX8mkTrxArrL2+PT0cf2DAeY8pfaLSPAHoMYp8/fK6C8qs+Srko737ZsXc+LqhrNkCg
         gk2bq7Ei8A6fQ5USEPLC8GvvmXgl85icP8rff1eCUXkLqY++Ua66P6+8+jLSTV99Vo/6
         7hsTobKTMO6ReViMFfOV8HY6uONnvQ5eA89PJ9sSpqF9wsNbU1LJffV3P74Q4uwWSHv0
         jU6Q==
X-Forwarded-Encrypted: i=1; AHgh+RqxONvkZX0O1m9tXpnPJPSL64QuT0N9pEs25Z5apju9EKG8/MzLIcSj9/O9cl/HkFCBEsGvAq4DsYJC0OOuPGo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXFJJtjFbiyFAdXqMI5XxRy9OOn0ENIm9Z1z4rPxTJLDeo0XrZ
	PQcRFRQcMZP5xs6N7yaZMkvioPX0mn8SkJjnQNfdno6HSeQRZgNLjd4R
X-Gm-Gg: AfdE7clqeWcxRzn1bk2/OtLvmXeaYt2i3G85+Jvxw93gjW6J/zcesaPQY/bxxoBAKUD
	0TuEQ0Cpw60WrHNMg3Yz5H+BsfV9asVNilunb1M+KuD9XVLPusOCXSHlzxLusp9GOHiZ8tuO30T
	LhUkVV/bNKr0BWsAmEsHoSIKFdWR29GnJQ1qO+Vxm26CN8k2RP1AJa2SgcJP61Zx0KVM+QEIolf
	GI3dYWtGo7cU9bv7EOOnffW15tzCv5zimAKPvRAuHgCr7Ty7TnMNqzt/AzwJXaccSt4hMCcbwAe
	DJTDIzP4YtKqdwveiWPDI8XdXDhTD1ob9m/9AD4Wxt2IwsPxyPuMLv22PfdqAkT4D/IQdh/tanS
	JDr5QfE9kajbjavMA8qcwHhZveLYTxHcvUwmhM/Qd6F30tbeI6dSL2KMcz4CcR14eNR5Psvr9bu
	Igbx91IasA1H9YNJxg+Q7YrA==
X-Received: by 2002:a17:90b:4e8e:b0:37f:9cdf:f03d with SMTP id 98e67ed59e1d1-380527f7932mr4841362a91.32.1782871703409;
        Tue, 30 Jun 2026 19:08:23 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38095d2a0f0sm865257a91.3.2026.06.30.19.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 19:08:23 -0700 (PDT)
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
Subject: [PATCH v4 3/8] RISC-V: KVM: Allow Zicfiss/Zicfilp extensions for Guest/VM
Date: Wed,  1 Jul 2026 10:07:40 +0800
Message-ID: <20260701020746.170157-4-inochiama@gmail.com>
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

