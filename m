Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2DB73BD627
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Mar 2026 11:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773314796; cv=none; b=kOHNRn3Z1OUFxM6McvmPT5eX0k9pkAvROhg+fo03ksFeHivijcKuQYRN3wy16wTgfoKqzpDgc+pY3k8eUB9q2nQNPcenxnn0PjXWrtPSHMVw9qT370i4JRHcTrJ4tku+HteSd6QhrB/P6mm+BDv3Bhnf8ORgS2RoW9/JWX15EzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773314796; c=relaxed/simple;
	bh=V8fj0sc6abKx+on9+KBeIpqTm2TbysOAyLd4Ou6LPVA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JDyj9957NP9s5raLeDb2G96zSyAmLxu/ZoMt9WamjFiFQg5haHylxr6vEyMAUP3LLTpClzbf1SqozHgOqwBkpti9MyLDlCiwOtbN1JfLR795+F/Q3ZsGGwF/vCLFhm+sQtnf3ZwKW0XeTNCG2l6TA15cqB5ff1EZrBQyP/YsWdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=clF3VYbx; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="clF3VYbx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773314793;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JLOLmlCltARAzo4Ra4aoARZoUrqPZTtsYu32OxPUdU8=;
	b=clF3VYbxKEV20WQ7ozihuL5VmsbdXs/zeAmF3h+A4iKF/Uv9qgak0ptW7KgpZi1ja/8Gzn
	OGyzL1bsWqSOtdabx+MPZnQQ+kKGa1Quhq5vNzRXRzvKWPx6yZ/1fY5/or6UdOmH6Ea6x0
	fpb+wiTaOrpcT7QZZqm4846u6Wox5bA=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-167-5ICvTF1sOEq5bTnqKo9IpQ-1; Thu,
 12 Mar 2026 07:26:30 -0400
X-MC-Unique: 5ICvTF1sOEq5bTnqKo9IpQ-1
X-Mimecast-MFC-AGG-ID: 5ICvTF1sOEq5bTnqKo9IpQ_1773314788
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3A48F195609D;
	Thu, 12 Mar 2026 11:26:27 +0000 (UTC)
Received: from dell-per7425-02.rhts.eng.pek2.redhat.com (dell-per7425-02.rhts.eng.pek2.redhat.com [10.73.116.18])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E5BDE18002A6;
	Thu, 12 Mar 2026 11:26:17 +0000 (UTC)
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
Subject: [PATCH 0/4] selftests/mm: skip several tests when thp is not available
Date: Thu, 12 Mar 2026 19:26:07 +0800
Message-ID: <20260312112612.633138-1-chuhu@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

There are several tests requires transprarent hugepages, when run on thp
disabled kernel such as realtime kernel, there will be false positve.
Mark those tests as skip when thp is not available.

Chunye Hu (4):
  selftests/mm/guard-regions: skip collapse test when thp not enabled
  selftests/mm: soft-dirty: skip two tests when thp not available
  selftests/mm: split_huge_page_test: skip the test when thp not
    available
  selftests/mm: transhuge_stress: skip the test when thp not available

 tools/testing/selftests/mm/guard-regions.c        | 4 ++++
 tools/testing/selftests/mm/soft-dirty.c           | 4 +++-
 tools/testing/selftests/mm/split_huge_page_test.c | 9 +++++++--
 tools/testing/selftests/mm/transhuge-stress.c     | 4 ++++
 4 files changed, 18 insertions(+), 3 deletions(-)


base-commit: 80234b5ab240f52fa45d201e899e207b9265ef91
-- 
2.53.0

