Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0396934B19F;
	Sat, 18 Apr 2026 10:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776509755; cv=none; b=g7MJSJjOUkOomx9ZimK/G4SRxKlDBLgZG4tOmVk9iszsemjm2rWTtfrg/32VIwg5pSU2ztXBl9HDZ7ZdGbztkmdbHE9PTPZMdoDAN45LpXPe+Diw5ttDlWEHrchYlompwQDQP/docWivKXf/yL2RJmVMW48kkfmAn6UVN4Zvym4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776509755; c=relaxed/simple;
	bh=9Wa6cmQ8SR+FAIiSEI++oU+tCSCF1FiRlP76nYdhufU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c2y8tXd4ueSGctNdokMnfNtRs8AgAotjsLk4tu1/2B5L6JbFxoIJO+lC8Q0kTaq5iCiaWmNp00FOHMlr95XihDxF19Y+q0NFiscqIYpeQczDBrXa6vLeOsf6T0y9w61iBFWrqx9SkkMSt3glBWQX7l53W3cKDxrF2CIpsu9Cos0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O5z+Rrvk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O5z+Rrvk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F184BC2BCB3;
	Sat, 18 Apr 2026 10:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776509754;
	bh=9Wa6cmQ8SR+FAIiSEI++oU+tCSCF1FiRlP76nYdhufU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=O5z+RrvkWvpGRd2Oi606nTqAMrStsgmLQogJFcc14oNjX4NOgarAONnFUn1ckpEKM
	 UHHWJ9WIebiENCdRnp00a03rjG5aGYat7V5qv8Sg+orergh+YDnTclSaqBQbmaRIup
	 cPHcSHiqOSGcwYdjKzNcvF4FDvTCnYsn7Kc1XXNfvepQWFZn/kxAOrpLN7nLPBZVfN
	 6Fz8uDbJ+86k/C1x9VkeVcJm+pB7NvkfgYu+qiRVAmsk2o+9yKgIG2VvYlq/Nm43ls
	 k1WNUOhqGDySXcIGZlIpIyxnib5h5wlHaJVSMllrnUXwz5URq0KdvKHpxkllNi/nZw
	 s1XvwDbXB6SgA==
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
Subject: [PATCH v2 01/53] selftests/mm: hugetlb-read-hwpoison: add SIGBUS handler
Date: Sat, 18 Apr 2026 13:54:46 +0300
Message-ID: <20260418105539.1261536-2-rppt@kernel.org>
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

Access of poisoned memory causes SIGBUS, which terminates the
hugetlb-read-hwpoison test prematurely.

Add a dummy SIGBUS handler to allow the test to continue regardless of
SIGBUS.

Tested-by: Sarthak Sharma <sarthak.sharma@arm.com>
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

