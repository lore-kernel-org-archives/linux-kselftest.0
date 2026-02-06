Received: from canpmsgout09.his.huawei.com (canpmsgout09.his.huawei.com [113.46.200.224])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D655A2EDD45;
	Fri,  6 Feb 2026 03:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.224
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770347196; cv=none; b=J64fFk9m7z8O+CcgZx9i+Ex38xSdTZwfabwsTgg8JH9yKma3BKlX/AMs6Hbp+y70fA9PRn3r/R4Fl/l/ul0nN0RDXsLWdai/bWSY5IikaiF7Hrv7xGxpdvIPCckq4sp+8lk5WxhN2fkGvSc/ju/4PllgazbdKLGoz8dgCJhGlSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770347196; c=relaxed/simple;
	bh=AilvU05ZvX2NjJZaJe4332dTSsUUP8eEee3MYk9GCM8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LrFHATFeqbIDpQ3gxwuZltYftteiEBHxzJQ0FalNKo7ZHJk7NPkLJy4mPJXxTV5J+yoDn8yXmnW6e01odWE29q4aPTsTMFgEqVNnAor+ul7OjrOP82sNjYX1ThtcejHmTgTy4v9HgrTkQcN5OXb3CNlaD88d/IIK+We6bUndmt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=0lRWbwgH; arc=none smtp.client-ip=113.46.200.224
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="0lRWbwgH"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=5aans9xtPXcHB4+FARFiU0HO5Ds9Y+W0WJVItIfQaoc=;
	b=0lRWbwgHsACO1GzWRxaWJ8wtj3zoekSkWRxh+S9G2RTCeZ5l4VrHuXoEvQWnGb/jyKdGab+Io
	306DNK/6NrQjH3Q0FQIhzexiwNM8rbX+RR6c6yosM5tTdFFHTAWhwXGSxjZQ1yKopbpxco1UYNY
	nQ18hj3ih1BTXAzmmHZo8vo=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4f6f4v5b5cz1cyPT;
	Fri,  6 Feb 2026 11:01:51 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
	by mail.maildlp.com (Postfix) with ESMTPS id AFF9440565;
	Fri,  6 Feb 2026 11:06:26 +0800 (CST)
Received: from kwepemq500010.china.huawei.com (7.202.194.235) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 6 Feb 2026 11:06:26 +0800
Received: from huawei.com (10.173.125.37) by kwepemq500010.china.huawei.com
 (7.202.194.235) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 6 Feb
 2026 11:06:25 +0800
From: Miaohe Lin <linmiaohe@huawei.com>
To: <akpm@linux-foundation.org>, <shuah@kernel.org>
CC: <david@kernel.org>, <lorenzo.stoakes@oracle.com>,
	<Liam.Howlett@oracle.com>, <vbabka@suse.cz>, <rppt@kernel.org>,
	<surenb@google.com>, <mhocko@suse.com>, <nao.horiguchi@gmail.com>,
	<broonie@kernel.org>, <linmiaohe@huawei.com>, <linux-mm@kvack.org>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
Subject: [PATCH v4 0/3] selftests/mm: add memory failure selftests
Date: Fri, 6 Feb 2026 11:16:36 +0800
Message-ID: <20260206031639.2707102-1-linmiaohe@huawei.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
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
Changes in v4:
  Support running memory-failure test separately per Mark.

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

 MAINTAINERS                                   |   1 +
 tools/testing/selftests/mm/.gitignore         |   1 +
 tools/testing/selftests/mm/Makefile           |   2 +
 tools/testing/selftests/mm/config             |   2 +
 .../selftests/mm/ksft_memory_failure.sh       |   4 +
 tools/testing/selftests/mm/memory-failure.c   | 359 ++++++++++++++++++
 tools/testing/selftests/mm/run_vmtests.sh     |  21 +
 tools/testing/selftests/mm/vm_util.c          |  41 ++
 tools/testing/selftests/mm/vm_util.h          |   3 +
 9 files changed, 434 insertions(+)
 create mode 100755 tools/testing/selftests/mm/ksft_memory_failure.sh
 create mode 100644 tools/testing/selftests/mm/memory-failure.c

-- 
2.33.0

