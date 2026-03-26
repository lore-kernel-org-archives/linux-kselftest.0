Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9533921E0
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Mar 2026 03:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774495697; cv=none; b=easrtxW6xVARGrLvYGBKiA9BzMk7xGWzg6okfPPKv3S4wnSu1D7opJ8zw5z4N8ighJdw511Y/jNnRNyqj1UtF11A2gwM/iptDqFm1Bg43EHUb1ayPNyP1HDLWqZc5DPD3ZYEsnZlmX7JbkkKWuBgEAjzTPK3kamR+I9fHCSm0GI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774495697; c=relaxed/simple;
	bh=Db9FpGjMEsnfOujo+Rx3taOhK7m8n2Zf3BPQRSbWgPE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s+MMxXJFMLzbiK+QAYaoWyshIE+myFwQjWM6AGqkHsOmj9IJINwGNouxLSnzgffB5GKI63YXJzHxQOP2euzHHaqVDP4HFrNVO3K6VVOGsBQYddUtDXRIn0x2SaRgydfg1aF0QE4K91kqHSoURkrWqbYQzRTadxz83WFLiBMaEvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RhXcB9NE; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RhXcB9NE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774495693;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z7qTVQy4P3P+tWAwnSkI8eaROMeV/uij3L4ybuXlnco=;
	b=RhXcB9NEEOFahXwNrC+BhowL2bgISWiEXa6J4G1p5DlvwujkKZu59a9bLdHGn8fUeucTB1
	fmGa1e7RgGI87nUVOLnQgi2Xwl43eSdu3dUsio4V7l+FhcUdhcIb6/BD6BQemDJx3iftTz
	MYSQ2Xf8lS9CZ+eRgxA6i6aQleGMiL8=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-390-g6BzXI2gPqOlcblx0mevOA-1; Wed,
 25 Mar 2026 23:28:08 -0400
X-MC-Unique: g6BzXI2gPqOlcblx0mevOA-1
X-Mimecast-MFC-AGG-ID: g6BzXI2gPqOlcblx0mevOA_1774495685
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C8BD819560A7;
	Thu, 26 Mar 2026 03:28:05 +0000 (UTC)
Received: from fedora-laptop-x1.redhat.com (unknown [10.72.112.83])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7C0731955D84;
	Thu, 26 Mar 2026 03:27:59 +0000 (UTC)
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
Subject: [PATCH v5 8/8] selftests/cgroup: test_zswap: wait for asynchronous writeback
Date: Thu, 26 Mar 2026 11:26:58 +0800
Message-ID: <20260326032658.96819-9-liwang@redhat.com>
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

zswap writeback is asynchronous, but test_zswap.c checks writeback
counters immediately after reclaim/trigger paths. On some platforms
(e.g. ppc64le), this can race with background writeback and cause
spurious failures even when behavior is correct.

Add wait_for_writeback() to poll get_cg_wb_count() with a bounded
timeout, and use it in:

  test_zswap_writeback_one() when writeback is expected
  test_no_invasive_cgroup_shrink() for the wb_group check

This keeps the original before/after assertion style while making the
tests robust against writeback completion latency.

No test behavior change, selftest stability improvement only.

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
 tools/testing/selftests/cgroup/test_zswap.c | 28 +++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/cgroup/test_zswap.c b/tools/testing/selftests/cgroup/test_zswap.c
index e96e316f7c47..e7d5dbc1ef7f 100644
--- a/tools/testing/selftests/cgroup/test_zswap.c
+++ b/tools/testing/selftests/cgroup/test_zswap.c
@@ -118,6 +118,27 @@ static char *setup_test_group_1M(const char *root, const char *name)
 	return NULL;
 }
 
+/*
+ * Writeback is asynchronous; poll until at least one writeback has
+ * been recorded for @cg, or until @timeout_ms has elapsed.
+ */
+static long wait_for_writeback(const char *cg, int timeout_ms)
+{
+	int elapsed, count;
+	for (elapsed = 0; elapsed < timeout_ms; elapsed += 100) {
+		count = get_cg_wb_count(cg);
+
+		if (count < 0)
+			return -1;
+		if (count > 0)
+			return count;
+
+		usleep(100000);
+	}
+
+	return 0;
+}
+
 /*
  * Sanity test to check that pages are written into zswap.
  */
@@ -343,7 +364,10 @@ static int test_zswap_writeback_one(const char *cgroup, bool wb)
 		return -1;
 
 	/* Verify that zswap writeback occurred only if writeback was enabled */
-	zswpwb_after = get_cg_wb_count(cgroup);
+	if (wb)
+		zswpwb_after = wait_for_writeback(cgroup, 5000);
+	else
+		zswpwb_after = get_cg_wb_count(cgroup);
 	if (zswpwb_after < 0)
 		return -1;
 
@@ -473,7 +497,7 @@ static int test_no_invasive_cgroup_shrink(const char *root)
 	}
 
 	/* Verify that only zswapped memory from gwb_group has been written back */
-	if (get_cg_wb_count(wb_group) > 0 && get_cg_wb_count(zw_group) == 0)
+	if (wait_for_writeback(wb_group, 5000) > 0 && get_cg_wb_count(zw_group) == 0)
 		ret = KSFT_PASS;
 out:
 	cg_enter_current(root);
-- 
2.53.0

