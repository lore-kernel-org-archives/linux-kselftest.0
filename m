Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838C831716D
	for <linux-kselftest@vger.kernel.org>; Sun, 22 Mar 2026 06:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774159869; cv=none; b=XMrXds/a6jxDe3LBDfZfrONHPO0vCuImlmBW1ZzKWYkpddIhvE0G7yeuhOXT7+j0ICgckNYUYVC16Ts44ZdCbC5s6V6NJQody+qy1uwjMK6dcF4En343jUKb/xD14+7QLiXwf3EAV0m/55EJ7/x9FPf8OiMYYEbVS7JMkNmqLpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774159869; c=relaxed/simple;
	bh=bTtTmHzOaXBPfSb93wDC7JBVrSsV7C9Odj5YuC8P8WU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dOQa9xjdij0YAfkF6ul9lCq9/b1tAC6D+LkKGYtlqnTM87k+va7R+DHLgwxPFpZ5k8/c2Nw3daOw8gH2tQPfK1I64qGaT5DPN+MLq/xySIVb7wy0nIXEaYtXe6vwvb5NTPT36L+qwUTvIGgi0CNMOLrks4qiGqe/PeKyp/K8i6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VQyaVJMN; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VQyaVJMN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774159866;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vNGT0NUnZrlZkAGbpAJMOumDHRLMeHSt0H7KNvOLnUM=;
	b=VQyaVJMN9xFMKDgUiazFH4qYr07gaMGAqvt78uVz2t4Ejdk8BNtkJqeI5NMCLl7pLNoYbM
	bF6FXb770xvqDech8cx9fKID4TtEDBe/AVtZ4uKe9NeEYz1DYOL/+uoULwzrPErk/ldEfP
	iwolj+zOAYz3CO6VkkNK7iHaq/+V7f4=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-190-FE9ADUPzNtOwM6-JUgdTbg-1; Sun,
 22 Mar 2026 02:11:01 -0400
X-MC-Unique: FE9ADUPzNtOwM6-JUgdTbg-1
X-Mimecast-MFC-AGG-ID: FE9ADUPzNtOwM6-JUgdTbg_1774159859
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8BAD61800365;
	Sun, 22 Mar 2026 06:10:58 +0000 (UTC)
Received: from fedora-laptop-x1.redhat.com (unknown [10.72.112.34])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 223171955F2E;
	Sun, 22 Mar 2026 06:10:50 +0000 (UTC)
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
Subject: [PATCH v4 1/7] selftests/cgroup: skip test_zswap if zswap is globally disabled
Date: Sun, 22 Mar 2026 14:10:32 +0800
Message-ID: <20260322061038.156146-2-liwang@redhat.com>
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

test_zswap currently only checks whether zswap is present by testing
/sys/module/zswap. This misses the runtime global state exposed in
/sys/module/zswap/parameters/enabled.

When zswap is built/loaded but globally disabled, the zswap cgroup
selftests run in an invalid environment and may fail spuriously.

Check the runtime enabled state before running the tests:
  - skip if zswap is not configured,
  - fail if the enabled knob cannot be read,
  - skip if zswap is globally disabled.

Also print a hint in the skip message on how to enable zswap.

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
Acked-by: Yosry Ahmed <yosry@kernel.org>
---

Notes:
    v4:
         - No changes.
    
    v3:
         - Replace tri-state zswap_enabled() with check_zswap_enabled() for clearer flow.
         - Move skip/fail decisions into the helper instead of branching in main().
         - Make read failure reporting more explicit by naming
           `/sys/module/zswap/parameters/enabled`.
         - Keep skip hint for enabling zswap:
           `echo 1 > /sys/module/zswap/parameters/enabled`.
    
     v2:
         - remove enable/disable_zswap functions
         - skip the test if zswap is not enabled
         - reporting fail when zswap_enabled return -1

 tools/testing/selftests/cgroup/test_zswap.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/cgroup/test_zswap.c b/tools/testing/selftests/cgroup/test_zswap.c
index 64ebc3f3f203..e69d845d3592 100644
--- a/tools/testing/selftests/cgroup/test_zswap.c
+++ b/tools/testing/selftests/cgroup/test_zswap.c
@@ -589,9 +589,21 @@ struct zswap_test {
 };
 #undef T
 
-static bool zswap_configured(void)
+static void check_zswap_enabled(void)
 {
-	return access("/sys/module/zswap", F_OK) == 0;
+	char value[2];
+
+	if (access("/sys/module/zswap", F_OK))
+		ksft_exit_skip("zswap isn't configured\n");
+
+	if (read_text("/sys/module/zswap/parameters/enabled", value,
+						sizeof(value)) <= 0)
+		ksft_exit_fail_msg("Failed to read "
+				"/sys/module/zswap/parameters/enabled\n");
+
+	if (value[0] == 'N')
+		ksft_exit_skip("zswap is disabled (hint: echo 1 > "
+				"/sys/module/zswap/parameters/enabled)\n");
 }
 
 int main(int argc, char **argv)
@@ -604,8 +616,7 @@ int main(int argc, char **argv)
 	if (cg_find_unified_root(root, sizeof(root), NULL))
 		ksft_exit_skip("cgroup v2 isn't mounted\n");
 
-	if (!zswap_configured())
-		ksft_exit_skip("zswap isn't configured\n");
+	check_zswap_enabled();
 
 	/*
 	 * Check that memory controller is available:
-- 
2.53.0

