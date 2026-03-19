Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A21519CD1D
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Mar 2026 16:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773936439; cv=none; b=QHLYjyFRojuI0iA9id8t3XueG2H9rAKvD474/hC7oQLYp2wnIgpNuFOUI2LTLrStHzTHF44gLrgh6ZHyLFxYLxCtGQ64+I/u2LEYdO8Q1E0xqSsX7LryMWf0jBLIQIl6wyzWX9MpSpOWMuFgBfltFVI8dvrTp6Y2wyDE3hQOyD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773936439; c=relaxed/simple;
	bh=i0Orm/H18IqXCWNFkzGqMH/13y5R65h7giLeMa8EG9E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cj2Mc+i7LhN5lVlz0rcoM+26XJ7vL/lKNZr/CUyeyQ3//VouGQvKcGLbR4CBet405hcOzMSwdusBMrfLoHFdcF1yQ+SFkObPfeHfZQx4VIR5Jo433pz7NtsR2DUv9X8Wdi2VWF3/oyMTQG5o9zO0wf8h3pfyLnk5I49HnYBO6YU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=K5Lk3q47; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="K5Lk3q47"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773936436;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0LrqNwPukbVTRMqo7ScJ39KrbqrXvptUSs0I1FXiR5A=;
	b=K5Lk3q47ELJlr3r1DyzupDNSazMKeKW2T9hRVtgCR5XVTDd9QZwvjzUVwOEOkbgjVKaqLu
	S6xvu6MWzEsmPeVNlPLmoXrUDYpXT2bvZxefkfjRl5MqKx0cSHZL8Fpz1QVKJESoydYVT4
	VJtS0q9GTBIYY9Hd9G5GlM7ZyZwgGec=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-77-D8vHMPzCNlqHQmQOB7Q3KQ-1; Thu,
 19 Mar 2026 12:07:13 -0400
X-MC-Unique: D8vHMPzCNlqHQmQOB7Q3KQ-1
X-Mimecast-MFC-AGG-ID: D8vHMPzCNlqHQmQOB7Q3KQ_1773936430
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6BBA1195608E;
	Thu, 19 Mar 2026 16:07:09 +0000 (UTC)
Received: from dell-per7425-02.rhts.eng.pek2.redhat.com (dell-per7425-02.rhts.eng.pek2.redhat.com [10.73.116.18])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3172D30002DF;
	Thu, 19 Mar 2026 16:07:00 +0000 (UTC)
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
Subject: [PATCH v4 0/5] selftests/mm: skip several tests when thp is not available
Date: Fri, 20 Mar 2026 00:06:51 +0800
Message-ID: <20260319160656.1480279-1-chuhu@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

There are several tests requires transprarent hugepages, when run on thp
disabled kernel such as realtime kernel, there will be false negative.
Mark those tests as skip when thp is not available.

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

Chunyu Hu (5):
  selftests/mm/guard-regions: skip collapse test when thp not enabled
  selftests/mm: soft-dirty: skip two tests when thp is not available
  selftests/mm: move write_file helper to vm_util
  selftests/mm: split_huge_page_test: skip the test when thp is not
    available
  selftests/mm: transhuge_stress: skip the test when thp not available

 tools/testing/selftests/mm/guard-regions.c    |  4 ++++
 tools/testing/selftests/mm/soft-dirty.c       |  4 +++-
 .../selftests/mm/split_huge_page_test.c       | 19 ++++-----------
 tools/testing/selftests/mm/thp_settings.c     | 24 +------------------
 tools/testing/selftests/mm/thp_settings.h     |  1 -
 tools/testing/selftests/mm/transhuge-stress.c |  4 ++++
 tools/testing/selftests/mm/vm_util.c          | 16 +++++++++++++
 tools/testing/selftests/mm/vm_util.h          |  2 ++
 8 files changed, 34 insertions(+), 40 deletions(-)


base-commit: 8a30aeb0d1b4e4aaf7f7bae72f20f2ae75385ccb
-- 
2.53.0

