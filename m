Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794377305;
	b=YUBl6P17hjWRW6+mKHIxKp0YHUvlr/jlvXTYgNDqmrz5VTUtzr5AybeH/aJTkZ3NNdMI
	 bkfkNNWWGxp7R8gCC8aUQlgH8+TWbMJJ8bhrWLWqgdlrrdxSZF9r+Ske31k48AWMR47eb
	 3HfZfIyXDO17Ut00eup78aIRsIOd53pUx1ZZX8sWygi8NaWmASgyXikQQgQbRWP98jqPy
	 rfXKGnpCruzELRZ7d7i5mzFgJvHYNcm5Jef546HYuQMN/nJ1SMip26zcZanz3z38tan1D
	 N+T7UhE+cBZhBs36n7tJVGVzeIhxu0ZOmZ7UMI+7ZEOPUBDjE5hmmv/PFVXx5RGNQjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794377305;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=B1ce/0HX8S5HEpDkr1kWRGR30QWdYXAqQvY9XUkGSaI=;
	b=00E8yiT3KXsnbnd9Sd74HirOyH7fvmtIf4vNB2x/G302gXVe7lkPygXM5jUhN9pDVfSS
	 ZpGOhJmFl9zGdXAXtEgIyrkjcNsHUnEMsXZn7UFcqpYC8DkYJEJFmLJVM1mpX4TDSoAFm
	 X231EjkYzDJa9b0pNt8RhWNOoToYs5zHsGKsrbfjodyeO5XvOLPO5Ml9I+xX4rvmhQE3a
	 h/XUFR1Q+2TbgoZkVPWkomGXJrTgdsqyPu/SE0rb2zp4P+Vjz5IFIndUioN0fTHk1uVOE
	 QOC668WUdxV8c8dge04+oSHfUwAXj/MtT+SDrsxh52sQmycb9Ix+gLWb/CQLQnUqUdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="Tc/ARKLN";
	arc=none smtp.remote-ip=209.85.215.227
Received: from mail-pg1-f227.google.com (mail-pg1-f227.google.com [209.85.215.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF9D60A260E
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 06:08:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DF9D60A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Tc/ARKLN
Received: by mail-pg1-f227.google.com with SMTP id 41be03b00d2f7-cc4aa18f9afso1181079a12.3
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 22:08:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794377305; x=1794982105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B1ce/0HX8S5HEpDkr1kWRGR30QWdYXAqQvY9XUkGSaI=;
        b=sRTWGsoldUIUYHQ56HSEghaUZCUiWRcwuBKG5PJeNJpW42r3Z2pLMofLJM3pGs+c/I
         1taIZQzzJdA0J0WI+8iHK/ijZWSf9qHDsu+6URJNI7DMZoJBgKSb4XrN3WjDl2edHpfd
         gcorLvBUlQpJ0pKPKZYVUYhYt15sFvlPC41fi7ibvFOvEF+Aunys1+oXBHJyYI9wUA9G
         cS+lyj4WuuaepgrnYNoMSl2V8t/f2cQ8Faq/IlLYaAYk3P8ycz8sRUCdLzrl8H47AcMi
         Dzu0Baa2AquFIXggmez7lWsM3aRXTp6eKISaegNtTjn18EcCMWNwBt1WFPN5rhYUQMjS
         HcDg==
X-Forwarded-Encrypted: i=1; AL+hErGonqIw2bxVtl+z7j3BULQEEzkwiWI6M7ue5K4TGvxsLZ19T5naDO82HNqCPtnzo6m1cdERl32d9e3rLvcYoBE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8nBU/7nQZ/11cAGWnL76aV2HC9Gmg6cj6F3kyzp6DYOg/RjMyk
	SZ0M3Cm9fBN+kpK8yXMdxmwBu+HXWWe/K0PIfd8YMYvf+O6LTbeg2aJW9PkdM1cZpJ00J5DEKFf
	gkY6sF1h1QYpVXWqnOvipboFzfdod1X27RtTD1tlEb73aWssMQAmmWPoBxs2UJqeEsls7nskUGy
	mCwX+TzLJ6rEGI3UbawFxwEMTRINVJBQ9LrQQ71vVBVYrIaHHgX8dI/QHNWsJb8G12McnenIRLz
	n9ER3E4OLCL7yrE4MXJ
X-Gm-Gg: AYBFou1ryNbRCa9HUIp/opR1LUDpoXE1ehLX+iP+F8uluvMnhwhAHLGvLxCuFgTn5DM
	9wUnoFxoGNjqnzTPtxKRj4UyOSeY+fB5xGwHVAd/5HJb/uEEDLNdVZeX6jEdb8+jXvh66mHvZUL
	atwoOXw79ox3p/oiwIvh715MCJGwwBz0njtUov30RuFvZ1B1llocHRg59IEWkGiZeYD8kApV+3g
	sjMjE6Bkt4jIVm6+bu4UaREtqX04a/ySr72bfmexCSlZe5bdgZnfdabCsWFP26I3gkluRhxRgQS
	lx+I6v996atCRakeso2vXpyFScUfuwYa+f8n2YSGmeLkHeRYkUauCfPqxf2DpHevGcJKQmyAXwh
	z+1Pe31h0ZgYTsLY005cK0yPMubQKsERYovMdiTNmt1ao/Hd19ClCNqK0LoplzgIXXJUL6M+BqJ
	eaXyDEShsG5MN7GfvSyieZczrLgJH4uxqq
X-Received: by 2002:a17:90b:3904:b0:3b0:99f8:eba8 with SMTP id 98e67ed59e1d1-3b182f8ba20mr1612162a91.66.1794377304709;
        Tue, 10 Nov 2026 22:08:24 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-22.dlp.protect.broadcom.com. [144.49.247.22])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b182916a77sm480262a91.0.2026.11.10.22.08.24
        for <linux-kselftest@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Nov 2026 22:08:24 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9440b27c1feso460185185a.2
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 22:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794377303; x=1794982103; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B1ce/0HX8S5HEpDkr1kWRGR30QWdYXAqQvY9XUkGSaI=;
        b=Tc/ARKLN3cinbbwk0MZM8skomr0jiKUpfoeTcJJgTDeaCP4u2ffYSzxzWtT5s4sMXW
         Zd6RD7JR/H3JxmMmtDUqK1RZ9M4bbY49+zcC/0FtLoDywgfn3jmxIB42NsibInVAQPOX
         q+3cstVrrVM9uJ+Gh74RWtjpGvyX3Hgus+XbY=
X-Forwarded-Encrypted: i=1; AL+hErEOdmISLnmZolHALdTRjoENnSgw2xfR2zsPdE6LuQmHbjkLhHsvXPkkHVFaWSwgCl37QtRuwX08r1sCq6V+1MQ=@vger.kernel.org
X-Received: by 2002:a05:620a:3955:b0:93b:d7a2:83cc with SMTP id af79cd13be357-947b001b12amr197203385a.59.1794376819161;
        Tue, 10 Nov 2026 22:00:19 -0800 (PST)
X-Received: by 2002:a05:620a:3955:b0:93b:d7a2:83cc with SMTP id af79cd13be357-947b001b12amr197197385a.59.1794376818670;
        Tue, 10 Nov 2026 22:00:18 -0800 (PST)
Received: from vertex.localdomain (pool-173-49-113-140.phlapa.fios.verizon.net. [173.49.113.140])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e7e7f3bsm411506885a.37.2026.11.10.22.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 22:00:14 -0800 (PST)
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
Subject: [PATCH v3 04/12] KVM: x86: Add CONFIG_KVM_VMWARE
Date: Wed, 11 Nov 2026 00:59:53 -0500
Message-ID: <f58eca0b702b6e57d87ca367a7693793e619d3d1.1794374897.git.zack.rusin@broadcom.com>
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

Add CONFIG_KVM_VMWARE, defaulting to "y", to control whether KVM's
VMware emulation is built.  When it is disabled, vmware.o isn't built,
the VMware predicates are compile-time false, and the
enable_vmware_backdoor module parameter doesn't exist: a
kvm.enable_vmware_backdoor setting is ignored, and modprobe warns about
an unknown parameter.

VMware emulation is only useful to VMware-aware guests and to VMMs that
offer VMware compatibility.  Let kernels that don't need it, e.g. to
reduce the attack surface exposed to guests, leave it out, as they can
already do for Hyper-V and Xen emulation.  Default to "y" so that
existing configurations keep the backdoor and its module parameter.

Provide __always_inline stubs for the predicates that gate VMware
behavior, so that callers need no #ifdefs and the compiler drops the
dead branches.  Leave the operations behind the predicates declared but
undefined when the option is disabled: a call that isn't guarded by a
predicate then fails to link instead of silently doing nothing.

Suggested-by: Sean Christopherson <seanjc@google.com>
Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Link: https://lore.kernel.org/r/Zy0__5YB9F5d0eZn@google.com
Link: https://lore.kernel.org/r/e3f943a7-a40a-45cb-b0d9-e3ed58344d8b@redhat.com
Link: https://lore.kernel.org/r/aIEmawm9gLflg8zt@google.com
Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
---
 arch/x86/kvm/Kconfig  | 12 ++++++++++++
 arch/x86/kvm/Makefile |  4 ++--
 arch/x86/kvm/vmware.h | 31 +++++++++++++++++++++++++++++++
 3 files changed, 45 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/Kconfig b/arch/x86/kvm/Kconfig
index 1719059570fb..b34d6d0e30c9 100644
--- a/arch/x86/kvm/Kconfig
+++ b/arch/x86/kvm/Kconfig
@@ -212,6 +212,18 @@ config KVM_HYPERV
 
 	  If unsure, say "Y".
 
+config KVM_VMWARE
+	bool "VMware guest support"
+	depends on KVM_X86
+	default y
+	help
+	  Provides KVM support for emulating VMware interfaces. VMware-aware
+	  guests use these interfaces to communicate with the hypervisor.
+	  Userspace hypervisors can also use them to provide VMware
+	  compatibility to their guests.
+
+	  If unsure, say "Y".
+
 config KVM_XEN
 	bool "Support for Xen hypercall interface"
 	depends on KVM_X86
diff --git a/arch/x86/kvm/Makefile b/arch/x86/kvm/Makefile
index 0cb47cfc1162..794c847ccecc 100644
--- a/arch/x86/kvm/Makefile
+++ b/arch/x86/kvm/Makefile
@@ -6,13 +6,13 @@ ccflags-$(CONFIG_KVM_WERROR) += -Werror
 include $(srctree)/virt/kvm/Makefile.kvm
 
 kvm-y			+= x86.o emulate.o irq.o lapic.o cpuid.o msrs.o pmu.o regs.o \
-			   mtrr.o debugfs.o mmu/mmu.o mmu/page_track.o mmu/spte.o \
-			   vmware.o
+			   mtrr.o debugfs.o mmu/mmu.o mmu/page_track.o mmu/spte.o
 
 kvm-$(CONFIG_X86_64) += mmu/tdp_iter.o mmu/tdp_mmu.o
 kvm-$(CONFIG_KVM_IOAPIC) += i8259.o i8254.o ioapic.o
 kvm-$(CONFIG_KVM_HYPERV) += hyperv.o
 kvm-$(CONFIG_KVM_XEN)	+= xen.o
+kvm-$(CONFIG_KVM_VMWARE) += vmware.o
 kvm-$(CONFIG_KVM_SMM)	+= smm.o
 
 kvm-intel-y		+= vmx/vmx.o vmx/vmenter.o vmx/pmu_intel.o vmx/vmcs12.o \
diff --git a/arch/x86/kvm/vmware.h b/arch/x86/kvm/vmware.h
index bf250cc6e232..5951e419e1a7 100644
--- a/arch/x86/kvm/vmware.h
+++ b/arch/x86/kvm/vmware.h
@@ -4,10 +4,41 @@
 
 #include <linux/kvm_host.h>
 
+#ifdef CONFIG_KVM_VMWARE
+
 bool kvm_is_vmware_backdoor_enabled(struct kvm_vcpu *vcpu);
 bool kvm_is_vmware_io_port(struct kvm_vcpu *vcpu, u16 port);
 bool kvm_is_vmware_backdoor_pmc(struct kvm_vcpu *vcpu, u32 pmc_idx);
 bool kvm_is_vmware_backdoor_opcode(u8 opcode_len, u8 opcode);
+
+#else /* !CONFIG_KVM_VMWARE */
+
+static __always_inline bool
+kvm_is_vmware_backdoor_enabled(struct kvm_vcpu *vcpu)
+{
+	return false;
+}
+
+static __always_inline bool
+kvm_is_vmware_io_port(struct kvm_vcpu *vcpu, u16 port)
+{
+	return false;
+}
+
+static __always_inline bool
+kvm_is_vmware_backdoor_pmc(struct kvm_vcpu *vcpu, u32 pmc_idx)
+{
+	return false;
+}
+
+static __always_inline bool
+kvm_is_vmware_backdoor_opcode(u8 opcode_len, u8 opcode)
+{
+	return false;
+}
+
+#endif /* CONFIG_KVM_VMWARE */
+
 int kvm_vmware_pmu_rdpmc(struct kvm_vcpu *vcpu, unsigned int idx, u64 *data);
 
 #endif /* __KVM_X86_VMWARE_H */
-- 
2.53.0

