Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D700524F;
	Tue, 28 Apr 2026 20:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777409195; cv=none; b=qauneMVvZ+rfLdisyOakBCd4lzLePpNTp6nckiAKRFQra1IEaCKZYC4gEpDVA42zQ+Ot34jdqZs2j8Alpn1AXHYiLnoiIE/P2K9+xTbgQetvcr+jYrU1QopA4klBmdFkx56012rphvH62iSAh1tlgQCCIZ29uZKGPcNIiWp5j/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777409195; c=relaxed/simple;
	bh=zjc7IuQI4jBq+AK4lBqRC09uA93LQf31iSBny8sfuNc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xg4ID6uGHvLtqi57NNXwEQdyQP1F39Scpwbi5lzHsmU0ocAst71OA32BoAVnokCIyJ74Wk/Hk5kUsjn2Ns2IYb6SPwBzYbWtoKbRoCtTZSeD2w/9lZc8I2qbm/t8o0AImq/mqMS3x8BfRK+bvX6N4xaptAjivyEagvLVXhqM364=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=owzqcCHY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="owzqcCHY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 297C3C2BCAF;
	Tue, 28 Apr 2026 20:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777409195;
	bh=zjc7IuQI4jBq+AK4lBqRC09uA93LQf31iSBny8sfuNc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=owzqcCHY0PRBQDKGi7LC8tRxQtjr2qQ9qGzwOzRxNfOTuDYtpbwCie9vo8OZ6wnwo
	 dqvpW1pyCm5QPqbXg1hg68xpgLQmVswwcvssPeH0YCO2dFc9LB4QZ7pketHltkljD2
	 0qwnxWvwGQnph1nLmPTp4/5a8L1PwHpwA0BLnEjz8/qI/ao2cRDgR/GdMbICRSTCw9
	 qrkd2LAp3hoWmrEpgoVVYYMsZEVH1whuJ53b3IdRSzz3DQUJGPsEqRqchSS/w6AtaB
	 h7YnHPJzDNajPyqerzOK1pFNTSJnlOAfu0uDwRlo7Mq36d8Hqv9SAsjq7ZVPEE2YNW
	 MjJEI8+77K1EA==
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
	Luiz Capitulino <luizcap@redhat.com>,
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
Subject: [PATCH v3 34/54] selftests/mm: hmm-tests: add setup of HugeTLB pages
Date: Tue, 28 Apr 2026 23:42:20 +0300
Message-ID: <20260428204240.1924129-35-rppt@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260428204240.1924129-1-rppt@kernel.org>
References: <20260428204240.1924129-1-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

hmm-tests skips HugeTLB tests if there are no free huge pages prepared by a
wrapper script.

Add setup of HugeTLB pages to the test and make sure that the original
settings are restored on the test exit.

Since kselftest_harness runs fixture setup and the tests in child
processes, use HUGETLB_SETUP_DEFAULT_PAGES() that defines a constructor
that runs in the main process and add verification that there are enough
free huge pages to the tests that use them.

Replace exit() calls with _exit() to avoid restoring HugeTLB settings in
the middle of test and use SIGLILL to kill a child process in
hmm_cow_in_device test to avoid interference with signal handlers in
hugepage_restore_settings().

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 tools/testing/selftests/mm/hmm-tests.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/tools/testing/selftests/mm/hmm-tests.c b/tools/testing/selftests/mm/hmm-tests.c
index 409b11cad4bc..70c7ae989c01 100644
--- a/tools/testing/selftests/mm/hmm-tests.c
+++ b/tools/testing/selftests/mm/hmm-tests.c
@@ -69,6 +69,9 @@ enum {
 #ifndef FOLL_LONGTERM
 #define FOLL_LONGTERM   0x100 /* mapping lifetime is indefinite */
 #endif
+
+HUGETLB_SETUP_DEFAULT_PAGES(1)
+
 FIXTURE(hmm)
 {
 	int		fd;
@@ -632,7 +635,7 @@ TEST_F(hmm, anon_write_child)
 			}
 
 			close(child_fd);
-			exit(0);
+			_exit(0);
 		}
 	}
 }
@@ -712,7 +715,7 @@ TEST_F(hmm, anon_write_child_shared)
 		ASSERT_EQ(ptr[i], -i);
 
 	close(child_fd);
-	exit(0);
+	_exit(0);
 }
 
 /*
@@ -784,8 +787,9 @@ TEST_F(hmm, anon_write_hugetlbfs)
 	int *ptr;
 	int ret;
 
-	if (!default_hsize)
-		SKIP(return, "Huge page size could not be determined");
+	if (!hugetlb_free_default_pages())
+		SKIP(return, "Not enough huge pages");
+	default_hsize = default_huge_page_size();
 
 	size = ALIGN(TWOMEG, default_hsize);
 	npages = size >> self->page_shift;
@@ -1564,9 +1568,9 @@ TEST_F(hmm, compound)
 	unsigned long i;
 
 	/* Skip test if we can't allocate a hugetlbfs page. */
-
-	if (!default_hsize)
-		SKIP(return, "Huge page size could not be determined");
+	if (!hugetlb_free_default_pages())
+		SKIP(return, "Not enough huge pages");
+	default_hsize = default_huge_page_size();
 
 	size = ALIGN(TWOMEG, default_hsize);
 	npages = size >> self->page_shift;
@@ -2025,10 +2029,10 @@ TEST_F(hmm, hmm_cow_in_device)
 		ptr[i] = i;
 
 	/* Terminate child and wait */
-	EXPECT_EQ(0, kill(pid, SIGTERM));
+	EXPECT_EQ(0, kill(pid, SIGKILL));
 	EXPECT_EQ(pid, waitpid(pid, &status, 0));
 	EXPECT_NE(0, WIFSIGNALED(status));
-	EXPECT_EQ(SIGTERM, WTERMSIG(status));
+	EXPECT_EQ(SIGKILL, WTERMSIG(status));
 
 	/* Take snapshot to CPU pagetables */
 	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_SNAPSHOT, buffer, npages);
-- 
2.53.0

