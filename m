Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793719144;
	b=i4YtwaB9FiLul4rt4kZwvGivecq5hEDfH4fx1dqEGHNF/uCWBWhzSo/Ymm+DMcGwZVYl
	 clJEtSPL8MrFxlw7Z0YeD5Hbnl8Nl5Krs4Q34hgEXZi7xlbeI2nDyS5qo2wOEt+zhNvcf
	 FMqNcORH69B20WuxKYadRGtnCzUYbYVhYLmdYQEcaF6t3eF7ibk2ontBng9jaq4aiRodt
	 zVj8RmFCZpDFRTKSVT4orsyG8W0UFeqiJBt4E8FzLYQ4nvZ+O0PI69Js2sjY4AmwYBMV8
	 +6D680ojI4L+ym/Qgg5ufgGZB67L0r1F0qFfXZOiC7L1ePvplrmJJXcotLODRV6RD1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793719144;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=Ed/gwawEhmgCUsO2zTzDURm/4rT61HQtm1nt/NY8TTM=;
	b=XNVQt7lcjcxDyZgdpmmXyd0L6tK+Y+/hTwln3WnevWzU1+BvavLCNwAKLfK0tIH5XYD0
	 kAYkX8N9q3WSMoWXrhemgZXPtWusxqg7rHrFocI5r6vOt18wmbzH4rGJofrOe/W7XclAH
	 DLbK52cAuZHZ2Xs8CkoF/pWiROp11oH+U2cHg/vLkVDvyGlJ/zZaq9EF1xYsVCuD64jBJ
	 s3QNrIPzsqyBac2bgJrqvAYeJFE62Hjvm4Pb6XiU+7a4c17YCXU/Y8sJPwIs1zTxgU/wN
	 0GtlwmhMB5vXV8WOfZyzvjyPk3tI4h8G8wMpDqY724JkU+ntyLYUaTAD+8mnmOOs9Gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=LjkGSTSx;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B3160A2623
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Nov 2026 15:19:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89B3160A2623
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=LjkGSTSx
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cdac6d19ddaso1719993a12.2
        for <linux-kselftest@vger.kernel.org>; Tue, 03 Nov 2026 07:19:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793719144; x=1794323944; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Ed/gwawEhmgCUsO2zTzDURm/4rT61HQtm1nt/NY8TTM=;
        b=LjkGSTSxekW6xIIn3mTxQgw/diszga0IGombK+vxWIc8cEl3FzTKktJOCqwZR2d8Q4
         1u8EkadbjKwkreFDFOWrUbmHdxhazi7emzWeS8O8DqRnmB9Dec6vHtU+k3ikVuAGVUdF
         KnAN6OIzEEo6NvzWavNf6tS23ERsjmM7z/Hq0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793719144; x=1794323944;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ed/gwawEhmgCUsO2zTzDURm/4rT61HQtm1nt/NY8TTM=;
        b=BS82wXK50iYic8bHNi93CWnY2l6YGpIFTrKZVrhUSHGPjC1GK0y9Qx77oPcyK//rNY
         weTXGOgtyunDv+RfYvITxUi/Evf0V05QHYF5bWntLyjzrle7RWQJz4bDj1iVxQw/Xf69
         l2jHMRS/1Z/W3qHQGXVigxt8nO0cAI4Sp9M3uWZYUDdN7FwG/UFpTfSbY/DVHm/HzvnZ
         t2YL6TqgCu/Sz0M0dzADmaUwNZOlqKdDCbMuFUZraSsODZmVt8tSbXhSpuOP0BG4wrhM
         dm5oMJ8HXVIpng+Un43guNzZY4HFqiwt06+4HhDIPpOKVEwg1nZCDs4OBYLFJIR7hMJj
         6TmA==
X-Forwarded-Encrypted: i=1; AKwUvByIgbv0SnZRSISkiMe4kheHO55w6ng1hqz0O4zqRcsIil8c+HR2nMhOvLVL3dJlie85AFcWJqLMcAhWHCc0qho=@vger.kernel.org
X-Gm-Message-State: APuU4Z8MN2VMloZbIayugjHpc1Q03y4vfpnwKH8YKDfjpniHJSVHuFdc
	hMPKp5vGmJQ0j0wKyGlGmgPnSKEuzBv+F+zR2pm2Gads9sL+b7daS03iEvylIkvGQOk=
X-Gm-Gg: AYBFou1UjUgMS+vYQ4pdrMGmiC3mQScR3uRGz4BkbFHXIBOSCKbvgZsT9L6fawdsVNN
	LZEbPd6zmzv7U2jIyXeVHkCE22kVSZVxE5uixL9UsMEHR4qw4+dEOr8HRCiBC2ZRnDmqAKCVlne
	LM00CzRlLrO2rGauA38lAugfB1G9yAdJt0kwmbGrvpsgBzeHQfoKHt4DmoNTAULkTue57DrbBP/
	PGQTZwb4gynLtEd9RWPSZuf/VttavoNp+uc2skgVt6xiIgHdHE8U5lXFxRe+MRmptOXm+QW2Vln
	Nq5QtEdC6cg7XVNvlzqoG6fspvW2vyNd+A7Fm2oQgAxTNJnecFnznphqozE7rgVpGeWoCA31LDa
	G6SawdDQ5i+W9TFH8HYCuEnEVnUyXdJvH4sHgKWsTmFAwaxdyMiAwD3Hu4e6k/vOMjIIt9KnDFI
	6K5ZfaxrUnqjDzL8sPug3nxU+cIALs9cV5CB0W5k/Sz8HDaCWgQ2ocbYjIxrRYZdhrxYRvZkQwZ
	i0Aj5xQBdA4q/LTsCdoJe+dgozPPUhAvLb7A1HbPj1/qbwInJhIO76j7qhz1eqkpAfFd6SLIeLY
	nR8XBOioniggxXI7zpziR4v+qR8oCAnJfUqWCl8cFP6rg0JUNAHcFBoLMlCBZiByjBlHBRUeeE4
	nyDc2fQEYKlqYNFh36gB75RU/3TnVldfo53v5TXUVq1y284Qyh0p4wmWrS7uAyqvI+uS7p4SKDO
	WPuXptlwzYKgVh5+BtdA==
X-Received: by 2002:a17:903:1b05:b0:2db:733c:fd1f with SMTP id d9443c01a7336-2eb364005f0mr112964235ad.8.1793719143805;
        Tue, 03 Nov 2026 07:19:03 -0800 (PST)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39262c47sm43118815ad.38.2026.11.03.07.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:19:02 -0800 (PST)
Date: Tue, 3 Nov 2026 23:18:59 +0800
From: Chris Down <chris@chrisdown.name>
To: Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>
Cc: Jeff Xu <jeffxu@google.com>, David Hildenbrand <david@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Kees Cook <kees@kernel.org>,
	Andrey Vagin <avagin@gmail.com>,
	Alexander Mikhalitsyn <alexander@mihalicyn.com>,
	Shuah Khan <shuah@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>, Jiri Olsa <jolsa@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>, linux-mm@kvack.org,
	linux-hardening@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-security-module@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: [PATCH v2 7/8] mm/mseal: Add no_mseal_sys_mappings boot parameter
Message-ID: <701a3346a0105e801d247c11139853f156a8d15a.1793718940.git.chris@chrisdown.name>
References: <cover.1793718940.git.chris@chrisdown.name>
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
In-Reply-To: <cover.1793718940.git.chris@chrisdown.name>
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

CONFIG_MSEAL_SYSTEM_MAPPINGS seals each process' system mappings, such
as the vDSO, when they are created. These are read-only or execute-only
mappings which every process trusts, so sealing them means that a memory
corruption bug which can pass a bad pointer to mprotect(), mremap() or
munmap() can't be used to make them writable, or to move or replace
them.

However, sealing can only be chosen at build time, and it breaks
software which moves or modifies these mappings. This is not ideal,
since hosts which want sealing and hosts which run such software then
can't share a kernel.

For example, at Meta, we build sealing into the kernel for our VM hosts,
and we'd like it on as much of the rest of the fleet as possible. The
problem is that the rest of the fleet also runs things which it breaks.
As one example among many, Reverie (which our deterministic execution
tool, Hermit, is built on) patches the vDSO of the processes it traces
by injecting an mprotect() [0]. So right now the hosts which want
sealing need their own kernel image, and this option is one of the
things which forces that.

So, to improve this, let's add no_mseal_sys_mappings. That way one
kernel can be built with CONFIG_MSEAL_SYSTEM_MAPPINGS=y, keep sealing on
by default, and turn it off only on the hosts which need it. Kernels
built without the option are unchanged.

Since sealing can now be turned off at boot, MSEAL_SYSTEM_MAPPINGS also
no longer needs to depend on !CHECKPOINT_RESTORE. The option is off by
default and already documents that it breaks CRIU, so let's drop the
dependency. For the same reason, the documentation no longer needs to
say that it can't be enabled universally.

Link: https://docs.rs/reverie-core/latest/reverie/vdso/index.html # [0]
Signed-off-by: Chris Down <chris@chrisdown.name>
---
 Documentation/admin-guide/kernel-parameters.txt |  7 +++++++
 Documentation/userspace-api/mseal.rst           |  9 +++++----
 mm/Kconfig                                      | 15 ++++++++-------
 mm/mseal.c                                      | 12 ++++++++++++
 mm/vma.h                                        |  5 ++++-
 5 files changed, 36 insertions(+), 12 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 0b3c140babd9..a72904ebb98d 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -4603,6 +4603,13 @@ Kernel parameters
 
 	nomodule	Disable module load
 
+	no_mseal_sys_mappings
+			[KNL,EARLY] With CONFIG_MSEAL_SYSTEM_MAPPINGS, don't
+			seal system mappings such as the vDSO. Sealing them
+			breaks software which moves, unmaps or modifies them,
+			such as CHECKPOINT_RESTORE (CRIU), UML, gVisor and rr.
+			See Documentation/userspace-api/mseal.rst.
+
 	nonmi_ipi	[X86] Disable using NMI IPIs during panic/reboot to
 			shutdown the other cpus.  Instead use the REBOOT_VECTOR
 			irq.
diff --git a/Documentation/userspace-api/mseal.rst b/Documentation/userspace-api/mseal.rst
index 060c9829306b..0efdc5469085 100644
--- a/Documentation/userspace-api/mseal.rst
+++ b/Documentation/userspace-api/mseal.rst
@@ -143,12 +143,13 @@ Use cases
 
   If supported by an architecture (CONFIG_ARCH_SUPPORTS_MSEAL_SYSTEM_MAPPINGS),
   the CONFIG_MSEAL_SYSTEM_MAPPINGS seals all system mappings of this
-  architecture.
+  architecture. The ``no_mseal_sys_mappings`` kernel command line parameter
+  turns this off.
 
   WARNING: This feature breaks programs which rely on relocating
-  or unmapping system mappings. Known broken software at the time
-  of writing includes CHECKPOINT_RESTORE, UML, gVisor, rr. Therefore
-  this config can't be enabled universally.
+  or unmapping system mappings. Software known to break with it
+  at the time of writing includes CHECKPOINT_RESTORE, UML, gVisor
+  and rr.
 
 When not to use mseal
 =====================
diff --git a/mm/Kconfig b/mm/Kconfig
index 316515589cdb..bb2a60f52c8e 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -1359,24 +1359,25 @@ config MSEAL_SYSTEM_MAPPINGS
 	bool "mseal system mappings"
 	depends on 64BIT
 	depends on ARCH_SUPPORTS_MSEAL_SYSTEM_MAPPINGS
-	depends on !CHECKPOINT_RESTORE
 	help
 	  Apply mseal on system mappings.
 	  The system mappings includes vdso, vvar, vvar_vclock,
 	  vectors (arm compat-mode), sigpage (arm compat-mode), uprobes,
 	  uprobe trampolines (x86).
 
-	  A 64-bit kernel is required for the memory sealing feature.
-	  No specific hardware features from the CPU are needed.
-
 	  WARNING: This feature breaks programs which rely on relocating
-	  or unmapping system mappings. Known broken software at the time
-	  of writing includes CHECKPOINT_RESTORE, UML, gVisor, rr. Therefore
-	  this config can't be enabled universally.
+	  or unmapping system mappings. Software known to break with it
+	  at the time of writing includes CHECKPOINT_RESTORE, UML, gVisor
+	  and rr.
+
+	  With this configuration option set, the feature can be disabled
+	  with the no_mseal_sys_mappings boot parameter.
 
 	  For complete descriptions of memory sealing, please see
 	  Documentation/userspace-api/mseal.rst
 
+	  If unsure, say N.
+
 config HAVE_ARCH_USERFAULTFD_WP
 	bool
 	help
diff --git a/mm/mseal.c b/mm/mseal.c
index 7a8ac66dc215..271b44e628c5 100644
--- a/mm/mseal.c
+++ b/mm/mseal.c
@@ -7,6 +7,7 @@
  *  Author: Jeff Xu <jeffxu@chromium.org>
  */
 
+#include <linux/init.h>
 #include <linux/mempolicy.h>
 #include <linux/minmax.h>
 #include <linux/mman.h>
@@ -16,6 +17,17 @@
 #include <linux/sched.h>
 #include "internal.h"
 
+#ifdef CONFIG_MSEAL_SYSTEM_MAPPINGS
+bool mseal_system_mappings_disabled __ro_after_init;
+
+static int __init early_no_mseal_sys_mappings(char *buf)
+{
+	mseal_system_mappings_disabled = true;
+	return 0;
+}
+early_param("no_mseal_sys_mappings", early_no_mseal_sys_mappings);
+#endif
+
 static bool range_contains_unmapped(unsigned long start, unsigned long end)
 {
 	VMA_ITERATOR(vmi, current->mm, start);
diff --git a/mm/vma.h b/mm/vma.h
index 3982b239d0b4..11ff9c7d6592 100644
--- a/mm/vma.h
+++ b/mm/vma.h
@@ -800,9 +800,12 @@ static inline bool vma_is_sealed(struct vm_area_struct *vma)
 }
 #endif
 
+extern bool mseal_system_mappings_disabled;
+
 static inline bool mseal_system_mappings(void)
 {
-	return IS_ENABLED(CONFIG_MSEAL_SYSTEM_MAPPINGS);
+	return IS_ENABLED(CONFIG_MSEAL_SYSTEM_MAPPINGS) &&
+	       !mseal_system_mappings_disabled;
 }
 
 #if defined(CONFIG_STACK_GROWSUP)
-- 
2.54.0

