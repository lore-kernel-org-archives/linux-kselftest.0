Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795114352;
	b=mAr0tVNJRzLrfKhmcO9Jw6znEfXwuwB1+xs6RifOad3x5/e5sktWgWQdHlMB9lo4nTeS
	 P/KjCTO+T2HGliVmOD5HU5xhoXQlpNlnwCwh/sP/ixACi2cqfKvGXqGXe4Tk3K15bRgLL
	 +pZZgw7Dqh4EL1didIgrRoIqh+/53yQZA39oo3dda3CwcXbp4DNZcobw53BfKEpanju1h
	 D5qk5jQBbEah3e55nVOn+8MAJcvL8r2DJruogQu3554uBfmGkl5W8VQwMhvl/20nKGxHr
	 chT4w5xkBMRrUdDZI0ItrJKEITMyMIoYnOg3PU/Wh/MP87u+m/EmHmRwlsXa7UI/Ivw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795114352;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=ss6SV+PFlqizaJrWDEhTfQYiu9JlRuTku7nU9+88v4U=;
	b=Sng+XS0NEQCgxpElVNTbUzqDz0ghzCxihy65bPwVNRD82QTdZgHO3NDMiZCTd1oSY0FE
	 eA5zSJvJ8vZ9G//BvIpgKNjt/GMarCmN5yHeay3r4FRvWs82AlEI/ZNel8bjqoskCO96f
	 PORaehVC2NnjgE0eJfEkYKX1Z5sKCMuVKpKftnYv4Sh3VyOFxPknO/6ZsDyY9lq5pYrrQ
	 GlrAeueq/v2o8DuDk3JIkp7UZSsfmN/GmBdZtoNZDMJkoNgdIHPa9A2lwLeJX1oElPvBu
	 RbZdLASU4kWCqD1+kRfe/hIG9JJvQ9b10D4Q1oZ1z4uEGTsxla6AAgttWW5MOzSP3/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fB6opchK;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD76606C13A
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 18:52:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBD76606C13A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fB6opchK
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-5727b04b81eso93929b6e.3
        for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 10:52:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795114351; x=1795719151; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ss6SV+PFlqizaJrWDEhTfQYiu9JlRuTku7nU9+88v4U=;
        b=fB6opchKrUeW2aib4tafptSBm8siWyOYBNTFyUVcVwH3ZUw9c8ddasLuK+X/Tz0BoD
         YvZENtPpO8JNEA/fv10ZNOpWZZeCKOZ0qiATkcT79nYy2nkffNQcpvCUffMOYJHJ+W8b
         3InbZIin6kXdsM05UBDIzpPUlubHhZwZEfEuUP7vQT8QvQtNfuOJm9LpQ/gnHiqqEqh7
         7GTqzcfts/yw9vkz7EtD8j8NPmxO4kieU1WIG72m2ij3JWRG4CWiig2iD2NMu6y0KvJY
         UojvJTNq8X8Sh+NapX67S6o+R4DujL3z+AhULUcwknLOUueoxnXT/95QstdUW493lXFG
         8mYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795114351; x=1795719151;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ss6SV+PFlqizaJrWDEhTfQYiu9JlRuTku7nU9+88v4U=;
        b=B5alG3FZljDw9PeqrutHSC53iQp0sULsZ+6b7hdF78IhrjUpgttC01yptjd8Wejk86
         BvEm26n7FneAsC6uGJIEwB7BZ4lgcr1tjSfwjBQTvoIgylZutzOlc+hW5X849iGgg3sN
         lWjRIJLpYmdTpCSxwYNmhjpcehvvz1i9hNMhH6XtIbf4Zcv5mzGLDb9Iy7UVka7e3dSN
         ri0el83uzF4UnexB5BmQHTBCsozx7PYRdaDFBGAsmswlFOPB3SNWQGUcjJGu4bT+a96o
         Nt6WdPnIIR4fkkQpobTh7nBugzyGGJxKdmfUbtgKUIQeOE0pMGrxB4irlHVEdjgYVlU6
         bthQ==
X-Forwarded-Encrypted: i=1; AL+hErHTlJ0pS+diB9aGnAVAuBuJ5GPl2ujmnhCFd+mhUxYJNoaCAD5OIJvWfP6I0/6P4XkDEoZU2+YOH6lnm3iiJfY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/SikB3KvVzE0PzSwRMFL5vZrQ6N7js8Q9/xRrCVLs9kNozsGGs
	5omlPQnF6sIZzZP1wqIC4weJjLy4j7F4BB31oLFytOa5J1SwqfktLOU79sflmsCfmWjxbGXVz6R
	svAt5O/nSZlm0OY6qWsyGangFCw==
X-Received: from jaav16-n2.prod.google.com ([2002:a05:6639:1d0:20b0:61f:23a0:7d2])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:4f4f:b0:56a:dc07:f218 with SMTP id 5614622812f47-57a0a10c801mr992416b6e.20.1795114350522;
 Thu, 19 Nov 2026 10:52:30 -0800 (PST)
Date: Thu, 19 Nov 2026 18:51:57 +0000
In-Reply-To: <20261119185215.632334-1-coltonlewis@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261119185215.632334-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261119185215.632334-16-coltonlewis@google.com>
Subject: [PATCH v10 15/33] KVM: arm64: Construct mdcr_el2 in a local variable
 in kvm_arm_setup_mdcr_el2()
From: Colton Lewis <coltonlewis@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Russell King <linux@armlinux.org.uk>, Jonathan Corbet <corbet@lwn.net>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, James Clark <james.clark@linaro.org>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Mingwei Zhang <mizhang@google.com>, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Construct the new MDCR_EL2 value in a local variable before writing it
once to vcpu->arch.mdcr_el2. This avoids exposing intermediate states in
vcpu->arch.mdcr_el2 to interrupt or NMI handlers that may inspect it,
and simplifies upcoming Partitioned PMU modifications to MDCR_EL2.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/include/asm/kvm_nested.h |  2 +-
 arch/arm64/kvm/debug.c              | 27 +++++++++++++++------------
 arch/arm64/kvm/nested.c             |  6 +++---
 3 files changed, 19 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_nested.h b/arch/arm64/include/asm/kvm_nested.h
index 0f899addafa8b..a1ad046428a2d 100644
--- a/arch/arm64/include/asm/kvm_nested.h
+++ b/arch/arm64/include/asm/kvm_nested.h
@@ -90,7 +90,7 @@ extern void check_nested_vcpu_requests(struct kvm_vcpu *vcpu);
 extern void kvm_nested_flush_hwstate(struct kvm_vcpu *vcpu);
 extern void kvm_nested_sync_hwstate(struct kvm_vcpu *vcpu);
 
-extern void kvm_nested_setup_mdcr_el2(struct kvm_vcpu *vcpu);
+void kvm_nested_setup_mdcr_el2(struct kvm_vcpu *vcpu, u64 *mdcr);
 
 struct kvm_s2_trans {
 	phys_addr_t output;
diff --git a/arch/arm64/kvm/debug.c b/arch/arm64/kvm/debug.c
index f4d7b12045e8f..89c9fb0cfeee2 100644
--- a/arch/arm64/kvm/debug.c
+++ b/arch/arm64/kvm/debug.c
@@ -37,38 +37,41 @@ static int cpu_has_spe(u64 dfr0)
  */
 static void kvm_arm_setup_mdcr_el2(struct kvm_vcpu *vcpu)
 {
+	u64 mdcr;
+
 	preempt_disable();
 
 	/*
 	 * This also clears MDCR_EL2_E2PB_MASK and MDCR_EL2_E2TB_MASK
 	 * to disable guest access to the profiling and trace buffers
 	 */
-	vcpu->arch.mdcr_el2 = FIELD_PREP(MDCR_EL2_HPMN,
-					 *host_data_ptr(nr_event_counters));
-	vcpu->arch.mdcr_el2 |= (MDCR_EL2_TPM |
-				MDCR_EL2_TPMS |
-				MDCR_EL2_TTRF |
-				MDCR_EL2_TPMCR |
-				MDCR_EL2_TDRA |
-				MDCR_EL2_TDOSA);
+	mdcr = FIELD_PREP(MDCR_EL2_HPMN, *host_data_ptr(nr_event_counters));
+	mdcr |= (MDCR_EL2_TPM |
+		 MDCR_EL2_TPMS |
+		 MDCR_EL2_TTRF |
+		 MDCR_EL2_TPMCR |
+		 MDCR_EL2_TDRA |
+		 MDCR_EL2_TDOSA);
 
 	/* Is the VM being debugged by userspace? */
 	if (vcpu->guest_debug)
 		/* Route all software debug exceptions to EL2 */
-		vcpu->arch.mdcr_el2 |= MDCR_EL2_TDE;
+		mdcr |= MDCR_EL2_TDE;
 
 	/*
 	 * Trap debug registers if the guest doesn't have ownership of them.
 	 */
 	if (!kvm_guest_owns_debug_regs(vcpu))
-		vcpu->arch.mdcr_el2 |= MDCR_EL2_TDA;
+		mdcr |= MDCR_EL2_TDA;
 
 	if (vcpu_has_nv(vcpu))
-		kvm_nested_setup_mdcr_el2(vcpu);
+		kvm_nested_setup_mdcr_el2(vcpu, &mdcr);
+
+	WRITE_ONCE(vcpu->arch.mdcr_el2, mdcr);
 
 	/* Write MDCR_EL2 directly if we're already at EL2 */
 	if (has_vhe())
-		write_sysreg(vcpu->arch.mdcr_el2, mdcr_el2);
+		write_sysreg(mdcr, mdcr_el2);
 
 	preempt_enable();
 }
diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 4d83281a7a28b..b80d90ede9004 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -2237,12 +2237,12 @@ void kvm_nested_sync_hwstate(struct kvm_vcpu *vcpu)
 				 MDCR_EL2_TDCC	|	\
 				 MDCR_EL2_TDOSA)
 
-void kvm_nested_setup_mdcr_el2(struct kvm_vcpu *vcpu)
+void kvm_nested_setup_mdcr_el2(struct kvm_vcpu *vcpu, u64 *mdcr)
 {
 	u64 guest_mdcr = __vcpu_sys_reg(vcpu, MDCR_EL2);
 
 	if (is_nested_ctxt(vcpu))
-		vcpu->arch.mdcr_el2 |= (guest_mdcr & NV_MDCR_GUEST_INCLUDE);
+		*mdcr |= (guest_mdcr & NV_MDCR_GUEST_INCLUDE);
 	/*
 	 * In yet another example where FEAT_NV2 is fscking broken, accesses
 	 * to MDSCR_EL1 are redirected to the VNCR despite having an effect
@@ -2252,5 +2252,5 @@ void kvm_nested_setup_mdcr_el2(struct kvm_vcpu *vcpu)
 	 * trap MDSCR_EL1.
 	 */
 	else if (!cpus_have_final_cap(ARM64_HAS_FGT))
-		vcpu->arch.mdcr_el2 |= MDCR_EL2_TDA;
+		*mdcr |= MDCR_EL2_TDA;
 }
-- 
2.56.1.708.g77570a6a1d-goog

