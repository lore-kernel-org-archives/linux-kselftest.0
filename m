Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5DE36C9C2
	for <linux-kselftest@vger.kernel.org>; Sun, 22 Mar 2026 06:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774159902; cv=none; b=CRs+rj5BCRvFeQ4zBD4vCrOEBxDKswClO3gECOkFQXgxSjCUUS1KqbN9bBIrNP9cKriv5lQf49SOj3OQkxCSv9FJCRcyzDZVJelDI5z/tJwyUiuqncqzQhFZXxma2edB4Sx/A/XkST5lpTN1NVmEdw9e6wCGDuI/BTLGLi2nU6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774159902; c=relaxed/simple;
	bh=LJ+zVwF30JYUzhOjxEZNUG57T+Cxg8IS889U6CiR7BU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RrdQGilWNKCY7FEN6YohKsfqgAjNEIFaQoHFqusYn7ml4rZojkAhsSI4/xKPoVK/7gIj/j5vZ7INub3G54rm6CxzOePTWLOAn+4IdS954mPnMVuejau4EC9eLw7E4IINymYjebeB2xGkmrz8zU8k4tyQyAvvOplqreurn3tTcr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RBs6TLuK; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RBs6TLuK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774159899;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SrL2AX+ceqx9sNAAroe9dHxRWyg67vSJ191ORAP+K8A=;
	b=RBs6TLuKZdn9kzrPKKU2CC2xfijo5GY0gLUSLB6TwrdzF3wJQBd24/MTqKzk4djsE4vV3Z
	f4fIqikkGOh1SIkXLxY6+x+Da/yCFqFCHIjJ0HwBll/Wm7yW4EjaoRuva5ZvZAAk42oPFa
	57YQ7a2ea0Y/PAvFhk7IvJSORtFVrWM=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-572-9gLZOP22NOy9Wgnz9yPBWw-1; Sun,
 22 Mar 2026 02:11:35 -0400
X-MC-Unique: 9gLZOP22NOy9Wgnz9yPBWw-1
X-Mimecast-MFC-AGG-ID: 9gLZOP22NOy9Wgnz9yPBWw_1774159893
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6401E195608A;
	Sun, 22 Mar 2026 06:11:33 +0000 (UTC)
Received: from fedora-laptop-x1.redhat.com (unknown [10.72.112.34])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1EB9F1955F21;
	Sun, 22 Mar 2026 06:11:26 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: akpm@linux-foundation.org,
	yosry@kernel.org,
	yosryahmed@google.com,
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
	linux-mm@kvack.org
Subject: [PATCH v4 6/7] selftest/cgroup: fix zswap test_no_invasive_cgroup_shrink on large pagesize system
Date: Sun, 22 Mar 2026 14:10:37 +0800
Message-ID: <20260322061038.156146-7-liwang@redhat.com>
In-Reply-To: <20260322061038.156146-1-liwang@redhat.com>
References: <20260322061038.156146-1-liwang@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

test_no_invasive_cgroup_shrink uses fixed zswap/memory limits and
allocation sizes that are too small on systems with large PAGE_SIZE
(e.g. 64K). In that case, the test may fail to build enough pressure
to trigger zswap writeback reliably, leading to false failures.

Make the test size parameters PAGE_SIZE-aware and consistent:
  - set control_allocation_size to PAGE_SIZE * 1024,
  - set memory.zswap.max to PAGE_SIZE,
  - set memory.max of both cgroups to control_allocation_size / 2,
  - allocate control_allocation_size in wb_group (2x memory.max).

This keeps the test behavior stable across 4K and 64K PAGE_SIZE
configurations and avoids spurious failures in
test_no_invasive_cgroup_shrink.

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
    v4:
    	- Use use %zu in print pagesize format.
    v3:
    	- Make PAGE_SIZE aware instead of using fixed sizing.
    	- Set memory.max for  wb_group/control_group to control_allocation_size/2.
    	- Update wb_group pressure allocation to control_allocation_size.
    	- Clarify commit message to focus on this test's sizing issue.
    v2:
    	- No change.

 tools/testing/selftests/cgroup/test_zswap.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/cgroup/test_zswap.c b/tools/testing/selftests/cgroup/test_zswap.c
index 407cfb6ae34d..ec7f0bd515e1 100644
--- a/tools/testing/selftests/cgroup/test_zswap.c
+++ b/tools/testing/selftests/cgroup/test_zswap.c
@@ -421,17 +421,26 @@ static int test_zswap_writeback_disabled(const char *root)
 static int test_no_invasive_cgroup_shrink(const char *root)
 {
 	int ret = KSFT_FAIL;
-	size_t control_allocation_size = MB(10);
+	size_t control_allocation_size = pagesize * 1024;
+	char zswap_max_buf[32], mem_max_buf[32];
 	char *control_allocation = NULL, *wb_group = NULL, *control_group = NULL;
 
+	snprintf(zswap_max_buf, sizeof(zswap_max_buf), "%zu", pagesize);
+	snprintf(mem_max_buf, sizeof(mem_max_buf), "%zu", control_allocation_size / 2);
+
 	wb_group = setup_test_group_1M(root, "per_memcg_wb_test1");
 	if (!wb_group)
 		return KSFT_FAIL;
-	if (cg_write(wb_group, "memory.zswap.max", "10K"))
+	if (cg_write(wb_group, "memory.zswap.max", zswap_max_buf))
+		goto out;
+	if (cg_write(wb_group, "memory.max", mem_max_buf))
 		goto out;
+
 	control_group = setup_test_group_1M(root, "per_memcg_wb_test2");
 	if (!control_group)
 		goto out;
+	if (cg_write(control_group, "memory.max", mem_max_buf))
+		goto out;
 
 	/* Push some test_group2 memory into zswap */
 	if (cg_enter_current(control_group))
@@ -442,8 +451,8 @@ static int test_no_invasive_cgroup_shrink(const char *root)
 	if (cg_read_key_long(control_group, "memory.stat", "zswapped") < 1)
 		goto out;
 
-	/* Allocate 10x memory.max to push wb_group memory into zswap and trigger wb */
-	if (cg_run(wb_group, allocate_bytes, (void *)MB(10)))
+	/* Allocate 2x memory.max to push wb_group memory into zswap and trigger wb */
+	if (cg_run(wb_group, allocate_bytes, (void *)control_allocation_size))
 		goto out;
 
 	/* Verify that only zswapped memory from gwb_group has been written back */
-- 
2.53.0

