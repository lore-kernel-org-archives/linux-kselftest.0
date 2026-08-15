Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FCD23446CE;
	Sat, 15 Aug 2026 01:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786759149; cv=none; b=gBohG45t2p7y0Y5lAXEg/WaRkUaPafGmZlZo6RH1BTzdo0UP53w1PCoj/g1QWH1BEchOtmLZ8Wnw6b5Gh4mhjmn4OGwLltHfGj084GiPkiGHdARKjbbNqgTEpUltlIomj3aGbkO5qNx89mCalL5Ou3M2pUKID+vfgUVkNGnGOEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786759149; c=relaxed/simple;
	bh=5zaTwTMIwlsEvp7XmfBF2wL5kRzEly43zyQG8wzrJ2Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HIEHukOPxPqG8Hvp4fLW/5hCZxXwTSgS/u7v/akssz9TTgHVfLEB5OhZPLtWl7FEDDvmdStw74Io5BmaEJKOL5hJKA12cfmxo/Gayp0Jc9EeEoqS4TqT5oM8qmZ599gCszHfCwHlqNgasqop13nopoZWE1agIt5++qrYgp/5Wnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=0GUszIJx; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=XTEyCH+h; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="0GUszIJx";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="XTEyCH+h"
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfout.phl.internal (Postfix) with ESMTP id 64339EC0221;
	Fri, 14 Aug 2026 21:59:06 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Fri, 14 Aug 2026 21:59:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm1; t=1786759146; x=1786845546; bh=z5hBIPxBD8
	4BGgz5XckjHT+qTpsbdvAmR0AVjOp3Xpc=; b=0GUszIJxM5KtCArqpFF0STb2Iq
	m562OnBDh6x18/f27bIlF+JUHlDFqUj0zZMVd/K5g26jvOgivlDnniJYMRBc22Oj
	btksEM0I/dFM4sS+V/UEMR6Y2t2hCGR0GOhsALhBkCdbdRvUtY4vzWfBpGidQDRy
	DxXvUzFZje/o9zwN7NJ/CeOAdGbV9gbwRKQFyZYvZMhXoE4+JGzw2rYZbgQqSMEA
	uV3yQFP+gYGxgbe8xlhoWGDBfHu2NOszn+M632zr6LzprgcR7rawxJBUJbwM4uLX
	44i1OHhvJjk9TpOhmNctYb21jLtN9mka3ZjmHcbjuJqTP7/N+CRff2/C1okQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1786759146; x=1786845546; bh=z5hBIPxBD84BGgz5XckjHT+qTpsbdvAmR0A
	VjOp3Xpc=; b=XTEyCH+hXPCt6WTr/UQI0PmbX5MTJ65XCfhjbzEUnUbMq++Qib2
	zfo/bIaUGy3/vXvjcUMX3RWh6t86AVJsi75VzWUEJFb4mEMgTQjvq73iw9sWCgmL
	TroCRDS+n4Hb1bzTnrYtQZon0yXq7tcyvoz4jk3gjFwHwThTMN3kIzlezqCGGqW3
	gW3z6rVB+FpGnPZAjhl7nxA9iy3lg9A0hbIsIj/YMlxSWu17ojSBpHRmEVlUmH9N
	fo/inZJOwQZgDiIOYCkD9XyEV7vHfvN4Xdx9Ed30i0itf3z8qleJqJ4OBmqQsbYE
	vLQUNOB6XOlMQpCU4sqW0VXuvOPIUnAT/AA==
X-ME-Sender: <xms:6cd_aqq7TqtpdBggwvkzj47epOo_Snb9S6TrQ1A-2fOLefMBOxvN9w>
    <xme:6cd_asnqAuhJ7TFXrE0RGKdc4YTz8GqXqwjSPcQYPSal_jLj7JVuD199C6yBfkLNb
    d03zMiUKIbg-x1o0gn4AoDDMlKYD7q3EGb0fsZD8UxwHoUsx1QH3fwx>
X-ME-Received: <xmr:6cd_anvNN3Ddyb7VNhaj9cCofTPgp-0Ne5S_14Yh7-7w703anzTtDB_7h2s>
X-ME-Proxy-Cause: dmFkZTFRuFyfAL9s6YMq/kkqcY6cqV0BuRPVTNbUdbYkEZvCej+PUWaiCWlYSljfJMo9lL
    a7WWdg2f0wOgbERSXkEJD3q/jR4pcr+3jUrcEu/0i9tk8FP2A1WP71XmMnMpKFlhXdywiR
    5G/WT9I+/G/JXPJWKB4n02FG17lVUANOd5ZK6Tu0lvN4SO8bJQyvTpQLVxW1UFUytGpBtv
    ESSNbFp0L0vlRX1F0oR2mTp0MlpE1y/ucZahg/3+xOr33nXycHDx4tAaM0qT0pcPV/B57X
    Mto3Z1zsK/HWRsn//Bnn1HwbaE9BIuNB76DyBgyi0m/f3AofUzUp+eivgDx5jtY31DSfY8
    akBtmWrPFoLz7+SHAfJcXQ43WBRJ6LbkHish8GNQnqODQGhp0CIkkuXhc2DMbPV2Oe88BQ
    Z3PSHagy6L7p7P8spEyn5mtuuh5nj8WWbB4CgI66ThTyB46Sp5YNPbpvwZdk65ycV+DsLw
    pF5tKE+wrWylqRm4F/E2fNc4lFfwx2NYj+ZLn4Rq8Y+kR89eSCO6joaHaukO/yZl5MhaU+
    Q8vstSiG6gG1wydlaF9Yl+wyDCxM4AMx0/UBb7p+cfp+pdq8A1Zc4sV6iBs+u6+PNOtD/u
    NyebvgozPVHioYKpet9ZEvfUuqsFVrzyGXD6Bbt5iHN8Ewhk6Kg68aAxS3LQ
X-ME-Proxy: <xmx:6cd_ajcQn3MwK3pXPN85d7c6W75H7rESxw_pozB02zlCpH4bBHdjYQ>
    <xmx:6cd_ahakx5bke2ZK0LNIHYK_MyORoVBpfbBpqxksAADJJSAoiz8-cQ>
    <xmx:6cd_aj2z_edwPGToHvRjGvCH9RDMAYUEwzhdb6M6CP1HZGpeYBkT8w>
    <xmx:6cd_aipFOyiPpABA0DJWmj_eZAbG6CYZoUA5T-zXRU-NJh22lHkhAQ>
    <xmx:6sd_aqJSX0DAzssPMscEkAK96MwoTAY7LBuGN_KPfO93oJByyltx8Ggj>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 14 Aug 2026 21:59:04 -0400 (EDT)
From: Kiryl Shutsemau <kirill@shutemov.name>
To: akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	nico.pache@linux.dev
Cc: baolin.wang@linux.alibaba.com,
	baohua@kernel.org,
	dev.jain@arm.com,
	hughd@google.com,
	lance.yang@linux.dev,
	liam@infradead.org,
	mhocko@suse.com,
	rppt@kernel.org,
	ryan.roberts@arm.com,
	shuah@kernel.org,
	surenb@google.com,
	usama.arif@linux.dev,
	vbabka@kernel.org,
	ziy@nvidia.com,
	usama.anjum@arm.com,
	agordeev@linux.ibm.com,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kas@kernel.org
Subject: [PATCH v4 00/19] selftests/mm: improve khugepaged coverage
Date: Sat, 15 Aug 2026 02:58:42 +0100
Message-ID: <20260815015901.1236937-1-kirill@shutemov.name>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>

mTHP collapse went in for 7.2 with no functional selftest coverage. Every
khugepaged collapse case is PMD-shaped, down to the detection: it reads
smaps AnonHugePages, which cannot see anything below the PMD order.

I am also reworking khugepaged's collapse mechanism, and that wants a suite
worth trusting before the mechanism changes underneath it. Nothing here
depends on the rework: everything passes on an unmodified kernel and
documents what khugepaged already does.

The table of cases is raised to 256 entries first. It holds 64, and a full
invocation -- every context crossed with every memory type, which needs a
directory for the file and shmem ones -- already registers 63, so the next
case added anywhere aborts the whole suite before a single test runs.

Five existing cases fail on the environment rather than on the kernel:

 - The collapse wait is a fixed three seconds, whatever a huge page costs
   to build. Scale it with the PMD size.

 - collapse_compound_extreme() wants a 512M folio from the fault path. Skip
   it where the PMD is that large.

 - The page cache caps folio order below the PMD order where a PMD is 512M,
   so nothing can hold a PMD-sized page cache folio. Skip the shmem and
   file cases there.

 - The swap cases ask a best-effort MADV_PAGEOUT for an exact swap count,
   and khugepaged reads the pages back in while they ask. Retry, hold the
   range out of the daemon's reach while retrying, and skip if the pages
   still will not go.

 - The MADV_COLLAPSE cases leave khugepaged running beside them, so a case
   can pass on the daemon's work rather than on its own.

This is why the suite now runs on arm64 with 64K pages.

Then the new coverage:

 - Folio-order helpers in vm_util, and folio_order_check to validate them
   against the kernel before any collapse test trusts them.

 - Four order-parameterized anon collapse cases, plus mixed sources by
   source order, at every supported order by default.

 - A shared-source write race: a co-sharer writing throughout a collapse
   and the collapsing side must not see each other's pages.

 - khugepaged_full_pass(), which steps the daemon one scan at a time
   through the sysfs wake path, and khugepaged_sync_check to hold it to
   exactly one attributed collapse per step.

 - khugepaged_race, racing faults, MADV_DONTNEED, pins, fork, mremap,
   reclaim and compaction against collapse, at both ends of the occupancy
   scale and over whole-table zaps, checked by content and by KASAN and
   lockdep.

Changes since v3:

 - New patch 6 stops khugepaged during the MADV_COLLAPSE cases: the
   per-order controls have to be cleared too, not only the global ones.

 - The shared-source write race did not race. The two sides now hand off,
   and the co-sharer unshares one page at a time (Sashiko).

 - khugepaged_sync_check no longer counts a tracepoint only the collapse
   rework emits.

 - khugepaged_race loses -z and -p: both occupancy limits and both
   pressure states always run.

 - -c refused the PMD order it advertised.

 - Smaller: two unchecked madvise() calls, and thread mask bits that had
   to be renumbered by hand.

 - The changelogs are rewritten throughout (Mike Rapoport).

Tested on an unmodified mm-new (33f61b12d297), with KASAN, lockdep,
DEBUG_VM and page_table_check, in 16G guests:

  x86-64 4K     181 pass, 1 skip, 0 fail
  arm64 64K     215 pass, 5 skip, 0 fail

The skips are structural: mixed sources declines at the smallest order, and
at 64K collapse_compound_extreme() skips as above. arm64 runs fewer cases
than x86-64 rather than skipping them: with no PMD-order page cache folio
the file and shmem contexts are never registered there.

Kiryl Shutsemau (Meta) (19):
  selftests/mm: raise the khugepaged test-case cap
  selftests/mm: skip collapse_compound_extreme() where the PMD is too
    large
  selftests/mm: scale khugepaged's collapse wait with the PMD size
  selftests/mm: skip khugepaged page cache cases without a PMD folio
  selftests/mm: make the swap cases' swapout reliable
  selftests/mm: stop khugepaged during the MADV_COLLAPSE cases
  selftests/mm: move is_backed_by_folio() into vm_util
  selftests/mm: add folio-order check for address ranges
  selftests/mm: add folio-order detection self-check
  selftests/mm: add khugepaged completion barrier helper
  selftests/mm: add order-parameterized khugepaged collapse cases
  selftests/mm: parameterize the mixed-source collapse case by source
    order
  selftests/mm: cover a shared-source collapse write race
  selftests/mm: run every supported collapse order by default
  selftests/mm: check that one khugepaged pass collapses one window
  selftests/mm: add khugepaged race harness
  selftests/mm: race collapse of windows with holes
  selftests/mm: add memory-pressure threads to the khugepaged race
    harness
  selftests/mm: zap whole PTE tables in the khugepaged race harness

 tools/testing/selftests/mm/Makefile           |   3 +
 .../testing/selftests/mm/folio_order_check.c  | 137 ++++
 tools/testing/selftests/mm/hmm-tests.c        |   1 -
 .../testing/selftests/mm/hugepage_settings.c  |  74 ++-
 .../testing/selftests/mm/hugepage_settings.h  |   3 +
 tools/testing/selftests/mm/khugepaged.c       | 524 +++++++++++++++-
 tools/testing/selftests/mm/khugepaged_race.c  | 589 ++++++++++++++++++
 .../selftests/mm/khugepaged_sync_check.c      | 196 ++++++
 tools/testing/selftests/mm/migration.c        |   1 -
 tools/testing/selftests/mm/run_vmtests.sh     |   8 +-
 .../selftests/mm/split_huge_page_test.c       |  62 --
 tools/testing/selftests/mm/vm_util.c          | 145 +++++
 tools/testing/selftests/mm/vm_util.h          |  10 +
 13 files changed, 1651 insertions(+), 102 deletions(-)
 create mode 100644 tools/testing/selftests/mm/folio_order_check.c
 create mode 100644 tools/testing/selftests/mm/khugepaged_race.c
 create mode 100644 tools/testing/selftests/mm/khugepaged_sync_check.c


base-commit: 33f61b12d297562321533c048e034b1fb21c1cf3
-- 
2.54.0

