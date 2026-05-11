Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940EB47ECEF;
	Mon, 11 May 2026 16:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778517250; cv=none; b=j4CHaoujUsKpRZmPt35lrYdAbFSbdGOEcBdl+lQRo8JN7ilzfbWAvwA8jTZgWI/9k8eK9xGNWVXqAVB3+619Di/1c5om8NacAhTyI14oY35Pumo7Hzm8L6kI/rr/VyOXD+A3y+34sFgxenWjq/ExLfFWzfym0Jbq+KF8kdzGN/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778517250; c=relaxed/simple;
	bh=yChvoRymHflrXb3JZQRkvSGXKQqYnoAHN1ddQ8bY1D4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e0J3Y8NBCSuHcS2+SPWMFxrzbZRfuZkHvq1hwo4IiGXvyYmAn3326yA0URW3Tqx3hZHKSAxVyB0K2uD6vnx7E6hlk4WamhE0xI5G8s+79knO1WTjs8fVn4/3eiocV0Zs63wHFJo5Hbd1dbPlsNZYxl+8E8ATquMznXz2Po6tWaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lM+7PjhX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lM+7PjhX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 761D8C2BCB0;
	Mon, 11 May 2026 16:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778517250;
	bh=yChvoRymHflrXb3JZQRkvSGXKQqYnoAHN1ddQ8bY1D4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lM+7PjhX3EXRh7KJtDecSDPvtHHXxcRwoXr7wlOrINXw0adosyLgo0eTTxlegEGrD
	 BGUmH/pFo3BKKC7sAaiFAWMPE6D4fpWQ1442O5+Nrx7gPdboA/mqXtfx+tCE6oc8i+
	 f1JRwQshJYRGpobjICsnD85mtNwWNm1swVOEYT2VkbtkBzpIfG44E7Mt7V+DlLOpmg
	 ZXvE4rdDNHDKxsGFe9RlEgqipz/akUQfj+j1g9Dx6eUo0jGnRNsu21aZrJDqV2k8NR
	 9ebUqLBWIgUHtSebSnVMaQCx+cr0Ljcs6cJQqfbQZcQ6zn2vz9FQlJhgzErLBXdMr+
	 m01xeNyHx1pzw==
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
	Li Wang <li.wang@linux.dev>,
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
Subject: [PATCH v4 49/55] selftests/mm: uffd-stress: use hugetlb_save and alloc huge pages
Date: Mon, 11 May 2026 19:28:33 +0300
Message-ID: <20260511162840.375890-50-rppt@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260511162840.375890-1-rppt@kernel.org>
References: <20260511162840.375890-1-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

uffd-stress skips HugeTLB tests if there are no free huge pages prepared
by a wrapper script.

Add setup of HugeTLB pages to the test and make sure that the original
settings are restored on the test exit.

Tested-by: Luiz Capitulino <luizcap@redhat.com>
Tested-by: Sarthak Sharma <sarthak.sharma@arm.com>
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 tools/testing/selftests/mm/uffd-stress.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/mm/uffd-stress.c b/tools/testing/selftests/mm/uffd-stress.c
index 7c719d789249..43cc79590136 100644
--- a/tools/testing/selftests/mm/uffd-stress.c
+++ b/tools/testing/selftests/mm/uffd-stress.c
@@ -480,9 +480,12 @@ int main(int argc, char **argv)
 	 * Ensure nr_parallel - 1 hugepages on top of that to account
 	 * for racy extra reservation of hugepages.
 	 */
-	if (gopts->test_type == TEST_HUGETLB &&
-	   hugetlb_free_default_pages() < 2 * (bytes / gopts->page_size) + gopts->nr_parallel - 1)
-		ksft_exit_skip("Skipping userfaultfd... not enough hugepages\n");
+	if (gopts->test_type == TEST_HUGETLB) {
+		unsigned long nr = 2 * (bytes / gopts->page_size) + gopts->nr_parallel - 1;
+
+		if (!hugetlb_setup_default(nr))
+			ksft_exit_skip("Skipping userfaultfd... not enough hugepages\n");
+	}
 
 	gopts->nr_pages_per_cpu = bytes / gopts->page_size / gopts->nr_parallel;
 	if (!gopts->nr_pages_per_cpu) {
-- 
2.53.0

