Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792613832;
	b=vavF1eDpll8qbXwcLLpUA3YdW4zEwfq4Cxwl0OiFiStb4+9Rf1b/XbAPZJH3nw6I4zhk
	 MyiO5xRVqEzvgeSih/lmdbWYYTnUvh5dVTSiZbyDGxuXlCHczCRfXXuVJ1pO+yh0Xo/lO
	 tbwPLpc8rulC269dkkZlerv+xTasTs3pf0ZJGjcH5aHh4lampOp71RfoNpWeGxTYXcF1r
	 tSnZlZzGfKdlX9MYEHoq9OroZfi3LfPgUU25dfOYkKNFAZFhXRk9xq+FtIDYWrSZQvjOt
	 u/V20iegU2zhsctw2g/w+teOO94ZPJtswZbMekTyjZM0V3sobgujdIoACVrRrtJoaRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792613832;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=At2A/wrqaAUfI4SKCwlEtMqC27pXN2/myITaZPv60nw=;
	b=R/vp7achbaXqvzYcsmE+vBo4OnOo05fbIrT/K6ZbcZgsW6qctxoAWGH9xGWmSNj9W36I
	 IhL8MRC9NK2pfH0/93ArXgOu2wTDvrkagdc+aPcrj2i3F264vq3ewkkzvZnmyAeXzIO53
	 fYL1ghyvgHSK+DUh48MGvMv73Cibq01Vrp35i3MrYcF6w6OfNp1xzCu6pfiRRafwdDxSy
	 A3lV5r9ovs/UzBmkj7GbPq/CdqDz/ZhgNmyBCrNw0K+vP0lTsymIKzOMiYT1VYe6hArVQ
	 6EbQKhlr9UXd2bmWFQX/h74/NRK7RMTXGUXDGtXdmjgYJPE/Y6lB280wYWZ7jCvD1mQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=oyFHm1Hz;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E8F606A326
	for <linux-kselftest@vger.kernel.org>; Wed, 21 Oct 2026 20:17:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8E8F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=oyFHm1Hz
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2db33db4de9so16665ad.0
        for <linux-kselftest@vger.kernel.org>; Wed, 21 Oct 2026 13:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792613831; x=1793218631; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=At2A/wrqaAUfI4SKCwlEtMqC27pXN2/myITaZPv60nw=;
        b=oyFHm1Hz0h2Qlknv1vsiheGJvlBp/hMgh02PzQTmYUIg+yqjimNbrLTG6YVDmdzSj7
         2h924ZyPg/b7FshKCBPU8Wf34MK3PzDVh+JJCflUO1RAYaHXuXv6wBxYmUiPzwczzC6w
         bGq67afFW30YUC+3zqYUjsX+7MoFVd5shYJCWSFseb2owxnYIjTAwTaK0aitNp4y5CHx
         5ok324KMIwDUZkyogu3Gc+7rODb6jTgVHOgl4UjYKgFk3g+pst9EPpMXc/FwibEyyGkO
         qbqM8aNdfBuih4c2QUv78AaB1MBNwVz+BUwlbiexmEA7RaPQMZ/69mzqr76MJIUIK66u
         ks6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792613831; x=1793218631;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=At2A/wrqaAUfI4SKCwlEtMqC27pXN2/myITaZPv60nw=;
        b=X/K1hzu8DIPu7+ljwsjBabANRQ9pI7E5mXv3aVwaT7V4K46B4oHzc1W1XQxre4tHC2
         xHg2aKn2SKZ/WI0ZwerMSCD9K11R5VRWkh+a8Om2BwL43028kczKL9qCBaZxaXSCwme1
         3ssNKAgczN50D/t14DqN0i1eszh1SJjgul+sV4XWcJpP8FTSs4Q6dXgNInQfvV5VzVgH
         8hKLJMWDQfp40/mLvap9poWurLZfk+QUmSQONGIl+C6xTL5NzHLQeNbxByyCcqTyUTR6
         Ojpv5Mi+jRChxsfvb+99FfOjVLN6jAbZKyOW4HAdGSANmFHeqP4tnUyJlNVEXKVAkwif
         Cefg==
X-Forwarded-Encrypted: i=1; AKwUvBwW5WvhA+vGReU3oGcwyZyFpsIRZEz4OAdTqV9CW9kxkmKXq0jm2PTCK8QZGBmxUIGL9HAX/sFgWEhZtguWVy8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIQZcDegSvJIwXUA3sXu9QZQ9qv8Kv/RWvZUPYNJK18t+X1lN5s
	iqvEH1sSP1m7Ej2F6s2R+XfUUXKhthjLh1wENcUY+p8+ZHH/uhXyz43EvjVE1e1Drw==
X-Gm-Gg: AYBFou1w4oe7yX+wH0yGihyhyj2FYes/vriF+TuyrSQ2e47KOEqqL8mnAzNV0WRoqL1
	XidQo/xXcv+P9D058WReB0Xk5UU0LV2I7f9aA61NqZeKzjGUGnHEWnJ4HywsiFa3ddrBOj6oNs2
	5ByFlB+XMxrcGrhhl3NKPuyqJwZJ21UpoT0SR2kotJAeANIbg0T8n/ewraCK8moBy4Cwz3DUjsu
	0JEXrsfYaZRUe/0eS8p0fDwAqB2HnrOaiMtZTFFk9jrQZCmoEUCbQ03L2VKZDBYbuj+B+kh0h9z
	IuT171d9riditRTfb4MuozpPdygQ9c3/h4ZyO1SAB+q75Ehs1wafMAaLYOWWfLXa8Vm1IJbpOSE
	OHdX+3EafwDd1Bm9K03mVoZvKy5fI54RYxhOrjz5I4JcN/LUpGKcT9BK1yZo+Tko0PZaaYfuvY2
	jjypyRGidMXAQVFkkW9eRodH2JgJm0pfIbLNwZi3R+aPzw9LUOVZKSHpqrPQRiCTHuw6zHLaCjk
	Au9K/zI07tsMTis/EI5JZUlPSqxgq2Y6pqYfJlWrstMll9PmlAuNanBODu4/9XXFxxUx7vTgVA5
	ToXIM1lmZY9I7xnijEoKm5v/teaBk9QVbJ7yaRB8Wa3sTjVA
X-Received: by 2002:a17:903:24b:b0:2e6:d25:d874 with SMTP id d9443c01a7336-2ea6313172cmr689965ad.10.1792613830593;
        Wed, 21 Oct 2026 13:17:10 -0700 (PDT)
Received: from google.com (163.1.145.34.bc.googleusercontent.com. [34.145.1.163])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada4896c71sm927197a91.6.2026.10.21.13.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 13:17:09 -0700 (PDT)
Date: Wed, 21 Oct 2026 20:17:05 +0000
From: Samiullah Khawaja <skhawaja@google.com>
To: Fred Griffoul <griffoul@gmail.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Kevin Tian <kevin.tian@intel.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, David Woodhouse <dwmw2@infradead.org>, 
	Ackerley Tng <ackerleytng@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R . Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org
Subject: Re: [RFC PATCH v2 06/11] iommufd: Map memory provider files
Message-ID: <atkO08eCJzLX6R58@google.com>
References: <20261014093733.90312-1-griffoul@gmail.com>
 <20261014093733.90312-7-griffoul@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20261014093733.90312-7-griffoul@gmail.com>

On Wed, Oct 14, 2026 at 09:37:28AM +0000, Fred Griffoul wrote:
>From: Fred Griffoul <fgriffo@amazon.co.uk>
>
>IOMMU_IOAS_MAP_FILE pins the pages it maps, which cannot work for a
>memory provider file: the frames may have no struct page, and the
>provider can take any of them back at any time.
>
>Accept a provider file. iommufd neither pins nor accounts its pages.
>It asks the provider for each frame when it fills a domain, and on a
>revoke it unmaps the range in every domain and maps what the provider
>backs now. A device that accesses the range in between faults. A
>revoke charges the page tables it allocates to the memory cgroup that
>mapped the file, not to the task that revoked.
>
>Each frame gets a PAGE_SIZE entry, so a partial revoke never splits a
>large IOMMU page. The next patch maps larger blocks. Holes stay
>unmapped, read-only pages are mapped without IOMMU_WRITE, and MMIO
>pages with IOMMU_MMIO. Frame 0 is refused with -EINVAL: iova_to_phys()
>returns 0 for an IOVA that is not mapped, so a revoke would take that
>page for a hole and leave it mapped.
>
>A revoke would race a dirty bitmap read and lose the dirty bits of the
>range, so provider pages and a dirty tracking domain cannot share an
>IOAS: whichever comes second fails with -EOPNOTSUPP. A provider
>mapping cannot be split by a partial unmap, and in-kernel accesses to
>it are refused.
>
>Assisted-by: Claude:claude-opus-5-5
>Signed-off-by: Fred Griffoul <fgriffo@amazon.co.uk>
>---
> drivers/iommu/iommufd/Kconfig        |   1 +
> drivers/iommu/iommufd/io_pagetable.c |  13 +-
> drivers/iommu/iommufd/io_pagetable.h |  27 ++-
> drivers/iommu/iommufd/pages.c        | 288 ++++++++++++++++++++++++++-
> include/uapi/linux/iommufd.h         |  11 +-
> 5 files changed, 334 insertions(+), 6 deletions(-)
>

[snip]

>+
> /* The pages are not pinned, so their domains are tracked in pages->tracker. */
> static inline bool iopt_pages_tracked(struct iopt_pages *pages)
> {
>-	return iopt_is_dmabuf(pages);
>+	return iopt_is_dmabuf(pages) || iopt_is_provider(pages);
> }
>
> static inline bool iopt_dmabuf_revoked(struct iopt_pages *pages)
>@@ -285,6 +306,10 @@ struct iopt_pages *iopt_alloc_dmabuf_pages(struct iommufd_ctx *ictx,
> 					   unsigned long start_byte,
> 					   unsigned long start,
> 					   unsigned long length, bool writable);
>+struct iopt_pages *iopt_alloc_provider_pages(struct file *file,
>+					     unsigned long start,
>+					     unsigned long length,
>+					     bool writable);
> void iopt_release_pages(struct kref *kref);
> static inline void iopt_put_pages(struct iopt_pages *pages)
> {
>diff --git a/drivers/iommu/iommufd/pages.c b/drivers/iommu/iommufd/pages.c
>index 660af3d46f5e..aa7740326ad6 100644
>--- a/drivers/iommu/iommufd/pages.c
>+++ b/drivers/iommu/iommufd/pages.c
>@@ -52,6 +52,8 @@
> #include <linux/iommu.h>
> #include <linux/iommufd.h>
> #include <linux/kthread.h>
>+#include <linux/mem_provider.h>
>+#include <linux/memcontrol.h>
> #include <linux/overflow.h>
> #include <linux/slab.h>
> #include <linux/sched/mm.h>
>@@ -238,6 +240,35 @@ static void iommu_unmap_nofail(struct iommu_domain *domain, unsigned long iova,
> 	WARN_ON(ret != size);
> }
>
>+/*
>+ * Provider pages are mapped with PAGE_SIZE entries, and may have holes.  Some
>+ * IOMMU drivers warn when asked to unmap an IOVA that is not mapped, so find
>+ * the runs that are mapped and unmap each one, without touching the holes.
>+ * iopt_provider_map() refuses frame 0, which iova_to_phys() reports for
>+ * an IOVA that is not mapped.
>+ */
>+static void iopt_provider_unmap(struct iopt_area *area,
>+				struct iommu_domain *domain,
>+				unsigned long start_index,
>+				unsigned long last_index)
>+{
>+	unsigned long iova = iopt_area_index_to_iova(area, start_index);
>+	size_t left = (last_index - start_index + 1) * PAGE_SIZE;
>+
>+	while (left) {
>+		size_t len = 0;
>+
>+		while (len < left && iommu_iova_to_phys(domain, iova + len))
>+			len += PAGE_SIZE;
>+		if (len)
>+			iommu_unmap_nofail(domain, iova, len);
>+		/* Step over the run and the hole page that ended it. */
>+		len = min(len + PAGE_SIZE, left);
>+		iova += len;
>+		left -= len;
>+	}
>+}
>+
> static void iopt_area_unmap_domain_range(struct iopt_area *area,
> 					 struct iommu_domain *domain,
> 					 unsigned long start_index,
>@@ -245,6 +276,11 @@ static void iopt_area_unmap_domain_range(struct iopt_area *area,
> {
> 	unsigned long start_iova = iopt_area_index_to_iova(area, start_index);
>
>+	if (area->provider) {
>+		iopt_provider_unmap(area, domain, start_index, last_index);
>+		return;
>+	}
>+
> 	iommu_unmap_nofail(domain, start_iova,
> 			   iopt_area_index_to_iova_last(area, last_index) -
> 				   start_iova + 1);
>@@ -1349,6 +1385,10 @@ static int pfn_reader_first(struct pfn_reader *pfns, struct iopt_pages *pages,
> 	    WARN_ON(last_index < start_index))
> 		return -EINVAL;
>
>+	/* Provider pages are read from the provider, see iopt_provider_map() */
>+	if (WARN_ON(iopt_is_provider(pages)))
>+		return -EINVAL;
>+
> 	rc = pfn_reader_init(pfns, pages, start_index, last_index);
> 	if (rc)
> 		return rc;
>@@ -1647,6 +1687,228 @@ void iopt_pages_untrack_all_domains(struct iopt_area *area,
> 	}
> }
>
>+static int iopt_provider_prot(struct iopt_area *area, u32 attrs)
>+{
>+	int prot = area->iommu_prot;
>+
>+	if (attrs & MEM_PROVIDER_ATTR_READONLY)
>+		prot &= ~IOMMU_WRITE;
>+	if (mem_provider_type(attrs) != MEM_PROVIDER_TYPE_RAM) {
>+		prot &= ~IOMMU_CACHE;
>+		prot |= IOMMU_MMIO;
>+	}
>+	return prot;
>+}
>+
>+/*
>+ * Map what the provider backs in [start_index, last_index] of the area into
>+ * @domain, and leave the holes unmapped.  Each frame is mapped with a
>+ * PAGE_SIZE entry, so that a revoke of part of a large block never has to
>+ * split a larger IOMMU page.  On failure nothing in the range is mapped.
>+ */
>+static int iopt_provider_map(struct iopt_area *area, struct iopt_pages *pages,
>+			     struct iommu_domain *domain,
>+			     unsigned long start_index,
>+			     unsigned long last_index)
>+{
>+	unsigned long base = pages->provider.start >> PAGE_SHIFT;
>+	unsigned long index = start_index;
>+	int rc;
>+
>+	lockdep_assert_held(&pages->mutex);
>+
>+	if ((1UL << __ffs(domain->pgsize_bitmap)) > PAGE_SIZE)
>+		return -EOPNOTSUPP;
>+
>+	/*
>+	 * A revoke unmaps under pages->mutex only, so it would race with a
>+	 * dirty bitmap read, and lose the dirty bits of what it unmaps.
>+	 * Provider pages are not mapped in a domain with dirty tracking.
>+	 */
>+	if (domain->dirty_ops)
>+		return -EOPNOTSUPP;
>+
>+	while (index <= last_index) {
>+		unsigned long pfn, iova, block_end, nr, i;
>+		int order = PUD_ORDER;
>+		u32 attrs;
>+		int prot;
>+
>+		rc = mem_provider_get_page(&pages->provider.att, base + index,
>+					   &pfn, &order, &attrs);
>+		if (rc == -EFAULT) {
>+			index++;
>+			continue;

Hi Fred,

Thanks for this.

With this approach, silently skipping holes during IOAS_MAP_FILE means
iommufd has no tracking of which IOVA ranges in the area are actually
mapped, which complicates unmap and could also hide a bug if a hole in
the range was not expected?

I am wondering whether the areas can track the holes, or whether we
should have areas for the mapped/unmapped ranges? This should allow
proper sanity checks when doing revoke. I am also thinking about this
from the live update point of view, where we might need to sanity check
that the backing memory of mapped regions is preserved.

Could you please CC me on v3? I'd like to follow this from the live
update IOMMU and iommufd preservation side.

https://lore.kernel.org/all/20260921004834.2601285-1-skhawaja@google.com/

Thanks,
Sami
