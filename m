Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05E630DECC
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Mar 2026 07:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772781541; cv=none; b=VbmpCbzcwNLvQfI0wtJt13SCIpFfz5NejPBXRvUaM9+MfHZnDBry+cRA8Ntf2B/SpyCKxbyuS33RJ0Xx3my9PPCJX8M4au+kF3t549rIZN5ayX0ysyJ2FP1t/ujWuzs2iGZWhBX4VSjSTmcDCMLqWhalW5nQ8l9ktFW5rRgHK+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772781541; c=relaxed/simple;
	bh=TBHdKQ/niOxIqPRFEcUsyKlXisMrw6StRNMquNwcOZE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kioPBV6m81rJpkejCtvvWvm36dmp0vDV7ZW1DXR9ki1WtXohtFM95HdsjKF1rV+0Futj9alaJf8egGqeWDrhFmt6u2N2J6MsLI+BM4PiXN20ML7WKbf9NR1L6fUt4nJ1kJJgmCXdfZpu3XTZjaSJuTJcNFDLKbKi8KWvf0l632Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=f41VgX73; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="f41VgX73"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772781538;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GcU4+Q+7Y72wYY/zljENgWyK36V142Rr3SPlRsYuZgo=;
	b=f41VgX73AmwxXjcZ2Wgo1PBCA5/IEpqX1LFwB3ZmiU5Hqg7eiFFNJbzbgMTVTU2GTI7pd5
	B+w7LIl0IgoKS+keV7aw3+CtdMklPcAK/cViZAZckbtdYLiVJ2HPZ3PhY9zAPeKD1axSee
	A1cw7f62t4sZbCidAdu0OQbMdQkxOYY=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-606-3OljcDr9NLCHn2fXGMl8kg-1; Fri,
 06 Mar 2026 02:18:55 -0500
X-MC-Unique: 3OljcDr9NLCHn2fXGMl8kg-1
X-Mimecast-MFC-AGG-ID: 3OljcDr9NLCHn2fXGMl8kg_1772781534
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A985719560B7;
	Fri,  6 Mar 2026 07:18:53 +0000 (UTC)
Received: from fedora-laptop-x1.redhat.com (unknown [10.72.112.139])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8D3651800361;
	Fri,  6 Mar 2026 07:18:48 +0000 (UTC)
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
Subject: [PATCH 1/2] selftests/cgroup: Fix hardcoded page size in test_percpu_basic
Date: Fri,  6 Mar 2026 15:18:42 +0800
Message-ID: <20260306071843.149147-1-liwang@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

MAX_VMSTAT_ERROR uses a hardcoded page size of 4096, which assumes
4K pages. This causes test_percpu_basic to fail on systems where
the kernel is configured with a larger page size, such as aarch64
systems using 16K or 64K pages, where the maximum permissible
discrepancy between memory.current and percpu charges is
proportionally larger.

Replace the hardcoded 4096 with sysconf(_SC_PAGESIZE) to correctly
derive the page size at runtime regardless of the underlying
architecture or kernel configuration.

Signed-off-by: Li Wang <liwang@redhat.com>
Cc: Waiman Long <longman@redhat.com>
Cc: Christoph Lameter <cl@linux.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>
Cc: Michal Hocko <mhocko@kernel.org>
Cc: Shakeel Butt <shakeelb@google.com>
Cc: Tejun Heo <tj@kernel.org>
Cc: Vlastimil Babka <vbabka@suse.cz>
---
 tools/testing/selftests/cgroup/test_kmem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/cgroup/test_kmem.c b/tools/testing/selftests/cgroup/test_kmem.c
index eeabd34bf083..249d79113067 100644
--- a/tools/testing/selftests/cgroup/test_kmem.c
+++ b/tools/testing/selftests/cgroup/test_kmem.c
@@ -24,7 +24,7 @@
  * the maximum discrepancy between charge and vmstat entries is number
  * of cpus multiplied by 64 pages.
  */
-#define MAX_VMSTAT_ERROR (4096 * 64 * get_nprocs())
+#define MAX_VMSTAT_ERROR (sysconf(_SC_PAGESIZE) * 64 * get_nprocs())
 
 #define KMEM_DEAD_WAIT_RETRIES        80
 
-- 
2.53.0

