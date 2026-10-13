Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 810E847ACC7;
	Tue, 13 Oct 2026 10:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791887834; cv=none; b=RvFhliquaPn5vVI/AwcxFoFcT928cdd2X5LNK2KbCpcv1oxFnOTSLzdDoqGm/IppQ+wxRrK2McrgSseEXOzvdFycuDgxP6pHYUe26WE3S6C9OnoVb5HY2yWaxJ0bUDGsYIl96K8i1YMrWHSDb6bYKjjQkqDc5E80RE+lxfRcEN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791887834; c=relaxed/simple;
	bh=0uN78WI1mvBBoBWP93Cgm5INI0kkPY9Q4xYy22OfXx0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VYTZeBUEXEVXTUywYI0ogiSuMXIXEUJQ3lxRmPrdI7d3HKv2+fyY4IMSFUYkxSjmiqv7qLVgbkqCGKUgkFA+UB6Bz1T9YBUV/MLeYvD03Pk7/9DxnMEhHlsJ53lUZ3A3E800ol17ejXnOAV4dJ1AosToY5OpOrjvqUeFIDHiDXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=KULdfHx0; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="KULdfHx0"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 96258169C;
	Tue, 13 Oct 2026 03:37:08 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E26BE3F7B4;
	Tue, 13 Oct 2026 03:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791887831; bh=0uN78WI1mvBBoBWP93Cgm5INI0kkPY9Q4xYy22OfXx0=;
	h=From:Subject:Date:To:Cc:From;
	b=KULdfHx00SBvxeB+Vn2e1gJ/ULQ0G21brr+mA1Wq84unD6dNiz6LMerJrOdhdLIDc
	 oH3+57fiy9WaJPjZzjSRzFeW1SjfcltZ6F6bZpQFX7yueFQhzKoIOSlSN9sJpLO2Sn
	 91k5RmNg6f3AfejFbQd7Lf40WT6YKQ+towxmY6EA=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH v7 0/3] kselftest: mm: remove HPAGE_SIZE and HPAGE_SHIFT
 macro
Date: Tue, 13 Oct 2026 11:37:02 +0100
Message-Id: <20261013-fix_hpage_macro-v7-0-3d77129e0557@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM4JzmoC/23PwYrCMBAG4FeRnDfLJJlEsyffQ0SGZGpzqJV0C
 Yr03U2LuJXu8R/m+4d5iIFz4kH8bB4ic0lD6i81bL82IrR0ObNMsWahQTvw4GWTbqf2Smc+dRR
 yLyOB88SAFrSo6pq5rsyNh2PNbRp++3yfDxQzTV9dClddxUiQwZMBS6Ci8XvK3XfoOzE1FVxor
 dYaJx2ZsAkusGk+tX1rBf/8UWzVFs12R4yWYvzUbqGVWWtXtQ5WR8AdRjZ/ehzHJy/ItElmAQA
 A
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6000; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=0uN78WI1mvBBoBWP93Cgm5INI0kkPY9Q4xYy22OfXx0=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBqzgnSDLIn5dW3u16QersuEpPlHNauoCsiaSxHa
 mjr1PIrb32JAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCas4J0gAKCRBt1cPRWsUx
 M4sVDACpUSDrd9g+fkwNpcYHsaBnVRJd+tUCdMDBDKbIQ6N1rUVeEgzCC9YoM4Qol/BUaBQhJfC
 469D+uhlMiIPlvn26YIDs/tG7Ke9cKAFI/bPxlMndpFXoU+20XjF6GqqTVA5AOKy39WTY8Lcl2R
 nue1lotxHxTfeeAFqFLG6k0Ou/U+kV0qbUaPH9TPF8qFoKlWTwlwdqoYgrGZYk44EOac+BUg1lw
 BeFKE0PzO6cIUR5AorTywE8siwS4eZlaRzqm3fKfuZIL93QkkdxUqtoedkRYR0Kc6bK1O79rSCZ
 mQEUfqXObt2RUrglBv1ArkjdnlvPRGG65/8rXXv3Olh0UtYxCaMNM/mbIF3YOWbR1FYjXj06eSL
 Y5EKxsrYhw12ELZFy2Fyo10RGcfnuK2FglMQ6Z+C7iUaLSQEloJnxumfi9uoxKLpBQdmEW35nTJ
 mse+V3Y91jmscn76jNNLYGFA1n7zq+vEcas/qLwLdTtdfu82r+KKtK3ZYRuREBoidQoWE=
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
Changes in v7:
- fix inverted condition.
- Link to v6: https://lore.kernel.org/r/20261013-fix_hpage_macro-v6-0-2c52d0484de3@arm.com

Changes in v6:
- add r-b tags.
- small change for declaration order.
- Link to v5: https://lore.kernel.org/r/20261009-fix_hpage_macro-v5-0-54378ae45add@arm.com

Changes in v5:
- rebase to mm/mm-unstable
- Link to v4: https://lore.kernel.org/r/20260921-fix_hpage_macro-v4-0-cdea4fc6ce3f@arm.com

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
 tools/testing/selftests/mm/guard-regions.c         | 10 ++++--
 tools/testing/selftests/mm/hmm-tests.c             | 22 ++++++------
 tools/testing/selftests/mm/khugepaged.c            |  2 +-
 tools/testing/selftests/mm/khugepaged_race.c       |  2 +-
 tools/testing/selftests/mm/khugepaged_sync_check.c |  2 +-
 tools/testing/selftests/mm/ksm_tests.c             | 16 +++++----
 tools/testing/selftests/mm/migration.c             |  4 +--
 tools/testing/selftests/mm/mkdirty.c               |  2 +-
 tools/testing/selftests/mm/pagemap_ioctl.c         |  2 +-
 tools/testing/selftests/mm/prctl_thp_disable.c     |  4 +--
 tools/testing/selftests/mm/process_madv.c          |  2 +-
 tools/testing/selftests/mm/run_vmtests.sh          |  4 +--
 tools/testing/selftests/mm/soft-dirty.c            |  2 +-
 tools/testing/selftests/mm/split_huge_page_test.c  |  2 +-
 tools/testing/selftests/mm/transhuge-stress.c      | 25 +++++++------
 tools/testing/selftests/mm/uffd-common.c           |  6 ++--
 tools/testing/selftests/mm/uffd-unit-tests.c       |  8 ++---
 tools/testing/selftests/mm/uffd-wp-mremap.c        |  2 +-
 tools/testing/selftests/mm/vm_util.c               | 42 ++++++++++++++++++----
 tools/testing/selftests/mm/vm_util.h               | 23 ++++++++----
 22 files changed, 119 insertions(+), 67 deletions(-)
---
base-commit: 7186f1bd21b9094cc063c10f8492fd135522d3cb
change-id: 20260909-fix_hpage_macro-da069ae04502

Best regards,
-- 
Sincerely,
Yeoreum Yun

