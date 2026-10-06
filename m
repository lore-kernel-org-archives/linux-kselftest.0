Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14D7F3AC0C3;
	Tue,  6 Oct 2026 09:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791278733; cv=none; b=DBkhs51hGoiIklMBnNALE4+Fq1C3DHGfeKSjlOUTjCXdeTG3NQsqL5AA+5aDEO5dvJXuJ7LVQ99xcZJLG78FUkY41XDbHPR0Rr5t/BLEwxQXXfN1pGYxtZiQgGAh7WN8c+votfNmUff5BTsoyRxZbavC6d9tPBEsnYrhzCcWL2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791278733; c=relaxed/simple;
	bh=6ISjPM2u/Z+vYWm4XET8cat7X78rAK3YnbcaLUDy+tg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H+ucPtGHmUesp4K7o57VdMcG1m6nIAvav65FIaZjNAcogi93MprPqjszEMWQinCtHzk+6hG3S70T2RT48wIKjMpXsvviAGVArp/vflRDhQV8TbhWrsg6EfCI74ePKUh8T8b/CqsMjRj+EMx59kkh57SG1Q2e1X4G6U9Q2k33w2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ZG/jv5FR; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ZG/jv5FR"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 294051516;
	Tue,  6 Oct 2026 02:25:22 -0700 (PDT)
Received: from a081061.blr.arm.com (a081061.arm.com [10.164.19.84])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 46C213F763;
	Tue,  6 Oct 2026 02:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791278725; bh=6ISjPM2u/Z+vYWm4XET8cat7X78rAK3YnbcaLUDy+tg=;
	h=From:To:Cc:Subject:Date:From;
	b=ZG/jv5FRf0oHlBbQSrbUzXPCGLvasASjZG8I0HHQGD15RDdVfdoNMjdxdVsnbEJOd
	 IhiLFhi37YnZuNgDPU8Mk/est4HJdQ48EJTJhmRqIRdQRypWCpa9gPxc+OaPcw3fr0
	 fM6cPSib4lHk2Z16J3OEaOheUOfrNp6uxaEcYNvo=
From: Sarthak Sharma <sarthak.sharma@arm.com>
To: akpm@linux-foundation.org,
	david@kernel.org
Cc: ljs@kernel.org,
	liam@infradead.org,
	vbabka@suse.com,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	shuah@kernel.org,
	jhubbard@nvidia.com,
	kaleshsingh@google.com,
	anshuman.khandual@arm.com,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sarthak Sharma <sarthak.sharma@arm.com>
Subject: [PATCH v2 00/12] selftests/mm: improve mremap_test
Date: Tue,  6 Oct 2026 14:54:59 +0530
Message-ID: <20261006092511.145776-1-sarthak.sharma@arm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
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

Changes in v2:
- Add a first patch to remove command-line options
- Add a second patch to remove munmap() checks from cleanup paths
- Add a third patch to simplify errno handling
- Drop the "correct multiple VMA range size" patch
- Add an eighth patch to fix cleanup after target mmap() failures
- Replace fully populating and validating large mappings with
  populating and validating 10 pages each from the start, middle
  and end
- Extend multi VMA strengthening to userfaultfd multi VMA test
- Fix minor formatting issues

Previous versions:
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

