Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794377141;
	b=aBjloAJ41XL0oyyEuPoUelDHoLxIqcSvFThQIUuotZtWLFhrMRXNI4mNjdf3CkmUGWTe
	 aOUEI3tnp50sdx9RhMX0tGHmGPZz2MXO4SprxKwNKaj91hq1zFB+ryyEtlpYlUOo0jkur
	 i0d+J/EdOsOIplFMcKdg3UiQB44wf20g+HESe0eEth8dcfQsvhLv1HtwTeS/d/aWm+YrO
	 LJCZg3ZqVZgsnzbFKc/8DFlCW18EJUHrpos0ryDPYKJPqiSU6cp7+uaO9KYaT5YZta5HM
	 aaHQBwfBu6A6lJKp9QySZBnORW0FzpEfzuxmngDGctxIUGc1ijDrLv6edFbQRorXZLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794377141;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=T0vffWeHSGD3k7NLrO/VgvIul7kmB79aWon4u9r87LM=;
	b=AqtORrMcBCxNju4gAFmZBXMmczdeSftarJ8P6JvAOzTd4ZUCdnJHnhuWkfqIypHHuu6V
	 Zij+Qpx8yJ3UXBbUgv8kx174lkeFknPJHCZUc15eWuxDjJjwAOMNx5nL71pCJs3GCKVA2
	 iKXm91NiSMCB0rHHpO4FWpVUcQJTbjbkqv2ZnLKEhHuN60L8I/U3szKWEPcIsSbbJceBI
	 dZS9Jgge5GIYBx2dZNRozp93FwuwDjvKlSz7dzaznJDf58Wq0t00p8z6JLVTsoIhOl9fW
	 cKFblOCvzpKc4lrLr0r/I2ub5LnxHHb4arxiZNfLzvvMcv3OHCcU22NI2sI48jqBDzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=LGgxWlmg;
	arc=none smtp.remote-ip=209.85.215.228
Received: from mail-pg1-f228.google.com (mail-pg1-f228.google.com [209.85.215.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 440A3606A327
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 06:05:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 440A3606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=LGgxWlmg
Received: by mail-pg1-f228.google.com with SMTP id 41be03b00d2f7-cdba1b5ed8dso1339892a12.1
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 22:05:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794377140; x=1794981940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T0vffWeHSGD3k7NLrO/VgvIul7kmB79aWon4u9r87LM=;
        b=oE2Bla6F87SPGr8wryPclzUq343/HDAg288DXvD6bJaoQuOfr6DnzDXyb6SdzVmVJt
         aKrgNwBNHtrcftn0Xv1nSbM2uYfeDZHeOFiEc0bnz0pUl1biCOHd+TPnUcPzlHhLDbg1
         YO92Smh+HPmgeA3cOi8SG8mUiO8ZSOaQsJQBU21CleW93wgxkN3GwNsy0AtDyC4T6O7s
         qQIzEkgp0F8dIEOXXmOjH6gxycH4qsBKllp0IbEbv2ErWygcxI1bL1D/ygVHtoSsEG3U
         mp8pujAAcSkuw4/XdSCyi6sMuDX/CQEURwJCYrvVEmt1BixXlbwjBG1xIK41pSc+G5ha
         40Ig==
X-Forwarded-Encrypted: i=1; AL+hErE9OE0Y1OlenOrr13ZhARf+1474fnMXOTu+SMJ4HnqmK4OfRD4rsjYWtNPQAbZcMYz2QQeFbPzUUH4xNWaHeNs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/3Zpt9OYQNl+24vLmfRBb+fFunSLuEuDKwQH8Crb+zpArhtBX2
	Twc68m7wkD2AF4whKNWUDF7yqaM+rAQcdEcF5s8Klz1U7lcZZOEq58dwbIdlxFLT2GUj/UEfzP0
	xO7H2AQrNtvQ2r5c3XF65lgs3zOrKUf8rykfgk0Gnpc8RDPw5SvsnfYXSUcdDS6jHYvomb4QA7K
	QiRegJh6Tus9ynPsSGQyUKg3HBlxboX8582G2XJLhrk27wjeCyWjt1h0u5UwjffSsdUpZY70l8o
	LtQ72YmsDmJfqgOE9hX
X-Gm-Gg: AYBFou0T8+54I0a56eUDyQ4y+QuYWTWYpqx/FS0kTUVP30j2+5Ty6W1/62Ntup1pTwb
	u0oUw/WsrnZD50b5CL5FIkLkk8u7JMtk5eFiwIEaC9RVW+cqJk67Ytbcq2c3PJIprvVs0Bj+cku
	k654s90Bf+c7DlJv9TGI1ZZz3tri954gPRA6AK14Dfwea3UB0r5wnuCBjdAlI3HvTfSf5+je1x4
	DXUhCMfpma67SQ9fTEXE/90z1r3v3AVFAy7HYWgPg/RXnavwvubTfKPrmieJHVIvxKvuJZb0Wrr
	VASmIyg7eXVlJhtjUSIlBKJD83Lb7sVEze32wjtJgo7ez46gTiuaVsKfFgtwYm3doPOD69UGcC2
	CRZ9nd6O2wjcn/uDju39/0d1iOQXZYasJj+fF/RZb6fqVHgMrmmvq4frS9dWi/jWnrMD2TYjfyl
	bwHhlaDxxKWUypN6kpvH9+NEYxTkcoq+nc
X-Received: by 2002:a17:90b:1804:b0:3ac:b6eb:e0de with SMTP id 98e67ed59e1d1-3b182e0c2a8mr1144604a91.4.1794377140399;
        Tue, 10 Nov 2026 22:05:40 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-22.dlp.protect.broadcom.com. [144.49.247.22])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b182e3010bsm336776a91.4.2026.11.10.22.05.39
        for <linux-kselftest@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Nov 2026 22:05:40 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5ede72654f3so2635426e0c.0
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 22:05:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794377139; x=1794981939; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T0vffWeHSGD3k7NLrO/VgvIul7kmB79aWon4u9r87LM=;
        b=LGgxWlmg+tq/90HMH0gBG241vyGbiNyZY9j7aY+FhkFIBvqpB/mzEtaHiPX84fr/03
         ojwVFDYNxzvT0CLK4pQWyNk3dUgdUVQ50XdoxMo0WfQ7cdlginK8F3Ck3CQ4vfdLxSvy
         RFww54qwNMIhtLRIsHxpRX0kqZ9qkAEII0OQA=
X-Forwarded-Encrypted: i=1; AL+hErEkXdV7htMx1sSXNevpqqXLFfns8jnRM47WPBy4GVv3JmtM2fX3wZF+WWYmNJhDuhH5Jy/KiwnMcE+FaQfqRKk=@vger.kernel.org
X-Received: by 2002:a05:620a:1723:b0:93f:3193:ac09 with SMTP id af79cd13be357-947ae82011emr309711485a.15.1794376830279;
        Tue, 10 Nov 2026 22:00:30 -0800 (PST)
X-Received: by 2002:a05:620a:1723:b0:93f:3193:ac09 with SMTP id af79cd13be357-947ae82011emr309704885a.15.1794376829606;
        Tue, 10 Nov 2026 22:00:29 -0800 (PST)
Received: from vertex.localdomain (pool-173-49-113-140.phlapa.fios.verizon.net. [173.49.113.140])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e7e7f3bsm411506885a.37.2026.11.10.22.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 22:00:28 -0800 (PST)
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
Subject: [PATCH v3 07/12] KVM: x86: Route nested VMware backdoors to KVM
Date: Wed, 11 Nov 2026 00:59:56 -0500
Message-ID: <e03558351edde6ccd508fb38d9c2fd63e85370db.1794374897.git.zack.rusin@broadcom.com>
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

Add KVM_VMWARE_ENABLE_NESTED_BACKDOOR.  When it and the backdoor flag
are both enabled, handle the #GP from a CPL3 VMware backdoor I/O access
in L2 in KVM, as for L1, even if L1 intercepts #GP.  Treat an access as
a backdoor access only if EAX holds VMware's magic value and DX selects
one of the two backdoor ports; L1 keeps receiving every other #GP.

VMware Tools use the I/O-port backdoor from user mode and rely on the
hypervisor ignoring the I/O permission checks for the backdoor ports.
When Hyper-V runs in the guest, e.g. for Windows virtualization-based
security (VBS), Windows and the Tools run as L2.  The access then
raises #GP and normal nested routing delivers it to Hyper-V, which
doesn't implement the backdoor.

Make the routing opt-in, because a nested hypervisor that implements
the backdoor itself, such as ESXi, has to keep receiving its guests'
accesses.  Cover only the I/O-port backdoor; L2 VMCALL and VMMCALL
handling doesn't change.

On VMX, claim the exit in nested_vmx_l0_wants_exit().  On SVM, a #GP
that L0 intercepts always reaches gp_interception() first, which
reinjects any #GP that KVM doesn't handle so that it reaches L1 if L1
intercepts #GP; check the filter there.

Link: https://lore.kernel.org/r/CADH9ctAGt_VriKA7Ch1L9U+xud-6M54GzaPOM_2sSA780TpAYw@mail.gmail.com
Link: https://lore.kernel.org/r/CABgObfb3Ttfg6H+_RpNQGSYKw9BLEwx3+EysXdL-wbpd1pkGHQ@mail.gmail.com
Link: https://lore.kernel.org/r/aAjrOgsooR4RYIJr@google.com
Link: https://lore.kernel.org/r/aIEnm7Y1VN-PCfF8@google.com
Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
---
 Documentation/virt/kvm/api.rst  |  9 +++++++++
 arch/x86/include/uapi/asm/kvm.h |  1 +
 arch/x86/kvm/svm/svm.c          |  7 +++++--
 arch/x86/kvm/vmware.c           |  8 ++++++++
 arch/x86/kvm/vmware.h           | 22 ++++++++++++++++++++++
 arch/x86/kvm/vmx/nested.c       |  5 +++++
 arch/x86/kvm/x86.c              |  3 ++-
 7 files changed, 52 insertions(+), 3 deletions(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index e2f0e329f748..14ce68600551 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -9293,6 +9293,15 @@ exception by setting ``vmware.hcall.exception.inject`` and filling in the
 validated vector, error code, and address fields.  When an exception is
 requested, KVM does not advance past the hypercall instruction.
 
+``KVM_VMWARE_ENABLE_NESTED_BACKDOOR`` makes KVM handle VMware backdoor I/O
+from a nested guest itself, even when the nested hypervisor intercepts #GP.
+KVM claims only a #GP raised at CPL3 while EAX holds VMware's magic value and
+DX holds one of the two backdoor ports; the nested hypervisor still receives
+every other #GP, and VMCALL/VMMCALL from the nested guest are not affected.
+This is needed, for example, for a Windows guest with Hyper-V VBS enabled:
+Hyper-V does not implement the VMware backdoor used by VMware Tools.  This
+flag has an effect only when ``KVM_VMWARE_ENABLE_BACKDOOR`` is also enabled.
+
 8. Other capabilities.
 ======================
 
diff --git a/arch/x86/include/uapi/asm/kvm.h b/arch/x86/include/uapi/asm/kvm.h
index 3b9f53bce2d9..18c2d908eaa2 100644
--- a/arch/x86/include/uapi/asm/kvm.h
+++ b/arch/x86/include/uapi/asm/kvm.h
@@ -968,6 +968,7 @@ struct kvm_hyperv_eventfd {
 
 #define KVM_VMWARE_ENABLE_BACKDOOR	_BITULL(0)
 #define KVM_VMWARE_ENABLE_HYPERCALL	_BITULL(1)
+#define KVM_VMWARE_ENABLE_NESTED_BACKDOOR _BITULL(2)
 
 struct kvm_vmware_exit {
 #define KVM_EXIT_VMWARE_HCALL	1
diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index a2196d8f60aa..bae7065fb360 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -2408,9 +2408,12 @@ static int gp_interception(struct kvm_vcpu *vcpu)
 
 	/*
 	 * VMware backdoor emulation on #GP interception only handles
-	 * IN{S}, OUT{S}, and RDPMC, and only for L1.
+	 * IN{S}, OUT{S}, and RDPMC.  Handle L2 accesses only when userspace
+	 * explicitly requests that L0 own the nested VMware backdoor.
 	 */
-	if (!kvm_is_vmware_backdoor_enabled(vcpu) || is_guest_mode(vcpu))
+	if (!kvm_is_vmware_backdoor_enabled(vcpu) ||
+	    (is_guest_mode(vcpu) &&
+	     !kvm_is_vmware_nested_backdoor(vcpu, svm_get_cpl(vcpu))))
 		goto reinject;
 
 	return kvm_emulate_instruction(vcpu, EMULTYPE_VMWARE_GP | EMULTYPE_NO_DECODE);
diff --git a/arch/x86/kvm/vmware.c b/arch/x86/kvm/vmware.c
index 8407dccf81fd..066f033e7ea3 100644
--- a/arch/x86/kvm/vmware.c
+++ b/arch/x86/kvm/vmware.c
@@ -117,6 +117,14 @@ int kvm_vmware_hypercall(struct kvm_vcpu *vcpu)
 	return 0;
 }
 
+bool kvm_is_vmware_nested_backdoor(struct kvm_vcpu *vcpu, u32 cpl)
+{
+	return kvm_is_vmware_nested_backdoor_enabled(vcpu->kvm) && cpl == 3 &&
+	       lower_32_bits(kvm_rax_read_raw(vcpu)) == VMWARE_HYPERVISOR_MAGIC &&
+	       kvm_is_vmware_io_port(vcpu, kvm_rdx_read_raw(vcpu));
+}
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_is_vmware_nested_backdoor);
+
 bool kvm_is_vmware_io_port(struct kvm_vcpu *vcpu, u16 port)
 {
 	return kvm_is_vmware_backdoor_enabled(vcpu) &&
diff --git a/arch/x86/kvm/vmware.h b/arch/x86/kvm/vmware.h
index de1dc8971ec6..e2ba0b8b4400 100644
--- a/arch/x86/kvm/vmware.h
+++ b/arch/x86/kvm/vmware.h
@@ -24,9 +24,19 @@ kvm_is_vmware_backdoor_enabled(struct kvm_vcpu *vcpu)
 }
 
 bool kvm_is_vmware_hypercall(struct kvm_vcpu *vcpu);
+
+static __always_inline bool
+kvm_is_vmware_nested_backdoor_enabled(struct kvm *kvm)
+{
+	return kvm_is_vmware_cap_enabled(kvm, KVM_VMWARE_ENABLE_BACKDOOR) &&
+	       kvm_is_vmware_cap_enabled(kvm,
+					 KVM_VMWARE_ENABLE_NESTED_BACKDOOR);
+}
+
 bool kvm_is_vmware_io_port(struct kvm_vcpu *vcpu, u16 port);
 bool kvm_is_vmware_backdoor_pmc(struct kvm_vcpu *vcpu, u32 pmc_idx);
 bool kvm_is_vmware_backdoor_opcode(u8 opcode_len, u8 opcode);
+bool kvm_is_vmware_nested_backdoor(struct kvm_vcpu *vcpu, u32 cpl);
 
 #else /* !CONFIG_KVM_VMWARE */
 
@@ -52,6 +62,12 @@ static __always_inline bool kvm_is_vmware_hypercall(struct kvm_vcpu *vcpu)
 	return false;
 }
 
+static __always_inline bool
+kvm_is_vmware_nested_backdoor_enabled(struct kvm *kvm)
+{
+	return false;
+}
+
 static __always_inline bool
 kvm_is_vmware_io_port(struct kvm_vcpu *vcpu, u16 port)
 {
@@ -70,6 +86,12 @@ kvm_is_vmware_backdoor_opcode(u8 opcode_len, u8 opcode)
 	return false;
 }
 
+static __always_inline bool
+kvm_is_vmware_nested_backdoor(struct kvm_vcpu *vcpu, u32 cpl)
+{
+	return false;
+}
+
 #endif /* CONFIG_KVM_VMWARE */
 
 void kvm_vmware_init_vm(struct kvm *kvm);
diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
index 1a98f28651f7..2d1297036564 100644
--- a/arch/x86/kvm/vmx/nested.c
+++ b/arch/x86/kvm/vmx/nested.c
@@ -18,6 +18,7 @@
 #include "posted_intr.h"
 #include "sgx.h"
 #include "trace.h"
+#include "vmware.h"
 #include "vmx.h"
 #include "smm.h"
 #include "x86_ops.h"
@@ -6490,6 +6491,10 @@ static bool nested_vmx_l0_wants_exit(struct kvm_vcpu *vcpu,
 			return true;
 		else if (is_ve_fault(intr_info))
 			return true;
+		else if (is_gp_fault(intr_info) &&
+			 kvm_is_vmware_nested_backdoor(vcpu,
+						       vmx_get_cpl(vcpu)))
+			return true;
 		return false;
 	case EXIT_REASON_EXTERNAL_INTERRUPT:
 		return true;
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index bd4142763f10..6b6ed02d6063 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -119,7 +119,8 @@ EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_host);
 #define KVM_CAP_PMU_VALID_MASK KVM_PMU_CAP_DISABLE
 
 #define KVM_CAP_VMWARE_VALID_MASK (KVM_VMWARE_ENABLE_BACKDOOR | \
-				   KVM_VMWARE_ENABLE_HYPERCALL)
+				   KVM_VMWARE_ENABLE_HYPERCALL | \
+				   KVM_VMWARE_ENABLE_NESTED_BACKDOOR)
 
 #define KVM_GUESTDBG_VALID_MASK \
 	(KVM_GUESTDBG_ENABLE | \
-- 
2.53.0

