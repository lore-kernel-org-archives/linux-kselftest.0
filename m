Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B43D3822AD;
	Mon,  6 Apr 2026 14:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775485315; cv=none; b=WHnR+sn7sIHo0+/ULxdp7d0XdiZA+g1UZ2jW0rE0sNwx7W6I/W6YbiW9TJcG/O2VR2QmdckGvvGcZrpHc8KNTPxkapIv/0RunXA9lD2hK9QREVnAqgLGj5oe1eFFJQyd7JhyflbWs49lrJ1JNi+IRNl+6jHlLD1YeP0Gt+Fo4Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775485315; c=relaxed/simple;
	bh=vCnjdXeTkcOgDXKHH4wTrbHB2ThXfy9k351DRlaWe10=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aKdgwm7KUURuEESlX0I8FVLz0oXddgT/OSLXnMqafGDyGktyGScjWuhnSuiK2Q2GAI+0XckkM3WqHC2v1gxy2DzyvoI/iUiEoYpU1/Gr5ChonwVZMwHXZlsqEPt4mkwVuc2hgyTWptUihYceiADIUb4bY0wHOVusRyeAcTObess=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qz4ev3vM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qz4ev3vM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0450C2BCAF;
	Mon,  6 Apr 2026 14:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775485315;
	bh=vCnjdXeTkcOgDXKHH4wTrbHB2ThXfy9k351DRlaWe10=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qz4ev3vMyNDmP0KmG7lLNnA398L3h6LHlWRGk0c6u8ZflSN0OmjEc8kDVS6idFXjq
	 UzbwnFHPTGjr7GRlO7RyMCKBMNVYo4/0duoqLb5m0yADaGftrIhpwUlkMGF7VYSpIw
	 Vd9cCj1gk5awmow67SpPEsvmFXt0NKzCPzpEvf8FRrgCYMm51lx9GZcaCzQ+0Mg3Hc
	 17bLZVpV2NixENoYj6g/F7efFEHkcD1TOkLFqBAPWXTKh6Cdbf9yk21k/ttK+qy3HI
	 7QJRq7Qe8N5M1hNECEkA20Mg1RkFTcP9KWH6AQ4WlAvCtGcZmKR8P8NKYxOmDVrUWm
	 ltJwvx8tz+d+A==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>,
	Barry Song <baohua@kernel.org>,
	Dev Jain <dev.jain@arm.com>,
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
	Shuah Khan <shuah@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH 43/53] selftests/mm: migration: add setup of HugeTLB pages
Date: Mon,  6 Apr 2026 17:17:25 +0300
Message-ID: <20260406141735.2179309-44-rppt@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260406141735.2179309-1-rppt@kernel.org>
References: <20260406141735.2179309-1-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

migration skips HugeTLB tests if there are no free huge pages
prepared by a wrapper script.

Add setup of HugeTLB pages to the test and make sure that the original
settings are restored on the test exit.

Since kselftest_harness runs fixture setup and the tests in child
processes, use HUGETLB_SETUP_DEFAULT_PAGES() that defines a constructor
that runs in the main process and add verification that there are enough
free huge pages to the tests that use them.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 tools/testing/selftests/mm/migration.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tools/testing/selftests/mm/migration.c b/tools/testing/selftests/mm/migration.c
index ccf42002ce86..61fb00953f83 100644
--- a/tools/testing/selftests/mm/migration.c
+++ b/tools/testing/selftests/mm/migration.c
@@ -23,6 +23,8 @@
 #define MAX_RETRIES	100
 #define ALIGN(x, a)	(((x) + (a - 1)) & (~((a) - 1)))
 
+HUGETLB_SETUP_DEFAULT_PAGES(1)
+
 FIXTURE(migration)
 {
 	pthread_t *threads;
@@ -277,6 +279,9 @@ TEST_F_TIMEOUT(migration, private_anon_htlb, 2*RUNTIME)
 	if (!hugepage_size)
 		SKIP(return, "Reading HugeTLB pagesize failed\n");
 
+	if (hugetlb_free_default_pages() < 1)
+		SKIP(return, "Not enough huge pages\n");
+
 	ptr = mmap(NULL, hugepage_size, PROT_READ | PROT_WRITE,
 		MAP_PRIVATE | MAP_ANONYMOUS | MAP_HUGETLB, -1, 0);
 	ASSERT_NE(ptr, MAP_FAILED);
@@ -308,6 +313,9 @@ TEST_F_TIMEOUT(migration, shared_anon_htlb, 2*RUNTIME)
 	if (!hugepage_size)
 		SKIP(return, "Reading HugeTLB pagesize failed\n");
 
+	if (hugetlb_free_default_pages() < 1)
+		SKIP(return, "Not enough huge pages\n");
+
 	ptr = mmap(NULL, hugepage_size, PROT_READ | PROT_WRITE,
 		MAP_SHARED | MAP_ANONYMOUS | MAP_HUGETLB, -1, 0);
 	ASSERT_NE(ptr, MAP_FAILED);
-- 
2.53.0

