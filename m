Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792429931;
	b=igYcAsNaZ1NDFLQx9bOvpVsSEa7pmVbuOLrUB21lYkF3L9pwxn2CgY9GUTCPwWD4t2qx
	 ZEBq4XgULwnKDqibXnlAZ/7iofA8QP3/1VSyi8xS3zKejjH29naRzVLKP3Gtfm0MZ41p4
	 4kBJehW78U69MWoNLqPpDq6Gr85hFHtElBsSuXZzgBL1ErQE8dns/As5tq7BeMUAkmjq3
	 L6j7fnxsFEELBhnQLjojT2gY84BOKxFNAzRHp1sMS6zU6coAEo7MKhHB7Zp9XLLkIkpJ6
	 MBDG3HjA54hSU0s3oLzQc1cXxdXaIgUlOb3aAm/ndOvkE+5SVuYxQJs57DkTPv+t7TA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792429931;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=m1D9F1bqmtuCwdKBGEYxURhHSspZbk4MECxRgLpYlqU=;
	b=rwUssB3CsZI9x9HiOFAKZucRRqN0lIOLdA/RnftaF67OxNkboicDg/c7bXcyNmsUUuM+
	 BmDLCW7ZlLkThSB0S8KxVeK52a8bfNadG0AYhFuVYKBWAQZKgwVw+USkK7vdd/8EteKGB
	 JErcawNCFXj+YFqXvXGJhCENMx7Jt0DTYuWKtHUKBgfAvk3JXqJCJPTvfTyTtjcKbx55r
	 VTo2kgXrxQrrQ85ebXckIXkaFZPFlyl39Mw+wo1zeukS1pNyxDR6l5xN4NTHZtJzPCpiG
	 p7qO4P7MnYzoc4hbSfTwV1a0DWo9VVvACzMacnMCWE9rTZe6sOwgoxbYOPRE3nUTedA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=Gke81E9Y;
	arc=none smtp.remote-ip=209.85.219.46
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB94606A319
	for <linux-kselftest@vger.kernel.org>; Mon, 19 Oct 2026 17:12:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DB94606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=Gke81E9Y
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-91b9e758c50so34736056d6.1
        for <linux-kselftest@vger.kernel.org>; Mon, 19 Oct 2026 10:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792429929; x=1793034729; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=m1D9F1bqmtuCwdKBGEYxURhHSspZbk4MECxRgLpYlqU=;
        b=Gke81E9YMRqD70QbPYOKY8+egqIdtFY/NtyhSJsQB6BmNXSACg2i/H31knMUYZBP1X
         pLfR4sIgZzXFWvrGVeIsNkphVTx1KBEV7BjYpEgDXFc95t3ZjAiq/iwc4zH8Pt3Y99Up
         S2HnfxegeKneF0K7JT+Ith0wRzxjwacP8fXjV69cR1adfZVnME4r/RzvXQ9HbORUUPV5
         s6nlVjAC1GeYquzTD7HEV2wzaOrOHSr6kRFczm7rBRXr1HcxBTjwvOHpLH126SytE50E
         HIciMomjjX/1UDoHmWIh0qwC7j9XcdvTOarcBgXStUqBc93DlhRL96Oh6jFPWoy/nkRo
         qZ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792429929; x=1793034729;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m1D9F1bqmtuCwdKBGEYxURhHSspZbk4MECxRgLpYlqU=;
        b=qP59UbUC23Nus+9Qhw0NZWxU/Vm7UXeop39J5/6HtWM5kICe6KEWmjRG38Mt+C+srJ
         J9VyxIU8le716hRLcc0r6YXdt01XqyAsC8e1wouHw2xrgxc27TGO0BDMahrY8kI8pwXF
         sinHMDTIs3eHCxgb6jMtV01PziXzUdLzl4OynGiSncl5UFfch31+ohfarCRawyj0/KT1
         O+IhE1ekiwOXWnH+bMwDPfTDKKcJ91mVCh9VF2zr6uyz0VJ1TkQaknYhoizk8mXwFZg5
         6QhKt2GyHXyf+Nt7T9f/4kazaGF6FQYaQHDaStzE2UwREApKWbmg4ewxIV5T0jItqJSd
         tJQw==
X-Gm-Message-State: AFq9FYKRD844HyOcsnhth8UM9vUCfTKi8LRK0gwFuMDreKXWxfmwIdut
	3BW1qjBbazxmr7sKPQMe6mGBg3iKHd8uvgesFGjYeJlzYZdSF6oxDDpK4G9zse7DyH+2QCFqEEV
	2he22FdY=
X-Gm-Gg: AYBFou0Ue6GjmP30BFU78WByBaYFbrZtukHyt9nHLNXouITCF5fjkXkEXRWdd9z0IW2
	u7w7k05NW1O7yLfQ2XyXVJfLGr+Q5M0OgrY9JGq2LZCZ65usiapaOedwQlOw/UWz4O93gHMSIS4
	qTvHDWULw4QojRmJmAGMvguhv030ZTwZDWly1O4SKiepcmkafb//VHQiPTrhwDG5chCRH7bFTJu
	huPcrWOxJ61YqdyKyEtZOXU0psHFCBmlIQq8slRgWEssscne6npUqO10u/CK1d4+HX6YeYqMk0t
	XriRJijMH9iyz9J5vhqJExPNlnwY+so9IhWE1D1MXeCMBBfLKBa6u94kCxuYY+ZKdjJ6xvQ2rgI
	VP02LdkmySWlapxvoCNcMP5aGkH/eei3muzsusF4atFWcvtMEr5KGP663vkLExWocB2nQrOvDwa
	xrvkD/wFW6NB92Q/Tj6rScON8fuiZF8KE3a6uPDkNJ5g9MfPMcvcfXTgwfCgQnrCZIHmgNgU89Z
	H0sX5isMLB/IMxC3pHpVN30QbYhV7h8R3xKr2H8uBMvUst1zBB/h39PhNmw
X-Received: by 2002:a05:6214:19ca:b0:91b:5d39:e135 with SMTP id 6a1803df08f44-91bc96fb591mr195486326d6.32.1792429929055;
        Mon, 19 Oct 2026 10:12:09 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c040d4cedsm723116d6.34.2026.10.19.10.12.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 10:12:08 -0700 (PDT)
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: linux-kselftest@vger.kernel.org
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
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
Subject: [PATCH v3 0/7] selftests/mm: add MADV_COLD and MADV_PAGEOUT contract tests
Date: Mon, 19 Oct 2026 13:11:59 -0400
Message-ID: <20261019171206.3331374-1-gourry@gourry.net>
X-Mailer: git-send-email 2.56.0
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

MADV_COLD and MADV_PAGEOUT share a page-table walker in mm/madvise.c
that handles ordinary PTEs, PTE-mapped large folios and huge PMDs.
Existing selftests cover little of its range, folio and permission
handling.

The walker has needed several fixes recently, and it's clear we need
to refactor this walker to make it maintainable.  Ahead of that, let's
add some selftests to at least cover contractual behaviors.

This series adds tools/testing/selftests/mm/madv_cold_pageout.c to test
only behaviors userspace can rely on, so that it stays valid across
changes to the walker's implementation.

Each patch adds one group of tests, simplest first:

  1. neither hint populates a hole, faults a swapped page back in, or
     accepts a locked VMA
  2. a zero-length range succeeds, an unaligned start fails, and a gap
     fails with ENOMEM after both sides are advised
  3. neither hint accepts a hugetlb VMA
  4. both hints preserve shared memory, and MADV_PAGEOUT leaves a
     SHM_LOCK'd page mapped
  5. paging out all or half of a THP reclaims only the advised pages,
     and MADV_COLD on half a THP leaves it intact
  6. only a caller that owns or can write a file may page out its pages;
     anyone else only gets their private COW pages paged out
  7. nor may anyone else split a large file folio, whether a PMD or PTEs
     map it

We check whether MADV_PAGEOUT can swap/evict pages at all and skip
relevant tests that would fail if it can't.  We do expect that the
swap/eviction will happen within 1 second with retries, but this has
been reliable on a reasonably unloaded system. We may need to increase
that timeout if it becomes an issue.

Tests that need root, THP, or hugetlbs skip accordingly as well.

All 24 tests pass over three consecutive runs, with no skips and no
warnings in dmesg, as root in a virtme-ng guest with 4 CPUs, two NUMA
nodes, a 2G swap disk, THP set to always, CONFIG_DEBUG_VM and
CONFIG_PROVE_LOCKING.

In the same guest:
  - unprivileged: 18 pass, 6 skip (5 need root, 1 needs hugetlb pages)
  - root without CAP_SYS_ADMIN: 22 pass, 2 skip (need page flags)
  - no swap: 16 pass, 8 skip (need swap)

Changes since v2:
  - renamed to madv_cold_pageout.c (Sarthak)
  - pin to one CPU for the whole run (Sarthak)
  - check swap and file unmapping once in main() instead of per-test.
  - COW test retries, and fails if the COW page isn't swapped (Sarthak)
  - gap test checks ENOMEM before it needs swap (Sarthak)
  - reserve a hugetlb page as root, since run_vmtests.sh doesn't
  - ignore /proc/kpageflags when pagemap hides PFNs (no CAP_SYS_ADMIN)
  - shmem tests no longer require swap
  - owned file test no longer needs /tmp writable by nobody
  - folded patch 2 into patch 1 since it's really the same thing.
  - comment and changelog fixes

v2: https://lore.kernel.org/linux-mm/20261014175756.2035176-1-gourry@gourry.net/
original set: https://lore.kernel.org/linux-mm/20260922235830.2350770-2-gourry@gourry.net/

Gregory Price (Meta) (7):
  selftests/mm: add MADV_COLD and MADV_PAGEOUT contract tests
  selftests/mm: check MADV_COLD and MADV_PAGEOUT range handling
  selftests/mm: check that MADV_COLD and MADV_PAGEOUT reject hugetlb
  selftests/mm: check that MADV_COLD and MADV_PAGEOUT preserve shared
    memory
  selftests/mm: check MADV_COLD and MADV_PAGEOUT on partly advised THPs
  selftests/mm: check MADV_PAGEOUT file permissions
  selftests/mm: check that unauthorized MADV_PAGEOUT skips large file
    folios

 tools/testing/selftests/mm/Makefile           |   2 +
 .../selftests/mm/ksft_madv_cold_pageout.sh    |   4 +
 .../testing/selftests/mm/madv_cold_pageout.c  | 971 ++++++++++++++++++
 tools/testing/selftests/mm/run_vmtests.sh     |   5 +
 tools/testing/selftests/mm/vm_util.h          |   1 +
 5 files changed, 983 insertions(+)
 create mode 100755 tools/testing/selftests/mm/ksft_madv_cold_pageout.sh
 create mode 100644 tools/testing/selftests/mm/madv_cold_pageout.c

-- 
2.56.0

