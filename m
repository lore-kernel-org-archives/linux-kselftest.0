Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7465138C2D8
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Mar 2026 04:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773288434; cv=none; b=iG1BZ1M0sXeBIP1k1bD0o8WGS33Px3WyEC1Xx0LFRVroB1/jCEVYOGVl7K5tn+PF4trfMo6iP8jAs1dym1AtKzY2TIdmRiKovN9GpCfskOYsfOAOD/vq4Y6D5dKMAO8Rvm6RAZPMYUcMH/uWNDpU0CgHIBF4B1225YBaSu9iO1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773288434; c=relaxed/simple;
	bh=GKwe3tM7pAujGfzgEBp3TbmU7RLSnk8YwK41AD6hJp8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PWYAeXQxbIwzpbGIDBanX+/Jafb4k/kvutkkXIq+g3+OQxm3Ixgb6t+25IrcBiUs0D/Udm/ol9M01BPkPu9Q7OsdFpch6ViV+XYSJAv79b2b/YAWFO6phxjI1H28qyf7DSd5F+OrEOSml81bOMAEiPAvMkVhm8jaQ5OHJOtV/uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IG8hRkCX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IG8hRkCX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773288431;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7LVa2mXy8mi+FQJYiVHbYk7mU9xR/sNQXxGYQvpMvII=;
	b=IG8hRkCXkynW042fiSCJD2702aLGhxPsdOhPSiiJ8nvF1f6BB50GMbL+w7l3aqennWl9hS
	fiq2WVVHksD5W3K3J/gdXUA9crZn+zZqsSRI75yQZz86lKX2FHaoQh0MUAfkwnNbdPMr/n
	EgEhGY9hWyVr/5ZqHGJyuk2c6wdP9JE=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-607-N2ucGk-gOIaSE-K57NMJag-1; Thu,
 12 Mar 2026 00:07:05 -0400
X-MC-Unique: N2ucGk-gOIaSE-K57NMJag-1
X-Mimecast-MFC-AGG-ID: N2ucGk-gOIaSE-K57NMJag_1773288423
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2CE4A1956053;
	Thu, 12 Mar 2026 04:07:03 +0000 (UTC)
Received: from fedora-laptop-x1.redhat.com (unknown [10.72.112.57])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9E35C19560A6;
	Thu, 12 Mar 2026 04:06:57 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: mkoutny@suse.com,
	yosryahmed@google.com
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Johannes Weiner <hannes@cmpxchg.org>,
	Michal Hocko <mhocko@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	Nhat Pham <nphamcs@gmail.com>,
	Tejun Heo <tj@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>
Subject: [PATCH v2 5/7] selftest/cgroup: fix zswap test_no_invasive_cgroup_shrink on 64K pagesize system
Date: Thu, 12 Mar 2026 12:06:25 +0800
Message-ID: <20260312040627.55257-5-liwang@redhat.com>
In-Reply-To: <20260312040627.55257-1-liwang@redhat.com>
References: <20260312040627.55257-1-liwang@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

The test_no_invasive_cgroup_shrink and allocate_bytes use a hardcoded
stride of 4095 bytes when touching allocated pages. On systems with 64K
page size, this results in writing to the same page multiple times
instead of touching all pages, leading to insufficient memory pressure.

Additionally, the original memory limits and allocation sizes are too
small for 64K page size systems. With only 1M memory.max, there are
very few pages available, and a zswap.max of 10K may not provide enough
room to store even a single compressed page. This can cause OOM kills
or false positives due to insufficient zswap writeback being triggered.

Fix these issues by:
- Using sysconf(_SC_PAGESIZE) instead of the hardcoded 4095 stride in
  both allocate_bytes() and test_no_invasive_cgroup_shrink().
- Increasing memory.max to 32M for both wb_group and control_group to
  ensure enough pages are available regardless of page size.
- Increasing zswap.max from 10K to 64K and allocation sizes from 10M
  to 64M to reliably trigger zswap writeback on all configurations.

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
 tools/testing/selftests/cgroup/test_zswap.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/cgroup/test_zswap.c b/tools/testing/selftests/cgroup/test_zswap.c
index 032c36658a15..654874fb371b 100644
--- a/tools/testing/selftests/cgroup/test_zswap.c
+++ b/tools/testing/selftests/cgroup/test_zswap.c
@@ -83,12 +83,13 @@ static int allocate_and_read_bytes(const char *cgroup, void *arg)
 
 static int allocate_bytes(const char *cgroup, void *arg)
 {
+	long pagesize = sysconf(_SC_PAGESIZE);
 	size_t size = (size_t)arg;
 	char *mem = (char *)malloc(size);
 
 	if (!mem)
 		return -1;
-	for (int i = 0; i < size; i += 4095)
+	for (int i = 0; i < size; i += pagesize)
 		mem[i] = 'a';
 	free(mem);
 	return 0;
@@ -415,34 +416,41 @@ static int test_zswap_writeback_disabled(const char *root)
 static int test_no_invasive_cgroup_shrink(const char *root)
 {
 	int ret = KSFT_FAIL;
-	size_t control_allocation_size = MB(10);
+	long pagesize = sysconf(_SC_PAGESIZE);
+	size_t control_allocation_size = MB(64);
 	char *control_allocation = NULL, *wb_group = NULL, *control_group = NULL;
 
 	wb_group = setup_test_group_1M(root, "per_memcg_wb_test1");
 	if (!wb_group)
 		return KSFT_FAIL;
-	if (cg_write(wb_group, "memory.zswap.max", "10K"))
+	if (cg_write(wb_group, "memory.zswap.max", "64K"))
+		goto out;
+	if (cg_write(wb_group, "memory.max", "32M"))
 		goto out;
+
 	control_group = setup_test_group_1M(root, "per_memcg_wb_test2");
 	if (!control_group)
 		goto out;
+	if (cg_write(control_group, "memory.max", "32M"))
+		goto out;
 
 	/* Push some test_group2 memory into zswap */
 	if (cg_enter_current(control_group))
 		goto out;
 	control_allocation = malloc(control_allocation_size);
-	for (int i = 0; i < control_allocation_size; i += 4095)
+	for (int i = 0; i < control_allocation_size; i += pagesize)
 		control_allocation[i] = 'a';
 	if (cg_read_key_long(control_group, "memory.stat", "zswapped") < 1)
 		goto out;
 
-	/* Allocate 10x memory.max to push wb_group memory into zswap and trigger wb */
-	if (cg_run(wb_group, allocate_bytes, (void *)MB(10)))
+	/* Allocate 2x memory.max to push wb_group memory into zswap and trigger wb */
+	if (cg_run(wb_group, allocate_bytes, (void *)MB(64)))
 		goto out;
 
 	/* Verify that only zswapped memory from gwb_group has been written back */
 	if (get_cg_wb_count(wb_group) > 0 && get_cg_wb_count(control_group) == 0)
 		ret = KSFT_PASS;
+
 out:
 	cg_enter_current(root);
 	if (control_group) {
-- 
2.53.0

