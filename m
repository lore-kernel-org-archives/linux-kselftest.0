Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4EA83F23BB;
	Mon, 27 Jul 2026 09:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785145986; cv=none; b=fvmejvh1d1TaOCSgoPTbY+kvoiV3kf2gInNlesG/KFApJcw0hj7Gw4G9XkOsuCC3rt089MwGphKdAEGhYYS9dEJ8K3gV5s86sR3jbH3ONfUov1FZ9a952WWk1FOE87Buoezsj7KxJDEQmgX/CPByO+GrlRcTbMzQHdrwcvWxDfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785145986; c=relaxed/simple;
	bh=dzW8Sc4XWBgaC1kpkf55Z8zewTfVHC6YVmXcerdGHUc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mRkrJ1rlummqKZhbzY7Rw2up7eejEcBG8POz5BMsc11JJxX4wfTaj3iX2gLKNjPoPDtQn9a5Zb5ZNo+qF4zYWWDJ654irJuiYw8sd+WgOwv/qTZ6fc2SyXez9EZ7oCF5+R9aeraggj5uOZpe+D+cD1G8xxUV3PWQhAZl/hT6RTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=iEK1gDV2; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="iEK1gDV2"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7877E1476;
	Mon, 27 Jul 2026 02:52:54 -0700 (PDT)
Received: from e142334-100.cambridge.arm.com (e142334-100.cambridge.arm.com [10.2.198.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3BBB93F66F;
	Mon, 27 Jul 2026 02:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785145978; bh=dzW8Sc4XWBgaC1kpkf55Z8zewTfVHC6YVmXcerdGHUc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iEK1gDV2inNiNl3LwSunrlXFelTRomyhCE5yVMQrbyN8wA33f4Y5CVDocBPvTIGmg
	 E4p7saWrHlR5XoQNxcaiMqADedlhoFegxKXvQjnj4vcHSVHev0I4k3mQ/eawcVq353
	 w0nvAyRGnKcfEjBdnnit4ggwRPxgM4zgEIxhnD1A=
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
Subject: [PATCH v3 5/5] selftests/mm: retry migration failures for the full runtime
Date: Mon, 27 Jul 2026 10:52:21 +0100
Message-ID: <20260727095225.372655-6-usama.anjum@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260727095225.372655-1-usama.anjum@arm.com>
References: <20260727095225.372655-1-usama.anjum@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

move_pages() is best effort and can temporarily fail when concurrent
faults race with page unmapping. A busy shared-anon workload can exhaust
the current 100 retries long before the intended 20-second runtime and
produce a false failure.

Use the full runtime as the retry window. Since the initial page location
is unknown, require it to reach both alternating NUMA targets to confirm
that cross-node migration made progress despite transient contention.

Signed-off-by: Muhammad Usama Anjum <usama.anjum@arm.com>
---
Changes since v2:
- Return -2 when the page is not on the target node.

Changes since v1:
- Retry per-page failures for the full runtime
- Verify that both alternating NUMA targets are reached
---
 tools/testing/selftests/mm/migration.c | 37 ++++++++++++++------------
 1 file changed, 20 insertions(+), 17 deletions(-)

diff --git a/tools/testing/selftests/mm/migration.c b/tools/testing/selftests/mm/migration.c
index 29f7492453d43..f19d53c695764 100644
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
@@ -110,7 +109,7 @@ int migrate(uint64_t *ptr, int n1, int n2)
 	int ret, tmp;
 	int status = 0;
 	struct timespec ts1, ts2;
-	int failures = 0;
+	int success = 0;
 
 	if (clock_gettime(CLOCK_MONOTONIC, &ts1))
 		return -1;
@@ -119,29 +118,33 @@ int migrate(uint64_t *ptr, int n1, int n2)
 		if (clock_gettime(CLOCK_MONOTONIC, &ts2))
 			return -1;
 
-		if (ts2.tv_sec - ts1.tv_sec >= RUNTIME)
-			return 0;
+		if (ts2.tv_sec - ts1.tv_sec >= RUNTIME) {
+			/* Reaching both targets verifies a cross-node move. */
+			if (success >= 2)
+				return 0;
+			else
+				return -2;
+		}
 
 		ret = move_pages(0, 1, (void **) &ptr, &n2, &status,
 				MPOL_MF_MOVE_ALL);
-		if (ret) {
-			if (ret > 0) {
-				/* Migration is best effort; try again */
-				if (++failures < MAX_RETRIES)
-					continue;
-				printf("Didn't migrate %d pages\n", ret);
-			}
-			else
-				perror("Couldn't migrate pages");
+		if (ret < 0) {
+			perror("Couldn't migrate pages");
+			return ret;
+		}
+		/* Migration is best effort. Try again */
+		if (ret > 0 || status < 0)
+			continue;
+		if (status != n2) {
+			printf("Page is on node %d instead of target node %d\n",
+			       status, n2);
 			return -2;
 		}
-		failures = 0;
+		success++;
 		tmp = n2;
 		n2 = n1;
 		n1 = tmp;
 	}
-
-	return 0;
 }
 
 void *access_mem(void *ptr)
-- 
2.47.3

