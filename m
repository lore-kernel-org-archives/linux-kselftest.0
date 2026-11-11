Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794376855;
	b=qdLYO0WeWsWeIwVAml4CcZxTsMAOaOLgHzzv/961D8TkQLtJwhAAa8t7UNkXeO4YTud3
	 IIlhgJ9L45eSw6R8iKJF6ZkgJBgysqyVgExGo2efyhVpYf5YkNqSBuyTHqhLSa889nubv
	 K+tvHRy54xmsqIGM0/P60RN9p0+3anpncxW4Sn5WRz6JlF0PJ4/g2H979sL8TcC1Zsg2u
	 e8ckewhpaXcDtTuZWWKqwOzO+WYi46FzhdUUfCvfzJD1Pd7rp7mUbI8t89HSYpo9KOpM+
	 XKDU/nXe5YMxz4CFyM6DuxsIL/a+Q3oEFFu3Lq3mQquxAx70qe8eqc2NhZiGDAmJQew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794376855;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=yUu1/mKZm+Up6njBU/bttM2RPCbWdwFakUfLnH9Qrec=;
	b=a6Ko+WAnYNZdWuDBeObrFtx161DkZ7j/xeYa8pSJyZajFV5Hz2F+QOiz5195EZPQjgH4
	 lshDvo9EvIhhOUOCfJyxoIE3R1fw6m+b1cTAsZId8hxPBNMTICu6RAzBPi2oIrRsNqL7m
	 eQgCkvMlRAhN+BRGd2P1r2JiM6i8K2tLUuHWQ3+LpmLEDVnaSsiNdFQWYZaJ2oEZuKhw7
	 qf+fLeQqko8t6JDNsiOVn2m9sea6uUF3L8iMx6epUmKuoz4PWlbBzjuOuFxK4yRBvF27p
	 VsOZRAx8JDQZPJW8B3QEhlqFUD3Ly58mU5l/t9KX42LiY+nbNqlb6BPdhhyhsolqdcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=iLAZoJyF;
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20AAE60A5BD0
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 06:00:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20AAE60A5BD0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=iLAZoJyF
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3b08a162d4bso1603405a91.3
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 22:00:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794376854; x=1794981654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yUu1/mKZm+Up6njBU/bttM2RPCbWdwFakUfLnH9Qrec=;
        b=XjtPG4rBchBsJxmalAFABziM7844+ZNOCYx+ELICO8aBDfS0wcvZAYCRHZtUoYUY4y
         fLQomyq1K+Osvp83CQJL3z4ctIa4265dqdc4aDia+9rYSFt1+YJ4TI+PRGzE61ymr0R1
         TGOHQJgmrzgeEF1QxoyGJXbA/aeKIkdJFzrAelBLp0aTD4W5E93KCd9Vh97InupGZSPk
         BBFiHauxAiHAHRJtpr3gMqVNuX9n7TZgoFUJZgcXgCKXIpvscafW3+NNhVmlTe9l3Y8u
         ajmwh0NGxrgZ1OCvBZHMaRa3/od6qZbW8yGg/E5ZeBvGsoFZkZiRKkUkh3SaQXEvZsWi
         iR5g==
X-Forwarded-Encrypted: i=1; AL+hErEKc0NU6EevpBb69rFGLQIHUdZpCgzU08b2Vpve4Ngb08N1JpimDYfEeBgvOMFTkMfpoH+rfXSzLoXwSD7CZGQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Efb+bHc59eAgh/hDUxYbPBHZnjkxutFG3XbtoYzJxcyl9J5pk
	ImSZupZyZlxofMlgqZc2uj1fE22Co05WB3pagVawIJGDXfVdfABpODI1fwnf4U1pgvrktFsE2Eq
	sb1v6gTY11Wlit8qDI8lsi2iBR2cb5w357XyDy96SUjxyKRAi+Eh9lvRN3CnZhQwstFm41F0oJn
	Rcb8Bv1IYHPlKr+6QzZpTOo/kiWWSGixySHbQi+lMr9NKuQCXwZNISqGjU1n6RLBuZzzffhX20t
	2KTXz4Fmpmf2jkL6V2K
X-Gm-Gg: AYBFou241aYg+idUBTIsIv3XOgKRrNHPNg8GFDarvfb0bAHolbn2hNuivifS3RaDX0o
	qZ6/mRz0gC4L7R7+JekfmuG/WAc9vcsYEJ4aBhYAHZsjeUSbQJAjIcReAAd8M+kBKBL9Mi/ZBsQ
	n66t0WlHLbxQZE1mtYHByW84HhRsCeeQHozwX6khO48WNW9vZTPbTHBiQudldgwCms1w/dFaxqE
	u0KizDdu/PFQJuB5IdGRYv+74svwPRua6qd78tG/aU4WSZufdaiIFuOG08lyUfZMSlrdProHE2m
	hKPJJVOJsiGk3ldLeeCIIPmpXQTSJraOmZmzOcwCjNURFDGfabMhsLBxrZIRyf9iu30TCsEhat7
	fAX6PwIMBmFnYsKjac5IHPbCpe1KsDsqJ53y1+uNeCcqi/sTM8Hxji1n/P2HQ4w/R+tL4evT94k
	9ugrWLoZZYhRWnBZtw/pW2OciRZelQNpZL
X-Received: by 2002:a17:90b:590c:b0:3a8:699f:959d with SMTP id 98e67ed59e1d1-3b182f28bd7mr1347447a91.31.1794376854337;
        Tue, 10 Nov 2026 22:00:54 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b17e3294bfsm1332881a91.8.2026.11.10.22.00.52
        for <linux-kselftest@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Nov 2026 22:00:54 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f13c143c8so529173085a.3
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 22:00:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794376852; x=1794981652; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yUu1/mKZm+Up6njBU/bttM2RPCbWdwFakUfLnH9Qrec=;
        b=iLAZoJyF8t2AaPkaDAffU8LJSIDhe9NRB/9FWFOnAcPUU8i7r9CfwWCczMMr4OFGoG
         u8bQenf/syo9FDpeQcX/hxltTVA/44t9dBZ3ILTxSQM4bHT1KmQ9FcM1cHGAUZVtFjsB
         KPBsy77OHXb9v5LyLM3mKmNWncGFRTdyi+ieo=
X-Forwarded-Encrypted: i=1; AL+hErHxgjqRBMMbrvQlXWcyGuU8j6UkhjQbr1wiU6DcOD6ZLfJcmn33aHR2lLytnlmH00YDGkljF6UEJ8WVpBhkn3I=@vger.kernel.org
X-Received: by 2002:a05:620a:4156:b0:93f:5593:5750 with SMTP id af79cd13be357-947afd6c0fbmr227815685a.17.1794376851949;
        Tue, 10 Nov 2026 22:00:51 -0800 (PST)
X-Received: by 2002:a05:620a:4156:b0:93f:5593:5750 with SMTP id af79cd13be357-947afd6c0fbmr227809085a.17.1794376851368;
        Tue, 10 Nov 2026 22:00:51 -0800 (PST)
Received: from vertex.localdomain (pool-173-49-113-140.phlapa.fios.verizon.net. [173.49.113.140])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e7e7f3bsm411506885a.37.2026.11.10.22.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 22:00:42 -0800 (PST)
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
Subject: [PATCH v3 11/12] KVM: selftests: Test VMware hypercall exits with nested Hyper-V flushes
Date: Wed, 11 Nov 2026 01:00:00 -0500
Message-ID: <2239b3e439ce19419015d7b2ce4144d5176a884a.1794374897.git.zack.rusin@broadcom.com>
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

Enable VMware hypercall exits in hyperv_evmcs and hyperv_svm_test when
KVM supports them, and issue the first L2 TLB flush hypercall with
VMware's magic value in RAX.

When L1 enables it, L0 handles Hyper-V's L2 TLB flush hypercall itself,
through the same dispatch that forwards VMware hypercalls.  The 64-bit
Hyper-V calling convention doesn't use RAX as an input, so a flush with
VMware's magic value left in RAX must still be handled as a Hyper-V
hypercall instead of exiting to userspace.

Add hyperv_hypercall_rax() to issue a Hyper-V hypercall with a given
value in RAX, and enable the VMware flag again when hyperv_evmcs
restores its state into a new VM.

Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
---
 .../selftests/kvm/include/x86/hyperv.h        | 21 +++++++++++++++
 .../testing/selftests/kvm/x86/hyperv_evmcs.c  | 27 +++++++++++++++----
 .../selftests/kvm/x86/hyperv_svm_test.c       | 21 ++++++++++-----
 3 files changed, 58 insertions(+), 11 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/x86/hyperv.h b/tools/testing/selftests/kvm/include/x86/hyperv.h
index 78003f5a22f3..06d14be3c4ee 100644
--- a/tools/testing/selftests/kvm/include/x86/hyperv.h
+++ b/tools/testing/selftests/kvm/include/x86/hyperv.h
@@ -286,6 +286,27 @@ static inline void hyperv_hypercall(u64 control, gva_t input_address,
 	GUEST_ASSERT((hv_status & 0xffff) == 0);
 }
 
+/*
+ * Issue a Hyper-V hypercall with @rax in RAX, which the 64-bit calling
+ * convention doesn't use as an input, and assert that it succeeded.
+ */
+static inline void hyperv_hypercall_rax(u64 control, gva_t input_address,
+					gva_t output_address, u64 rax)
+{
+	u64 error_code;
+	u8 vector;
+
+	asm volatile("mov %[output_address], %%r8\n\t"
+		     KVM_ASM_SAFE("vmcall")
+		     : "+a" (rax), "+c" (control), "+d" (input_address),
+		       KVM_ASM_SAFE_OUTPUTS(vector, error_code)
+		     : [output_address] "r"(output_address)
+		     : "cc", "memory", "r8", KVM_ASM_SAFE_CLOBBERS);
+
+	GUEST_ASSERT(!vector);
+	GUEST_ASSERT((rax & 0xffff) == 0);
+}
+
 /* Write 'Fast' hypercall input 'data' to the first 'n_sse_regs' SSE regs */
 static inline void hyperv_write_xmm_input(void *data, int n_sse_regs)
 {
diff --git a/tools/testing/selftests/kvm/x86/hyperv_evmcs.c b/tools/testing/selftests/kvm/x86/hyperv_evmcs.c
index c81f2dd4f2a1..cdd4e523c62a 100644
--- a/tools/testing/selftests/kvm/x86/hyperv_evmcs.c
+++ b/tools/testing/selftests/kvm/x86/hyperv_evmcs.c
@@ -18,6 +18,8 @@
 #include "hyperv.h"
 #include "vmx.h"
 
+#define VMWARE_HYPERVISOR_MAGIC	0x564d5868
+
 static int ud_count;
 
 static void guest_ud_handler(struct ex_regs *regs)
@@ -63,9 +65,13 @@ void l2_guest_code(void)
 	vmcall();
 	rdmsr_from_l2(MSR_GS_BASE); /* intercepted */
 
-	/* L2 TLB flush tests */
-	hyperv_hypercall(HVCALL_FLUSH_VIRTUAL_ADDRESS_SPACE | HV_HYPERCALL_FAST_BIT, 0x0,
-			 HV_FLUSH_ALL_VIRTUAL_ADDRESS_SPACES | HV_FLUSH_ALL_PROCESSORS);
+	/*
+	 * L2 TLB flush tests.  Leave VMware's magic value in RAX to check that
+	 * VMware hypercall exits don't claim the flush that L0 handles.
+	 */
+	hyperv_hypercall_rax(HVCALL_FLUSH_VIRTUAL_ADDRESS_SPACE | HV_HYPERCALL_FAST_BIT, 0x0,
+			     HV_FLUSH_ALL_VIRTUAL_ADDRESS_SPACES | HV_FLUSH_ALL_PROCESSORS,
+			     VMWARE_HYPERVISOR_MAGIC);
 	rdmsr_from_l2(MSR_FS_BASE);
 	/*
 	 * Note: hypercall status (RAX) is not preserved correctly by L1 after
@@ -209,6 +215,13 @@ void inject_nmi(struct kvm_vcpu *vcpu)
 	vcpu_events_set(vcpu, &events);
 }
 
+static void vm_enable_vmware_hypercall(struct kvm_vm *vm)
+{
+	if (kvm_check_cap(KVM_CAP_X86_VMWARE) & KVM_VMWARE_ENABLE_HYPERCALL)
+		vm_enable_cap(vm, KVM_CAP_X86_VMWARE,
+			      KVM_VMWARE_ENABLE_HYPERCALL);
+}
+
 static struct kvm_vcpu *save_restore_vm(struct kvm_vm *vm,
 					struct kvm_vcpu *vcpu)
 {
@@ -222,7 +235,9 @@ static struct kvm_vcpu *save_restore_vm(struct kvm_vm *vm,
 	kvm_vm_release(vm);
 
 	/* Restore state in a new VM.  */
-	vcpu = vm_recreate_with_one_vcpu(vm);
+	kvm_vm_restart(vm);
+	vm_enable_vmware_hypercall(vm);
+	vcpu = vm_vcpu_recreate(vm, 0);
 	vcpu_set_hv_cpuid(vcpu);
 	vcpu_enable_evmcs(vcpu);
 	vcpu_load_state(vcpu, state);
@@ -251,7 +266,9 @@ int main(int argc, char *argv[])
 	TEST_REQUIRE(kvm_has_cap(KVM_CAP_HYPERV_ENLIGHTENED_VMCS));
 	TEST_REQUIRE(kvm_hv_cpu_has(HV_X64_NESTED_DIRECT_FLUSH));
 
-	vm = vm_create_with_one_vcpu(&vcpu, guest_code);
+	vm = vm_create(1);
+	vm_enable_vmware_hypercall(vm);
+	vcpu = vm_vcpu_add(vm, 0, guest_code);
 
 	hcall_page = vm_alloc_pages(vm, 1);
 	memset(addr_gva2hva(vm, hcall_page), 0x0,  getpagesize());
diff --git a/tools/testing/selftests/kvm/x86/hyperv_svm_test.c b/tools/testing/selftests/kvm/x86/hyperv_svm_test.c
index 3a3dc31072e8..fe0762ae8260 100644
--- a/tools/testing/selftests/kvm/x86/hyperv_svm_test.c
+++ b/tools/testing/selftests/kvm/x86/hyperv_svm_test.c
@@ -18,6 +18,8 @@
 #include "svm_util.h"
 #include "hyperv.h"
 
+#define VMWARE_HYPERVISOR_MAGIC	0x564d5868
+
 /* Exit to L1 from L2 with RDMSR instruction */
 static inline void rdmsr_from_l2(u32 msr)
 {
@@ -44,11 +46,14 @@ void l2_guest_code(void)
 
 	GUEST_SYNC(5);
 
-	/* L2 TLB flush tests */
-	hyperv_hypercall(HVCALL_FLUSH_VIRTUAL_ADDRESS_SPACE |
-			 HV_HYPERCALL_FAST_BIT, 0x0,
-			 HV_FLUSH_ALL_VIRTUAL_ADDRESS_SPACES |
-			 HV_FLUSH_ALL_PROCESSORS);
+	/*
+	 * L2 TLB flush tests.  Leave VMware's magic value in RAX to check that
+	 * VMware hypercall exits don't claim the flush that L0 handles.
+	 */
+	hyperv_hypercall_rax(HVCALL_FLUSH_VIRTUAL_ADDRESS_SPACE |
+			     HV_HYPERCALL_FAST_BIT, 0x0,
+			     HV_FLUSH_ALL_VIRTUAL_ADDRESS_SPACES |
+			     HV_FLUSH_ALL_PROCESSORS, VMWARE_HYPERVISOR_MAGIC);
 	rdmsr_from_l2(MSR_FS_BASE);
 	/*
 	 * Note: hypercall status (RAX) is not preserved correctly by L1 after
@@ -156,7 +161,11 @@ int main(int argc, char *argv[])
 	TEST_REQUIRE(kvm_hv_cpu_has(HV_X64_NESTED_DIRECT_FLUSH));
 
 	/* Create VM */
-	vm = vm_create_with_one_vcpu(&vcpu, guest_code);
+	vm = vm_create(1);
+	if (kvm_check_cap(KVM_CAP_X86_VMWARE) & KVM_VMWARE_ENABLE_HYPERCALL)
+		vm_enable_cap(vm, KVM_CAP_X86_VMWARE,
+			      KVM_VMWARE_ENABLE_HYPERCALL);
+	vcpu = vm_vcpu_add(vm, 0, guest_code);
 	vcpu_set_hv_cpuid(vcpu);
 	vcpu_alloc_svm(vm, &nested_gva);
 	vcpu_alloc_hyperv_test_pages(vm, &hv_pages_gva);
-- 
2.53.0

