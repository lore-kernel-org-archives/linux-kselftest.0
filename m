Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794474188;
	b=Mnz5zW8XIilokX8XsOW/RjFfdUScyM9EEFkFcbdJDMiZFCfHC2BNg/koOq4AZZOPxc5s
	 /J2lNsvODJy10f0IR3vAuWfGjhYPeNGw0NZ9hbIeJk6MkDZJxaxEkW4ndbfFjbzGCt1/Y
	 jcl+JVSpo22eNzugxK9F/9lIKrZn1SZWHOoErCqQ22/p65wsFZgJCtQIEJCdNi586hU6p
	 jawHW/WAdXB51UzZzdWWvj4ggweMMNyPDBQ5ZuwEmDpj6gyNMnNN+FhEMWwbYxe+OQpux
	 knK78mjeJW4D2xITZXpI4mQxhnVFyFKdqzV+1oz5/tdP1wjJ43ptk3ZRhknwooNvnbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794474188;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=VFkjE7hl/1Y+MIeA6I1Mbsc5quayUb/zf3n6+YoAoZA=;
	b=XhNPsJalbz+y73T30Oo7betRxrpaSQB9EhGRfA/9bvesOUeJSTfTBBfu/GJ4PzhlS8Ec
	 4JEzie7BlzBkX2h1KKKM48Z2U/5hImzdwj3K2MQUGRaY+URscfapyl9bPJj202WfMO6qu
	 MRd0ahYjXZq/ca6AwIbzJQ0w8VqmJ0eMnox9LnRSROrZXIXb1+ZB3rQNN71/1seMOst8H
	 4LXVrKTiZ0AFFgpRuxyDcJOkvVVNDSSGkEA/JeXtAZLtBd7hltLlAn5+TBoVQ9EOjiS54
	 CmrXNV4W4JkplHBiz4/RaoXvPpMUTC0Wt9853Rk9trM6YZ/miZ3wbH6R0O/K4huPMzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=IhdNOBCZ;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 427EC606A321;
	Thu, 12 Nov 2026 09:03:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 427EC606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=IhdNOBCZ
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EB1CA339;
	Thu, 12 Nov 2026 01:03:02 -0800 (PST)
Received: from a081061.arm.com (unknown [10.163.169.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 498733F632;
	Thu, 12 Nov 2026 01:02:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794474185; bh=ypZh11Db/XggA04FeV2gzYgFOL4PpiInmAMkq7Td3OQ=;
	h=From:To:Cc:Subject:Date:From;
	b=IhdNOBCZekiKgqKy2zdq4fN5Eo5epr0ImKCXrbew0Y4SkkZusj9zkAshr3fH/ceWz
	 078/HWVuKDQWstIBxdRn8PRVUWH5rzCLcfSXVxRnkPidGUHMtpguIbGwBras7lCpni
	 qhIrxzx+MFrAM+Z9oKW7tAAt0vD7w2jPaDf/lu3o=
From: Sarthak Sharma <sarthak.sharma@arm.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Nico Pache <nico.pache@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>,
	Kiryl Shutsemau <kas@kernel.org>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sarthak Sharma <sarthak.sharma@arm.com>
Subject: [PATCH 0/4] selftests/mm: replace transhuge-stress with a THP compaction selftest
Date: Thu, 12 Nov 2026 14:32:46 +0530
Message-ID: <20261112090250.334344-1-sarthak.sharma@arm.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

transhuge-stress is a stressor tool that repeatedly
allocates and splits THPs till a specified duration. If the
duration elapses, the test passes and fails only if a setup or
system call fails.

This is not how a test residing in selftests/mm is supposed to
behave. So remove it and add a new functional test called
thp-compaction.c, that allocates THPs as much as it can,
splits those THPs keeping one page retained and discarding
others, and then retries allocating THPs, which will test
if THP compaction is working fine. If we are able to recover
more than half of the initial THPs, the test passes. Otherwise
it fails.

This was suggested by David earlier [1].

Patch 1 removes the current transhuge-stress. Patch 2 adds a check to see
if PFNs are being masked due to no CAP_SYS_ADMIN in the initial user namespace.
Patch 3 factors out THP split helpers from split_huge_page_test.c to vm_util.c.
Patch 4 adds the
new test.

[1] https://lore.kernel.org/all/94ace42d-8d60-4475-953e-74fb3dc23774@kernel.org/

Sarthak Sharma (4):
  selftests/mm: remove transhuge-stress
  selftests/mm: detect masked PFNs in allocate_transhuge()
  selftests/mm: factor out THP split helpers
  selftests/mm: add a THP compaction selftest

 MAINTAINERS                                   |   2 +-
 tools/testing/selftests/mm/Makefile           |   2 +-
 tools/testing/selftests/mm/ksm_tests.c        |  26 ++-
 tools/testing/selftests/mm/run_vmtests.sh     |   2 +-
 .../selftests/mm/split_huge_page_test.c       |  45 +---
 tools/testing/selftests/mm/thp-compaction.c   | 215 ++++++++++++++++++
 tools/testing/selftests/mm/transhuge-stress.c | 146 ------------
 tools/testing/selftests/mm/vm_util.c          |  65 ++++++
 tools/testing/selftests/mm/vm_util.h          |   6 +
 9 files changed, 313 insertions(+), 196 deletions(-)
 create mode 100644 tools/testing/selftests/mm/thp-compaction.c
 delete mode 100644 tools/testing/selftests/mm/transhuge-stress.c

-- 
2.53.0

