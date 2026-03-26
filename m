Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50CDF355F49
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Mar 2026 03:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774495682; cv=none; b=MhLAe7fqlVCb5IAKs73VzJlVUYB/O8aTKbI5rZw47P/odXBXifhLe0UFOlCcEJXpphezRtY6+tr0Ijcoeynp+qQ21AORwB+EXHIPn1zoqSy+VM8ty3+obsL8WAlLWjwyIYyc5zYOpRAQf35OhQYKLRSktxL7jhrk7qRDy+Iu87c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774495682; c=relaxed/simple;
	bh=pgUe2+vPeFtlGsxEtJR+FNgqz0DO3XioPWYd4OIw4bQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Zi33G6cPbcyMSm3F2sIqxMSP4DrrN5CArKwYceCr/kiZ0JO5OF2ERWi/xzyB3HgEVMgn2QQ3QYdF38VrHRnsqgz3ff/04kudO0HIuC2wbbkOB8gjNnQPmDorJUK3ECEFwx0vtgYcpLBtSXhQ3VJd+tIIi4mjrdOiyCAWuWLAc2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=blxMQXhC; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="blxMQXhC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774495680;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NkrZmV+ciJiAg2eJxu0EA95Ha45gXSvLLHXumh7zBiQ=;
	b=blxMQXhC9rdvrU5l8tBTltH2SDfeWVWYCLxRvSk1uZvTAAxu3MNWJmTC+rXO3hfF8Az6CA
	HR5j3khRtsK37U2RHYJbr0LrAQK5dW3QyJMwjdfx9Nxnz9+TKv6HCm7ZMUhrWjuTLbND0K
	RZ16Rt2zOGBZEfzwpJOUrYYHixuuTy8=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-629-BtFk9MNAPCK8rq26DfrzFA-1; Wed,
 25 Mar 2026 23:27:54 -0400
X-MC-Unique: BtFk9MNAPCK8rq26DfrzFA-1
X-Mimecast-MFC-AGG-ID: BtFk9MNAPCK8rq26DfrzFA_1774495672
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6A98C19560A6;
	Thu, 26 Mar 2026 03:27:52 +0000 (UTC)
Received: from fedora-laptop-x1.redhat.com (unknown [10.72.112.83])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 15A8E1955D84;
	Thu, 26 Mar 2026 03:27:45 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: akpm@linux-foundation.org,
	yosry@kernel.org,
	nphamcs@gmail.com,
	hannes@cmpxchg.org,
	mhocko@kernel.org,
	mkoutny@suse.com,
	muchun.song@linux.dev,
	tj@kernel.org,
	roman.gushchin@linux.dev,
	shakeel.butt@linux.dev
Cc: longman@redhat.com,
	liwang@redhat.com,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Yosry Ahmed <yosryahmed@google.com>
Subject: [PATCH v5 6/8] selftest/cgroup: fix zswap test_no_invasive_cgroup_shrink on large pagesize system
Date: Thu, 26 Mar 2026 11:26:56 +0800
Message-ID: <20260326032658.96819-7-liwang@redhat.com>
In-Reply-To: <20260326032658.96819-1-liwang@redhat.com>
References: <20260326032658.96819-1-liwang@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

test_no_invasive_cgroup_shrink sets up two cgroups: wb_group, which is
expected to trigger zswap writeback, and a control group (renamed to
zw_group), which should only have pages sitting in zswap without any
writeback.

There are two problems with the current test:

1) The data patterns are reversed. wb_group uses allocate_bytes(), which
   writes only a single byte per page — trivially compressible,
   especially by zstd — so compressed pages fit within zswap.max and
   writeback is never triggered. Meanwhile, the control group uses
   getrandom() to produce hard-to-compress data, but it is the group
   that does *not* need writeback.

2) The test uses fixed sizes (10K zswap.max, 10MB allocation) that are
   too small on systems with large PAGE_SIZE (e.g. 64K), failing to
   build enough memory pressure to trigger writeback reliably.

Fix both issues by:
  - Swapping the data patterns: fill wb_group pages with partially
    random data (getrandom for page_size/4 bytes) to resist compression
    and trigger writeback, and fill zw_group pages with simple repeated
    data to stay compressed in zswap.
  - Making all size parameters PAGE_SIZE-aware: set allocation size to
    PAGE_SIZE * 1024, memory.zswap.max to PAGE_SIZE, and memory.max to
    allocation_size / 2 for both cgroups.
  - Allocating memory inline instead of via cg_run() so the pages
    remain resident throughout the test.

=== Error Log ===
 # getconf PAGESIZE
 65536

 # ./test_zswap
 TAP version 13
 ...
 ok 5 test_zswap_writeback_disabled
 ok 6 # SKIP test_no_kmem_bypass
 not ok 7 test_no_invasive_cgroup_shrink

Signed-off-by: Li Wang <liwang@redhat.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>
Cc: Michal Hocko <mhocko@kernel.org>
Cc: Michal Koutný <mkoutny@suse.com>
Cc: Muchun Song <muchun.song@linux.dev>
Cc: Nhat Pham <nphamcs@gmail.com>
Cc: Tejun Heo <tj@kernel.org>
Cc: Roman Gushchin <roman.gushchin@linux.dev>
Cc: Shakeel Butt <shakeel.butt@linux.dev>
Cc: Yosry Ahmed <yosryahmed@google.com>
---

Notes:
    v5:
        - Swap data patterns: use getrandom() for wb_group and simple
          memset for zw_group to fix the reversed allocation logic.
        - Rename control_group to zw_group for clarity.
        - Allocate memory inline instead of via cg_run() so pages remain
          resident throughout the test.

 tools/testing/selftests/cgroup/test_zswap.c | 69 ++++++++++++++-------
 1 file changed, 48 insertions(+), 21 deletions(-)

diff --git a/tools/testing/selftests/cgroup/test_zswap.c b/tools/testing/selftests/cgroup/test_zswap.c
index fc7a9aa27e27..72082e5d4725 100644
--- a/tools/testing/selftests/cgroup/test_zswap.c
+++ b/tools/testing/selftests/cgroup/test_zswap.c
@@ -9,6 +9,7 @@
 #include <string.h>
 #include <sys/wait.h>
 #include <sys/mman.h>
+#include <sys/random.h>
 
 #include "kselftest.h"
 #include "cgroup_util.h"
@@ -424,44 +425,70 @@ static int test_zswap_writeback_disabled(const char *root)
 static int test_no_invasive_cgroup_shrink(const char *root)
 {
 	int ret = KSFT_FAIL;
-	size_t control_allocation_size = MB(10);
-	char *control_allocation = NULL, *wb_group = NULL, *control_group = NULL;
+	unsigned int off;
+	size_t allocation_size = page_size * 1024;
+	unsigned int nr_pages = allocation_size / page_size;
+	char zswap_max_buf[32], mem_max_buf[32];
+	char *zw_allocation = NULL, *wb_allocation = NULL;
+	char *zw_group = NULL, *wb_group = NULL;
+
+	snprintf(zswap_max_buf, sizeof(zswap_max_buf), "%zu", page_size);
+	snprintf(mem_max_buf, sizeof(mem_max_buf), "%zu", allocation_size / 2);
 
 	wb_group = setup_test_group_1M(root, "per_memcg_wb_test1");
 	if (!wb_group)
 		return KSFT_FAIL;
-	if (cg_write(wb_group, "memory.zswap.max", "10K"))
+	if (cg_write(wb_group, "memory.zswap.max", zswap_max_buf))
+		goto out;
+	if (cg_write(wb_group, "memory.max", mem_max_buf))
+		goto out;
+
+	zw_group = setup_test_group_1M(root, "per_memcg_wb_test2");
+	if (!zw_group)
 		goto out;
-	control_group = setup_test_group_1M(root, "per_memcg_wb_test2");
-	if (!control_group)
+	if (cg_write(zw_group, "memory.max", mem_max_buf))
 		goto out;
 
-	/* Push some test_group2 memory into zswap */
-	if (cg_enter_current(control_group))
+	/* Push some zw_group memory into zswap (simple data, easy to compress) */
+	if (cg_enter_current(zw_group))
 		goto out;
-	control_allocation = malloc(control_allocation_size);
-	for (int i = 0; i < control_allocation_size; i += page_size)
-		control_allocation[i] = 'a';
-	if (cg_read_key_long(control_group, "memory.stat", "zswapped") < 1)
+	zw_allocation = malloc(allocation_size);
+	for (int i = 0; i < nr_pages; i++) {
+		off = (unsigned long)i * page_size;
+		memset(&zw_allocation[off], 'a', page_size/4);
+	}
+	if (cg_read_key_long(zw_group, "memory.stat", "zswapped") < 1)
 		goto out;
 
-	/* Allocate 10x memory.max to push wb_group memory into zswap and trigger wb */
-	if (cg_run(wb_group, allocate_bytes, (void *)MB(10)))
+	/* Push wb_group memory into zswap with hard-to-compress data to trigger wb */
+	if (cg_enter_current(wb_group))
+		goto out;
+	wb_allocation = malloc(allocation_size);
+	if (!wb_allocation)
 		goto out;
+	for (int i = 0; i < nr_pages; i++) {
+		off = (unsigned long)i * page_size;
+		memset(&wb_allocation[off], 0, page_size);
+		getrandom(&wb_allocation[off], page_size/4, 0);
+	}
 
 	/* Verify that only zswapped memory from gwb_group has been written back */
-	if (get_cg_wb_count(wb_group) > 0 && get_cg_wb_count(control_group) == 0)
+	if (get_cg_wb_count(wb_group) > 0 && get_cg_wb_count(zw_group) == 0)
 		ret = KSFT_PASS;
 out:
 	cg_enter_current(root);
-	if (control_group) {
-		cg_destroy(control_group);
-		free(control_group);
+	if (zw_group) {
+		cg_destroy(zw_group);
+		free(zw_group);
+	}
+	if (wb_group) {
+		cg_destroy(wb_group);
+		free(wb_group);
 	}
-	cg_destroy(wb_group);
-	free(wb_group);
-	if (control_allocation)
-		free(control_allocation);
+	if (zw_allocation)
+		free(zw_allocation);
+	if (wb_allocation)
+		free(wb_allocation);
 	return ret;
 }
 
-- 
2.53.0

