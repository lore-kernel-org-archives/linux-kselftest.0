Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 257083CC32E
	for <linux-kselftest@vger.kernel.org>; Mon, 31 Aug 2026 08:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788163833; cv=none; b=gID8aYVQX7zUNz0mH/Pq8XgyaD83pVl5nre4tLApX4CtaVPlwbOJTTxUg5DBzXbRkhnd3BQFylUTsY2jVELXybehnIc3ek4dKi5wDjoxchx3tcC9DPOGi2xJeRXPmpEqkLh2RXkjxy71mLdBJOOCui8pEdWkTzj/8FKsSY397cA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788163833; c=relaxed/simple;
	bh=QaFutOje1lyg823tSWBbhoOBYa9TMEFhpNTqa16R5ow=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pl5ghniwIVj90AWCHWrLvLx/bgbRCgkd2vTzveDh0SwwYweb/BtHViMCZT2zgkNRWhbxZPDGz47pyIO6ESDUW93Y+k3y4Bs9ek5khPgNUaLUfM+c7PenDEHvV3EKA6ZnMzYziYN28gWfu4AgMINOI9ngvTDjd7eHfVe7irxIGB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ys3kfpn2; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ys3kfpn2"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49cd9add88aso1496255e9.3
        for <linux-kselftest@vger.kernel.org>; Mon, 31 Aug 2026 01:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788163824; x=1788768624; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7d5RXYEUOuzc4V23hC9MU0bXZ0pxNQetgcVjvcKaM1c=;
        b=Ys3kfpn2WsO9Inm4kHCx9zumAjHgp9mktLZai/tLyejpwasTX+VB1PZYeFqy+2VsFb
         v40zKGbYbRD6lbyE+JoTlsDYXxztgA1eoxLbgaUjymAEGWkBH0yHT6Raiu1dkrBrwPmg
         eSj3OWVrOJRlvE0csw/GIR6xrErAk8zUg1X7OfiMtu3StJhx9iiWNBr7IISVS1JE16d8
         0qD0usXwLpM6ffiBBKZcQbo6TCbPiFc92f0j39+NtzqBwnJ5Vnb6Fq9YQUXh0s0XhTSp
         wJzsByiyDCChGQ+AedQ5h3x32zqGp/+IEyM/r/2RuL4NC4oeZY4w3GeHN/wqjgLMbRL2
         SPSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788163824; x=1788768624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7d5RXYEUOuzc4V23hC9MU0bXZ0pxNQetgcVjvcKaM1c=;
        b=Pf84fjwyWPB4OehPvNXbBUxZiFQve/iNq51qgjvsuoBPs9NhzSOnfXd5g6zcBQBsei
         GSYpCf5Lcc5LfuZ4S4zrN/e4+vy/DfQoPlK5fbIP2SyLZVqgSJZrTkt4qd/4CoeLZaUI
         ouRJ4erK9QMQusa9UAUpB1724gXhi6/j4n/IBRo3rh6nsnK5+FL2STtv8loQH78yO4xz
         FdvggKE9eQ93PCzDIeUKBiipdp7sjBoUblOVq7ifiG2ClYsCbDTmk1w7jMwtnWd0ygIA
         f3zImGOdvfzEQM42qnZYXiIwxBogrcOvxfgGaGbTC5Ugiz1aBPPxobmaj3QuphISCdtc
         KUuA==
X-Forwarded-Encrypted: i=1; AHgh+RoGl+oh1y7R53TXkAJDuCtm+gbbGbzgl5vkf/dNTrK8jT0ubWhfGYJ+fIF9dFvXsNE3zaZpco5OV0vZGFZ2ZOY=@vger.kernel.org
X-Gm-Message-State: AFuF++meUO8jliGuBR9vnlT5PBuzVm0b+AGt+/Jyc4fnrXR6W1oyBAm+
	zE3B3gjqjTmkBg85JiTa2Bm/HkOdGEjaaZMAddjK3CwpTFv64i01VM/Z
X-Gm-Gg: AR+sD12VlELtrlvzaSoGlSLpxpEsDS3MO1qXiRiKYiVHwYvH4S0Ng89VXtoaB2/pWUZ
	ZZevQRaF3XvozTxD5rZaLir3TvLxDln/5rOge4hjVZYUTSR+W3lWXA2pYqt2NPVpUivZW5xZRX9
	QWvdZDHi6yGq/Z9bUjynlFcWljANB6hZqkZX3NRXn0eWVFNuh3dWASF7TVAH0Dv7YDegKY6ZCcz
	GDnApbteTYo3AakGjZ+VhB8yxrLoXxc7kKl0XFMP6HeyyIeJ0fMKVsam9IAyWP2nkNGNa2pL+7F
	nQmboC6NjXDpXfNyCcNSZUbP4ObLv+Y5/1CDyKuMTkH4q410j414+AwM1sIFcqjSTer+R0TR9Hl
	xjOT1yy7EV6Lzt0x94qA5UVgnA5gMGU3mKDnBKgks+5M/AjKtANDOWvjWWRg3bImxV+2YBp6dEh
	zDbtsyj2DLrND9d7r3jMWWZdIxh4y+HinLhMppVQ2pm7nUmA95bN2MKJj+EpP5T+2DtnIq1fS6o
	tAQpjhMDipixRpofyhSpDKkZMr+pzPZ0+tqvgNYMmh7YCYhCVretzO8AhQYEiRYZLV5GcFKkXHL
	F4rdS3G1T26mYft4GoDpBTHuCABAFs0cVzcnGgFe/SdBNSjzaEGvNqizNw7ROFw1obHPH8y8L6x
	fu3ZT+w==
X-Received: by 2002:a05:600c:354b:b0:495:4d88:e630 with SMTP id 5b1f17b1804b1-49b91c4fb4amr349472475e9.10.1788163823703;
        Mon, 31 Aug 2026 01:10:23 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-acb9-0201-68d0-34d2-ad1a-175a.310.pool.telefonica.de. [2a02:3100:acb9:201:68d0:34d2:ad1a:175a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b95013d06sm370393515e9.12.2026.08.31.01.10.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 31 Aug 2026 01:10:23 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
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
Subject: [PATCH v4 3/4] KVM: arm64: selftests: Pass guest code to vm_gic_create_with_vcpus()
Date: Mon, 31 Aug 2026 10:10:03 +0200
Message-Id: <20260831081005.41346-4-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260831081005.41346-1-kmehltretter@gmail.com>
References: <20260831081005.41346-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Pass the guest-code address to vm_gic_create_with_vcpus(), and use
guest_code at the existing call sites. This lets tests with different guest
code reuse the common VM and VGIC setup while retaining the void *
interface of vm_create_with_vcpus().

Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 tools/testing/selftests/kvm/arm64/vgic_init.c | 24 ++++++++++++-------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/vgic_init.c b/tools/testing/selftests/kvm/arm64/vgic_init.c
index 47e34b43afb2..84aa97204b7f 100644
--- a/tools/testing/selftests/kvm/arm64/vgic_init.c
+++ b/tools/testing/selftests/kvm/arm64/vgic_init.c
@@ -73,6 +73,7 @@ static int run_vcpu(struct kvm_vcpu *vcpu)
 
 static struct vm_gic vm_gic_create_with_vcpus(u32 gic_dev_type,
 					      u32 nr_vcpus,
+					      void *guest_code,
 					      struct kvm_vcpu *vcpus[])
 {
 	struct vm_gic v;
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
