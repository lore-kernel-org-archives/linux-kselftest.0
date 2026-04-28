Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E93AF1397;
	Tue, 28 Apr 2026 20:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777408978; cv=none; b=hKFzCj2KEMbMsLnqCcVyZA8iUG28oWBn1faSZ9tf7PSyyH5F6I+p03uY0cnnQu+elh23RtKJsd/iV0t1skmWctZcSKU5kfpE81dRC6yPpC6ZxXkj+pnasukUQFS7WC5P96fzDQfxecS7Iw589q/GzTb21/6BbfKVbYbzImzAU7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777408978; c=relaxed/simple;
	bh=9Wa6cmQ8SR+FAIiSEI++oU+tCSCF1FiRlP76nYdhufU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pldcj7upA+rCsrFsw0arNE2hDo81938H6Fm8ScZTH01cZcIxBERHQV9cwD8e3uVWD2a3sA4lqK0lIgFfCTl4WL9UMBUBRcAQIxTd8faLB917FoKKmFZe16ax9in66T17TB8R74zqOP/kvse2lRd7NHaDQfvHy47HXWnoSiEKZYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FlakYzFG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FlakYzFG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4119C2BCAF;
	Tue, 28 Apr 2026 20:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777408977;
	bh=9Wa6cmQ8SR+FAIiSEI++oU+tCSCF1FiRlP76nYdhufU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FlakYzFGRiVmn0uV4gIwdSBEOWZkQoAdQSVzm/1V6MlS/ZqTqb5SIDMHqBjY1+40J
	 8HEnx0nNE4umIeaMl7XnC8OMFE9S07ldbrhokMGfvPLF29zW6dfzzd0ggUKfT/pIHk
	 dKH//u72yXeZhMQ5L7hVKQziZdKfzaKJCD87y7AmeAMnhTunWQ2o/j6FxVtrsW6HKP
	 dnNoVueV/JfBBgSNlrYmJheNe5nRwJN6Qkrx710AbfSMr1zk3oEm1V1ltKnclL+nK7
	 akJQ9C55LTnO3cN32mS3ww0r5mVaGm18NVren62WP7pKY3v9wTsEkqJj4mZn17rKTC
	 qgYQgPCQXxbWw==
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
Subject: [PATCH v3 01/54] selftests/mm: hugetlb-read-hwpoison: add SIGBUS handler
Date: Tue, 28 Apr 2026 23:41:47 +0300
Message-ID: <20260428204240.1924129-2-rppt@kernel.org>
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

