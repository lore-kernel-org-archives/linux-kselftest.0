Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE1139151E
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Mar 2026 09:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773740682; cv=none; b=LbFxp6l+iZpfVbu6WGJaXbwtIo7NJFcuLeM4E8yi5dIO+ixXiClEZJFrgJMMO40CJSMZnRirCwTH6BV6lNxoS8r5xBVmF7A9brOyVZeK91whzO7SAG6Y5u23V0HyYEAw+EQF9tLdlJg9/zGuiG59fqU6CbabGX7gCnL9Oh2UmUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773740682; c=relaxed/simple;
	bh=+7p12v0qLWfDfZl5y6IA7wA+qjZCljlSoPLi26qsFJU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T+iDTGBSvON0D132MbN7TjQyPmKHAr0l97DGikiE4UJgrGHkuSkdsOgcxN62FMX04NrWiLvzrd3/aXVvSmk6/5X7cvbAjxVVXqcVICKmHPPkrl5/Z4qF5a6QFgDUIwm+2EjHIovfDCPipLcFqDoiO2NoRE2Ayk5k60x5MGacnZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dPEyaLHP; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dPEyaLHP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773740680;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=c8GlmATBq0zxhVHV+3sWeuVgZ4UPDFrGCjDb3oe3T+I=;
	b=dPEyaLHP1YT7nxRmYcY1FNFaLwH63NYsDUSYZ6eSjDjbw91mHQztnaBAAeQzpoaupDPSbK
	/zp1+UBnfDCMrFWlSm9iY6EMjP5oFIW0LOBdLhjyQehBwMWH1TVT+ND49E1L5gPlczHa1n
	DaSWXNOrKbzCjnDlBw+3frSGIdQz8U0=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-358-IBhb6YRVOZK4LFIeCThPZQ-1; Tue,
 17 Mar 2026 05:44:35 -0400
X-MC-Unique: IBhb6YRVOZK4LFIeCThPZQ-1
X-Mimecast-MFC-AGG-ID: IBhb6YRVOZK4LFIeCThPZQ_1773740672
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1A622195609E;
	Tue, 17 Mar 2026 09:44:32 +0000 (UTC)
Received: from dell-per7425-02.rhts.eng.pek2.redhat.com (dell-per7425-02.rhts.eng.pek2.redhat.com [10.73.116.18])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9BDD73000223;
	Tue, 17 Mar 2026 09:44:23 +0000 (UTC)
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
Subject: [PATCH v3 0/5] selftests/mm: skip several tests when thp is not available
Date: Tue, 17 Mar 2026 17:44:14 +0800
Message-ID: <20260317094419.1429259-1-chuhu@redhat.com>
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


base-commit: f338e77383789c0cae23ca3d48adcc5e9e137e3c
-- 
2.53.0

