Received: from canpmsgout05.his.huawei.com (canpmsgout05.his.huawei.com [113.46.200.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C598F3C198B;
	Tue, 20 Jan 2026 12:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768911718; cv=none; b=RtQjBejfkfbALFJzadljQ/BB3DZBx04OhpCUWgnNzKS1L3Qh7ZuxWUTwFGxqJLmv6PRfwRSRMzZpVs7rkQm7LxW/QNpzluvaIN0lcWvKvVFLoaI0rmZh/doZZE/sBM1hlfVJ/AXB0OMQrzPJmR24eL2aVw4Lls0VxfezAQUTIt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768911718; c=relaxed/simple;
	bh=KHkqfi2LLNjT5MJ4XBfQdp1q4H/Hh8l8o9Eja6JQKRU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=aMQrlWAImuPJYGlo2S1DjuFXqqd8Ve1DwRJsrSpQmxQTDWCTTeusQqBH5yqOg7Y8qWh/B9eivqiRka6znyzj6eRRL5cktfPIgE60UkNNPCK7r7cF/ZDWcOsIGwnQgFr+B07ojTTkS39o/qguUxB2xsu/rTe7kBy4e9YP1yQ8Kf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=3XmvqWeA; arc=none smtp.client-ip=113.46.200.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="3XmvqWeA"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=ud/gUMa9CdKda8/RelC40VBUu1L/MVr4lL+WkTDpNn8=;
	b=3XmvqWeAh76YYsqyWMBN2CcHhk//lpm6fHNmIsWeexX8SCXu60R/YOG3ytCfjZYxccwswI4WK
	BhYhTCFJ4RM5rQiMeo7/Qa6vXnu7Bi5VluGM3HC/H/91iXZHLylSUFJbLHfEYuADehu4MYgRVSa
	pWZcLGjZ4s80a3jbPbn7g9U=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4dwRDK5Hgpz12LGH;
	Tue, 20 Jan 2026 20:17:53 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 995F340569;
	Tue, 20 Jan 2026 20:21:52 +0800 (CST)
Received: from kwepemq500010.china.huawei.com (7.202.194.235) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 20 Jan 2026 20:21:52 +0800
Received: from huawei.com (10.173.125.37) by kwepemq500010.china.huawei.com
 (7.202.194.235) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 20 Jan
 2026 20:21:51 +0800
From: Miaohe Lin <linmiaohe@huawei.com>
To: <akpm@linux-foundation.org>, <shuah@kernel.org>
CC: <david@kernel.org>, <lorenzo.stoakes@oracle.com>,
	<Liam.Howlett@oracle.com>, <vbabka@suse.cz>, <rppt@kernel.org>,
	<surenb@google.com>, <mhocko@suse.com>, <nao.horiguchi@gmail.com>,
	<linmiaohe@huawei.com>, <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>
Subject: [PATCH v2 0/3] selftests/mm: add memory failure selftests
Date: Tue, 20 Jan 2026 20:32:36 +0800
Message-ID: <20260120123239.909882-1-linmiaohe@huawei.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemq500010.china.huawei.com (7.202.194.235)

Introduce selftests to validate the functionality of memory failure.
These tests help ensure that memory failure handling for anonymous
pages, pagecaches pages works correctly, including proper SIGBUS
delivery to user processes, page isolation, and recovery paths.

Currently madvise syscall is used to inject memory failures. And only
anonymous pages and pagecaches are tested. More test scenarios, e.g.
hugetlb, shmem, thp, will be added. Also more memory failure injecting
methods will be supported, e.g. APEI Error INJection, if required.

---
Changes in v2:
  Add some codes to guard pagecache testcases against tmpfs. Testcases
for tmpfs will be added soon.
  Thanks!
---
Miaohe Lin (3):
  selftests/mm: add memory failure anonymous page test
  selftests/mm: add memory failure clean pagecache test
  selftests/mm: add memory failure dirty pagecache test

 MAINTAINERS                                 |   1 +
 tools/testing/selftests/mm/.gitignore       |   1 +
 tools/testing/selftests/mm/Makefile         |   1 +
 tools/testing/selftests/mm/memory-failure.c | 359 ++++++++++++++++++++
 tools/testing/selftests/mm/run_vmtests.sh   |  21 ++
 tools/testing/selftests/mm/vm_util.c        |  41 +++
 tools/testing/selftests/mm/vm_util.h        |   3 +
 7 files changed, 427 insertions(+)
 create mode 100644 tools/testing/selftests/mm/memory-failure.c

-- 
2.33.0

