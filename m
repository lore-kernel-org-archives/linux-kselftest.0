Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 231DC37CD45
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Mar 2026 04:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773288406; cv=none; b=SiOGJT2orX0Ri3Ng5M+XzR+FDA9fDc6Jk4jx+yPHFKi+JmeFd5FqHSnBHQkTF6Wm03RHKk0/QgzHNk588xf9Lxf0ED5KxOIFG3QMlM715fIBqfkwwfr7WAW7PPqvpKkrfgP6eBbzaH5QkHtGjZjeTP1sp9BFDa45NmBct5F96tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773288406; c=relaxed/simple;
	bh=Jf8QbqFcVZrsDPyL9Gk3l+Kmdu8AaB02h8ThweA8Rqk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DLsKHq6FTjOEIb1/eIi1FGK9XAiQYkWwnkOqNyJRQif6/n4A7hNY1e+6WF9YHSTZxni4fM0H77kmnInb/3Ijcs9lp4XVEXIqYitRf2ZPEF6g92g3TfGbHTo+jYGs9SP7s8Rpr+WdKUn4xmu1bxgvp7w4YDbT46rLrXYwqbQgnBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cXPqQHSd; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cXPqQHSd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773288404;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UQeckx+5U+uTndqi/lDzELfEhZ+lHpEnmQokNC1yUIw=;
	b=cXPqQHSdhclxEy9O8XFIofBK2/L+lw7uECt9GEGWvox11wRehEkhmLKp3YjeDujQ1/fMNa
	h/2aYok+GsAxAO1BOJ3qasXKeaNGheAyhxgJoE5VqxwqaP5p4QLJf/v/nfl1X1LgECAt7p
	niF6ysal1r+MM0QgBaISBPdbe+ejnMc=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-60-cUvabXB_PziHMOXoc7NHzQ-1; Thu,
 12 Mar 2026 00:06:40 -0400
X-MC-Unique: cUvabXB_PziHMOXoc7NHzQ-1
X-Mimecast-MFC-AGG-ID: cUvabXB_PziHMOXoc7NHzQ_1773288398
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AC56A1956095;
	Thu, 12 Mar 2026 04:06:37 +0000 (UTC)
Received: from fedora-laptop-x1.redhat.com (unknown [10.72.112.57])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 91F5D19560B7;
	Thu, 12 Mar 2026 04:06:31 +0000 (UTC)
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
Subject: [PATCH v2 1/7] selftests/cgroup: skip test_zswap if zswap is globally disabled
Date: Thu, 12 Mar 2026 12:06:21 +0800
Message-ID: <20260312040627.55257-1-liwang@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Currently, test_zswap only checks for the presence of zswap via
/sys/module/zswap, but it does not account for the global runtime
state in /sys/module/zswap/parameters/enabled.

If zswap is configured in the kernel but globally disabled at runtime,
the zswap cgroup tests will run in an invalid environment and fail
spuriously.

Fix this by reading the 'enabled' parameter and gracefully skipping
the test when zswap is disabled. A helpful hint is also added to the
skip message to show users how to enable it.

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
    v1 --> v2:
        * remove enable/disable_zswap functions
        * skip the test if zswap is not enabled
        * reporting fail when zswap_enabled return -1

 tools/testing/selftests/cgroup/test_zswap.c | 28 +++++++++++++++++----
 1 file changed, 23 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/cgroup/test_zswap.c b/tools/testing/selftests/cgroup/test_zswap.c
index 64ebc3f3f203..ec64daaa2f5a 100644
--- a/tools/testing/selftests/cgroup/test_zswap.c
+++ b/tools/testing/selftests/cgroup/test_zswap.c
@@ -589,23 +589,41 @@ struct zswap_test {
 };
 #undef T
 
-static bool zswap_configured(void)
+static int zswap_enabled(void)
 {
-	return access("/sys/module/zswap", F_OK) == 0;
+	char buf[16];
+	ssize_t n;
+
+	if (access("/sys/module/zswap", F_OK))
+		ksft_exit_skip("zswap isn't configured\n");
+
+	n = read_text("/sys/module/zswap/parameters/enabled", buf, sizeof(buf));
+	if (n <= 0)
+		return -1;
+
+	if (buf[0] == 'Y')
+		return 1;
+	else if (buf[0] == 'N')
+		return 0;
+
+	return -1;
 }
 
 int main(int argc, char **argv)
 {
 	char root[PATH_MAX];
-	int i;
+	int i, state;
 
 	ksft_print_header();
 	ksft_set_plan(ARRAY_SIZE(tests));
 	if (cg_find_unified_root(root, sizeof(root), NULL))
 		ksft_exit_skip("cgroup v2 isn't mounted\n");
 
-	if (!zswap_configured())
-		ksft_exit_skip("zswap isn't configured\n");
+	state = zswap_enabled();
+	if (state == 0)
+		ksft_exit_skip("zswap is disabled (hint: echo 1 > /sys/module/zswap/parameters/enabled)\n");
+	else if (state < 0)
+		ksft_exit_fail_msg("Failed to read zswap state\n");
 
 	/*
 	 * Check that memory controller is available:
-- 
2.53.0

