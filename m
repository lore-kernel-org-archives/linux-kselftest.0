Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC8438C411
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Mar 2026 04:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773288439; cv=none; b=jiJq0r5eKxj/hVo9rdvrZI9c4feyAxD58HMnAw+5IiQABfwA7BPpUSzB2K04zDYZ3YrFMGXrXO8iq11iroxNk8D/MbtDjLXN+EPo2M2DIracXEQhXfIDm38+KKpzGGojL6cBgQfCE6UupWtQuZBvGOsTA5k86H9HZ7WXW13YejE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773288439; c=relaxed/simple;
	bh=RWQN9osrrSrfXBsLl2N0XmsfkGHU0HkShvlQVPmW4+U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MxYpesM0iXJHevwpD4cTkOXym7Vbt050aDRBPX592vfVkQ4BQTlruanVozYV4e34d1pCJdUmtZFV/IK7aj+1sEU1xDzbPhKrzVxO8U46paEK6Nub3q1Hr6q4cezEmoQd+FQRDYOIMtxZo2oCqyXT22b6pNdO0tiVE9qoaucpxBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YDTw9NSp; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YDTw9NSp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773288437;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/+1K6U2HNH5Jf/hAFVeExQ4SDvY1teH+hVqb1jlKGzs=;
	b=YDTw9NSpyljwTnC98JIHVvhy7HpweFP+fOPpam1Zm1GjF8sRS/MHjLuRqRhr722gXjU5w1
	nEUOuIXx0czS15Bry0Tg25PQdo7nNB4xvHICcwD1Lk29VmrmwrRXwvEkeKELdBFY7wEGlN
	AnehvdAI2HSZhBW6JJ2ZcOgydNDvlAQ=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-668-u6ygS8FqOzGplCIXW1Kc_Q-1; Thu,
 12 Mar 2026 00:07:11 -0400
X-MC-Unique: u6ygS8FqOzGplCIXW1Kc_Q-1
X-Mimecast-MFC-AGG-ID: u6ygS8FqOzGplCIXW1Kc_Q_1773288429
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5C883195608A;
	Thu, 12 Mar 2026 04:07:09 +0000 (UTC)
Received: from fedora-laptop-x1.redhat.com (unknown [10.72.112.57])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E2EA219560A6;
	Thu, 12 Mar 2026 04:07:03 +0000 (UTC)
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
Subject: [PATCH v2 6/7] selftests/cgroup: replace hardcoded page size values in test_zswap
Date: Thu, 12 Mar 2026 12:06:26 +0800
Message-ID: <20260312040627.55257-6-liwang@redhat.com>
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

test_zswap uses hardcoded values of 4095 and 4096 throughout as page
stride and page size, which are only correct on systems with a 4K page
size. On architectures with larger pages (e.g., 64K on arm64 or ppc64),
these constants cause memory to be touched at sub-page granularity,
leading to inefficient access patterns and incorrect page count
calculations, which can cause test failures.

Replace all hardcoded 4095 and 4096 values with a global pagesize
variable initialized from sysconf(_SC_PAGESIZE) at startup, and remove
the redundant local sysconf() calls scattered across individual
functions. No functional change on 4K page size systems.

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
 tools/testing/selftests/cgroup/test_zswap.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/tools/testing/selftests/cgroup/test_zswap.c b/tools/testing/selftests/cgroup/test_zswap.c
index 654874fb371b..4eb88930b45f 100644
--- a/tools/testing/selftests/cgroup/test_zswap.c
+++ b/tools/testing/selftests/cgroup/test_zswap.c
@@ -13,6 +13,8 @@
 #include "kselftest.h"
 #include "cgroup_util.h"
 
+static size_t pagesize;
+
 static int read_int(const char *path, size_t *value)
 {
 	FILE *file;
@@ -68,11 +70,11 @@ static int allocate_and_read_bytes(const char *cgroup, void *arg)
 
 	if (!mem)
 		return -1;
-	for (int i = 0; i < size; i += 4095)
+	for (int i = 0; i < size; i += pagesize)
 		mem[i] = 'a';
 
 	/* Go through the allocated memory to (z)swap in and out pages */
-	for (int i = 0; i < size; i += 4095) {
+	for (int i = 0; i < size; i += pagesize) {
 		if (mem[i] != 'a')
 			ret = -1;
 	}
@@ -83,7 +85,6 @@ static int allocate_and_read_bytes(const char *cgroup, void *arg)
 
 static int allocate_bytes(const char *cgroup, void *arg)
 {
-	long pagesize = sysconf(_SC_PAGESIZE);
 	size_t size = (size_t)arg;
 	char *mem = (char *)malloc(size);
 
@@ -263,7 +264,6 @@ static int test_zswapin(const char *root)
  */
 static int attempt_writeback(const char *cgroup, void *arg)
 {
-	long pagesize = sysconf(_SC_PAGESIZE);
 	size_t memsize = MB(4);
 	char buf[pagesize];
 	long zswap_usage;
@@ -416,7 +416,6 @@ static int test_zswap_writeback_disabled(const char *root)
 static int test_no_invasive_cgroup_shrink(const char *root)
 {
 	int ret = KSFT_FAIL;
-	long pagesize = sysconf(_SC_PAGESIZE);
 	size_t control_allocation_size = MB(64);
 	char *control_allocation = NULL, *wb_group = NULL, *control_group = NULL;
 
@@ -479,7 +478,7 @@ static int no_kmem_bypass_child(const char *cgroup, void *arg)
 		values->child_allocated = true;
 		return -1;
 	}
-	for (long i = 0; i < values->target_alloc_bytes; i += 4095)
+	for (long i = 0; i < values->target_alloc_bytes; i += pagesize)
 		((char *)allocation)[i] = 'a';
 	values->child_allocated = true;
 	pause();
@@ -527,7 +526,7 @@ static int test_no_kmem_bypass(const char *root)
 	min_free_kb_low = sys_info.totalram / 500000;
 	values->target_alloc_bytes = (sys_info.totalram - min_free_kb_high * 1000) +
 		sys_info.totalram * 5 / 100;
-	stored_pages_threshold = sys_info.totalram / 5 / 4096;
+	stored_pages_threshold = sys_info.totalram / 5 / pagesize;
 	trigger_allocation_size = sys_info.totalram / 20;
 
 	/* Set up test memcg */
@@ -554,7 +553,7 @@ static int test_no_kmem_bypass(const char *root)
 
 		if (!trigger_allocation)
 			break;
-		for (int i = 0; i < trigger_allocation_size; i += 4095)
+		for (int i = 0; i < trigger_allocation_size; i += pagesize)
 			trigger_allocation[i] = 'b';
 		usleep(100000);
 		free(trigger_allocation);
@@ -565,8 +564,8 @@ static int test_no_kmem_bypass(const char *root)
 		/* If memory was pushed to zswap, verify it belongs to memcg */
 		if (stored_pages > stored_pages_threshold) {
 			int zswapped = cg_read_key_long(test_group, "memory.stat", "zswapped ");
-			int delta = stored_pages * 4096 - zswapped;
-			int result_ok = delta < stored_pages * 4096 / 4;
+			int delta = stored_pages * pagesize - zswapped;
+			int result_ok = delta < stored_pages * pagesize / 4;
 
 			ret = result_ok ? KSFT_PASS : KSFT_FAIL;
 			break;
@@ -622,6 +621,7 @@ int main(int argc, char **argv)
 	char root[PATH_MAX];
 	int i, state;
 
+	pagesize = sysconf(_SC_PAGESIZE);
 	ksft_print_header();
 	ksft_set_plan(ARRAY_SIZE(tests));
 	if (cg_find_unified_root(root, sizeof(root), NULL))
-- 
2.53.0

