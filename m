Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.221
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795333077;
	b=kVvEz9NY64XuWeGLDb8BtbhX96L2fss42FXpmyAdh2gk9jHjLW4E6jfj1YOm9yg6v3xd
	 zt/BPorFhSmARGNcpkhPs2tct6wbJuBgwzppjD3o7dRkX7x2WVBARNR90hXmRn586wkNz
	 ekXNetMR4OhHy3OihvTgxm1HlyJAr582K0WyS8NqVsY/pSqMtOnuq6/S6IFSX14RdZD1W
	 /ry0QRCQ+0t2bAnsa9A3xV/6wgV0sRFDcJTZeqhbsfYvGXISZLWOWM7HHlWj2A0m8frLa
	 T7fIGH4Oxr5DIVWL/BHiXyzBatCXSJ7PoDIZtazcW/IqshadtKCY/BqKXDPDjnaaqig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795333077;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=PNl3k+aQZRmmZze97yrJa/mjcZSrxu0zAekEBaxnVbE=;
	b=ZnnRDET6KVZQln3Q8qvoSYsuKmVhP7uNl4mVPHIGvtW6o4E42PUJ6PZ/UKvYcajAiiTr
	 aKU7ccy8XUWeTLve9UfGSF3yLiXyimEmtqb+aVzuyhU+xe24s5AdeBuyqhzO4OpQ3Ul2o
	 CG4n5DX3NCcxE32KEI/N74ajSR454CEd8BfAtKCivXUZfc26z0ph4S/xEX1fiiFMCxPuF
	 7Q3i2IlpGqEs/fVE0Vigch0ptSDk6mZ/RuDz4v1Dmg7BsBIR59iwVXsMj2cb6OAn9beXR
	 qbHGFLms2uDkAnkZdQoir2yvxVNV6MLCOC8XNiS7oKVz4ghub7TxlVJruUG5PYGiwow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=I6FXwSeL;
	arc=none smtp.remote-ip=95.215.58.221
Received: from mta1.migadu.com (out-221.mta1.migadu.com [95.215.58.221])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F9F606A338
	for <linux-kselftest@vger.kernel.org>; Sun, 22 Nov 2026 07:37:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3F9F606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=I6FXwSeL
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=XpJBzH+sTYGsrmpIUWi6yY8MaXU01R2Y6ZRDNKdpuPY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795333075; v=1; x=1795937875;
 b=I6FXwSeL+1xHsiGvGxKpOfWCGN7JMjjDfSwicPH7SG1f1+ub65JmD9l8GBvhgN7MF4kSVGaA
 wCvSA300YDJhsCqoDOaIgk0DUh0uN1Ro3rUK/H4sqwRNT6dJqC/Wryy4MK0x/wbkuyp9XDixLBG
 twPLS+36hooVy1S171G7gBgU=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f4eaf3e3d98bf1a7;
	Sun, 22 Nov 2026 07:37:54 +0000
X-Mizu-Trace-ID: f4eaf3e3d98bf1a7
X-Migadu-Flow: FLOW_OUT
From: Qiliang Yuan <qiliang.yuan@linux.dev>
Date: Sun, 22 Nov 2026 02:37:37 -0500
Subject: [PATCH 2/3] udmabuf: map huge page backed ranges with PMDs
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
Message-Id: <20261122-feat-udmabuf-huge-pfnmap-v1-2-dcba888940c2@linux.dev>
References: <20261122-feat-udmabuf-huge-pfnmap-v1-0-dcba888940c2@linux.dev>
In-Reply-To: <20261122-feat-udmabuf-huge-pfnmap-v1-0-dcba888940c2@linux.dev>
To: Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Philipp Stanner <phasta@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>, 
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Shuah Khan <shuah@kernel.org>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Qiliang Yuan <qiliang.yuan@linux.dev>
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
PMDs, and keep pre-mapping everything when the VMA can't have PMDs.

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
 drivers/dma-buf/udmabuf.c | 69 ++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 68 insertions(+), 1 deletion(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index 018937435356e..f9c908f8b53a2 100644
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
 	unsigned long addr, pfn;
+	bool pmd_ok;
 	vm_fault_t ret;
 
 	if (pgoff >= ubuf->pagecount)
@@ -61,7 +112,12 @@ static vm_fault_t udmabuf_vm_fault(struct vm_fault *vmf)
 	if (ret & VM_FAULT_ERROR)
 		return ret;
 
-	/* pre fault */
+	/*
+	 * Pre-fault the rest of the VMA, except for the ranges that
+	 * udmabuf_vm_huge_fault() maps with a PMD once they are accessed.
+	 */
+	pmd_ok = thp_vma_allowable_order(vma, vma->vm_flags, TVA_PAGEFAULT,
+					 PMD_ORDER);
 	pgoff = vma->vm_pgoff;
 	addr = vma->vm_start;
 
@@ -69,6 +125,14 @@ static vm_fault_t udmabuf_vm_fault(struct vm_fault *vmf)
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
 
@@ -89,6 +153,9 @@ static vm_fault_t udmabuf_vm_fault(struct vm_fault *vmf)
 
 static const struct vm_operations_struct udmabuf_vm_ops = {
 	.fault = udmabuf_vm_fault,
+#ifdef CONFIG_ARCH_SUPPORTS_HUGE_PFNMAP
+	.huge_fault = udmabuf_vm_huge_fault,
+#endif
 };
 
 static int mmap_udmabuf(struct dma_buf *buf, struct vm_area_struct *vma)

-- 
2.43.0

