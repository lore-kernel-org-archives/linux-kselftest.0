Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52823322B7B
	for <linux-kselftest@vger.kernel.org>; Tue, 30 Jun 2026 21:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782854346; cv=none; b=K69RQ0742Mre3V/j5Rm6PjLY2PfwZKiezIxGYWgpV94e1T9038keL1BRcWNL/i2RyhNzPjOyyXGDKyKJl+y5EK4j9YB/BhJIxX/yZfwHgvQUZB4ErjWWEMytjjeEd+nuIrH8ves2ceVQM4MRaD/PGvxXqlC5+MTnZUKkya3lrvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782854346; c=relaxed/simple;
	bh=rpppi1L4EyTdLWFQGiVuS22x/FK8l3zfXc2OeomuJHE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ue7QcOlE/oaruDloilXho9pIhe+5+p/A4YsRwXT1AHjz79PaHqQMFkEnYH5RiO3DHAFgzCZWS9eIBePAvyS6sdatIRpW7ffRpvu1c3NVRPukBbLP9kHbcxMLe+0M5AyaZf+VnanqdtqIM2hNUswJl+m85/yOUoUk85T7qQZHfnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=c+LPI5L8; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="c+LPI5L8"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-92e65e18969so122114185a.1
        for <linux-kselftest@vger.kernel.org>; Tue, 30 Jun 2026 14:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1782854339; x=1783459139; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IlH3KkL8/9MzSzFxKUCH14o1Ashb5MOZ1jESfo9s8Rg=;
        b=c+LPI5L83oLdosJI26NCf5TPjk3uKZaQFT3LK6qEjz2xtsq83cseUG4xiezViLY9E3
         TIiQR4AEKY0JYQyaI6PjQ8fwcmFzz0Bj4BwmU6mrrgWczj8DBKjQ2dkgADhH/KTrZ9mA
         9Ddixq2gXRR6x6C2FpToDT43xbd56ZP6HhGL5id1j0foFj5z3KU1IyUjv60vxo9AwYOZ
         BKLyJgiTTGrO7LbtgZnJTz8H9rLUl2rxOE/ioTkFAmA+B/lT96f4B+dsHSfPSPJpsRDQ
         2EJkAWYzmb5G9nAkTxMkURTys7IKLaKjxoJwGzUvxfab/S/NPj9xyYZy29/UDTqJTX9d
         uuwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782854339; x=1783459139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IlH3KkL8/9MzSzFxKUCH14o1Ashb5MOZ1jESfo9s8Rg=;
        b=bW5NKvwvxRqJRzQavGjDRBbHYcnK+1nlYh/wGvDscYJxlFR0Km+d0ZZF0ccqG/p3ao
         36HjrTq4T3cmCUYCLf0xLX3RGmdWZYhA4NoHDIXkMmIp7iiFrZXnnT3DwynYq5djxP1U
         gZk4trh30W3Z24054aKeitp2/yapK54NvIl7GUDVVSM/4kcUfMpvqDm49mAJPiXn85He
         gJ1mBMZsk1U7wmW9UdikrYHhoGbby1JlhigNqS7BuKlDm4EaF68ip6u6Sr1XyyIeLM57
         8VrP0AVALS2ZBWIc5B0KRurjIgozE79d1pYF0+dbhw5l9iLKrt5kr5ZSSOUIQXzn2NUd
         jkSg==
X-Forwarded-Encrypted: i=1; AFNElJ9GC3xAD4D0JyKZp+M43mK+iurKCLeSG7xFHLR8REzBMtRgqssqxMuJpIXwnaq8IAV+HC89PEpqzZXuC17efqk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyln+TR0l9lJxBztpu7Nc5fqKQJZYOn8ISntdemrqLiSR7ofGG8
	+K31Y+7IuBcjC/Dn3qwKH3sM2HV8PxstkBQh8QioAoQSE+BXOWlKIDe5P8pM+XHtcRw=
X-Gm-Gg: AfdE7cm8BBxATH4vOLybZVcJeY7HBlwcBu/2lNRIPn6tTpEwRLbDLbpP/+e1LL2xoQW
	sdR7oo4+SFT+tylh+l3fDd8a9f/RDnygz5Ri5fq9kd58XVlCgQ6xe7NpiaJuZll8Fwik0NZnB5Y
	rK9dBg9ukdcqkkYLJenagNCHbsilgo5zh9Aea5p/88NuxCDTfzjMFuK8ac17ZVXEV+8bb4/XEnK
	3DSKpXr9BxIMLVzh7MYdiHvxgxnb9oXv7PJDg+1XI+BNqH04n2KXBhcv7x96j/WAskN0ZtYwAvo
	D0/TBElKpjEUpnzmCWZurzx/HIwsgYdW8p+v2zGAzTZoT36mlakfuBIp8+AeUj79wNdlTNCX1FL
	mDD+1JhNeKAey+XBh2jbeMgox6rk2DS636I19XtgpdVI1X/ewtoFWiuCC7TVGSGX10jk1md1r/E
	sbD0aJcI2P+VSe8ONovPsurK9LAtmGt7VqxMB29lASvNF3omxb6zfU9WGc87s1Lh0iYHzbhwMLx
	g==
X-Received: by 2002:a05:620a:29cb:b0:92e:5b63:224e with SMTP id af79cd13be357-92e697c18camr444975285a.22.1782854339094;
        Tue, 30 Jun 2026 14:18:59 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e62366303sm335924285a.40.2026.06.30.14.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 14:18:58 -0700 (PDT)
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
Subject: [PATCH v6 06/10] mm/memory_hotplug: add offline_and_remove_memory_ranges()
Date: Tue, 30 Jun 2026 17:18:38 -0400
Message-ID: <20260630211842.2252800-7-gourry@gourry.net>
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

offline_and_remove_memory() handles a single contiguous range.

Callers that manage a device composed of several ranges (dax/kmem)
currently have to call it in a loop, which gives up atomicity.

In addition to pushing rollback logic into the driver, the lack
of atomicity creates a race condition between system daemons trying
to manage the same resource:

   - Manager 1:  Offlines memory blocks.    Removes device.
                                        ^^^^
   - Manager 2:  Detects offline memory blocks, re-onlines them.

Add offline_and_remove_memory_ranges(), which takes an array of ranges
and processes them as one operation under a single lock_device_hotplug():

  - Phase 1 offlines every block of every range.
  - Phase 2 removes the ranges only if all ranges are offline.
  - If any offline fails, the whole operation is reverted.

This gives callers all-or-nothing semantics for the offline step, so a
failed or interrupted unplug leaves the device in a consistent state.

This also resolves the battling managers race - the second manager's
operation simply fails when the block is destroyed / cannot be onlined.

offline_and_remove_memory() becomes a thin wrapper that passes its single
range to the new helper, so the offline/rollback logic lives in one place.

Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
Signed-off-by: Gregory Price <gourry@gourry.net>
---
 include/linux/memory_hotplug.h |  8 +++
 mm/memory_hotplug.c            | 93 ++++++++++++++++++++++++----------
 2 files changed, 73 insertions(+), 28 deletions(-)

diff --git a/include/linux/memory_hotplug.h b/include/linux/memory_hotplug.h
index ff3b865ea7e7..db10d50f30ae 100644
--- a/include/linux/memory_hotplug.h
+++ b/include/linux/memory_hotplug.h
@@ -268,6 +268,8 @@ extern int offline_pages(unsigned long start_pfn, unsigned long nr_pages,
 extern int remove_memory(u64 start, u64 size);
 extern void __remove_memory(u64 start, u64 size);
 extern int offline_and_remove_memory(u64 start, u64 size);
+int offline_and_remove_memory_ranges(const struct range *ranges,
+		unsigned int nr_ranges);
 
 #else
 static inline void try_offline_node(int nid) {}
@@ -284,6 +286,12 @@ static inline int remove_memory(u64 start, u64 size)
 }
 
 static inline void __remove_memory(u64 start, u64 size) {}
+
+static inline int offline_and_remove_memory_ranges(const struct range *ranges,
+		unsigned int nr_ranges)
+{
+	return -EBUSY;
+}
 #endif /* CONFIG_MEMORY_HOTREMOVE */
 
 #ifdef CONFIG_MEMORY_HOTPLUG
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index a66346def504..3225364bec2f 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -2429,58 +2429,95 @@ static int try_reonline_memory_block(struct memory_block *mem, void *arg)
  */
 int offline_and_remove_memory(u64 start, u64 size)
 {
-	const unsigned long mb_count = size / memory_block_size_bytes();
+	struct range range = {
+		.start = start,
+		.end = start + size - 1,
+	};
+
+	return offline_and_remove_memory_ranges(&range, 1);
+}
+EXPORT_SYMBOL_GPL(offline_and_remove_memory);
+
+/**
+ * offline_and_remove_memory_ranges - offline and remove multiple memory ranges
+ * @ranges: array of physical address ranges to offline and remove
+ * @nr_ranges: number of entries in @ranges
+ *
+ * Offline and remove several memory ranges as one operation, serialized
+ * against other hotplug operations by a single lock_device_hotplug().
+ *
+ * This offlines all ranges before removing any of them.  If offlining any
+ * range fails, the entire process is reverted and nothing is removed.
+ * This provides a fully atomic semantic for unplugging an entire device.
+ *
+ * Each range must be memory-block aligned in start and size.
+ *
+ * Return: 0 on success, negative errno otherwise.  On failure no range has
+ * been removed.
+ */
+int offline_and_remove_memory_ranges(const struct range *ranges,
+		unsigned int nr_ranges)
+{
+	unsigned long mb_count = 0;
 	uint8_t *online_types, *tmp;
-	int rc;
+	unsigned int i;
+	int rc = 0;
 
-	if (!IS_ALIGNED(start, memory_block_size_bytes()) ||
-	    !IS_ALIGNED(size, memory_block_size_bytes()) || !size)
+	if (!ranges || !nr_ranges)
 		return -EINVAL;
 
+	for (i = 0; i < nr_ranges; i++) {
+		const u64 start = ranges[i].start;
+		const u64 size = range_len(&ranges[i]);
+
+		if (!IS_ALIGNED(start, memory_block_size_bytes()) ||
+		    !IS_ALIGNED(size, memory_block_size_bytes()) || !size)
+			return -EINVAL;
+		mb_count += size / memory_block_size_bytes();
+	}
+
 	/*
-	 * We'll remember the old online type of each memory block, so we can
-	 * try to revert whatever we did when offlining one memory block fails
-	 * after offlining some others succeeded.
+	 * Remember the old online type of every memory block across all ranges,
+	 * so we can revert if offlining a later block fails.  All entries start
+	 * as MMOP_OFFLINE so blocks we never touched are skipped on rollback.
 	 */
 	online_types = kmalloc_array(mb_count, sizeof(*online_types),
 				     GFP_KERNEL);
 	if (!online_types)
 		return -ENOMEM;
-	/*
-	 * Initialize all states to MMOP_OFFLINE, so when we abort processing in
-	 * try_offline_memory_block(), we'll skip all unprocessed blocks in
-	 * try_reonline_memory_block().
-	 */
 	memset(online_types, MMOP_OFFLINE, mb_count);
 
 	lock_device_hotplug();
 
+	/* Phase 1: offline every block in every range. */
 	tmp = online_types;
-	rc = walk_memory_blocks(start, size, &tmp, try_offline_memory_block);
-
-	/*
-	 * In case we succeeded to offline all memory, remove it.
-	 * This cannot fail as it cannot get onlined in the meantime.
-	 */
-	if (!rc) {
-		rc = try_remove_memory(start, size);
+	for (i = 0; i < nr_ranges; i++) {
+		rc = walk_memory_blocks(ranges[i].start, range_len(&ranges[i]),
+					&tmp, try_offline_memory_block);
 		if (rc)
-			pr_err("%s: Failed to remove memory: %d", __func__, rc);
+			break;
 	}
 
-	/*
-	 * Rollback what we did. While memory onlining might theoretically fail
-	 * (nacked by a notifier), it barely ever happens.
-	 */
+	/* If any failure occurred at all, rollback any changes and bail */
 	if (rc) {
 		tmp = online_types;
-		walk_memory_blocks(start, size, &tmp,
-				   try_reonline_memory_block);
+		for (i = 0; i < nr_ranges; i++)
+			walk_memory_blocks(ranges[i].start,
+					   range_len(&ranges[i]), &tmp,
+					   try_reonline_memory_block);
+		goto out_unlock;
 	}
+
+	/* Phase 2: Remove. This should never fail holding the hotplug lock */
+	for (i = 0; i < nr_ranges; i++)
+		WARN_ON_ONCE(try_remove_memory(ranges[i].start,
+					       range_len(&ranges[i])));
+
+out_unlock:
 	unlock_device_hotplug();
 
 	kfree(online_types);
 	return rc;
 }
-EXPORT_SYMBOL_GPL(offline_and_remove_memory);
+EXPORT_SYMBOL_GPL(offline_and_remove_memory_ranges);
 #endif /* CONFIG_MEMORY_HOTREMOVE */
-- 
2.53.0-Meta

