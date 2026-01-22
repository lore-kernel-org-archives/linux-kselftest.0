Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A808F350A1A;
	Thu, 22 Jan 2026 17:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769101377; cv=none; b=Sd5JquclCNd7d2pdC/LCCazIqd0m348NGiGH5Q5+SMJSCVpHH46y34NebCgSEBXhl4iG+eSH9wDxf5K5b/9w7Gt+PnTft1G6CaJ0IWveNY/r7A47ehIgjcQ2gNIpsI3q3EbGsj5eE8jwLGboAP16YQvivQRjSBgTVCdZMeBJASs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769101377; c=relaxed/simple;
	bh=RlJP7p975YmL2VYtY/0HkKIxUbRE5WFqvs9GbxWFmek=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TzLGHiTo44PP5Z8OjXqrSGfEPAzZfcKb+PGuA12oeKPHCUWgB/noeW6v5aZxIYiv1Pdi3Wf+Ed6zVvn+QV157VwSMq6LCxHhnFngwDfP1TPieRPt5KxTTuFIh1pP69TF0efcNvlzQtg9ephigui6+3KiPHq1Xg1A+Sq+L/OARv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7A867165C;
	Thu, 22 Jan 2026 09:02:36 -0800 (PST)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B4A1D3F632;
	Thu, 22 Jan 2026 09:02:41 -0800 (PST)
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
	Shuah Khan <shuah@kernel.org>
Subject: [PATCH v3 5/9] selftests/mm: check that FORCE_READ() succeeded
Date: Thu, 22 Jan 2026 17:02:20 +0000
Message-ID: <20260122170224.4056513-6-kevin.brodsky@arm.com>
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

Many cow tests rely on FORCE_READ() to populate pages. Introduce a
helper to make sure that the pages are actually populated, and fail
otherwise.

Suggested-by: David Hildenbrand (Red Hat) <david@kernel.org>
Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 tools/testing/selftests/mm/cow.c | 43 ++++++++++++++++++++++++--------
 1 file changed, 33 insertions(+), 10 deletions(-)

diff --git a/tools/testing/selftests/mm/cow.c b/tools/testing/selftests/mm/cow.c
index 83b3563be26b..d9c69c04b67d 100644
--- a/tools/testing/selftests/mm/cow.c
+++ b/tools/testing/selftests/mm/cow.c
@@ -75,6 +75,18 @@ static bool range_is_swapped(void *addr, size_t size)
 	return true;
 }
 
+static bool populate_page_checked(char *addr)
+{
+	bool ret;
+
+	FORCE_READ(*addr);
+	ret = pagemap_is_populated(pagemap_fd, addr);
+	if (!ret)
+		ksft_print_msg("Failed to populate page\n");
+
+	return ret;
+}
+
 struct comm_pipes {
 	int child_ready[2];
 	int parent_ready[2];
@@ -1549,8 +1561,10 @@ static void run_with_zeropage(non_anon_test_fn fn, const char *desc)
 	}
 
 	/* Read from the page to populate the shared zeropage. */
-	FORCE_READ(*mem);
-	FORCE_READ(*smem);
+	if (!populate_page_checked(mem) || !populate_page_checked(smem)) {
+		log_test_result(KSFT_FAIL);
+		goto munmap;
+	}
 
 	fn(mem, smem, pagesize);
 munmap:
@@ -1612,8 +1626,11 @@ static void run_with_huge_zeropage(non_anon_test_fn fn, const char *desc)
 	 * the first sub-page and test if we get another sub-page populated
 	 * automatically.
 	 */
-	FORCE_READ(*mem);
-	FORCE_READ(*smem);
+	if (!populate_page_checked(mem) || !populate_page_checked(smem)) {
+		log_test_result(KSFT_FAIL);
+		goto munmap;
+	}
+
 	if (!pagemap_is_populated(pagemap_fd, mem + pagesize) ||
 	    !pagemap_is_populated(pagemap_fd, smem + pagesize)) {
 		ksft_test_result_skip("Did not get THPs populated\n");
@@ -1663,8 +1680,10 @@ static void run_with_memfd(non_anon_test_fn fn, const char *desc)
 	}
 
 	/* Fault the page in. */
-	FORCE_READ(*mem);
-	FORCE_READ(*smem);
+	if (!populate_page_checked(mem) || !populate_page_checked(smem)) {
+		log_test_result(KSFT_FAIL);
+		goto munmap;
+	}
 
 	fn(mem, smem, pagesize);
 munmap:
@@ -1719,8 +1738,10 @@ static void run_with_tmpfile(non_anon_test_fn fn, const char *desc)
 	}
 
 	/* Fault the page in. */
-	FORCE_READ(*mem);
-	FORCE_READ(*smem);
+	if (!populate_page_checked(mem) || !populate_page_checked(smem)) {
+		log_test_result(KSFT_FAIL);
+		goto munmap;
+	}
 
 	fn(mem, smem, pagesize);
 munmap:
@@ -1773,8 +1794,10 @@ static void run_with_memfd_hugetlb(non_anon_test_fn fn, const char *desc,
 	}
 
 	/* Fault the page in. */
-	FORCE_READ(*mem);
-	FORCE_READ(*smem);
+	if (!populate_page_checked(mem) || !populate_page_checked(smem)) {
+		log_test_result(KSFT_FAIL);
+		goto munmap;
+	}
 
 	fn(mem, smem, hugetlbsize);
 munmap:
-- 
2.51.2

