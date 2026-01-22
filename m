Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C73CD355034;
	Thu, 22 Jan 2026 17:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769101372; cv=none; b=ku/LLcPJpyMGy3oGkSCo1+mv/C5yOmltyyaQ4iQYv9/YMTMvIuxy9GY3Yz1eyY0OpqkyF6picJRFbWACB9PakqLKXEamciXv+35nUAc1beNkrzBndJa2kmrIO5/CUcxeS/huF/mFWhmlNhbKkFuF1HKbUaj7XAY67opqsPIEATY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769101372; c=relaxed/simple;
	bh=eqotJbi0dHxoKg4oLkKC+ENr4amMMTbVd3AeFBRZzuM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jjhPdpg6ghynLwnaJv2/y8YyipkG4gu3zgn08+zbUlcSmKcu568Z+ghG89SQHIjOh1IoaLmd+uT7Qwg2r0veCYzCqqUy3aZbuidlhRGzWqHqxt/BJH++keUqLzRaBiu3kr5euvAlKQInkzxnSsSCDJ0zdMu9HGzaJ3NBWxTEUH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E294F15A1;
	Thu, 22 Jan 2026 09:02:34 -0800 (PST)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E6B833F632;
	Thu, 22 Jan 2026 09:02:39 -0800 (PST)
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Dev Jain <dev.jain@arm.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Mark Brown <broonie@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	SeongJae Park <sj@kernel.org>,
	wang lian <lianux.mm@gmail.com>
Subject: [PATCH v3 4/9] selftests/mm: fix usage of FORCE_READ() in cow tests
Date: Thu, 22 Jan 2026 17:02:19 +0000
Message-ID: <20260122170224.4056513-5-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260122170224.4056513-1-kevin.brodsky@arm.com>
References: <20260122170224.4056513-1-kevin.brodsky@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 5bbc2b785e63 ("selftests/mm: fix FORCE_READ to read input
value correctly") modified FORCE_READ() to take a value instead of a
pointer. It also changed most of the call sites accordingly, but
missed many of them in cow.c. In those cases, we ended up with the
pointer itself being read, not the memory it points to.

No failure occurred as a result, so it looks like the tests work
just fine without faulting in. However, the huge_zeropage tests
explicitly check that pages are populated, so those became skipped.

Convert all the remaining FORCE_READ() to fault in the mapped page,
as was originally intended. This allows the huge_zeropage tests to
run again (3 tests in total).

Fixes: 5bbc2b785e63 ("selftests/mm: fix FORCE_READ to read input value correctly")
Acked-by: SeongJae Park <sj@kernel.org>
Reviewed-by: wang lian <lianux.mm@gmail.com>
Acked-by: David Hildenbrand (Red Hat) <david@kernel.org>
Reviewed-by: Dev Jain <dev.jain@arm.com>
Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 tools/testing/selftests/mm/cow.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/mm/cow.c b/tools/testing/selftests/mm/cow.c
index accfd198dbda..83b3563be26b 100644
--- a/tools/testing/selftests/mm/cow.c
+++ b/tools/testing/selftests/mm/cow.c
@@ -1612,8 +1612,8 @@ static void run_with_huge_zeropage(non_anon_test_fn fn, const char *desc)
 	 * the first sub-page and test if we get another sub-page populated
 	 * automatically.
 	 */
-	FORCE_READ(mem);
-	FORCE_READ(smem);
+	FORCE_READ(*mem);
+	FORCE_READ(*smem);
 	if (!pagemap_is_populated(pagemap_fd, mem + pagesize) ||
 	    !pagemap_is_populated(pagemap_fd, smem + pagesize)) {
 		ksft_test_result_skip("Did not get THPs populated\n");
@@ -1663,8 +1663,8 @@ static void run_with_memfd(non_anon_test_fn fn, const char *desc)
 	}
 
 	/* Fault the page in. */
-	FORCE_READ(mem);
-	FORCE_READ(smem);
+	FORCE_READ(*mem);
+	FORCE_READ(*smem);
 
 	fn(mem, smem, pagesize);
 munmap:
@@ -1719,8 +1719,8 @@ static void run_with_tmpfile(non_anon_test_fn fn, const char *desc)
 	}
 
 	/* Fault the page in. */
-	FORCE_READ(mem);
-	FORCE_READ(smem);
+	FORCE_READ(*mem);
+	FORCE_READ(*smem);
 
 	fn(mem, smem, pagesize);
 munmap:
@@ -1773,8 +1773,8 @@ static void run_with_memfd_hugetlb(non_anon_test_fn fn, const char *desc,
 	}
 
 	/* Fault the page in. */
-	FORCE_READ(mem);
-	FORCE_READ(smem);
+	FORCE_READ(*mem);
+	FORCE_READ(*smem);
 
 	fn(mem, smem, hugetlbsize);
 munmap:
-- 
2.51.2

