Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36400322B92;
	Thu, 22 Jan 2026 17:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769101364; cv=none; b=hKVbO1C4WY8C0VTOEaEilxBYLwzmC/CThmv4Ysa9QVdN77q4bJe6u+nNxq02m2ZrNANut/F975iTNk5yU20fFDs5hAMms02XzvpR9Rtv8DmDu2FqS3m7BHSC52j9+xyZJk9UQLAGWoOrOrbYC39M31dlsnTSR4x0y5ci+Er7X4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769101364; c=relaxed/simple;
	bh=BgKeU0+i1Hvesaxk8V9I6y2ZYneBAgd07tVwTaWux1o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AcNTWxpqTprSF0mGrIeFDt54oyzK24i2JTU3yBf1VHinuv+b+KuD0ellQEg9rkaDzS2wQQkOeQgDaV6m7VmufvquUVTzvLzNrUoemUOb0+ClR33WrzVGtdX+dLm3iKAUDPLdGJNDj365tHU8BEScdkFJMXq+meGY3rlzkqAeWko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EAD981476;
	Thu, 22 Jan 2026 09:02:27 -0800 (PST)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2B71A3F632;
	Thu, 22 Jan 2026 09:02:33 -0800 (PST)
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Dev Jain <dev.jain@arm.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Mark Brown <broonie@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Shuah Khan <shuah@kernel.org>
Subject: [PATCH v3 0/9] Various mm kselftests improvements/fixes
Date: Thu, 22 Jan 2026 17:02:15 +0000
Message-ID: <20260122170224.4056513-1-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Various improvements/fixes for the mm kselftests:

- Patch 1-3 extend support for more build configurations: out-of-tree
  $KDIR, cross-compilation, etc.

- Patch 4-7 fix issues related to faulting in pages, introducing a new
  helper for that purpose.

- Patch 8 fixes the value returned by pagemap_ioctl (PASS was always
  returned, which explains why the issue fixed in patch 6 went
  unnoticed).

- Patch 9 improves the exit code of pfnmap.

Net results:
- 1 test no longer fails (patch 7)
- 3 tests are no longer skipped (patch 4)
- More accurate return values for whole suites (patch 8, 9)
- Extra tests are more likely to be built (patch 1-3)

---
v2..v3:
- Patch 5: new patch [David Hildenbrand]
- Patch 6: make the helper take a number of pages + pagesize, rename to
  force_read_pages() [David]
- Patch 7: improved page count calculation (avoiding floating-point
  helper)
- Patch 7: added Fixes tag [David]
- Patch 9: open the file only once and save the fd [David]
- Collected R-b/A-b

v2: https://lore.kernel.org/all/20260107164842.3289559-1-kevin.brodsky@arm.com/

v1..v2:
- New patches: 1, 4, 5, 8

v1: https://lore.kernel.org/all/20251216142633.2401447-1-kevin.brodsky@arm.com/
---
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>
Cc: Dev Jain <dev.jain@arm.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Shuah Khan <shuah@kernel.org>
---
Kevin Brodsky (9):
  selftests/mm: default KDIR to build directory
  selftests/mm: remove flaky header check
  selftests/mm: pass down full CC and CFLAGS to check_config.sh
  selftests/mm: fix usage of FORCE_READ() in cow tests
  selftests/mm: check that FORCE_READ() succeeded
  selftests/mm: introduce helper to read every page
  selftests/mm: fix faulting-in code in pagemap_ioctl test
  selftests/mm: fix exit code in pagemap_ioctl
  selftests/mm: report SKIP in pfnmap if a check fails

 tools/testing/selftests/mm/Makefile           |  8 +-
 tools/testing/selftests/mm/check_config.sh    |  3 +-
 tools/testing/selftests/mm/cow.c              | 43 +++++++--
 tools/testing/selftests/mm/hugetlb-madvise.c  |  9 +-
 tools/testing/selftests/mm/page_frag/Makefile |  2 +-
 tools/testing/selftests/mm/pagemap_ioctl.c    | 15 ++-
 tools/testing/selftests/mm/pfnmap.c           | 93 +++++++++++--------
 .../selftests/mm/split_huge_page_test.c       |  6 +-
 tools/testing/selftests/mm/vm_util.h          |  7 ++
 9 files changed, 109 insertions(+), 77 deletions(-)


base-commit: 24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7
-- 
2.51.2

