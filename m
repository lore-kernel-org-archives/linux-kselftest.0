Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6396438AC8A
	for <linux-kselftest@vger.kernel.org>; Thu, 27 Aug 2026 04:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787805964; cv=none; b=lqZaqYYCuDy76DuVFhCP96H/QzVj0EWMpoz3me+JbqPfYqF040LEMXG0PsO8EUyYiELmb5Ak10YUpmceQmqB06r/6lCqHVyL851piUpLW6AX5kkGm0Ann40+6fy7seNnd+UFLmbsl/IU4Lvdd/be7rr/bC6bYRahOOK207WC1yY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787805964; c=relaxed/simple;
	bh=7nneyVx7k7xrEDZv0nl9gc2vrg8v2b/keKLgPkrNOU0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z4sqvdasmOOS4FKjKPBng0rdD+gS7CAWgj2H+Tjqov2iRKG5MBynMnYWDDLr3SKIa/j2o2VCBq1BIknFM+EunU4E0Kl9rrIOgK2tOPPJfVdP8kOWY/2IE5JlZV3a8jC6SMHpxBgiqDZg1iBzfr3WlzbkmV2le05i6useQ5cyOHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l05uRgsm; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l05uRgsm"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2d01663d816so14671455ad.1
        for <linux-kselftest@vger.kernel.org>; Wed, 26 Aug 2026 21:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787805961; x=1788410761; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sEzr0jYee/fARbmWPhLxuBfGYBmn4khYyL4pUGs2CjQ=;
        b=l05uRgsmde9ziZiAkR6xFPVmo4ark2OKWExizHJnevSQOVY2ICmzWawhuGbPRqc1yd
         WHjxRTs/y7LMZessUhYFfzwIph9RNVbwhG/mG0+nPQQhW9939gtWxDMi7ZnnwmIjmgGa
         99jzK5dESXfDDVCFOreehCxYLsBV+NYJFG8s79kKDkegL0BYixLoBiExyT1CEKjY+lcK
         bXYH6cBkt+q88cXbQF94F0WVkk7BFyc3mgX1EYrQ33QqdP5m/RhZgbx//DZ8qpDHHl8i
         Lm45d5Bv3MkKC1awjRxzYrogY8av99bOlkBcRuGD24nNU6XUtEGvfowlaEiAQnaIF+TD
         uQ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787805961; x=1788410761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sEzr0jYee/fARbmWPhLxuBfGYBmn4khYyL4pUGs2CjQ=;
        b=Jf5HgA1WtEb78IoZIOEOUaNZzwzgAh3BVBukVeHULhnP6I2pM/ig9fjIeg/h31/3PW
         bwfnRJliyp/+cYvqqnD56+eACCD+DiYFv1kE0SmW/nUB0kQATRO8AkeRXB9cChWlBpKn
         NczX++rxH+t2+C3ao/fWtnPG4uR3PgQ5MlL8Xo7wTDq/QY7GCLNmxWWC+tx+8LhjM04+
         KScc14D1g0XMVOWiVKv+P2kXu15PdsffgnUQzpCHLUwsOelhnKjheSwbyjvuiO9vKdx3
         OBFJBgvGqFCJyNbyo3BOrVCGtg6nj8+CCf3wdikwM+chZ97YsSK4GXy0p1EWU9du5Kpc
         c0OA==
X-Forwarded-Encrypted: i=1; AHgh+RqNBeDv9T05gILeopvpVImDqtTe1lGmst3kfuAvLpjyRQUHEBNr6mgVWwKKPgtrKfnAwtCvH8lFs/3AtYFpLuk=@vger.kernel.org
X-Gm-Message-State: AFuF++kEKs/ht/B6KrUFrB9wRunXwTGjUFx5JS6LKisagVIRCxOYxgTO
	pAblXQrKjRdhUAfeX2aAdVQVwNaDFywJfsLoFEQ7ah/zFsnvUkV5WiZh
X-Gm-Gg: AR+sD12pZk2lGm5gUyEvdavVH2xlF8gaZprheRJDEBvvphSPdFX86xP6/TVba+Hj9dH
	a+87enfEJKoPSyXd+62IQ/Fh+ZwBb9n0HLSpd0IlQgx3+IxO1DGz70HDyiM+5AceKCUWHj4MQkz
	caTJ/rnRu4pC9fsT+u2GYaMXDzY8M3bjwpCfJkbketcHk4IZ+VwDY9vCyxVYW5WrcxA27hNqYsJ
	OSc+rTkzC2xR1tN41ZPlrvQdp9fbxF8rElhoL/aw51HuFJ1eeLZ56HpjzorvQ5raG8dPTIvZ3bp
	sTFSiPVx5yplpvP6QDkLn6+Yo4JS468fcQvxssJxAhlCSiLF2Z44e5FU0JrN8PKJdbUt3sJP/VS
	Kx9JccZ/v7Zf47BV7i42ZdorNsFGr8UzwtGKD7nuuvBx+S9O2W6FtBgMsuj7NXbCxl/24Svni/z
	Y8PrYcm48YkHBENI78WnH/dnd7iOvvHx+8FnzSeHVz8bnQtE34/rLjeX4EDUv7Bva74Lt5rzA6w
	dZJ+7gAMCY=
X-Received: by 2002:a17:903:320e:b0:2c8:2808:3ec9 with SMTP id d9443c01a7336-2d707beaf8fmr248904825ad.12.1787805960656;
        Wed, 26 Aug 2026 21:46:00 -0700 (PDT)
Received: from volcano9f8e-host.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3285a5f96efsm2270583eec.11.2026.08.26.21.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 21:46:00 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: seanjc@google.com,
	pbonzini@redhat.com,
	shuah@kernel.org
Cc: kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] KVM: selftests: Add a helper to read a vCPU's APIC ID
Date: Thu, 27 Aug 2026 10:15:33 +0530
Message-ID: <20260827044534.2900285-2-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260827044534.2900285-1-hemanth.selam@gmail.com>
References: <20260827044534.2900285-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reading a vCPU's APIC ID from the host means open coding KVM_GET_LAPIC and
picking the field out of the register block, which several tests already
do.  Add a helper next to the other APIC definitions so that a test that
needs to target a vCPU, e.g. to send it an IPI, can just ask for its ID.

Handle both APIC modes, since where KVM reports the ID depends on the mode
and, for x2APIC, on whether userspace enabled KVM_X2APIC_API_USE_32BIT_IDS:
read APIC_ID for xAPIC, where the guest can rename itself, and use the vCPU
ID for x2APIC, which KVM keeps equal to it.

Assisted-by: Cursor:claude-opus-5

Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 .../testing/selftests/kvm/include/x86/apic.h  | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/tools/testing/selftests/kvm/include/x86/apic.h b/tools/testing/selftests/kvm/include/x86/apic.h
index 31887bdc3d6c..df8815bd57af 100644
--- a/tools/testing/selftests/kvm/include/x86/apic.h
+++ b/tools/testing/selftests/kvm/include/x86/apic.h
@@ -79,6 +79,26 @@ void apic_disable(void);
 void xapic_enable(void);
 void x2apic_enable(void);
 
+/*
+ * Reads the APIC ID of a vCPU from the host, e.g. to target an IPI at it.
+ *
+ * In xAPIC mode the guest can change its own ID, so read it back from KVM,
+ * where it lives in bits 31:24 of APIC_ID.  In x2APIC mode KVM ties the ID to
+ * the vCPU ID, and reports it in APIC_ID either as-is or shifted left by 24
+ * depending on KVM_X2APIC_API_USE_32BIT_IDS, so use the vCPU ID instead of
+ * having to know which format the VM opted into.
+ */
+static inline u32 vcpu_get_apic_id(struct kvm_vcpu *vcpu)
+{
+	struct kvm_lapic_state lapic;
+
+	if (vcpu_get_msr(vcpu, MSR_IA32_APICBASE) & MSR_IA32_APICBASE_EXTD)
+		return vcpu->id;
+
+	vcpu_ioctl(vcpu, KVM_GET_LAPIC, &lapic);
+	return GET_APIC_ID_FIELD(*(u32 *)&lapic.regs[APIC_ID]);
+}
+
 static inline u32 get_bsp_flag(void)
 {
 	return rdmsr(MSR_IA32_APICBASE) & MSR_IA32_APICBASE_BSP;
-- 
2.43.7

