Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B57CA3815D6;
	Mon,  6 Apr 2026 14:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775485251; cv=none; b=rsJJaH6rWcMfFuT4qRN705Gc6RdC2bm1FLdiya/noGoB4cxKWWJSHPHGwKF0D8lBTP4bUQ0OsdispssLS6t2lQXdHojL/FJadAPDvs4Jz5TAN3zwszn6cJ9jNz+D4SnzUPEC+92uwH1pqgP9sOnS59mFojNVryS6MWz3CeQxX0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775485251; c=relaxed/simple;
	bh=a9ftjtHwEJ6B9K8hvRWelWOu2y5v4+ZMDsKskwzolFM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=URyBfCfvWPdo8UEYz9cSh/6ef0Gex2CtK2fBRFHuZl4qI2aSla0ryrmlQU6W/9Ucg3yLi6tkm4g4DAMEasVtLoxlxLgsP2D7f+ifzfDRSmmXMdg09LSsBrDf5lQxz0SjRR7xVcKX2iTyP2OBiPSQY6mVyREcfk106v+3CjKFmsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PXlcsjUk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PXlcsjUk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 595F4C2BC9E;
	Mon,  6 Apr 2026 14:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775485251;
	bh=a9ftjtHwEJ6B9K8hvRWelWOu2y5v4+ZMDsKskwzolFM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PXlcsjUkXpGa0plMK4KCSBfUoCbgkCkumdlMO8LDe+jLUERu8ebnt2EKXCiuml7mw
	 olTPeslK3N9IBwibWeLmB/LrB2iD5h07goqgyUG4BDXpcwQ48nK0YaOmBqyzACUdZk
	 WNZunJJUYtXxxpoCsoBjoRIXoBEiXiWGCsiNmhSMbk175XXgtYxyNugZItpBJdJN/Z
	 Y0frwWHHcZvGEUEL0rqBzbdvAvquAI8pOwnd48kyY5NOQzooANLVYpAMeCSmMJgrbl
	 GWESBEl8zXj0VjWvDgxN+0HE/Md61T/GHtzyYANyIywu4zWAcaDtYjcR2p2zQUWn9+
	 iJVj/PbiZjnrg==
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
Subject: [PATCH 32/53] selftests/mm: gup_test: add setup of HugeTLB pages
Date: Mon,  6 Apr 2026 17:17:14 +0300
Message-ID: <20260406141735.2179309-33-rppt@kernel.org>
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

gup_test fails to run HugeTLB tests if there are no free huge pages
prepared by a wrapper script.

Add setup of HugeTLB pages to the test and make sure that the
original settings are restored on the test exit.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 tools/testing/selftests/mm/gup_test.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tools/testing/selftests/mm/gup_test.c b/tools/testing/selftests/mm/gup_test.c
index fb8f9ae49efa..ddd239a69881 100644
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
@@ -199,6 +202,15 @@ int main(int argc, char **argv)
 	}
 
 	ksft_print_header();
+
+	if (hugetlb) {
+		unsigned long hp_size = default_huge_page_size();
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

