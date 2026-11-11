Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794377177;
	b=4z1hVdFGnGVSi1bCUyDy1NBANRsFw2FdkN7cGKrzZdLswB1ctTk0ON15jkN4irMmt3Dc
	 +4/PRGfyk9SaVPnkTfzKYBONFDO4oFd/JbJqM6mXd4A9B9lexw4yn0uKh/cyqEg7eUMTJ
	 GYivCmneWUreZ+daiwn9QSanyx+EYAYRM6G7i6QhVDb5rbKyl5CEk09twdLIqRDX0W0Fo
	 4w684daD/X1BgHDJnlqIn9btKIWAZNRyRdwBh0HKKd23Dkn4FBnXP0pkIdONnucMJnvUO
	 xfAeyhl1Nkf17QjUYKnLtctQJclpppubIakquLVD3238rKM1A6+1cg+DGjFLy0UWIBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794377177;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=jANEAEn1OJ6RkwCtYHVMnVrdHBqYtTsSa0MTZA7qvJA=;
	b=QyMipT7ONIKSn3vHa2fuuhc1uxkLQpa0jZ6IqaUsEynk2T8TFJVoy5uMXb3z9l6b8Kdz
	 gT0KeXaZ6sFrp/QGoDLrRDJ08ltpTMzv7ibrknKpkkYscBE85NbHTLBVdY7ngtrOMb7q4
	 ckHcH8IMcUH/bZBJcqsRB7ZFKrx53fYblF0lPITnIH6ETP9QoIL3suHLpKoH0NCMAlh1d
	 s2v9wMPtIrPydFrBMdJh+ySu23IPcR/fcIKjKsZrzXGVUj1DbGZjMWBxSdN5OptN+m9AA
	 50/uQWa2ZD9DSpoU1DoxUF1Ay54yFdJo0dsTY0OV5D2qdcHoO3YJInsh0WCVWJLkmow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Na9ZPhw6;
	arc=none smtp.remote-ip=209.85.160.225
Received: from mail-qt1-f225.google.com (mail-qt1-f225.google.com [209.85.160.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1044E606A31C
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 06:06:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1044E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Na9ZPhw6
Received: by mail-qt1-f225.google.com with SMTP id d75a77b69052e-53c4b82919fso37839041cf.0
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 22:06:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794377176; x=1794981976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jANEAEn1OJ6RkwCtYHVMnVrdHBqYtTsSa0MTZA7qvJA=;
        b=UC6hqEFTtIneMdknicEKoLLG8nV13FLpbb/yWWAAGu/fud1UjcjkGhBvcLq1VU2GIN
         3cjo3UWPFZbkaLmJJ32S6WRpb4U6Ha3eZIRlE/uL0pT5awWoxgH4far01jNr+qx+/iE6
         pA88sQ8gIWA7K2lbVUQXCBlCbvzR+TyPhIC7pvQkqq0QJkKzQo7EGN4XqqcmE+OmTEOp
         epe7trXBWzuoaxxsDb3pSMxYisRiNE0Svl1q4XtENNu8lBrLIa5UF+70BZYDxqQF4Y0m
         8n50ngL9xS6MfX2jSpddJw2DywqbhpmIt6kSiByOQKqtj4annTxaUH9ESoNs4hak9kft
         Dayw==
X-Forwarded-Encrypted: i=1; AL+hErFM+lM+YhvL1+0/MJTyBS+DoT2Ctt5/LZi2wCFFpZGb8vR+kGOzohfAoYT9XRLFxGWk/c/UlTgRPSma2IHv9W4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9tVLNotA7uw3VV5SgTcCWaJHzZ0c/rVgcfuZjfTK9/3GgGkoZ1
	sUE2MD1sAx2fkfOF/f83YZ8b79UmWDn6hdJT01uBR/5e0isQKwcTbJhAzdpQYv3BewUTM5Ge9Z8
	NSmtrIuZ8RPCxx90EEmlJMkf6AjgwmnPLug08Inm9BnvEWe48Dma25UsZPLZj3/nPKoawpV39Tl
	vLTmmKVWNXcgR9klzNfepuI5Qj04oUjouV2WXHoQfOkSDgGCq/j38/mapRMZ/pJTi0dAbor1lkM
	yNMSaJBnC2RiUe/GjgB
X-Gm-Gg: AYBFou2PNgfPJg11nKd2hA+t4tZ66ruLdk8apLBLyBsdjc6vHHOba2zJqZzO6XHddth
	diGpuVVq7UUoVeI/ga1AZ2dfsAMc7R9MMXE9iz0OAddNgJMF3ht7lTvxPP5fsgnHR+lYkut+M6F
	rdTIS+Taj098dccXM4Rqq6acoudw+yKt6v7H7xWjHmkRJTPtiYeUmX3/GXALv6qWWyZt7bKHmXi
	iOtDKiAywGtgmV8uz0LA2a/A3VmMGWltKKXyK/O1aKFU2NUJE46c3Ck0vD+cLHsoWy5+ERCTUYb
	r+9xTevQkNqrFyWiMIG8ymbH5zJEdnqP8RCahcOuxwFJOUDD2d4vVRMmjQT9Y8/MlLAnxMRpFDS
	bXbQFk7v6XmMm0KgPrxlgGMldhLveE4Tv09pt/XEzpB3ojXmZn5I3t3a30Lig4wD32PpB6/JE/g
	LkZ/KxVrQnP7nYpVEC7y5vApDnYkCcDC1F
X-Received: by 2002:ac8:574c:0:b0:536:597b:cd46 with SMTP id d75a77b69052e-556bfa36e83mr20093121cf.24.1794377175696;
        Tue, 10 Nov 2026 22:06:15 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-22.dlp.protect.broadcom.com. [144.49.247.22])
        by smtp-relay.gmail.com with ESMTPS id d75a77b69052e-5550b84110dsm809071cf.28.2026.11.10.22.06.15
        for <linux-kselftest@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Nov 2026 22:06:15 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91c8a517107so79960236d6.3
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 22:06:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794377175; x=1794981975; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jANEAEn1OJ6RkwCtYHVMnVrdHBqYtTsSa0MTZA7qvJA=;
        b=Na9ZPhw69ggldTicoGyF2Fok8olq+YdN2iIl/SgwVGeUcScXUBAEHRwHk4GAXSNBsL
         VGlubjk+GabM+34fCBJ8WGBo9hZ8SH3JaobGt0A6EW0zPk5wWvq9CeCoDZDnAbrWj05Q
         AaHYLoON/L4tqPmZmFQePUdjq3zskIGfRY19w=
X-Forwarded-Encrypted: i=1; AL+hErHmIwZnYAkmvKmKWyq9mM5ub4oIyCtjwP5COTYX+9Fms6NBmJXcVz45x1p93vkBOKXNE95XuC3eU2U9I7JFdCY=@vger.kernel.org
X-Received: by 2002:a05:620a:1a1f:b0:947:a095:8ddc with SMTP id af79cd13be357-947affd48f1mr206173685a.39.1794376814042;
        Tue, 10 Nov 2026 22:00:14 -0800 (PST)
X-Received: by 2002:a05:620a:1a1f:b0:947:a095:8ddc with SMTP id af79cd13be357-947affd48f1mr206165485a.39.1794376813367;
        Tue, 10 Nov 2026 22:00:13 -0800 (PST)
Received: from vertex.localdomain (pool-173-49-113-140.phlapa.fios.verizon.net. [173.49.113.140])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e7e7f3bsm411506885a.37.2026.11.10.22.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 22:00:12 -0800 (PST)
From: Zack Rusin <zack.rusin@broadcom.com>
To: Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org
Cc: Doug Covelli <doug.covelli@broadcom.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <shuah@kernel.org>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Paul Durrant <paul@xen.org>,
	Xin Li <xin@zytor.com>,
	Francesco Lavra <flavra@baylibre.com>,
	=?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>,
	Liran Alon <liran.alon@oracle.com>,
	Arbel Moshe <arbel.moshe@oracle.com>,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	bcm-kernel-feedback-list@broadcom.com,
	linux-kernel@vger.kernel.org,
	Zack Rusin <zack.rusin@broadcom.com>
Subject: [PATCH v3 03/12] KVM: x86: Encapsulate VMware backdoor checks
Date: Wed, 11 Nov 2026 00:59:52 -0500
Message-ID: <76008acc660e337e7bbeab3310623a87046ac70d.1794374897.git.zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1794374897.git.zack.rusin@broadcom.com>
References: <cover.1794374897.git.zack.rusin@broadcom.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Add kvm_is_vmware_backdoor_enabled(), kvm_is_vmware_io_port(),
kvm_is_vmware_backdoor_pmc() and kvm_is_vmware_backdoor_opcode(), and
use them instead of checking enable_vmware_backdoor and the VMware port
and pseudo-PMC numbers directly.  Make the module parameter and the
pseudo-PMC numbers private to vmware.c, and take the backdoor port
numbers from <asm/vmware.h> instead of keeping a second copy.

The next patches make the backdoor a per-VM setting.  With every caller
asking whether a vCPU accepts a VMware interface, instead of reading a
global, that change stays inside vmware.c.

Check the enabled state inside the port and pseudo-PMC predicates, so
that no caller can treat a port or PMC index as VMware's for a VM that
hasn't enabled the backdoor.

No functional change intended.

Suggested-by: Sean Christopherson <seanjc@google.com>
Link: https://lore.kernel.org/r/aIEgVpjXDR0BXgHq@google.com
Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
---
 arch/x86/kvm/emulate.c |  5 +--
 arch/x86/kvm/pmu.c     |  6 +--
 arch/x86/kvm/svm/svm.c |  6 +--
 arch/x86/kvm/vmware.c  | 92 +++++++++++++++++++++++++-----------------
 arch/x86/kvm/vmware.h  | 19 +++------
 arch/x86/kvm/vmx/vmx.c |  4 +-
 arch/x86/kvm/x86.c     |  2 +-
 7 files changed, 72 insertions(+), 62 deletions(-)

diff --git a/arch/x86/kvm/emulate.c b/arch/x86/kvm/emulate.c
index a7bcde6f0359..da626bed93c5 100644
--- a/arch/x86/kvm/emulate.c
+++ b/arch/x86/kvm/emulate.c
@@ -2539,8 +2539,7 @@ static bool emulator_io_port_access_allowed(struct x86_emulate_ctxt *ctxt,
 	 * VMware allows access to these ports even if denied
 	 * by TSS I/O permission bitmap. Mimic behavior.
 	 */
-	if (enable_vmware_backdoor &&
-	    ((port == VMWARE_PORT_VMPORT) || (port == VMWARE_PORT_VMRPC)))
+	if (kvm_is_vmware_io_port(ctxt->vcpu, port))
 		return true;
 
 	ops->get_segment(ctxt, &tr, &tr_seg, &base3, VCPU_SREG_TR);
@@ -3908,7 +3907,7 @@ static int check_rdpmc(struct x86_emulate_ctxt *ctxt)
 	 * VMware allows access to these Pseduo-PMCs even when read via RDPMC
 	 * in Ring3 when CR4.PCE=0.
 	 */
-	if (enable_vmware_backdoor && is_vmware_backdoor_pmc(rcx))
+	if (kvm_is_vmware_backdoor_pmc(ctxt->vcpu, rcx))
 		return X86EMUL_CONTINUE;
 
 	/*
diff --git a/arch/x86/kvm/pmu.c b/arch/x86/kvm/pmu.c
index ae7000c44677..dacd40ca8620 100644
--- a/arch/x86/kvm/pmu.c
+++ b/arch/x86/kvm/pmu.c
@@ -726,8 +726,8 @@ int kvm_pmu_rdpmc(struct kvm_vcpu *vcpu, unsigned idx, u64 *data)
 	if (!pmu->version)
 		return 1;
 
-	if (enable_vmware_backdoor && is_vmware_backdoor_pmc(idx))
-		return kvm_pmu_rdpmc_vmware(vcpu, idx, data);
+	if (kvm_is_vmware_backdoor_pmc(vcpu, idx))
+		return kvm_vmware_pmu_rdpmc(vcpu, idx, data);
 
 	pmc = kvm_pmu_call(rdpmc_ecx_to_pmc)(vcpu, idx, &mask);
 	if (!pmc)
@@ -773,7 +773,7 @@ bool kvm_need_rdpmc_intercept(struct kvm_vcpu *vcpu)
 	 * VMware allows access to these Pseduo-PMCs even when read via RDPMC
 	 * in Ring3 when CR4.PCE=0.
 	 */
-	if (enable_vmware_backdoor)
+	if (kvm_is_vmware_backdoor_enabled(vcpu))
 		return true;
 
 	return kvm_need_any_pmc_intercept(vcpu) ||
diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index 980841d153f3..a2196d8f60aa 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -237,7 +237,7 @@ int svm_set_efer(struct kvm_vcpu *vcpu, u64 efer)
 
 			svm_leave_nested(vcpu);
 			/* #GP intercept is still needed for vmware backdoor */
-			if (!enable_vmware_backdoor)
+			if (!kvm_is_vmware_backdoor_enabled(vcpu))
 				clr_exception_intercept(svm, GP_VECTOR);
 
 			/*
@@ -1159,7 +1159,7 @@ static void init_vmcb(struct kvm_vcpu *vcpu, bool init_event)
 	 * We intercept those #GP and allow access to them anyway
 	 * as VMware does.
 	 */
-	if (enable_vmware_backdoor)
+	if (kvm_is_vmware_backdoor_enabled(vcpu))
 		set_exception_intercept(svm, GP_VECTOR);
 
 	svm_set_intercept(svm, INTERCEPT_INTR);
@@ -2410,7 +2410,7 @@ static int gp_interception(struct kvm_vcpu *vcpu)
 	 * VMware backdoor emulation on #GP interception only handles
 	 * IN{S}, OUT{S}, and RDPMC, and only for L1.
 	 */
-	if (!enable_vmware_backdoor || is_guest_mode(vcpu))
+	if (!kvm_is_vmware_backdoor_enabled(vcpu) || is_guest_mode(vcpu))
 		goto reinject;
 
 	return kvm_emulate_instruction(vcpu, EMULTYPE_VMWARE_GP | EMULTYPE_NO_DECODE);
diff --git a/arch/x86/kvm/vmware.c b/arch/x86/kvm/vmware.c
index 772f295f8ff5..e1062144b750 100644
--- a/arch/x86/kvm/vmware.c
+++ b/arch/x86/kvm/vmware.c
@@ -8,15 +8,35 @@
 
 #include <linux/moduleparam.h>
 
-#include "kvm_emulate.h"
+#include <asm/vmware.h>
+
 #include "vmware.h"
 
-bool __read_mostly enable_vmware_backdoor;
-EXPORT_SYMBOL_FOR_KVM_INTERNAL(enable_vmware_backdoor);
+static bool __read_mostly enable_vmware_backdoor;
 module_param(enable_vmware_backdoor, bool, 0444);
 
-bool is_vmware_backdoor_pmc(u32 pmc_idx)
+#define VMWARE_BACKDOOR_PMC_HOST_TSC		0x10000
+#define VMWARE_BACKDOOR_PMC_REAL_TIME		0x10001
+#define VMWARE_BACKDOOR_PMC_APPARENT_TIME	0x10002
+
+bool kvm_is_vmware_backdoor_enabled(struct kvm_vcpu *vcpu)
 {
+	return enable_vmware_backdoor;
+}
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_is_vmware_backdoor_enabled);
+
+bool kvm_is_vmware_io_port(struct kvm_vcpu *vcpu, u16 port)
+{
+	return kvm_is_vmware_backdoor_enabled(vcpu) &&
+	       (port == VMWARE_HYPERVISOR_PORT ||
+		port == VMWARE_HYPERVISOR_PORT_HB);
+}
+
+bool kvm_is_vmware_backdoor_pmc(struct kvm_vcpu *vcpu, u32 pmc_idx)
+{
+	if (!kvm_is_vmware_backdoor_enabled(vcpu))
+		return false;
+
 	switch (pmc_idx) {
 	case VMWARE_BACKDOOR_PMC_HOST_TSC:
 	case VMWARE_BACKDOOR_PMC_REAL_TIME:
@@ -26,7 +46,38 @@ bool is_vmware_backdoor_pmc(u32 pmc_idx)
 	return false;
 }
 
-int kvm_pmu_rdpmc_vmware(struct kvm_vcpu *vcpu, unsigned int idx, u64 *data)
+bool kvm_is_vmware_backdoor_opcode(u8 opcode_len, u8 opcode)
+{
+	switch (opcode_len) {
+	case 1:
+		switch (opcode) {
+		case 0xe4:	/* IN */
+		case 0xe5:
+		case 0xec:
+		case 0xed:
+		case 0xe6:	/* OUT */
+		case 0xe7:
+		case 0xee:
+		case 0xef:
+		case 0x6c:	/* INS */
+		case 0x6d:
+		case 0x6e:	/* OUTS */
+		case 0x6f:
+			return true;
+		}
+		break;
+	case 2:
+		switch (opcode) {
+		case 0x33:	/* RDPMC */
+			return true;
+		}
+		break;
+	}
+
+	return false;
+}
+
+int kvm_vmware_pmu_rdpmc(struct kvm_vcpu *vcpu, unsigned int idx, u64 *data)
 {
 	u64 ctr_val;
 
@@ -48,34 +99,3 @@ int kvm_pmu_rdpmc_vmware(struct kvm_vcpu *vcpu, unsigned int idx, u64 *data)
 	*data = ctr_val;
 	return 0;
 }
-
-bool is_vmware_backdoor_opcode(struct x86_emulate_ctxt *ctxt)
-{
-	switch (ctxt->opcode_len) {
-	case 1:
-		switch (ctxt->b) {
-		case 0xe4:	/* IN */
-		case 0xe5:
-		case 0xec:
-		case 0xed:
-		case 0xe6:	/* OUT */
-		case 0xe7:
-		case 0xee:
-		case 0xef:
-		case 0x6c:	/* INS */
-		case 0x6d:
-		case 0x6e:	/* OUTS */
-		case 0x6f:
-			return true;
-		}
-		break;
-	case 2:
-		switch (ctxt->b) {
-		case 0x33:	/* RDPMC */
-			return true;
-		}
-		break;
-	}
-
-	return false;
-}
diff --git a/arch/x86/kvm/vmware.h b/arch/x86/kvm/vmware.h
index debabaff9654..bf250cc6e232 100644
--- a/arch/x86/kvm/vmware.h
+++ b/arch/x86/kvm/vmware.h
@@ -4,19 +4,10 @@
 
 #include <linux/kvm_host.h>
 
-struct x86_emulate_ctxt;
-
-#define VMWARE_BACKDOOR_PMC_HOST_TSC		0x10000
-#define VMWARE_BACKDOOR_PMC_REAL_TIME		0x10001
-#define VMWARE_BACKDOOR_PMC_APPARENT_TIME	0x10002
-
-#define VMWARE_PORT_VMPORT	(0x5658)
-#define VMWARE_PORT_VMRPC	(0x5659)
-
-extern bool enable_vmware_backdoor;
-
-bool is_vmware_backdoor_pmc(u32 pmc_idx);
-int kvm_pmu_rdpmc_vmware(struct kvm_vcpu *vcpu, unsigned int idx, u64 *data);
-bool is_vmware_backdoor_opcode(struct x86_emulate_ctxt *ctxt);
+bool kvm_is_vmware_backdoor_enabled(struct kvm_vcpu *vcpu);
+bool kvm_is_vmware_io_port(struct kvm_vcpu *vcpu, u16 port);
+bool kvm_is_vmware_backdoor_pmc(struct kvm_vcpu *vcpu, u32 pmc_idx);
+bool kvm_is_vmware_backdoor_opcode(u8 opcode_len, u8 opcode);
+int kvm_vmware_pmu_rdpmc(struct kvm_vcpu *vcpu, unsigned int idx, u64 *data);
 
 #endif /* __KVM_X86_VMWARE_H */
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index d407eecf1034..edcc5714cb6f 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -918,7 +918,7 @@ void vmx_update_exception_bitmap(struct kvm_vcpu *vcpu)
 	 * We intercept those #GP and allow access to them anyway
 	 * as VMware does.
 	 */
-	if (enable_vmware_backdoor)
+	if (kvm_is_vmware_backdoor_enabled(vcpu))
 		eb |= (1u << GP_VECTOR);
 	if ((vcpu->guest_debug &
 	     (KVM_GUESTDBG_ENABLE | KVM_GUESTDBG_USE_SW_BP)) ==
@@ -5483,7 +5483,7 @@ static int handle_exception_nmi(struct kvm_vcpu *vcpu)
 		error_code = vmcs_read32(VM_EXIT_INTR_ERROR_CODE);
 
 	if (!vmx->rmode.vm86_active && is_gp_fault(intr_info)) {
-		WARN_ON_ONCE(!enable_vmware_backdoor);
+		WARN_ON_ONCE(!kvm_is_vmware_backdoor_enabled(vcpu));
 
 		/*
 		 * VMware backdoor emulation on #GP interception only handles
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 389ae6213c85..0548e34bf634 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -6402,7 +6402,7 @@ int x86_emulate_instruction(struct kvm_vcpu *vcpu, gpa_t cr2_or_gpa,
 	}
 
 	if ((emulation_type & EMULTYPE_VMWARE_GP) &&
-	    !is_vmware_backdoor_opcode(ctxt)) {
+	    !kvm_is_vmware_backdoor_opcode(ctxt->opcode_len, ctxt->b)) {
 		kvm_queue_exception_e(vcpu, GP_VECTOR, 0);
 		return 1;
 	}
-- 
2.53.0

