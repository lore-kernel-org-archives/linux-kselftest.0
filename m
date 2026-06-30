Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D89512E9729
	for <linux-kselftest@vger.kernel.org>; Tue, 30 Jun 2026 21:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782854332; cv=none; b=sF52h2eKXtyL3/pfsC87GbfE7gyFxevGKchtPpr2M2h+ec2aF336RhyBcWNrrA/mrzKlM80JajX9ZcBXqdT67YIrsqOgYV4YQhrx8IC4aSNrbUhWdl647I0uRY/7okKuPEZlgrL10vuLLY5jKMXw/W3coFGcXPkKaqPOqpBLUUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782854332; c=relaxed/simple;
	bh=AxVPyNXAmBtaz2ot1Td7JrEyAQDmKXyudrs+ZGIIj8Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rsrbgALZNmRTq5yVoHnLCw0Tgqpib+IPssok9Sqjo5fV6lCCC1ixD59wYq/v6RbbzNotd0OeAlIbTH+1iAFeX9VcVfWBLxd4d32QzHnVX5m9hkhD4W0/uiai3nFwPlYPsAy3q49sFXs/cEZd5wrNW47W85QCOI1CNSLYmOFf/z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=MdPhCWE9; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="MdPhCWE9"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-92e65e18969so122104285a.1
        for <linux-kselftest@vger.kernel.org>; Tue, 30 Jun 2026 14:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1782854330; x=1783459130; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8SI86A/tUZQ+3KTQEDQQAFYWb5y1VZ6lRAmoYBSC2uM=;
        b=MdPhCWE9O4mkoklMV0Jd97OnJ9EW/4Jo9AOCGHCHJ0wdxl5AYYDTxBsH7e97PHOU+M
         o5csYTSvVm05J2fe9WKv+PHwUi14HVXaaePChN1T6Wm31vPHiiygzOyp8iHK1gF6qg2E
         i5Lo0IOdCBznILWWfPMwXiLeuUD1rJYt2hwTixlweD7wihrAoPo/DcLzuSO5pmuc2TZ6
         /MV3L/ZUTu3DAyi3IqzD4pQGRLR1DjxF4WP7RXMG26V+whwol6Hw0SvfiTADzbEGH1L7
         4CDdyxyvOQx6QokfnfKWgYqt/9tdMcimDDAtDK1NGo0Z5KIBQfsQ1o4Zagik/JOSJWy4
         Ri4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782854330; x=1783459130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8SI86A/tUZQ+3KTQEDQQAFYWb5y1VZ6lRAmoYBSC2uM=;
        b=FmK5yxa+WDLTnNHlLyCtvygDRA8WzoewSwMaZLTHOBMFXgfTP/9yjXziE+x70ghbQy
         UBXg4VL6LPYdUlG49enlJxMwDqKTmOvV+rrghNK3m4jwHqrvpQ0rsBNlLU3+o4ALhR8G
         Va4w7MyRHXYn2O5tqQd8KA3D5cjnVIMbRROW4IfsdNO4SKQL7roleoLbWJhndQuT25b3
         qXMTt80gwqZkKTA/84rv+f8jT/rQuzr5c/FGCgsHxg0QPzZ8C0ghZT1vj6Z/beR0bI/6
         2XzeVaddj++6UpzcqKxPmASnJlv1BLLTSAcxyryGjGje2Y1LTXc+HkQFDrG0AFBKKHIf
         Oc7w==
X-Forwarded-Encrypted: i=1; AFNElJ9kwdN0D8Be451gLuVavPuI9Co9QfdOycAOZ72DW+IS0FCWcmUCbpTFD8PbgN1eRUf4It+6x2PpsOs8Rlj9p+U=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLQrUUDTQf/pAJ6brYFUl8IdIyS3TPsWia64uHyc+l19KskQLc
	x0I0gxhB73QhilC7uLC4qI+SiHWnh/cOxDpLUBR5vvqAfimnlvJdRP4Rt/hpwJPxGg4=
X-Gm-Gg: AfdE7cmoEEh7Sc2CNAz1sR18eikwb/JUiq8RGqcLCP7tq6Bt6zRg1pxoPNJM8SrwFmJ
	AYYbjQE1ElZJlQ7ne1Ro8juyTmyG/uV1yfTEp8IQZm6xQsBUycH07nchLny3xM1sPHzBKDD2wBE
	XOEMgro9s860FGi9tlpBFGxP1UQfX+hfNuLPmfmEUrK3gfPFpjOQ7tIcfugAurkjrwZj2PnPQQ/
	8SVj4vOpu2FV7ajlA5IVibZyct8zNx6RxHf3ns9CuqsZ7Qou3f1j4Lv5WSJTvoeQjWuXJTI5JtB
	MeQLlYkBhE4yDux6B9mFrDmb2nRfpSDlYZIF8Eb1uOU6jPNozGTp7eHEwRr/EN6tX8KGM+HvV7M
	GMCpMvQKDjhaq8zFYy4G/QaKu/M0KK+lqGUkdqu5TIeURUKFs+DTfPEtps9hoQm19uAWH3BxUPn
	Qo716ZGhJvpvnFkgl9QqBepWJ81G+woi2s9t/yFviHTTAeIQooD6awWTL6XWR3OSt723n53ehnd
	A==
X-Received: by 2002:a05:620a:6019:b0:92b:3203:ea70 with SMTP id af79cd13be357-92e696f3833mr471607485a.12.1782854329895;
        Tue, 30 Jun 2026 14:18:49 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e62366303sm335924285a.40.2026.06.30.14.18.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 14:18:49 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: nvdimm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-cxl@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-kselftest@vger.kernel.org,
	kernel-team@meta.com,
	david@kernel.org,
	osalvador@suse.de,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	djbw@kernel.org,
	vishal.l.verma@intel.com,
	dave.jiang@intel.com,
	alison.schofield@intel.com,
	akpm@linux-foundation.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	shuah@kernel.org,
	gourry@gourry.net,
	iweiny@kernel.org,
	Smita.KoralahalliChannabasappa@amd.com,
	apopple@nvidia.com
Subject: [PATCH v6 01/10] mm/memory: add memory_block_aligned_range() helper
Date: Tue, 30 Jun 2026 17:18:33 -0400
Message-ID: <20260630211842.2252800-2-gourry@gourry.net>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260630211842.2252800-1-gourry@gourry.net>
References: <20260630211842.2252800-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Memory hotplug operations require ranges aligned to memory block
boundaries.  This is a generic operation for hotplug.

Add memory_block_aligned_range() as a common helper in <linux/memory.h>
that aligns the start address up and end address down to memory block
boundaries.  Guard against end underflow when the range falls below the
first memory block boundary, returning an empty range instead.

Update dax/kmem to use this helper.

Signed-off-by: Gregory Price <gourry@gourry.net>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
---
 drivers/dax/kmem.c     |  4 +---
 include/linux/memory.h | 27 +++++++++++++++++++++++++++
 2 files changed, 28 insertions(+), 3 deletions(-)

diff --git a/drivers/dax/kmem.c b/drivers/dax/kmem.c
index a18e2b968e4d..592171ec10f4 100644
--- a/drivers/dax/kmem.c
+++ b/drivers/dax/kmem.c
@@ -33,9 +33,7 @@ static int dax_kmem_range(struct dev_dax *dev_dax, int i, struct range *r)
 	struct dev_dax_range *dax_range = &dev_dax->ranges[i];
 	struct range *range = &dax_range->range;
 
-	/* memory-block align the hotplug range */
-	r->start = ALIGN(range->start, memory_block_size_bytes());
-	r->end = ALIGN_DOWN(range->end + 1, memory_block_size_bytes()) - 1;
+	*r = memory_block_aligned_range(range);
 	if (r->start >= r->end) {
 		r->start = range->start;
 		r->end = range->end;
diff --git a/include/linux/memory.h b/include/linux/memory.h
index 463dc02f6cff..1783299073e4 100644
--- a/include/linux/memory.h
+++ b/include/linux/memory.h
@@ -20,6 +20,7 @@
 #include <linux/compiler.h>
 #include <linux/mutex.h>
 #include <linux/memory_hotplug.h>
+#include <linux/range.h>
 
 #define MIN_MEMORY_BLOCK_SIZE     (1UL << SECTION_SIZE_BITS)
 
@@ -100,6 +101,32 @@ int arch_get_memory_phys_device(unsigned long start_pfn);
 unsigned long memory_block_size_bytes(void);
 int set_memory_block_size_order(unsigned int order);
 
+/**
+ * memory_block_aligned_range - align a physical address range to memory blocks
+ * @range: the input range to align
+ *
+ * Aligns the start address up and the end address down to memory block
+ * boundaries. This is required for memory hotplug operations which must
+ * operate on memory-block aligned ranges.
+ *
+ * Returns the aligned range. Callers should check that the returned
+ * range is valid (aligned.start < aligned.end) before using it.
+ */
+static inline struct range memory_block_aligned_range(const struct range *range)
+{
+	struct range aligned;
+
+	aligned.start = ALIGN(range->start, memory_block_size_bytes());
+	aligned.end = ALIGN_DOWN(range->end + 1, memory_block_size_bytes());
+	/* No whole block fits (e.g. range below the first boundary): empty. */
+	if (aligned.end <= aligned.start)
+		aligned.start = aligned.end;
+	else
+		aligned.end -= 1;
+
+	return aligned;
+}
+
 struct memory_notify {
 	unsigned long start_pfn;
 	unsigned long nr_pages;
-- 
2.53.0-Meta

