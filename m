Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F40C73ED5B6
	for <linux-kselftest@vger.kernel.org>; Wed, 19 Aug 2026 22:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787179389; cv=none; b=rThFL40RPL4eRSrJI6PQd75Fd8qIhdtnraQaQlsg+uEbqmulSRRnuKn60X1U3QFhx7TKzgD826qmUq4iFoeiohFu5rwp09O2ecFmZwiQxneEbplbcibH6JzLjc42oRmIgLJMwNtEn2rNyjHyiSIBs6qQPiuh2zMbNFosLVa3yz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787179389; c=relaxed/simple;
	bh=97Q0jynUUZzSZ55O7Qyxq5A1GqvKcQd4O682s26kE50=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=i4ZovvsPQfrKxgPn0mP+nkGb52cZS0taXa5rQmEbYPofrA4Bg4bBIqpdE4pRCNdMA1w0pbK8PTodXnzmh9cT+T3eXMpBtySBCVlUpCeXb4ttY0N4uXNlsizxL68qXFzsiHDhs1Q94Kj/MvnWKKTehvJ3YpIcL+yJoq28S9qAQGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mn3LzKOa; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mn3LzKOa"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4815bce4652so1007712f8f.1
        for <linux-kselftest@vger.kernel.org>; Wed, 19 Aug 2026 15:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787179386; x=1787784186; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ls308eL6NV0loSgiW60lY9W5Z4q6fPeju3Nkz+urIAI=;
        b=mn3LzKOazkHsvtD55nIv7kiQFGVFOXM4FsnqnduVSAn6hO1h1hH33p9wHwQsbz5qho
         K+iY5zYS34aLxhYkQy28W/a3mmQ+SGGhVFOb0C51tLcdpHGU9AdcgrtIdM68pJSxviQy
         CfGpYqts8wdMTkIRVSAkOy2kCCOdY3wa/u+0oFh2NTt4M8qZbZzdUFnOOHAdS1pjskWH
         xZL1A1rL/EZCVuXBk9A0Ej1yf9VTeVgypVB27lnHE97BJfJSIyMGpmgXZlXrePO42G7A
         kTt1+p9SvNjFlkAATNQ3e+h2pf2MaAVVfJV7ImCQEqJs6+ENU9TIxFKcD5ThfFXljgYm
         tUJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787179386; x=1787784186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ls308eL6NV0loSgiW60lY9W5Z4q6fPeju3Nkz+urIAI=;
        b=XiMENgSRFPdy9DBIpwF8Bkp/qL3kL4FiPvoZsTmWn0R8ovrpgIPXOczaeDlHR7JBG4
         U1UEGFfM0hkxDfFCZ68aSE5ib8/3zt0xitVg6xu1DK6iT1hBztMiMXuJApf1UJUhZMzr
         /FkWdXNs9prPLZ8Qdc0md14bHYhqBm5X2posNoNloOVBJlRbJSgwflY8Y+3M4Lqj4qLY
         VasY3/9+p2i4It2aKaMxxIqja9/TVLMgzKtct+g3651J/i6QNEEHDXT2MHRGFq/CNNkq
         bWNm6oO/VMGTNSweBDDuStRODzqm+cICjHzQN22hVTq6FgzMMSbJt0XARf79cLz36gtG
         KjRg==
X-Forwarded-Encrypted: i=1; AHgh+RoXaDjUL+j+c46tKMYMDeToxulQBumXTC11aozzKRPMQmlwaFMWMPtzi7t+wu9y5s6czTE8+uqGxOJnSVXP+PA=@vger.kernel.org
X-Gm-Message-State: AFuF++lUvrY/KJ7jA15hHW6DdXFg8M+tZZeHr1ZuPuColKqA+YSaTSX2
	gj+sPEi2w2NUnBKgBNo81ZIMrXBsNXM6InHUTKDFiDMTdgbsUmZtKfWf
X-Gm-Gg: AR+sD134www38ajEi3/YjZ1xKhJf5siMS5v9+W6NpD4pYfhQDuFvtjcUnfKZcJT+BUu
	w3SEbFz0pxTzphCaDEQJmuvpQWEj3vXJY3FNzW6xAJj6NijJgeqJMAh+sKsX4a1adVJ2xNi0nOR
	h+gEuEz9P7riasyVFsRDRcB2B1B2UsqFzlW/mrkaOmyvF50ukw2sx3TnZHkMlTe2JUJJMn23tdh
	3zAhLfrsqb6OQyDNgxnUaDkFf2qM0N4m/3O5UJX7KskPC1uiMVSfUPazTZvnnu0lWub2lLqK7DB
	gsFO1wa0iMe1MjOnJdmXg3UKmFgcE5pS4ZktM/JEgUsXP0MxWusV9QIsK0D9u6cEfokhIIIVI3u
	H39wvCnmIrEAoTT9aIxaymFfC1GHhr2fEQnK4+1qkfloJNx72lBYE2ohuYAzddsc7oxdaOCtczH
	dFPXYfmisokenp6h6ZslDVqWhkTrJ6yggQXGDVoZ+VDOaVqN3Tl1qS0TNblTrTI55dPOJz7kdpE
	BNwBVwx1D+ny4EBdmb2gUIOXzjLb10JVN4CDJT5Bkmtetwu372QYDs+ev6LtTIbeXrJ9sdlNym7
	paj1UOZWeBdTIVYd8e9oWML2i5Q7Q0m/v56aytZl/YyEzSa00oDqN1OYwGxDJBZxAss=
X-Received: by 2002:a05:6000:4619:b0:47f:5b52:5579 with SMTP id ffacd0b85a97d-482b1fe8a4bmr14986627f8f.18.1787179386081;
        Wed, 19 Aug 2026 15:43:06 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ae9e-1d01-58d3-443d-4fa6-01cd.310.pool.telefonica.de. [2a02:3100:ae9e:1d01:58d3:443d:4fa6:1cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b1450e61sm8553317f8f.13.2026.08.19.15.43.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 19 Aug 2026 15:43:05 -0700 (PDT)
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
Subject: [PATCH v2 3/5] KVM: arm64: vgic-v3: Unregister redistributors before freeing regions
Date: Thu, 20 Aug 2026 00:42:27 +0200
Message-Id: <20260819224229.82948-4-kmehltretter@gmail.com>
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

vgic_unregister_redist_iodev() uses rdreg to return its region slot. During
VM teardown, kvm_vgic_destroy() frees the regions before unregistering
their iodevs, so vgic_v3_free_redist_region() must first clear every rdreg
pointer.

Unregister the iodevs before kvm_vgic_dist_destroy(), while the regions are
still alive. Temporarily drop config_lock because
vgic_unregister_redist_iodev() takes it; slots_lock remains held for the
MMIO bus updates. The region destructor no longer needs the vCPU scan.

Suggested-by: Marc Zyngier <maz@kernel.org>
Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 arch/arm64/kvm/vgic/vgic-init.c    | 11 +++++++----
 arch/arm64/kvm/vgic/vgic-mmio-v3.c |  9 ---------
 2 files changed, 7 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-init.c b/arch/arm64/kvm/vgic/vgic-init.c
index 0a3df6d3a691..df6d0bdda4a9 100644
--- a/arch/arm64/kvm/vgic/vgic-init.c
+++ b/arch/arm64/kvm/vgic/vgic-init.c
@@ -570,14 +570,17 @@ void kvm_vgic_destroy(struct kvm *kvm)
 	kvm_for_each_vcpu(i, vcpu, kvm)
 		__kvm_vgic_vcpu_destroy(vcpu);
 
+	if (kvm->arch.vgic.vgic_model == KVM_DEV_TYPE_ARM_VGIC_V3) {
+		mutex_unlock(&kvm->arch.config_lock);
+		kvm_for_each_vcpu(i, vcpu, kvm)
+			vgic_unregister_redist_iodev(vcpu);
+		mutex_lock(&kvm->arch.config_lock);
+	}
+
 	kvm_vgic_dist_destroy(kvm);
 
 	mutex_unlock(&kvm->arch.config_lock);
 
-	if (kvm->arch.vgic.vgic_model == KVM_DEV_TYPE_ARM_VGIC_V3)
-		kvm_for_each_vcpu(i, vcpu, kvm)
-			vgic_unregister_redist_iodev(vcpu);
-
 	mutex_unlock(&kvm->slots_lock);
 }
 
diff --git a/arch/arm64/kvm/vgic/vgic-mmio-v3.c b/arch/arm64/kvm/vgic/vgic-mmio-v3.c
index 331d203acb43..77a611564f8e 100644
--- a/arch/arm64/kvm/vgic/vgic-mmio-v3.c
+++ b/arch/arm64/kvm/vgic/vgic-mmio-v3.c
@@ -967,17 +967,8 @@ static int vgic_v3_alloc_redist_region(struct kvm *kvm, uint32_t index,
 
 void vgic_v3_free_redist_region(struct kvm *kvm, struct vgic_redist_region *rdreg)
 {
-	struct kvm_vcpu *vcpu;
-	unsigned long c;
-
 	lockdep_assert_held(&kvm->arch.config_lock);
 
-	/* Garbage collect the region */
-	kvm_for_each_vcpu(c, vcpu, kvm) {
-		if (vcpu->arch.vgic_cpu.rdreg == rdreg)
-			vcpu->arch.vgic_cpu.rdreg = NULL;
-	}
-
 	list_del(&rdreg->list);
 	kfree(rdreg);
 }
-- 
2.39.5 (Apple Git-154)
