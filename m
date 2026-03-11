Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3223D8916
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Mar 2026 11:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773227158; cv=none; b=NWS8RG2t/epe7gZrHQSQe+3Wt0qnoZzdS2fSeEn1TbKDyimf9oJBShfpfD2mKcXd40/H57m6cKsrKdhO7aBuzF/UMms4d0E4mCHkAgngeiSqh9t9AdFXloqLqv28MSGN+PQfT0W2hWUhypzXEVjJJsnyXCEStVlKxVKFIJQmsXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773227158; c=relaxed/simple;
	bh=o++pCAxQhc5GxOOnQ6CYO8dKHVcEtOSUZhtz8khw1AI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bGPixzcU2lQ3q6iTBZL8Y45ayhFwu532RFITX7grg51r6gMHUNGBP2iT/VZgfUAzRYl6G66izHnfgRPQG6Bnhb2zydg9ZxSPPdy21S6G4nsqwYyFgy98W4pNM9wF0kA9CT6xNnedNZJ3jOBd+9/REbPgE3uYEFvQfv1N/psrYkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BbNEyzld; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BbNEyzld"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773227154;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IFBu2wkJNnG0sYJfPKqQkZPctO4vrSnQWTcY52542zI=;
	b=BbNEyzld0oi0mSBvfYM+0BBTxr/zdi2AUeDvt1PhAokgwcuIn7J979quTki6fP/6qKf86H
	hL8gCQU+Wsk0fI+wBH1uSyYp17xGGPtWC33INDIeDxZ75YDi66d1kkgiWqBWP+dVtXWT2K
	3ks4d1pTgIBvXV3eYKQEjHk5bT4O+UQ=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-554-gn_N2bK8OgGHLkT3Hv6rvw-1; Wed,
 11 Mar 2026 07:05:49 -0400
X-MC-Unique: gn_N2bK8OgGHLkT3Hv6rvw-1
X-Mimecast-MFC-AGG-ID: gn_N2bK8OgGHLkT3Hv6rvw_1773227147
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5DF8A18005B9;
	Wed, 11 Mar 2026 11:05:47 +0000 (UTC)
Received: from fedora-laptop-x1.redhat.com (unknown [10.72.112.99])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D81C71956095;
	Wed, 11 Mar 2026 11:05:41 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org
Cc: Johannes Weiner <hannes@cmpxchg.org>,
	Michal Hocko <mhocko@kernel.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Muchun Song <muchun.song@linux.dev>,
	Nhat Pham <nphamcs@gmail.com>,
	Tejun Heo <tj@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Yosry Ahmed <yosryahmed@google.com>
Subject: [PATCH 3/5] selftests/cgroup: use runtime page size for zswpin check
Date: Wed, 11 Mar 2026 19:05:21 +0800
Message-ID: <20260311110523.26624-3-liwang@redhat.com>
In-Reply-To: <20260311110523.26624-1-liwang@redhat.com>
References: <20260311110523.26624-1-liwang@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

test_zswapin compares memory.stat:zswpin (counted in pages) against a
byte threshold converted with PAGE_SIZE. In cgroup selftests, PAGE_SIZE
is hardcoded to 4096, which makes the conversion wrong on systems with
non-4K base pages (e.g. 64K).

As a result, the test requires too many pages to pass and fails
spuriously even when zswap is working.

Use sysconf(_SC_PAGESIZE) for the zswpin threshold conversion so the
check matches the actual system page size.

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
 tools/testing/selftests/cgroup/test_zswap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/cgroup/test_zswap.c b/tools/testing/selftests/cgroup/test_zswap.c
index ccfa6d42a3a3..af21fa4f5b7b 100644
--- a/tools/testing/selftests/cgroup/test_zswap.c
+++ b/tools/testing/selftests/cgroup/test_zswap.c
@@ -235,7 +235,7 @@ static int test_zswapin(const char *root)
 		goto out;
 	}
 
-	if (zswpin < MB(24) / PAGE_SIZE) {
+	if (zswpin < MB(24) / sysconf(_SC_PAGESIZE)) {
 		ksft_print_msg("at least 24MB should be brought back from zswap\n");
 		goto out;
 	}
-- 
2.53.0

