Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C7E43D502;
	Wed, 12 Aug 2026 13:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786540991; cv=none; b=m1yQv0d8anYPiYDP3NSdSIMsIJW/hF6wftJRke41dqvXkz1lVL8hcLulOBQ1yR8fQbAce7xTP292ceAIMCKIHJwHvhmf0gtBW7z0OSe3caYBjL+xiLjTOm8mP4JssmNA0PxGTCYnM2QNVLGFWEPLT4N/nuYpcPEgwmbwUGaZNIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786540991; c=relaxed/simple;
	bh=wxMjOKrLHjwC9whSMrESb4POYGCTj0egbcwdpaNDI1s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HbjxtLgwNy1QuDSopi57tXGmKfqEEUOqltfHwrbsGWGUp32PxpMjPNs6ol3TdGWwi6EW+aMmV57afiIDJk+NLuv14/0QcLcAsY39VSp0PDTVlkkZ/qTGcmo9uCAtRtundqTy1Jtc3oR7C9UHcUrj1hAO7ZHX77Z/hst3XkzYw2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=tOf1Y34R; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=C+4oQZby; arc=none smtp.client-ip=202.12.124.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="tOf1Y34R";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="C+4oQZby"
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfout.stl.internal (Postfix) with ESMTP id 764FD1D00171;
	Wed, 12 Aug 2026 09:23:07 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Wed, 12 Aug 2026 09:23:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm1; t=1786540987; x=1786627387; bh=XrYEOujHJz
	UObdVV5e59kZmlODSCAV/JfjqAsdoYI1I=; b=tOf1Y34Re3BxH/v6MRYyPsWK0u
	fX6e+hVUX/OrSpaAG25o/q0vGv5hlEz+Vfle4Nb99cfTBLMJ7tXeDlJ5CTtVl2qk
	NBxQvNmbFCWkXb7BunJlGeKx+46mqQDtxxEegjTar+kbYrLKjtBakV6Vdgiz9tq/
	YYMUrWy/Gq2vkBPze8EibCqzZjyMYQQfYu/pgBufUCt3wDMZqh91CIDbRKcn+ze+
	ZcWqYlolXg7TpSqjorFXVyHWhkh8yXPYFxClDwYW8KW/drm8DKjWxerdl8hszVxL
	qBH6iwKFEn78RP8S+bbhtNqmbQ08XVNw5g6je/ETld7Ot/QPAPUZvSXgXJyw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1786540987; x=1786627387; bh=XrYEOujHJzUObdVV5e59kZmlODSCAV/Jfjq
	AsdoYI1I=; b=C+4oQZbyLVMe85cLif4uV75JP3nJ8XvRWwnAgBgZen9MmbcPVjW
	qLoi6v/cDVZ5jChQmROlI9I7XEwtIfIWgAkulHEEIIxe7i3rPhtncadLlGL6V69I
	oWacyusU5plPPHOXbtOHwrKb7PfU+YUvfz1pgW3J+RK9cB/NUZRgykp2h+zq9Bkn
	9WgD5xDIxneKz5sZ+Nq9zuOCbi6Q8VCNt5cv36g/nWQYZDfqCJy7zmf0CSFaU9eI
	5P+y614HzGsTaphOZbU/xm6s2btq4NEhZPfXt2UgHkSR082ocKy/vvIX6+GHOE9n
	wvDstYzohLDvy059kkEdAwZRuz+qt5G/puA==
X-ME-Sender: <xms:unN8agHeDebdDBBlX-Kw2fGPfWMCVKQB0wImGCzdVpW3aRdebqF2cg>
    <xme:unN8atSzcr7yVArgIUxAQLrxJ9yN3ieQlDBYKqUoZdwsKzCKMDylUp4am1MB7FA8h
    Jn0OFPhAeOwtPy5J6dIn2rlGWa774oHFgiOiLeg2g_SGumv2ieJHA>
X-ME-Received: <xmr:unN8aipJlAzCcoduGeDacpZwJ3Ep3KCfDmHxKvpA-9Zr0RWPBDDdzOjHs8o>
X-ME-Proxy-Cause: dmFkZTE0/6XLAdQFuqe44OQHQeQYRpS5iWOZ9DFlKOuRxnmuw+2GfVqaAiNkcXyOtuigLI
    6v82YTSdHIga4gx61944e7Qf87G47WYGz4xEEoCuS6EFC+GQXBFwAPVb9FgxxzH5Zq9rlP
    OLoJeE6ARflaPRwnHFvhyT46A/5zwH73Hgpdc46yI24U8XmHHx/gE4zJXMii7mICcPkvND
    +0bTxM4TQu295Z3nqrKFSbaaLsHAvGNagbUtaAjqWcR2fHZgJsTKHx91jwff9hR3kciuLq
    cjXd8aSfEHXK/WxOVzgWa7Y5MqC2ejh+khrzJoVTyV/dzHlUC/dBVbC3hKqHsqm/5KLxPi
    vviH1b44pwD1lfuaviRWM3HNi45cKC+NelKEwR8mIYftz12ccMr5B5Sge4MidsOXNYmaR7
    GZTB0Y6E1zgAJC3CO4VxEp61+Kb9/43O+B6cHds2U+zKlbjMMj5lmzI1Gs3HWR5SdyV3FO
    fGV61t8ydZighv31h9n2mKBGPtDXOpRqqnqlJvj9SQuAz5XV3ynrXRjINmGdCk5L3YFLUe
    w6NK7QC2/xQyNg0nhts0AHZy2UWM2aM4rLc3AniePdaV+YR+4ITpcGIGAd8AaUZ8CcD4cQ
    UjMx3/dNwN8YwmmpDBQfj4U0S1wu3rZ+F+lQwfkddrwc/K0VBXNghs6nh/UQ
X-ME-Proxy: <xmx:unN8arrzcuURkDdvxTDKWg_ssIVXwbay3dvDN82LBtojB7ogFk8eMg>
    <xmx:unN8at00K8NdUeVZj00Qr6byX6rxuUDJ14mpJ8sEHyE3MLJ_KuNDpg>
    <xmx:unN8avgh6Uto6WU3thZ2_gl28J6T_vT1dIwn3YSMFXVF_lUo11if1A>
    <xmx:unN8aslsWXdfCDDeUsnX2QRL8Qxo3TsmfLprOE9jeYgInOqlCwdwIA>
    <xmx:u3N8amnAYmt2ev33EjNgNLCzgTJm8mE91geigVe_VccGWrE14o-2AHlz>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 12 Aug 2026 09:23:06 -0400 (EDT)
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
Subject: [PATCH v3 00/18] selftests/mm: improve khugepaged coverage
Date: Wed, 12 Aug 2026 14:22:46 +0100
Message-ID: <20260812132304.199287-1-kirill@shutemov.name>
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

Four existing cases fail on the environment rather than on the kernel:

 - The collapse wait is a fixed three seconds, whatever a huge page costs
   to build. Scale it with the PMD size.

 - collapse_compound_extreme wants a 512M folio from the fault path. Skip
   it where the PMD is that large.

 - The page cache caps folio order below the PMD order where a PMD is 512M,
   so nothing can hold a PMD-sized page cache folio. Skip the shmem and
   file cases there.

 - The swap cases ask a best-effort MADV_PAGEOUT for an exact swap count,
   and khugepaged reads the pages back in while they ask. Retry, hold the
   range out of the daemon's reach while retrying, and skip if the pages
   still will not go.

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

Changes since v2:

 - Raise MAX_TEST_CASES before adding cases (new patch 1): a full
   invocation aborted and ran nothing, at seven points in v2 (Sashiko).

 - The swap cases hold MADV_NOHUGEPAGE while paging out, and skip when the
   count still does not arrive, whatever the reason (Alexander Gordeev,
   David Hildenbrand).

 - Bound -s and -c: an out-of-range order indexed past a struct and shifted
   by 65 (Sashiko).

 - The mixed-source case skips, rather than ending the run, when the
   allocator leaves nothing of the source order (Sashiko).

 - khugepaged_race: clamp the zap and the pin to the shared areas, and keep
   stdio out of the forked child (Sashiko).

 - Name runs skipped after corruption the way finished ones are named
   (Sashiko).

 - Drop migration.c's ALIGN, which clashes with vm_util.h's (Sashiko).

 - Rebased onto current mm-new.

Muhammad's Tested-by is carried onto every patch whose code is unchanged or
only mechanically changed since v2. It is not on patch 1, which is new, or
on the swap patch, which behaves differently from what he ran.

Tested on an unmodified mm-new (480a31230b42), with KASAN, lockdep,
DEBUG_VM and page_table_check, in 16G guests:

  x86-64 4K     104 pass, 11 skip, 0 fail
  arm64 64K     102 pass,  3 skip, 0 fail

The skips are structural: mixed sources declines at the smallest order, and
at 64K collapse_compound_extreme skips as above. arm64 runs fewer cases
than x86-64 rather than skipping them: with no PMD-order page cache folio
the file and shmem contexts are never registered there.

Kiryl Shutsemau (Meta) (18):
  selftests/mm: raise the khugepaged test-case cap
  selftests/mm: skip collapse_compound_extreme where the PMD is too
    large
  selftests/mm: scale khugepaged's collapse wait with the PMD size
  selftests/mm: skip khugepaged page cache cases without a PMD folio
  selftests/mm: keep khugepaged out of the swapout the swap cases set up
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
 .../testing/selftests/mm/folio_order_check.c  | 137 ++++
 tools/testing/selftests/mm/hmm-tests.c        |   1 -
 .../testing/selftests/mm/hugepage_settings.c  |  72 ++-
 .../testing/selftests/mm/hugepage_settings.h  |   3 +
 tools/testing/selftests/mm/khugepaged.c       | 499 +++++++++++++-
 tools/testing/selftests/mm/khugepaged_race.c  | 610 ++++++++++++++++++
 .../selftests/mm/khugepaged_sync_check.c      | 217 +++++++
 tools/testing/selftests/mm/migration.c        |   1 -
 tools/testing/selftests/mm/run_vmtests.sh     |   8 +-
 .../selftests/mm/split_huge_page_test.c       |  62 --
 tools/testing/selftests/mm/vm_util.c          | 145 +++++
 tools/testing/selftests/mm/vm_util.h          |  10 +
 13 files changed, 1668 insertions(+), 100 deletions(-)
 create mode 100644 tools/testing/selftests/mm/folio_order_check.c
 create mode 100644 tools/testing/selftests/mm/khugepaged_race.c
 create mode 100644 tools/testing/selftests/mm/khugepaged_sync_check.c


base-commit: 480a31230b426efb005b6e71a14ef80f405f18b6
-- 
2.54.0

