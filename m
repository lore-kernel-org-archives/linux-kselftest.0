Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795890461;
	b=CW/NHe/YyN0/zwqe3xonCiOa1wso5HDPT2gMAdUdK/UU799Sm2VQKSlkGoskh6HOPVUE
	 XJWEvuWfZ5lXV8LGUojjXsvpDE4K3keq46nOAtRd409v4cp5y6ruA+S66XwI/BPSPvlFu
	 C+uZ9FAEncnJt282N2/inKIMJhqNKHzCnJ6JQ2HVhjbRcI+nJLrTuF1dUTH/PBUo+g8NQ
	 GcLSW5/C+PVUUA/Y3l0j681CR3dCPjtUPs1NvhmlzwnE9toTCZNcMIbaCZmY/jWmfExYd
	 wlp2Kq92tlg44tD7RVUvId16ibtc7FipMg7vddo0pfrkJjjbAN+h5x5wDEzaQYklHmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795890461;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:In-Reply-To:References:From:Subject:To:Cc:
	 MIME-Version:Content-Type:Content-Disposition:User-Agent;
	bh=qS7gE9joH/zv7OfYv0paV200SasrbkYDioRK8oKXElY=;
	b=t23wkU7rWOSRBWh+J7BM1Hf0dFq1NYdcaL3fsidh6OItZi163Sv07/bcjAcAh/1/aFNQ
	 YnzHRz3oBt9OwOjTwAKwzV4vKH/WhINC4uqm921myaBprPLZY9rDNrHk3lLrNfeffOKLu
	 xkP01K6nj2ZgdU6ZG29h1xEDl9luiEZL+IqB6DOqCluDxwCC8WscGqG7oM6X1fVsER2MU
	 /cnzNluXSJpN3MUimch0WQl+Aa8+D5ETzqLJZrro45ffRk/FDBlIxQdHIR2GK0Xwe6m5O
	 Z1/zU/nxKhZyMRxC/nLB9eeh0n6DGGr3qBbQKScxT11bVg3gQbeUsk0ifupyvS773Pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b="V90Gn/HM";
	arc=none smtp.remote-ip=209.85.128.171
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA9E606A6A8
	for <linux-kselftest@vger.kernel.org>; Sat, 28 Nov 2026 18:27:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CA9E606A6A8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=V90Gn/HM
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8b502b9b702so104418007b3.3
        for <linux-kselftest@vger.kernel.org>; Sat, 28 Nov 2026 10:27:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1795890460; x=1796495260; darn=vger.kernel.org;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:references:in-reply-to:message-id:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qS7gE9joH/zv7OfYv0paV200SasrbkYDioRK8oKXElY=;
        b=V90Gn/HMBu1GxBhOIsShPLfCklEXpuemLG6IF5Mg9GMDRagrupvZXFFQ3AIDscFrj0
         ExOFvNAe//fCkCcM+XmdqMPTyGGGOBAcjmpfe/1Gr2U2HB2NCH/nU50yJmN722LAPFGa
         BsDBkjOh2Isp/iKrGPhAvysS8b+IBJnFzuWho=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795890460; x=1796495260;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:references:in-reply-to:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qS7gE9joH/zv7OfYv0paV200SasrbkYDioRK8oKXElY=;
        b=m4vsQAKQgLarsDEAOwJ6tDcmeU0G8/rxDEqNVC7L6TO7gtWf/lIdjp9iNYW+nr08+E
         W9bOlHcK9P1/0NjkoxZAfdDYCECfxR3XwQzXAPSA55kAVvz52x0SRnz1NluA0saHbetk
         tMxJbXOFFnAWZNLKxkuHkZ2LtJ6v4AwKJTMivZWFrhetLmyNyCtY0SuU8PjiA3Meynfk
         fo2R/YGtBpWySQj0mpWBWI8U+OSg1HxOi8fy8U6oV8hd3qoM+veHSG2sa3mdwRtvcfjg
         3oeftMh7IhvWWMJPiNc05BeeeCJBnwpnJdRtcNE5KxlfFqqyYfz6RvA+HfnRRuT1CENa
         GVBA==
X-Forwarded-Encrypted: i=1; AL+hErFRDsYjkvH/t2GIgpx6nBm0tqqLglJYKYTNmmS40pBN2QdYi/nPOedrK0e/tlqwvozt+z7eCj/0juGr6w16feY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/70ifRf2gWhsidzK9C8P84smcq1sy04y1yUWoi6+ftFP4aoRfg
	5dsj0NjXtWnTrSzqPdnzMxVaHfvEWH9HdUBljl38AaZTBIhA1WH3KoYtxqVRj/IJXm4=
X-Gm-Gg: AZFdTZfnbbz0MKyNFvfgBvZ4brVrHHDUA2FxQltNfo5CqAtH9sBJ2uvG0rSI5CLbMgK
	M5NXMkS0TBaAtdzYKpucJmft33MX5YeKFcrVbBgF5t9Eu8zk+9hi662mLSBewtJRJtBo3jMgERd
	QwG7I8VqSmAnDG5p9iJGu5/7HHkkEB5t3CKd4t3BaQnyB/vw2a8aw0MdCNTWWE5k/Zynr/OXYdI
	eyfuy5IRycYYDyiFhqkMfp5VswZsvtQHFEvd8uRnWiU3rV9T9WyrgnS4g+k4UlIahGuFNQfGg07
	KaLa1gx+21Y2gSFc8X/wl1YqwX/pVmtjwWug+MF2J4GWqb27OIGMWNG5SFJWHItQedBlIXtGoWy
	X1E9hnLYhtH6ZEKG/Jg7VlzYS/L6BfTIr1JdpI3xMrCpHhi9jGxoXmNASDxtTNf3SHi8ZJhjuCz
	NCyAhN5LmVS/i0NVOeTvqoNO80EmcV9x6fvvtgE+FX1XWEfh8csAsYu1MikcpHMli+QoD36Dhlw
	Z/MHUk38lNGgsmZ4QBVGgR9XHFGDl90kWsJLdJ6iGpe+8FgvQV69kUuG4p+b9eWVu1IkOLAHc4W
	FpIVX6vDxp4/Q6ffLLoobqTo0ryCSTBHdJ+Sfg7Ic9tUYxhd7fC/5i6SZ7jAmc8IPksvUoSO8xj
	Y8HwPtzPpemwgWoeW8LiLwJx6Jb5lMxH63hpNk5xORphSw9oysta3nBQ/tCO9Cb8LIe/key84r8
	UahkmZq5j8Op6LGCL8rb9DsKx6Xn4Y3PsnaTNrNhQHEwoZQemIC8Pmockxo8MgA+4Ei9HM/nreQ
	Z4zLt0bwx773luWsudE0vo=
X-Received: by 2002:a05:690c:b14:b0:8b4:cb03:c8bd with SMTP id 00721157ae682-8b52051dca4mr104628727b3.68.1795890460589;
        Sat, 28 Nov 2026 10:27:40 -0800 (PST)
Received: from [172.20.0.3] (c-73-207-185-9.hsd1.ga.comcast.net. [73.207.185.9])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b5202fb0a2sm106224897b3.27.2026.11.28.10.27.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 10:27:40 -0800 (PST)
Date: Sat, 28 Nov 2026 10:27:38 -0800
Message-ID: <3131fae711e7e2350689ebf4dbf5cb8209625cf5.1795857773.git.chris@chrisdown.name>
In-Reply-To: <cover.1795857773.git.chris@chrisdown.name>
References: <cover.1795857773.git.chris@chrisdown.name>
From: Chris Down <chris@chrisdown.name>
Subject: [PATCH v2 4/7] kho: Expose rejected handovers that look like cold
 boots
To: Pasha Tatashin <pasha.tatashin@soleen.com>,
    Mike Rapoport <rppt@kernel.org>,
    Pratyush Yadav <pratyush@kernel.org>
Cc: Alexander Graf <graf@amazon.com>,
    Baoquan He <baoquan.he@linux.dev>,
    Jonathan Corbet <corbet@lwn.net>,
    Shuah Khan <skhan@linuxfoundation.org>,
    kexec@lists.infradead.org,
    linux-mm@kvack.org,
    linux-kernel@vger.kernel.org,
    linux-doc@vger.kernel.org,
    linux-kselftest@vger.kernel.org,
    kernel-team@meta.com,
    Breno Leitao <leitao@debian.org>,
    sashiko-bot@kernel.org
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

At Meta, our rollout needs to stop if the new kernel rejects the KHO
handover. For example, if it doesn't recognise the handover FDT's
compatible string, it can boot normally with all the preserved state
lost. LUO's incoming/state reads "none", as on a cold boot. We log
"disabling KHO revival", but our fleet collector reads procfs and sysfs
and can't rely on kernel logs from every host.

Let's add /sys/kernel/kho/incoming/state so the collector can tell a
rejected handover from an ordinary boot. "revived" means the kernel
accepted the handover and completed the preserved memory map walk. LUO
reports the outcome of restoring sessions separately.

KHO has no sysfs directory yet, so this adds /sys/kernel/kho in its own
file, kho_sysfs.c. It is set up separately from kho_init(), because
kho_init() returns early when KHO is disabled, and a rejected handover
still needs to be reported then.

Signed-off-by: Chris Down <chris@chrisdown.name>
---
 .../ABI/testing/sysfs-class-misc-liveupdate   |  3 ++
 Documentation/ABI/testing/sysfs-kernel-kho    | 11 ++++
 Documentation/admin-guide/mm/kho.rst          |  8 +++
 MAINTAINERS                                   |  2 +
 kernel/liveupdate/Makefile                    |  2 +-
 kernel/liveupdate/kexec_handover.c            |  9 ++++
 kernel/liveupdate/kexec_handover_internal.h   |  8 +++
 kernel/liveupdate/kho_sysfs.c                 | 54 +++++++++++++++++++
 8 files changed, 96 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/ABI/testing/sysfs-kernel-kho
 create mode 100644 kernel/liveupdate/kho_sysfs.c

diff --git a/Documentation/ABI/testing/sysfs-class-misc-liveupdate b/Documentation/ABI/testing/sysfs-class-misc-liveupdate
index 25e3b49d7aeb..8c3814ee3d37 100644
--- a/Documentation/ABI/testing/sysfs-class-misc-liveupdate
+++ b/Documentation/ABI/testing/sysfs-class-misc-liveupdate
@@ -19,6 +19,9 @@ Description:	read only
 		"deserialized"  The sessions can be retrieved.
 		"failed"        Deserialization failed. Opening
 		                /dev/liveupdate returns -EIO.
+
+		See /sys/kernel/kho/incoming/state for the status of
+		the underlying KHO handover.
 Users:		system monitoring
 
 What:		/sys/class/misc/liveupdate/incoming/sessions
diff --git a/Documentation/ABI/testing/sysfs-kernel-kho b/Documentation/ABI/testing/sysfs-kernel-kho
new file mode 100644
index 000000000000..21488e35d1f3
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-kernel-kho
@@ -0,0 +1,11 @@
+What:		/sys/kernel/kho/incoming/state
+Date:		Nov 2026
+Contact:	kexec@lists.infradead.org
+Description:	read only
+		Status of the incoming KHO handover:
+
+		"none"     No handover was passed to this kernel.
+		"revived"  The kernel accepted the handover and completed
+		           the walk of its preserved memory map.
+		"failed"   The kernel rejected the handover.
+Users:		system monitoring
diff --git a/Documentation/admin-guide/mm/kho.rst b/Documentation/admin-guide/mm/kho.rst
index 4281da6be5fa..8810813a5d0a 100644
--- a/Documentation/admin-guide/mm/kho.rst
+++ b/Documentation/admin-guide/mm/kho.rst
@@ -81,6 +81,14 @@ At scale, correlating crashes to the previous kernel version enables
 faster root cause analysis when issues only occur in specific kernel
 transition scenarios.
 
+sysfs Interfaces
+================
+
+``/sys/kernel/kho/incoming/state``
+    Status of the incoming KHO handover.
+
+See Documentation/ABI/testing/sysfs-kernel-kho for the sysfs ABI.
+
 debugfs Interfaces
 ==================
 
diff --git a/MAINTAINERS b/MAINTAINERS
index 5c74e7dfcdc0..baf39fcc0e87 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14779,6 +14779,7 @@ L:	kexec@lists.infradead.org
 L:	linux-mm@kvack.org
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/liveupdate/linux.git
+F:	Documentation/ABI/testing/sysfs-kernel-kho
 F:	Documentation/admin-guide/mm/kho.rst
 F:	Documentation/core-api/kho/*
 F:	include/asm-generic/kexec_handover.h
@@ -14786,6 +14787,7 @@ F:	include/linux/kexec_handover.h
 F:	include/linux/kho/
 F:	include/linux/kho_block.h
 F:	kernel/liveupdate/kexec_handover*
+F:	kernel/liveupdate/kho_sysfs.c
 F:	lib/test_kho.c
 F:	tools/testing/selftests/kho/
 
diff --git a/kernel/liveupdate/Makefile b/kernel/liveupdate/Makefile
index d9f469462556..6de82ffe8d40 100644
--- a/kernel/liveupdate/Makefile
+++ b/kernel/liveupdate/Makefile
@@ -7,7 +7,7 @@ luo-y :=								\
 		luo_flb.o						\
 		luo_session.o
 
-obj-$(CONFIG_KEXEC_HANDOVER)		+= kexec_handover.o
+obj-$(CONFIG_KEXEC_HANDOVER)		+= kexec_handover.o kho_sysfs.o
 obj-$(CONFIG_KEXEC_HANDOVER_DEBUGFS)	+= kexec_handover_debugfs.o
 
 obj-$(CONFIG_LIVEUPDATE)		+= luo.o
diff --git a/kernel/liveupdate/kexec_handover.c b/kernel/liveupdate/kexec_handover.c
index 233c126f6352..aff96aa401f8 100644
--- a/kernel/liveupdate/kexec_handover.c
+++ b/kernel/liveupdate/kexec_handover.c
@@ -102,6 +102,7 @@ struct kho_in {
 	phys_addr_t bootmem_phys;
 	char previous_release[__NEW_UTS_LEN + 1];
 	u32 kexec_count;
+	enum kho_incoming_state state;
 	struct kho_debugfs dbg;
 	struct kho_radix_tree radix_tree;
 };
@@ -1744,6 +1745,7 @@ err:
 	 */
 	kho_in.fdt_phys = 0;
 	kho_in.radix_tree.root = NULL;
+	kho_in.state = KHO_INCOMING_FAILED;
 }
 
 static __init int kho_out_fdt_setup(void)
@@ -1770,6 +1772,11 @@ static __init int kho_out_fdt_setup(void)
 	return err;
 }
 
+enum kho_incoming_state kho_in_state(void)
+{
+	return kho_in.state;
+}
+
 static void __init kho_in_kexec_metadata(void)
 {
 	struct kho_kexec_metadata *metadata;
@@ -1981,6 +1988,7 @@ err:
 	 */
 	kho_in.fdt_phys = 0;
 	kho_in.bootmem_phys = 0;
+	kho_in.state = KHO_INCOMING_FAILED;
 }
 
 void __init kho_memory_init(void)
@@ -2079,6 +2087,7 @@ unmap_bootmem:
 unmap_fdt:
 	early_memunmap(fdt, fdt_len);
 report:
+	kho_in.state = populated ? KHO_INCOMING_REVIVED : KHO_INCOMING_FAILED;
 	if (!populated)
 		pr_warn("disabling KHO revival\n");
 }
diff --git a/kernel/liveupdate/kexec_handover_internal.h b/kernel/liveupdate/kexec_handover_internal.h
index e9685e1ef6d7..b559f5d43116 100644
--- a/kernel/liveupdate/kexec_handover_internal.h
+++ b/kernel/liveupdate/kexec_handover_internal.h
@@ -22,6 +22,14 @@ struct kho_debugfs {};
 extern struct kho_bootmem *kho_bootmem;
 extern unsigned int kho_bootmem_cnt;
 
+enum kho_incoming_state {
+	KHO_INCOMING_NONE,
+	KHO_INCOMING_REVIVED,
+	KHO_INCOMING_FAILED,
+};
+
+enum kho_incoming_state kho_in_state(void);
+
 #ifdef CONFIG_KEXEC_HANDOVER_DEBUGFS
 int kho_debugfs_init(void);
 void kho_in_debugfs_init(struct kho_debugfs *dbg, const void *fdt);
diff --git a/kernel/liveupdate/kho_sysfs.c b/kernel/liveupdate/kho_sysfs.c
new file mode 100644
index 000000000000..eb2e4ce72f20
--- /dev/null
+++ b/kernel/liveupdate/kho_sysfs.c
@@ -0,0 +1,54 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * kho_sysfs.c - kexec handover sysfs interfaces
+ */
+
+#include <linux/init.h>
+#include <linux/kobject.h>
+#include <linux/sysfs.h>
+#include "kexec_handover_internal.h"
+
+static const char * const kho_incoming_state_names[] = {
+	[KHO_INCOMING_NONE]	= "none",
+	[KHO_INCOMING_REVIVED]	= "revived",
+	[KHO_INCOMING_FAILED]	= "failed",
+};
+
+static ssize_t state_show(struct kobject *kobj, struct kobj_attribute *attr,
+			  char *buf)
+{
+	return sysfs_emit(buf, "%s\n", kho_incoming_state_names[kho_in_state()]);
+}
+static struct kobj_attribute state_attr = __ATTR_RO(state);
+
+static struct attribute *incoming_attrs[] = {
+	&state_attr.attr,
+	NULL
+};
+
+static const struct attribute_group incoming_group = {
+	.name	= "incoming",
+	.attrs	= incoming_attrs,
+};
+
+/*
+ * Set up separately from kho_init(), because kho_init() returns early
+ * when KHO is disabled, and a rejected handover still needs to be
+ * reported then.
+ */
+static int __init kho_sysfs_init(void)
+{
+	struct kobject *kho_kobj;
+	int err;
+
+	kho_kobj = kobject_create_and_add("kho", kernel_kobj);
+	if (!kho_kobj)
+		return -ENOMEM;
+
+	err = sysfs_create_group(kho_kobj, &incoming_group);
+	if (err)
+		kobject_put(kho_kobj);
+
+	return err;
+}
+late_initcall(kho_sysfs_init);
-- 
2.56.1

