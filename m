Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC083B27C7
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Mar 2026 15:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774279096; cv=none; b=ZIzsWwiERSdT4/wfKWNzWlSkm4A9BG9ibX5w+GlgWzFlyQZBgT+lL8lgAhz315wUgRvmN2K3Fi4h/ar0dUF7IlUZtt7JCHUh2njdXdDblWTQK9H/SAi6aW5emF95vUgAaZC6iralP42EWMvejX5ECA6yWZsmumX7ldKFbs0rlms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774279096; c=relaxed/simple;
	bh=4vDG/KF7Zax+WF5xW21b/gwJ/WwkTR1Z8MDeIL+TzQM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mhosjzVcwlpSgg/WomT9+dceNeznOVYiFV5REr1R+ylnx89CP2N7hvnio7wzHDAeEEoyJC/zBwzy2v24WFk2czShywnz7vhGbhIGMJcc8ewdiWaFDoQjLrTFS0g/oVzoV+7lhKR62AdGxmiodQcJhIqTaZ8/ot6RhR0iw/u5Hn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YwqY8xUm; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YwqY8xUm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774279094;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=T9KzDyLK2LRxExt+5uizkYCxde+QVD6hfmZBmFidYm4=;
	b=YwqY8xUmz51Jdde+FwT2pYsCLuu8+eB/NAWK/QUNe9gC0Yz/vPA5wbkdzWgPlrBF7XnmmQ
	FKfxtZdw1kGcBKmoO3FBbaoIeMHsrx/MU/XEhn/t8Pqse/FnOII9UfgXYW1WR36N22R6Jj
	MZjOdQKvahbKM5Cvwzuc8JMm3fxk1Ws=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-635-6rlNJSsIN-m_ZjbbsoPUFg-1; Mon,
 23 Mar 2026 11:18:10 -0400
X-MC-Unique: 6rlNJSsIN-m_ZjbbsoPUFg-1
X-Mimecast-MFC-AGG-ID: 6rlNJSsIN-m_ZjbbsoPUFg_1774279087
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D0E8E1800365;
	Mon, 23 Mar 2026 15:18:06 +0000 (UTC)
Received: from dell-per7425-02.rhts.eng.pek2.redhat.com (dell-per7425-02.rhts.eng.pek2.redhat.com [10.73.116.18])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3808B1954102;
	Mon, 23 Mar 2026 15:17:57 +0000 (UTC)
From: Chunyu Hu <chuhu@redhat.com>
To: akpm@linux-foundation.org,
	david@kernel.org,
	shuah@kernel.org,
	linux-mm@kvack.org,
	ljs@kernel.org
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com,
	vbabka@suse.cz,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	npache@redhat.com,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	lance.yang@linux.dev,
	chuhu@redhat.com
Subject: [PATCH v5 0/6] selftests/mm: skip several tests when thp is not available
Date: Mon, 23 Mar 2026 23:17:47 +0800
Message-ID: <20260323151753.2576137-1-chuhu@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

There are several tests requires transprarent hugepages, when run on thp
disabled kernel such as realtime kernel, there will be false negative.
Mark those tests as skip when thp is not available.

Changes in v5:
  - patch 1, patch 3 updated reviwed-by and acked-by
  - patch 4 adds new patch for robust write_file()

Changes in v4:
  - patch 1 update to use thp_available instead of thp_is_enabled,
    suggested by ai review
  - removed reviewed-by and acked-by

Changes in v3:
  - patch 1 update commit message to show the log snippet with where the
    fail happens, change the 'false positive' to 'false negative'.
    Update reviwed by
  - patch 2 update reviewed-by
  - patch 3 make write_file to void return
  - patch 4 and patch 5 updated reviewed-by/acked-by

Changes in v2:
  - replace 'false postive' with 'false negative' in cover letter
  - patch 1 and patch 2 add reviewed-by/acked-by
  - new patch 3 to add write_file() in vm_util as a common helper
  - patch 4 removed the {} in if block, removed the write_file helper
    rename chunk in v1. Add reviewed-by
  - patch 5 move the exit chunk to the front of ksft_print_headers() as
    suggested by David.  Add review by.

Chunyu Hu (6):
  selftests/mm/guard-regions: skip collapse test when thp not enabled
  selftests/mm: soft-dirty: skip two tests when thp is not available
  selftests/mm: move write_file helper to vm_util
  selftests/mm/vm_util: robust write_file()
  selftests/mm: split_huge_page_test: skip the test when thp is not
    available
  selftests/mm: transhuge_stress: skip the test when thp not available

 tools/testing/selftests/mm/guard-regions.c    |  4 +++
 tools/testing/selftests/mm/soft-dirty.c       |  4 ++-
 .../selftests/mm/split_huge_page_test.c       | 19 +++-------
 tools/testing/selftests/mm/thp_settings.c     | 35 ++-----------------
 tools/testing/selftests/mm/thp_settings.h     |  1 -
 tools/testing/selftests/mm/transhuge-stress.c |  4 +++
 tools/testing/selftests/mm/vm_util.c          | 21 +++++++++++
 tools/testing/selftests/mm/vm_util.h          |  2 ++
 8 files changed, 41 insertions(+), 49 deletions(-)


base-commit: c369299895a591d96745d6492d4888259b004a9e
-- 
2.53.0

