Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC6643C04C;
	Mon, 11 May 2026 16:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778517211; cv=none; b=D3mCTLrRnjNgk5jKHQmg29W30v+y/HdaARhe25YLEYdyCqho9v8bTQcEhqU5SyIzWq4YHLSmB6/ptTCq7R0WNq63XhBub4ALAQ96GDkbL7RfFXhq9lCuvdmAUWtZs8ypz5/unSfBK56oCDlrFizX9L35JmJD51OlS/Qaq7yNvg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778517211; c=relaxed/simple;
	bh=c1ZxEmNU3A9YeW1tzV//yrEW/Ruonx/h28f70wUwjpk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GcCwf4LX4krbzp/YuukjYRttx30H60DU3D8+697AplD7jcMAkVNREIhkabBXnmEpfDIkVUT227OunanU1YSuAbcjNidqiXP6B/wjFyc/i3qL8XFWibI0ogsqXKcCtZyNxemXJ9pgU1IsGT03WRUVfkrBt0OzZS9j45ZwO7EzFog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iEjUfK3t; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iEjUfK3t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EC6BC2BCC9;
	Mon, 11 May 2026 16:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778517211;
	bh=c1ZxEmNU3A9YeW1tzV//yrEW/Ruonx/h28f70wUwjpk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iEjUfK3tQmG6jLjIdKDyGB2iuDamJLmeNZIHemS3b0oie9NswUcT4JLxag8yA2SlH
	 PNQDI2wnpzd6dQiL2CWPTxr/QRGsshCf1Esydhf1awV5gvoJi4DZBbHNJi2zn3cnIr
	 n1zGfabcqCPFpBuNzijh9wsyaATfX77XKKVigpNCtC7rYcamubLkSpYRidU6TsSJuE
	 94hbUYfp08suC7ezzWkwwMGIbYbu/eH/1OiU8v0AbOSFIYzosG2nG6ryxgBgR40+W7
	 oQ3QMb5tqz33/sqXJZEwKgCb5Pw4gLPu5fckJIUONE39q3SgXH8pf4iY7NV2mSBOIw
	 KL6elhJtsYfVQ==
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
Subject: [PATCH v4 43/55] selftests/mm: hugetlb-soft-offline: add setup of HugeTLB pages
Date: Mon, 11 May 2026 19:28:27 +0300
Message-ID: <20260511162840.375890-44-rppt@kernel.org>
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

hugetlb-soft-offline test uses open coded access to /proc to determine
availability of huge pages and fails if there are no enough free huget
pages..

Replace open coded access to /proc with hugepage helpers and add setup
of HugeTLB pages to the test and make sure that the original settings
are restored on the test exit.

Tested-by: Luiz Capitulino <luizcap@redhat.com>
Tested-by: Sarthak Sharma <sarthak.sharma@arm.com>
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 .../selftests/mm/hugetlb-soft-offline.c       | 45 ++++---------------
 1 file changed, 8 insertions(+), 37 deletions(-)

diff --git a/tools/testing/selftests/mm/hugetlb-soft-offline.c b/tools/testing/selftests/mm/hugetlb-soft-offline.c
index a8bc02688085..bc202e4ed2bd 100644
--- a/tools/testing/selftests/mm/hugetlb-soft-offline.c
+++ b/tools/testing/selftests/mm/hugetlb-soft-offline.c
@@ -6,9 +6,7 @@
  * - if enable_soft_offline = 1, a hugepage should be dissolved and
  *   nr_hugepages/free_hugepages should be reduced by 1.
  *
- * Before running, make sure more than 2 hugepages of default_hugepagesz
- * are allocated. For example, if /proc/meminfo/Hugepagesize is 2048kB:
- *   echo 8 > /sys/kernel/mm/hugepages/hugepages-2048kB/nr_hugepages
+ * The test allocates 8 default hugepages
  */
 
 #define _GNU_SOURCE
@@ -25,6 +23,7 @@
 #include <sys/types.h>
 
 #include "kselftest.h"
+#include "hugepage_settings.h"
 
 #ifndef MADV_SOFT_OFFLINE
 #define MADV_SOFT_OFFLINE 101
@@ -100,32 +99,6 @@ static int set_enable_soft_offline(int value)
 	return 0;
 }
 
-static int read_nr_hugepages(unsigned long hugepage_size,
-			     unsigned long *nr_hugepages)
-{
-	char buffer[256] = {0};
-	char cmd[256] = {0};
-
-	sprintf(cmd, "cat /sys/kernel/mm/hugepages/hugepages-%ldkB/nr_hugepages",
-		hugepage_size);
-	FILE *cmdfile = popen(cmd, "r");
-
-	if (cmdfile == NULL) {
-		ksft_perror(EPREFIX "failed to popen nr_hugepages");
-		return -1;
-	}
-
-	if (!fgets(buffer, sizeof(buffer), cmdfile)) {
-		ksft_perror(EPREFIX "failed to read nr_hugepages");
-		pclose(cmdfile);
-		return -1;
-	}
-
-	*nr_hugepages = atoll(buffer);
-	pclose(cmdfile);
-	return 0;
-}
-
 static int create_hugetlbfs_file(struct statfs *file_stat)
 {
 	int fd;
@@ -177,20 +150,14 @@ static void test_soft_offline_common(int enable_soft_offline)
 		ksft_exit_fail_msg("Failed to set enable_soft_offline\n");
 	}
 
-	if (read_nr_hugepages(hugepagesize_kb, &nr_hugepages_before) != 0) {
-		close(fd);
-		ksft_exit_fail_msg("Failed to read nr_hugepages\n");
-	}
+	nr_hugepages_before = hugetlb_nr_default_pages();
 
 	ksft_print_msg("Before MADV_SOFT_OFFLINE nr_hugepages=%ld\n",
 		       nr_hugepages_before);
 
 	ret = do_soft_offline(fd, 2 * file_stat.f_bsize, expect_errno);
 
-	if (read_nr_hugepages(hugepagesize_kb, &nr_hugepages_after) != 0) {
-		close(fd);
-		ksft_exit_fail_msg("Failed to read nr_hugepages\n");
-	}
+	nr_hugepages_after = hugetlb_nr_default_pages();
 
 	ksft_print_msg("After MADV_SOFT_OFFLINE nr_hugepages=%ld\n",
 		nr_hugepages_after);
@@ -219,6 +186,10 @@ static void test_soft_offline_common(int enable_soft_offline)
 int main(int argc, char **argv)
 {
 	ksft_print_header();
+
+	if (!hugetlb_setup_default(8))
+		ksft_exit_skip("not enough hugetlb pages\n");
+
 	ksft_set_plan(2);
 
 	test_soft_offline_common(1);
-- 
2.53.0

