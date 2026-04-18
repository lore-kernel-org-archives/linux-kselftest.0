Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86AA535AC10;
	Sat, 18 Apr 2026 10:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776509945; cv=none; b=lW01Dds2XGt7Qs1h5rgszJDK7XlPQbgGX+/m+cu7DoNU69ORIC8IZPKvFo2BMNG1ZjnsNzK0vx6Ck0XLcj0zBwT65HU/GmLGvtC5Dwh7POnrx7w8rZGyh87vhcJxgqA2TP2g90e1W877B3LM3rCSD0M8jrj3p/UU8mjRv1Bwbl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776509945; c=relaxed/simple;
	bh=a9ftjtHwEJ6B9K8hvRWelWOu2y5v4+ZMDsKskwzolFM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZoblSSxW+A9JXbOxNGNv/sb6TGEjcPAu8A6U3CacWW0CNUj5BHVgwfnKqjiIwRfdjTyltDylCY3GtNlHLmNR2XzXBOr2xRVfhlNINWYs8PjVXFeU7PdQKlm63oelJAPJZDo7G3OU1jYDbYC7DsuSkhOy/g7LAoWWFGtXJgpM5/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e8ymaisa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e8ymaisa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCF94C19424;
	Sat, 18 Apr 2026 10:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776509945;
	bh=a9ftjtHwEJ6B9K8hvRWelWOu2y5v4+ZMDsKskwzolFM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=e8ymaisahGMaTk0IOxyVJ0yECbRxXqnEIpYd+/kKN63pkJkrK5Hk4xZ4MeaaMn9J/
	 cDiRpns00LHplT27pTAiWVZBUh+WwIGLiiXi944++qV6r3B76B2MSCq4em97gZWyhk
	 /90LfTJD6LfCJ3UMDN34jeO3Msg9bLEVzmXVGNkCWS4Z3KuOa0eWQx/C8AngZ/z/Ul
	 6uIYVzAjlpPt7CgQDeYvZxjwAqk7I9BiXKfzfDsLc9iSnmyAn6uzoExP4EhJS/5S+J
	 1AWXRozzMsrH4fxd9u5Os+4TcV9tKdBtUslNncPA3rRJkXrv1CzSVx5i6qr3Ofu5sf
	 g58ag/p58B1vg==
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
Subject: [PATCH v2 32/53] selftests/mm: gup_test: add setup of HugeTLB pages
Date: Sat, 18 Apr 2026 13:55:17 +0300
Message-ID: <20260418105539.1261536-33-rppt@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260418105539.1261536-1-rppt@kernel.org>
References: <20260418105539.1261536-1-rppt@kernel.org>
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

