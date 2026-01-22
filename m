Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DADD53570BB;
	Thu, 22 Jan 2026 17:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769101374; cv=none; b=bb8Vy9WFts5Cf//5I0VKnlWRG2sqMD62HvsrP1ItRznNKXOrLnJ9dml7qjlxnzOV/Kg6xt3USw2j3CJw7TA1lM/WF8VXFT3et8tXEGTyeK93TWEshRBCcgJjdEcy9Q4hMk5uW9s3pl8Qw3oYx1skPn63ykopqOiJjby4mmxLnik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769101374; c=relaxed/simple;
	bh=bz2I6cUboOrdvtlFEV+PYfjT2bzBHtMmEAk5bUnj4Og=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OApadnivB425jNBRApbdagz2A78T3OiRpal5GcQa4f7wlNk8c6tTjhA0ifbJpEq7iMVT9HZjtAVpJUuuMMKMqHwyqkOC9d2KroJRacWks/iT5VCfukc38dVj8BCv+ty4xk1Ls3bqUZ31DoCHmCflDI/80ETOduZ+WlTtnnap+VU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C25DC1515;
	Thu, 22 Jan 2026 09:02:39 -0800 (PST)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DE9423F632;
	Thu, 22 Jan 2026 09:02:44 -0800 (PST)
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
	Usama Anjum <Usama.Anjum@arm.com>
Subject: [PATCH v3 7/9] selftests/mm: fix faulting-in code in pagemap_ioctl test
Date: Thu, 22 Jan 2026 17:02:22 +0000
Message-ID: <20260122170224.4056513-8-kevin.brodsky@arm.com>
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

One of the pagemap_ioctl tests attempts to fault in pages by
memcpy()'ing them to an unused buffer. This probably worked
originally, but since commit 46036188ea1f ("selftests/mm: build with
-O2") the compiler is free to optimise away that unused buffer and
the memcpy() with it. As a result there might not be any resident
page in the mapping and the test may fail.

We don't need to copy all that memory anyway. Just fault in every
page.

While at it also make sure to compute the number of pages once using
simple integer arithmetic instead of ceilf() and implicit
conversions.

Fixes: 46036188ea1f ("selftests/mm: build with -O2")
Cc: Usama Anjum <Usama.Anjum@arm.com>
Acked-by: David Hildenbrand (Red Hat) <david@kernel.org>
Reviewed-by: Dev Jain <dev.jain@arm.com>
Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 tools/testing/selftests/mm/pagemap_ioctl.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/mm/pagemap_ioctl.c b/tools/testing/selftests/mm/pagemap_ioctl.c
index 2cb5441f29c7..1896c7d4f72e 100644
--- a/tools/testing/selftests/mm/pagemap_ioctl.c
+++ b/tools/testing/selftests/mm/pagemap_ioctl.c
@@ -1052,11 +1052,10 @@ static void test_simple(void)
 int sanity_tests(void)
 {
 	unsigned long long mem_size, vec_size;
-	long ret, fd, i, buf_size;
+	long ret, fd, i, buf_size, nr_pages;
 	struct page_region *vec;
 	char *mem, *fmem;
 	struct stat sbuf;
-	char *tmp_buf;
 
 	/* 1. wrong operation */
 	mem_size = 10 * page_size;
@@ -1167,14 +1166,14 @@ int sanity_tests(void)
 	if (fmem == MAP_FAILED)
 		ksft_exit_fail_msg("error nomem %d %s\n", errno, strerror(errno));
 
-	tmp_buf = malloc(sbuf.st_size);
-	memcpy(tmp_buf, fmem, sbuf.st_size);
+	nr_pages = (sbuf.st_size + page_size - 1) / page_size;
+	force_read_pages(fmem, nr_pages, page_size);
 
 	ret = pagemap_ioctl(fmem, sbuf.st_size, vec, vec_size, 0, 0,
 			    0, PAGEMAP_NON_WRITTEN_BITS, 0, PAGEMAP_NON_WRITTEN_BITS);
 
 	ksft_test_result(ret >= 0 && vec[0].start == (uintptr_t)fmem &&
-			 LEN(vec[0]) == ceilf((float)sbuf.st_size/page_size) &&
+			 LEN(vec[0]) == nr_pages &&
 			 (vec[0].categories & PAGE_IS_FILE),
 			 "%s Memory mapped file\n", __func__);
 
-- 
2.51.2

