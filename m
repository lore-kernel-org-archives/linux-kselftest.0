Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F197393DF1
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Mar 2026 03:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774495687; cv=none; b=A4Biuvi6Kowz03Ek3qdVfJcSFDXFuA+XYyqKuvLVz4QRhjQxB3PtiWIcNlnnubZ73gYVpc8T8HOgCggy6Tl0n4p/a6ALfa/yJF7zFWf/eY9kKgSczxm+tNVTSGhpNnakqUCyJQFzYhoYwkMIfPa0Wdds2suNN8BPL1In+KF7xlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774495687; c=relaxed/simple;
	bh=o/w7TQliWDhKNWU6CNP5i3AA/k45gK0jKqDtWaqSPOs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=awOrqADC74XiCPFKOktV88nnu+4iHdkYOTlgzKfmXrZOwSIlo2kqxueIWpIYbWO0YksOPWoFHyUQ/Oe6aCfHLGbhx8Qi8gSGZyvJDeZdjng5d08mjDrl9hEmpzZUkl66PvWg8i61LIiI02j0oIwgZK+up+lNkuxQG7ql3ieCrHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cGw5IOnZ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cGw5IOnZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774495685;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5FEF4PcMxcimzj0nghaejrMWC+mQHsYsFdwp2v61C34=;
	b=cGw5IOnZ/tERwKcwRJezEssl54EXzMFAYjclUKBc1NOk0a804U85r/RVGF5I4auooIeFH+
	CQnKelSLHFuG6ZE5YeVQvpR9EPCBGCUuGSaoQnr0O8cUNcDjM8Q01p6zJ2bYt2Im4Ux/ue
	jl4qCfa8x5GMKGLQTTuzLPVKTsVJiwI=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-318-Zk5XMdgqMyqNHJrO1O5hKg-1; Wed,
 25 Mar 2026 23:28:00 -0400
X-MC-Unique: Zk5XMdgqMyqNHJrO1O5hKg-1
X-Mimecast-MFC-AGG-ID: Zk5XMdgqMyqNHJrO1O5hKg_1774495679
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CF6DD1944EB8;
	Thu, 26 Mar 2026 03:27:58 +0000 (UTC)
Received: from fedora-laptop-x1.redhat.com (unknown [10.72.112.83])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 160451955D84;
	Thu, 26 Mar 2026 03:27:52 +0000 (UTC)
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
Subject: [PATCH v5 7/8] selftest/cgroup: fix zswap attempt_writeback() on 64K pagesize system
Date: Thu, 26 Mar 2026 11:26:57 +0800
Message-ID: <20260326032658.96819-8-liwang@redhat.com>
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

In attempt_writeback(), a memsize of 4M only covers 64 pages on 64K
page size systems. When memory.reclaim is called, the kernel prefers
reclaiming clean file pages (binary, libc, linker, etc.) over swapping
anonymous pages. With only 64 pages of anonymous memory, the reclaim
target can be largely or entirely satisfied by dropping file pages,
resulting in very few or zero anonymous pages being pushed into zswap.

This causes zswap_usage to be extremely small or zero, making
zswap_usage/2 insufficient to create meaningful writeback pressure.
The test then fails because no writeback is triggered.

On 4K page size systems this is not an issue because 4M covers 1024
pages, and file pages are a small fraction of the reclaim target.

Fix this by:
- Always allocating 1024 pages regardless of page size. This ensures
  enough anonymous pages to reliably populate zswap and trigger
  writeback, while keeping the original 4M allocation on 4K systems.
- Setting zswap.max to zswap_usage/4 instead of zswap_usage/2 to
  create stronger writeback pressure, ensuring reclaim reliably
  triggers writeback even on large page size systems.

=== Error Log ===
  # uname -rm
  6.12.0-211.el10.ppc64le ppc64le

  # getconf PAGESIZE
  65536

  # ./test_zswap
  TAP version 13
  1..7
  ok 1 test_zswap_usage
  ok 2 test_swapin_nozswap
  ok 3 test_zswapin
  not ok 4 test_zswap_writeback_enabled
  ...

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
    v5:
    	- Setting zswap.max to zswap_usage/4 to create stronger writeback pressure.
    v3-4:
    	- No changes.
    v2:
    	- use pagesize * 1024 which clearly shows the page numbers.

 tools/testing/selftests/cgroup/test_zswap.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/cgroup/test_zswap.c b/tools/testing/selftests/cgroup/test_zswap.c
index 72082e5d4725..e96e316f7c47 100644
--- a/tools/testing/selftests/cgroup/test_zswap.c
+++ b/tools/testing/selftests/cgroup/test_zswap.c
@@ -273,7 +273,7 @@ static int test_zswapin(const char *root)
  */
 static int attempt_writeback(const char *cgroup, void *arg)
 {
-	size_t memsize = MB(4);
+	size_t memsize = page_size * 1024;
 	char buf[page_size];
 	long zswap_usage;
 	bool wb_enabled = *(bool *) arg;
@@ -311,7 +311,7 @@ static int attempt_writeback(const char *cgroup, void *arg)
 		}
 	}
 
-	if (cg_write_numeric(cgroup, "memory.zswap.max", zswap_usage/2))
+	if (cg_write_numeric(cgroup, "memory.zswap.max", zswap_usage/4))
 		goto out;
 
 	/*
-- 
2.53.0

