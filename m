Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5784B3921E0
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Mar 2026 03:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774495638; cv=none; b=EdczsURqZ3NBHY5BZntpoQ2mHhaII4c2w071qIAs9q44fFVxe6jjFffgLto+yh8bLz66ocv1xJi8nIuNUlOZEFmUUDE11KWlBvOJ3zb12+r5BA6vWmQQ+pcINxIEE8eg9WotSYHm3e2EqBwOUHqnbh0qMczPz6cERviyxxPWJjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774495638; c=relaxed/simple;
	bh=WkF2h0IFgyFGH89heHwiOZQUs9YGiMKE4czvMttmDMo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=D2zcvGhICFuKIBQtbNZrS06OBPV3xf1T1qZ6Br4OvugdKDUKC+PpCVfr1cd0a9z2eVjb0IlaHUkYThOjQF3vdmOZuCEd4KZb1v4K+GrHUf8xc+GkOcJzBj3xCADNhzAwjVHVQnq5kPWZ8YXoYJmZtb+oiTfARrabhNNXwgXEKEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SL6o6WWu; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SL6o6WWu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774495636;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=oMwBuaz6Iu14n6z5uHUzbEMEARV0sTaqUzLTjM5uB7w=;
	b=SL6o6WWuFBvcfVOJ4zb5ypdKmNwiKeLk1qx2GUec5Rf9QlXhtKJqm96UgrzmdL/6YiDa2y
	gH/YMyaK8dYYoUUykcn09HFoEryvcd2NzmyVZyy7sXhp5MD725mvt5DWRUQu8+lpX0x4tK
	yJ+8seRHn+czl+QAfgFRBIm2b4TWJC0=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-179-ntm5MVGbMGCvlJZ59BK7TQ-1; Wed,
 25 Mar 2026 23:27:12 -0400
X-MC-Unique: ntm5MVGbMGCvlJZ59BK7TQ-1
X-Mimecast-MFC-AGG-ID: ntm5MVGbMGCvlJZ59BK7TQ_1774495630
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 095051944F05;
	Thu, 26 Mar 2026 03:27:10 +0000 (UTC)
Received: from fedora-laptop-x1.redhat.com (unknown [10.72.112.83])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 21DCB1955D84;
	Thu, 26 Mar 2026 03:27:02 +0000 (UTC)
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
Subject: [PATCH v5 0/8] selftests/cgroup: improve zswap tests robustness and support large page sizes
Date: Thu, 26 Mar 2026 11:26:50 +0800
Message-ID: <20260326032658.96819-1-liwang@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

This patchset aims to fix various spurious failures and improve the overall
robustness of the cgroup zswap selftests.

The primary motivation is to make the tests compatible with architectures
that use non-4K page sizes (such as 64K on ppc64le and arm64). Currently,
the tests rely heavily on hardcoded 4K page sizes and fixed memory limits.
On 64K page size systems, these hardcoded values lead to sub-page granularity
accesses, incorrect page count calculations, and insufficient memory pressure
to trigger zswap writeback, ultimately causing the tests to fail.

Additionally, this series addresses OOM kills occurring in test_swapin_nozswap
by dynamically scaling memory limits, and prevents spurious test failures
when zswap is built into the kernel but globally disabled.

Changes in v5:
  Patch 1/8: Defined PATH_ZSWAP and PATH_ZSWAP_ENABLED macros.
  Patch 4/8: Merge Waiman's work into this patch (use page_size).
  Patch 5/8: Change pagesize by the global page_size.
  Patch 6/8: Swap data patterns: use getrandom() for wb_group and simple
             memset for zw_group to fix the reversed allocation logic.
  Patch 7/8: Setting zswap.max to zswap_usage/4 to increase writeback pressure.
  Patch 8/8: New added. Just add loops for read zswpwb more times.

Test all passed on:
  x86_64(4k), aarch64(4K, 64K), ppc64le(64K).

Li Wang (8):
  selftests/cgroup: skip test_zswap if zswap is globally disabled
  selftests/cgroup: avoid OOM in test_swapin_nozswap
  selftests/cgroup: use runtime page size for zswpin check
  selftests/cgroup: rename PAGE_SIZE to BUF_SIZE in cgroup_util
  selftests/cgroup: replace hardcoded page size values in test_zswap
  selftest/cgroup: fix zswap test_no_invasive_cgroup_shrink on large
    pagesize system
  selftest/cgroup: fix zswap attempt_writeback() on 64K pagesize system
  selftests/cgroup: test_zswap: wait for asynchronous writeback

 .../selftests/cgroup/lib/cgroup_util.c        |  18 +-
 .../cgroup/lib/include/cgroup_util.h          |   4 +-
 tools/testing/selftests/cgroup/test_core.c    |   2 +-
 tools/testing/selftests/cgroup/test_freezer.c |   2 +-
 .../selftests/cgroup/test_memcontrol.c        |  19 +-
 tools/testing/selftests/cgroup/test_zswap.c   | 174 +++++++++++++-----
 6 files changed, 148 insertions(+), 71 deletions(-)

-- 
2.53.0

