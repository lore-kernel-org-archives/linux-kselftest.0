Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793613750;
	b=i3hr3p7rvME+mKkrUqL732oft0Ryz3hCDQt/WlXkmHFhA/vCtfsV4T9QlRpZwQcXKwT8
	 idUyOZ8X7jb8pzUw9Rz4oe17S8qniVsEtpG/YoNA2E7gjPK71Sfq63jxxrseCSy9KVv+d
	 d/DFhZ81Nd1gXegRJA+O+iyjk6T02KB0q5aCkZ5A2dqqOv3Xzn2DDWftuD7ol+trfipks
	 3X7npggSbnlB5tBwdyqx4nX796MHzo5K0s+AJjWgE89A0tMEtpX7A+bdNz5ivugjt87Zq
	 CrliVqr2ugHPOHnDueEdbSYRyylGfQNsc8PhPchjCfll5vvI7jYHEHKZLSOCfwdJ2hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793613750;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=W9ES0MdL/PxxpQ6IyNXfcZ2egSpleg7sxTTOorn7k2o=;
	b=PkpAo5nyhwi38gQH+WQqDhUdjTeyMJWfGugwz5rXO457dJeLq58t+zN4ldNKiKYQghkl
	 GcaaY9z24ATnslIFBWQ4k7XwhJIJeahWneHnqjeE+jPv9HSAG8Pv7Tgxt0Y8ZOrEfyIMT
	 kkC1wWFLwYFl+HeIktcjb7vZouJCnFgcPyWPZprk6RnYSBFnLhBGvdNej+KKRO8GWBHsg
	 C0Ile0QHMKpMaGQ8GjEdU4Y9JXwz2Q5LSx2LCf3trsLOmv+fGaI10jIMOO3xXGihY6sEG
	 rhDZvwxxBrz2Mpq6uXNBT+O7rbnNsN2RwFtadNXfmj7kCZVGKEcqfHGOiobncKprIvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=NJS9yRpP;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB16D606A324;
	Mon,  2 Nov 2026 10:02:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB16D606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=NJS9yRpP
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2CFB71595;
	Mon,  2 Nov 2026 02:02:26 -0800 (PST)
Received: from a081061.arm.com (unknown [10.163.156.187])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EEDE13F59E;
	Mon,  2 Nov 2026 02:02:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793613749; bh=CWd3JrR/28ban77aC5ukTIuSZHmjR150vlaanvtwD58=;
	h=From:To:Cc:Subject:Date:From;
	b=NJS9yRpPJ0mwANfpaNDgHapiNm0wUXsKOOQhKctdse7NVjXIzOdEVbULyGILaOUUo
	 bJ6sMPgulpbJHri3Ts/Uj7EPudgkIZBRh5e4ApzBD2p8r3x6FzMTUHa1QumtI44Ltz
	 ZMYEaohBrYzoTt6Tdrm3qTvhQ7Q477frqfLJ5Fh8=
From: Sarthak Sharma <sarthak.sharma@arm.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	John Hubbard <jhubbard@nvidia.com>,
	Kalesh Singh <kaleshsingh@google.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Park Tae-sun <ts930@dgu.ac.kr>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sarthak Sharma <sarthak.sharma@arm.com>
Subject: [PATCH RESEND v2 00/12] improve mremap_test
Date: Mon,  2 Nov 2026 15:31:59 +0530
Message-ID: <20261102100211.141831-1-sarthak.sharma@arm.com>
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

This series fixes correctness issues in mremap_test, simplifies its
test infrastructure and strengthens validation of remapped mappings.

Patches 1-3 remove unused command line handling, unnecessary cleanup
checks and redundant errno handling. Patch 4 converts the test to use
kselftest helpers and removes manual failure tracking.

Patches 5-8 fix handling of unavailable userfaultfd support, unexpected
mremap() successes, data-corruption failures and cleanup after mmap()
failures. Patch 9 removes perf tests and timing infrastructure.

Patches 10 and 11 replace threshold-based random-data validation with
sampled validation and a deterministic data pattern. Patch 12
strengthens multi VMA validation by also checking the mapping state
of holes after remapping.

This is a resend of v2 without any changes.

Changes in v2:
- Add a first patch to remove command-line options (David)
- Add a second patch to remove munmap() checks from cleanup paths (David)
- Add a third patch to simplify errno handling
- Drop the "correct multiple VMA range size" patch
- Add an eighth patch to fix cleanup after target mmap() failures
- Replace fully populating and validating large mappings with
  populating and validating 10 pages each from the start, middle
  and end (David)
- Extend multi VMA strengthening to userfaultfd multi VMA test
- Fix minor formatting issues

Previous versions:
v2: https://lore.kernel.org/all/20261006092511.145776-1-sarthak.sharma@arm.com/
v1: https://lore.kernel.org/all/20260924050009.19974-1-sarthak.sharma@arm.com/

---
Sarthak Sharma (12):
  selftests/mm: mremap_test: remove command line options
  selftests/mm: mremap_test: drop munmap() checks from cleanup paths
  selftests/mm: mremap_test: simplify errno handling
  selftests/mm: mremap_test: use kselftest helpers
  selftests/mm: mremap_test: skip test when userfaultfd is unavailable
  selftests/mm: mremap_test: fail unexpected mremap successes
  selftests/mm: mremap_test: fail on data corruption
  selftests/mm: mremap_test: handle cleanup after mmap failures
  selftests/mm: mremap_test: remove perf tests and timing
  selftests/mm: mremap_test: replace validation threshold with sampled
    checks
  selftests/mm: mremap_test: replace random data with deterministic
    pattern
  selftests/mm: mremap_test: strengthen multi VMA validation

 tools/testing/selftests/mm/mremap_test.c | 701 ++++++++++-------------
 1 file changed, 291 insertions(+), 410 deletions(-)

-- 
2.53.0

