Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.229
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794296710;
	b=fgFmMMPAt4qcMGwtbmjM2Jdhx5WTWpP54zx/Zg8y5RCZ2S4W1+kdeORsXJ/6ch1jXUb8
	 GCxt6xnugqCe41kNV8RbCs4MW0zSncr4Z3xxtaLLGpfSzK2JkPkUJkCOcAoWRROqU7FxO
	 H9IIwf464oD/tDj0wuZoA5BsiLm3ku2xXPtbecJl9dQwkaLeBUdbjaM8MV5VFj4G4nRHf
	 4aJHrySTBOEjbhZiN1I2ZFCkarWOgjiagBoKB6kTjEwqi0hiar4JQpiil7N9wAFAHDlwI
	 tfIY2QX66N3OPs6Phbsni2fpo0seI/mHdrFTjDdZ0pTfUTrpd8aatoYVIxxkdCYlUNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794296710;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=3dI0t/SwdqvYchxdAM18dF6Ej68UZ7/5g2MyxsU/FwM=;
	b=N/8L3JRpvR5zGzl2hj7iS2lsdi3yXAVS8jeY4z+dUAZ88S+gWEHRErXX+kxD19tqPzp2
	 7Xw5JGbtk+rSykaSKAFSibis+Wq/HbLAStDwQFwpTtF05oACzmqxeEIpAY+c2PDOSSul5
	 mthAAKUHdGAxPg5nQWyjva7tt7cjt+qV8DKn5AfGh+Rjq2M2fIjt8eJ2tOGVTZR8NfU9w
	 ldMqP4PB3B8qVy1Wm9vUXEc5ZQASob9RrwOMm8sI+LqmMtx59kGaJ24OmUEACVsq+rbjf
	 kflkSqNyMHOuL5fxJAP8GqkV4hMHUIqZABv4omTWwIA6aD80AuwipgjkntB15QN4s4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=RelAKPru;
	arc=none smtp.remote-ip=91.218.175.229
Received: from mta0.migadu.com (out-229.mta0.migadu.com [91.218.175.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5607660711D3
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 07:45:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5607660711D3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=RelAKPru
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=4FYYcIMsWui5FEtbJc216IVCEEljsCSq2dMO0ldq0m0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794296707; v=1; x=1794901507;
 b=RelAKPruwzUF0dmqfLH7UcqhLAHJBe4St9VpbqdmnCc+DYgKLU4RMGWOyVIbsVjDgG4G2OVb
 VfQQHxevQ0ZlZjAmk2Fd30hEHJEkcHfFKzBe+fGwHqlqKEe6F6+Z0VD4NqJ53KFlwtWkgANbt2P
 e5YK62pI/ktysaItN4T5S29s=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 0f38bc380dfc5c8d;
	Tue, 10 Nov 2026 07:45:05 +0000
X-Mizu-Trace-ID: 0f38bc380dfc5c8d
X-Migadu-Flow: FLOW_OUT
From: "Xu Xin (vivo)" <xu.xin@linux.dev>
To: xu.xin@linux.dev
Cc: akpm@linux-foundation.org,
	chengming.zhou@linux.dev,
	corbet@lwn.net,
	david@kernel.org,
	link@vivo.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org,
	ljs@kernel.org,
	odys.yuan@gmail.com,
	rppt@kernel.org,
	surenb@google.com,
	tujinjiang@huawei.com,
	vbabka@kernel.org,
	xiao.wang@vivo.com
Subject: [PATCH 1/4] ksm: add only_merge_zero_pages to merge only empty anonymous pages
Date: Tue, 10 Nov 2026 15:44:48 +0800
Message-Id: <20261110074451.220524-1-xu.xin@linux.dev>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110074312.219847-1-xu.xin@linux.dev>
References: <20261110074312.219847-1-xu.xin@linux.dev>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a new sysfs attribute, /sys/kernel/mm/ksm/only_merge_zero_pages,
which, when enabled, makes ksmd merge only empty (zeroed) anonymous
pages with the kernel zero page and skip the stable and unstable trees
entirely for pages that carry data.

The attribute requires use_zero_pages to be 1, and the two are kept
consistent by symmetric constraints: it cannot be enabled while
use_zero_pages is 0 (-EINVAL), and use_zero_pages cannot be turned
off while it is active (-EBUSY). Both store handlers take
ksm_thread_mutex around their check-and-set so that a concurrent write
to the two attributes cannot leave use_zero_pages=0 and
only_merge_zero_pages=1, a state in which ksmd would scan and checksum
pages but never merge any. The new attribute can be changed at any time
and is only effective for pages merged after the change.

Benefits in three aspects
=========================
- Memory saving:
  On memory-constrained systems such as Android and embedded devices,
  zero-filled anonymous pages are the largest source of duplicate
  anonymous memory. They are produced by userspace allocators: the
  zeroing of freshly allocated Java objects and buffers in the ART heap
  (new byte[]/int[], Bitmap buffers), calloc/memset in native code, and
  preallocated media buffers. Merging them with the kernel zero page
  frees a significant amount of physical memory, which matters as DRAM
  costs keep rising. With this enabled, we measured 100MB–300MB saving
  tested with several popular applications on aarch64 (Android).

- CPU overhead reduction:
  Merging only zero pages also reduces the overhead of ksmd. A page that
  is not merged with the zero page carries data and can never be merged
  with the zero page, so there is no point in searching the stable tree
  or inserting it into the unstable tree for it. Skipping those tree
  operations for data-bearing pages reduces both the CPU time and the
  rhashtable memory footprint of ksmd, which makes zero page merging
  practical on low-resource devices where full KSM scanning would be too
  expensive.

- Security:
  Finally, this shrinks the KSM side-channel attack surface: only zero
  pages are ever merged, so the sharing status of data-bearing pages is
  no longer observable through KSM timing side channels.

Note
=====
- Suitable for Android, embedded and low-memory devices, where zero-page
  deduplication is wanted but full KSM scanning is too costly, and reduced
  KSM side-channel exposure is desired. Many handset vendors may prefer
  this knob, which can be used as a default fallback policy.

- Not suitable for server and virtualization workloads containing many
  non-zero duplicate pages, where vanilla KSM provides better memory
  savings.

Signed-off-by: Xu Xin (vivo) <xu.xin@linux.dev>
Reviewed-by: Huan Yang <link@vivo.com>
Cc: Wang Xiao <xiao.wang@vivo.com>
---
 Documentation/admin-guide/mm/ksm.rst | 40 ++++++++++++++++-
 mm/ksm.c                             | 67 ++++++++++++++++++++++++++++
 2 files changed, 106 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/mm/ksm.rst b/Documentation/admin-guide/mm/ksm.rst
index c329ca747b8c..7c2cbac4b020 100644
--- a/Documentation/admin-guide/mm/ksm.rst
+++ b/Documentation/admin-guide/mm/ksm.rst
@@ -128,10 +128,48 @@ use_zero_pages
         KSM for some workloads, for example if the checksums of pages
         candidate for merging match the checksum of an empty
         page. This setting can be changed at any time, it is only
-        effective for pages merged after the change.
+        effective for pages merged after the change. Turning this off
+        while ``only_merge_zero_pages`` is enabled fails with EBUSY;
+        clear ``only_merge_zero_pages`` first.
 
         Default: 0 (normal KSM behaviour as in earlier releases)
 
+only_merge_zero_pages
+        specifies whether ksmd should only merge empty (zeroed)
+        anonymous pages, with the kernel zero page, and skip the stable
+        and unstable trees entirely for pages that carry data. This
+        requires ``use_zero_pages`` to be 1; it cannot be enabled while
+        ``use_zero_pages`` is 0, and ``use_zero_pages`` cannot be turned
+        off while it is enabled (the write fails with EBUSY).
+
+        This is useful on memory-constrained systems (e.g. Android and
+        embedded devices) where the main source of duplicate anonymous
+        memory is zero-filled pages produced by userspace allocators
+        (for example the zeroing of freshly allocated Java objects and
+        buffers in the ART heap, ``calloc``/``memset`` in native code,
+        and pre-allocated media buffers). Merging only those pages
+        avoids the per-page cost of searching and inserting into the
+        stable and unstable trees for data-bearing pages, which reduces
+        the CPU and memory overhead of ksmd. It also shrinks the KSM
+        side-channel attack surface, since only zero pages are ever
+        merged and the sharing state of data-bearing pages is no longer
+        observable through KSM.
+
+        - Suitable for: Android, embedded and low-memory devices, where
+          zero-page deduplication is wanted but full KSM scanning is
+          too costly, and reduced KSM side-channel exposure is desired.
+          Many handset vendors may prefer this knob, which can be used
+          as a default fallback policy.
+
+        - Not suitable for: Server and virtualization workloads containing
+          many non-zero duplicate pages, where vanilla KSM provides better
+          memory savings.
+
+        This setting can be changed at any time, it is only effective
+        for pages merged after the change.
+
+        Default: 0 (normal KSM behaviour)
+
 max_page_sharing
         Maximum sharing allowed for each KSM page. This enforces a
         deduplication limit to avoid high latency for virtual memory
diff --git a/mm/ksm.c b/mm/ksm.c
index 5e24b5ca8dc8..49f3728a3d03 100644
--- a/mm/ksm.c
+++ b/mm/ksm.c
@@ -295,6 +295,13 @@ static unsigned int zero_checksum __read_mostly;
 /* Whether to merge empty (zeroed) pages with actual zero pages */
 static bool ksm_use_zero_pages __read_mostly;
 
+/*
+ * When set, ksmd only merges empty (zeroed) anonymous pages with the kernel
+ * zero page and skips the stable/unstable tree entirely for pages that carry
+ * data. This requires ksm_use_zero_pages to be enabled.
+ */
+static bool ksm_only_merge_zero_pages __read_mostly;
+
 /* Skip pages that couldn't be de-duplicated previously */
 /* Default to true at least temporarily, for testing */
 static bool ksm_smart_scan = true;
@@ -2323,6 +2330,14 @@ static void cmp_and_merge_page(struct page *page, struct ksm_rmap_item *rmap_ite
 
 		if (!try_to_merge_with_zero_page(rmap_item, page))
 			return;
+
+		/*
+		 * A page that reached here was not merged with the zero page this
+		 * round. Under only_merge_zero_pages we do not insert it into the
+		 * stable/unstable trees.
+		 */
+		if (ksm_only_merge_zero_pages)
+			return;
 	}
 
 	/* Start by searching for the folio in the stable tree */
@@ -3697,12 +3712,63 @@ static ssize_t use_zero_pages_store(struct kobject *kobj,
 	if (err)
 		return -EINVAL;
 
+	/*
+	 * only_merge_zero_pages depends on use_zero_pages: refuse to turn
+	 * the latter off while the former is active, so the two cannot
+	 * silently diverge. Take ksm_thread_mutex so that this check-and-set
+	 * is serialized against only_merge_zero_pages_store(), which reads
+	 * ksm_use_zero_pages under the same lock.
+	 */
+	mutex_lock(&ksm_thread_mutex);
+	if (!value && ksm_only_merge_zero_pages) {
+		mutex_unlock(&ksm_thread_mutex);
+		return -EBUSY;
+	}
 	ksm_use_zero_pages = value;
+	mutex_unlock(&ksm_thread_mutex);
 
 	return count;
 }
 KSM_ATTR(use_zero_pages);
 
+static ssize_t only_merge_zero_pages_show(struct kobject *kobj,
+					  struct kobj_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%u\n", ksm_only_merge_zero_pages);
+}
+static ssize_t only_merge_zero_pages_store(struct kobject *kobj,
+					   struct kobj_attribute *attr,
+					   const char *buf, size_t count)
+{
+	int err;
+	bool value;
+
+	err = kstrtobool(buf, &value);
+	if (err)
+		return -EINVAL;
+
+	/*
+	 * Take ksm_thread_mutex so that this check-and-set is serialized
+	 * against use_zero_pages_store(), which reads ksm_only_merge_zero_pages
+	 * under the same lock. Without it, a concurrent write to the two
+	 * attributes could leave use_zero_pages=0 and only_merge_zero_pages=1,
+	 * a state in which ksmd would scan and checksum pages but never merge
+	 * any.
+	 */
+	mutex_lock(&ksm_thread_mutex);
+	if (value && !ksm_use_zero_pages) {
+		mutex_unlock(&ksm_thread_mutex);
+		pr_warn_once("ksm: only_merge_zero_pages can only be enabled "
+			     "when use_zero_pages is 1\n");
+		return -EINVAL;
+	}
+	ksm_only_merge_zero_pages = value;
+	mutex_unlock(&ksm_thread_mutex);
+
+	return count;
+}
+KSM_ATTR(only_merge_zero_pages);
+
 static ssize_t max_page_sharing_show(struct kobject *kobj,
 				     struct kobj_attribute *attr, char *buf)
 {
@@ -4028,6 +4094,7 @@ static struct attribute *ksm_attrs[] = {
 	&stable_node_dups_attr.attr,
 	&stable_node_chains_prune_millisecs_attr.attr,
 	&use_zero_pages_attr.attr,
+	&only_merge_zero_pages_attr.attr,
 	&general_profit_attr.attr,
 	&smart_scan_attr.attr,
 	&advisor_mode_attr.attr,
-- 
2.34.1

