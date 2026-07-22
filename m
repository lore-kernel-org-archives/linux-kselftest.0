Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEF07495538;
	Wed, 22 Jul 2026 09:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784711566; cv=none; b=C91qZEhgqVbct4oW49IcDiRHpg7BG2TmqA5yldYifBqSy20rjP+yvvlC7OZSq6lO+YvID4int5abgNMNA5LEWl1OdkrB6RT+rwEVf86jNQOePzvyK9+gf/+hQPFPo3Fo8vPn2Zw7YUUCFmVda3DS1qcja6PZu8mE3F499ojnAmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784711566; c=relaxed/simple;
	bh=zU+WJI13tWsgGSx87Of2o6NV7wNVwyx6o1/X2ur3XDE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rbBWohjrWH6y/1mbvo+s2N6gEh0uQngtXrcJ1J2tKnCD7Yj3gD23iCUTwkFiGyXB9LlK5hrya414pJg8K93PKyCd/tbM7PnzG7qkW6G3NqwkecKMwXKCK7sXu4W9fo1QP9LFlkxAwHQoAZQeG9G5aFmGIRXPU7zWxNjG1YQ+CcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=oS8ZvJdS; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="oS8ZvJdS"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DB9021595;
	Wed, 22 Jul 2026 02:12:39 -0700 (PDT)
Received: from e142334-100.cambridge.arm.com (e142334-100.cambridge.arm.com [10.2.198.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E7C253FC81;
	Wed, 22 Jul 2026 02:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784711564; bh=zU+WJI13tWsgGSx87Of2o6NV7wNVwyx6o1/X2ur3XDE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oS8ZvJdSVqcqJG5JmEhwWraFolHd2/OKcrNFCnyihoZTNbCtCApPpi1EvWQ4GlDhG
	 0qYmVOSWCIfBmRBoC7xmkVKG8a7g7aXjdDZMRRUnWgvvZv56kTX9h2dmvr4Rjp6Fci
	 kGZiqF89fwv6XKoDKMXa4dAkdq7vQaqlqsCtxHj0=
From: Muhammad Usama Anjum <usama.anjum@arm.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Nico Pache <npache@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>,
	Miaohe Lin <linmiaohe@huawei.com>,
	Naoya Horiguchi <nao.horiguchi@gmail.com>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Muhammad Usama Anjum <usama.anjum@arm.com>
Subject: [PATCH RESEND v1 5/5] selftests/mm: retry migration failures for the full runtime
Date: Wed, 22 Jul 2026 10:11:39 +0100
Message-ID: <20260722091219.61504-6-usama.anjum@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260722091219.61504-1-usama.anjum@arm.com>
References: <20260722091219.61504-1-usama.anjum@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

move_pages() migration is best effort and may temporarily leave a page
unmigrated when another task faults on the folio during unmapping.  The
migration test currently tolerates 100 consecutive partial failures,
but a busy machine can exhaust those retries in a fraction of a second
and fail long before the intended 20-second runtime expires.

This is especially visible in the shared-anon cases, where every worker
process continuously accesses the same mapping.  The retry count then
measures syscall rate rather than whether the test can exercise a
successful migration entry.

Retry positive move_pages() results for the full runtime and record the
per-page status.  Pass if at least one migration succeeds, and report the
last status before failing if no migration makes progress.  Continue to
fail immediately for syscall-level errors.

Signed-off-by: Muhammad Usama Anjum <usama.anjum@arm.com>
---
 tools/testing/selftests/mm/migration.c | 34 +++++++++++++++++---------
 1 file changed, 22 insertions(+), 12 deletions(-)

diff --git a/tools/testing/selftests/mm/migration.c b/tools/testing/selftests/mm/migration.c
index 29f7492453d43..19b4cef65f345 100644
--- a/tools/testing/selftests/mm/migration.c
+++ b/tools/testing/selftests/mm/migration.c
@@ -7,7 +7,7 @@
 #include "kselftest_harness.h"
 #include "hugepage_settings.h"
 
-#include <strings.h>
+#include <string.h>
 #include <pthread.h>
 #include <numa.h>
 #include <numaif.h>
@@ -20,7 +20,6 @@
 
 #define TWOMEG		(2<<20)
 #define RUNTIME		(20)
-#define MAX_RETRIES	100
 #define ALIGN(x, a)	(((x) + (a - 1)) & (~((a) - 1)))
 
 HUGETLB_SETUP_DEFAULT_PAGES(1)
@@ -110,7 +109,8 @@ int migrate(uint64_t *ptr, int n1, int n2)
 	int ret, tmp;
 	int status = 0;
 	struct timespec ts1, ts2;
-	int failures = 0;
+	int last_status = 0;
+	unsigned long successes = 0;
 
 	if (clock_gettime(CLOCK_MONOTONIC, &ts1))
 		return -1;
@@ -119,23 +119,33 @@ int migrate(uint64_t *ptr, int n1, int n2)
 		if (clock_gettime(CLOCK_MONOTONIC, &ts2))
 			return -1;
 
-		if (ts2.tv_sec - ts1.tv_sec >= RUNTIME)
-			return 0;
+		if (ts2.tv_sec - ts1.tv_sec >= RUNTIME) {
+			if (successes)
+				return 0;
 
+			if (last_status < 0)
+				printf("No page migration succeeded: %s (%d)\n",
+				       strerror(-last_status), last_status);
+			else
+				printf("No page migration succeeded: status %d\n",
+				       last_status);
+			return -2;
+		}
+
+		status = 0;
 		ret = move_pages(0, 1, (void **) &ptr, &n2, &status,
 				MPOL_MF_MOVE_ALL);
 		if (ret) {
 			if (ret > 0) {
-				/* Migration is best effort; try again */
-				if (++failures < MAX_RETRIES)
-					continue;
-				printf("Didn't migrate %d pages\n", ret);
-			}
-			else
+				/* Migration is best effort; try again. */
+				last_status = status;
+				continue;
+			} else {
 				perror("Couldn't migrate pages");
+			}
 			return -2;
 		}
-		failures = 0;
+		successes++;
 		tmp = n2;
 		n2 = n1;
 		n1 = tmp;
-- 
2.47.3

