Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE882BDC0E
	for <linux-kselftest@vger.kernel.org>; Sun, 22 Mar 2026 06:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774159860; cv=none; b=PyILM+bMasCrLRDmXFO6kgXVNK5CXI/iwXj9fcK0lhMIvWt61PPigk6zzhUzF4XgdM7hQ7g5FhGs5li31acUwxTVj4ccN8YshD00YMc06SyHmYqxtk7HPD4i969gK0Yz3+6hzmcWspM5EY530mAh7gRlNaHgyKeK/fMkwWoBh8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774159860; c=relaxed/simple;
	bh=5wUxuld6iWSD1xd8TXKoDsmcJblZd+dUHg6WMJSeO/A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=e8TJNYj+JmATcuda3Nsq0SWCQTCroozaodNIzIn8zdQBVK+E8dT9WCQJ070V7XSTDhFyBgYQ59oI7DYmLXlrsR4wmQaGO47QxUZyM25nDwtWumfmFgi786bwSQ5HioAbBHlx/9UewpODKItxU0F2QBT9rktlRTd5tQs6oTY57uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bcB9Frvv; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bcB9Frvv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774159856;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mmx1uB1Uw/n7cvvAu9S/82zt328oIJIEVRjtJB16IPI=;
	b=bcB9FrvvErT1N1cmI5dfKSucIp/cwPS3cups0HZ6vNqf4U+8wBMx2sbZkMoONk89aB4Ho7
	GK+ycSOWmjLvWUUDbQY8OGM7/CK1jdU8X2GhFAgwvlgtrBxQBw5c9yjJRq7S+u1Kkm+BAX
	PK5/femP4wwS+wz7DWQVq4q1wUEQ9bw=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-637-ZOPxiDD-MBaUoeesfdrK9Q-1; Sun,
 22 Mar 2026 02:10:53 -0400
X-MC-Unique: ZOPxiDD-MBaUoeesfdrK9Q-1
X-Mimecast-MFC-AGG-ID: ZOPxiDD-MBaUoeesfdrK9Q_1774159851
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6AFEA180044D;
	Sun, 22 Mar 2026 06:10:50 +0000 (UTC)
Received: from fedora-laptop-x1.redhat.com (unknown [10.72.112.34])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 01C161955F21;
	Sun, 22 Mar 2026 06:10:42 +0000 (UTC)
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
Subject: [PATCH v4 0/7] selftests/cgroup: improve zswap tests robustness and support large page sizes
Date: Sun, 22 Mar 2026 14:10:31 +0800
Message-ID: <20260322061038.156146-1-liwang@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

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

Changes in v4:
  Patch 2: Use %zu format specifier when printing pagesize.
  Patch 4: Use page_size instead of BUF_SIZE in test_memcontrol.c.
  Patch 6: Print the expected swap amount in KB instead of MB.

Tested on v6.12:
  across x86_64, aarch64, ppc64le archs.

Li Wang (7):
  selftests/cgroup: skip test_zswap if zswap is globally disabled
  selftests/cgroup: avoid OOM in test_swapin_nozswap
  selftests/cgroup: use runtime page size for zswpin check
  selftests/cgroup: rename PAGE_SIZE to BUF_SIZE in cgroup_util
  selftests/cgroup: replace hardcoded page size values in test_zswap
  selftest/cgroup: fix zswap test_no_invasive_cgroup_shrink on large
    pagesize system
  selftest/cgroup: fix zswap attempt_writeback() on 64K pagesize system

 .../selftests/cgroup/lib/cgroup_util.c        | 18 ++---
 .../cgroup/lib/include/cgroup_util.h          |  4 +-
 tools/testing/selftests/cgroup/test_core.c    |  2 +-
 tools/testing/selftests/cgroup/test_freezer.c |  2 +-
 .../selftests/cgroup/test_memcontrol.c        | 15 ++--
 tools/testing/selftests/cgroup/test_zswap.c   | 79 +++++++++++++------
 6 files changed, 74 insertions(+), 46 deletions(-)

-- 
2.53.0

