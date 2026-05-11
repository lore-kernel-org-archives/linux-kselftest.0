Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B753D410D;
	Mon, 11 May 2026 16:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778516936; cv=none; b=lfzvr8mqFRVoOmLXQe3COGXjSn7pG/B5+tiP8mIVnLp+GAhqELwi/C59CkOLNIrNN1VxpLpH4F/tayCFu4KsKqQhJ531SYL2a6N5J0IdEEM7vqx4OlCoWYdd0u7PFYnQEwwqkqDdWEx+VrdIhJOefLDWz8yOKGXyksdR/Dzp1BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778516936; c=relaxed/simple;
	bh=yYoPhsk9Y08XlKnFDSwEbmRzMpt62PawpVHiZcaxIcM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UiZL42VBfJ5bF9NcljcPnFgNWOnFA+TMI8GBBUcuEm62UldKOd+LHB9uI1AwrqeRVitResX5NyzArtBbLno5fVW49APCN3PVkHgbJGtLE/MtwoNTaUeCG4UIbvqC67egEcdnNUfITXiOojUC/X0j3G5EtVjLDxuzfbLtH2B8GF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rOJzuJZh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rOJzuJZh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53511C2BCB0;
	Mon, 11 May 2026 16:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778516936;
	bh=yYoPhsk9Y08XlKnFDSwEbmRzMpt62PawpVHiZcaxIcM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rOJzuJZhLe7c8QR0fEQht2CNhgwN3iYrNBE2nB+JfBAxbaf4HyGHYyK0QEQPi1+aG
	 OazlEDyQCOt19iCINDDAng4KTjZQht8m7vxtZW5LO8enAg6KnskUIf4sjhhifP6cr4
	 WD3+KF/Uz8rQ/xoNh2Zrv9vux3/rOIrxL4pIRALQRgVg7hue5bJLTtyP2SGWrvDKxA
	 9RwV6fgMgMiW4EjMMT+BCYzTAvnsG09Pogr1iTF5aVC3JVYR214Iz6aA5uwo9RgqHJ
	 7881aqw/BdYOHywxDMaMTZRgqLp8P7+/4OBTwmSnugcukkSFLK1rhvD9gGqAffRYzd
	 BihqZ+QCuCgrg==
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
Subject: [PATCH v4 01/55] selftests/mm: hugetlb-read-hwpoison: add SIGBUS handler
Date: Mon, 11 May 2026 19:27:45 +0300
Message-ID: <20260511162840.375890-2-rppt@kernel.org>
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

Injection of a memory error with madvise() causes SIGBUS, which terminates
the hugetlb-read-hwpoison test prematurely.

Add a dummy SIGBUS handler to allow the test to continue regardless of
SIGBUS.

Tested-by: Sarthak Sharma <sarthak.sharma@arm.com>
Tested-by: Li Wang <li.wang@linux.dev>
Reviewed-by: Li Wang <li.wang@linux.dev>
Tested-by: Luiz Capitulino <luizcap@redhat.com>
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 tools/testing/selftests/mm/hugetlb-read-hwpoison.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tools/testing/selftests/mm/hugetlb-read-hwpoison.c b/tools/testing/selftests/mm/hugetlb-read-hwpoison.c
index 46230462ad48..ad3198b444ce 100644
--- a/tools/testing/selftests/mm/hugetlb-read-hwpoison.c
+++ b/tools/testing/selftests/mm/hugetlb-read-hwpoison.c
@@ -10,6 +10,7 @@
 #include <sys/statfs.h>
 #include <errno.h>
 #include <stdbool.h>
+#include <signal.h>
 
 #include "kselftest.h"
 
@@ -261,6 +262,10 @@ static int create_hugetlbfs_file(struct statfs *file_stat)
 	return -1;
 }
 
+static void sigbus_handler(int sig)
+{
+}
+
 int main(void)
 {
 	int fd;
@@ -273,6 +278,7 @@ int main(void)
 	};
 	size_t i;
 
+	signal(SIGBUS, sigbus_handler);
 	for (i = 0; i < ARRAY_SIZE(wr_chunk_sizes); ++i) {
 		printf("Write/read chunk size=0x%lx\n",
 		       wr_chunk_sizes[i]);
-- 
2.53.0

