Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792709443;
	b=vy+2bTaGuk7vtxoP5OLuk/5RITHA+lAMwH82IWURQieA7w/Nw+C9e/BiP/WC+m+m6pEc
	 SovPmKv6GMrz5tzlEWTSfGRY+yEKRRLFJ0xzBH+Qh/6A3l5oNRtotAqvGWfhlnmcnyN95
	 0jj2oGlSHP3LartZj5HTOKcfNoHxsEg/rwemGUEzBeGnuqfPvIE5epS24L4WoWoN+OlQX
	 /HizM9Jd4A+Vd/pQURIHs0PGLUjB+VZu3ffoPLc2uNNykkvLtCFrlVP9pKH8i+FcVD6SU
	 mMfD6IqCLW6K5th49dQ+ClsnPXkLY1kFwHSnZ7edN57Sbe3+uL5QYa2zX0++AGY4rqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792709443;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=a6J8HagnpENiQ+UCGH9udJuoBmm3aNobu1K7fxrXdFI=;
	b=qAIuEwnde4zcZkRTq/12dTOjX0iD1CwSpQW6+2iiqOJQv+l6NovYhwANuR7/QDhfJk1j
	 Ot9+jSg0hAFsxTP1OogQax/ebD425XhJD8e1DtP3hOlc+VtOjndjNWJujscQlKY97PvsG
	 aullIHk4ukvFbXNflP6H9mzbMrVZj7caF6iA7Ca70RxQuFBEePhCyGr0XSWg9ez+sjHy1
	 LK62qDyvEZlY8zKQ+KTh/z1Mucqaruk+so0nsmk7n608qtX64NoKLVXEJc2JQjpzgPgTv
	 JZpgBzyvLKAH47AwveEqP1Wj+y0TsJjk7xPzJAaciLvdf3irANfpowMCtuJdtG4Jq4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=TJ+ENCU7;
	arc=none smtp.remote-ip=209.85.214.199
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DABD606A332
	for <linux-kselftest@vger.kernel.org>; Thu, 22 Oct 2026 22:50:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DABD606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=TJ+ENCU7
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e93e2f72bfso2654155ad.3
        for <linux-kselftest@vger.kernel.org>; Thu, 22 Oct 2026 15:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792709442; x=1793314242; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a6J8HagnpENiQ+UCGH9udJuoBmm3aNobu1K7fxrXdFI=;
        b=TJ+ENCU7DXeaO/Pu7winkhrmgrGEz5TO8XRhGZNIYnMBSgEN6VHAckNF5AhEX5O9y9
         e5QYLDwIDk4DniUpwTVfTbtDiDXwFNS2MewRAH8GN2VW/9AyjbSxF6yPVqR9U7geaKdv
         1I443kGaYnuBILqXF/yBDCAZcZHWYOSucycM/iu2Jk6H/d7POQzw30izy1QBOZq2E9KI
         jcEOEN1mtd1ZmX55NjN/sjOcyDO44IjqGGL7Dfh2eWnsrR4wvB3w5wdUphG0QtXyV7dB
         TiuoA0JavhbDQ7viekR2WEJyl+j9r5Gjp1IWl6Qa1f9QcqVNHFMQyMIewO+Ueqsi3cxB
         GhtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792709442; x=1793314242;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a6J8HagnpENiQ+UCGH9udJuoBmm3aNobu1K7fxrXdFI=;
        b=fnWr4VHgt9CqonjmuUFU8hEnmX0NBiyDkMcbyqNmXNN7T4bvcmpK9gXfyBUd7uhLXN
         MwYY1JlLTJq0bY1BWRIaHSeTS0ebJCft6Vj/fwB+fu66d78P7FNo0puG7I+NvIVrZ2gP
         bzarK9KlNL+Sf3/Lazj+FEbOh5VjH3lRlF6RXLikdcZ2ok7Cd6rUTxe1yUkX2RmluNMP
         5aJxa6LaGmtGBPTNH8KgmS0gIrUcK3pAFs41WSo1bOlli3jq0twHqRYRzzPVRvMAdJWR
         smyZTdvhVm/A+gGHNtYtv5f0qsIiAb0LQ1deJGUWAS6vrrW5nluHHU0hjJq7nerNm+Kq
         C8UA==
X-Forwarded-Encrypted: i=1; AKwUvBxMRwWB7tdnjuC3/lLD+P41/9GV0tPhWHXSrIUlow+ulhFTRFT9XdlAS+OmqGxYeVf7bzB2iPS1DtfwNDmvYos=@vger.kernel.org
X-Gm-Message-State: AFq9FYI0qwpMq5AsMhy/Tw2StdRhsTpsyACJ1OWVz9Tl/6V7kgJ32h39
	WQ0doRx7gudIn7xBZQjbTetYuE10lTwatRsViByk8dcat52W7wz+gYs+cc6JCTcd1tKrG7v2FJn
	GePHFW5kibSVaOQ==
X-Received: from plbl14.prod.google.com ([2002:a17:902:eb0e:b0:2e8:af72:767])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:3850:b0:2e9:4d9f:a65b with SMTP id d9443c01a7336-2ea7d132eaamr5553695ad.53.1792709441528;
 Thu, 22 Oct 2026 15:50:41 -0700 (PDT)
Date: Thu, 22 Oct 2026 22:50:29 +0000
In-Reply-To: <20261022225035.377445-1-dmatlack@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261022225035.377445-1-dmatlack@google.com>
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
Message-ID: <20261022225035.377445-5-dmatlack@google.com>
Subject: [PATCH v2 04/10] mm: Rename memfd_luo to shmem_luo
From: David Matlack <dmatlack@google.com>
To: kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org
Cc: Alexander Graf <graf@amazon.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Christian Brauner <brauner@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Hugh Dickins <hughd@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	"Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Mike Rapoport <rppt@kernel.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Samiullah Khawaja <skhawaja@google.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@kernel.org>, 
	David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"

Rename the memfd Live Update file handler from memfd_luo to shmem_luo,
including the source file, its KHO ABI header, its documentation and its
Kconfig option (CONFIG_LIVEUPDATE_MEMFD to CONFIG_LIVEUPDATE_SHMEM).

The handler preserves shmem files. Today those are memfds, but following
commits extend it to other files on tmpfs mounts, for which the memfd
name is confusing. Preserving memfds created with MFD_HUGETLB, which are
hugetlbfs files, will need a separate handler, so naming the handler
after the filesystem that backs the files also avoids having to rename
it again then.

Don't change the compatible string of the handler, "memfd-v2". It is
matched against the preserved state from the previous kernel, so
changing it would break live updates from kernels that use the old
name. The serialized format doesn't change either.

Also clarify in the documentation that memfd means a memfd created
without MFD_HUGETLB, and name the ABI documentation after the handler.

No functional change intended.

Assisted-by: LLM
Signed-off-by: David Matlack <dmatlack@google.com>
---
 Documentation/core-api/liveupdate.rst         |   2 +-
 Documentation/mm/index.rst                    |   2 +-
 ...reservation.rst => shmem_preservation.rst} |   8 +-
 MAINTAINERS                                   |   4 +-
 include/linux/kho/abi/{memfd.h => shmem.h}    |  41 ++++---
 kernel/liveupdate/Kconfig                     |   2 +-
 mm/Makefile                                   |   2 +-
 mm/{memfd_luo.c => shmem_luo.c}               | 115 +++++++++---------
 8 files changed, 89 insertions(+), 87 deletions(-)
 rename Documentation/mm/{memfd_preservation.rst => shmem_preservation.rst} (66%)
 rename include/linux/kho/abi/{memfd.h => shmem.h} (65%)
 rename mm/{memfd_luo.c => shmem_luo.c} (81%)

diff --git a/Documentation/core-api/liveupdate.rst b/Documentation/core-api/liveupdate.rst
index 2bce2644eba2..669722002440 100644
--- a/Documentation/core-api/liveupdate.rst
+++ b/Documentation/core-api/liveupdate.rst
@@ -37,7 +37,7 @@ The following types of file descriptors can be preserved
 .. toctree::
    :maxdepth: 1
 
-   ../mm/memfd_preservation
+   ../mm/shmem_preservation
 
 Public API
 ==========
diff --git a/Documentation/mm/index.rst b/Documentation/mm/index.rst
index 13a79f5d092c..b8ab2f89002d 100644
--- a/Documentation/mm/index.rst
+++ b/Documentation/mm/index.rst
@@ -61,7 +61,7 @@ documentation, or deleted if it has served its purpose.
    hugetlbfs_reserv
    ksm
    memory-model
-   memfd_preservation
+   shmem_preservation
    mmu_notifier
    multigen_lru
    numa
diff --git a/Documentation/mm/memfd_preservation.rst b/Documentation/mm/shmem_preservation.rst
similarity index 66%
rename from Documentation/mm/memfd_preservation.rst
rename to Documentation/mm/shmem_preservation.rst
index c908a12dffa7..e79bf8afaa9e 100644
--- a/Documentation/mm/memfd_preservation.rst
+++ b/Documentation/mm/shmem_preservation.rst
@@ -4,16 +4,16 @@
 Memfd Preservation via LUO
 ==========================
 
-.. kernel-doc:: mm/memfd_luo.c
+.. kernel-doc:: mm/shmem_luo.c
    :doc: Memfd Preservation via LUO
 
 Memfd Preservation ABI
 ======================
 
-.. kernel-doc:: include/linux/kho/abi/memfd.h
-   :doc: memfd Live Update ABI
+.. kernel-doc:: include/linux/kho/abi/shmem.h
+   :doc: shmem Live Update ABI
 
-.. kernel-doc:: include/linux/kho/abi/memfd.h
+.. kernel-doc:: include/linux/kho/abi/shmem.h
    :internal:
 
 See Also
diff --git a/MAINTAINERS b/MAINTAINERS
index 5d1b58271989..742cdce14cf9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15184,14 +15184,14 @@ L:	linux-kernel@vger.kernel.org
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/liveupdate/linux.git
 F:	Documentation/core-api/liveupdate.rst
-F:	Documentation/mm/memfd_preservation.rst
+F:	Documentation/mm/shmem_preservation.rst
 F:	Documentation/userspace-api/liveupdate.rst
 F:	include/linux/kho/abi/
 F:	include/linux/liveupdate.h
 F:	include/uapi/linux/liveupdate.h
 F:	kernel/liveupdate/
 F:	lib/tests/liveupdate.c
-F:	mm/memfd_luo.c
+F:	mm/shmem_luo.c
 F:	tools/testing/selftests/liveupdate/
 
 LLC (802.2)
diff --git a/include/linux/kho/abi/memfd.h b/include/linux/kho/abi/shmem.h
similarity index 65%
rename from include/linux/kho/abi/memfd.h
rename to include/linux/kho/abi/shmem.h
index 08b10fea2afc..b61687e358a2 100644
--- a/include/linux/kho/abi/memfd.h
+++ b/include/linux/kho/abi/shmem.h
@@ -8,49 +8,50 @@
  * Pratyush Yadav <ptyadav@amazon.de>
  */
 
-#ifndef _LINUX_KHO_ABI_MEMFD_H
-#define _LINUX_KHO_ABI_MEMFD_H
+#ifndef _LINUX_KHO_ABI_SHMEM_H
+#define _LINUX_KHO_ABI_SHMEM_H
 
 #include <linux/types.h>
 #include <linux/kho/abi/kexec_handover.h>
 
 /**
- * DOC: memfd Live Update ABI
+ * DOC: shmem Live Update ABI
  *
- * memfd uses the ABI defined below for preserving its state across a kexec
- * reboot using the LUO.
+ * The shmem file handler, which preserves memfds created without
+ * ``MFD_HUGETLB``, uses the ABI defined below for preserving their state across
+ * a kexec reboot using the LUO.
  *
- * The state is serialized into a packed structure `struct memfd_luo_ser`
+ * The state is serialized into a packed structure `struct shmem_luo_ser`
  * which is handed over to the next kernel via the KHO mechanism.
  *
  * This interface is a contract. Any modification to the structure layout
  * constitutes a breaking change. Such changes require incrementing the
- * version number in the MEMFD_LUO_FH_COMPATIBLE string.
+ * version number in the SHMEM_LUO_FH_COMPATIBLE string.
  */
 
 /**
- * MEMFD_LUO_FOLIO_DIRTY - The folio is dirty.
+ * SHMEM_LUO_FOLIO_DIRTY - The folio is dirty.
  *
  * This flag indicates the folio contains data from user. A non-dirty folio is
  * one that was allocated (say using fallocate(2)) but not written to.
  */
-#define MEMFD_LUO_FOLIO_DIRTY		BIT(0)
+#define SHMEM_LUO_FOLIO_DIRTY		BIT(0)
 
 /**
- * MEMFD_LUO_FOLIO_UPTODATE - The folio is up-to-date.
+ * SHMEM_LUO_FOLIO_UPTODATE - The folio is up-to-date.
  *
  * An up-to-date folio has been zeroed out. shmem zeroes out folios on first
  * use. This flag tracks which folios need zeroing.
  */
-#define MEMFD_LUO_FOLIO_UPTODATE	BIT(1)
+#define SHMEM_LUO_FOLIO_UPTODATE	BIT(1)
 
 /**
- * struct memfd_luo_folio_ser - Serialized state of a single folio.
+ * struct shmem_luo_folio_ser - Serialized state of a single folio.
  * @pfn:       The page frame number of the folio.
  * @flags:     Flags to describe the state of the folio.
  * @index:     The page offset (pgoff_t) of the folio within the original file.
  */
-struct memfd_luo_folio_ser {
+struct shmem_luo_folio_ser {
 	u64 pfn:52;
 	u64 flags:12;
 	u64 index;
@@ -60,7 +61,7 @@ struct memfd_luo_folio_ser {
  * The set of seals this version supports preserving. If support for any new
  * seals is needed, add it here and bump version.
  */
-#define MEMFD_LUO_ALL_SEALS (F_SEAL_SEAL | \
+#define SHMEM_LUO_ALL_SEALS (F_SEAL_SEAL | \
 			     F_SEAL_SHRINK | \
 			     F_SEAL_GROW | \
 			     F_SEAL_WRITE | \
@@ -68,7 +69,7 @@ struct memfd_luo_folio_ser {
 			     F_SEAL_EXEC)
 
 /**
- * struct memfd_luo_ser - Main serialization structure for a memfd.
+ * struct shmem_luo_ser - Main serialization structure for a memfd.
  * @pos:       The file's current position (f_pos).
  * @size:      The total size of the file in bytes (i_size).
  * @seals:     The seals present on the memfd. The seals are uABI so it is safe
@@ -76,9 +77,9 @@ struct memfd_luo_folio_ser {
  * @flags:     Flags for the file. Unused flag bits must be set to 0.
  * @nr_folios: Number of folios in the folios array.
  * @folios:    KHO vmalloc descriptor pointing to the array of
- *             struct memfd_luo_folio_ser.
+ *             struct shmem_luo_folio_ser.
  */
-struct memfd_luo_ser {
+struct shmem_luo_ser {
 	u64 pos;
 	u64 size;
 	u32 seals;
@@ -87,7 +88,7 @@ struct memfd_luo_ser {
 	struct kho_vmalloc folios;
 } __packed;
 
-/* The compatibility string for memfd file handler */
-#define MEMFD_LUO_FH_COMPATIBLE	"memfd-v2"
+/* The compatibility string for the shmem file handler */
+#define SHMEM_LUO_FH_COMPATIBLE	"memfd-v2"
 
-#endif /* _LINUX_KHO_ABI_MEMFD_H */
+#endif /* _LINUX_KHO_ABI_SHMEM_H */
diff --git a/kernel/liveupdate/Kconfig b/kernel/liveupdate/Kconfig
index f50daee8eff0..9a1c49e2e0c4 100644
--- a/kernel/liveupdate/Kconfig
+++ b/kernel/liveupdate/Kconfig
@@ -69,7 +69,7 @@ config LIVEUPDATE
 
 	  If unsure, say N.
 
-config LIVEUPDATE_MEMFD
+config LIVEUPDATE_SHMEM
 	bool "Live update support for memfd"
 	depends on LIVEUPDATE
 	depends on MEMFD_CREATE
diff --git a/mm/Makefile b/mm/Makefile
index e7245cb88c66..cbdcc2c6b296 100644
--- a/mm/Makefile
+++ b/mm/Makefile
@@ -100,7 +100,7 @@ obj-$(CONFIG_NUMA) += memory-tiers.o
 obj-$(CONFIG_DEVICE_MIGRATION) += migrate_device.o
 obj-$(CONFIG_TRANSPARENT_HUGEPAGE) += huge_memory.o khugepaged.o
 obj-$(CONFIG_PAGE_COUNTER) += page_counter.o
-obj-$(CONFIG_LIVEUPDATE_MEMFD) += memfd_luo.o
+obj-$(CONFIG_LIVEUPDATE_SHMEM) += shmem_luo.o
 obj-$(CONFIG_MEMCG_V1) += memcontrol-v1.o
 obj-$(CONFIG_MEMCG) += memcontrol.o vmpressure.o
 ifdef CONFIG_BPF_SYSCALL
diff --git a/mm/memfd_luo.c b/mm/shmem_luo.c
similarity index 81%
rename from mm/memfd_luo.c
rename to mm/shmem_luo.c
index 6b68220275eb..b8d86055912d 100644
--- a/mm/memfd_luo.c
+++ b/mm/shmem_luo.c
@@ -18,6 +18,11 @@
  * Update Orchestrator (LUO) file preservation. This allows userspace to
  * transfer its memory contents to the next kernel after a kexec.
  *
+ * Here, a memfd is a memfd created without ``MFD_HUGETLB``, which is a shmem
+ * file on the kernel's internal shmem mount. Memfds created with
+ * ``MFD_HUGETLB`` are hugetlbfs files, which this file handler doesn't
+ * preserve. Preserving them fails with ``-ENOENT``.
+ *
  * The preservation is not intended to be transparent. Only select properties of
  * the file are preserved. All others are reset to default. The preserved
  * properties are described below.
@@ -26,10 +31,6 @@
  *    The LUO API is not stabilized yet, so the preserved properties of a memfd
  *    are also not stable and are subject to backwards incompatible changes.
  *
- * .. note::
- *    Currently a memfd backed by Hugetlb is not supported. Memfds created
- *    with ``MFD_HUGETLB`` will be rejected.
- *
  * Preserved Properties
  * ====================
  *
@@ -52,7 +53,7 @@
  *
  * Seals
  *   File seals set on the memfd are preserved and re-applied on restore.
- *   Only seals known to this LUO version (see ``MEMFD_LUO_ALL_SEALS``) may
+ *   Only seals known to this LUO version (see ``SHMEM_LUO_ALL_SEALS``) may
  *   be present; preservation fails with ``-EOPNOTSUPP`` otherwise.
  *
  * Non-Preserved Properties
@@ -75,7 +76,7 @@
 #include <linux/file.h>
 #include <linux/io.h>
 #include <linux/kexec_handover.h>
-#include <linux/kho/abi/memfd.h>
+#include <linux/kho/abi/shmem.h>
 #include <linux/liveupdate.h>
 #include <linux/shmem_fs.h>
 #include <linux/vmalloc.h>
@@ -84,13 +85,13 @@
 
 #include "internal.h"
 
-static int memfd_luo_preserve_folios(struct file *file,
+static int shmem_luo_preserve_folios(struct file *file,
 				     struct kho_vmalloc *kho_vmalloc,
-				     struct memfd_luo_folio_ser **out_folios_ser,
+				     struct shmem_luo_folio_ser **out_folios_ser,
 				     u64 *nr_foliosp)
 {
 	struct inode *inode = file_inode(file);
-	struct memfd_luo_folio_ser *folios_ser;
+	struct shmem_luo_folio_ser *folios_ser;
 	unsigned int max_folios;
 	long i, size, nr_pinned;
 	struct folio **folios;
@@ -145,7 +146,7 @@ static int memfd_luo_preserve_folios(struct file *file,
 	}
 
 	for (i = 0; i < nr_folios; i++) {
-		struct memfd_luo_folio_ser *pfolio = &folios_ser[i];
+		struct shmem_luo_folio_ser *pfolio = &folios_ser[i];
 		struct folio *folio = folios[i];
 
 		err = kho_preserve_folio(folio);
@@ -196,7 +197,7 @@ static int memfd_luo_preserve_folios(struct file *file,
 		folio_unlock(folio);
 
 		pfolio->pfn = folio_pfn(folio);
-		pfolio->flags = MEMFD_LUO_FOLIO_DIRTY | MEMFD_LUO_FOLIO_UPTODATE;
+		pfolio->flags = SHMEM_LUO_FOLIO_DIRTY | SHMEM_LUO_FOLIO_UPTODATE;
 		pfolio->index = folio->index;
 	}
 
@@ -227,8 +228,8 @@ static int memfd_luo_preserve_folios(struct file *file,
 	return err;
 }
 
-static void memfd_luo_unpreserve_folios(struct kho_vmalloc *kho_vmalloc,
-					struct memfd_luo_folio_ser *folios_ser,
+static void shmem_luo_unpreserve_folios(struct kho_vmalloc *kho_vmalloc,
+					struct shmem_luo_folio_ser *folios_ser,
 					u64 nr_folios)
 {
 	long i;
@@ -239,7 +240,7 @@ static void memfd_luo_unpreserve_folios(struct kho_vmalloc *kho_vmalloc,
 	kho_unpreserve_vmalloc(kho_vmalloc);
 
 	for (i = 0; i < nr_folios; i++) {
-		const struct memfd_luo_folio_ser *pfolio = &folios_ser[i];
+		const struct shmem_luo_folio_ser *pfolio = &folios_ser[i];
 		struct folio *folio;
 
 		if (!pfolio->pfn)
@@ -254,11 +255,11 @@ static void memfd_luo_unpreserve_folios(struct kho_vmalloc *kho_vmalloc,
 	vfree(folios_ser);
 }
 
-static int memfd_luo_preserve(struct liveupdate_file_op_args *args)
+static int shmem_luo_preserve(struct liveupdate_file_op_args *args)
 {
 	struct inode *inode = file_inode(args->file);
-	struct memfd_luo_folio_ser *folios_ser;
-	struct memfd_luo_ser *ser;
+	struct shmem_luo_folio_ser *folios_ser;
+	struct shmem_luo_ser *ser;
 	u64 nr_folios, inode_size;
 	int err = 0, seals;
 
@@ -279,7 +280,7 @@ static int memfd_luo_preserve(struct liveupdate_file_op_args *args)
 	}
 
 	/* Make sure the file only has the seals supported by this version. */
-	if (seals & ~MEMFD_LUO_ALL_SEALS) {
+	if (seals & ~SHMEM_LUO_ALL_SEALS) {
 		err = -EOPNOTSUPP;
 		goto err_free_ser;
 	}
@@ -299,7 +300,7 @@ static int memfd_luo_preserve(struct liveupdate_file_op_args *args)
 	ser->size = inode_size;
 	ser->seals = seals;
 
-	err = memfd_luo_preserve_folios(args->file, &ser->folios,
+	err = shmem_luo_preserve_folios(args->file, &ser->folios,
 					&folios_ser, &nr_folios);
 	if (err)
 		goto err_free_ser;
@@ -320,9 +321,9 @@ static int memfd_luo_preserve(struct liveupdate_file_op_args *args)
 	return err;
 }
 
-static int memfd_luo_freeze(struct liveupdate_file_op_args *args)
+static int shmem_luo_freeze(struct liveupdate_file_op_args *args)
 {
-	struct memfd_luo_ser *ser;
+	struct shmem_luo_ser *ser;
 
 	if (WARN_ON_ONCE(!args->serialized_data))
 		return -EINVAL;
@@ -338,10 +339,10 @@ static int memfd_luo_freeze(struct liveupdate_file_op_args *args)
 	return 0;
 }
 
-static void memfd_luo_unpreserve(struct liveupdate_file_op_args *args)
+static void shmem_luo_unpreserve(struct liveupdate_file_op_args *args)
 {
 	struct inode *inode = file_inode(args->file);
-	struct memfd_luo_ser *ser;
+	struct shmem_luo_ser *ser;
 
 	if (WARN_ON_ONCE(!args->serialized_data))
 		return;
@@ -351,20 +352,20 @@ static void memfd_luo_unpreserve(struct liveupdate_file_op_args *args)
 
 	ser = phys_to_virt(args->serialized_data);
 
-	memfd_luo_unpreserve_folios(&ser->folios, args->private_data,
+	shmem_luo_unpreserve_folios(&ser->folios, args->private_data,
 				    ser->nr_folios);
 
 	kho_unpreserve_free(ser);
 	inode_unlock(inode);
 }
 
-static void memfd_luo_discard_folios(const struct memfd_luo_folio_ser *folios_ser,
+static void shmem_luo_discard_folios(const struct shmem_luo_folio_ser *folios_ser,
 				     u64 nr_folios)
 {
 	u64 i;
 
 	for (i = 0; i < nr_folios; i++) {
-		const struct memfd_luo_folio_ser *pfolio = &folios_ser[i];
+		const struct shmem_luo_folio_ser *pfolio = &folios_ser[i];
 		struct folio *folio;
 		phys_addr_t phys;
 
@@ -383,10 +384,10 @@ static void memfd_luo_discard_folios(const struct memfd_luo_folio_ser *folios_se
 	}
 }
 
-static void memfd_luo_finish(struct liveupdate_file_op_args *args)
+static void shmem_luo_finish(struct liveupdate_file_op_args *args)
 {
-	struct memfd_luo_folio_ser *folios_ser;
-	struct memfd_luo_ser *ser;
+	struct shmem_luo_folio_ser *folios_ser;
+	struct shmem_luo_ser *ser;
 
 	/*
 	 * If retrieve was successful, nothing to do. If it failed, retrieve()
@@ -405,7 +406,7 @@ static void memfd_luo_finish(struct liveupdate_file_op_args *args)
 		if (!folios_ser)
 			goto out;
 
-		memfd_luo_discard_folios(folios_ser, ser->nr_folios);
+		shmem_luo_discard_folios(folios_ser, ser->nr_folios);
 		vfree(folios_ser);
 	}
 
@@ -413,8 +414,8 @@ static void memfd_luo_finish(struct liveupdate_file_op_args *args)
 	kho_restore_free(ser);
 }
 
-static int memfd_luo_retrieve_folios(struct file *file,
-				     struct memfd_luo_folio_ser *folios_ser,
+static int shmem_luo_retrieve_folios(struct file *file,
+				     struct shmem_luo_folio_ser *folios_ser,
 				     u64 nr_folios)
 {
 	struct inode *inode = file_inode(file);
@@ -425,7 +426,7 @@ static int memfd_luo_retrieve_folios(struct file *file,
 	long i;
 
 	for (i = 0; i < nr_folios; i++) {
-		const struct memfd_luo_folio_ser *pfolio = &folios_ser[i];
+		const struct shmem_luo_folio_ser *pfolio = &folios_ser[i];
 		phys_addr_t phys;
 		u64 index;
 		int flags;
@@ -463,9 +464,9 @@ static int memfd_luo_retrieve_folios(struct file *file,
 			goto unlock_folio;
 		}
 
-		if (flags & MEMFD_LUO_FOLIO_UPTODATE)
+		if (flags & SHMEM_LUO_FOLIO_UPTODATE)
 			folio_mark_uptodate(folio);
-		if (flags & MEMFD_LUO_FOLIO_DIRTY)
+		if (flags & SHMEM_LUO_FOLIO_DIRTY)
 			folio_mark_dirty(folio);
 
 		npages = folio_nr_pages(folio);
@@ -497,7 +498,7 @@ static int memfd_luo_retrieve_folios(struct file *file,
 	 * freed when the file is freed. Free the ones not added yet here.
 	 */
 	for (long j = i + 1; j < nr_folios; j++) {
-		const struct memfd_luo_folio_ser *pfolio = &folios_ser[j];
+		const struct shmem_luo_folio_ser *pfolio = &folios_ser[j];
 		phys_addr_t phys;
 
 		if (!pfolio->pfn)
@@ -514,10 +515,10 @@ static int memfd_luo_retrieve_folios(struct file *file,
 	return err;
 }
 
-static int memfd_luo_retrieve(struct liveupdate_file_op_args *args)
+static int shmem_luo_retrieve(struct liveupdate_file_op_args *args)
 {
-	struct memfd_luo_folio_ser *folios_ser;
-	struct memfd_luo_ser *ser;
+	struct shmem_luo_folio_ser *folios_ser;
+	struct shmem_luo_ser *ser;
 	struct file *file;
 	int err;
 
@@ -526,7 +527,7 @@ static int memfd_luo_retrieve(struct liveupdate_file_op_args *args)
 		return -EINVAL;
 
 	/* Make sure the file only has seals supported by this version. */
-	if (ser->seals & ~MEMFD_LUO_ALL_SEALS) {
+	if (ser->seals & ~SHMEM_LUO_ALL_SEALS) {
 		err = -EOPNOTSUPP;
 		goto free_ser;
 	}
@@ -558,7 +559,7 @@ static int memfd_luo_retrieve(struct liveupdate_file_op_args *args)
 			goto put_file;
 		}
 
-		err = memfd_luo_retrieve_folios(file, folios_ser, ser->nr_folios);
+		err = shmem_luo_retrieve_folios(file, folios_ser, ser->nr_folios);
 		vfree(folios_ser);
 		if (err)
 			goto put_file;
@@ -576,7 +577,7 @@ static int memfd_luo_retrieve(struct liveupdate_file_op_args *args)
 	return err;
 }
 
-static bool memfd_luo_can_preserve(struct liveupdate_file_handler *handler,
+static bool shmem_luo_can_preserve(struct liveupdate_file_handler *handler,
 				   struct file *file)
 {
 	struct inode *inode = file_inode(file);
@@ -584,30 +585,30 @@ static bool memfd_luo_can_preserve(struct liveupdate_file_handler *handler,
 	return shmem_file(file) && !inode->i_nlink;
 }
 
-static unsigned long memfd_luo_get_id(struct file *file)
+static unsigned long shmem_luo_get_id(struct file *file)
 {
 	return (unsigned long)file_inode(file);
 }
 
-static const struct liveupdate_file_ops memfd_luo_file_ops = {
-	.freeze = memfd_luo_freeze,
-	.finish = memfd_luo_finish,
-	.retrieve = memfd_luo_retrieve,
-	.preserve = memfd_luo_preserve,
-	.unpreserve = memfd_luo_unpreserve,
-	.can_preserve = memfd_luo_can_preserve,
-	.get_id = memfd_luo_get_id,
+static const struct liveupdate_file_ops shmem_luo_file_ops = {
+	.freeze = shmem_luo_freeze,
+	.finish = shmem_luo_finish,
+	.retrieve = shmem_luo_retrieve,
+	.preserve = shmem_luo_preserve,
+	.unpreserve = shmem_luo_unpreserve,
+	.can_preserve = shmem_luo_can_preserve,
+	.get_id = shmem_luo_get_id,
 	.owner = THIS_MODULE,
 };
 
-static struct liveupdate_file_handler memfd_luo_handler = {
-	.ops = &memfd_luo_file_ops,
-	.compatible = MEMFD_LUO_FH_COMPATIBLE,
+static struct liveupdate_file_handler shmem_luo_handler = {
+	.ops = &shmem_luo_file_ops,
+	.compatible = SHMEM_LUO_FH_COMPATIBLE,
 };
 
-static int __init memfd_luo_init(void)
+static int __init shmem_luo_init(void)
 {
-	int err = liveupdate_register_file_handler(&memfd_luo_handler);
+	int err = liveupdate_register_file_handler(&shmem_luo_handler);
 
 	if (err && err != -EOPNOTSUPP) {
 		pr_err("Could not register luo filesystem handler: %pe\n",
@@ -618,4 +619,4 @@ static int __init memfd_luo_init(void)
 
 	return 0;
 }
-late_initcall(memfd_luo_init);
+late_initcall(shmem_luo_init);
-- 
2.56.0.257.gf7497c7d27-goog

