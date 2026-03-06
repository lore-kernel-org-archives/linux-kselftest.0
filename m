Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5BB9372678
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Mar 2026 07:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772781548; cv=none; b=J1nmCvBxideJIeTc8sId5HFK4KkaB9aQz/TwY9qKop5cMwUbXBbD0/aclGqgGAwdj34XszCnNA9hqPTxhnQFCi994zFR8kZsl33cOHue/xN5551sKgJse3yanEAS9UUkrdAO1zEax7BEWu2YSheqEqeOpTKubsdqStp2E1d3Pi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772781548; c=relaxed/simple;
	bh=7jFQtJUpvDNvQZ2epYCYWz/JrB9yXOw2gmZgrS8vWQY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HpQx4wwsdYkxfVZ8uKzM5bnOiMTml9XuqtuLo1SRZyqOj5LKbdAeZShsXcuWkdj+wu+/6tw5y2wHC64+3chkNteP30XUhV1Xbm4JzWPUtE3FumbXTt6N8XvUbL2gZK8wa/bSyFO3/5FGxwMFMUCmlLoUhz4/uy1v52lsd/o75e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZqwzOl5x; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZqwzOl5x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772781546;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AzgkXV/q4FugoUPcVhIeYwxz2edcgNxRERTnTanenis=;
	b=ZqwzOl5xSRA/SNEoNZ+BbQvp/GYqW3efhYDKXFQ6fPeXcDe3rIEBufmka/QlrQlV/2Oont
	A9YucOA1EQAoKC4mbdM8LLBhx5jDdudh+JWSVELtOftLkZuDd5F2kDIVMp94nQtYZJyt/I
	IdFPvfYn642kA2xlnIB+wlhOAEWuEZw=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-317-rNchILB_P02UjTbgWVfioQ-1; Fri,
 06 Mar 2026 02:19:01 -0500
X-MC-Unique: rNchILB_P02UjTbgWVfioQ-1
X-Mimecast-MFC-AGG-ID: rNchILB_P02UjTbgWVfioQ_1772781539
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 43DFB1800561;
	Fri,  6 Mar 2026 07:18:59 +0000 (UTC)
Received: from fedora-laptop-x1.redhat.com (unknown [10.72.112.139])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6DC761800361;
	Fri,  6 Mar 2026 07:18:54 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org
Cc: Waiman Long <longman@redhat.com>,
	Christoph Lameter <cl@linux.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Michal Hocko <mhocko@kernel.org>,
	Shakeel Butt <shakeelb@google.com>,
	Tejun Heo <tj@kernel.org>,
	Vlastimil Babka <vbabka@suse.cz>
Subject: [PATCH 2/2] selftests/cgroup: include slab in test_percpu_basic memory check
Date: Fri,  6 Mar 2026 15:18:43 +0800
Message-ID: <20260306071843.149147-2-liwang@redhat.com>
In-Reply-To: <20260306071843.149147-1-liwang@redhat.com>
References: <20260306071843.149147-1-liwang@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

test_percpu_basic() currently compares memory.current against only
memory.stat:percpu after creating 1000 child cgroups.

Observed failure:
  #./test_kmem
  ok 1 test_kmem_basic
  ok 2 test_kmem_memcg_deletion
  ok 3 test_kmem_proc_kpagecgroup
  ok 4 test_kmem_kernel_stacks
  ok 5 test_kmem_dead_cgroups
  memory.current 11530240
  percpu 8440000
  not ok 6 test_percpu_basic

That assumption is too strict: child cgroup creation also allocates
slab-backed metadata, so memory.current is expected to be larger than
percpu alone. One visible path is:

  cgroup_mkdir()
    cgroup_create()
      cgroup_addrm_file()
        cgroup_add_file()
          __kernfs_create_file()
            __kernfs_new_node()
              kmem_cache_zalloc()

These kernfs allocations are charged as slab and show up in
memory.stat:slab.

Update the check to compare memory.current against (percpu + slab)
within MAX_VMSTAT_ERROR, and print slab/delta in the failure message to
improve diagnostics.

Signed-off-by: Li Wang <liwang@redhat.com>
Cc: Waiman Long <longman@redhat.com>
Cc: Christoph Lameter <cl@linux.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>
Cc: Michal Hocko <mhocko@kernel.org>
Cc: Shakeel Butt <shakeelb@google.com>
Cc: Tejun Heo <tj@kernel.org>
Cc: Vlastimil Babka <vbabka@suse.cz>
---
 tools/testing/selftests/cgroup/test_kmem.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/cgroup/test_kmem.c b/tools/testing/selftests/cgroup/test_kmem.c
index 249d79113067..4b5799698893 100644
--- a/tools/testing/selftests/cgroup/test_kmem.c
+++ b/tools/testing/selftests/cgroup/test_kmem.c
@@ -353,7 +353,7 @@ static int test_percpu_basic(const char *root)
 {
 	int ret = KSFT_FAIL;
 	char *parent, *child;
-	long current, percpu;
+	long current, percpu, slab;
 	int i;
 
 	parent = cg_name(root, "percpu_basic_test");
@@ -379,13 +379,14 @@ static int test_percpu_basic(const char *root)
 
 	current = cg_read_long(parent, "memory.current");
 	percpu = cg_read_key_long(parent, "memory.stat", "percpu ");
+	slab = cg_read_key_long(parent, "memory.stat", "slab ");
 
-	if (current > 0 && percpu > 0 && labs(current - percpu) <
-	    MAX_VMSTAT_ERROR)
+	if (current > 0 && percpu > 0 && slab >= 0 &&
+			labs(current - (percpu + slab)) < MAX_VMSTAT_ERROR)
 		ret = KSFT_PASS;
 	else
-		printf("memory.current %ld\npercpu %ld\n",
-		       current, percpu);
+		printf("memory.current %ld\npercpu %ld\nslab %ld\ndelta %ld\n",
+			current, percpu, slab, current - (percpu + slab));
 
 cleanup_children:
 	for (i = 0; i < 1000; i++) {
-- 
2.53.0

