Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6B63839BB
	for <linux-kselftest@vger.kernel.org>; Fri, 12 Jun 2026 16:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781281457; cv=none; b=Uu6pAXte+W0aFFk+DBtTMuRVpqLQQFTKfpXoycMuzWyjdyoFFOEAvyaHnAcvJFvQq/BK8MElNHhGKIHME11im7JWVKqmF7Clbzqpu7L0yyoh1ekmjOzVSNY3kv26ABm9K5xJDF1AetPWm/OBiq9lq/uBXXv24d96N3Q7t9noZKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781281457; c=relaxed/simple;
	bh=Ek5sg8ia7dHrpdcCzHmFxOvsiqSRhQeTCIZ4Fbont5Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ac0mz0tTMNgDyS0B/zbEk1PXPwTNhRCaCQFU9IztJuc9/h5D86nWo8oZ0MEciH8pfNKUFB7P+EZ9k1qi5FSc7O+PumN3Eq0Gll2WimOo0W67teZD7hXwUB28ObbTZr9M/NXsgOM7EPNCj61DwiXHiItMo0Vs2FzOUQ9K69QYc14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=io+CayzF; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="io+CayzF"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490afc47455so5502765e9.2
        for <linux-kselftest@vger.kernel.org>; Fri, 12 Jun 2026 09:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781281454; x=1781886254; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tdYyfsvx1DQaEQW7SfjjNGQD4l8zjElTcwX+OTVhZvA=;
        b=io+CayzFz4Uk2FNGC95HpAvXh/oJq7US3dD/KCDftdTO/QmdQj9yAudNKO1NfMCRAv
         qcics5FowaDmK3SpF7CS3UI0vuLK9wuQa//jYtfMhFz380Q5MX4aOrAR/vbShXHc8QYc
         uSxy+gKK3DVpit+m/+sV5UPkoRqbgNQXXzV/w87643eLyyR9dQtxRZprlFCKlzb7p9JN
         0NiLKPN0+xiCyqBCcEuaEaq3kmBXJGnHhfHDGJBAErwxj8RoBD5q/XmUjzPIOFUAeEKF
         6xqJ46NxzV23u1A2m5R1OvLI2MlVzSl/vauAvo99XPEhpTJI9InkjjMl6aAQwl/eKO/m
         wM7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781281454; x=1781886254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tdYyfsvx1DQaEQW7SfjjNGQD4l8zjElTcwX+OTVhZvA=;
        b=OmjljcauK3bRty7AKAC9NHWdAKcp5ll+2eaTxyl9nuSDeN0pyNY0FX06QuLz8t+rWZ
         dbv1C6v68PJaXcWxgNRDyF9cYJaWFgfOhgWS9XEMJyKsobRMTUaEpF6+VtwT3fH92VY/
         BFxR53nA4v/fWmgXLv/VVvMBt+pPtXa2gd3gKlyS+Q0K1inDhY2Xi/ytmwBnicOhXzGa
         MkvKuxRKINgEHa5w5vUiepcYo8Z4n0enloiEFphLpklF+fp2/uFDhXt73toK38MZKAmO
         99QkfV7wIOSqqe7FIFNDRftXYFOzXeKM7/WVmnTI5nwqs/3p+8LCgCprZNx4EyAqc6cT
         I4Kw==
X-Forwarded-Encrypted: i=1; AFNElJ9floE3M9XqcvlF+h3qvPTD9nN7Xb5MlMxnrDanyoQ4HwCwKc3udZG3ztCV4Ighu83NGEViy3fsLzfT7pyRdIc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBAO/Qg28zKz54CsO9i3PeDsgPz4AgLoVDEHtYcJI702/jllWA
	cmnwNCnLyIwg0pt1ErBG4NMUGZwsV/Baa8gkHSwmYHhajByprQA+Yy28
X-Gm-Gg: Acq92OEDHfAz/utoy6V0bcN02wOIBygbeI9dqGKXJ14Lb0tX9NFKiiHR4HcSDp6k/Py
	y1pZgI+cxZz8POnDALIt08CdnkkW6Mr6/pMXKUeNjO31bP26nooiMZZY5/ntjDNaSOb9oyeAMHS
	kugSpAeBC7rzSjapzjjM8l80sQIyD82EWl75EIPKSGphDzAC2Kl6knwUpHZ5TsGoxQzgIRPBBad
	3+o09fFGOZQClnbOZbKl6uQtYe5BZW25JkM2cvT12U1ZIkz3+VmUHktHPHdYcYe78ywNTP/1cSw
	UlAB9m/Lg4jEup1Tnk2MefG4iLV8UW+o/PLk+Zf6xUZ1e+BtIZkEI6gDH/QhOIQpoCmzTekmS9M
	PauG8mEQ2WD4na+d7BPMNElPacnbQuncgaR4hqu7dAOiSTTvTulyIEAXwMyP644vthbQgZj+8Su
	ShklCwTh8meJKHtlAj8IDt6uPXyDGD8ZFkmR15fLtq+5l5vFnUUOAQjaxLOaobJw==
X-Received: by 2002:a05:600c:3548:b0:490:ea8a:32d0 with SMTP id 5b1f17b1804b1-490ec501917mr49869245e9.20.1781281454334;
        Fri, 12 Jun 2026 09:24:14 -0700 (PDT)
Received: from f4d4888f22f2.ant.amazon.com.com ([15.248.2.31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490ea95c51dsm57620935e9.1.2026.06.12.09.24.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 12 Jun 2026 09:24:13 -0700 (PDT)
From: Jack Thomson <jackabt.amazon@gmail.com>
To: maz@kernel.org,
	oupton@kernel.org,
	pbonzini@redhat.com
Cc: joey.gouly@arm.com,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	shuah@kernel.org,
	corbet@lwn.net,
	vladimir.murzin@arm.com,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org,
	isaku.yamahata@intel.com,
	Jack Thomson <jackabt@amazon.com>
Subject: [PATCH v5 1/5] KVM: arm64: Pass walk flags to kvm_pgtable_get_leaf()
Date: Fri, 12 Jun 2026 17:23:49 +0100
Message-ID: <20260612162354.73378-2-jackabt.amazon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260612162354.73378-1-jackabt.amazon@gmail.com>
References: <20260612162354.73378-1-jackabt.amazon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jack Thomson <jackabt@amazon.com>

Allow callers of kvm_pgtable_get_leaf() to specify the page-table walk
flags, in preparation for performing walks under the MMU read lock.

Reading a stage-2 leaf while only holding the read lock requires
KVM_PGTABLE_WALK_SHARED: parallel faults (which also only hold the read
lock) can unlink table pages and free them via RCU, so the walker must
be inside an RCU read-side critical section, which the shared walk flag
provides via kvm_pgtable_walk_begin().

All existing callers either hold the write lock, walk with interrupts
disabled, or run at hyp where shared walks are rejected; they keep the
current behaviour by passing no flags.

No functional change intended.

Signed-off-by: Jack Thomson <jackabt@amazon.com>
---
 arch/arm64/include/asm/kvm_pgtable.h  |  5 ++++-
 arch/arm64/kvm/hyp/nvhe/mem_protect.c | 10 +++++-----
 arch/arm64/kvm/hyp/pgtable.c          |  5 +++--
 arch/arm64/kvm/mmu.c                  |  2 +-
 arch/arm64/kvm/nested.c               |  2 +-
 5 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
index 41a8687938eb..d0167f7dfbee 100644
--- a/arch/arm64/include/asm/kvm_pgtable.h
+++ b/arch/arm64/include/asm/kvm_pgtable.h
@@ -859,6 +859,8 @@ int kvm_pgtable_walk(struct kvm_pgtable *pgt, u64 addr, u64 size,
  * @addr:	Input address for the start of the walk.
  * @ptep:	Pointer to storage for the retrieved PTE.
  * @level:	Pointer to storage for the level of the retrieved PTE.
+ * @flags:	Flags to control the page-table walk
+ *		(see struct kvm_pgtable_visit_ctx).
  *
  * The offset of @addr within a page is ignored.
  *
@@ -869,7 +871,8 @@ int kvm_pgtable_walk(struct kvm_pgtable *pgt, u64 addr, u64 size,
  * Return: 0 on success, negative error code on failure.
  */
 int kvm_pgtable_get_leaf(struct kvm_pgtable *pgt, u64 addr,
-			 kvm_pte_t *ptep, s8 *level);
+			 kvm_pte_t *ptep, s8 *level,
+			 enum kvm_pgtable_walk_flags flags);
 
 /**
  * kvm_pgtable_stage2_pte_prot() - Retrieve the protection attributes of a
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 25f04629014e..3b765c9ff7e8 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -522,7 +522,7 @@ static int host_stage2_adjust_range(u64 addr, struct kvm_mem_range *range)
 	int ret;
 
 	hyp_assert_lock_held(&host_mmu.lock);
-	ret = kvm_pgtable_get_leaf(&host_mmu.pgt, addr, &pte, &level);
+	ret = kvm_pgtable_get_leaf(&host_mmu.pgt, addr, &pte, &level, 0);
 	if (ret)
 		return ret;
 
@@ -890,7 +890,7 @@ static int get_valid_guest_pte(struct pkvm_hyp_vm *vm, u64 ipa, kvm_pte_t *ptep,
 	s8 level;
 	int ret;
 
-	ret = kvm_pgtable_get_leaf(&vm->pgt, ipa, &pte, &level);
+	ret = kvm_pgtable_get_leaf(&vm->pgt, ipa, &pte, &level, 0);
 	if (ret)
 		return ret;
 	if (guest_pte_is_poisoned(pte))
@@ -939,7 +939,7 @@ int __pkvm_vcpu_in_poison_fault(struct pkvm_hyp_vcpu *hyp_vcpu)
 	ipa |= FAR_TO_FIPA_OFFSET(kvm_vcpu_get_hfar(&hyp_vcpu->vcpu));
 
 	guest_lock_component(vm);
-	ret = kvm_pgtable_get_leaf(&vm->pgt, ipa, &pte, &level);
+	ret = kvm_pgtable_get_leaf(&vm->pgt, ipa, &pte, &level, 0);
 	if (ret)
 		goto unlock;
 
@@ -1293,7 +1293,7 @@ static int host_stage2_get_guest_info(phys_addr_t phys, struct pkvm_hyp_vm **vm,
 		return -EPERM;
 	}
 
-	ret = kvm_pgtable_get_leaf(&host_mmu.pgt, phys, &pte, &level);
+	ret = kvm_pgtable_get_leaf(&host_mmu.pgt, phys, &pte, &level, 0);
 	if (ret)
 		return ret;
 
@@ -1522,7 +1522,7 @@ static int __check_host_shared_guest(struct pkvm_hyp_vm *vm, u64 *__phys, u64 ip
 	s8 level;
 	int ret;
 
-	ret = kvm_pgtable_get_leaf(&vm->pgt, ipa, &pte, &level);
+	ret = kvm_pgtable_get_leaf(&vm->pgt, ipa, &pte, &level, 0);
 	if (ret)
 		return ret;
 	if (!kvm_pte_valid(pte))
diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index 0c1defa5fb0f..6a839a32e246 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -298,12 +298,13 @@ static int leaf_walker(const struct kvm_pgtable_visit_ctx *ctx,
 }
 
 int kvm_pgtable_get_leaf(struct kvm_pgtable *pgt, u64 addr,
-			 kvm_pte_t *ptep, s8 *level)
+			 kvm_pte_t *ptep, s8 *level,
+			 enum kvm_pgtable_walk_flags flags)
 {
 	struct leaf_walk_data data;
 	struct kvm_pgtable_walker walker = {
 		.cb	= leaf_walker,
-		.flags	= KVM_PGTABLE_WALK_LEAF,
+		.flags	= flags | KVM_PGTABLE_WALK_LEAF,
 		.arg	= &data,
 	};
 	int ret;
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 4da9281312eb..c720f07cb82e 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -839,7 +839,7 @@ static int get_user_mapping_size(struct kvm *kvm, u64 addr)
 	 * IPI-ing threads).
 	 */
 	local_irq_save(flags);
-	ret = kvm_pgtable_get_leaf(&pgt, addr, &pte, &level);
+	ret = kvm_pgtable_get_leaf(&pgt, addr, &pte, &level, 0);
 	local_irq_restore(flags);
 
 	if (ret)
diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 38f672e94087..e45aed6d9e65 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -559,7 +559,7 @@ static u8 get_guest_mapping_ttl(struct kvm_s2_mmu *mmu, u64 addr)
 		return 0;
 
 	tmp &= ~(sz - 1);
-	if (kvm_pgtable_get_leaf(mmu->pgt, tmp, &pte, NULL))
+	if (kvm_pgtable_get_leaf(mmu->pgt, tmp, &pte, NULL, 0))
 		goto again;
 	if (!(pte & PTE_VALID))
 		goto again;
-- 
2.43.0

