Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7BE390CB7
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Mar 2026 11:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773315649; cv=none; b=RBjVANsFEsttNnNh0r4ixtvNZy2Vav9d3xvQLwbOBuFdWG/0NKYvYmWF4hvxWsM1VRblN9DH+C+1C9y2Cd+90iJBBAV4PxGIIiT/NFpxxwz3fSCOrdokMB3EvAYlZAiyfiO251vAylqAnkbmuEmNqOjfpPQjNGyGHKLfMoP+nCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773315649; c=relaxed/simple;
	bh=V8fj0sc6abKx+on9+KBeIpqTm2TbysOAyLd4Ou6LPVA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=feixNF8p0riMS8hmHVirxi7/c/29uIq1spOD94ZLdDF+qlfW9RT/fLv4fdkVwXt6Tm/bpc1VamZPtiiADbzb4vsS4KOPv4nb20T2AqwA1DjaWuAzcXdt2NX5RcMFFgEayYCczMypGV2Csc88aH7YfD1lVqVOc/uMA4MWDJytT2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BkoauVUZ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BkoauVUZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773315647;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JLOLmlCltARAzo4Ra4aoARZoUrqPZTtsYu32OxPUdU8=;
	b=BkoauVUZcf9IwT9iV1ngLnqF3HUuhZcw3bqIV3cNTpXQVLx1wtmqKCYto0STEOA9kZMduP
	xQjaIF6JAm57JQdLA5MzzV+qhXJH3XjzfBBS+wY1X8m903Q1neGdHeePwU+QJDH2vJx+gt
	s+qyWkKT8qWDZ2AGFNvOOwMij275jGA=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-125--EGgtS22OoajaihVTkruSw-1; Thu,
 12 Mar 2026 07:40:44 -0400
X-MC-Unique: -EGgtS22OoajaihVTkruSw-1
X-Mimecast-MFC-AGG-ID: -EGgtS22OoajaihVTkruSw_1773315641
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5AA981953994;
	Thu, 12 Mar 2026 11:40:41 +0000 (UTC)
Received: from dell-per7425-02.rhts.eng.pek2.redhat.com (dell-per7425-02.rhts.eng.pek2.redhat.com [10.73.116.18])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 57CE5180058B;
	Thu, 12 Mar 2026 11:40:31 +0000 (UTC)
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
Date: Thu, 12 Mar 2026 19:40:23 +0800
Message-ID: <20260312114027.634559-1-chuhu@redhat.com>
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

