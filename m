Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793922480;
	b=LEKwAutzHO3FFGyh8hSz/nnUTasReN1dmYZOf1eoCr/bYwqj80d5DXtLWki7lPbXImvJ
	 7CM+xzpQH2koygy8IOluy5Uy3wJcsYj/nhc5/y+YJbeKOlblqcpdz3HBFrf4KlVvcWU0f
	 nhRBSE5cd2wQMjwTxyctANOhWfauDmeZYjycfIEd2PKW1hOaepdz64SwtZXgI1ewXgdgM
	 8ZqmKqNIx1NZaaEu/9jNED1VjmySOBAa/UF2xdeygwim7coslIiuridoFzI3vp6SOJ+ej
	 8kD2c0aa/IJqvRpycNkgt9p7He5BMa8afag2LQT03c+wcQR+tg+u8rePIWDM1z1RzWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793922480;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=5XK1YSSiiA4WmmUnF56HGEq5CRIfmQKX3JC+zcltYJQ=;
	b=q+jinmkZfSUddk7ckYAeTMFsmFSI4fk2GuBnWponpfyU9ZeE6Co1TsRAdxHB/m7g/xH6
	 PaZ1PRaNr9fAD0PE2O+UWnOpEOl/DmxkWXh/2EAn2t+H5HkfDMIMenvyZCBWDZA3tNJvl
	 bCWf5utn++3wRfUogYsL8leoG/CS/wbFpJZTQ9reL2kwwMHBN/a1IsTlWd2U7+Osj2Gc6
	 q4tsitDm36kc7wGr0pagI5oM83IqNeE35QasycfblSi+oyUOKxgwbMmsPGFY5PwTlbEhG
	 /ZahXnu5OfMzZSouWaF5Qt5VNUm8Lsrk0uzwqgA9p9gXyxF01cRJWEEpbZ1kZWf8ZPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=L2OJqkDY;
	arc=none smtp.remote-ip=209.85.216.69
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E2760A260E
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Nov 2026 23:47:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2E2760A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=L2OJqkDY
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b0ac277beaso87819a91.1
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Nov 2026 15:47:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793922479; x=1794527279; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5XK1YSSiiA4WmmUnF56HGEq5CRIfmQKX3JC+zcltYJQ=;
        b=L2OJqkDY00Ei84tyj090agN7jq7OSbM2DIwzAe5QTPlsMt/jLeV9IYJMHZ1IxiDvKk
         v3irotusiCUCj1lu2S8gH0qvU3ESbrUmcuFLQI0D4oE/xTgt3NR4zw2PIKVhPCveWfnG
         avsvJxJ6xLIHiwc8sBVcNJk2v/ZPpiClfjHeIOb15xwqc40ZS7SotUQCSP6Ncbugp9dA
         Hkp8PjI5fXVyDYOw5jRyPmMLcEu7jIemRWFw7d6QWQQ6SeqV0Z+hylSUIu4vx+ZFf/Yp
         mvN8JzHfsNEqZQLNP6fvOW3vD0SEi3yA7jcAJpdaBaqzeKlDKrWacJ6isaCm+SVRzjTz
         oBKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793922479; x=1794527279;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5XK1YSSiiA4WmmUnF56HGEq5CRIfmQKX3JC+zcltYJQ=;
        b=S+SfJirjK2QkNDaXSQYThTpQj6cusyifDQtD/ladXMs6+s7zBxxUm3W1kvEML5LWPj
         F4rtsofaR/qVi7+69D3ePpUsVJw6RDew9y7oDOAixszXfkFt1c+MVweYkJAljxkm4V81
         6JxzE6bMiJNzhF6oxIpJyARiOtKldIVYz2rdE5imN8bLl9g6s0tH85Vtp9ej+vCkV9Oz
         CFllCOxwthkZ9purBtaAY7T0Hdor8Dkd29mFtDN54dObPLoVEZqWRoPNQfxjoURIiT9M
         HASyb11TKc6xe4w2p0NBCcgRml2SBgg2fXF4Q9Yc1J9Gj6AUZ3XNjzd32A0E/Bp46ZDy
         /EJg==
X-Forwarded-Encrypted: i=1; AKwUvBzhlwWSe9PWhm+NWGASMBKqPHUH/8TMPjhjvmYbjETZq8XGeHo5B+Ipr1paZ9MqoeQBWVDtWZBZgNIMukY8REU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/JSrqEvkI8ImrapMW4KKvj7TZLvYKHnwIJVqwNtnPm5KXzhhKz
	eqb0AWEmhOWhnVBsLVxNDEJmHtIPFfLgv3IK/OU5Yg9D5Ocqody6EP8l0lTXQW6POyd6PZiImA7
	sn/Xm9g==
X-Received: from pjpu13.prod.google.com ([2002:a17:90a:a20d:b0:3a8:7374:19e9])
 (user=wyihan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1c0d:b0:3ab:b39f:41da
 with SMTP id 98e67ed59e1d1-3b0db6e04e3mr565340a91.11.1793922479064; Thu, 05
 Nov 2026 15:47:59 -0800 (PST)
Date: Thu, 05 Nov 2026 23:47:02 +0000
In-Reply-To: <20261105-tdx-selftests-v16-0-2024e8fa517a@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261105-tdx-selftests-v16-0-2024e8fa517a@google.com>
X-Developer-Key: i=wyihan@google.com; a=ed25519; pk=cRi0fKzS5BMxlHyHY2pJv3w/1zcgfYKr6EYGYppdMYc=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793922452; l=2640;
 i=wyihan@google.com; s=20260319; h=from:subject:message-id;
 bh=pWnEq5zFqLJWNHptUXsnYM2oqxjXaqm1yYG5yOoXRkw=; b=6HoXdebY+5MC2Bax7uAk7M565VRvG1CnBtQiks6B3HlFCi1vONcu/O4Qbx1bADHdnysslN1gQ
 WEPkKqgTL0vAb1EWC/If5Q+oalKtxK68LszInLxgOUz/lmZ1tWcD41l
X-Mailer: b4 0.14.3
Message-ID: <20261105-tdx-selftests-v16-18-2024e8fa517a@google.com>
Subject: [PATCH v16 18/20] KVM: selftests: Add support for per-VM ucall ops on x86
From: Lisa Wang <wyihan@google.com>
To: Andrew Jones <ajones@ventanamicro.com>, Ackerley Tng <ackerleytng@google.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, Chao Gao <chao.gao@intel.com>, 
	Chenyi Qiang <chenyi.qiang@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Erdem Aktas <erdemaktas@google.com>, Ira Weiny <iweiny@kernel.org>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Kiryl Shutsemau <kas@kernel.org>, 
	linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	"Pratik R. Sampat" <pratikrajesh.sampat@amd.com>, Reinette Chatre <reinette.chatre@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Roger Wang <runanwang@google.com>, 
	Ryan Afranji <afranji@google.com>, Sagi Shahar <sagis@google.com>, 
	Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Oliver Upton <oupton@kernel.org>
Cc: Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, x86@kernel.org, Lisa Wang <wyihan@google.com>
Content-Type: text/plain; charset="utf-8"

From: Sean Christopherson <seanjc@google.com>

Add a layer of indirection to x86's ucall infrastructure to allow wiring up
a different set of {do,get}_ucall() operations for TDX VMs.  TDX can't use
port I/O (at least, not robustly), as the TDX ABI doesn't allow the guest
to share arbitrary register state with the host on a PIO exit, and the PIO
data payload is limited to 4 bytes, i.e. would potentially truncate the
address of the per-ucall structure.

No functional change intended, as the ops are still hardwired to the common
x86 ucall functions.

Signed-off-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Lisa Wang <wyihan@google.com>
---
 tools/testing/selftests/kvm/include/x86/ucall.h |  6 +-----
 tools/testing/selftests/kvm/lib/x86/ucall.c     | 27 +++++++++++++++++++++++--
 2 files changed, 26 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/x86/ucall.h b/tools/testing/selftests/kvm/include/x86/ucall.h
index 0e4950041e3e..aca582bb2cd5 100644
--- a/tools/testing/selftests/kvm/include/x86/ucall.h
+++ b/tools/testing/selftests/kvm/include/x86/ucall.h
@@ -2,12 +2,8 @@
 #ifndef SELFTEST_KVM_UCALL_H
 #define SELFTEST_KVM_UCALL_H
 
-#include "kvm_util.h"
+#include <linux/kvm.h>
 
 #define UCALL_EXIT_REASON       KVM_EXIT_IO
 
-static inline void ucall_arch_init(struct kvm_vm *vm, gpa_t mmio_gpa)
-{
-}
-
 #endif
diff --git a/tools/testing/selftests/kvm/lib/x86/ucall.c b/tools/testing/selftests/kvm/lib/x86/ucall.c
index 38050c60a067..3aec4dd46d1b 100644
--- a/tools/testing/selftests/kvm/lib/x86/ucall.c
+++ b/tools/testing/selftests/kvm/lib/x86/ucall.c
@@ -8,13 +8,13 @@
 
 #define UCALL_PIO_PORT ((u16)0x1000)
 
-void ucall_arch_do_ucall(gva_t uc)
+static void ucall_x86_do_ucall(gva_t uc)
 {
 	asm volatile("in %[port], %%al"
 		: : [port] "d" (UCALL_PIO_PORT), "D" (uc) : "rax", "memory");
 }
 
-void *ucall_arch_get_ucall(struct kvm_vcpu *vcpu)
+static void *ucall_x86_get_ucall(struct kvm_vcpu *vcpu)
 {
 	struct kvm_run *run = vcpu->run;
 
@@ -26,3 +26,26 @@ void *ucall_arch_get_ucall(struct kvm_vcpu *vcpu)
 	}
 	return NULL;
 }
+
+static struct {
+	void (*do_ucall)(gva_t uc);
+	void *(*get_ucall)(struct kvm_vcpu *vcpu);
+} ucall_x86_ops = {
+	.do_ucall = ucall_x86_do_ucall,
+	.get_ucall = ucall_x86_get_ucall,
+};
+
+void ucall_arch_init(struct kvm_vm *vm, gpa_t mmio_gpa)
+{
+	sync_global_to_guest(vm, ucall_x86_ops);
+}
+
+void ucall_arch_do_ucall(gva_t uc)
+{
+	ucall_x86_ops.do_ucall(uc);
+}
+
+void *ucall_arch_get_ucall(struct kvm_vcpu *vcpu)
+{
+	return ucall_x86_ops.get_ucall(vcpu);
+}

-- 
2.56.0.455.g6c5a503b38-goog

