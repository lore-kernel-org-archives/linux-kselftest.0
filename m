Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A34993C10AA;
	Mon, 21 Sep 2026 10:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789987012; cv=none; b=ICa/Ry6T4K7V4dYETMLaCqSTXOVuMQXYSPHwLIbdhc/Trf/Sug9RITAlG8XrjQFpL8daJ9SVznKnSOIOMje9vYtrNZR1566MwWE7TaJ4N6GKmjZJoo6xYo2POw3s43n52OP6nOc+jRY4CRWn299d2+mbTybmMs9U7gdeQAbk4tM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789987012; c=relaxed/simple;
	bh=MO+WSWsiYH+d9XMV7jfY1UxupADO1N/mejVI9LUtSvU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=quxv8aBCwSJ8Lutn43OBl8kFQhuX9+U2S4x9gZtHY2MqfBpOICMnafSW0o59/wXG/eUG02tW54hI/xtY92mmFzU/6RKgLXDOIuBja2IY4xxrgnUv0QLp6nYE89pmHG9g9U4u9M+kHUtG4giqxOW/+OdvmgUYZI9R7SO8tRdKqxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=FwdWObAE; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="FwdWObAE"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5835F143D;
	Mon, 21 Sep 2026 03:36:46 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 50F913F86C;
	Mon, 21 Sep 2026 03:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789987009; bh=MO+WSWsiYH+d9XMV7jfY1UxupADO1N/mejVI9LUtSvU=;
	h=From:Subject:Date:To:Cc:From;
	b=FwdWObAEpdOS1tW41x5E2RIWUMyXVfuXj5IpLAEsjVWngzL6RLO/9JJuNONDIo6Vq
	 MDGmHOoQk9QPbSd3+NHOivynGblc6tSKLP8AIsdn+oFT678a3drmeGYRJPefViUJlT
	 IjmWA+v0vJ4etnBpLXTBWUdLEdKoUkhbL3SBU1+k=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH v4 0/3] kselftest: mm: remove HPAGE_SIZE and HPAGE_SHIFT
 macro
Date: Mon, 21 Sep 2026 11:36:37 +0100
Message-Id: <20260921-fix_hpage_macro-v4-0-cdea4fc6ce3f@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALUIsWoC/2WNwQqDMBBEf0X23JTVqJCe+h9FZIlbk0OMbCS0i
 P/eVHrr8Q0zb3ZILJ4T3KodhLNPPi4F2ksF1tEys/JTYWiw6dGgUU//Gt1KM4+BrEQ1EfaGGNs
 OGyirVbhUTuNjKOx82qK8z4Osv+nPVbd/rqwVKmtIY0dYT9rcScLVxgDDcRwfqx/PTawAAAA=
To: Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Zi Yan <ziy@nvidia.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, 
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
 Kiryl Shutsemau <kas@kernel.org>, Peter Xu <peterx@redhat.com>, 
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Shuah Khan <shuah@kernel.org>, 
 Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, 
 Sarthak Sharma <sarthak.sharma@arm.com>, Yeoreum Yun <yeoreum.yun@arm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5439; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=MO+WSWsiYH+d9XMV7jfY1UxupADO1N/mejVI9LUtSvU=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBqsQi8pSMLunjVUZ4Lzs+cfoXnA7TxP+f5fh5Ae
 5W4SjL8dlOJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCarEIvAAKCRBt1cPRWsUx
 M4NZC/461rHv1OET0IwYhpw+HH9X0GcGOqSwPjsoF1PTRH4PBwdWociupssWhbQ8MrQ6TBPvbK+
 51mEUuE2FMXk24dykQwY/lG4yTqGEJpVjcEe8hwVztNCGbJfhn/cd59QUzGkm9h49La/wAF+G/k
 Eaz1951C5pMao1KQn2qDDLH9/GZc/Lcr9iTUvh4qNjQbtaYR/8nUs2RLMJKiKya6gj6UShRL6wk
 9PalJK+4re4HyODIe68KxisxYhVf5F1kVLkyzDNZ2irU+3W0dGB3xqslzd0+qFMT/1saC4H4O46
 jSS3cYl2mD55Yl5iX8zohouJVDGpp577ad/EF/ii7meFOCxzWY9JD954q0txl8gNbGDUMmIJbyD
 XSHfq/++LDilN1+C/3ByyBpukTeDW0xXIMi0v1hvZFOQB15/rCurCiz3o4gIto/9/zlUG378sZV
 K6vc2RHv+gfymSubnTrIHV042vLyU3GBPBMUJFenbW3wQJSBpGSsT4QV0ldyupUuqQgi8=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133

HPAGE_SIZE and HPAGE_SHIFT macro is written based on the 4KB PAGE_SIZE.
When this macro is used in some test, test result would be strange in
the system where PAGE_SIZE is more then 4KB.

Here is the example with transhuge-stress test with 16KB PAGE_SIZE:

  transhuge-stress: allocate 61073 transhuge pages, using 122146 MiB virtual memory and 1908 MiB of ram
    3.292 s/loop, 0.054 ms/page,  37106.002 MiB/s       2566 succeed, 58507 failed, 2566 different pages
    0.591 s/loop, 0.010 ms/page, 206850.792 MiB/s          0 succeed, 61073 failed,    0 different pages
    0.527 s/loop, 0.009 ms/page, 231895.107 MiB/s          0 succeed, 61073 failed,    0 different pages
    3.292 s/loop, 0.054 ms/page,  37106.002 MiB/s       2566 succeed, 58507 failed, 2566 different pages
    0.591 s/loop, 0.010 ms/page, 206850.792 MiB/s          0 succeed, 61073 failed,    0 different pages
    0.527 s/loop, 0.009 ms/page, 231895.107 MiB/s          0 succeed, 61073 failed,    0 different pages
    0.527 s/loop, 0.009 ms/page, 231839.704 MiB/s          0 succeed, 61073 failed,    0 different pages
    0.528 s/loop, 0.009 ms/page, 231544.782 MiB/s          0 succeed, 61073 failed,    0 different pages
    0.528 s/loop, 0.009 ms/page, 231462.074 MiB/s          0 succeed, 61073 failed,    0 different pages
    0.527 s/loop, 0.009 ms/page, 231770.300 MiB/s          0 succeed, 61073 failed,    0 different pages
    ...
  ok 1 Completed

To address this, remove the HPAGE_SIZE and HPAGE_SHIFT macro,
introduce pmd_pshift() and rename read_pmd_pagesize() to pmd_psize()
to keep consistency with psize() and pshift().

Also, run the KSM_MERGE_TIME_HUGE_PAGES test with a size of 512 MiB,
which is the least common multiple of the PMD sizes for 4 KiB, 16 KiB,
and 64 KiB base pages. Since allocate_transhuge() allocates mappings in
PMD-sized units, the test may fail with the previous size of 100 MiB,
which is not a multiple of the PMD size when the base page size is
16 KiB or 64 KiB.

After this patch, output of transhuge-stress:

  transhuge-stress: allocate 3817 transhuge pages, using 122146 MiB virtual memory and 119 MiB of ram
    2.558 s/loop, 0.670 ms/page,  47755.759 MiB/s       2585 succeed, 1232 failed, 2585 different pages
    2.640 s/loop, 0.692 ms/page,  46268.432 MiB/s       2585 succeed, 1232 failed, 2585 different pages
    2.635 s/loop, 0.690 ms/page,  46360.298 MiB/s       2585 succeed, 1232 failed, 2585 different pages
    2.782 s/loop, 0.729 ms/page,  43899.795 MiB/s       2616 succeed, 1201 failed, 2616 different pages
    2.692 s/loop, 0.705 ms/page,  45380.876 MiB/s       2627 succeed, 1190 failed, 2627 different pages
    2.612 s/loop, 0.684 ms/page,  46765.812 MiB/s       2628 succeed, 1189 failed, 2628 different pages
    2.683 s/loop, 0.703 ms/page,  45520.990 MiB/s       2630 succeed, 1187 failed, 2630 different pages
    2.727 s/loop, 0.714 ms/page,  44789.321 MiB/s       2631 succeed, 1186 failed, 2631 different pages
    ...
  ok 1 Completed

Additionally, introduce size_to_shift() for future users that need to
obtain shift of a huge-page which is other than pmd_psize().

Patch History
=============
Changes in v4:
  - make size_to_shift() as inline function.
  - initialise __pmd_psize and __pmd_pshift with -1ull.
  - Link to v3: https://lore.kernel.org/r/20260914-fix_hpage_macro-v3-0-c9a305a01d39@arm.com

Change in v3:
 - rename read_pmd_pagesize() to pmd_psize()
 - introduce size_to_shift()
 - Link to v2: https://lore.kernel.org/all/20260907081509.924979-1-yeoreum.yun@arm.com/

Chnage in v2:
 - rename hpage_* to pmd_page_*
 - Link to v1: https://lore.kernel.org/all/20260902175611.1241118-1-yeoreum.yun@arm.com/#t

---
Yeoreum Yun (3):
      kselftest: mm: rename read_pmd_pagesize() to pmd_psize()
      kselftest: mm: remove HPAGE_SIZE and HPAGE_SHIFT macro
      kselftest: mm: introduce size_to_shift() helper

 tools/testing/selftests/mm/cow.c                   |  2 +-
 tools/testing/selftests/mm/folio_split_race_test.c |  2 +-
 tools/testing/selftests/mm/guard-regions.c         | 11 +++++-
 tools/testing/selftests/mm/hmm-tests.c             | 22 +++++------
 tools/testing/selftests/mm/khugepaged.c            |  2 +-
 tools/testing/selftests/mm/ksm_tests.c             | 16 +++++---
 tools/testing/selftests/mm/migration.c             |  4 +-
 tools/testing/selftests/mm/mkdirty.c               |  2 +-
 tools/testing/selftests/mm/pagemap_ioctl.c         |  2 +-
 tools/testing/selftests/mm/prctl_thp_disable.c     |  4 +-
 tools/testing/selftests/mm/process_madv.c          |  2 +-
 tools/testing/selftests/mm/run_vmtests.sh          |  4 +-
 tools/testing/selftests/mm/soft-dirty.c            |  2 +-
 tools/testing/selftests/mm/split_huge_page_test.c  |  2 +-
 tools/testing/selftests/mm/transhuge-stress.c      | 25 +++++++-----
 tools/testing/selftests/mm/uffd-common.c           |  6 +--
 tools/testing/selftests/mm/uffd-unit-tests.c       |  8 ++--
 tools/testing/selftests/mm/uffd-wp-mremap.c        |  2 +-
 tools/testing/selftests/mm/vm_util.c               | 46 +++++++++++++++++-----
 tools/testing/selftests/mm/vm_util.h               | 23 +++++++----
 20 files changed, 120 insertions(+), 67 deletions(-)
---
base-commit: 8d61431ed2607386b427752505379536eb634ce8
change-id: 20260909-fix_hpage_macro-da069ae04502

Best regards,
-- 
Sincerely,
Yeoreum Yun

