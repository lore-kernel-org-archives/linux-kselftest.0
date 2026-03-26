Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8A03932E7
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Mar 2026 03:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774495657; cv=none; b=uFtxE9wl5Cg6YhAeqiNP9Q8Y4EMddlajE+vPFpq4cS/rPdQfNShRV8mgDBEONmQzobH5vUQ1R/AwmWunJcZlPpTWSQoysX1LggTJKxaHGkCwI8GT9gYtYX8K/7EVxf2cCSIPihwsPhLgBflBT8PEDihcvDoq/kmR5IVEr4uw9uY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774495657; c=relaxed/simple;
	bh=etMNLgsAqgXT7GNsz5mVXZFt1m1s+ZnbfehPyo/QgrQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N7oUJJWtB2n88pZWM3Fy1I+Ogjc82pM42GlpnZ/dzZtnlPXAT2/QBm+YtZzH1Yo4V0zR66/X7DqNdgBTizUXIULgsPAZCDiylLjNjKva9V8dJ9NsIzCzRGdIa/Oi6mjF3y5XvmxdRgx+P1oZFqsq29NdJaw9XqzXLQtQAsz9sbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=H3kntU6R; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="H3kntU6R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774495655;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mpe5+6BEENtzobjSR9FLGbgq/dfpUrP+sg7IFVwkji8=;
	b=H3kntU6RpFwoai9pr5OBIBA09tF/0vpU7UBcshse6Sr/rlnWMxwQUhv0eA3z7jkkoQDXX5
	hUhqxOuxVACzgJG2uPQ078FkXUeCZm2It4w7d8eC/awZvCtkkdtbI/zadCnsIgJH9lszyZ
	ctcX5/HTxn1XoqZG8LPPS8CD0QDUdTc=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-606-f-2A5cPvMGCNGCUaiYzyXA-1; Wed,
 25 Mar 2026 23:27:33 -0400
X-MC-Unique: f-2A5cPvMGCNGCUaiYzyXA-1
X-Mimecast-MFC-AGG-ID: f-2A5cPvMGCNGCUaiYzyXA_1774495652
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D4AAD195608D;
	Thu, 26 Mar 2026 03:27:31 +0000 (UTC)
Received: from fedora-laptop-x1.redhat.com (unknown [10.72.112.83])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B61DD1955D84;
	Thu, 26 Mar 2026 03:27:25 +0000 (UTC)
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
	linux-mm@kvack.org
Subject: [PATCH v5 3/8] selftests/cgroup: use runtime page size for zswpin check
Date: Thu, 26 Mar 2026 11:26:53 +0800
Message-ID: <20260326032658.96819-4-liwang@redhat.com>
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
Reviewed-by: Yosry Ahmed <yosry@kernel.org>
---
 tools/testing/selftests/cgroup/test_zswap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/cgroup/test_zswap.c b/tools/testing/selftests/cgroup/test_zswap.c
index ed257d464bd6..516da5d52bfd 100644
--- a/tools/testing/selftests/cgroup/test_zswap.c
+++ b/tools/testing/selftests/cgroup/test_zswap.c
@@ -243,7 +243,7 @@ static int test_zswapin(const char *root)
 		goto out;
 	}
 
-	if (zswpin < MB(24) / PAGE_SIZE) {
+	if (zswpin < MB(24) / sysconf(_SC_PAGESIZE)) {
 		ksft_print_msg("at least 24MB should be brought back from zswap\n");
 		goto out;
 	}
-- 
2.53.0

