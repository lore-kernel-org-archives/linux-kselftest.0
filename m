Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3396231716D
	for <linux-kselftest@vger.kernel.org>; Sun, 22 Mar 2026 06:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774159874; cv=none; b=cBD17BTjGPatUUB4h7Sj89j9gGCBrYeSnqLmxvhC/TfHf9WImTiKR588dotwP5CZt+Gpe5zr5DYDIpagVtcgOrna36SNj0TbD+sh8J3YMYeFCG1z4fNHvYtqVRrbN//A5ZnYpxpiWTrQ/gGX6p4DwFSNg2JZBxKBKBlM/ffhAck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774159874; c=relaxed/simple;
	bh=gCX1tknRC73NgxegM2bsYZ0u8r5goUAkekKjF0RFcf8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k3sDbpq373ADOAA+Eu2xPrEfFvFkDdVfgL1EcCOC8egGqBZvYEx500+FERavbRG9uWYnfzc9TQJ0qDgD6GDEsqdSq8+0ZOqLkL5EaVV9VUB/VcyYzFzwADAtZ/sIgwDziqAnIRUGXiACMX7vagHNJgLDxFKYy4BVzowvHubpa6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PWtDdWeY; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PWtDdWeY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774159872;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UUxVZ5QRYGf3wyruBKfbexWqyo+rt+qp+DxvL12j5gc=;
	b=PWtDdWeYS6mib0D6g1AqIi3pMvhQZUoNM3ila95ZOgZz3MXORHl90+W/FYM1n2o86ryS6d
	yIK0x38rBR6TPs2UAvcgZxc59rvCIS003ewU2RsgDqPl+C0jgV5KFPzVi/cxYrYBR1CAp1
	mAnV/TpGHlulY7ycKMDWVg5PdZKoYkA=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-491-Tto4YA5VOyiBhYcZzKet7w-1; Sun,
 22 Mar 2026 02:11:07 -0400
X-MC-Unique: Tto4YA5VOyiBhYcZzKet7w-1
X-Mimecast-MFC-AGG-ID: Tto4YA5VOyiBhYcZzKet7w_1774159865
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 82DF1195608B;
	Sun, 22 Mar 2026 06:11:05 +0000 (UTC)
Received: from fedora-laptop-x1.redhat.com (unknown [10.72.112.34])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 40AE31955F21;
	Sun, 22 Mar 2026 06:10:58 +0000 (UTC)
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
Subject: [PATCH v4 2/7] selftests/cgroup: avoid OOM in test_swapin_nozswap
Date: Sun, 22 Mar 2026 14:10:33 +0800
Message-ID: <20260322061038.156146-3-liwang@redhat.com>
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

test_swapin_nozswap can hit OOM before reaching its assertions on some
setups. The test currently sets memory.max=8M and then allocates/reads
32M with memory.zswap.max=0, which may over-constrain reclaim and kill
the workload process.

Replace hardcoded sizes with PAGE_SIZE-based values:
  - control_allocation_size = PAGE_SIZE * 512
  - memory.max = control_allocation_size * 3 / 4
  - minimum expected swap = control_allocation_size / 4

This keeps the test pressure model intact (allocate/read beyond memory.max to
force swap-in/out) while making it more robust across different environments.

The test intent is unchanged: confirm that swapping occurs while zswap remains
unused when memory.zswap.max=0.

=== Error Logs ===

  # ./test_zswap
  TAP version 13
  1..7
  ok 1 test_zswap_usage
  not ok 2 test_swapin_nozswap
  ...

  # dmesg
  [271641.879153] test_zswap invoked oom-killer: gfp_mask=0xcc0(GFP_KERNEL), order=0, oom_score_adj=0
  [271641.879168] CPU: 1 UID: 0 PID: 177372 Comm: test_zswap Kdump: loaded Not tainted 6.12.0-211.el10.ppc64le #1 VOLUNTARY
  [271641.879171] Hardware name: IBM,9009-41A POWER9 (architected) 0x4e0202 0xf000005 of:IBM,FW940.02 (UL940_041) hv:phyp pSeries
  [271641.879173] Call Trace:
  [271641.879174] [c00000037540f730] [c00000000127ec44] dump_stack_lvl+0x88/0xc4 (unreliable)
  [271641.879184] [c00000037540f760] [c0000000005cc594] dump_header+0x5c/0x1e4
  [271641.879188] [c00000037540f7e0] [c0000000005cb464] oom_kill_process+0x324/0x3b0
  [271641.879192] [c00000037540f860] [c0000000005cbe48] out_of_memory+0x118/0x420
  [271641.879196] [c00000037540f8f0] [c00000000070d8ec] mem_cgroup_out_of_memory+0x18c/0x1b0
  [271641.879200] [c00000037540f990] [c000000000713888] try_charge_memcg+0x598/0x890
  [271641.879204] [c00000037540fa70] [c000000000713dbc] charge_memcg+0x5c/0x110
  [271641.879207] [c00000037540faa0] [c0000000007159f8] __mem_cgroup_charge+0x48/0x120
  [271641.879211] [c00000037540fae0] [c000000000641914] alloc_anon_folio+0x2b4/0x5a0
  [271641.879215] [c00000037540fb60] [c000000000641d58] do_anonymous_page+0x158/0x6b0
  [271641.879218] [c00000037540fbd0] [c000000000642f8c] __handle_mm_fault+0x4bc/0x910
  [271641.879221] [c00000037540fcf0] [c000000000643500] handle_mm_fault+0x120/0x3c0
  [271641.879224] [c00000037540fd40] [c00000000014bba0] ___do_page_fault+0x1c0/0x980
  [271641.879228] [c00000037540fdf0] [c00000000014c44c] hash__do_page_fault+0x2c/0xc0
  [271641.879232] [c00000037540fe20] [c0000000001565d8] do_hash_fault+0x128/0x1d0
  [271641.879236] [c00000037540fe50] [c000000000008be0] data_access_common_virt+0x210/0x220
  [271641.879548] Tasks state (memory values in pages):
  ...
  [271641.879550] [  pid  ]   uid  tgid total_vm      rss rss_anon rss_file rss_shmem pgtables_bytes swapents oom_score_adj name
  [271641.879555] [ 177372]     0 177372      571        0        0        0         0    51200       96             0 test_zswap
  [271641.879562] oom-kill:constraint=CONSTRAINT_MEMCG,nodemask=(null),cpuset=/,mems_allowed=0,oom_memcg=/no_zswap_test,task_memcg=/no_zswap_test,task=test_zswap,pid=177372,uid=0
  [271641.879578] Memory cgroup out of memory: Killed process 177372 (test_zswap) total-vm:36544kB, anon-rss:0kB, file-rss:0kB, shmem-rss:0kB, UID:0 pgtables:50kB oom_score_adj:0

Signed-off-by: Li Wang <liwang@redhat.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>
Cc: Michal Hocko <mhocko@kernel.org>
Cc: Michal Koutný <mkoutny@suse.com>
Cc: Muchun Song <muchun.song@linux.dev>
Cc: Nhat Pham <nphamcs@gmail.com>
Cc: Tejun Heo <tj@kernel.org>
Cc: Roman Gushchin <roman.gushchin@linux.dev>
Cc: Shakeel Butt <shakeel.butt@linux.dev>
Acked-by: Yosry Ahmed <yosry@kernel.org>
---

Notes:
    v4:
    	-  print the expected swap amount in KB but not MB.
    v3:
    	- Replace fixed 8M/32M sizing with PAGE_SIZE-based sizing in
    	  test_swapin_nozswap.
    	- Set memory.max to 3/4 of workload size to reduce OOM risk while still
    	  forcing reclaim/swap activity.
    	- Derive minimum swap expectation from workload size (1/4) instead of a
    	  fixed 8M threshold.
    v2:
    	- No change.

 tools/testing/selftests/cgroup/test_zswap.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/cgroup/test_zswap.c b/tools/testing/selftests/cgroup/test_zswap.c
index e69d845d3592..4481db4bc0f6 100644
--- a/tools/testing/selftests/cgroup/test_zswap.c
+++ b/tools/testing/selftests/cgroup/test_zswap.c
@@ -160,21 +160,25 @@ static int test_zswap_usage(const char *root)
 static int test_swapin_nozswap(const char *root)
 {
 	int ret = KSFT_FAIL;
-	char *test_group;
-	long swap_peak, zswpout;
+	char *test_group, mem_max_buf[32];
+	long swap_peak, zswpout, min_swap;
+	size_t control_allocation_size = sysconf(_SC_PAGESIZE) * 512;
+
+	min_swap = control_allocation_size / 4;
+	snprintf(mem_max_buf, sizeof(mem_max_buf), "%zu", control_allocation_size * 3/4);
 
 	test_group = cg_name(root, "no_zswap_test");
 	if (!test_group)
 		goto out;
 	if (cg_create(test_group))
 		goto out;
-	if (cg_write(test_group, "memory.max", "8M"))
+	if (cg_write(test_group, "memory.max", mem_max_buf))
 		goto out;
 	if (cg_write(test_group, "memory.zswap.max", "0"))
 		goto out;
 
 	/* Allocate and read more than memory.max to trigger swapin */
-	if (cg_run(test_group, allocate_and_read_bytes, (void *)MB(32)))
+	if (cg_run(test_group, allocate_and_read_bytes, (void *)control_allocation_size))
 		goto out;
 
 	/* Verify that pages are swapped out, but no zswap happened */
@@ -184,8 +188,9 @@ static int test_swapin_nozswap(const char *root)
 		goto out;
 	}
 
-	if (swap_peak < MB(24)) {
-		ksft_print_msg("at least 24MB of memory should be swapped out\n");
+	if (swap_peak < min_swap) {
+		ksft_print_msg("at least %ldKB of memory should be swapped out\n",
+				min_swap / 1024);
 		goto out;
 	}
 
-- 
2.53.0

