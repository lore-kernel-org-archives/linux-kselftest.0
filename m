Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942983998A6
	for <linux-kselftest@vger.kernel.org>; Mon,  1 Jun 2026 10:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780309600; cv=none; b=XKh00eupljO96itP+nJgdbKWwwQdljy1GChHO3hnCU+A4LIoFbx23z9nsiwORvF1EcgasapWPh0DKBda8mpZGurHkc5zIdE1gd/tWT3FpOyAQ98YCKw1WR41VUxhFGcU0/pI9PGr5D5OO+Tix1rcAvgst5C1hMZyKWK6Uc4YEBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780309600; c=relaxed/simple;
	bh=gfnczZN+h+rWjSUF0BJooFipVgVWUQb9pSCmrwwRlAE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hoUDOXh3SNIB5ksLhclzKiXtku4Mxb1VZ7kRNffBN0zEbemVi6bE1jpddfRbnyQwK9a2wI2f5isPKg44pvzW5V2c5l5vesBWfvgoV2J7PUX7tHpr3uMegHtWj3nCDcUOJeN/h1bncs7vL6DisNqpmCM4MB2/ehBEuptfRLpVxvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=U/7EQ9hK; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="U/7EQ9hK"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-304f590dd91so2332965eec.0
        for <linux-kselftest@vger.kernel.org>; Mon, 01 Jun 2026 03:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1780309598; x=1780914398; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UkH+rbPYFBQOwWqBxudVceNf6H3KI5FVfOpH4WOZPq4=;
        b=U/7EQ9hK7nrN68oCR9unCLVDVO5Vgw37pQgKeH0SKTfeF48RT1z29TSQO6+Pz+3kpY
         5/MZRuwXxMFjRfcF6euovDyacF1e0VSHuywbGupa3RoeOAuowGDp+9k6gwjh8Eo1Q7dp
         RZfiVdc2oa6y8Dh4n4ANcmP8Mkg/Kd9cZfYg5Iuk981vcqhLgQk0vi8Yo9iR7oYgr4zd
         U+JOzfP1IBB6OaS7BZIETtlgU7VfhYURyvfGkBej5Xa2KsIG1CVak6Ew1eKgdmP0AnmN
         w9/AB6t311P1Rcz/D26ksKZXtjAcGF+Bg+1JTyWJNDfNfjq55IBbA06Ulid3Qls/c/ok
         Ch5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780309598; x=1780914398;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UkH+rbPYFBQOwWqBxudVceNf6H3KI5FVfOpH4WOZPq4=;
        b=I4UUjGie3ZqaDqgCMUexJsFMb1PhBo5hkD1mT5VFyIUpyLjp8ggw3cLAcyrO9Ax17k
         VNQuFPIUBuU8SYSfifYHY8NScgZCAJMauv0nXbH0L0gOzGin1wf6EBVq5j9bB8zURU3n
         f2JkIY9bimWYgaA4Qjv8h3HtNWWE2/r1WBMHwTJ6n8MFNFr6NTuLgLO2p/QRlUGxvEUF
         ep3bBIrRqEnfPfFrdeABg6cixuxeSyI63ulpZZ2q0XcYp+ZEm49bojBacDyV3J8+0BPE
         hA4tvmRWDJW70Z61U4Xnt41fwNMqwd0DIL4/WhrahHc098KtYlXilB84u4dx0y/6Q2CK
         bgeA==
X-Forwarded-Encrypted: i=1; AFNElJ8tV3ZEukNXjA/c2E6my0Xe6GCgp/2R8vDwRVECwTOiJXzZTpV819bxiushqqGOIdoBwTHAAxnMs5v/No8MN/Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkTfXaE+pKDa5IVeKQjCMLm6+LYmnhVlzN/9jpnrBRBDkecPc3
	zNcL8zwagLTz70GeCulI50Z/b1zt0rvc5O0VOqDskBeDABNu9F7xd4fy7a0LU3eGu6k=
X-Gm-Gg: Acq92OF3IGpYxLH/qoXiiDxgvHcxFEk6TPf1wI6lSdsh8P+2I/Qv9ndDfv4+KMgmFWR
	IQh3eEYP3+QfdxnBaJUAVArY+HN2lOuaKL+W+bB/AKi22XmmLtDzZuO1LwVAc/2olLWZdDxjv0K
	xFUpt1/Prx074ByHdhBX7Uu91BfhcQ5SVQn9uwd5VTnrdZMi1lW7PXovUf+eMQCkFCBnQsmdZMa
	51ddCZAXzS9vPdvxzP+srORenfKVB2k6wVSLf4C3q/zJCydo7mr5TQ3lil40wUxeGe1s+z/HI3N
	yWWM5/DvSstmPoG6+yUzR+SOkvNXGKgNqB9KYkHT+Cp7TrLIZ2EDlQ8b2IVZTtXqJwX4yXLTpbA
	BYFrXmsTO+Gbf1fyRN2FpoNSEVs6nigz0LwroKxdkn+wueKocgavXvxnUjtcjesQnEreTyC876I
	ND+GW8yZtfPuy214TS0nQiJy437GxF7xzThOcp7KMV6bFZMMmro6bNfQ==
X-Received: by 2002:a05:7300:6c84:b0:2d9:6373:ad24 with SMTP id 5a478bee46e88-304fa67bcafmr4315278eec.26.1780309597890;
        Mon, 01 Jun 2026 03:26:37 -0700 (PDT)
Received: from sw07.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed5b9be7sm8176001eec.27.2026.06.01.03.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 03:26:37 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Mon, 01 Jun 2026 03:26:24 -0700
Subject: [PATCH v5 3/5] KVM: RISC-V: SBI FWFT: Fix stale feature exposure
 after runtime extension changes
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-kvm-get_reg_list-v2-v5-3-415d08a2813b@sifive.com>
References: <20260601-kvm-get_reg_list-v2-v5-0-415d08a2813b@sifive.com>
In-Reply-To: <20260601-kvm-get_reg_list-v2-v5-0-415d08a2813b@sifive.com>
To: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Andrew Jones <ajones@ventanamicro.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: greentime.hu@sifive.com, vincent.chen@sifive.com, zong.li@sifive.com, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, inochiama@gmail.com, 
 Yong-Xuan Wang <yongxuan.wang@sifive.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780309592; l=3662;
 i=yongxuan.wang@sifive.com; s=20260424; h=from:subject:message-id;
 bh=gfnczZN+h+rWjSUF0BJooFipVgVWUQb9pSCmrwwRlAE=;
 b=+qL9SVI0RXfE0tqzldQtvBLEC2mHZjs6gsmQCiAjT050VaVqPB7Gkj9XL3XjEOBKONYsNXAwg
 xUJ+NRYAep7D+DmPqqrsPG6bSMojxfLyj5wI5WYNqJxBrI1Z/pit3jK
X-Developer-Key: i=yongxuan.wang@sifive.com; a=ed25519;
 pk=+8NCHB1ZJvZthQAmZspOAaqjo+/snaW8mFSiDx45HxY=

Fix a bug where FWFT features could be incorrectly exposed to guests
after userspace disables their dependent ISA extensions at runtime.

The 'supported' field in kvm_sbi_fwft_config was set once during vCPU
initialization based on the initial hardware/extension availability.
However, when userspace subsequently disables ISA extensions via the KVM
ONE_REG interface, the 'supported' field was not updated. This caused
the following issues:
1. FWFT features would remain visible and accessible to guests even
   after their prerequisite ISA extensions were disabled
2. Guests could configure FWFT features that depend on disabled
   extensions, leading to undefined behavior
3. The static 'supported' flag and the dynamic supported() callback
   could disagree about feature availability

The fix introduces a two-layer checking mechanism:
1. Add an optional init() callback to the kvm_sbi_fwft_feature structure
   for features that require hardware probing during initialization. This
   separates the one-time hardware detection logic from the runtime
   availability check.
2. Add runtime checks in all FWFT-related functions that call
   feature->supported(vcpu) if the callback exists. This ensures feature
   availability is re-evaluated based on the current ISA extension state.

This approach maintains the cached 'supported' field for initialization-
time decisions while ensuring runtime availability is always determined
by the current vCPU configuration, not initialization-time snapshots.

Fixes: 6b72fd170592 ("RISC-V: KVM: add support for FWFT SBI extension")

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
---
 arch/riscv/kvm/vcpu_sbi_fwft.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/riscv/kvm/vcpu_sbi_fwft.c b/arch/riscv/kvm/vcpu_sbi_fwft.c
index aee951f2b8e6..ab39ac464ffd 100644
--- a/arch/riscv/kvm/vcpu_sbi_fwft.c
+++ b/arch/riscv/kvm/vcpu_sbi_fwft.c
@@ -303,6 +303,8 @@ static int kvm_fwft_get_feature(struct kvm_vcpu *vcpu, u32 feature,
 
 	if (!tconf->supported || !tconf->enabled)
 		return SBI_ERR_NOT_SUPPORTED;
+	else if (tconf->feature->supported && !tconf->feature->supported(vcpu))
+		return SBI_ERR_NOT_SUPPORTED;
 
 	*conf = tconf;
 
@@ -433,6 +435,8 @@ static unsigned long kvm_sbi_ext_fwft_get_reg_count(struct kvm_vcpu *vcpu)
 		conf = kvm_sbi_fwft_get_config(vcpu, feature->id);
 		if (!conf || !conf->supported)
 			continue;
+		else if (conf->feature->supported && !conf->feature->supported(vcpu))
+			continue;
 
 		ret++;
 	}
@@ -455,6 +459,8 @@ static int kvm_sbi_ext_fwft_get_reg_id(struct kvm_vcpu *vcpu, int index, u64 *re
 		conf = kvm_sbi_fwft_get_config(vcpu, feature->id);
 		if (!conf || !conf->supported)
 			continue;
+		else if (conf->feature->supported && !conf->feature->supported(vcpu))
+			continue;
 
 		if (index == idx) {
 			*reg_id = KVM_REG_RISCV |
@@ -490,6 +496,8 @@ static int kvm_sbi_ext_fwft_get_reg(struct kvm_vcpu *vcpu, unsigned long reg_num
 	conf = kvm_sbi_fwft_get_config(vcpu, feature->id);
 	if (!conf || !conf->supported)
 		return -ENOENT;
+	else if (conf->feature->supported && !conf->feature->supported(vcpu))
+		return -ENOENT;
 
 	switch (reg_num - feature->first_reg_num) {
 	case 0:
@@ -527,6 +535,8 @@ static int kvm_sbi_ext_fwft_set_reg(struct kvm_vcpu *vcpu, unsigned long reg_num
 	conf = kvm_sbi_fwft_get_config(vcpu, feature->id);
 	if (!conf || !conf->supported)
 		return -ENOENT;
+	else if (conf->feature->supported && !conf->feature->supported(vcpu))
+		return -ENOENT;
 
 	switch (reg_num - feature->first_reg_num) {
 	case 0:

-- 
2.43.7

