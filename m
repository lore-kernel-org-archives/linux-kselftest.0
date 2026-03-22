Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2FD36C9C2
	for <linux-kselftest@vger.kernel.org>; Sun, 22 Mar 2026 06:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774159881; cv=none; b=VGrHzT5VPsDahalgMwN8rY22+zW1xQdEzPDxgq/a+FRii4n9ca93QURHue8eiTxeiLSkm0uAhB82d8TJYt4CXg64HX6hbwB+jJrEBLvTh4pdruAXNzlYiXl124bpUTQAISvgvC2M/6GnaVt6UayfcFC1vziCWAMJT2k2fCF4Grg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774159881; c=relaxed/simple;
	bh=I6wzHpWI1G2dHKnH1D2apcwr+taBmOI381SYbEpm3vY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EBw745QaT5hIyUIgxwADn6axqJOQLdf9vhoaQIxH1uEWsVV70Y/bu4Fjw6X+8/FH+XhdYTjzF0e8reGQupz1YkvpT1ido5Nd4Z964S1jV0qN08XV39hp+utl/Xt4XPkzRSe41qJH+EwXKm4JZ1e9vQLxY58ZvWWqAVXDNUY1WpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QLY23DLO; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QLY23DLO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774159878;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fSV+/tqM70wKgndqvLBa1N8bfrFGZwvNXk6Fa/4Lros=;
	b=QLY23DLOXuqbLxH4s1ARbo3+OJOHoDH5VUByEzO9TxE8TxfBiehUS08ILS+xwAWtAtHJH2
	F0hB5X+EAdFANMNmJj5w42SnL2IV3j5Q93axrbLiBlOo3In/VI7ZwliABjIyB55rfC09MD
	dBWOVJ4vz/+bgpVoDaMxdmYKDbd/hkM=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-402-wBx07rGgPOyTWL5happl-Q-1; Sun,
 22 Mar 2026 02:11:15 -0400
X-MC-Unique: wBx07rGgPOyTWL5happl-Q-1
X-Mimecast-MFC-AGG-ID: wBx07rGgPOyTWL5happl-Q_1774159873
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id F2FFB1800464;
	Sun, 22 Mar 2026 06:11:12 +0000 (UTC)
Received: from fedora-laptop-x1.redhat.com (unknown [10.72.112.34])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3E2F91955F21;
	Sun, 22 Mar 2026 06:11:05 +0000 (UTC)
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
Subject: [PATCH v4 3/7] selftests/cgroup: use runtime page size for zswpin check
Date: Sun, 22 Mar 2026 14:10:34 +0800
Message-ID: <20260322061038.156146-4-liwang@redhat.com>
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
index 4481db4bc0f6..4982e8c4759c 100644
--- a/tools/testing/selftests/cgroup/test_zswap.c
+++ b/tools/testing/selftests/cgroup/test_zswap.c
@@ -240,7 +240,7 @@ static int test_zswapin(const char *root)
 		goto out;
 	}
 
-	if (zswpin < MB(24) / PAGE_SIZE) {
+	if (zswpin < MB(24) / sysconf(_SC_PAGESIZE)) {
 		ksft_print_msg("at least 24MB should be brought back from zswap\n");
 		goto out;
 	}
-- 
2.53.0

