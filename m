Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794423576;
	b=ff+JoinFXGv2rfxumPQUf4cS+a4df0WtMDafF4Gj0so18iLjoXf1W34Z6sOXrohsUsrY
	 l6ix/ybZILGQ92CkfqLrfHaS2+P6vVxRsAAkMUJwcSN/5uvo2FO/igKUVN30jUH5trsA9
	 fAY0D5X3hJUsghUH5DzFP8fWQjD4bhHHWab7DPcvkulKU5bW+aNASwPRuShAB63P41ooP
	 3eLYolk02GIYyIN3y419Nsum/YfjJUTdx/pLl1nBDLDAlh+F5fsGlPzwPIui96dSNhEIF
	 X1ztFTU4On+UqYfaLeXn8yqY7+jz3cC0aqAO6zX4UkPeHudvMv+0Sz2CRplVQj9FJgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794423576;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bNaWmjzZL0cMs+uJYhUIAi6U7mf0NFDrLgrotrfyBqc=;
	b=OxgZIFetWX/1m1J3QUhgepOn/l8Roxa/a/1O0isvWulA05m/GdEU+BQ7q4+KRZpdzSjz
	 Eh4BxNgwLH3BC7T2Zs5KdWS/mk3PSoXVR0w9sUnCUwDGG2rmsV3hV2sUUU6p/Irb/355b
	 7jdUtw7sLXRRpOU2w3Tt79LT43p1BOZI+7fFdUVzBwQmA6DegKpOP0e/Keg1/D4kM3XNr
	 AXk/aTvt4MJ9fBIuZyM2lmRIYzWesD+FukeAde1MXNBqyCBBPdBo6XdgmOTQOFtiyzhWu
	 QKoRqNGDDys75UdC7F3fvT83NJxjHuI3MsQs/TX0jg2csKLdHzesYRunqB3qnWTZQwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LUvRyQPn;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F623606A339
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 18:59:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F623606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LUvRyQPn
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso34997375e9.1
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 10:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794423574; x=1795028374; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bNaWmjzZL0cMs+uJYhUIAi6U7mf0NFDrLgrotrfyBqc=;
        b=LUvRyQPnrpphOY/2BqfF9pJnRMvSpapj4ntjHVC+N+B9p++8Hw/+VZiKChctsKSjnk
         pYUftqd4+zEI8XO6nu+0c939JedO2legBCLD9m9kBCoGuZSu/cw3998tHpOSIa5kzWwB
         uT6Oafs7RjfsmBvFjxGcd/d7TzTAMTtakWf23cNaPISaL4QILByPN+URkqQnFqArmA+B
         xdOCp2zz5Rifg9/TeSx9WpdCbXaPAR8owdLhFyI4vgxh68ySPMRyctdLDha5q3OyE+fA
         sh6F+W/oyPVbWi8XWWcvzddQzbhpYOnn0uIZt4D8CK80MR9NWgiTSvhwXpVFsJEuVKTZ
         s5/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794423574; x=1795028374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bNaWmjzZL0cMs+uJYhUIAi6U7mf0NFDrLgrotrfyBqc=;
        b=sItBHgCTougfP4O/zOlww5oVFzsSFmbnlzBs5JZYS1fNZroMH71vsNh3aRYD7vWVPP
         S+Er9ZCmO1X2Ak0t7LxdiXILPuIszJASK7hwm/lDhSbqoEvoesbx08iOL0grPcdqrAQk
         wJEoNXFeYmR1/r5bvFCrkEVUYopz0Mng/w0W65OmarPm6yihIx3n/iryCPRt8tswyAsY
         hD8oWoNrXO9P8is1Gi0qHHtF/sbNXtrs6TrkSgNlnnPuCRYDN9nFNLxp0lh9u5RjJMX+
         iZoGGWmFI45tUP7kpeiQCmROk0CohrxNfxe9dpLh+es2hSRQODZIWI1KzVfWasz1wofA
         f9lg==
X-Forwarded-Encrypted: i=1; AL+hErFXNpB5wSjb8THczLCWkg2B2rnl9nOMcRFfBbnxkox926r3pUaThegpGcaTXVH4Tm0LTY1zlG9zW9Vt+NrlBpM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/cHCkjfLls5vxAzt+HjV/xRvhRnAYujhPtg6s7vzJ9bUpWk2tL
	xxoPGwqPV0N0XMyO/RAH5Vl4uV+wrsKLQ9w4XX4lTAOdJ0AqwXvVReGN
X-Gm-Gg: AYBFou3lo+EcUYewZT88P+C17PEnDQYoS2+naG3/67HDGasq9iHSPhu52jy3wH7pZXn
	9w7iGvCScmJtADtsyQWg02jaLQKwcngFKzkTQJQZtKFs1/6RNQu/ia9SnT1Lbg/25GH8BVazcQK
	X0qSuZWpdkYjMqJJ0uBAUyUNfp+OzgIEVfd1/JFS+rUv3n146+W6Wl2WC8nUHPkczvH/9aEN1+h
	yx1ob0Sa83AeCstixCoh6Jw1JfUIb3aHUTSAgHfgvg7nvttvC8J8zKaP5Iu4HX+ypK7LJIv7P7s
	OC3yhzI53EJCqwGT+fMzfQCsCj5d+T6gQY3DA7NPiwFcxNdb687o5B58V4Ufu47WnoZ76LRNX26
	KKgrJ6Qvr1epJUTF88Gv2RJC0fzTLQW023/kAm5wXLXDBAy1udi0VoOdyPcCBQBaxGvI8Xnt9nh
	UpGhIxNpASmaEnqiCALkHc5JcHd0DfQrwoO1+zfavHHGxRdvLeHJ55ASNYEuxVf9k6QdOZReedj
	QJ6DDaO+2xIbYuqXqmKs/Tb7TJiOFOxUhQsgu10MBQEA9Nxzt2Fp4Xqnj6BSZdYX7EUwjfDU6aV
	9T03Ualz1kc4L5c+mElLlo3eO3KwCbuPrgMkfbgVrGX7+UO4JaQ6rcVNzjmh2njsVTsV0X1IaTy
	aS2KFH8oau9sDU3HwPjCptln1nRqkcDnthPRNj6uRb2YXp51CMJ+y/hiahXFBvBppBw==
X-Received: by 2002:a05:600c:81c5:b0:4a4:3a2d:15da with SMTP id 5b1f17b1804b1-4ba093753a6mr56638565e9.15.1794423573896;
        Wed, 11 Nov 2026 10:59:33 -0800 (PST)
Received: from dev-dsk-fgriffo-1c-93421965.eu-west-1.amazon.com (54-240-197-234.amazon.com. [54.240.197.234])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e265a0csm9161435e9.9.2026.11.11.10.59.33
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Nov 2026 10:59:33 -0800 (PST)
From: Fred Griffoul <griffoul@gmail.com>
To: Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Kevin Tian <kevin.tian@intel.com>
Cc: Robin Murphy <robin.murphy@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Mostafa Saleh <smostafa@google.com>,
	Guanghui Feng <guanghuifeng@linux.alibaba.com>,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	nh-open-source@amazon.com
Subject: [PATCH 2/3] iommufd: Use iommu_unmap_sparse() to unpin domain pages
Date: Wed, 11 Nov 2026 18:59:30 +0000
Message-ID: <20261111185931.94882-3-griffoul@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261111185931.94882-1-griffoul@gmail.com>
References: <20261111185931.94882-1-griffoul@gmail.com>
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

From: Fred Griffoul <fgriffo@amazon.co.uk>

iommufd keeps no copy of the PFNs it pinned for an area, so
iopt_area_unpin_domain() reads each one back from the domain with
iommu_iova_to_phys(), one CPU page at a time, and then unmaps the range
in a second walk. With 4 KiB pages, a 1 GiB IOPTE costs 262144 lookups
before the unmap starts.

Call iommu_unmap_sparse() instead, and add the PFNs of each IOPTE it
removes to the pfn_batch, so one walk both unmaps the range and
collects the PFNs. The last IOPTE removed can hold pages beyond the
ones this pass unpins. The loop already handles that case: it keeps
those pages in the batch and carries them over to the next pass.

Domains that do not use iommupt keep the per-page read-back, and so do
areas whose IOVA or memory starts or ends inside a CPU page. Such areas
exist only when the smallest page size of every domain in the IOAS is
smaller than PAGE_SIZE.

Signed-off-by: Fred Griffoul <fgriffo@amazon.co.uk>
---
 drivers/iommu/iommufd/pages.c | 98 +++++++++++++++++++++++++++++++++--
 1 file changed, 93 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/iommufd/pages.c b/drivers/iommu/iommufd/pages.c
index 2f6153108add7..c2a04a8845cc8 100644
--- a/drivers/iommu/iommufd/pages.c
+++ b/drivers/iommu/iommufd/pages.c
@@ -468,6 +468,79 @@ static void batch_from_domain_continue(struct pfn_batch *batch,
 	batch->array_size = array_size;
 }
 
+struct batch_unmap {
+	struct pfn_batch *batch;
+	unsigned long first_iova;
+	unsigned long last_iova;
+};
+
+static bool batch_record_unmapped(void *priv, unsigned long iova,
+				  phys_addr_t paddr, size_t size)
+{
+	struct batch_unmap *unmap = priv;
+	unsigned long first, end;
+
+	/* Stop after the entry that holds the last page to unpin */
+	if (iova > unmap->last_iova)
+		return false;
+
+	/*
+	 * Count each CPU page once, from the entry that holds its first byte.
+	 * Pages before first_iova belong to an access and stay pinned.
+	 */
+	first = max(ALIGN(iova, PAGE_SIZE), unmap->first_iova);
+	end = ALIGN(iova + size, PAGE_SIZE);
+	if (first >= end)
+		return true;
+	return batch_add_pfn_num(unmap->batch, PHYS_PFN(paddr + (first - iova)),
+				 (end - first) >> PAGE_SHIFT, BATCH_CPU_MEMORY);
+}
+
+/* True if the area starts and ends on CPU pages, in both IOVA and memory */
+static bool iopt_area_pages_aligned(struct iopt_area *area)
+{
+	return !area->page_offset &&
+	       PAGE_ALIGNED(iopt_area_iova(area) |
+			    (iopt_area_last_iova(area) + 1));
+}
+
+/*
+ * Unmap from unmapped_index and collect the PFNs from start_index on into the
+ * batch in one walk. The walk ends after the entry that holds last_index, which
+ * can reach past last_index, or before an entry the batch has no room for.
+ * Returns the number of indexes unmapped, 0 if the caller has to read the PFNs
+ * back with batch_from_domain() instead.
+ */
+static unsigned long batch_unmap_from_domain(struct pfn_batch *batch,
+					     struct iommu_domain *domain,
+					     struct iopt_area *area,
+					     unsigned long unmapped_index,
+					     unsigned long start_index,
+					     unsigned long last_index,
+					     unsigned long real_last_index)
+{
+	unsigned long start = max(start_index, unmapped_index);
+	struct batch_unmap unmap = {
+		.batch = batch,
+		.first_iova = iopt_area_index_to_iova(area, start),
+		.last_iova = iopt_area_index_to_iova_last(area, last_index),
+	};
+	unsigned long iova = iopt_area_index_to_iova(area, unmapped_index);
+	unsigned long last =
+		iopt_area_index_to_iova_last(area, real_last_index);
+	size_t unmapped;
+
+	if (!iopt_area_pages_aligned(area))
+		return 0;
+
+	/* The range runs to the area end, batch_record_unmapped() stops it */
+	unmapped = iommu_unmap_sparse(domain, iova, last - iova + 1,
+				      batch_record_unmapped, &unmap);
+	if (IS_ENABLED(CONFIG_IOMMUFD_TEST))
+		WARN_ON(unmapped % PAGE_SIZE);
+	return unmapped >> PAGE_SHIFT;
+}
+
 /*
  * This is part of the VFIO compatibility support for VFIO_TYPE1_IOMMU. That
  * mode permits splitting a mapped area up, and then one of the splits is
@@ -1689,19 +1762,33 @@ iopt_area_unpin_domain(struct pfn_batch *batch, struct iopt_area *area,
 {
 	while (start_index <= last_index) {
 		unsigned long batch_last_index;
+		bool read_ahead = true;
 
 		if (*unmapped_end_index <= last_index) {
 			unsigned long start =
 				max(start_index, *unmapped_end_index);
+			unsigned long unmapped, batch_end;
 
 			if (IS_ENABLED(CONFIG_IOMMUFD_TEST) &&
 			    batch->total_pfns)
 				WARN_ON(*unmapped_end_index -
 						batch->total_pfns !=
 					start_index);
-			batch_from_domain(batch, domain, area, start,
-					  last_index);
-			batch_last_index = start_index + batch->total_pfns - 1;
+			unmapped = batch_unmap_from_domain(batch, domain, area,
+							   *unmapped_end_index,
+							   start_index,
+							   last_index,
+							   real_last_index);
+			if (unmapped) {
+				/* The walk ended on an entry boundary */
+				*unmapped_end_index += unmapped;
+				read_ahead = false;
+			} else {
+				batch_from_domain(batch, domain, area, start,
+						  last_index);
+			}
+			batch_end = start_index + batch->total_pfns - 1;
+			batch_last_index = min(batch_end, last_index);
 		} else {
 			batch_last_index = last_index;
 		}
@@ -1716,9 +1803,10 @@ iopt_area_unpin_domain(struct pfn_batch *batch, struct iopt_area *area,
 		 * middle of the domains we need to keep reading pfns until we
 		 * find a cut point to do the unmap. The pfns we read are
 		 * carried over and either skipped or integrated into the next
-		 * batch.
+		 * batch. batch_unmap_from_domain() already ends on an entry
+		 * boundary and needs no read-ahead.
 		 */
-		if (batch_last_index == last_index &&
+		if (read_ahead && batch_last_index == last_index &&
 		    last_index != real_last_index)
 			batch_from_domain_continue(batch, domain, area,
 						   last_index + 1,
-- 
2.47.3

