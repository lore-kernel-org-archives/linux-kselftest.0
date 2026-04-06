Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 572C137F733;
	Mon,  6 Apr 2026 14:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775485072; cv=none; b=BzdWus7VhqKm3x20jwhZiDtmPx+pnwXMx9TptjB//KmHnP2ZuTGqQaYaPGRW4wAe0V7wXG4rrqykcgNKrUzQ03WbeT5yWOxAu/kTm1n41gZrKvpea+S2Dl+jW2Id12nHjuiNTpnRAS71kNsasnOurK84H5dGci6+TScoAsY/iDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775485072; c=relaxed/simple;
	bh=6vj0uSM6vP/d0qVg1g+ptcF5MLY8M8muWRFmIKUP/YU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aGCxVeR9iTbxSfiQFb7Vx39TBKuFwp9gHn4iDCRDIsNPkvFoU4G3NS+hPStwtE1bUmuNxSNE8QJSVkacepejoCt0ItZFGnFGlVbxQmXko8AavZowXtZN5NqNBhbkZMyMtVuSJkUmxRmLm5WONZsOqQ2adTOydwBizJDOKXTGRN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CxpDm9aw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CxpDm9aw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8BE0C2BC9E;
	Mon,  6 Apr 2026 14:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775485072;
	bh=6vj0uSM6vP/d0qVg1g+ptcF5MLY8M8muWRFmIKUP/YU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CxpDm9awfQNQqzRyBPfzjxy/ha7bCdXAq0vOwun5VdxQJzBlzmpeoyaq0d8iPWC2v
	 A8FBYM17bB4CGMQqFL6THW1GvU5YntiIuJHQmOVUgBzRzHaJpVBjiPI9SUUE2SXSFx
	 R7VjOfYze7UhL4nWmRzv4dcgjks71aAB9U8GG7CgeVlL6mqyc+b6Sq0HKRrl5b78RB
	 3tSRWiZHksl3twyTwnhyWnj43PmGwE3BTrwsxOWke71W6DKDqISpb0POxkO+v9oehE
	 vB0J6VmxpP8v2/qPh8MIlrcRwLlL1vfsQSolQyjmJVBiShNZZ+O+r+rgZD2AOyFUQw
	 h1z1uYn4Y8ahA==
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
Subject: [PATCH 01/53] selftests/mm: hugetlb-read-hwpoison: add SIGBUS handler
Date: Mon,  6 Apr 2026 17:16:43 +0300
Message-ID: <20260406141735.2179309-2-rppt@kernel.org>
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

Access of poisoned memory causes SIGBUS, which terminates the
hugetlb-read-hwpoison test prematurely.

Add a dummy SIGBUS handler to allow the test to continue regardless of
SIGBUS.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 tools/testing/selftests/mm/hugetlb-read-hwpoison.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tools/testing/selftests/mm/hugetlb-read-hwpoison.c b/tools/testing/selftests/mm/hugetlb-read-hwpoison.c
index 46230462ad48..6bbf15f78061 100644
--- a/tools/testing/selftests/mm/hugetlb-read-hwpoison.c
+++ b/tools/testing/selftests/mm/hugetlb-read-hwpoison.c
@@ -10,6 +10,7 @@
 #include <sys/statfs.h>
 #include <errno.h>
 #include <stdbool.h>
+#include <signal.h>
 
 #include "kselftest.h"
 
@@ -261,6 +262,11 @@ static int create_hugetlbfs_file(struct statfs *file_stat)
 	return -1;
 }
 
+static void sigbus_handler(int sig)
+{
+	printf(PREFIX "received SIGBUS\n");
+}
+
 int main(void)
 {
 	int fd;
@@ -273,6 +279,7 @@ int main(void)
 	};
 	size_t i;
 
+	signal(SIGBUS, sigbus_handler);
 	for (i = 0; i < ARRAY_SIZE(wr_chunk_sizes); ++i) {
 		printf("Write/read chunk size=0x%lx\n",
 		       wr_chunk_sizes[i]);
-- 
2.53.0

