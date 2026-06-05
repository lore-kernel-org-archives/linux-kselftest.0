Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438B53CC7CD
	for <linux-kselftest@vger.kernel.org>; Fri,  5 Jun 2026 21:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780694369; cv=none; b=Ahbw+PmhU/YVVFOZiZmaA8bLKBfNqtIyXhFpuxVUorPvJ1oxHusyd6myZuzFZ6Ar7LvZigNNQtrBxY9xH++LJYR/O20RENhESG5Aj3B5oDXyQzuGM8oTQgiYbLu8dziI1lDsgLh8Alx09GIhPp5TQG7+Z/PmNZIw4ZgKpSRgKCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780694369; c=relaxed/simple;
	bh=8XSA39MWql4+HD8uM30BGvMeffgmWZcxL5DHKZ0ylW0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nh1ZU8/VxGziwEuxMOVhSlwQ9Wby+SPSW51zd7p+Y7XqeCoC4wmjTuDp1YOE3MXh89YNIUN2WBfyX+Ak4cMMw4r+x/kEE3LEwmzpAXiHYBaXagJAsi0bcKUgBF8LgkQVdAqDg4J7/vV1Afq/3rI5U0deBs36HDodXuxIP+58LhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=Gj0fcZsD; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="Gj0fcZsD"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-8ce9d444173so28829986d6.2
        for <linux-kselftest@vger.kernel.org>; Fri, 05 Jun 2026 14:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1780694366; x=1781299166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JknNzkAaj+qc6G+hjBE1CQp9oF9WvErr7R4W+FLnrFQ=;
        b=Gj0fcZsDiDxYJ9+4rWV4Cob6ElkJ5jbEO3soIb8/DM3qp2ssQC2+2r0lYbMGxHVfN7
         C0jFB7YOECtUtSQSiKYTXG5rpj8rbjAHOeMR6BJmi3ad3LMMB79A+ZBOykao5x8V+l+g
         MavV1k/YHmzSO99eW2/Nn97OD7N+9usPpRSQeVdWH9v2tiueKl8mt6oFT4TVaFGQ61CI
         bS7YDjLZTmgTGTrRrMCXfqbQO8jHPuKvY5yyGDWNLUbDgR4ngkq6glZ1UNpV3v58CNgX
         +yFh2LSyjaPNkKmI4OGIk23GjQfsWSi5Qqu8ph7beRdjpEu05/w9BgTtyOEOrCQP1cCW
         M6RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780694366; x=1781299166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JknNzkAaj+qc6G+hjBE1CQp9oF9WvErr7R4W+FLnrFQ=;
        b=qv9XWetQILh7l4CgXNdYl2grDFGQU9KMXrdW6iBfqhUprg2TRR7kmQm+rAjdS/w8lE
         unCYrwIlIjRj/ItBivopyFcjuaSUdR7suF1jophD6KKwb1k1sOGWI8vm9/NzWW5rPw7s
         vUk3U1plvQLbEsCbsHKPVmRcUfQGjXEZ+1FoRGgz952z4D3h1vtXBLj9FgGgoWmMQmHa
         52vw6LMV/8OTGTwPES/+5Z+RcXxwzlNzYNffho/xbPW1JPIR47MF/HfCeyXIv/B+z4mn
         ajDip5NvnLB0V0+y+L+3Gz1q2PF6pDdnPKx9dk3IYf4m4ulmGZz3ruPXSk3BnetmVGGI
         3KLA==
X-Forwarded-Encrypted: i=1; AFNElJ8VK1hf5XTNQ4ndNh+apjCzOJH6l/TGAySMirMtzax6oP/T/kMxRyzZZdLwMqjdIGCBt2ET2iSERyeBxn3JoyE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc+ZmVyyeGkTvcqXvIwOIubjhxI1L/Mj5lSC+Uvz1nDAYhTCQb
	LUxPMVT5EDeD3N+0ilVJc9yrvy5V67cCYD4UuR28OszU0yJQ9MnQccbP+8SJVjTyNcc=
X-Gm-Gg: Acq92OFRlAxWQ7zXyEwZ1MSxlXuqsqX4pz5Ovj0di0ueoamEDX70k4lGU0OCutnpcu0
	tO9fz1L2aIntrLTRxc7g+LIjPUWNeeNpDWwNMghpuEGK5q1Hi3ffGddlxQ5v4SiMC7g5dQTcvzf
	Q2DZjaXPwjwRyflEfxcQxzmUPrRFCoPL3XWq2a5Oc1xkAxY2vwlXQplTUpqZv1sQ7peFqqfZlp7
	TB6xXU9D1rfypUaqZ7UjvwpkABBqnCuJuOb/RH6E++XtcT6o0eZYhrNq8bVO37huwjwLcgsUTsi
	M4Wu6vLpYRyjsxZ0ljVc2as7n1QHTMaSP3G6tsjXFQQmK7at2CDRDzVA7pfYleWGkStRl2O/Lqe
	y66c0XTOxzfITnvQUi9y9LId0khUEpFxFvzCwsyux5SxKo4rjl7gLmd29gg/8s0eNGA6tSjfcnX
	5t4s+Xb5driAoPEXkYNfWHZk1FYOZZZCzwFfOvH8Vg9y55L1qvJ5I91HKCVqM4/6bGJq5EMkBxh
	6kbPu/7uzwmguWnHyd+iLA=
X-Received: by 2002:a05:6214:4ed0:b0:8cc:dd20:7a46 with SMTP id 6a1803df08f44-8cee6137878mr86899206d6.37.1780694366285;
        Fri, 05 Jun 2026 14:19:26 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cecd277bbcsm90518196d6.49.2026.06.05.14.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 14:19:25 -0700 (PDT)
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
Subject: [PATCH v4 5/9] mm/memory_hotplug: add multi-range hotunplug
Date: Fri,  5 Jun 2026 22:19:07 +0100
Message-ID: <20260605211911.2160954-6-gourry@gourry.net>
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

offline_and_remove_memory() handles a single contiguous range.

Callers that manage a device composed of several ranges (e.g. dax/kmem)
currently have to call it in a loop, which gives up atomicity.

This creates a race condition where another daemon can online a block
that was just offlined while other blocks are being offlined, causing
the eventual (original) unplug operation to fail.

Add offline_and_remove_memory_ranges(), which takes an array of ranges
and processes them as one operation under a single lock_device_hotplug():

  - Phase 1 offlines every block of every range, remembering each block's
    previous online type.
  - Phase 2 removes the ranges only once all of them are offline.
  - If any offline fails, the offlining done so far is reverted and
    nothing is removed.

This gives callers all-or-nothing semantics for the offline step, so a
failed or interrupted unplug leaves every range online as before rather
than in an inconsistent partially-removed state.

Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
Signed-off-by: Gregory Price <gourry@gourry.net>
---
 include/linux/memory_hotplug.h |  7 +++
 mm/memory_hotplug.c            | 95 ++++++++++++++++++++++++++++++++++
 2 files changed, 102 insertions(+)

diff --git a/include/linux/memory_hotplug.h b/include/linux/memory_hotplug.h
index d3edeb80aadb..7f1da7c428dc 100644
--- a/include/linux/memory_hotplug.h
+++ b/include/linux/memory_hotplug.h
@@ -267,6 +267,7 @@ extern int offline_pages(unsigned long start_pfn, unsigned long nr_pages,
 extern int remove_memory(u64 start, u64 size);
 extern void __remove_memory(u64 start, u64 size);
 extern int offline_and_remove_memory(u64 start, u64 size);
+int offline_and_remove_memory_ranges(const struct range *ranges, int nr_ranges);
 
 #else
 static inline void try_offline_node(int nid) {}
@@ -283,6 +284,12 @@ static inline int remove_memory(u64 start, u64 size)
 }
 
 static inline void __remove_memory(u64 start, u64 size) {}
+
+static inline int offline_and_remove_memory_ranges(const struct range *ranges,
+						   int nr_ranges)
+{
+	return -EBUSY;
+}
 #endif /* CONFIG_MEMORY_HOTREMOVE */
 
 #ifdef CONFIG_MEMORY_HOTPLUG
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 7d145217adc6..e486d35c22b2 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -2483,4 +2483,99 @@ int offline_and_remove_memory(u64 start, u64 size)
 	return rc;
 }
 EXPORT_SYMBOL_GPL(offline_and_remove_memory);
+
+/**
+ * offline_and_remove_memory_ranges - offline and remove multiple memory ranges
+ * @ranges: array of physical address ranges to offline and remove
+ * @nr_ranges: number of entries in @ranges
+ *
+ * Offline and remove several memory ranges as one operation, serialized
+ * against other hotplug operations by a single lock_device_hotplug().
+ *
+ * Unlike calling offline_and_remove_memory() in a loop, this offlines *all*
+ * ranges before removing any of them.  If offlining any range fails, the
+ * offlining of the ranges processed so far is reverted and nothing is
+ * removed, leaving every range online as it was before the call.  This gives
+ * callers all-or-nothing semantics for the offline step, so a failed unplug
+ * does not leave a device split between online and removed ranges.
+ *
+ * Each range must be memory-block aligned in start and size.
+ *
+ * Return: 0 on success, negative errno otherwise.  On failure no range has
+ * been removed.
+ */
+int offline_and_remove_memory_ranges(const struct range *ranges, int nr_ranges)
+{
+	unsigned long mb_total = 0;
+	uint8_t *online_types, *tmp;
+	int i, rc = 0;
+
+	if (!ranges || nr_ranges <= 0)
+		return -EINVAL;
+
+	for (i = 0; i < nr_ranges; i++) {
+		u64 start = ranges[i].start;
+		u64 size = range_len(&ranges[i]);
+
+		if (!IS_ALIGNED(start, memory_block_size_bytes()) ||
+		    !IS_ALIGNED(size, memory_block_size_bytes()) || !size)
+			return -EINVAL;
+		mb_total += size / memory_block_size_bytes();
+	}
+
+	/*
+	 * Remember the old online type of every memory block across all ranges,
+	 * so we can revert if offlining a later block fails.  All entries start
+	 * as MMOP_OFFLINE so blocks we never touched are skipped on rollback.
+	 */
+	online_types = kmalloc_array(mb_total, sizeof(*online_types),
+				     GFP_KERNEL);
+	if (!online_types)
+		return -ENOMEM;
+	memset(online_types, MMOP_OFFLINE, mb_total);
+
+	lock_device_hotplug();
+
+	/* Phase 1: offline every block in every range. */
+	tmp = online_types;
+	for (i = 0; i < nr_ranges; i++) {
+		rc = walk_memory_blocks(ranges[i].start, range_len(&ranges[i]),
+					&tmp, try_offline_memory_block);
+		if (rc)
+			break;
+	}
+
+	/*
+	 * Phase 2: only once everything is offline, remove it.  This cannot
+	 * fail as the memory can no longer be onlined in the meantime.
+	 */
+	if (!rc) {
+		for (i = 0; i < nr_ranges; i++) {
+			rc = try_remove_memory(ranges[i].start,
+					       range_len(&ranges[i]));
+			if (rc) {
+				pr_err("%s: Failed to remove memory: %d",
+				       __func__, rc);
+				break;
+			}
+		}
+	}
+
+	/*
+	 * Roll back the offlining if anything failed.  Blocks we never offlined
+	 * are marked MMOP_OFFLINE and skipped by try_reonline_memory_block().
+	 */
+	if (rc) {
+		tmp = online_types;
+		for (i = 0; i < nr_ranges; i++)
+			walk_memory_blocks(ranges[i].start,
+					   range_len(&ranges[i]), &tmp,
+					   try_reonline_memory_block);
+	}
+	unlock_device_hotplug();
+
+	kfree(online_types);
+	return rc;
+}
+EXPORT_SYMBOL_GPL(offline_and_remove_memory_ranges);
 #endif /* CONFIG_MEMORY_HOTREMOVE */
-- 
2.54.0

