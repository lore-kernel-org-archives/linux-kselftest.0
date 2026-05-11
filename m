Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E55F42B749;
	Mon, 11 May 2026 16:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778516982; cv=none; b=M62gUNc+i2PqW5KC2Ah4Jua1dBiSqa/GcqcOYWyyTUlZTufLlkTKjQ4rZp/QNePXHr7k3/L6QkSkO4VbNLR1Dqi6Enh6dVAA8kXCfyDJffzOrbquaT6uzNLGmmVW+/l4zcLURnU/DtOpElVo3ojYhSd6N3HuAjH5f6juRcWYIb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778516982; c=relaxed/simple;
	bh=rph4nxSryfkWnl25ZALQ4Av6OLe7e7b5Lw2KQwxCErE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YXv/WEc72y5evXadWHrWuqXIUhIbZ5wl1a/rHsOgzvXV+6T3DOuDzrvI61aWUwIAFUkCeD3DfUEnDyMlnj8lMhbXmNoeM0D2nzP7bLoIaXTaK//YeK8sEaW0kb7yoCIgyI/ZzP9YVpwgGV0VkX1gT3qfGEHWbGb42eorylmXOWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DM3QtTKL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DM3QtTKL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08875C2BCC9;
	Mon, 11 May 2026 16:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778516982;
	bh=rph4nxSryfkWnl25ZALQ4Av6OLe7e7b5Lw2KQwxCErE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DM3QtTKLNdLQjWTa747/XP0l18IEW6Dj2zsf6sQvv8zA37bmYae/LdLeM6wDouZj5
	 C0HqqKetJ66Kb4eqPtD2feOeXl6oxx6otbJmTysXJ9V/gatQTPN/nXwlOfK/I5VSpR
	 xZT/ovkyEvtkfCNzGSUWa9RuJP63/LhO/94dHzgSPxjUwpaMAhNvNpVIDWijXf7fl0
	 7kK7TgD1UMSZVjH8pOMfPVwv467F2LkXJ4qsBW+jbnYziijJvavOOBerH7a1p4Pkc4
	 r0vNaN9eabymyUOGkS90/mTpcTKmC9geB8MkfWOoHrnV/w+3FK9zE+GpePSVjpepcp
	 UAYMLlT0ND6Pg==
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
Subject: [PATCH v4 08/55] selftests/mm: hugetlb-shm: use kselftest framework
Date: Mon, 11 May 2026 19:27:52 +0300
Message-ID: <20260511162840.375890-9-rppt@kernel.org>
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

Convert hugetlb-shm test to use kselftest framework for reporting and
tracking successful and failing runs.

Reviewed-by: Donet Tom <donettom@linux.ibm.com>
Reviewed-by: Mark Brown <broonie@kernel.org>
Tested-by: Sarthak Sharma <sarthak.sharma@arm.com>
Tested-by: Luiz Capitulino <luizcap@redhat.com>
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 tools/testing/selftests/mm/hugetlb-shm.c | 47 +++++++++++-------------
 1 file changed, 22 insertions(+), 25 deletions(-)

diff --git a/tools/testing/selftests/mm/hugetlb-shm.c b/tools/testing/selftests/mm/hugetlb-shm.c
index de8f5d523084..c2c7aee85b96 100644
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
@@ -38,44 +38,41 @@ int main(void)
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
-		if (shmaddr[i] != (char)i) {
-			printf("\nIndex %lu mismatched\n", i);
-			exit(3);
-		}
-	dprintf("Done.\n");
+		if (shmaddr[i] != (char)i)
+			ksft_exit_fail_msg("Data mismatch at index %lu\n", i);
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

