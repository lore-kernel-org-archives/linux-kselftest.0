Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B24358372;
	Sat, 18 Apr 2026 10:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776509853; cv=none; b=tQxafMeR0s9AB7XLqlEv6HIU8Utois8GlvZHzS8Y7AeFNdl1bRBWb6Iqgxe3UjItdlcqcVf6VtcliOCWhILK/HDUZ3uV3nQi5/Ap0Q9xVaOD9c0hn5C/Gbe9l9P/AllhLr6eiIjxlsCyDljbzSVAB/VA3CZaGgbM3GZqcXufOqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776509853; c=relaxed/simple;
	bh=W/Hu2qsaXpGRyFf0ATC603oNW1zzsqQgst2Eeo+Nd7k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kqzycm2eK4294ncY50VP1GWrF8PkC52LPEjI3VnWyhuHIsIFO0kW3TLjWXuXqZBFEJBoP88SnJeVdlDwKT/qs6sJox7Ia9kuOZG6dCFnk2W+SQgJYYIZ+Xo14hPbeSAKBfBRP6Yg7McWidWVYBkNTUsHrZD6RLg+kAHxKDHDdQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y0ScbXni; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y0ScbXni"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7594BC19424;
	Sat, 18 Apr 2026 10:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776509853;
	bh=W/Hu2qsaXpGRyFf0ATC603oNW1zzsqQgst2Eeo+Nd7k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Y0ScbXniyzsFNYebjVotCaILdgbqhAIGBzp2R8i3jCLxPnDtOGD21cCfA9tBWs0GR
	 +jIRXy/Qdfxxc1K9bUCKDr6Qgxf7gDOUwc6xMe7HDr7sTPCm2e3Xoax3Dm9+dfO7Ve
	 hq9UyfQQiRBT8KfQY7CxdcAzVi9g4NfUqFPceACf7+9slxElQgo1vfQS5YG6jpOt54
	 3/YjL80/kSxq/JR9UQJT5O2fstFBK8rXrQz+kolQ/4WxUX4czwr+Dx+lYBhzMXTH85
	 sK41rg9yavX3dEb0lrTFHntVriZBvO2vej7DA93Fia6wJSvO66To4zvR7h+mUGUNCK
	 vmxhDQfbJwCyw==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>,
	Barry Song <baohua@kernel.org>,
	Dev Jain <dev.jain@arm.com>,
	Donet Tom <donettom@linux.ibm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lance Yang <lance.yang@linux.dev>,
	Leon Romanovsky <leon@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Nico Pache <npache@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Sarthak Sharma <sarthak.sharma@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH v2 17/53] selftests/mm: uffd-stress: use kselftest framework
Date: Sat, 18 Apr 2026 13:55:02 +0300
Message-ID: <20260418105539.1261536-18-rppt@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260418105539.1261536-1-rppt@kernel.org>
References: <20260418105539.1261536-1-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

Convert uffd-stress test to use kselftest framework for reporting and
tracking successful and failing runs.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 tools/testing/selftests/mm/uffd-stress.c | 41 +++++++++++-------------
 1 file changed, 19 insertions(+), 22 deletions(-)

diff --git a/tools/testing/selftests/mm/uffd-stress.c b/tools/testing/selftests/mm/uffd-stress.c
index 700fbaa18d44..e92a85463eb1 100644
--- a/tools/testing/selftests/mm/uffd-stress.c
+++ b/tools/testing/selftests/mm/uffd-stress.c
@@ -286,19 +286,12 @@ static int userfaultfd_stress(uffd_global_test_opts_t *gopts)
 	pthread_attr_setstacksize(&attr, 16*1024*1024);
 
 	while (bounces--) {
-		printf("bounces: %d, mode:", bounces);
-		if (bounces & BOUNCE_RANDOM)
-			printf(" rnd");
-		if (bounces & BOUNCE_RACINGFAULTS)
-			printf(" racing");
-		if (bounces & BOUNCE_VERIFY)
-			printf(" ver");
-		if (bounces & BOUNCE_POLL)
-			printf(" poll");
-		else
-			printf(" read");
-		printf(", ");
-		fflush(stdout);
+		ksft_print_msg("bounces: %d, mode:%s%s%s%s, ",
+			       bounces,
+			       bounces & BOUNCE_RANDOM ? " rnd" : "",
+			       bounces & BOUNCE_RACINGFAULTS ? " racing" : "",
+			       bounces & BOUNCE_VERIFY ? " ver" : "",
+			       bounces & BOUNCE_POLL ? " poll" : " read");
 
 		if (bounces & BOUNCE_POLL)
 			fcntl(gopts->uffd, F_SETFL, gopts->uffd_flags | O_NONBLOCK);
@@ -456,6 +449,9 @@ int main(int argc, char **argv)
 	unsigned long nr_cpus;
 	size_t bytes;
 
+	ksft_print_header();
+	ksft_set_plan(1);
+
 	gopts = (uffd_global_test_opts_t *) malloc(sizeof(uffd_global_test_opts_t));
 
 	if (argc < 4)
@@ -484,10 +480,8 @@ int main(int argc, char **argv)
 	 * for racy extra reservation of hugepages.
 	 */
 	if (gopts->test_type == TEST_HUGETLB &&
-	   get_free_hugepages() < 2 * (bytes / gopts->page_size) + gopts->nr_parallel - 1) {
-		printf("skip: Skipping userfaultfd... not enough hugepages\n");
-		return KSFT_SKIP;
-	}
+	   get_free_hugepages() < 2 * (bytes / gopts->page_size) + gopts->nr_parallel - 1)
+		ksft_exit_skip("Skipping userfaultfd... not enough hugepages\n");
 
 	gopts->nr_pages_per_cpu = bytes / gopts->page_size / gopts->nr_parallel;
 	if (!gopts->nr_pages_per_cpu) {
@@ -503,9 +497,12 @@ int main(int argc, char **argv)
 	}
 	gopts->nr_pages = gopts->nr_pages_per_cpu * gopts->nr_parallel;
 
-	printf("nr_pages: %lu, nr_pages_per_cpu: %lu\n",
-	       gopts->nr_pages, gopts->nr_pages_per_cpu);
-	return userfaultfd_stress(gopts);
+	ksft_print_msg("nr_pages: %lu, nr_pages_per_cpu: %lu\n",
+		       gopts->nr_pages, gopts->nr_pages_per_cpu);
+
+	ksft_test_result(!userfaultfd_stress(gopts),
+			 "uffd-stress %s\n", argv[1]);
+	ksft_finished();
 }
 
 #else /* __NR_userfaultfd */
@@ -514,8 +511,8 @@ int main(int argc, char **argv)
 
 int main(void)
 {
-	printf("skip: Skipping userfaultfd test (missing __NR_userfaultfd)\n");
-	return KSFT_SKIP;
+	ksft_print_header();
+	ksft_exit_skip("missing __NR_userfaultfd definition\n");
 }
 
 #endif /* __NR_userfaultfd */
-- 
2.53.0

