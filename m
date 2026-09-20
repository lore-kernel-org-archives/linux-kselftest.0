Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4E2485953
	for <linux-kselftest@vger.kernel.org>; Sun, 20 Sep 2026 19:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789933204; cv=none; b=WlKleldceFrZ4jy9YxAvrW03VruA6KLm2qLLL9JjowgbreGEdNXY2pIRDfsGOl+e7lXn8wAMeJ/uXsyuXea+TndLFpdpiMTJhdVD8AhYjOsihDchnZs2XYfWwO/elRdO5C5dO4gmdcG35PXPAUK9zxMq8eBwvm3X00d2cTQUbw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789933204; c=relaxed/simple;
	bh=DP9NFlhtGI3badaHpOCf3zWVGgRwAVCNaexQPvEj4vs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hXOeEtQUQ0I4qSPJwPAlF5CrZv5/tYdcCDle60xEXv7fqBkxtcW+poPaYwFZpvAO3BnvmY5GtJx0tJldTrWsdBDXekt+2KfJFETXc1uCZ2EFrhFMrTPmnFFkRfIOx9sGTgb4lNa3r4puEglq/JkLgrEw5T3gpc2jmZ4xYfOqTqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=A3SyLYW9; arc=none smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="A3SyLYW9"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66fabb1a601so1826084d50.3
        for <linux-kselftest@vger.kernel.org>; Sun, 20 Sep 2026 12:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1789933199; x=1790537999; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=K+2B3zmRro/zDH0n7+YdvazCE3Eaf+b235sNOcPlOno=;
        b=A3SyLYW9AyqqV+19ATaiaUuPYdOQRJLMWTxYM+WvF0U3J+jNhqhwFIilnlItuWWUcT
         Zw9RrgNF8qU9w7RE2YuaZHqFrUtwzp9W3JqbOq2Ytjm/ev8scDUKe6wNEXRs/MbaENkv
         MjbLFgpYZviTGKvtytO8F2t1xjP+nbgfQNu5f6IoJbl02iBQLEysaw3iOJvIq/Poj320
         8vWjF94hFKk7w1Zl1RXmujczZXW7322Ac3YEnRSMdTnNVrx/UdM6bixA9ZAnRWihqQjV
         gC2eeJ36ybQBYeyU+LxLRJWhNX9MI1X/cv/JPYT6hGvV4lfoaWPtwV+crDmZ39RxRUs/
         ksow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789933199; x=1790537999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=K+2B3zmRro/zDH0n7+YdvazCE3Eaf+b235sNOcPlOno=;
        b=HNxUvBKePYNElndqbttmFZQkBhRP5wpOUeBL7tiSteJrUDhgtpFqIiRfdiuFfNTKLE
         aM1nHq2DqGDlBEwHl46jCLzaUG9yfyjiw/TB+ZRtk1HjbErBc7bKdlEXyP0GchaBQ5sV
         yS1fh/nMcjBVUydIozTJ8mD+iHwttRNza/Dyqj2Dtviomd82LdpwSUIJ9FjbB7OzT/7v
         l0uVZS3+ST8m8u+3ZVqL/BIUR5117RFzK6CGlLDHuWh0IHQ6W+dD+cGrHnHiZs6X6qvh
         1neEnViCpsCoEgRBd3/FaeOgOmNJn3MrCMXIaAJZ1HEYbAnRBfFVEsVNEmzDToQdq7gs
         1Jkg==
X-Gm-Message-State: AFuF++mElTNAVkMA9Fcgc7DVuSCxFL3j6+AG1Be0bQ/XyOam94Tz4+Yc
	+4Mzv3vx0OwRIm/nEcdW+NCio3B9PE8yx7lXil4HYRIW7VsmV2ERBtskgkJ+tu5Elm1pRWWFh+t
	UnwTgAmE=
X-Gm-Gg: AYBFou1fwERWqbSV+z6cL9HDc5C3cMg4nf+dwhScYSct7YgHijfkTbUo8efwImaPVBG
	0vVK8wZLt9aCAx3ymbfdyY36hNjCHAAa1LuJv7OYyfu8QmVhk9RSY7Y3Dbk6Ql3ZKTxbiIYvM4P
	eF8XWLMIIfc/qM4o2ov4EAxSdHwhVPQpfyQrxVKQyFcCIGxAeHs8bC71cqLHhZ9f9XPX4r/ctDu
	SD9yKwsoa2P4EgNfoNRsGpPw6cQFo4j8UEaS6nOMAmGkDHxu3G2r5HbJNmu5wiYSkWd8vvGxyL6
	aJhv/JFkG8ng+omDoli7nzVtCXoghQQ/uDMsiS2MH42UjsxxY4y/xae1k++mOcytHepD10psRdA
	bOJ6mdq3StZDcsTfWJb7xSuOvRgu4w19VbGDMFEiDRMEZnGazFGqa/JY/DbkwM2B9+JcuM/e0vb
	w7E+Gs0F8sFYw3FEQxt/llN23OZHPfrPANrMQilqKhFaYvoyF9vzVgOUc2D5wXxOGWmLFss+ZX0
	r3FWJG7gjdmtMt5DwqJmKMDiWWkYsDgvjFRv83IqQe/JZznscyLfXKWkPdK6j4vmtZoq7QaKJGa
	87F5OJTvfET2Mzd5dUQ=
X-Received: by 2002:a05:690e:1408:b0:671:41c1:daaf with SMTP id 956f58d0204a3-6717fc95e09mr2518491d50.6.1789933199337;
        Sun, 20 Sep 2026 12:39:59 -0700 (PDT)
Received: from soleen.c.googlers.com.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-672990ab5desm2605625d50.8.2026.09.20.12.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 12:39:58 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	legion@kernel.org,
	kees@kernel.org,
	will@kernel.org,
	ruanjinjie@huawei.com,
	atomlin@atomlin.com,
	rppt@kernel.org,
	jani.nikula@intel.com,
	hamzamahfooz@linux.microsoft.com,
	joey.gouly@arm.com,
	tglx@kernel.org,
	nsc@kernel.org,
	alexandre.chartre@oracle.com,
	james.morse@arm.com,
	dianders@chromium.org,
	bp@alien8.de,
	jpoimboe@kernel.org,
	shuah@kernel.org,
	catalin.marinas@arm.com,
	linux-kbuild@vger.kernel.org,
	linux-arch@vger.kernel.org,
	kvmarm@lists.linux.dev,
	jaredwhite@microsoft.com,
	johan@kernel.org,
	pbonzini@redhat.com,
	mingo@redhat.com,
	linux-mm@kvack.org,
	seanjc@google.com,
	mark.rutland@arm.com,
	vdonnefort@google.com,
	tarunsahu@google.com,
	gshan@redhat.com,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	xur@google.com,
	djbw@kernel.org,
	oupton@kernel.org,
	nogikh@google.com,
	sumitg@nvidia.com,
	linux-kernel@vger.kernel.org,
	zengheng4@huawei.com,
	peterz@infradead.org,
	corbet@lwn.net,
	suzuki.poulose@arm.com,
	luto@kernel.org,
	hpa@zytor.com,
	zhangpengjie2@huawei.com,
	x86@kernel.org,
	yuzenghui@huawei.com,
	jic23@kernel.org,
	ardb@kernel.org,
	pasha.tatashin@soleen.com,
	petr.pavlu@suse.com,
	ryan.roberts@arm.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	dave.hansen@linux.intel.com,
	rdunlap@infradead.org,
	kvm@vger.kernel.org,
	fuad.tabba@linux.dev,
	maz@kernel.org,
	mbenes@suse.cz,
	jgross@suse.com,
	seiden@linux.ibm.com,
	pierre.gondois@arm.com,
	song@kernel.org,
	nathan@kernel.org,
	pmladek@suse.com,
	graf@amazon.com,
	chao.gao@intel.com,
	zhenglifeng1@huawei.com,
	arnd@arndb.de,
	sidnayyar@google.com,
	linux-arm-kernel@lists.infradead.org,
	vladimir.murzin@arm.com,
	kas@kernel.org
Subject: [RFC PATCH 31/46] KVM: caretaker: Add generic KHO ABI telemetry and debugfs reporting
Date: Sun, 20 Sep 2026 15:36:35 -0400
Message-ID: <20260920193650.3373435-32-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
In-Reply-To: <20260920193650.3373435-1-pasha.tatashin@soleen.com>
References: <20260920193650.3373435-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a preserved vCPU executes inside the Caretaker during a host live
update blackout window, standard kernel tracing and KVM exit counters
are unavailable because the host kernel is being replaced via kexec. If
a guest vCPU hits an unhandled exit and parks, or experiences unexpected
exit patterns during the transition, the incoming kernel has no
visibility into what occurred while the vCPU was detached.

Add optional cross-kexec Caretaker execution telemetry behind
CONFIG_KVM_CARETAKER_DEBUG. During detached execution, the Caretaker
records run counts, exit counts, stall counts, the last exit reason and
guest PC, and stall diagnostics into a KHO-preserved telemetry buffer
referenced from struct kvm_caretaker_cb_ser. When the incoming kernel
reclaims the vCPU, it logs a summary to dmesg and exposes the preserved
telemetry under /sys/kernel/debug/kvm/<vm>/vcpu<N>/caretaker_telemetry.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 include/linux/kvm_caretaker.h |  97 +++++++++++++++++++++++++++
 virt/kvm/Kconfig              |  10 +++
 virt/kvm/Makefile.kvm         |   1 +
 virt/kvm/caretaker_debug.c    | 120 ++++++++++++++++++++++++++++++++++
 virt/kvm/kvm_main.c           |   1 +
 5 files changed, 229 insertions(+)
 create mode 100644 virt/kvm/caretaker_debug.c

diff --git a/include/linux/kvm_caretaker.h b/include/linux/kvm_caretaker.h
index 0d4bdde7b1c3..f889d17212b0 100644
--- a/include/linux/kvm_caretaker.h
+++ b/include/linux/kvm_caretaker.h
@@ -108,11 +108,13 @@ struct kvm_caretaker_ops {
  * @cb:        Pointer to KHO-preserved Caretaker control block (&struct kvm_caretaker_cb_ser).
  * @ops:       Architecture operations vector (&struct kvm_caretaker_ops).
  * @arch_data: Architecture-specific runtime context passed to @ops callbacks.
+ * @telemetry: Pointer to KHO-preserved telemetry counters, or %NULL.
  */
 struct kvm_caretaker_vcpu {
 	struct kvm_caretaker_cb_ser *cb;
 	const struct kvm_caretaker_ops *ops;
 	void *arch_data;
+	struct kvm_caretaker_telemetry_ser *telemetry;
 };
 
 struct kvm_kho_folios_ser *kvm_kho_folios_alloc(unsigned int max_folios);
@@ -260,11 +262,106 @@ void kvm_caretaker_vcpu_finish(struct kvm_vcpu *vcpu,
 			       struct liveupdate_session *session,
 			       struct kvm_vcpu_ser *ser);
 
+#ifdef CONFIG_KVM_CARETAKER_DEBUG
+void kvm_caretaker_telemetry_init(struct kvm_caretaker_vcpu *cvcpu,
+				  struct oncore_session *sess);
+void kvm_caretaker_telemetry_report(struct kvm_vcpu *vcpu,
+				    struct kvm_caretaker_cb_ser *cb);
+void kvm_caretaker_telemetry_free(struct kvm_vcpu_ser *ser, bool is_incoming);
+void kvm_caretaker_create_vcpu_debugfs(struct kvm_vcpu *vcpu,
+				       struct dentry *debugfs_dentry);
+
+/**
+ * kvm_caretaker_telemetry_run - Record a guest entry in Caretaker telemetry
+ * @cvcpu: Common Caretaker vCPU descriptor.
+ */
+static __always_inline __caretaker_text void
+kvm_caretaker_telemetry_run(struct kvm_caretaker_vcpu *cvcpu)
+{
+	if (cvcpu->telemetry)
+		cvcpu->telemetry->total_runs++;
+}
+
+/**
+ * kvm_caretaker_telemetry_exit - Record a decoded VM exit in Caretaker telemetry
+ * @cvcpu: Common Caretaker vCPU descriptor.
+ * @exit:  Decoded VM exit descriptor.
+ */
+static __always_inline __caretaker_text void
+kvm_caretaker_telemetry_exit(struct kvm_caretaker_vcpu *cvcpu,
+			     const struct kvm_caretaker_exit *exit)
+{
+	if (cvcpu->telemetry) {
+		cvcpu->telemetry->total_exits++;
+		cvcpu->telemetry->last_exit_reason = exit->raw_reason;
+		cvcpu->telemetry->last_exit_rip = exit->rip;
+	}
+}
+
+/**
+ * kvm_caretaker_telemetry_stall - Record an unhandled stall exit in Caretaker telemetry
+ * @cvcpu:  Common Caretaker vCPU descriptor.
+ * @reason: Raw hardware exit reason or entry failure code.
+ * @rip:    Guest instruction pointer at stall (0 if entry failure).
+ */
+static __always_inline __caretaker_text void
+kvm_caretaker_telemetry_stall(struct kvm_caretaker_vcpu *cvcpu,
+			      u64 reason, u64 rip)
+{
+	if (cvcpu->telemetry) {
+		cvcpu->telemetry->stall_count++;
+		cvcpu->telemetry->last_exit_reason = reason;
+		cvcpu->telemetry->stall_exit_reason = reason;
+		if (rip)
+			cvcpu->telemetry->stall_exit_rip = rip;
+	}
+}
+
+/**
+ * kvm_caretaker_telemetry_flush - Clean Caretaker telemetry counters to PoC
+ * @cvcpu: Common Caretaker vCPU descriptor.
+ */
+static __always_inline __caretaker_text void
+kvm_caretaker_telemetry_flush(struct kvm_caretaker_vcpu *cvcpu)
+{
+	if (cvcpu->telemetry)
+		cpu_preserved_clean_sz(cvcpu->telemetry,
+				       sizeof(*cvcpu->telemetry));
+}
+#else
+static inline void kvm_caretaker_telemetry_init(struct kvm_caretaker_vcpu *cvcpu,
+						struct oncore_session *sess) {}
+
+static inline void kvm_caretaker_telemetry_report(struct kvm_vcpu *vcpu,
+						  struct kvm_caretaker_cb_ser *cb) {}
+
+static inline void kvm_caretaker_telemetry_free(struct kvm_vcpu_ser *ser,
+						bool is_incoming) {}
+
+static inline void kvm_caretaker_create_vcpu_debugfs(struct kvm_vcpu *vcpu,
+						     struct dentry *debugfs_dentry) {}
+static __always_inline void
+kvm_caretaker_telemetry_run(struct kvm_caretaker_vcpu *cvcpu) {}
+static __always_inline void
+kvm_caretaker_telemetry_exit(struct kvm_caretaker_vcpu *cvcpu,
+			     const struct kvm_caretaker_exit *exit) {}
+static __always_inline void
+kvm_caretaker_telemetry_stall(struct kvm_caretaker_vcpu *cvcpu,
+			      u64 reason, u64 rip) {}
+static __always_inline void
+kvm_caretaker_telemetry_flush(struct kvm_caretaker_vcpu *cvcpu) {}
+#endif
+
 #else /* !CONFIG_KVM_CARETAKER */
 
 #define __caretaker_text
 #define __caretaker_data
 
+struct dentry;
+
+static inline void kvm_caretaker_create_vcpu_debugfs(struct kvm_vcpu *vcpu,
+						     struct dentry *debugfs_dentry) {}
+
 static inline bool kvm_caretaker_is_stopped(const struct kvm_caretaker_cb_ser *cb)
 {
 	return true;
diff --git a/virt/kvm/Kconfig b/virt/kvm/Kconfig
index 165e0c85b8aa..bee73dd079c6 100644
--- a/virt/kvm/Kconfig
+++ b/virt/kvm/Kconfig
@@ -153,3 +153,13 @@ config KVM_CARETAKER
 	  without pausing the guest.
 
 	  If unsure, say N.
+
+config KVM_CARETAKER_DEBUG
+	bool "Caretaker execution telemetry and debug reporting"
+	depends on KVM_CARETAKER
+	default n
+	help
+	  Enable Caretaker telemetry collection and reporting of VM exits,
+	  runs, and stall diagnostics via debugfs and dmesg upon vCPU resume
+	  following a host kexec live update or cancelled live update session.
+	  If unsure, say N.
diff --git a/virt/kvm/Makefile.kvm b/virt/kvm/Makefile.kvm
index ae1fcf9861b7..157d0bf6132d 100644
--- a/virt/kvm/Makefile.kvm
+++ b/virt/kvm/Makefile.kvm
@@ -15,6 +15,7 @@ kvm-$(CONFIG_HAVE_KVM_PFNCACHE) += $(KVM)/pfncache.o
 kvm-$(CONFIG_KVM_GUEST_MEMFD) += $(KVM)/guest_memfd.o
 kvm-$(CONFIG_LIVEUPDATE_GUEST_MEMFD) += $(KVM)/guest_memfd_luo.o $(KVM)/kvm_luo.o
 kvm-$(CONFIG_KVM_CARETAKER) += $(KVM)/caretaker.o
+kvm-$(CONFIG_KVM_CARETAKER_DEBUG) += $(KVM)/caretaker_debug.o
 KASAN_SANITIZE_$(KVM)/caretaker.o := n
 KCSAN_SANITIZE_$(KVM)/caretaker.o := n
 UBSAN_SANITIZE_$(KVM)/caretaker.o := n
diff --git a/virt/kvm/caretaker_debug.c b/virt/kvm/caretaker_debug.c
new file mode 100644
index 000000000000..8905938bfec3
--- /dev/null
+++ b/virt/kvm/caretaker_debug.c
@@ -0,0 +1,120 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2026, Google LLC.
+ * Pasha Tatashin <pasha.tatashin@soleen.com>
+ *
+ * KVM Caretaker execution telemetry and debugfs reporting.
+ */
+
+#include <linux/cpu_preserve.h>
+#include <linux/debugfs.h>
+#include <linux/kernel.h>
+#include <linux/kexec_handover.h>
+#include <linux/kho/abi/kvm.h>
+#include <linux/kvm_caretaker.h>
+#include <linux/kvm_host.h>
+#include <linux/oncore.h>
+#include <linux/seq_file.h>
+
+void kvm_caretaker_telemetry_init(struct kvm_caretaker_vcpu *cvcpu,
+				  struct oncore_session *sess)
+{
+	struct kvm_caretaker_telemetry_ser *tel;
+
+	tel = kho_alloc_preserve(sizeof(*tel));
+	if (IS_ERR_OR_NULL(tel))
+		return;
+
+	memset(tel, 0, sizeof(*tel));
+	oncore_session_map_buffer(sess, tel, sizeof(*tel));
+	cpu_preserved_clean_sz(tel, sizeof(*tel));
+	cvcpu->telemetry = tel;
+	KHOSER_STORE_PTR(cvcpu->cb->telemetry, tel);
+}
+
+void kvm_caretaker_telemetry_report(struct kvm_vcpu *vcpu,
+				    struct kvm_caretaker_cb_ser *cb)
+{
+	struct kvm_caretaker_telemetry_ser *tel;
+
+	if (!vcpu || !cb)
+		return;
+
+	cpu_preserved_inval(cb);
+	tel = KHOSER_LOAD_PTR(cb->telemetry);
+	if (!tel)
+		return;
+
+	cpu_preserved_inval(tel);
+	vcpu->caretaker.last_telemetry = *tel;
+
+	pr_info("caretaker: vcpu %d resume: runs=%llu exits=%llu stalls=%llu last_exit=0x%llx (%llu) rip=0x%llx\n",
+		vcpu->vcpu_id, tel->total_runs, tel->total_exits,
+		tel->stall_count, tel->last_exit_reason,
+		tel->last_exit_reason, tel->last_exit_rip);
+	if (tel->stall_count) {
+		pr_info("caretaker: vcpu %d stall info: reason=0x%llx (%llu) rip=0x%llx\n",
+			vcpu->vcpu_id, tel->stall_exit_reason,
+			tel->stall_exit_reason, tel->stall_exit_rip);
+	}
+}
+
+void kvm_caretaker_telemetry_free(struct kvm_vcpu_ser *ser, bool is_incoming)
+{
+	struct kvm_caretaker_telemetry_ser *tel;
+	struct kvm_caretaker_cb_ser *cb;
+
+	if (!ser || !(ser->flags & KVM_VCPU_LUO_FLAG_CARETAKER))
+		return;
+
+	cb = KHOSER_LOAD_PTR(ser->cb);
+	tel = cb ? KHOSER_LOAD_PTR(cb->telemetry) : NULL;
+	if (tel) {
+		cb->telemetry.phys = 0;
+		if (is_incoming)
+			kho_restore_free(tel);
+		else
+			kho_unpreserve_free(tel);
+	}
+}
+
+static int caretaker_telemetry_show(struct seq_file *m, void *v)
+{
+	struct kvm_vcpu *vcpu = m->private;
+	const struct kvm_caretaker_telemetry_ser *t =
+		&vcpu->caretaker.last_telemetry;
+	struct kvm_caretaker_cb_ser *cb = READ_ONCE(vcpu->caretaker.cb);
+
+	if (cb) {
+		struct kvm_caretaker_telemetry_ser *live;
+
+		cpu_preserved_inval(cb);
+		live = KHOSER_LOAD_PTR(cb->telemetry);
+		if (live) {
+			cpu_preserved_inval(live);
+			t = live;
+		}
+	}
+
+	seq_printf(m, "runs: %llu\n", t->total_runs);
+	seq_printf(m, "exits: %llu\n", t->total_exits);
+	seq_printf(m, "stalls: %llu\n", t->stall_count);
+	seq_printf(m, "last_exit_reason: 0x%llx (%llu)\n",
+		   t->last_exit_reason, t->last_exit_reason);
+	seq_printf(m, "last_exit_rip: 0x%llx\n", t->last_exit_rip);
+	seq_printf(m, "stall_exit_reason: 0x%llx (%llu)\n",
+		   t->stall_exit_reason, t->stall_exit_reason);
+	seq_printf(m, "stall_exit_rip: 0x%llx\n", t->stall_exit_rip);
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(caretaker_telemetry);
+
+void kvm_caretaker_create_vcpu_debugfs(struct kvm_vcpu *vcpu,
+				       struct dentry *debugfs_dentry)
+{
+	if (!debugfs_dentry)
+		return;
+
+	debugfs_create_file("caretaker_telemetry", 0444, debugfs_dentry, vcpu,
+			    &caretaker_telemetry_fops);
+}
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 4f661c5d2ee2..84b4b96d7916 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -4156,6 +4156,7 @@ static void kvm_create_vcpu_debugfs(struct kvm_vcpu *vcpu)
 	debugfs_create_file("pid", 0444, debugfs_dentry, vcpu,
 			    &vcpu_get_pid_fops);
 
+	kvm_caretaker_create_vcpu_debugfs(vcpu, debugfs_dentry);
 	kvm_arch_create_vcpu_debugfs(vcpu, debugfs_dentry);
 }
 #endif
-- 
2.55.0.1082.g2b9226bbc0-goog

