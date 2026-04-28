Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E48130594E;
	Tue, 28 Apr 2026 20:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777409024; cv=none; b=s5Jj3f9L6cje44rNCiVuoQ+rHrKPpq2DhgrO8Dqiu+sSWIjdVf9lvxj2Dpyi2Bl8LTC1TuulsHtq938pNt41e+sFjq7BIKC2hXjl/EuOEeUV60KM/W2SGg0coQp4xlyAwmAvaM6ujqp8abHI2KGCKuknWNIq1sDEedWpl+zq+yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777409024; c=relaxed/simple;
	bh=dLU/bCwt/eyA3PPvWB4ap77KznBqGFR0SnU6xHYGFcc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eZskMT+vXceL7fRovEJ9oexiU+vgp5jZKv36hnqFB9R944P7g9pm+E2Ts1gsagMzLofMUkr5DCRlosSE7jlklukbm57pK+dlBNgn20n4fx2kuc2D6EFmaQFUsiIAan8MKyF/RvYrH0hmNwe8/HHsFAVHOwvFmSuRGEOvG48zsm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mwWAMGYD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mwWAMGYD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBB26C2BCAF;
	Tue, 28 Apr 2026 20:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777409023;
	bh=dLU/bCwt/eyA3PPvWB4ap77KznBqGFR0SnU6xHYGFcc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mwWAMGYDBm1/30LXf/9ytrjyyByqvvFyPg5pEzATYztnQDEwJ9Zw3n0dj9e1frT4Y
	 PXNluZ5vLoTN5VWyN9Ou5WDvkwCsY7/jaLg2GJVZf/9e03WI5umRW00q5YZ9gXs1wh
	 eC3boZrlA2bezEuyOsRjLh4VuMeAhsm9RGnzbMAEGegMZ5s86t4+egl2etx4Tmdt4o
	 eSFiMrMAVRmJhEDjIv1I3yK5LR0DxJ4qvdQ81ZNPZ7Uxg0xApN8eEa0MN09FENMHn5
	 5v7WZ/XTutw2g2y4LDlGtWY2WeIYLmIe3tRMYciuthDi0wX2SMowhWrnI61sYaJdIA
	 MUSUOGb9ULIsA==
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
Subject: [PATCH v3 08/54] selftests/mm: hugetlb-shm: use kselftest framework
Date: Tue, 28 Apr 2026 23:41:54 +0300
Message-ID: <20260428204240.1924129-9-rppt@kernel.org>
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

Convert hugetlb-shm test to use kselftest framework for reporting and
tracking successful and failing runs.

Reviewed-by: Donet Tom <donettom@linux.ibm.com>
Reviewed-by: Mark Brown <broonie@kernel.org>
Tested-by: Sarthak Sharma <sarthak.sharma@arm.com>
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 tools/testing/selftests/mm/hugetlb-shm.c | 45 ++++++++++++------------
 1 file changed, 22 insertions(+), 23 deletions(-)

diff --git a/tools/testing/selftests/mm/hugetlb-shm.c b/tools/testing/selftests/mm/hugetlb-shm.c
index de8f5d523084..0f70b1a50b6b 100644
--- a/tools/testing/selftests/mm/hugetlb-shm.c
+++ b/tools/testing/selftests/mm/hugetlb-shm.c
@@ -28,9 +28,9 @@
 #include <sys/shm.h>
 #include <sys/mman.h>
 
-#define LENGTH (256UL*1024*1024)
+#include "vm_util.h"
 
-#define dprintf(x)  printf(x)
+#define LENGTH (256UL*1024*1024)
 
 int main(void)
 {
@@ -38,44 +38,43 @@ int main(void)
 	unsigned long i;
 	char *shmaddr;
 
+	ksft_print_header();
+	ksft_set_plan(1);
+
 	shmid = shmget(2, LENGTH, SHM_HUGETLB | IPC_CREAT | SHM_R | SHM_W);
-	if (shmid < 0) {
-		perror("shmget");
-		exit(1);
-	}
-	printf("shmid: 0x%x\n", shmid);
+	if (shmid < 0)
+		ksft_exit_fail_perror("shmget");
+
+	ksft_print_msg("shmid: 0x%x\n", shmid);
 
 	shmaddr = shmat(shmid, NULL, 0);
 	if (shmaddr == (char *)-1) {
-		perror("Shared memory attach failure");
+		ksft_perror("Shared memory attach failure");
 		shmctl(shmid, IPC_RMID, NULL);
-		exit(2);
+		ksft_exit_fail();
 	}
-	printf("shmaddr: %p\n", shmaddr);
+	ksft_print_msg("shmaddr: %p\n", shmaddr);
 
-	dprintf("Starting the writes:\n");
-	for (i = 0; i < LENGTH; i++) {
+	ksft_print_msg("Starting the writes:\n");
+	for (i = 0; i < LENGTH; i++)
 		shmaddr[i] = (char)(i);
-		if (!(i % (1024 * 1024)))
-			dprintf(".");
-	}
-	dprintf("\n");
 
-	dprintf("Starting the Check...");
+	ksft_print_msg("Starting the Check...");
 	for (i = 0; i < LENGTH; i++)
 		if (shmaddr[i] != (char)i) {
-			printf("\nIndex %lu mismatched\n", i);
-			exit(3);
+			shmctl(shmid, IPC_RMID, NULL);
+			ksft_exit_fail_msg("Data mismatch at index %lu\n", i);
 		}
-	dprintf("Done.\n");
+	ksft_print_msg("Done.\n");
 
 	if (shmdt((const void *)shmaddr) != 0) {
-		perror("Detach failure");
+		ksft_perror("Detach failure");
 		shmctl(shmid, IPC_RMID, NULL);
-		exit(4);
+		ksft_exit_fail();
 	}
 
 	shmctl(shmid, IPC_RMID, NULL);
 
-	return 0;
+	ksft_test_result_pass("hugepage using SysV shmget/shmat\n");
+	ksft_finished();
 }
-- 
2.53.0

