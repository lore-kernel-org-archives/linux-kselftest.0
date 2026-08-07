Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A1F43CE44;
	Fri,  7 Aug 2026 11:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786102617; cv=none; b=Fu1rham5Mb43mMVbuW/6jKKCe+I1mhLvvQot6Sf8K+0e2TCL4xLF2mpshVrZJKzs0bfchVdO5dZlI/Jtpbm3Av/juI9ybNGQJI+V4mShMMl79Ag134+vYJsF9yFjNI6hiCSmgErIgU/c3e51nenKTTJTYoHnDSnZGX+vJuK2vJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786102617; c=relaxed/simple;
	bh=l+58xWjwYU6qFBFIFwIgSgTmyTLguJw3iz5b4c2dWLc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RlLnQkCrC4Fku5BDoLt9engFVN4i8nyB7Qd15GcutM/R9FwVCzYuQkukkw776sKYF9/WGRyGbP/NUYLhUV5tAokVDYEk6SUHWSnJ00eltg7uMNurwoXgLh+z9Han21FUEGCEJ19q/K+3EY1FZCgLG0r0FJ0YQGLXUKP3cOFObC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=ngzjnqbm; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=MWmaH2Zx; arc=none smtp.client-ip=202.12.124.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="ngzjnqbm";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="MWmaH2Zx"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 4A4857A0142;
	Fri,  7 Aug 2026 07:36:51 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Fri, 07 Aug 2026 07:36:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm1; t=1786102611; x=1786189011; bh=/7jsQrIbzn
	19+sYtVT/GhaKljtMWZ0G33nxI8KatKSI=; b=ngzjnqbmMvevnRwtiecq266vOW
	ramezw1xQQgiNwe6KeC8Ni33sNGifw2HAnAfPuTVa6H0bEj94mgtYnXcsuY8kmBc
	JpPXMkUVRlgUYV9F4iwJoFc7I0K7aZy/iZhZE5qacwgJ5J+DOC6d0iS/xRNfM5vn
	Lo2IAZqfDxnv5xO4RHqutZCrh176KbgDJbPzuF5FSin2YgGb2htn5BDZRaBVYux0
	1MOpl1LQFaBd+jpHMigPQy+epHsFoC/YKXP7Oa609wSKkWfqToYQ97BX5bGXvG94
	oLE7v2hkSqiN/MnKrWbVW7pxDvfzr8GWMl5yhIqPtwKXsyvp7ox34JuwZ01A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1786102611; x=1786189011; bh=/7jsQrIbzn19+sYtVT/GhaKljtMWZ0G33nx
	I8KatKSI=; b=MWmaH2Zx2r38eI7ZrPNZ2lz4p1iqTnNnOQGnfPlLp9hvtZBbAi+
	KPVDFxn0rWwg7D+Jl2MebxuthLX+GNzoFKq72GbS23RTDYspXEMgAxFpgeIiaxTA
	5jVrehWnQewKd9rTR+isfvPZyE70pye3U1YUeQtNF7ySvC+ubLug/5dP5vmzvgUi
	1eOfdl/YfaM0EIIclduTKRFDMV9RjfcvHqRBnT6CEmp54HPYPnSr7Om3bvrrqXu5
	6AF7dm9MyeHeYoz9Sz4v/zif3+vQwvx/uqtz86w3Qiu0iZAY6NUKX/aaP5NSkHTC
	mqTsBEJTMzk2MEUUNRsWuAudfqvUhxLg0IQ==
X-ME-Sender: <xms:UsN1asWG8Lb3P4_v_j0wFf5dx6e5Um9nDXlCKNcj8jaisk2-y7lZ8A>
    <xme:UsN1akinRN8OceKEc1nCLPQ7-7A87ebgRU6B4FyNBJimMtwemf4jAGVuMdybJEhhk
    syiRAIqqp7UH46T7lU3P7Ey8bPXkAGvv6DuC7EMXfsxsAAhn21yhgM>
X-ME-Received: <xmr:UsN1ao4po616H4XTGZ9D6o7FarB4iQa0GvKw3tM3yZdCoNxizh-UHOoA1zk>
X-ME-Proxy-Cause: dmFkZTGGbcKF91G3kKBPdQdfGAqwgj4jJD8rhUNE8c6OZrt28RbY7MBfPY5T2XA2NKYgwv
    ZTylnfl0Y957VXOeUFwRafVuNLvcxQPDCnGJTv2hzikb7PeKJ1TkAXUCp8R5AaEXR6rvE4
    BwWHrn4IJoZ3iJqNezHovEDeIbZzOTFXVExazjv04QEn1HQGUc3lpcV3jNbksSgImuG0w0
    ofGfilsHrtoBy1HzadX0MKrhnCmx/qIibu2LGJ8twqExJSbbeDPtloKDU6pah5eQvsdlPI
    n5UDpXaztFgXetxiP1pTB4kbntVjUEQ2iNQEzXInto2JWVAHxirRWuAhuxg4/QsgfVPHfS
    OkhIBrRX1AwIZkhEiIIL6Nxadqoa86/8wdTXQwvqxl+sbDeqIq/OG6UKa9xo/bgn3DpwIk
    2lFMCfkXdm5f6iDSehRY8BDvelp9+XBSWM6qoZQXjAfGZ+LXA/a32P6Z5evQmINkFzCefL
    +iDYlqMzmPxWQyIUNzQkDRQ9Xj7Nq4g7Itx1VY8DnUXVhoEcp4YoSJxWfU9rYRbzJ9Kf31
    BnwebMTuJjTnYaX5+3BSdh7jUlhz0ESakt1VCp/FNeaMzM60qC/fa9PsYrp1d+MuSDcyZH
    mNledqGB203AevEVMPWt1K1Df96O5mxLA9uqV4ZzCOA+9L51+Bh3VG/avdVg
X-ME-Proxy: <xmx:UsN1ak5WkmozBEv_UdOOzUAldoDJTpfF-8rD929Ip4bEIXvwvxO6Ag>
    <xmx:UsN1auElidw4J3MiKthVPM7DPgzbd7qwHrvryBHxcKL1aYN_68XtUw>
    <xmx:UsN1aqxYIieUWLGpfSnVUXiSFZivzPUUQKQyXz4gN5hJzMSZdn-jlA>
    <xmx:UsN1am1vy7twT87ZlIw1DoydZCRGD5zonpYi4C4AOEyAyfx38gH-tg>
    <xmx:U8N1agp9FYOEEgfWxeKW6eLqhouq-PbCerwC-36G12ej0-GruFhem_vr>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 7 Aug 2026 07:36:49 -0400 (EDT)
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
Subject: [PATCH v2 00/17] selftests/mm: improve khugepaged coverage
Date: Fri,  7 Aug 2026 12:36:30 +0100
Message-ID: <20260807113647.3744609-1-kirill@shutemov.name>
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

This version sits on top of Baolin's anon mTHP collapse selftests [1], now
in mm-new. His mthp_khugepaged context and per-order detection are what the
new cases need, so they go in there rather than bringing their own.

Four existing cases fail on the environment rather than on the kernel:

 - The collapse wait is a fixed three seconds, whatever a huge page costs
   to build. Scale it with the PMD size.

 - collapse_compound_extreme wants a 512M folio from the fault path. Skip
   it where the PMD is that large.

 - The page cache caps folio order below the PMD order where a PMD is 512M,
   so nothing can hold a PMD-sized page cache folio. Skip the shmem and
   file cases there.

 - The swap cases ask a best-effort MADV_PAGEOUT for an exact swap count.
   Ask again before calling it a failure.

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

 - khugepaged_race, racing faults, MADV_DONTNEED, pins, fork and mremap
   against collapse, checked by content and by KASAN and lockdep.

Tested on mm-new (8086604be973), with KASAN, lockdep, DEBUG_VM and
page_table_check, in 16G guests:

  x86-64 4K     190 pass, 1 skip, 0 fail
  arm64 64K     228 pass, 5 skip, 0 fail

The skips are structural: mixed sources declines at the smallest order, and
at 64K collapse_compound_extreme and the shmem components skip as above.

Changes since v1:

 - Rebased onto [1] (Baolin Wang), which this overlapped and which is in
   mm-new now, so this applies on top of it. This series' own -o mode is
   gone in favour of his context.
 - A plain ./khugepaged and ./khugepaged_race now run everything they can:
   every supported order, and every mode, occupancy and pressure axis.  The
   options only narrow that down (Mike Rapoport).
 - The fixes to existing cases come first, then the infrastructure and the
   new tests, each next to what it validates (Mike Rapoport).
 - The completion barrier helper comes before the tests that use it, so no
   case carries a throwaway implementation of it (Mike Rapoport).
 - Changelogs and comments rewritten to be read rather than parsed
   (Mike Rapoport).
 - One new patch: retry the swapout, which is what made
   collapse_max_ptes_swap flaky at 64K.
 - Dropped the swap-skip patch, an equivalent has landed
   (Alexander Gordeev).
 - Review fixes: masked failures, system state left behind on bail-out
   paths, arguments taken on trust (Sashiko).

[1] https://lore.kernel.org/all/cover.1785985999.git.baolin.wang@linux.alibaba.com

Kiryl Shutsemau (Meta) (17):
  selftests/mm: skip collapse_compound_extreme where the PMD is too
    large
  selftests/mm: scale khugepaged's collapse wait with the PMD size
  selftests/mm: skip khugepaged page cache cases without a PMD folio
  selftests/mm: retry the swapout the khugepaged swap cases rely on
  selftests/mm: move is_backed_by_folio() into vm_util
  selftests/mm: add folio-order check for address ranges
  selftests/mm: add folio-order detection self-check
  selftests/mm: add khugepaged completion barrier helper
  selftests/mm: add order-parameterized khugepaged collapse cases
  selftests/mm: parameterize the mixed-source collapse case by source
    order
  selftests/mm: cover a shared-source collapse write race
  selftests/mm: run every supported collapse order by default
  selftests/mm: verify synchronous khugepaged driving is attributable
  selftests/mm: add khugepaged race harness
  selftests/mm: race collapse of windows with holes
  selftests/mm: add memory-pressure threads to the khugepaged race
    harness
  selftests/mm: zap whole PTE tables in the khugepaged race harness

 tools/testing/selftests/mm/Makefile           |   3 +
 .../testing/selftests/mm/folio_order_check.c  | 137 +++++
 tools/testing/selftests/mm/hmm-tests.c        |   1 -
 .../testing/selftests/mm/hugepage_settings.c  |  72 ++-
 .../testing/selftests/mm/hugepage_settings.h  |   3 +
 tools/testing/selftests/mm/khugepaged.c       | 466 +++++++++++++-
 tools/testing/selftests/mm/khugepaged_race.c  | 571 ++++++++++++++++++
 .../selftests/mm/khugepaged_sync_check.c      | 217 +++++++
 tools/testing/selftests/mm/run_vmtests.sh     |   8 +-
 .../selftests/mm/split_huge_page_test.c       |  62 --
 tools/testing/selftests/mm/vm_util.c          | 145 +++++
 tools/testing/selftests/mm/vm_util.h          |  10 +
 12 files changed, 1599 insertions(+), 96 deletions(-)
 create mode 100644 tools/testing/selftests/mm/folio_order_check.c
 create mode 100644 tools/testing/selftests/mm/khugepaged_race.c
 create mode 100644 tools/testing/selftests/mm/khugepaged_sync_check.c


base-commit: 8086604be9733378461a5534c39cb72635226b23
-- 
2.54.0

