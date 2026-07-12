Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F050E82866
	for <linux-kselftest@vger.kernel.org>; Sun, 12 Jul 2026 15:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783871120; cv=none; b=pxUpothLq+JAYAa0U35ZpI1mw9k329dygYxCWKkDejdnBYWzpZxEPMponovS3DR09uMnOeZnrmnDIp6+Yg4gVvialoaQebixvUlB1drUBMIksOnojJi4CUkx0J5X5UZrPYBKeJmfrE/rdhlIRQ52/xOier3hJ3dn0fvoAgBn5oY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783871120; c=relaxed/simple;
	bh=cwLO8vv7b1rjOVh5x79fdH+sMlDL6NVKrF3rLUAYwY0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rzs70E+/+5kLjpX8Pt8J0xSqQyF6vJ1GgpoW7Qu1mexYeetWeXr2sMoXGK6EN0Bwkf347k/8iVltF+IkmbfF6tUaa9szAwg0sPLXlTTTABecq628BXwQ3rB2b8DBeOvf2vJ/EIbLRDTMAGN1RshfUt4GiCSmm5OyDEFicg68xqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=HaRSEdaj; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="HaRSEdaj"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-92e6a434cabso131326385a.1
        for <linux-kselftest@vger.kernel.org>; Sun, 12 Jul 2026 08:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1783871117; x=1784475917; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=57EncVwQTApdVwF+AHEoxJEEP6dVsKbM0q+e+B9wKPc=;
        b=HaRSEdajwBROFnPNB1X38sMJ80yCXLDUP17g9tqV/L7iTMjlt5/DBFZBKXGaL6yfgi
         tsZuFROvBGPP7JVt8atOsnCt5hhkq1cTdLL3H8Yu7KN1DQI7Gnu3kaM6eZmj7NU6KWxO
         Vb1slU4unvO6sjVO4Q48JPY2GKTCD3wTruiXIpflp2dKHY3YYsmwCVgLgHD3MnNB5Ogz
         AejTNRZEYuACptpjI8TJAVaNs3EqUzKJwgmFOC4oOJPJPFUn9WD2rwJhHzRRTj+IboAl
         PWfYeCj40+q1fxh5edUHsBMd6MJnxSBpEax0zT+qItcTxx2FpOx11yUFRx4q8yp6DmlH
         Q3Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783871117; x=1784475917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=57EncVwQTApdVwF+AHEoxJEEP6dVsKbM0q+e+B9wKPc=;
        b=FoQTseHk/87e5+FX70xp7piSTphUFK5IgxC+Rpl54Z8pDKOW2cZ1GSUPykY86R3/ZC
         qw4QMVY7C2MUy1vNTGU43hk8XN3RKcm1StixlOekPaEhPt36Cc2TZN4QFdrGgPA9jXl+
         NkFdoScMPaBCM3VykccATsZAjjdrurpGmgMPMba5B3TRy4OsdiH+OBHSJ9UlWWGDtzi9
         zSoyGQxSiTuuBTjTOsJFUJFR9/OmjHkUykqvAJEsq8K5EqR/xb6CEQt74GVav9KFvh+o
         wpBvnsYkCoD4a2+fOCW+RXpbk6gC8dy6pzDmT/U8U4MaYnaXZ2mBRpZ/4eHw5immiEbB
         ETHA==
X-Forwarded-Encrypted: i=1; AHgh+RoEXL0f+jvX7KX9NEO8XvgXTE0CDaS9KhnaCh5kwfzHCPm7RpYTO6S1LPK8HVoVvem4sH55Hi0/tAcqAdjPTc8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQjY4tChgXagcpP3m8vDND3Yx5LRZWmpkcNxdtzhtQiSCkmVnr
	7RBIq7SSL2HGf46/83rjc+VjeB8T5mNDlYII+4M1CQguHipz2LRGWSXbiQfz7i47RjQ=
X-Gm-Gg: AfdE7ckM2epq5vjGjVQG11OU86CwVR0BmWjQA+o8Zk+iEKF0Ou+DGyxgPuZLA15SLNs
	N30DoHjgQoJUhuRTJknG/bVK8K7GMeEp8JS5vbkRyvH5MRoLe3/8dAPKWEhXN7y8yqvamep5nBJ
	p4hkpJhwx1OAppUFoTrZxUKrxgH+Wo7xdS/nbAKHotyQEhz32we4HxjOcqZe7eYnU0TtGooT7lB
	YuPKwj1PgeDZgUk0zkN0mDjaj7FovJObm34MKmfXD3PnOTm7i5WTZcMBa6Fg5XGRwOR5D87aucW
	Ctz6Fs3c4myzkmeJmRxS6CICEe86GjjFPw/6XGPW0lYsxv2Vsu6aMPs9NUmJp4gISHdKbkHHcg7
	wx6PEXDJVfwd7o9jhIDN2TuX0e7ofFkZUIkKTRs8T1qBnKQPXenDsVSIp5cttC2M9wsnQIeBHi2
	UDJPpptwexfpsGixKooqkhC+uG5Of6BkvhNPjcSHEovpMGJfaYj2SIx+5X/Jfgsl0jIDpnJiaUa
	w==
X-Received: by 2002:a05:620a:a00b:b0:92f:199:b035 with SMTP id af79cd13be357-92f0199d1d7mr265410885a.3.1783871116930;
        Sun, 12 Jul 2026 08:45:16 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92ee5d61facsm862186485a.42.2026.07.12.08.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 08:45:16 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	linux-cxl@vger.kernel.org,
	driver-core@lists.linux.dev,
	nvdimm@lists.linux.dev,
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
	gourry@gourry.net
Subject: [PATCH v7 01/10] mm/memory: add memory_block_aligned_range() helper
Date: Sun, 12 Jul 2026 11:44:55 -0400
Message-ID: <20260712154505.3564379-2-gourry@gourry.net>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260712154505.3564379-1-gourry@gourry.net>
References: <20260712154505.3564379-1-gourry@gourry.net>
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

Reviewed-by: Dave Jiang <dave.jiang@intel.com>
Reviewed-by: Dan Williams <djbw@kernel.org>
Signed-off-by: Gregory Price <gourry@gourry.net>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
---
 drivers/dax/kmem.c     |  4 +---
 include/linux/memory.h | 27 +++++++++++++++++++++++++++
 2 files changed, 28 insertions(+), 3 deletions(-)

diff --git a/drivers/dax/kmem.c b/drivers/dax/kmem.c
index a18e2b968e4da..592171ec10f49 100644
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
index 463dc02f6cff0..1783299073e47 100644
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

