Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793660689;
	b=bdnF4gs/EldrC5/D30Ge7Ow7jJ7igeUtKxpiD9JdUMn4zU7DB5YyBbEPmqnoV/zLoBqI
	 zqfh5O062Enh6jVqKsw7dFmHCS3hB/4c92TZ26ZQXGp7LHi/idI3Rw4H15OG4k0fyhSkF
	 LJw+Z4lWeNo9r2MoU2z0roxzCglWIWltTak0fqNnsj53OPXO13MhiP0PWbTdMnS/Yh9qy
	 9jJnGGD/CCqtuyHqyXtjp4KwsqdW6UzbcaP6jDd6+ipWOaKVDWVDyxCGZraMiDz7QwiuA
	 jk4+dM+liVK7YdDmugwNtKTAY4ugTAj0GoQ5pCMv+QgTqHHG5HNe3ON2qglSW/2Y/cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793660689;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=qdpAw2CeVyl2O4/SsZKsGMa/ZVARBuLoVGSK/7j1CNs=;
	b=FHRlTULgHff8VMKLzJQNoHy2uF02UpJoJwsHaeb936d+8l8M712H0O5LgNZmx6DLp4My
	 pk+y80HnTnp6gQQoADzL8sFsMF5Sn3sipgF4nmxFn3nOifGrcT8Mi4q5ohiexL+rCtMJ4
	 THtHVOJAOrIoN3D0hueu6Va2bV33WU4Y+o71FBsvWY2GZtV70GkHjZEcPSNT1fJLbN5Vk
	 VKPPkYPJpK6S5ERHyA91h5+vku3LvRIbakBInVOMDZFzQFFg6lknM/aYpFqnBRCjwXs4+
	 iZzMn8ZKXA2m5AkAGy2MssZHu04I5kV2kwbSisuk4M7SSzDBmZy02Ivh0hDspGM1+fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hah3TSoG;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB22606A33D
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Nov 2026 23:04:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADB22606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hah3TSoG
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30c0d568830so6788619eec.1
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Nov 2026 15:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793660688; x=1794265488; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qdpAw2CeVyl2O4/SsZKsGMa/ZVARBuLoVGSK/7j1CNs=;
        b=hah3TSoGUiSjnJ9CjCJ0hl31I4MkPtW5OjjUoE0rfgwTX8MmuuVLCwXkqDjKeSLV2o
         AcfUqTPlyBGVeB4pvirfmOt8VpkKRarpjE3aSCD+w23EEjCNL8r02oMSELAnax0wVtHq
         3OGKFddD5fCW4TCLPpU5SyijQD+7E6XaRkVJBA2tAfQo6I4Xz54UD4GOzBddKwLHNxfm
         kfS/DPvarpF/CztXwG7ze0dVXR1hgBhMHqxjJhD2pbCUi5KyNHdUzgZSJHxZzxT9c9tf
         n3LM0XFiplDKDKO7OoTmrHStiYcgSLSW5wDErJ3IBLkTRjDrFmd/sJnN/shK40lItCwT
         POYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793660688; x=1794265488;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qdpAw2CeVyl2O4/SsZKsGMa/ZVARBuLoVGSK/7j1CNs=;
        b=rYbu+WbrWaLqPBUdqmREc1WaR8dgwCSU8t6Fc6fLQBdZ4F76cRJpazS9Q7YGWeDjoT
         Ixumtt2uH5T5d18wO1/+u6CiwSDMQmhCr8lvrsTJ48EQb9bqAaRhI30ff+E2C/byTkoY
         ZYt4Ns3H/0NDRCVx5pWIaApI2RvYunO48DeEETgBhm3tYOS0pPGSOpAqXcnFtztIPyiT
         ioyVwv3Nx948p68F6YQ5nvlInVyR9CXFawnrygrWuzx0xqyqutEhO/yVF79byZw5mLaO
         G26v/K5uxCAJTfKEaFmjKWb7fairBzaj1Eu0oxOwyyQaxALwhnKoCLA2R/fVP03t0RAq
         WFew==
X-Forwarded-Encrypted: i=1; AKwUvBzxCLw+ujXqqRNTgDmehy/QsWLZ5EGOXDZgHX7iHrvqZvtuq5DfGBNsHXjj5dzz/pLSCL5NDeYYI7WUEK4k7KQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Jfl++SVRiHN3ewqRMQJ5bgpE2jNUXlXSfoekV9g8fKAkW2BZi
	wskN3bsUT/ugthX4/wJdWGYVsYs+GbBVAvPmFAOj9x3dybOOqy5xwaxkNqVPmUBUMi1RmDwrrn2
	TuXnk+tv/7VLH8XtwPyJPR2pk2A==
X-Received: from dyki13.prod.google.com ([2002:a05:7300:7c0d:b0:369:f67f:7a43])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:693c:41dc:10b0:366:9f06:3c4c with SMTP id 5a478bee46e88-36a423f8794mr17637350eec.32.1793660687421;
 Mon, 02 Nov 2026 15:04:47 -0800 (PST)
Date: Mon,  2 Nov 2026 23:04:43 +0000
In-Reply-To: <20261102230445.3993629-1-almasrymina@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261102230445.3993629-1-almasrymina@google.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261102230445.3993629-2-almasrymina@google.com>
Subject: [PATCH v3 1/3] vfio/pci: pass FAULT_FLAG_WRITE to vmf_insert_pfn_pmd/pud()
From: Mina Almasry <almasrymina@google.com>
To: Peter Xu <peterx@redhat.com>, Alex Williamson <alex@shazbot.org>, 
	Andrew Morton <akpm@linux-foundation.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Cc: Mina Almasry <almasrymina@google.com>, David Matlack <dmatlack@google.com>, 
	Shuah Khan <shuah@kernel.org>, Kevin Tian <kevin.tian@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Raghavendra Rao Ananta <rananta@google.com>, Vipin Sharma <vipinsh@google.com>, Alex Mastro <amastro@fb.com>, 
	stable@vger.kernel.org, Ankit Agrawal <ankita@nvidia.com>, 
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Content-Type: text/plain; charset="UTF-8"

vfio_pci_vmf_insert_pfn() is the only caller of vmf_insert_pfn_pmd() and
vmf_insert_pfn_pud() in the kernel that hardcodes write=false instead of
passing vmf->flags & FAULT_FLAG_WRITE (unlike drm, panthor, and mshv).

On x86_64, normal MAP_SHARED | PROT_WRITE VFIO BAR mappings usually mask
this bug because vma->vm_page_prot already has _PAGE_RW set. However,
when vma->vm_page_prot starts read-only, insert_pmd() and insert_pud()
with write=false install a read-only huge entry without calling
pmd_mkdirty()/maybe_pmd_mkwrite() (and similarly for PUD). Subsequent
write-protection faults enter wp_huge_pmd() or wp_huge_pud(), which call
vma->vm_ops->huge_fault() to upgrade the entry in place. Because
vfio_pci_vmf_insert_pfn() passes write=false, insert_pmd() and
insert_pud() see !pmd_none(*pmd) with !write, do nothing, and return
VM_FAULT_NOPAGE, causing an unrecoverable infinite write page-fault loop
and host CPU soft lockup on the next userspace or KVM guest MMIO store.

In practice, vma->vm_page_prot is read-only on a writable MAP_SHARED BAR
mapping in two situations:

1. Userspace soft-dirty tracking (CONFIG_MEM_SOFT_DIRTY) when a process
   such as CRIU (during pre-dump/checkpoint), a VMM live-migration loop,
   a memory profiler, or an unprivileged process holding a VFIO device
   fd writes "4" (CLEAR_REFS_SOFT_DIRTY) to /proc/<pid>/clear_refs. That
   clears VM_SOFTDIRTY on all VMAs (including VM_PFNMAP) and calls
   vma_set_page_prot(), stripping _PAGE_RW from vma->vm_page_prot for
   subsequent huge faults.

2. Architectures where shared writable mappings start read-only for
   software dirty tracking, such as arm64 without hardware DBM
   (CONFIG_ARM64_HW_AFDBM off or FEAT_HAFDBS absent), where _PAGE_SHARED
   sets PTE_RDONLY | PTE_WRITE and pgprot_noncached() preserves
   PTE_RDONLY on MT_DEVICE_nGnRnE mappings until pmd_mkdirty() clears
   it on a write fault.

This bug was found by code inspection while auditing huge_fault handlers
and reproduced with a VFIO PCI selftest on a 2 MiB-aligned BAR mapping
after writing "4" to /proc/self/clear_refs.

Pass vmf->flags & FAULT_FLAG_WRITE to vmf_insert_pfn_pmd() and
vmf_insert_pfn_pud() so write faults properly mark huge PFNMAP entries
dirty and writable.

Fixes: f9e54c3a2f5b ("vfio/pci: implement huge_fault support")
Cc: stable@vger.kernel.org
Cc: Ankit Agrawal <ankita@nvidia.com>
Cc: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
Cc: David Matlack <dmatlack@google.com>
Signed-off-by: Mina Almasry <almasrymina@google.com>
---
 drivers/vfio/pci/vfio_pci_core.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
index fcbb2da860e2..204d959086e9 100644
--- a/drivers/vfio/pci/vfio_pci_core.c
+++ b/drivers/vfio/pci/vfio_pci_core.c
@@ -1745,6 +1745,8 @@ vm_fault_t vfio_pci_vmf_insert_pfn(struct vfio_pci_core_device *vdev,
 				   unsigned long pfn,
 				   unsigned int order)
 {
+	bool write = vmf->flags & FAULT_FLAG_WRITE;
+
 	lockdep_assert_held_read(&vdev->memory_lock);
 
 	if (vdev->pm_runtime_engaged || !__vfio_pci_memory_enabled(vdev))
@@ -1754,10 +1756,10 @@ vm_fault_t vfio_pci_vmf_insert_pfn(struct vfio_pci_core_device *vdev,
 		return vmf_insert_pfn(vmf->vma, vmf->address, pfn);
 
 	if (IS_ENABLED(CONFIG_ARCH_SUPPORTS_PMD_PFNMAP) && order == PMD_ORDER)
-		return vmf_insert_pfn_pmd(vmf, pfn, false);
+		return vmf_insert_pfn_pmd(vmf, pfn, write);
 
 	if (IS_ENABLED(CONFIG_ARCH_SUPPORTS_PUD_PFNMAP) && order == PUD_ORDER)
-		return vmf_insert_pfn_pud(vmf, pfn, false);
+		return vmf_insert_pfn_pud(vmf, pfn, write);
 
 	return VM_FAULT_FALLBACK;
 }
-- 
2.56.0.385.gac671c819a-goog

