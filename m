Received: from canpmsgout08.his.huawei.com (canpmsgout08.his.huawei.com [113.46.200.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555CC385513;
	Wed,  4 Feb 2026 07:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770189788; cv=none; b=hdEwY2sxNUdPdEeHllLB/WCCOvLs7RKH6a+Mz2BnyObEXTKvcfacGnSPqZXIruDuypAud7zCBlhY3X7CJ3snU4qly8Hx0jyPDZlU28gH2Kzt/s9Z8njIAuSj3VIii4JmBT54m9t6vxyOR+RBrYFNKyBLIa2jh8K+08weW3EM+g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770189788; c=relaxed/simple;
	bh=lHRq48CGjatf/rKe7db243j6KfasiPXgvwTx1IunWac=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jrQYmrJxd2ZzEMKU81juFPSFe9wHrOoB2qHFCC4fg35CDoQ1hNH4Ckc0YpyfTtWs5JGBbEXHv7gM2v3Kz4m4nHNFIQqh49xi9xTCywxelc/Xo8frsN2PTpRyV81J6m0F6jFNYE/zGsnDW24i4UaTo0nt2os7HYF6p8clz22RaXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=Qj24zykY; arc=none smtp.client-ip=113.46.200.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="Qj24zykY"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=ZF8/xn+jqN+qmIXuk9muaTSHcrBqfxCYpLITvIgWeYw=;
	b=Qj24zykY/YBO13eN+Q9suzpq4NMy0nyM1aFe3l6+nBSDMfT3IbbuikQHxos4fwJvhLoernJUa
	y14zZ8aF5qHmOmnbrQC5u6zdn7rm8kZJyu5VzbZIp4Z8TpfUWc49vp+5myeBTA3OfdCBzszBOSY
	VHI+PtOCvWbJKKDDEf08gYg=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4f5Wsx40yTzmVCj;
	Wed,  4 Feb 2026 15:18:29 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id 8D33040565;
	Wed,  4 Feb 2026 15:23:04 +0800 (CST)
Received: from kwepemq500010.china.huawei.com (7.202.194.235) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 4 Feb 2026 15:23:04 +0800
Received: from huawei.com (10.173.125.37) by kwepemq500010.china.huawei.com
 (7.202.194.235) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 4 Feb
 2026 15:23:03 +0800
From: Miaohe Lin <linmiaohe@huawei.com>
To: <akpm@linux-foundation.org>, <shuah@kernel.org>
CC: <david@kernel.org>, <lorenzo.stoakes@oracle.com>,
	<Liam.Howlett@oracle.com>, <vbabka@suse.cz>, <rppt@kernel.org>,
	<surenb@google.com>, <mhocko@suse.com>, <nao.horiguchi@gmail.com>,
	<broonie@kernel.org>, <linmiaohe@huawei.com>, <linux-mm@kvack.org>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
Subject: [PATCH v3 0/3] selftests/mm: add memory failure selftests
Date: Wed, 4 Feb 2026 15:33:28 +0800
Message-ID: <20260204073331.899406-1-linmiaohe@huawei.com>
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
Changes in v3:
  Add HWPOISON_INJECT and MEMORY_FAILURE to config per Mark.
  Fix kernel test robot warning.

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
 tools/testing/selftests/mm/config           |   2 +
 tools/testing/selftests/mm/memory-failure.c | 359 ++++++++++++++++++++
 tools/testing/selftests/mm/run_vmtests.sh   |  21 ++
 tools/testing/selftests/mm/vm_util.c        |  41 +++
 tools/testing/selftests/mm/vm_util.h        |   3 +
 8 files changed, 429 insertions(+)
 create mode 100644 tools/testing/selftests/mm/memory-failure.c

-- 
2.33.0

