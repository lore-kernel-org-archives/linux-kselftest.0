Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DEF03D7A07
	for <linux-kselftest@vger.kernel.org>; Wed, 24 Jun 2026 14:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782313078; cv=none; b=MuTOfGCrzGwG4yWT4MZXmLgpXBBigxKYfDfZ+Ymb7JrsrC4QGRaWSypg5Z8+bpat1FA8zRTafgPRiuvWv9TIOKW19HFtQaoK0868981kzEqyND7Z3xJ+g2MbDObwV6ynNV1elTFHl84h9CE27pHTB14kHdiT8Xr4F+EDdPTwaY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782313078; c=relaxed/simple;
	bh=TDiA7zntPHCkesbe2HDhTkXNSMZ1tAv5vFsX39Fbk2g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oDFDCg/GNJLpv6QBWQiNucYj1zZq+LB3mhp49KJ4yBteXo1wmUntjZV/cBTr4dgaeCuB4C7Wf91XmKwE3Cdg2VKK3T2B89kH0SkWAzvZ+WjjoAHPNfq2Op3RkupP4DNUOLa5EhdGZ/g1frO/JyNVzPOzvfJ4Kd0kpAVNR3sNF9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=icD9x9AA; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="icD9x9AA"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-517b1f2c6adso9593951cf.2
        for <linux-kselftest@vger.kernel.org>; Wed, 24 Jun 2026 07:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1782313076; x=1782917876; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5N7tLwBQJv8x9qNdxv/vKv4Fda4fwQcQqQmjxm5j+/M=;
        b=icD9x9AAsnjMRLwQlaVbVKR2YIG/J/2Gobflp64kTAim5oCNjpOAZYcj3fYEx9SaHF
         5o894UPqPDQVkXSdxrhycf3o9zfRe3K9em3lNk14+LYCt5NIFKL24CwO/795uaTVIHAM
         ih3YjgPkUEqEkIg+XBLACCVWP3ju9WZbEb6WA7VIAJ30OBmEwF4XxzwXPu3zW6jHyWJX
         FILBkIPUCjln5XpcVQ7ad/lj831zHHNGFwrbsPU6ntLJbiFF+Yb/aDObwy/gyXpZbKdY
         jAZRDm4S10hNONnsSYZeNHfSLZPGE0cFm09qTM7Fh7/w0x8ljlHHWvOiru5aACQ6j4Pd
         P3Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782313076; x=1782917876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5N7tLwBQJv8x9qNdxv/vKv4Fda4fwQcQqQmjxm5j+/M=;
        b=s0GxtiS9CFV2BVfVJuf1Iafj1rNw0SvquABLLua8MaZnGs58TUW+2Jx4bWEkDWAp08
         qpfa3NmkLL+t8ub53THWMKu5QhQAVj7M+cuDX4gWdB0b6xoTheCI47yoh/W6iTkmyHWL
         Gk9xDh84J/x2KpMTH1tlR1RftO1Fx1PEMCuLu+13xpjN/5BL3DWdYa5AqHNdPHN+YOh+
         oRhjNuNa1EJ1eNy/AvapjfE++CA6qXzYSid5+N98Wj1JNfUqJF8+B3lybE+yWqn9pmlj
         AlSeSt749Kp/rRAlqUSnHLJnRFwu1W8RbHcoxYoWEkmadrmsaNT8uSc9Kz2Zp4/mNTuc
         hp4w==
X-Forwarded-Encrypted: i=1; AFNElJ8qII4daG0cOMyLviV/jfrPGjsHrJCW48sP5uqbcK8YUmSP0EDtalWt4YeT4GtPKqkj4nSqEawK/2FaVIjTSnk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZ0sTOW+vaT0MKxXcZ9ML45FbgdGxrmj+MYZVlzoMNs7O8mEu9
	FcxLpoFqW8WZalKWvIwNm7TolS26knHlWCS3i2im308OdFo4M4SrFbE0KgmxtDe/2MQ=
X-Gm-Gg: AfdE7cn/et0zvmGdnpXNCUicsfW4QT+I0WpP1w5l2HhJ9Mq+R2FtXGezUHJCwCEj+pN
	BNSTgJbekaxM978zVv5tkm2w1fXQRL1D6u11miYfZDn7VbFAtZlG7b0gnwrh4G53hJb1FVZMSJx
	G1TGeJ/ik3ZdW8IgYwedd5LqWumFqQh77W/c9N0Ph+1MM9vpXcitXxvABgZXJQ+NikW+XAxTu7Y
	MHdEJb0QTK6ZjBhrnO90pCEf8uaVZzMNMSSW0x2K2beYJgCGwMnEMMOsLvjeS/oAljIWJipckV7
	NIUOrQJeYyphZ+vDktEfZN6/YaMHh5azqqUHLN3E+iFH9R1cuSh34mi+IEnRd88Zy5b2HFMWLzt
	U7nN5xSysGXrI2gtEtOaXtXaQ1Ev/Ryje3KAbLRLhbDLXcDuTWj2YutRfvEhd7tTHZeNQCViX2h
	3Tzh613b4BgJU8gMKkwvWHoTExjPnw7JqMsFSO5h7g4r5QTf51ZlCae6ZcPBg4o6PGPegVp3MeA
	4If+JPDhx+1
X-Received: by 2002:a05:622a:144f:b0:516:d84a:9f54 with SMTP id d75a77b69052e-51a5484ff5fmr102012121cf.38.1782313076353;
        Wed, 24 Jun 2026 07:57:56 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51a51ae8ee7sm49502301cf.24.2026.06.24.07.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 07:57:55 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org,
	nvdimm@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
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
	akpm@linux-foundation.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	shuah@kernel.org,
	gourry@gourry.net,
	alison.schofield@intel.com,
	Smita.KoralahalliChannabasappa@amd.com,
	ira.weiny@intel.com,
	apopple@nvidia.com
Subject: [PATCH v5 1/9] mm/memory: add memory_block_aligned_range() helper
Date: Wed, 24 Jun 2026 10:57:36 -0400
Message-ID: <20260624145744.3532049-2-gourry@gourry.net>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260624145744.3532049-1-gourry@gourry.net>
References: <20260624145744.3532049-1-gourry@gourry.net>
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
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
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

