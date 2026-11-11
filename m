Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794377229;
	b=pwqNzfk1n2zJyRcStCiB9B7FvIhVafaTIyOlIWmAnfdREVpYCTznFvtFLeGDN9jkHDN2
	 YHId0juwquFL0MtVWWwmXmyikgFoJXZJ3S9Kc5Pwk4s/EklYyoxBCbOBcRoyPXJRMB+ff
	 K7/c1NXJdkjQdsxxzgVssMZmsWGWRNTmA6BvqTVufWRALsNtxbtRGSC0nucmnGBXeXcio
	 s70CCwLY+2GUP005oQyYJTqKzNFus3/mJFT300x6vjTnUHwkAJvIjsTPimBz7k5s5Txsl
	 MZMlGYpfnlZhMnkBXcun3ebzSMW9Fivv2lXx2lHujZC0ZP1gWwEWbsP3ky17H+DGfIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794377229;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=Vgb5KbfLXjqL8iV/MCTqSzX96RhTYAbLrdtarSFXk0A=;
	b=FCP9uzV6NusX6f2DJWjesCFhBEKwKxdyIjIz2WTn79NmqcFER3oiAjfNUy/rsDZugnvV
	 TY5lFWwW2GprHFItDFFt5Xs5rtO1ozMf6a2yaA15cI045HMBiEnYUuDkNNKIgHxPGNSUb
	 gm+Xa0p9e6jhfsdEBFmZa2h1BRF/2m5N2ykXqZjhBFbtUjUsLuBywPcmP+avNYVyd9xIw
	 qoAyuFFEWgpzvfpbqyY++ECei6TOmCkqrXtJBMXz0Cagbddc3lRQZSEK865YvGE46UCuZ
	 D3B6QZYOb+Z770LWJLbNr6fYBn4qujkUMTnIrkiijtb4Z2QA7yCew/x6mhufhDKmVFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=CTwsbA2t;
	arc=none smtp.remote-ip=209.85.217.99
Received: from mail-vs1-f99.google.com (mail-vs1-f99.google.com [209.85.217.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D42760A260F
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 06:07:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D42760A260F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=CTwsbA2t
Received: by mail-vs1-f99.google.com with SMTP id ada2fe7eead31-7d2e14babc8so1656346137.2
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 22:07:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794377228; x=1794982028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vgb5KbfLXjqL8iV/MCTqSzX96RhTYAbLrdtarSFXk0A=;
        b=eCzT6lF39+N+2WZV5TA4lhgWCqYqb4oUXHwyqkc8wCys0mb6TifhOAe+V+HOEXB68s
         9QZx77/CYNHvTpCFWhawpPGd0gvfGTFC27VcO9o1tAqceRORFmD6dv1ZxZbv3dE9Mkgm
         Y+qWyKzPxKLYtM40EUeRNFkKV82r9M1lnHZ3Sz3nVUwPNdr5sj0+Fgjh/9g1qecgueLV
         34qjfYyPQWgDigAB4/FmLlbcOODsAxq8Cusy67EyAoXJixszL8SJC9ljSNB3IOotQ+9/
         NP/8Db4Xid0dnll60TiaI+BLBPbvve5RCp8nStN6XlQiIQMvZy3H3cFiuYoFHtV7Kpvy
         BvOQ==
X-Forwarded-Encrypted: i=1; AL+hErGLNjLnGRRsiqLTDl+jD+UKYpIE0UlSS5R0X+CrRDBr+3REjKp+/P/aXaXWv307qW5DdyzJze1Dmew+efzxw5A=@vger.kernel.org
X-Gm-Message-State: APuU4Z9JHR3zQLrf17SlmTr+8k5zQQaCKVZZNlSotiL3mpFYXJzxU17s
	HMlBifdNVua7Uo//6z6rhGiG1qLkMNWc0dduvKGdi2l4OSYgJj/08GLlzZmFVcutOaOdOdiwF+D
	2NfzDyGWiygvxWyvxyPrEaBl7nxTxqfiTwV1binHTjPKutdys1b60dhITM430i6dpuNz13rGhAw
	8iKsDSHe6MSRYKTqdJIyodhtq2bbpC0bXMltLMUMmSXgAb1oiScPq071RBfZxQf3nwbkGsDk7zE
	j9VQMd0GU+FSX2W5n2t
X-Gm-Gg: AYBFou1CEsObo50vSHQp8m1OTo7qty2IIGqqxXz9j4Uybf1z4qAswI3R4HK9TKIDg10
	us6ZxtZ7aIDYEOn9hO96a81jNXqI5r8QafFcUVPJmuhEdnEaE3d73KgNiaVdm/h+I07PEiYSbBl
	l5/w0H+W6Tt2gm66XsIRDNI+UKFP6r6N7kw4OSRUODR8RXsg2pyYrzgixj3ZhG1nujjwpx98Joz
	J/kWSV6bsCjUTALkBDHtZY7uueksbQhLkdbFLRIJynYSk/72S/z+Kqn3lsqqT6nDW1e+uM7lmMK
	DVEj0GoXXjBzfzhpa8qJlRIFI9lWxHiqducx18Mod8wSjmaj02lHByS5OhMJuxGSL58tgmrn80Q
	jYzzraDP8LDd8aQyIFYS2+rE/Hr7Qocs0Mfe/Qm9C+7bzFJgFpiV3w+4aCfjCUe7EzqZMv+w8sV
	qm9SYtgTnV3qmYRTTedUU718RJ2D1L8od1
X-Received: by 2002:a67:e118:0:b0:7d0:b125:79b2 with SMTP id ada2fe7eead31-7d4ee1e5105mr411706137.1.1794377228125;
        Tue, 10 Nov 2026 22:07:08 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-22.dlp.protect.broadcom.com. [144.49.247.22])
        by smtp-relay.gmail.com with ESMTPS id a1e0cc1a2514c-99c20381400sm278092241.3.2026.11.10.22.07.06
        for <linux-kselftest@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Nov 2026 22:07:08 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f62934ef6so652348885a.3
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 22:07:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794377226; x=1794982026; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vgb5KbfLXjqL8iV/MCTqSzX96RhTYAbLrdtarSFXk0A=;
        b=CTwsbA2t3vbW6E1iS6LQba/BHmIu6UPZZSfCx8jDfzF0SeN772dRDshwJDlPHBgXhE
         Z3sqgiQLysuugNFeKZD191oZ7zJFI4D+LKYRGXdOi9yvfKth3tUKI6lwL6/X9YQzsKH5
         LJSWFL4Bsk6/zkcfC3xQ7tTXokdcDYOJnLZjo=
X-Forwarded-Encrypted: i=1; AL+hErEdxVg0XZX06Ader1R4mvdGrLiG/px6Vmu4q6E3WirPBLKsWroX+SZwTpNF4ZWrhT546HFliMWoqoQ6kEQdlc4=@vger.kernel.org
X-Received: by 2002:a05:620a:1a25:b0:93f:5f83:2ca3 with SMTP id af79cd13be357-947b007e993mr212529985a.54.1794376843153;
        Tue, 10 Nov 2026 22:00:43 -0800 (PST)
X-Received: by 2002:a05:620a:1a25:b0:93f:5f83:2ca3 with SMTP id af79cd13be357-947b007e993mr212492885a.54.1794376838652;
        Tue, 10 Nov 2026 22:00:38 -0800 (PST)
Received: from vertex.localdomain (pool-173-49-113-140.phlapa.fios.verizon.net. [173.49.113.140])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e7e7f3bsm411506885a.37.2026.11.10.22.00.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 22:00:37 -0800 (PST)
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
Subject: [PATCH v3 09/12] KVM: selftests: Port VMware backdoor coverage
Date: Wed, 11 Nov 2026 00:59:58 -0500
Message-ID: <4dca09deb85d2d5db157888ae4a2de7cbf6421d2.1794374897.git.zack.rusin@broadcom.com>
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

Add vmware_backdoor_test, adapted from KVM-unit-tests' vmware_backdoors
test.  From CPL3, with CR4.PCE clear and no I/O permission bitmap in
the TSS, read the VMware pseudo-PMCs with RDPMC and issue backdoor
commands on the backdoor port with IN.  Verify that the pseudo-PMC
reads succeed and the port accesses exit to userspace only when the
backdoor is enabled and raise #GP otherwise, and that other PMC indices
and ports always raise #GP.  Repeat the pseudo-PMC checks at CPL3 with
CR4.PCE set and at CPL0, where RDPMC doesn't fault before KVM handles
it.  Skip the pseudo-PMC checks if KVM doesn't virtualize a PMU, as KVM
then injects #GP for every RDPMC.

Run the checks for a VM that relies on the enable_vmware_backdoor
default and for a VM that enables KVM_VMWARE_ENABLE_BACKDOOR, and
verify that KVM_CAP_X86_VMWARE rejects every flag it doesn't report.
KVM-unit-tests can only cover the module parameter, which applies to
every VM, while the selftest also covers the per-VM capability.

Suggested-by: Sean Christopherson <seanjc@google.com>
Link: https://lore.kernel.org/r/aIEoNpe-LFoH6LBm@google.com
Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
---
 MAINTAINERS                                   |   1 +
 tools/testing/selftests/kvm/Makefile.kvm      |   1 +
 .../selftests/kvm/x86/vmware_backdoor_test.c  | 272 ++++++++++++++++++
 3 files changed, 274 insertions(+)
 create mode 100644 tools/testing/selftests/kvm/x86/vmware_backdoor_test.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 017053e8f76e..39fa67a180f5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15050,6 +15050,7 @@ S:	Supported
 T:	git git://git.kernel.org/pub/scm/virt/kvm/kvm.git
 T:	git https://github.com/kvm-x86/linux.git
 F:	arch/x86/kvm/vmware.*
+F:	tools/testing/selftests/kvm/x86/vmware_backdoor_test.c
 
 KVM X86 Xen (KVM/Xen)
 M:	David Woodhouse <dwmw2@infradead.org>
diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index 95867977beb3..0ef08d7783ae 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -140,6 +140,7 @@ TEST_GEN_PROGS_x86 += x86/sync_regs_test
 TEST_GEN_PROGS_x86 += x86/ucna_injection_test
 TEST_GEN_PROGS_x86 += x86/userspace_io_test
 TEST_GEN_PROGS_x86 += x86/userspace_msr_exit_test
+TEST_GEN_PROGS_x86 += x86/vmware_backdoor_test
 TEST_GEN_PROGS_x86 += x86/vmx_apic_access_test
 TEST_GEN_PROGS_x86 += x86/vmx_apicv_updates_test
 TEST_GEN_PROGS_x86 += x86/vmx_exception_with_invalid_guest_state
diff --git a/tools/testing/selftests/kvm/x86/vmware_backdoor_test.c b/tools/testing/selftests/kvm/x86/vmware_backdoor_test.c
new file mode 100644
index 000000000000..e4e87d2ce3c3
--- /dev/null
+++ b/tools/testing/selftests/kvm/x86/vmware_backdoor_test.c
@@ -0,0 +1,272 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2025-2026 Broadcom. All Rights Reserved. The term
+ * "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
+ *
+ * Adapted from kvm-unit-tests' x86/vmware_backdoors.c.
+ */
+
+#include "kvm_util.h"
+#include "processor.h"
+#include "test_util.h"
+
+#define VMWARE_BACKDOOR_PMC_HOST_TSC		0x10000
+#define VMWARE_BACKDOOR_PMC_REAL_TIME		0x10001
+#define VMWARE_BACKDOOR_PMC_APPARENT_TIME	0x10002
+
+#define VMWARE_BACKDOOR_PORT	0x5658
+#define VMWARE_MAGIC		0x564d5868
+#define VMPORT_CMD_GETVERSION	0x0a
+#define VMPORT_CMD_ILLEGAL	0xfff
+#define VMPORT_DEFAULT_RETVAL	0xdeadbeef
+#define RANDOM_IO_PORT		0x1234
+#define RANDOM_PMC		0xfff
+
+struct insn_result {
+	u64 value;
+	u8 vector;
+};
+
+struct backdoor_results {
+	struct insn_result pmc[4];
+	struct insn_result port[3];
+};
+
+enum backdoor_mode {
+	USER_MODE,		/* CPL3, CR4.PCE clear */
+	USER_MODE_PCE,		/* CPL3, CR4.PCE set */
+	KERNEL_MODE,		/* CPL0 */
+};
+
+static struct backdoor_results results;
+static bool expect_backdoor;
+static bool test_pmcs;
+
+static struct insn_result guest_rdpmc(u32 pmc)
+{
+	struct insn_result result;
+	u32 eax;
+	u32 edx;
+	u64 error_code;
+
+	asm volatile(KVM_ASM_SAFE("rdpmc")
+		     : "=a"(eax), "=d"(edx),
+		       KVM_ASM_SAFE_OUTPUTS(result.vector, error_code)
+		     : "c"(pmc)
+		     : KVM_ASM_SAFE_CLOBBERS);
+	result.value = ((u64)edx << 32) | eax;
+	return result;
+}
+
+static struct insn_result guest_inl(u16 port, u32 command)
+{
+	struct insn_result result;
+	unsigned long rax = VMPORT_DEFAULT_RETVAL;
+	unsigned long rbx = VMPORT_DEFAULT_RETVAL;
+	unsigned long rcx = command;
+	unsigned long rdx = port;
+	u64 error_code;
+
+	asm volatile(KVM_ASM_SAFE("inl %%dx, %%eax")
+		     : "+a"(rax), "+b"(rbx), "+c"(rcx), "+d"(rdx),
+		       KVM_ASM_SAFE_OUTPUTS(result.vector, error_code)
+		     :
+		     : KVM_ASM_SAFE_CLOBBERS);
+	result.value = rbx;
+	return result;
+}
+
+static void guest_read_pmcs(void)
+{
+	results.pmc[0] = guest_rdpmc(VMWARE_BACKDOOR_PMC_HOST_TSC);
+	results.pmc[1] = guest_rdpmc(VMWARE_BACKDOOR_PMC_REAL_TIME);
+	results.pmc[2] = guest_rdpmc(VMWARE_BACKDOOR_PMC_APPARENT_TIME);
+	results.pmc[3] = guest_rdpmc(RANDOM_PMC);
+}
+
+static void guest_check_pmcs(void)
+{
+	int i;
+
+	for (i = 0; i < 3; i++) {
+		GUEST_ASSERT_EQ(results.pmc[i].vector,
+				expect_backdoor ? 0 : GP_VECTOR);
+		if (expect_backdoor)
+			GUEST_ASSERT_NE(results.pmc[i].value, 0);
+	}
+	GUEST_ASSERT_EQ(results.pmc[3].vector, GP_VECTOR);
+}
+
+static void guest_done_handler(struct ex_regs *regs)
+{
+	if (test_pmcs)
+		guest_check_pmcs();
+
+	GUEST_ASSERT_EQ(results.port[0].vector,
+			expect_backdoor ? 0 : GP_VECTOR);
+	GUEST_ASSERT_EQ(results.port[1].vector,
+			expect_backdoor ? 0 : GP_VECTOR);
+	if (expect_backdoor)
+		GUEST_ASSERT_EQ(results.port[0].value, VMWARE_MAGIC);
+	GUEST_ASSERT_EQ(results.port[2].vector, GP_VECTOR);
+
+	GUEST_DONE();
+}
+
+static void guest_user_code(void)
+{
+	if (test_pmcs)
+		guest_read_pmcs();
+
+	results.port[0] = guest_inl(VMWARE_BACKDOOR_PORT,
+				    VMPORT_CMD_GETVERSION);
+	results.port[1] = guest_inl(VMWARE_BACKDOOR_PORT,
+				    VMPORT_CMD_ILLEGAL);
+	results.port[2] = guest_inl(RANDOM_IO_PORT, VMPORT_CMD_ILLEGAL);
+
+	asm volatile("int3");
+}
+
+/* At CPL0, only the pseudo-PMCs depend on the backdoor. */
+static void guest_kernel_code(void)
+{
+	guest_read_pmcs();
+	guest_check_pmcs();
+	GUEST_DONE();
+}
+
+static void handle_vmware_port(struct kvm_vcpu *vcpu)
+{
+	struct kvm_run *run = vcpu->run;
+	struct kvm_regs regs;
+	u32 *data;
+
+	TEST_ASSERT_EQ(run->io.direction, KVM_EXIT_IO_IN);
+	TEST_ASSERT_EQ(run->io.size, 4);
+	TEST_ASSERT_EQ(run->io.count, 1);
+	TEST_ASSERT_EQ(run->io.port, VMWARE_BACKDOOR_PORT);
+
+	data = (void *)run + run->io.data_offset;
+	*data = 0;
+
+	vcpu_regs_get(vcpu, &regs);
+	regs.rbx = VMWARE_MAGIC;
+	vcpu_regs_set(vcpu, &regs);
+}
+
+static void test_unsupported_flags(u64 supported)
+{
+	struct kvm_vm *vm = vm_create_barebones();
+	int bit, ret;
+
+	for (bit = 0; bit < 64; bit++) {
+		if (supported & BIT_ULL(bit))
+			continue;
+
+		errno = 0;
+		ret = __vm_enable_cap(vm, KVM_CAP_X86_VMWARE, BIT_ULL(bit));
+		TEST_ASSERT(ret == -1 && errno == EINVAL,
+			    "Unsupported VMware flag %d: ret=%d errno=%d",
+			    bit, ret, errno);
+	}
+	kvm_vm_free(vm);
+}
+
+static void run_backdoor_test(bool enable_cap, bool expected,
+			      enum backdoor_mode mode)
+{
+	struct kvm_sregs sregs;
+	struct idt_entry *idt;
+	struct kvm_vcpu *vcpu;
+	struct kvm_vm *vm;
+	int port_exits = 0;
+
+	expect_backdoor = expected;
+	memset(&results, 0, sizeof(results));
+
+	vm = vm_create(1);
+	sync_global_to_guest(vm, expect_backdoor);
+	sync_global_to_guest(vm, test_pmcs);
+	sync_global_to_guest(vm, results);
+	if (enable_cap)
+		vm_enable_cap(vm, KVM_CAP_X86_VMWARE,
+			      KVM_VMWARE_ENABLE_BACKDOOR);
+	if (mode == KERNEL_MODE) {
+		vcpu = vm_vcpu_add(vm, 0, guest_kernel_code);
+	} else {
+		vcpu = vm_vcpu_add(vm, 0, guest_user_code);
+
+		idt = addr_gva2hva(vm, vm->arch.idt);
+		idt[BP_VECTOR].dpl = 3;
+		vm_install_exception_handler(vm, BP_VECTOR, guest_done_handler);
+		vm_init_user_mode(vm);
+		vcpu_enter_user_mode(vcpu);
+	}
+
+	if (mode == USER_MODE_PCE) {
+		vcpu_sregs_get(vcpu, &sregs);
+		sregs.cr4 |= X86_CR4_PCE;
+		vcpu_sregs_set(vcpu, &sregs);
+	}
+
+	for (;;) {
+		struct kvm_run *run = vcpu->run;
+		struct ucall uc;
+
+		vcpu_run(vcpu);
+		TEST_ASSERT_KVM_EXIT_REASON(vcpu, KVM_EXIT_IO);
+
+		if (run->io.port == VMWARE_BACKDOOR_PORT) {
+			TEST_ASSERT(expected,
+				    "Disabled VMware backdoor reached userspace");
+			handle_vmware_port(vcpu);
+			port_exits++;
+			continue;
+		}
+
+		switch (get_ucall(vcpu, &uc)) {
+		case UCALL_ABORT:
+			REPORT_GUEST_ASSERT(uc);
+			break;
+		case UCALL_DONE:
+			TEST_ASSERT_EQ(port_exits,
+				       expected && mode != KERNEL_MODE ? 2 : 0);
+			kvm_vm_free(vm);
+			return;
+		default:
+			TEST_FAIL("Unexpected ucall 0x%lx", uc.cmd);
+		}
+	}
+}
+
+int main(int argc, char *argv[])
+{
+	unsigned int supported = kvm_check_cap(KVM_CAP_X86_VMWARE);
+	enum backdoor_mode mode;
+	bool module_default;
+
+	TEST_REQUIRE(supported & KVM_VMWARE_ENABLE_BACKDOOR);
+
+	test_unsupported_flags(supported);
+
+	/* KVM serves the pseudo-PMCs only if it virtualizes a PMU. */
+	test_pmcs = kvm_is_pmu_enabled();
+	if (!test_pmcs)
+		ksft_print_msg("vPMU disabled, skipping pseudo-PMC checks\n");
+
+	module_default = get_kvm_param_bool("enable_vmware_backdoor");
+	run_backdoor_test(false, module_default, USER_MODE);
+	run_backdoor_test(true, true, USER_MODE);
+
+	/*
+	 * RDPMC at CPL0, or at CPL3 with CR4.PCE set, doesn't raise the #GP
+	 * that the emulator handles, so check the pseudo-PMCs there as well.
+	 */
+	if (test_pmcs) {
+		for (mode = USER_MODE_PCE; mode <= KERNEL_MODE; mode++) {
+			run_backdoor_test(false, module_default, mode);
+			run_backdoor_test(true, true, mode);
+		}
+	}
+	return 0;
+}
-- 
2.53.0

