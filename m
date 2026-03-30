Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C6927EFFA
	for <linux-kselftest@vger.kernel.org>; Mon, 30 Mar 2026 15:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774883725; cv=none; b=hGi/BqxF4q/lT3Z79Bo+2hOEFdPlKdicSJ9z4GlClhs3yzS60FCP1Q3aCXyC/Bh3bzFQS37zJZ7iumzA4b8xKx72E/KKl+Zj2mnjYp6e0pcx3zDGL+JDoeTFm7B6mTEvJxlT4cyE/Xqn+ljQw5M+HCNix5zNFQvII+YCS5Q54Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774883725; c=relaxed/simple;
	bh=nnK3icqjfLKPYfJL0jsPSXKJbsLdWAeoPiBxi2oDmM4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q/yFfmMJ4kjiOxmHdCt4TrERA0iBv4RHL7G/15L5B58urqXsq1HwFUTmBhrpGqfRzQLbfwGSlWXubH2CW8WTmSzC4W6MFsNRauAive83O0DVYBpNVcNj4A++6YDH4E58evSka0OWDRYGSeGmOwO8gOaKP/SFt29NzPOZjSQcpCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=boKpE0Oq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="boKpE0Oq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774883722;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xETw+8gpCdkjsgRzeD0pmJ+bgMxkAEpJAG9tRxYLZUM=;
	b=boKpE0OqdM974Dkb7yZzwwjoxV7jRFuySpcJhFLQ/jI3DKsZu1sfr2QAlDFFDsp/ygz81x
	YVqBgnEHbc8IfeJlyNOZVpwmMv7661Zg/ADOpDL3EJY82VxqX8Pr5jwKBjLlvyo3IHD1OC
	zyaaXxABw1gbTkEB6tdC73/xHj+f8zk=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-624-dC5UyRSYMXuiPYXmccF87w-1; Mon,
 30 Mar 2026 11:15:19 -0400
X-MC-Unique: dC5UyRSYMXuiPYXmccF87w-1
X-Mimecast-MFC-AGG-ID: dC5UyRSYMXuiPYXmccF87w_1774883717
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5476E18002E0;
	Mon, 30 Mar 2026 15:15:16 +0000 (UTC)
Received: from dell-per7425-02.rhts.eng.pek2.redhat.com (dell-per7425-02.rhts.eng.pek2.redhat.com [10.73.116.18])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 30B5219560B1;
	Mon, 30 Mar 2026 15:15:07 +0000 (UTC)
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
Subject: [PATCH v7 0/7] selftests/mm: skip several tests when thp is not available
Date: Mon, 30 Mar 2026 23:14:56 +0800
Message-ID: <20260330151503.670415-1-chuhu@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

There are several tests requires transprarent hugepages, when run on thp
disabled kernel such as realtime kernel, there will be false negative.
Mark those tests as skip when thp is not available.

Changes in v7:
  - patch 1 add reviewed-by from Lorenzo
  - patch 4 new patch to make ksft_exit_fail_perror variable length
    arguments
  - patch 5 change to use %.*s to print the buf when error happened
    Limit the buflen arg as 2 minimum. Check the error path (numwritten
	< 0).
    And use the ksft_exit_fail_perror to print the logs in error path

Chagnes in v6:
  - patch 3 add reviewed-by from Lorenzo
  - patch 4 handle the errno before and after close(), suggested by AI

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

Chunyu Hu (7):
  selftests/mm/guard-regions: skip collapse test when thp not enabled
  selftests/mm: soft-dirty: skip two tests when thp is not available
  selftests/mm: move write_file helper to vm_util
  kselftest: make ksft_exit_fail_perror support va args
  selftests/mm/vm_util: robust write_file()
  selftests/mm: split_huge_page_test: skip the test when thp is not
    available
  selftests/mm: transhuge_stress: skip the test when thp not available

 tools/testing/selftests/kselftest.h           | 21 +++++++++--
 tools/testing/selftests/mm/guard-regions.c    |  4 +++
 tools/testing/selftests/mm/soft-dirty.c       |  4 ++-
 .../selftests/mm/split_huge_page_test.c       | 19 +++-------
 tools/testing/selftests/mm/thp_settings.c     | 35 ++-----------------
 tools/testing/selftests/mm/thp_settings.h     |  1 -
 tools/testing/selftests/mm/transhuge-stress.c |  4 +++
 tools/testing/selftests/mm/vm_util.c          | 24 +++++++++++++
 tools/testing/selftests/mm/vm_util.h          |  2 ++
 9 files changed, 62 insertions(+), 52 deletions(-)


base-commit: 7aaa8047eafd0bd628065b15757d9b48c5f9c07d
-- 
2.53.0

