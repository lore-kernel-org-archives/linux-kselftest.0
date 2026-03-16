Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E9535949
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Mar 2026 04:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773636238; cv=none; b=Ydzapff060iXTPs4zEUAd86qVh+AgDtP6fvjjq+/M8K0fOFwb+JjdAYYiytTOuD+ozEhNT4hw4zwrdx9oZuoHIEiJctOtNvG9SEtVaum36VUYn8z6qmxeeyVyOk0vPAJRli5ojtNtFtnOcK+nUZNvuJV7B1Gp0q+CQhZfAy0EYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773636238; c=relaxed/simple;
	bh=izIKJHPRs2ESxUTX0o/qg2fWu4+iKeXPdtAXK5eJ8Ys=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U4jEgef+qaBvycJaPL0q51z9IgojqwXyJYpaCXPAJO3iwVT0ChdaQ54aAqW9x1UvsXLVsVvXLrDawbmjhYYrTZ51UowVK4zRfkxrj7RqehxTAtFDNHxV75qmCLTAof1r8Qd1mgcs18pWVNUQTWU13HmUf3hdNcwoW3i9OCs25uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KjhqunOS; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KjhqunOS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773636236;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5bromE0Lb/4AXZwonjlJ3gcGLoMNIPlz6OjkLdJzlFc=;
	b=KjhqunOSEN12v0Io/HRYYT81AqrdnFQ73N2ny3scCe5TEDmNQi7/psJSoX4zkQ1lAHvp9L
	0umW1kkby6H+T8wJ3cYo27w0jNJVKmjdC0ZHz7iIMvyzUxlDRgN55AOi45H38h0GNOKs3H
	Pur5VEvrAmsNH7oaHKI+71mqHK+NbUU=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-172-8F_wa5rhNq6fKYmb1esTYw-1; Mon,
 16 Mar 2026 00:43:52 -0400
X-MC-Unique: 8F_wa5rhNq6fKYmb1esTYw-1
X-Mimecast-MFC-AGG-ID: 8F_wa5rhNq6fKYmb1esTYw_1773636230
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A43D9195608D;
	Mon, 16 Mar 2026 04:43:49 +0000 (UTC)
Received: from dell-per7425-02.rhts.eng.pek2.redhat.com (dell-per7425-02.rhts.eng.pek2.redhat.com [10.73.116.18])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0F05019560B7;
	Mon, 16 Mar 2026 04:43:40 +0000 (UTC)
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
Subject: [PATCH v2 0/5] selftests/mm: skip several tests when thp is not available
Date: Mon, 16 Mar 2026 12:43:30 +0800
Message-ID: <20260316044335.1390608-1-chuhu@redhat.com>
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

