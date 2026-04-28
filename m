Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10133383C6F;
	Tue, 28 Apr 2026 20:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777409268; cv=none; b=RcbtzMqsX/EqDyaQWMlJEgsnrhEX5kEJxQFnrkfkZ/am3yCiL0BIGDW0DvjIWNqKaO+4w4ecqbwvNWskVLUKbzGyIzBb5UeGwI63UC8x1ZycPn3EU4/ZeJANntNpZEyh9HBQmV+8VoOKlXASyOnJ9fh46Xnkqkc1lpCMjVPt/t4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777409268; c=relaxed/simple;
	bh=6G+HupLEy7RoQW/oaRMLwy3Q9S37tIjtSZCXvkrmYmU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PkjUwtcSm8cKdt4z9J+UzC/2sVEYmJn8CKlA6LyG6YKolAL7F2id2LV7IvfoN99vaLO6RF9MNNk5nzirpF/gsIffGkKoVmhHDHxIxkj6eDxH5JbeW2IG3Ds+7vBQEROYuQvliYPzontnIUmIT/St1BkoLGhG9hVG8RQigWs/X0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=leaz1n2j; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="leaz1n2j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97916C2BCAF;
	Tue, 28 Apr 2026 20:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777409267;
	bh=6G+HupLEy7RoQW/oaRMLwy3Q9S37tIjtSZCXvkrmYmU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=leaz1n2j9oxuyVx2ozTbKXqtg3ssJzMfcWnwRTkdJgKalVNCITrankiRbk1qObVTL
	 5D4eUTcQ+JJ/YIdTqU8lTIafIPSwMm2FvQFs13DEhFMVJCjn5Ojb9B3fPL6ocQhKHr
	 t8VFA6JEq5pxq1H1Lia2cVmdUITLPxnocai0m9yL8/77MS0BIr5tJht43Cl95MK7H3
	 Qfm2NPNzaeQf7Jw+90+MFcqCs6SL4cD+vk3p7fCRt/A5KwCujpld0nUs069qpmXbkl
	 jbgqft2eCGSHlqe2svy1Mjk03A4Qb9Xu88vmby11PwS3N0otO5cFD8aNdFPI5MAnrN
	 rPsi4UNt6tGYQ==
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
Subject: [PATCH v3 45/54] selftests/mm: pagemap_ioctl: add setup of HugeTLB pages
Date: Tue, 28 Apr 2026 23:42:31 +0300
Message-ID: <20260428204240.1924129-46-rppt@kernel.org>
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

