Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1923B3B3BF1;
	Fri, 28 Aug 2026 08:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787904706; cv=none; b=C+Vtf6KdS16jPK6DMXYc7WJLoEgSQ6JxI3coNZztMOnUSaEscvpMbtofl+1utpunRbKEgP7NibL+aISeophNUWKUot0Oly59t2JYYaWUioUS9NnXouHI2HaJL+HdhB5FUmh8Rbpvkpct9o9z2zPzuvjwMODHuVP5aF/AET89OVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787904706; c=relaxed/simple;
	bh=USOUzZRz3c0fHctBAtbTyU36BIoeCR2Irm1oymvy1Z0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uI/NiwYKHVzPRjMDi7Ss8qFzVmGk5JCG/VMa/c6bkz6zQeCpx+LcOnxs+cWpeSykZDz4deZKpX/8RCH7mWUGcE6SCXV8yw6mpioiEJqf5se7tTjZMptNuBDREYaay1xYBcEHBFLM7ANQ/XcxNW+co3HEGPjCcUZUsccYC5nLeDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=az7+7cic; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="az7+7cic"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6668D1516;
	Fri, 28 Aug 2026 01:11:39 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B40483F85F;
	Fri, 28 Aug 2026 01:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787904703; bh=USOUzZRz3c0fHctBAtbTyU36BIoeCR2Irm1oymvy1Z0=;
	h=From:Subject:Date:To:Cc:From;
	b=az7+7cicnKBQ4YE1gf1xYFVll6DUXUj/0LcNUrPlF+q2kN6lMjqfpwg21E5G1r/PE
	 Hk5FiygbfHcuyOPoOC2iqNfuaTeb2TJNTuRMsulLWoly8CUjUjJwbzN2p1m9+vlPO6
	 c6pNfGHqj04ZUWmk4r6hrzs10nJwXVOzZY/Tng7M=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH v3 0/2] kselftest: mm: fix some failure of
 split_huge_page_test
Date: Fri, 28 Aug 2026 09:11:32 +0100
Message-Id: <20260828-fix_split-v3-0-374022586a4b@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIALRCkWoC/22MQQ6CMBBFr0JmbU1pqxZW3sMQU8apTCKUtIRoS
 O9uZe3y/f/yNkgUmRK01QaRVk4cpgL6UAEObnqS4EdhUFKdpVVSeH7f0/ziRXhjGt0QGtNbKP4
 cqZx769YVHjgtIX729Fr/1n+VtRZSuN5oiSeLF/RXF8cjhhG6nPMXt8m10qAAAAA=
To: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
 "Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>, 
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
 Usama Arif <usama.arif@linux.dev>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, 
 Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Yeoreum Yun <yeoreum.yun@arm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2222; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=USOUzZRz3c0fHctBAtbTyU36BIoeCR2Irm1oymvy1Z0=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBqkUK7FZ6xrgwXi+C79j9XWUXPL157DEfNDeyvK
 NH3vM1BzjWJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCapFCuwAKCRBt1cPRWsUx
 M8p4C/9JENjCUm3iTLSylTH5Q2XPNcCbR8DJj9nKskBTusG5Hj6XCUUnfr//3gO/7CasIBssnuu
 B5ReHNHtaHq/lbokLssbDICO5An0Q53c0pJkWddWHavvXdESeXDlqJUeVal3P19As4xwZ6zvPej
 iaIGGwh4QB5YrDenpijUtphEjykFlkYzIFuAMb+JtrgiWhTPAFDIG3x76EAuZrn+AdutCKtujHS
 xKxrfLCQk74x5IsRkOf/BQLbUa61rJmpNsN7odwpztE8dyrY1CUB0y+/XVcaAhu9iB+3ax9iX8g
 1QEJ3PN/v6fXsBRQVzMR/Z8ED9czEPNzsn9nmDHMn781/Kwf/MOp2OLbsU/IGQaPTSmjZaYDCiU
 OvOnZOEtGwYuN9cKB3tz5pCVh+2r7qm+f0Z7Z46BOeD4mxVYeYrfeaH2MIqjTQK0FOY7KbWZWiA
 2J5KY1SnR/DxPXOj3QvgCtoVO9TVWeIZb9nzhOg1Wl0Zt0ESeEMW1MwQsMRmr5BmoNa4k=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133

split_huge_page_test can fail for the following reasons:

  1. During the test, khugepaged may collapse previously split pages again,
     causing intermittent failures.

  2. Since glibc commit 321e1fc73f (“malloc: Enable 2MB THP by default on AArch64”),
     glibc may call madvise(MADV_HUGEPAGE) for sufficiently large allocations
     made by memalign(). The underlying VMA may start at a different address
     from the aligned address returned by memalign(). Moreover, a subsequent
     madvise(MADV_HUGEPAGE) call does not split the VMA because it already
     has the same advice.

     This causes the test to fail because the check_huge_xxx() helpers
     incorrectly require the address returned by memalign() to match the
     VMA start address reported in /proc/self/smaps.

Address these issues by applying MADV_NOHUGEPAGE after faulting in the
huge page, preventing khugepaged from collapsing it again, and by replacing
the use of /proc/self/smaps in the check_huge_xxx() helpers with
/proc/self/pagemap and /proc/kpageflags.

This patch based on mm-unstable

---
Changes in v3:
  - change  message in case of failure of madvise() with MADV_NOHUGEPAGE.
  - fix collapse_single_mthp (mthp_khugepaged:anon) test case failure.
  - Link to v2: https://lore.kernel.org/all/20260826-fix_split-v2-0-71153c7f579a@arm.com/

Changes in v2:
  - rebase to mm-unstable.
  - add message in case of failure of madvise() with MADV_NOHUGEPAGE.
  - fix wrong setup expected_huge in check_huge_shmem().
  - Link to v1: https://lore.kernel.org/r/20260820-fix_split-v1-0-ab430c58c7cf@arm.com

---
Yeoreum Yun (2):
      kselftest: mm: prevent random failure of huge page split for khugepaged
      kselftest: mm: replace usage of /proc/self/smaps for check_huge_xxx() helper

 tools/testing/selftests/mm/split_huge_page_test.c |  15 +++
 tools/testing/selftests/mm/vm_util.c              | 145 ++++++++++++++--------
 tools/testing/selftests/mm/vm_util.h              |   1 +
 3 files changed, 107 insertions(+), 54 deletions(-)
---
base-commit: 234e77148199ae43b83a0a03a3f481e03460a286
change-id: 20260820-fix_split-f44939ec44b8

Best regards,
-- 
Sincerely,
Yeoreum Yun

