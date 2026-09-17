Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 989E84D0CCD;
	Thu, 17 Sep 2026 11:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789644032; cv=none; b=lWXMkG7dFM7IgWSkZZwlntVhCF/D+QMgX/aolr/3rT/XPr8+nEkMcah3I/YZp7peNXWDPmFxOFZtIQ3iAJ2rdbYtBXzefsFG2rZ8gkZOxTZ8dv5is7talbRwZRKx3WbALCjOn4VzjFgNMEZVZn1tGxjPVTn3QSbW6YGun9GQJtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789644032; c=relaxed/simple;
	bh=EmkguL785IIXMYOOGQrzJ/6/Y6ZZO1ERK0FFTi6WP+s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y32oVGAvW24/npDAV0qMkMNU6r7zE6imlI6RVOWStdc1B42ftMI78/JrBg82XCdblU4gfMNDeF+QAtD6x3HcQEw9R87xgnmtSrezXjZFLhGt88VP/jQhDFTpjCCbc+x1BMefNcl12oDHCmtoGQRWRF+Xg0g8cC5fbf0SuHoFR0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=gUy9vtxW; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="gUy9vtxW"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2496E1476;
	Thu, 17 Sep 2026 04:20:20 -0700 (PDT)
Received: from a081061.blr.arm.com (a081061.arm.com [10.164.19.84])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 614B13F7B4;
	Thu, 17 Sep 2026 04:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789644023; bh=EmkguL785IIXMYOOGQrzJ/6/Y6ZZO1ERK0FFTi6WP+s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gUy9vtxW0YnWq62iM9fFT3hlcJG0544ifU+eQ2qQc+owbvmRKseIMpvzXECU0+CvR
	 IjyNZrBJHOkB8rjfKhx/P5jURG7VhxQRtIZgjrjb/l0cSqK/ROXNqNQXrIXwRLKbXc
	 /QKkF7+Tubiz8tUweFgFOmpvtSZqKgpxzmi4QoS8=
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
Subject: [PATCH 4/9] selftests/mm: mremap_test: correct multiple VMA range size
Date: Thu, 17 Sep 2026 16:49:46 +0530
Message-ID: <20260917111951.188266-5-sarthak.sharma@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260917111951.188266-1-sarthak.sharma@arm.com>
References: <20260917111951.188266-1-sarthak.sharma@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the test mremap_move_multiple_vmas(), pages 4
to 6 form a single VMA. But the helper function
is_multiple_vma_range_ok() checks pages 4 and 5 as
one range and treats page 6 separately.

Check all three pages as a single range and skip
the page 6 iteration to match the actual VMA layout.

Fixes: d53f248258e1 ("tools/testing/selftests: extend mremap_test to test multi-VMA mremap")
Signed-off-by: Sarthak Sharma <sarthak.sharma@arm.com>
---
 tools/testing/selftests/mm/mremap_test.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mm/mremap_test.c b/tools/testing/selftests/mm/mremap_test.c
index ba9b7f7566d0..869df22d46db 100644
--- a/tools/testing/selftests/mm/mremap_test.c
+++ b/tools/testing/selftests/mm/mremap_test.c
@@ -373,7 +373,10 @@ static bool is_multiple_vma_range_ok(unsigned int pattern_seed,
 	for (i = 0; i <= 10; i += 2) {
 		int j;
 		char *buf = &ptr[i * page_size];
-		size_t size = i == 4 ? 2 * page_size : page_size;
+		size_t size = i == 4 ? 3 * page_size : page_size;
+
+		if (i == 6)
+			continue;
 
 		for (j = 0; j < size; j++) {
 			char chr = rand();
-- 
2.53.0

