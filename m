Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6509042050
	for <linux-kselftest@vger.kernel.org>; Thu,  2 Apr 2026 01:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775094365; cv=none; b=oMGC2rpF+S8ehqW62i71YxsNAsoRQ595FIPUoaqSG15u4zr1BJKwCJftmT23lr2bQlqPVybtylIF6jaeUwAuABQIN1Tzyi0dY/Ac7rICGkzanJtWnvJ11XuWr5tmigCcdanjslibXvkTnzrXBV5XIOIgX3Iqd8O1AXMP0EWQ72k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775094365; c=relaxed/simple;
	bh=aIljz3iDem8laqTXoqkOojdOf3dfgXEschAibluuNeE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f6Cw/ONlP+3TfNYg+Rs74MPN8/qPKvmQ3aG9FjY0ggYhlUKPjThUcpNPUm5PiGvvSqZwsT9sbWGllKgruhrnYLt6lUh0Rwpy8Oow14hzybkiLbMYXQMcGU3pXjrbR6qSY81X3+qb2QBzaNrWJLNTI8/Ar3Hydmvk0C7Jhv8RlnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MSr1qBFU; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MSr1qBFU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775094363;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=l0Q6r9HPJ8aJ6iX7bMAjVKnNhKfShN4g1Nz0tMndmbo=;
	b=MSr1qBFUZ2rFaxkN7wZ4zfnsbz7JK04kC4tdER9Y31AJTdQTIZ94CamW+h8hfL+97KusuS
	GNSA4wvW3k3qEOLn+kdU0rjgoUpzOhb0gTsJr7mu0fP8jFVORGU06iIWRbNcXrPNvcTykm
	4klvBGEjX+z0CH0gvCNaTeR/az7UgBM=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-288-qsMjOyxJMNy_LXPiefNIHg-1; Wed,
 01 Apr 2026 21:45:59 -0400
X-MC-Unique: qsMjOyxJMNy_LXPiefNIHg-1
X-Mimecast-MFC-AGG-ID: qsMjOyxJMNy_LXPiefNIHg_1775094356
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2A3171955F18;
	Thu,  2 Apr 2026 01:45:56 +0000 (UTC)
Received: from dell-per7425-02.rhts.eng.pek2.redhat.com (dell-per7425-02.rhts.eng.pek2.redhat.com [10.73.116.18])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7614C19560AB;
	Thu,  2 Apr 2026 01:45:47 +0000 (UTC)
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
Subject: [PATCH v8 0/6] selftests/mm: skip several tests when thp is not available
Date: Thu,  2 Apr 2026 09:45:37 +0800
Message-ID: <20260402014543.1671131-1-chuhu@redhat.com>
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

Changes in v8:
  - removed the patch 4 in v7 (make ksft_exit_fail_perror variable length)
    as no clean way to do it at the moment and ksft_exit_fail_msg could
    do by printing an extra strerror param.
  - patch 4 use ksft_exit_fail_msg instead of ksft_exit_fail_perror  

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
 tools/testing/selftests/mm/vm_util.c          | 24 +++++++++++++
 tools/testing/selftests/mm/vm_util.h          |  2 ++
 8 files changed, 44 insertions(+), 49 deletions(-)


base-commit: 9147566d801602c9e7fc7f85e989735735bf38ba
-- 
2.53.0

