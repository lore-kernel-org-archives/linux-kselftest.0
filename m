Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89FA73CFF5E;
	Mon, 11 May 2026 16:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778517152; cv=none; b=RSVxPndTKhXVfhP5BqBOs/uVQxHYWxLyRTLbP1paYdoOEhFG0zOyRaSGB9hIRqDyWXg2/qrVditECzHwGV+agn4J/HKQRMpCyZEuVNQ3gPz0N7KmxcaBHIBNU/oJeR3nW1DPZ5UA7DmloZE/oiEWYSl8dV3iGDLHykkANbhHs8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778517152; c=relaxed/simple;
	bh=55gDmnO5T45LMvku84PvaaMpLqFoz2ktrJOVSg+/AyE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MlFCuUdAMEU2LZhLEiEpCaC5YeqiBqyrkB9o92g3K0W6Y+lSL1obU4E0JErCrb1Xt8pKiTguyAw3sLc4VcKbSfN1sYAlW/Wsub/0yBYSvp5/bfpcCyDiIY3GubvlRbXuWkNZC3AkCvjatM0z+NbpBc1aw5elMwmec9YrJooVDm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S1SkCvWj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S1SkCvWj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22D0CC2BCC9;
	Mon, 11 May 2026 16:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778517152;
	bh=55gDmnO5T45LMvku84PvaaMpLqFoz2ktrJOVSg+/AyE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=S1SkCvWj7mrUnRTm3Zy84Z4OanDq535aEWgVexeaslU5b5MOaLWX/CaC7xGaftSKq
	 ZAgheTl9QnLISNZoF+o2nGJGyi7bkDvepDRVRXEKzoYrVld+WHFbRRe3mCnmFV/c61
	 GEuT+3bVH50GoXwfzWPQSdaSi9Tnsx5GqH6zFZqnCUcsOO/SEj8t6n/AeJjre4L/vd
	 /bnxd1jFTL/Fdnogkia1HA6GyUJqnSYLv9H8yPHScAzDZEK4E1qczsPxHVU3F7RE5R
	 S882e87MGZa5iybUMTtvzICPmbj0xxbSVA4WXk7VzFdDfDtShHuoziPmaLxBe6Wy1I
	 WXjxjqc4FmTeA==
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
Subject: [PATCH v4 34/55] selftests/mm: gup_test: add setup of HugeTLB pages
Date: Mon, 11 May 2026 19:28:18 +0300
Message-ID: <20260511162840.375890-35-rppt@kernel.org>
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

gup_test fails to run HugeTLB tests if there are no free huge pages
prepared by a wrapper script.

Add setup of HugeTLB pages to the test and make sure that the
original settings are restored on the test exit.

Tested-by: Luiz Capitulino <luizcap@redhat.com>
Tested-by: Sarthak Sharma <sarthak.sharma@arm.com>
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 tools/testing/selftests/mm/gup_test.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tools/testing/selftests/mm/gup_test.c b/tools/testing/selftests/mm/gup_test.c
index fb8f9ae49efa..3f841a96f870 100644
--- a/tools/testing/selftests/mm/gup_test.c
+++ b/tools/testing/selftests/mm/gup_test.c
@@ -14,6 +14,7 @@
 #include <mm/gup_test.h>
 #include "kselftest.h"
 #include "vm_util.h"
+#include "hugepage_settings.h"
 
 #define MB (1UL << 20)
 
@@ -94,6 +95,7 @@ int main(int argc, char **argv)
 	int filed, i, opt, nr_pages = 1, thp = -1, write = 1, nthreads = 1, ret;
 	int flags = MAP_PRIVATE;
 	char *file = "/dev/zero";
+	bool hugetlb = false;
 	pthread_t *tid;
 	char *p;
 
@@ -168,6 +170,7 @@ int main(int argc, char **argv)
 			break;
 		case 'H':
 			flags |= (MAP_HUGETLB | MAP_ANONYMOUS);
+			hugetlb = true;
 			break;
 		default:
 			ksft_exit_fail_msg("Wrong argument\n");
@@ -199,6 +202,18 @@ int main(int argc, char **argv)
 	}
 
 	ksft_print_header();
+
+	if (hugetlb) {
+		unsigned long hp_size = default_huge_page_size();
+
+		if (!hp_size)
+			ksft_exit_skip("HugeTLB is unavailable\n");
+
+		size = (size + hp_size - 1) & ~(hp_size - 1);
+		if (!hugetlb_setup_default(size / hp_size))
+			ksft_exit_skip("Not enough huge pages\n");
+	}
+
 	ksft_set_plan(nthreads);
 
 	filed = open(file, O_RDWR|O_CREAT, 0664);
-- 
2.53.0

