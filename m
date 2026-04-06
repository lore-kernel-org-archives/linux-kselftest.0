Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5BD237FF7A;
	Mon,  6 Apr 2026 14:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775485298; cv=none; b=g26pmQ5cEGUZFJlfX52JjgHvGla6XntlZKhZ10rTGYphM+bZUiPOtI5ZXZR9S182ILjaIzDATsO3hmNqEC1ZKuCH3XxfBQk56NwX+o/t4dLy/bHRJbHvK55sLNVeKCRbNJvKlDnlt1HSClc+PxUZLFRd7wkhRQY/ig1F6fr0B/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775485298; c=relaxed/simple;
	bh=CuwM0pZ3/JhUx+ejuVCSFOxrDGLqHKrdn9rmOFHqvFo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NRuayayO1iBck1GuqCGxljUEtFNuEkT0OgWI0eZYl4tDzJIdV6eJW0I5/RtbhjYzjuU2autvt9MwH3OGZE5QclGBNREky80Vn6QPvO62Gb1h662cvnY6fw8F8K3k/1qdQEnw+6IhEdjxBZX0sYhFYgnRo3OM7NqbkNie3zze0JM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JlreYPFC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JlreYPFC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88FD4C4CEF7;
	Mon,  6 Apr 2026 14:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775485297;
	bh=CuwM0pZ3/JhUx+ejuVCSFOxrDGLqHKrdn9rmOFHqvFo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JlreYPFCUZsHB3nh1FuJHqiHLnh//pLb8PeKlos/Koi7YMTF7uhzfyt8q3e6vQrpE
	 knMm1RKbCISOvxmqRr44D89N+IHgp97QFpaCzQfGfm0fK+n9Jbsz5JC1VSxbxtHlsS
	 KyjDUpkERbnBVwRAv6m1XIawR7PiDXl66iq1QEtO2pnkwbGAvzNpzN4Ebeun42iufD
	 D/ln53NO2EkWucLp3YpIBSxOVx6tC9ZPOuzORusCYfm4o48WuezCu/Fhjgo1Bvd41x
	 7pE4GtMTu0trXzmkLuWKLz+D6qPK5MGyQnSUrTmxS35uSwRgE6mNWswtfdKitKHa4V
	 +upLdKtl4ZY2w==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>,
	Barry Song <baohua@kernel.org>,
	Dev Jain <dev.jain@arm.com>,
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
	Shuah Khan <shuah@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH 40/53] selftests/mm: hugetlb-shm: add setup of HugeTLB pages
Date: Mon,  6 Apr 2026 17:17:22 +0300
Message-ID: <20260406141735.2179309-41-rppt@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260406141735.2179309-1-rppt@kernel.org>
References: <20260406141735.2179309-1-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

hugetlb-shm test fails if there are no free huge pages prepared by a
wrapper script and shm liimts in proc are too low.

Add setup of HugeTLB pages and shm limits to the test and make sure that
the original settings are restored on the test exit.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 tools/testing/selftests/mm/hugetlb-shm.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/tools/testing/selftests/mm/hugetlb-shm.c b/tools/testing/selftests/mm/hugetlb-shm.c
index 10e4baa091f2..e721ef17974c 100644
--- a/tools/testing/selftests/mm/hugetlb-shm.c
+++ b/tools/testing/selftests/mm/hugetlb-shm.c
@@ -29,9 +29,24 @@
 #include <sys/mman.h>
 
 #include "vm_util.h"
+#include "hugepage_settings.h"
 
 #define LENGTH (256UL*1024*1024)
 
+static void prepare(void)
+{
+	unsigned long length, hugepage_size, nr;
+
+	hugepage_size = default_huge_page_size();
+	length = (LENGTH + hugepage_size) & ~(hugepage_size - 1);
+	nr = length / hugepage_size;
+
+	if (!hugetlb_setup_default(nr))
+		ksft_exit_skip("Not enough free huge pages\n");
+
+	shm_limits_prepare(length);
+}
+
 int main(void)
 {
 	int shmid;
@@ -41,6 +56,8 @@ int main(void)
 	ksft_print_header();
 	ksft_set_plan(1);
 
+	prepare();
+
 	shmid = shmget(2, LENGTH, SHM_HUGETLB | IPC_CREAT | SHM_R | SHM_W);
 	if (shmid < 0)
 		ksft_exit_fail_perror("shmget");
@@ -79,3 +96,5 @@ int main(void)
 	ksft_test_result_pass("hugepage using SysV shmget/shmat\n");
 	ksft_finished();
 }
+
+SHM_LIMITS_RESTORE()
-- 
2.53.0

