Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B6453A8B2
	for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 17:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792000687; cv=none; b=SgfRt9IEjGpUnYXLxj8Nkzgqpi5gSYm8ar6exRWVrBxAx9RrePfcTHkYpVJzC0HjUnKbQxUh1XPaqAgsxgbAV6Xjq0f/TPNv1HzavEMB0zQUKQ1B9DU7wsThCom6HYx4y6DwX3OT13KmNrJdw90cnrU3hygJqa3ZShVh5/7AhDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792000687; c=relaxed/simple;
	bh=FBmwn916LLSSRyJnKsX/civGmonRB7otzki+K0LJS1Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NnajuHSr3Wa6u9H8MhoZAwit/Oce1LNAkTKEOj68NwSNWPPO/lvN53xi69vsmA9HcPgGyZlFQZq2qZifSbtBEGiSNKqGFbh+7qps8etYR0OMfrD/VsHHTalIEUTAFzIh4gMkpXp3edV6xpWf/KUwty+Wdw0/NvBt54m2S8SHwFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=fao2PTrQ; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="fao2PTrQ"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-93e63ee7b4cso375830385a.2
        for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 10:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792000685; x=1792605485; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SbfLgUW9jzchO6/pfPCWGcSWUMfF0/SvwGcRabdT2ZQ=;
        b=fao2PTrQIGOZZDrGj0BIAoz7Dd0wBLVLC94ArSJGwbDPL8S6jFudHQzHh++jh6TAB8
         nO6VSD/LRCiVd+iY+RkhpMRunVWbpfPUTVUgyzchCAwyLI7hKgqVwEgmZ0cijLTdVnNH
         KnPRzXA8oVuUOH/8TXjyH3tVfZyOwlvq2T7XU+28/ruQ4ZocZvnHEGdQJb+XOvjCzlQf
         aXM9cTPk0LN+oKc5DTDeqbdHGq5fM3B3RZXUuCr5YPBCz42DsEFKzX/d4WNfhlneI6a3
         KY23ub7yTLpjguOufRZQj75RPTorF8cFhf2hB3rBFsdSBDACCfC7aCyTi5Vq778Gaz20
         gcqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792000685; x=1792605485;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SbfLgUW9jzchO6/pfPCWGcSWUMfF0/SvwGcRabdT2ZQ=;
        b=HCoPuDi4bPUczUVIi/WqFDUDJnoRVNOIKy42gfqC0nSmk0L9SxuhzNGTGBvVj2a04V
         LXSfNrV4CyYeW/4XrbkVtvYc3BE9hlmlvphx8r9+qTjP87uRHSaFWFNvzouLBAdYt0YG
         ciuXto9l4mrC+R1G+59EtP2YqpR1p/cGp0R7Zjp5cjJdRFY1Rdcr6y1ys3e8aBAOd7p5
         2CavDHhlq73pR2OXclrlPcQmKPdRuH/9q94MFAriBSn1vrP5CUsXZaBXBvxA3VCCIifp
         N/k1fMOjfwYwh4UxKYRu1dgqSF4QLqG/IBdAy0j9VKvmzKssOwT66w54NYKt034tB+3s
         PaOA==
X-Gm-Message-State: AFq9FYLFOlMH46VqoQUdtSkiKUJs7VSS+V2WCs3b4HZ0auIb6ZPSbgmn
	f7nBxImyxRq/T1MpyYNTqkvKBuuyzqzNyDmv6PFU9e/NNG3KFOY4J2lYWDEI7lD7uUlj1WIJNa2
	L02SuwpM=
X-Gm-Gg: AYBFou0Z+KWdJIeaeCPupyRK1TWVesckTMLKwJovYEzsxcfVYqcBrkCuRAkXj8i/hCe
	RBpbgdFN+JYqO/x3m5WV48v27yyThCkTn4v54DH+cDv3zf7zRGwXb5OolWqrElHWT0/iLx2+vOG
	Jwk0p7oUZi+ah5trsL52Vj1eLNZR7AU4Lf0IBcZXNswiXKa7KqPTvQM+S+AL+uyGso6IES8zXXS
	p3wULTj/AZoqtiMv1ZzYjdUmBwg6zT3fk0Fm/XiYzLJdDvkR99PsPpjydYzabN6D9wGuC29IoA5
	xIPP/k+xPOuOmd+5BafbcJsdIFBDZSnjZ5BerGhr5tOTT5iGe1fMqJeTf1cuacFa7jwqHqD9wjA
	MyRyA8JbGiwQ42LOcjXVIIhlH8qnp+jAFWpEfnOeZ4hDgMJyCFNSKLQGPL94YWCyF9iyqAaK4l+
	MkcujHCYxWbN/vu0gM8dA0diuvnpID++/hWbevnDLBVmthrb/RaUPSYQ9TOCxeRhMOxMNZzDrYL
	WmKxR9fQQgbeTmwgRQgCEhO2LrVBlFvEG5FMGrNgGQod4Myx25Hc8pFXzIZJ190+Sjp9jk=
X-Received: by 2002:a05:620a:4591:b0:939:6dfa:48fd with SMTP id af79cd13be357-93ebd23398emr2633773185a.51.1792000684921;
        Wed, 14 Oct 2026 10:58:04 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97b95847sm58498006d6.32.2026.10.14.10.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 10:58:04 -0700 (PDT)
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	shuah@kernel.org
Subject: [PATCH 0/8] selftests/mm: add MADV_COLD and MADV_PAGEOUT contract tests
Date: Wed, 14 Oct 2026 13:57:48 -0400
Message-ID: <20261014175756.2035176-1-gourry@gourry.net>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MADV_COLD and MADV_PAGEOUT share a page-table walker in mm/madvise.c
that handles ordinary PTEs, PTE-mapped large folios and huge PMDs.
Existing selftests cover little of its range, folio and permission
handling.

The walker has needed several fixes recently, and it's clear we need
to refactor this walker to make it maintainable.  Ahead of that, lets
add some selftests to at least cover contractual behaviors.

This series adds tools/testing/selftests/mm/madvise.c to test only
behaviors userspace can rely on, so that it stays valid across changes
to the walker's implementation.

Each patch adds one group of tests, simplest first:

  1. MADV_COLD skips PTE holes and swapped pages.
     both hints reject locked VMAs
  2. the same hole and swap checks for MADV_PAGEOUT
  3. zero-length, unaligned and partly unmapped ranges
  4. hugetlb VMAs are rejected
  5. shared file, shared anonymous and SHM_LOCK'd memory is preserved
  6. whole and partly advised THPs, including that MADV_PAGEOUT never
     reclaims pages outside the advised range
  7. the file permission rule in can_do_file_pageout()
  8. the same rule for large file folios mapped by a PMD or by PTEs

Tests that need root, swap, THPs or hugetlb pages skip when those are
unavailable, and tests that need a page to be reclaimed skip when reclaim
does not happen. Where a skip would hide the bug a test looks for, it first
checks with a control page that reclaim works at all.

All 24 tests pass over three consecutive runs, with no skips and no
warnings in dmesg, as root in a virtme-ng guest with 4 CPUs, two NUMA
nodes, a 2G swap disk, 16 hugetlb pages, THP set to always,
CONFIG_DEBUG_VM and CONFIG_PROVE_LOCKING.

Run unprivileged on a host with swap, 18 pass and 6 skip:
  - 5 need root
  - 1 needs reserved hugetlb pages

original set: https://lore.kernel.org/linux-mm/20260922235830.2350770-2-gourry@gourry.net/

Gregory Price (Meta) (8):
  selftests/mm: add MADV_COLD and MADV_PAGEOUT contract tests
  selftests/mm: check that MADV_PAGEOUT skips holes and swapped pages
  selftests/mm: check MADV_COLD and MADV_PAGEOUT range handling
  selftests/mm: check that MADV_COLD and MADV_PAGEOUT reject hugetlb
  selftests/mm: check that MADV_COLD and MADV_PAGEOUT preserve shared
    memory
  selftests/mm: check MADV_COLD and MADV_PAGEOUT on partly advised THPs
  selftests/mm: check MADV_PAGEOUT file permissions
  selftests/mm: check that unauthorized MADV_PAGEOUT skips large file
    folios

 tools/testing/selftests/mm/Makefile        |   2 +
 tools/testing/selftests/mm/ksft_madvise.sh |   4 +
 tools/testing/selftests/mm/madvise.c       | 846 +++++++++++++++++++++
 tools/testing/selftests/mm/run_vmtests.sh  |   5 +
 tools/testing/selftests/mm/vm_util.h       |   1 +
 5 files changed, 858 insertions(+)
 create mode 100755 tools/testing/selftests/mm/ksft_madvise.sh
 create mode 100644 tools/testing/selftests/mm/madvise.c

-- 
2.56.0

