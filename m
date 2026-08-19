Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1633EEAE1
	for <linux-kselftest@vger.kernel.org>; Wed, 19 Aug 2026 22:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787179392; cv=none; b=OUyKZqPDmEdPEEUUpv0NX23Ylb+qwzRQydYiuurEpFEsy8lO4gJ63RXbYWH8bOYRMufcqVugl5bv4+zJ/lj1XV36z+5L4j4p47IQ1b4ITb0nuTQ9udsh+KJZs8sWauTCioRctiHdP8TtZgZqqCKAY7Y1ZHSxEW8d1K2aiXn3stM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787179392; c=relaxed/simple;
	bh=5J3mZ5DG3X89coFj1lOxV+K0e69xR0vmOMWNHwJ/u4M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=t3UGbk91YRnaS61oqDSUOWWbeYdHx3gzRfY4E/rj3mM7rtWt9B4SWdKqt6eZ6MSYtWJx1KHd/T11DjmtVUkC+mzDg/GNsEWB4bRmYDKF7UnmpMTeUh4foWQ/iHv/lRPbEhV8/RHYwKJMhqV+KNiSIIzedE9CXYCzegjHvWVJ39A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O+wI+Vaz; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O+wI+Vaz"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-499840a2575so12127545e9.3
        for <linux-kselftest@vger.kernel.org>; Wed, 19 Aug 2026 15:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787179389; x=1787784189; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N7MrJ4egxCjisuoRkHErVFW1wlw+AkBqP17Bfxm8jyA=;
        b=O+wI+VazHsiKvrVGcPSmAPPManrbglxbsp2hoHGmn7m/s0yodOMlroHGrY/sCcY4Ke
         aKa+A11H+K3wotN9eWOZGUmZOwY9aJ/MII2Yo4FFfgZlvIe4kYJYb1CJz7pAr0/V7Ueh
         RehR7R1R2TvcP0m7m97tdcmSYPHr6HqaJmcuV3CSS1EBBUH3TSYXBtv+WA6zEeyylPus
         gw0Ha1OYn8YLu2HeM46yijtEIMtq5RIAB3hh51dGuLA4kMgeyL5j31GYmEu8XTxR9h59
         cF2brqF21HNnnFbQxNEmlh0XP8T8YhFMqF0twK3BwY4/X/VzNu8ffjVGpPeic6Hr348R
         RsKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787179389; x=1787784189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N7MrJ4egxCjisuoRkHErVFW1wlw+AkBqP17Bfxm8jyA=;
        b=XkUIu+mQ1xryCC3biwo4d9k5caHxOMN+Nj79b/hUVOuuG9w+BEAJNvEzsBw+T7Ydtr
         RdEQc+2CmBl/ABGLaGzpDj+txjXS65eYn8nTv1qLmtWQwiXmJZ41b8l+9EbXEvaKPx/u
         ntQHgq13S2tM/nerz/fDnJ0FjRwY/CBRxdmWHIAogCm31yootEAN2j0MJFu/LzOQbuBU
         odDAq4DNM8I9qL7LYdHkM+KqLKgHyAezj4fhMYJphPpT72Okr3XuSHwZOoHjJk213HEo
         +zsQYAmhXYmJXS/DtMLs2+fvzmW/3TZ4+CSZ+8va8+fkwpmn+0vgkt32ZuIBjwv2AFVY
         IdmA==
X-Forwarded-Encrypted: i=1; AHgh+Rp2PB25Z2KiGZaxL6B0ggePTqFc1V+ORAKxIBETDxewqcBZmXh26YwcHXKvCvgNry1Y5+yVfJh3lvHNwNiWyCw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTSy42+AT9UdkKFFgYEgE/+UxaOoKRHL/nc1s3y5TgmBSg9JmX
	AgVhclutgdLj/zO2B1/tHPl3d4okNvGWBtRPQ13g1JYaTcsCF+GiIgYG
X-Gm-Gg: AR+sD11I0/E/Y94nMecXnkuyoXbMd+GORcx08QteAO80913QN+nYWd+rwjEkhyUH8z9
	PQFWRf6dHJ0ciuiK4pfFy4lxSIFbAltn4ViZSGqr82QTmwGGgpBGUHwyPca2paF+Vxkteb1u+bJ
	xLRHjZ9udZwG0NnuGXG3/rAsQTbvKDUyfWqidarhOvuzm9cpOD+z6yOg7hmVxdkRbe26mcs2iRS
	+6eKoIBKm+CQEUh6WVB61904zs2rCXYaFRdoCIbUMuehyMHogoO+GOn9NkXEDocgMUHGgMQWx75
	p2b37MqyilEyfhp7f1UTeg7PrXOWnz1DbRikqgQe35J/l6pvs05Qou2huVZRd0GQ/UnotjGHVWy
	dQf7hBk4bWrlUrLrhGDCgFLqEexkQoUfaEpivgcw/16+V2d89fXgMxK7eoOzAHhNNvy3Jd21Hr9
	/EY9XFhbhHhF2RNGsDHvQJBLIcto11wTzmvxAEG5yBV18sqXYjvkS6tmnla5MhoGKUOyHbkJthH
	uA2bGZXl56JRB8b2MktPS9Iv7alXHUdPJb2LGFqaUFFD9SmCVgGwf+K0OH4AMSgOrPDyY27/392
	w8fZT441eyjtkruhT54xYLErOrmbA1sWuLgx514eAF8LJWOgtIm784c5RAIQqT+6h1gm2q3crmL
	bcQ==
X-Received: by 2002:a05:600c:a00f:b0:499:9069:c2c9 with SMTP id 5b1f17b1804b1-499aa1b6c8dmr158647395e9.11.1787179388687;
        Wed, 19 Aug 2026 15:43:08 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ae9e-1d01-58d3-443d-4fa6-01cd.310.pool.telefonica.de. [2a02:3100:ae9e:1d01:58d3:443d:4fa6:1cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b1450e61sm8553317f8f.13.2026.08.19.15.43.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 19 Aug 2026 15:43:08 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Fuad Tabba <tabba@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Eric Auger <eric.auger@redhat.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v2 4/5] KVM: arm64: selftests: Pass guest code to vm_gic_create_with_vcpus()
Date: Thu, 20 Aug 2026 00:42:28 +0200
Message-Id: <20260819224229.82948-5-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260819224229.82948-1-kmehltretter@gmail.com>
References: <20260819224229.82948-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Pass the guest entry point to vm_gic_create_with_vcpus(), and use
guest_code at the existing call sites. This lets tests with different guest
code reuse the common VM and VGIC setup.

Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 tools/testing/selftests/kvm/arm64/vgic_init.c | 26 ++++++++++++-------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/vgic_init.c b/tools/testing/selftests/kvm/arm64/vgic_init.c
index 47e34b43afb2..91484fd4f786 100644
--- a/tools/testing/selftests/kvm/arm64/vgic_init.c
+++ b/tools/testing/selftests/kvm/arm64/vgic_init.c
@@ -73,12 +73,13 @@ static int run_vcpu(struct kvm_vcpu *vcpu)
 
 static struct vm_gic vm_gic_create_with_vcpus(u32 gic_dev_type,
 					      u32 nr_vcpus,
+					      void (*guest_fn)(void),
 					      struct kvm_vcpu *vcpus[])
 {
 	struct vm_gic v;
 
 	v.gic_dev_type = gic_dev_type;
-	v.vm = vm_create_with_vcpus(nr_vcpus, guest_code, vcpus);
+	v.vm = vm_create_with_vcpus(nr_vcpus, guest_fn, vcpus);
 	v.gic_fd = kvm_create_device(v.vm, gic_dev_type);
 
 	return v;
@@ -338,7 +339,7 @@ static void test_vgic_then_vcpus(u32 gic_dev_type)
 	struct vm_gic v;
 	int ret, i;
 
-	v = vm_gic_create_with_vcpus(gic_dev_type, 1, vcpus);
+	v = vm_gic_create_with_vcpus(gic_dev_type, 1, guest_code, vcpus);
 
 	subtest_dist_rdist(&v);
 
@@ -359,7 +360,8 @@ static void test_vcpus_then_vgic(u32 gic_dev_type)
 	struct vm_gic v;
 	int ret;
 
-	v = vm_gic_create_with_vcpus(gic_dev_type, NR_VCPUS, vcpus);
+	v = vm_gic_create_with_vcpus(gic_dev_type, NR_VCPUS, guest_code,
+				     vcpus);
 
 	subtest_dist_rdist(&v);
 
@@ -411,7 +413,8 @@ static void test_v3_new_redist_regions(void)
 	u64 addr;
 	int ret;
 
-	v = vm_gic_create_with_vcpus(KVM_DEV_TYPE_ARM_VGIC_V3, NR_VCPUS, vcpus);
+	v = vm_gic_create_with_vcpus(KVM_DEV_TYPE_ARM_VGIC_V3, NR_VCPUS,
+				     guest_code, vcpus);
 	subtest_v3_redist_regions(&v);
 	kvm_device_attr_set(v.gic_fd, KVM_DEV_ARM_VGIC_GRP_CTRL,
 			    KVM_DEV_ARM_VGIC_CTRL_INIT, NULL);
@@ -422,7 +425,8 @@ static void test_v3_new_redist_regions(void)
 
 	/* step2 */
 
-	v = vm_gic_create_with_vcpus(KVM_DEV_TYPE_ARM_VGIC_V3, NR_VCPUS, vcpus);
+	v = vm_gic_create_with_vcpus(KVM_DEV_TYPE_ARM_VGIC_V3, NR_VCPUS,
+				     guest_code, vcpus);
 	subtest_v3_redist_regions(&v);
 
 	addr = REDIST_REGION_ATTR_ADDR(1, 0x280000, 0, 2);
@@ -436,7 +440,8 @@ static void test_v3_new_redist_regions(void)
 
 	/* step 3 */
 
-	v = vm_gic_create_with_vcpus(KVM_DEV_TYPE_ARM_VGIC_V3, NR_VCPUS, vcpus);
+	v = vm_gic_create_with_vcpus(KVM_DEV_TYPE_ARM_VGIC_V3, NR_VCPUS,
+				     guest_code, vcpus);
 	subtest_v3_redist_regions(&v);
 
 	ret = __kvm_device_attr_set(v.gic_fd, KVM_DEV_ARM_VGIC_GRP_ADDR,
@@ -608,7 +613,8 @@ static void test_v3_redist_ipa_range_check_at_vcpu_run(void)
 	int ret, i;
 	u64 addr;
 
-	v = vm_gic_create_with_vcpus(KVM_DEV_TYPE_ARM_VGIC_V3, 1, vcpus);
+	v = vm_gic_create_with_vcpus(KVM_DEV_TYPE_ARM_VGIC_V3, 1, guest_code,
+				     vcpus);
 
 	/* Set space for 3 redists, we have 1 vcpu, so this succeeds. */
 	addr = max_phys_size - (3 * 2 * 0x10000);
@@ -641,7 +647,8 @@ static void test_v3_its_region(void)
 	u64 addr;
 	int its_fd, ret;
 
-	v = vm_gic_create_with_vcpus(KVM_DEV_TYPE_ARM_VGIC_V3, NR_VCPUS, vcpus);
+	v = vm_gic_create_with_vcpus(KVM_DEV_TYPE_ARM_VGIC_V3, NR_VCPUS,
+				     guest_code, vcpus);
 	its_fd = kvm_create_device(v.vm, KVM_DEV_TYPE_ARM_VGIC_ITS);
 
 	addr = 0x401000;
@@ -684,7 +691,8 @@ static void test_v3_nassgicap(void)
 	u32 typer2;
 	int ret;
 
-	vm = vm_gic_create_with_vcpus(KVM_DEV_TYPE_ARM_VGIC_V3, NR_VCPUS, vcpus);
+	vm = vm_gic_create_with_vcpus(KVM_DEV_TYPE_ARM_VGIC_V3, NR_VCPUS,
+				      guest_code, vcpus);
 	kvm_device_attr_get(vm.gic_fd, KVM_DEV_ARM_VGIC_GRP_DIST_REGS,
 			    GICD_TYPER2, &typer2);
 	has_nassgicap = typer2 & GICD_TYPER2_nASSGIcap;
-- 
2.39.5 (Apple Git-154)
