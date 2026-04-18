Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1161E36074B;
	Sat, 18 Apr 2026 11:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776510020; cv=none; b=EgsYfWKd/mM50p8vIFaZuvFIzkKg88h1mVGmCkvXpwy6dLLKAy78cqM4KjMhiXlFKGO9MZiNUzih0cmZEqBd+ONnZG0ro0di8iNJhWGdKpOi4uRUks49GnfOSwX7uBqW+NQgQeLEpR+YIieOgHh3WFEDH/XWBYW2qUaLe3HjvRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776510020; c=relaxed/simple;
	bh=6G+HupLEy7RoQW/oaRMLwy3Q9S37tIjtSZCXvkrmYmU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IiWbn9mhTvusfn2ngN4k5cOhEiBCSMZqmHbXUAJk0TueTYBYy+3zLlgxeyV0hQaypkjTz1ui47Kd0cxIg6DHflzAbqJU2AtZ9UqewjzN6AMtSslCPwaqaOG1XtbRY+RIftkcUGVCTeg6pFS752Wagqo72PnhVu5uGSehv0R/Od8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dIO8VQ3T; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dIO8VQ3T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 433CAC2BCB7;
	Sat, 18 Apr 2026 11:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776510019;
	bh=6G+HupLEy7RoQW/oaRMLwy3Q9S37tIjtSZCXvkrmYmU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dIO8VQ3TxggvSkpcrYRjrUOeiV7Q7WOLEvRJ84y8+g1/H1nXjBl+C8SQE1s0MetTE
	 5aXyi/sFpcqVaj+bK0wCDOJKaluKNLuIbtAlRX9H97QyxYc9l92GW9EAY9+TQ3hTBZ
	 gxTttAgP95t+Sra5pE/LdU0mlHWYxuOlEmpYO9mTLIvdoz4gGyIg8CiyrBHCnje88H
	 rVGM+gySlaVVUz4lPpXWtfh79hgnkhB0b4xRpCIPd7Tyh/kJ6aObk6bjkT74Un80J8
	 LqHg4jsIOA/QnZ57d67JlznhuUp8easMrm3jJ7ilzDxV51+FTjW0b6geu/5V7hHUyl
	 VWNQ49YL8HHlQ==
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
Subject: [PATCH v2 44/53] selftests/mm: pagemap_ioctl: add setup of HugeTLB pages
Date: Sat, 18 Apr 2026 13:55:29 +0300
Message-ID: <20260418105539.1261536-45-rppt@kernel.org>
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

pagemap-ioctl skips HugeTLB tests if there are no free huge pages
prepared by a wrapper script.

Add setup of HugeTLB pages to the test and make sure that the original
settings are restored on the test exit.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 tools/testing/selftests/mm/pagemap_ioctl.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/mm/pagemap_ioctl.c b/tools/testing/selftests/mm/pagemap_ioctl.c
index 7f9428d6062c..e2c62cb6978f 100644
--- a/tools/testing/selftests/mm/pagemap_ioctl.c
+++ b/tools/testing/selftests/mm/pagemap_ioctl.c
@@ -7,8 +7,6 @@
 #include <sys/mman.h>
 #include <errno.h>
 #include <malloc.h>
-#include "vm_util.h"
-#include "kselftest.h"
 #include <linux/types.h>
 #include <linux/memfd.h>
 #include <linux/userfaultfd.h>
@@ -23,6 +21,10 @@
 #include <sys/ipc.h>
 #include <sys/shm.h>
 
+#include "vm_util.h"
+#include "kselftest.h"
+#include "hugepage_settings.h"
+
 #define PAGEMAP_BITS_ALL		(PAGE_IS_WPALLOWED | PAGE_IS_WRITTEN |	\
 					 PAGE_IS_FILE | PAGE_IS_PRESENT |	\
 					 PAGE_IS_SWAPPED | PAGE_IS_PFNZERO |	\
@@ -1554,6 +1556,9 @@ int main(int __attribute__((unused)) argc, char *argv[])
 	if (init_uffd())
 		ksft_exit_skip("Failed to initialize userfaultfd\n");
 
+	if (!hugetlb_setup_default(4))
+		ksft_exit_skip("Not enough huge pages\n");
+
 	ksft_set_plan(117);
 
 	page_size = getpagesize();
@@ -1605,7 +1610,7 @@ int main(int __attribute__((unused)) argc, char *argv[])
 	}
 
 	/* 5. SHM Hugetlb page testing */
-	mem_size = 2*1024*1024;
+	mem_size = default_huge_page_size();
 	mem = gethugetlb_mem(mem_size, &shmid);
 	if (mem) {
 		wp_init(mem, mem_size);
@@ -1633,7 +1638,7 @@ int main(int __attribute__((unused)) argc, char *argv[])
 	}
 
 	/* 7. File Hugetlb testing */
-	mem_size = 2*1024*1024;
+	mem_size = default_huge_page_size();
 	fd = memfd_create("uffd-test", MFD_HUGETLB | MFD_NOEXEC_SEAL);
 	if (fd < 0)
 		ksft_exit_fail_msg("uffd-test creation failed %d %s\n", errno, strerror(errno));
-- 
2.53.0

