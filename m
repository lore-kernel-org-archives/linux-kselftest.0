Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 012913C8C45
	for <linux-kselftest@vger.kernel.org>; Fri,  5 Jun 2026 21:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780694359; cv=none; b=KHVZGNUCzheh5pCKlZC90ZWDLtCaSceDhH/p3gGmcLOR1NUkXcRADjDbCU1ZAaJJVPuxCIFF5c1UU/jZopsz3FbcgLpFaHS2YWNcByxDv8jHsmxTBWvp2zP4md2E27sv6ip+Yn2Vn2SRGfbKyhaIpZxlPSsJYgp7Hf+PE3C+ivE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780694359; c=relaxed/simple;
	bh=YJUG2rEhZbZqBSQUXpRy6AdNHxz+6J4JkjRoL4CcAe4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ip9K0n4e0Bs/cb7iigOZP/uHIO98dRcPbNOQViy0APvZvdMdVgX+jgbjlsVrkMA4cmHIuw3M9/idcgdQqQoNBCkq8hCWrhsKEPMC+WDjHYSdA1d4kVg5ULBjiy9+vIDqS3RkLOKJidwJmjYRZZUTGVIB07kLiy9I63UCjdh92UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=dW6h/ZpC; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="dW6h/ZpC"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-8cceaacd07bso24426246d6.3
        for <linux-kselftest@vger.kernel.org>; Fri, 05 Jun 2026 14:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1780694357; x=1781299157; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f8jLd2zqvW28XOaQQClXDDIz8D3hNjBgUh/nqgs8cgE=;
        b=dW6h/ZpCK+KXuztZ7tEiWySIC9UaJFQEnGX0l+MBOiFUAzMijD33W78SUYk+Q8Ysm7
         pEArvIxiJeSgh9gJxhKzpZOXPaBCsr+d42cDt1fJHzgF0wa99gpisD7KFIPHTVd8OOl/
         XiZmy9WSuc2pC5qwTgXi4pW0RckTbJdnqsIthMk4+OLf+QB78Mi56Idv1CvL722uIFiZ
         5xXFxdVA1Td8OkbKcxyZkC7+RtbiqvIgWKEE9L9nwD+tgr8Odj6IusiHNOkVu0s4+mOy
         UEKJ+4fu8BO2SSbNaqrKLsfyWHt0cnxsjgUXxIjv4mZ1MzecOW71on7fAc5bOegh2kZV
         km3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780694357; x=1781299157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=f8jLd2zqvW28XOaQQClXDDIz8D3hNjBgUh/nqgs8cgE=;
        b=kRit9YyFPNSGAbx1/9rJoS4A4vDSmKGHlNPvgWjtYlc8NGw73GDm1FYOtfXX11yfK1
         wsqUKkiRImf5POuhqDpF5/wGrQ66gbf6tkBs5Fe4k7ckNrkd1336vh66sZuQwIlNpWd4
         ltWo/wWY3cFVQYsB+y/8xxLEsRBjJ/SfM1xbX0sSFqOdUDbdGk/r9w5Gavet46zC9Gcm
         NHNtbawd0zDEWnQJCkORzYlj7qRazLcr5g8jNhlNt/FdGlwK4F2M/TJ1LmxtBIVkc2Q3
         Z6q61HzqNbhHj4p6PeSCF+eY89p14EuzDPSo9X15mlJ+XnEi0JtQyIerVwsE2uUOiPK/
         Im9Q==
X-Forwarded-Encrypted: i=1; AFNElJ+sLoVH5Jli1MXy3GeFPE3C2tAb9Fq0x1BWz1LcH33Ur4ipmnjo5C00we/sGEMtgQFYE/n2HIck4NbxiD5T7DE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxVrGYNV1rjL0GnnqDWh2oiFmARQGHkQ5+i9ZYUHBTNjDvPEyD
	zhaq3hTf8un7YE9QHQM4RURM9r3IB+Zej3KxePgizcvlL3q11Wws5P3t5GRcIzolslQ=
X-Gm-Gg: Acq92OGK8MUAjRjcSb6S9HuN3DrEWIT3xoplJM30vAijeSnrtChJ2VRkerMr7C9oh5X
	kOPhjeXf+sRVAaJXxKgdpYILl1NVJ7X0i8AeFxQG9RBz4SP//DK1i6ugBlCleAxo7G52jERmMe7
	/ncJMW+M5lKSU/BY2jQvyHkqAVsmkTyNda7ZLw2yw6qcaUrMtiTyUa5qBJjlX29rONWlF0A38wW
	h3lb4BtXdOq5WQTli9WWPNAkB5P3uh12LCeiZUl49ZZeDXvwFQUaEkGGGzRwTAZG7kTeYzRB1iZ
	kGTsdJrK0ME9ZomMJf6mHOQRTlqeoGxjkhrX6kp1j228eNu2Ze7SmmP8EnGfsNRjjhYn48jKg2p
	KoKNMd3rcpTQN3m2HBqhimWnxk7/ls0EXeyjIeRrVTfUuukDsdCgaoSZqg2B/sWj/f2bVR2j6Pe
	1Rj/mbpDteKEvg3nl85ycgd52nhGCM5HG7RBqIU/GzCzKfWC6KRhI5aH5WA3KqawCqIke5IMZNl
	fBlwZTlw2PJX3PmTq2kpmE=
X-Received: by 2002:ad4:560e:0:b0:8cc:f88e:2703 with SMTP id 6a1803df08f44-8cee5fe4e30mr72255516d6.12.1780694356950;
        Fri, 05 Jun 2026 14:19:16 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cecd277bbcsm90518196d6.49.2026.06.05.14.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 14:19:16 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org,
	nvdimm@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	linux-cxl@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	djbw@kernel.org,
	vishal.l.verma@intel.com,
	dave.jiang@intel.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	osalvador@suse.de,
	shuah@kernel.org,
	gourry@gourry.net,
	alison.schofield@intel.com,
	Smita.KoralahalliChannabasappa@amd.com,
	ira.weiny@intel.com,
	apopple@nvidia.com
Subject: [PATCH v4 1/9] mm/memory: add memory_block_aligned_range() helper
Date: Fri,  5 Jun 2026 22:19:03 +0100
Message-ID: <20260605211911.2160954-2-gourry@gourry.net>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260605211911.2160954-1-gourry@gourry.net>
References: <20260605211911.2160954-1-gourry@gourry.net>
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
boundaries.

Update dax/kmem to use this helper.

Signed-off-by: Gregory Price <gourry@gourry.net>
---
 drivers/dax/kmem.c     |  4 +---
 include/linux/memory.h | 22 ++++++++++++++++++++++
 2 files changed, 23 insertions(+), 3 deletions(-)

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
index 463dc02f6cff..9f5ef0309f77 100644
--- a/include/linux/memory.h
+++ b/include/linux/memory.h
@@ -20,6 +20,7 @@
 #include <linux/compiler.h>
 #include <linux/mutex.h>
 #include <linux/memory_hotplug.h>
+#include <linux/range.h>
 
 #define MIN_MEMORY_BLOCK_SIZE     (1UL << SECTION_SIZE_BITS)
 
@@ -100,6 +101,27 @@ int arch_get_memory_phys_device(unsigned long start_pfn);
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
+	aligned.end = ALIGN_DOWN(range->end + 1, memory_block_size_bytes()) - 1;
+
+	return aligned;
+}
+
 struct memory_notify {
 	unsigned long start_pfn;
 	unsigned long nr_pages;
-- 
2.54.0

