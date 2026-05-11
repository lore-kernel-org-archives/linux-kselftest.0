Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD11542EED9;
	Mon, 11 May 2026 16:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778517178; cv=none; b=HACjeeFlrz01grvP6UmDyaFHFPLjTV016Ls++f7ltQhsCL2VmZ69a4sVe1/S4NI34u0pU+99jmdwdhwBXiWQLpJcOfXBjba+1Z8wC8Ix2XkeqaKZPW5B+WL2i/1n82jfw0scr/Fjos5GMXv8Z/+LderIGunzcLvlS7MHcwo3kFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778517178; c=relaxed/simple;
	bh=5yqp0VnRSeTLTeoa76s4B4sERdsjKxOAYdEtPWcYVyI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ox7SfkY9AW58DSj1THMV0tbzSv0hfM9vWbdlo0+gY+JRCj1L07qRSBmk3SbZ0M6PhqJ/OR9GIiy2x0N5Zc3gzLtMtV/OkphlpEEcXuv//rY8cYrUwxun9jFWbBc7nyImN/I+IaENGfAfypJ1hdpotJHQYqXKeJh8zxtRR1HQjQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kFsFjkef; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kFsFjkef"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 410AAC2BCC9;
	Mon, 11 May 2026 16:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778517178;
	bh=5yqp0VnRSeTLTeoa76s4B4sERdsjKxOAYdEtPWcYVyI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kFsFjkefy6sMqwCaxUf3K3br74SVQV+s9svWMmgSPWtGuUaqhrE3ZTTGFiki3cDsW
	 uIxhwdFiz+Pv9uaUSqPNU3GGCu7tb2ZJl9b0HBDp047RUGDA94yVwsPIJ/Vik/dULs
	 CCPPdHWAWqpRmOLvuik/vhg4nglc8CLwtP2vSLZ3kZUfVLPopjHKWbgmL10yYbXZ7o
	 VNSiglkgYKcPUq9ILqM9vBgCEamwr6pM4Vb64xy2IyfcgFAJEd2Fc0WiNlU6SAu0d+
	 oONvK1EYv4nOKHuROrufoeS8d+10CBFX9sFyuASTsEQ8fXi7Wq/5YhxkfD45i5Go1f
	 KTk4avLX40POw==
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
Subject: [PATCH v4 38/55] selftests/mm: hugetlb-madvise: add setup of HugeTLB pages
Date: Mon, 11 May 2026 19:28:22 +0300
Message-ID: <20260511162840.375890-39-rppt@kernel.org>
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

hugetlb-madvise test skips testing if there are no free huge pages
prepared by a wrapper script.

Add setup of HugeTLB pages to the test and make sure that the original
settings are restored on the test exit.

Tested-by: Luiz Capitulino <luizcap@redhat.com>
Tested-by: Sarthak Sharma <sarthak.sharma@arm.com>
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 tools/testing/selftests/mm/hugetlb-madvise.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/mm/hugetlb-madvise.c b/tools/testing/selftests/mm/hugetlb-madvise.c
index 8adcd91d078d..555b4b3d1430 100644
--- a/tools/testing/selftests/mm/hugetlb-madvise.c
+++ b/tools/testing/selftests/mm/hugetlb-madvise.c
@@ -4,12 +4,6 @@
  *
  * Basic functional testing of madvise MADV_DONTNEED and MADV_REMOVE
  * on hugetlb mappings.
- *
- * Before running this test, make sure the administrator has pre-allocated
- * at least MIN_FREE_PAGES hugetlb pages and they are free.  In addition,
- * the test takes an argument that is the path to a file in a hugetlbfs
- * filesystem.  Therefore, a hugetlbfs filesystem must be mounted on some
- * directory.
  */
 
 #define _GNU_SOURCE
@@ -68,9 +62,9 @@ int main(int argc, char **argv)
 	if (!base_page_size)
 		ksft_exit_fail_msg("Unable to determine base page size\n");
 
+	if (!hugetlb_setup_default(MIN_FREE_PAGES))
+		ksft_exit_skip("Not enough free huge pages (have %lu, need %d)\n", hugetlb_free_default_pages(), MIN_FREE_PAGES);
 	free_hugepages = hugetlb_free_default_pages();
-	if (free_hugepages < MIN_FREE_PAGES)
-		ksft_exit_skip("Not enough free huge pages (have %lu, need %d)\n", free_hugepages, MIN_FREE_PAGES);
 
 	fd = memfd_create(argv[0], MFD_HUGETLB);
 	if (fd < 0)
-- 
2.53.0

