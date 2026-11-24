Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795488338;
	b=MhyczXsU2AaEryT7ky3uXoMY7de5VKj2df/CP46crun0xrqjqzGbBw9hHF/yPu9WWlUT
	 sXp3aDsPuPGGrWoutHfJSm6AkVc8LDXebIZDgUYm24QycAREP+cAkFqqiOuV+jBMeUtTv
	 VZe8SgF/ApC5N3YEDanwfZI74opdXxwMGBVIWgJLhZH1FIn0PxyUlvgRpaDFAwd9fpRxZ
	 pkP+cJICff2uwndFfdyNOuR3UwDMhPG7SjTJ5v3V0XHazP2y7gCFxLU6RK7rf3yssNBGI
	 mtFB3gNzHQJdlk1W4/p9LBv142JiM5hWHZbPOhlpWIpnLiKskt/0L520kv9Fuo5EhxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795488338;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=axND2+iIXgCbPJJrAvDzsUIGpcXa/BdMzWLUTPpegqs=;
	b=R8IpTZjEqDztfJ1vFHQ/uicP4w4OP49kd9WStGYBGq4Nv8YX0+CnASzNhjTSaRiKFzbB
	 vneJm8mIlRjkhY1OtiebUjlsbbNDmopYh5COtmCKD1DZ5Yg5wDQ2qohHj7wIAxE6A8bwL
	 Lqt9DuaefeBnfMuHYVtAOjgDz8Hczc0Y3/ToEATcXXWQWM6VJEPCtAl6kV0NozqDtrTpJ
	 ivgrZsDb/sjAzQjp0lX9YLp1bOYl8WsbF9QWwHRgcoLaz7NpJSE+Fz6z5x6J18P72knJ+
	 7lEWNDLknbxdP/vkwY3vSZTtOIfPKTnG6C1H+0KKZn6HMkMNm+z++vUJXTuKwrfKXDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="uTvvi/cY";
	arc=none smtp.remote-ip=95.215.58.69
Received: from mta1.migadu.com (out-69.mta1.migadu.com [95.215.58.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC37E606A322
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 02:45:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC37E606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=uTvvi/cY
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=tjBVgiSeQ42i6F1VR+QY5djrJY00Dtaohe2UFEdUDDs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795488335; v=1; x=1796093135;
 b=uTvvi/cYojLAdnl7mt+KQ7xm3g+Dj7Ca5nk1TlQwG4xccQNJKiV0QHzWZWN3xUM1Wg0A2j5o
 YqlrQzpH2NofK5BZAnh4OmO7xbCMSilWKf6apExjYhQbx/pbJMEExJmEfyHrTtWNFwNlC+k4/E+
 8vbpVEnD69Nc/3vi6m4kw+eM=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 0d1d44d1ee1858c3;
	Tue, 24 Nov 2026 02:45:35 +0000
X-Mizu-Trace-ID: 0d1d44d1ee1858c3
X-Migadu-Flow: FLOW_OUT
From: Qiliang Yuan <qiliang.yuan@linux.dev>
Date: Mon, 23 Nov 2026 21:45:01 -0500
Subject: [PATCH v2 2/3] udmabuf: map huge page backed ranges with PMDs
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-feat-udmabuf-huge-pfnmap-v2-2-3254f801fc36@linux.dev>
References: <20261123-feat-udmabuf-huge-pfnmap-v2-0-3254f801fc36@linux.dev>
In-Reply-To: <20261123-feat-udmabuf-huge-pfnmap-v2-0-3254f801fc36@linux.dev>
To: Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Philipp Stanner <phasta@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>, 
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Shuah Khan <shuah@kernel.org>
Cc: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 "T.J. Mercier" <tjmercier@google.com>, Philip Yang <Philip.Yang@amd.com>, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Qiliang Yuan <qiliang.yuan@linux.dev>, 
 Natalie Vock <nat@pixelcluster.dev>
X-Mailer: b4 0.13.0

QEMU and crosvm hand guest memory to the host renderer and display as
udmabufs for virtio-gpu blob resources. The guest memory is a memfd that
is often backed by 2 MiB huge pages, and the host process mmap()s the
dma-buf to access it with the CPU.

udmabuf maps every page with its own PTE: the first fault inserts a PFN
for each 4 KiB page of the whole VMA. Mapping and touching 4 GiB this way
takes over 200 ms and a million PTEs, although the memory behind it is
2048 huge pages.

Add a ->huge_fault() handler that maps a PMD-sized range with one PMD
when it is backed by an aligned run of contiguous PFNs, and falls back to
PTEs otherwise. Have the pre-mapping on the first fault skip the ranges
the handler will map, so that their PTEs don't take the place of the
PMDs. Once THP is disabled for the VMA, the ranges already mapped with a
PMD keep it, so pre-map only the PMD-sized range of the fault then.

Mapping a udmabuf over a memfd filled with data and reading a byte of
each 4 KiB page through the mapping, base and patched kernels alternating
over 3 rounds of 5 runs (7 for shmem 4K), median of the per-round medians
and range in parentheses:

  backing    size        before (ms)         after (ms)   change
  hugetlb    256M   13.3 (13.3-13.7)      1.7 (1.7-1.8)     -87%
  hugetlb      1G   53.6 (53.0-53.7)      6.5 (4.2-6.6)     -88%
  hugetlb      4G      211 (211-212)   23.6 (17.6-25.2)     -89%
  hugetlb      8G      423 (422-424)   45.8 (45.8-47.2)     -89%
  shmem THP    1G   52.8 (52.5-53.1)      6.3 (5.8-6.8)     -88%
  shmem THP    4G      210 (207-214)   20.7 (19.5-21.1)     -90%
  shmem 4K     1G   52.0 (51.6-52.7)   51.8 (51.5-52.9)       0%
  shmem 4K     4G      209 (209-211)      208 (208-209)       0%

Signed-off-by: Qiliang Yuan <qiliang.yuan@linux.dev>
---
 drivers/dma-buf/udmabuf.c | 85 ++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 81 insertions(+), 4 deletions(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index 018937435356e..9f53d33fbdd9a 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -44,12 +44,63 @@ struct udmabuf {
 	struct miscdevice *device;
 };
 
+/*
+ * Return whether the PMD-sized range of @vma at @addr is backed by one aligned
+ * run of contiguous PFNs, which can then be mapped with a single PMD.
+ */
+static bool udmabuf_pmd_mappable(struct vm_area_struct *vma, unsigned long addr,
+				 unsigned long *pfn)
+{
+	struct udmabuf *ubuf = vma->vm_private_data;
+	const pgoff_t nr = PMD_SIZE >> PAGE_SHIFT;
+	unsigned long first;
+	pgoff_t pgoff, i;
+
+	if (!IS_ENABLED(CONFIG_ARCH_SUPPORTS_PMD_PFNMAP))
+		return false;
+
+	if (!IS_ALIGNED(addr, PMD_SIZE) || addr < vma->vm_start ||
+	    vma->vm_end - addr < PMD_SIZE)
+		return false;
+
+	pgoff = vma->vm_pgoff + ((addr - vma->vm_start) >> PAGE_SHIFT);
+	if (pgoff >= ubuf->pagecount || ubuf->pagecount - pgoff < nr)
+		return false;
+
+	first = page_to_pfn(ubuf->pages[pgoff]);
+	if (!IS_ALIGNED(first, nr))
+		return false;
+
+	for (i = 1; i < nr; i++) {
+		if (page_to_pfn(ubuf->pages[pgoff + i]) != first + i)
+			return false;
+	}
+
+	*pfn = first;
+	return true;
+}
+
+#ifdef CONFIG_ARCH_SUPPORTS_HUGE_PFNMAP
+static vm_fault_t udmabuf_vm_huge_fault(struct vm_fault *vmf,
+					unsigned int order)
+{
+	unsigned long pfn;
+
+	if (order != PMD_ORDER ||
+	    !udmabuf_pmd_mappable(vmf->vma, vmf->address & PMD_MASK, &pfn))
+		return VM_FAULT_FALLBACK;
+
+	return vmf_insert_pfn_pmd(vmf, pfn, vmf->flags & FAULT_FLAG_WRITE);
+}
+#endif
+
 static vm_fault_t udmabuf_vm_fault(struct vm_fault *vmf)
 {
 	struct vm_area_struct *vma = vmf->vma;
 	struct udmabuf *ubuf = vma->vm_private_data;
 	pgoff_t pgoff = vmf->pgoff;
-	unsigned long addr, pfn;
+	unsigned long addr, end, pfn;
+	bool pmd_ok;
 	vm_fault_t ret;
 
 	if (pgoff >= ubuf->pagecount)
@@ -61,14 +112,37 @@ static vm_fault_t udmabuf_vm_fault(struct vm_fault *vmf)
 	if (ret & VM_FAULT_ERROR)
 		return ret;
 
-	/* pre fault */
-	pgoff = vma->vm_pgoff;
+	/*
+	 * Pre-fault the rest of the VMA, except for the ranges that
+	 * udmabuf_vm_huge_fault() maps with a PMD once they are accessed.
+	 */
+	pmd_ok = thp_vma_allowable_order(vma, vma->vm_flags, TVA_PAGEFAULT,
+					 PMD_ORDER);
 	addr = vma->vm_start;
+	end = vma->vm_end;
 
-	for (; addr < vma->vm_end; pgoff++, addr += PAGE_SIZE) {
+	/*
+	 * Ranges mapped with a PMD before THP was disabled for the VMA keep
+	 * their PMD, so pre-fault only the PMD-sized range of the fault.
+	 */
+	if (IS_ENABLED(CONFIG_ARCH_SUPPORTS_PMD_PFNMAP) && !pmd_ok) {
+		addr = max(addr, vmf->address & PMD_MASK);
+		end = min(end, (vmf->address & PMD_MASK) + PMD_SIZE);
+	}
+	pgoff = vma->vm_pgoff + ((addr - vma->vm_start) >> PAGE_SHIFT);
+
+	for (; addr < end; pgoff++, addr += PAGE_SIZE) {
 		if (addr == vmf->address)
 			continue;
 
+		if (pmd_ok && IS_ALIGNED(addr, PMD_SIZE) &&
+		    (vmf->address & PMD_MASK) != addr &&
+		    udmabuf_pmd_mappable(vma, addr, &pfn)) {
+			pgoff += (PMD_SIZE >> PAGE_SHIFT) - 1;
+			addr += PMD_SIZE - PAGE_SIZE;
+			continue;
+		}
+
 		if (WARN_ON(pgoff >= ubuf->pagecount))
 			break;
 
@@ -89,6 +163,9 @@ static vm_fault_t udmabuf_vm_fault(struct vm_fault *vmf)
 
 static const struct vm_operations_struct udmabuf_vm_ops = {
 	.fault = udmabuf_vm_fault,
+#ifdef CONFIG_ARCH_SUPPORTS_HUGE_PFNMAP
+	.huge_fault = udmabuf_vm_huge_fault,
+#endif
 };
 
 static int mmap_udmabuf(struct dma_buf *buf, struct vm_area_struct *vma)

-- 
2.43.0

