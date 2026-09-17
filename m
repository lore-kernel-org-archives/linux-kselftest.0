Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4794E4B1295;
	Thu, 17 Sep 2026 11:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789644010; cv=none; b=io2d3VtjwEKL7rbiGP7KnL8NV8uowvAbYI2O+pUonkBWJD2yZv3cS+4Ewe8/66mkAJ6eXWCkyqZTYd9w+eMUNLES37SH0XSRPwaTI2LeZB+6lWilNfmRFaL7oequ48Nr+rj29sdWGbBpm0gNHqrrcg3DGnlellidS0aR9nuDOFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789644010; c=relaxed/simple;
	bh=FdbJphTMJPgRywCx0hEP0U2fQHwubJbn1B/dY939TKM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eW86ibgJZPa7WC9HbsjYg8YmRfWQ8UhoTVIM5EipDFE33n7Fu0+jTp6MERkjNFv/cX/+gZ5Es7QvwKGIm5UVyLiYOZLpwcoVWpKzUcEboGnj+oXK8pvWPCu95lXCzLun4JBBXPUhrfQvYLVha4QEoh2i2Un4z2QwpzRG0mi64zQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=QxN+1YE2; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="QxN+1YE2"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 622571476;
	Thu, 17 Sep 2026 04:20:00 -0700 (PDT)
Received: from a081061.blr.arm.com (a081061.arm.com [10.164.19.84])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AA5CA3F7B4;
	Thu, 17 Sep 2026 04:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789644004; bh=FdbJphTMJPgRywCx0hEP0U2fQHwubJbn1B/dY939TKM=;
	h=From:To:Cc:Subject:Date:From;
	b=QxN+1YE2r/U+nXFGOBumA0ZPUU8irtevO832nM0JUYVRbGUoMcNsVn4fSbLd2we3R
	 iAm9w9oFLJBb9PKi56HdZs+3WkiD006PjpaIQfafWJwTo8AHe/W+t0RHmtPgTRzdsh
	 oy69xK7Du89Ag/Uw1CKx6t+6GA0WhK91jVM6u0Ok=
From: Sarthak Sharma <sarthak.sharma@arm.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	John Hubbard <jhubbard@nvidia.com>,
	Kalesh Singh <kaleshsingh@google.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sarthak Sharma <sarthak.sharma@arm.com>
Subject: [PATCH 0/9] selftests/mm: improve mremap_test
Date: Thu, 17 Sep 2026 16:49:42 +0530
Message-ID: <20260917111951.188266-1-sarthak.sharma@arm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes several correctness issues in mremap_test and
simplifies and strengthens its data validation.

Patch 1 converts the mremap_test to use kselftest helpers, removes
manual tracking of failed tests and corrects some spelling errors.

Patches 2 to 5 fix userfaultfd skipping, unexpected mremap success
handling, multi-VMA data validation and failure reporting when data
corruption is detected.

Patch 6 removes the randomization and uses a simple pattern based approach.

Patch 7 removes perf tests and timing infrastructure.

Patch 8 removes validation threshold and always validates complete mappings.

Patch 9 strengthens the multi VMA validation by also checking the
mapping state of holes after remapping.

Sarthak Sharma (9):
  selftests/mm: mremap_test: use kselftest helpers
  selftests/mm: mremap_test: skip test when userfaultfd is unavailable
  selftests/mm: mremap_test: fail unexpected mremap successes
  selftests/mm: mremap_test: correct multiple VMA range size
  selftests/mm: mremap_test: fail on data corruption
  selftests/mm: mremap_test: replace random data with deterministic
    pattern
  selftests/mm: mremap_test: remove perf tests and timing
  selftests/mm: mremap_test: remove validation threshold
  selftests/mm: mremap_test: strengthen multi VMA validation

 tools/testing/selftests/mm/mremap_test.c | 600 +++++++++--------------
 1 file changed, 220 insertions(+), 380 deletions(-)

-- 
2.53.0

