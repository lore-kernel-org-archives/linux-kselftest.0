Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A316735A3BE;
	Sat, 18 Apr 2026 11:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776510038; cv=none; b=bavt/etvUbdHNgFgpTZc1gdFMfEHN6JQ+g4qlTaoBSgY593EIzllqvKd3yAmp2UcrHL3u0TkuHK9QaEMgdliUNnG3lyqCbCKO0d8EUIYlWVZUzuaS4C+MUJlxWqmpZ2rA6AubOR6kAlk8qMWxKp9GiGcDJr68v9KAwAeKiaTzHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776510038; c=relaxed/simple;
	bh=n2KgdfeDkv6qGICkBg3Vwdx+MRmhbjeNlFxUjnQTB8E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g0hL2eLipzxpkGngo8epF8ZA53VqpzxEQHKHi1JFrYLIbrwy2vv3WKiwOW0R6CvQULzg99Dq6CPcz+YAftgK51wzSkvs/jhuTifYErMZjT4bRPEuNNop23y8zxaGiV3LqMalBM3gxgvz5es4ymDz6+/3UVRDsJwxYUdxHgUKdV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MROAtTWD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MROAtTWD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACA89C19424;
	Sat, 18 Apr 2026 11:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776510038;
	bh=n2KgdfeDkv6qGICkBg3Vwdx+MRmhbjeNlFxUjnQTB8E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MROAtTWDIn1OZ96pLvy5zn9VfxI6UIfevlt/DDeu7Tpiq1FnWv1gUhNMEO3WpqxOW
	 +Vumc1VsrrwZ+wfVewh1G10utmvathISpPHN/6QsKDVpJnxoxc5OSRjgefcMXa9JXX
	 MsTXQ94e4Pkblg/piVHQtpl9m5P41Za8ddya1n/BaX9fanDqP4iDndRW93o5hImTmA
	 cSC8Exfg3F1szGf+XvWKtwduZg3h4QVhdhX503+aUPPZi+8tQbDCdJZit+bItSiKZq
	 rU2Qli/D+Mnt1X4taIogLGpLz0ifacUiSgwiJFozfz+LT6cpoXR6vkRVgTS6PO/jZ2
	 ZZlUAwnb3A/fQ==
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
Subject: [PATCH v2 47/53] selftests/mm: uffd-stress: use hugetlb_save and alloc huge pages
Date: Sat, 18 Apr 2026 13:55:32 +0300
Message-ID: <20260418105539.1261536-48-rppt@kernel.org>
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

uffd-stress skips HugeTLB tests if there are no free huge pages prepared
by a wrapper script.

Add setup of HugeTLB pages to the test and make sure that the original
settings are restored on the test exit.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 tools/testing/selftests/mm/uffd-stress.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/mm/uffd-stress.c b/tools/testing/selftests/mm/uffd-stress.c
index 7e37cf3d27f6..9693d042f16f 100644
--- a/tools/testing/selftests/mm/uffd-stress.c
+++ b/tools/testing/selftests/mm/uffd-stress.c
@@ -479,9 +479,12 @@ int main(int argc, char **argv)
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

