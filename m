Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A0528725A;
	Tue, 28 Apr 2026 20:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777409017; cv=none; b=Q0eSFbfecvvTJUlLqUIV/VGftI2n1WJBmgQUWKh2elajvHV4OHa9kQjb1rtpyRaTF8mbsQt3sF+ylYwtahv4nC5MO1NxhnJ9H4yIaj8RXISl5ALhvozUSKNmKP8liYXa34iYdpf9PagJCwcjJxBgBzB+OGak7QgKV9fIa3bYCyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777409017; c=relaxed/simple;
	bh=9sC3778jKyDFz3Hjf8iXiNoDRSWAhHT+f8fPth7IqjA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tMlNZXLvEIcAOh6v02B/28GxsSnDjcJ6/cnfhv8jYQeTC+R7ypeB2PSVWXue5ga9BzrnEDLzYr81k0SVIMP/LJ+sfebKH/3tOHCsZ61BMLasuEfnITYTCc4Stx8lzcl0yPNigD0BHbBalFdqhwUJdJ+MhB5S3lw1TrIGKrvaYys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MFRVWxxU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MFRVWxxU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E9BDC2BCAF;
	Tue, 28 Apr 2026 20:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777409017;
	bh=9sC3778jKyDFz3Hjf8iXiNoDRSWAhHT+f8fPth7IqjA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MFRVWxxU2l48pg7KdlcATzh/BQ7El7mawJuXdhfzSUId5u/FV3ENpGrpXoVv/S/5e
	 diGcw13XfZ66wO6iK6hu/nz+PFGHcwnt5Yh9Kz8cgkfNZUENMDb/9cXjrvfidS/0En
	 Q9CsEbrpDu2gG6VRAai5UYV/lv4uWDvGC1kM/eG6mUfifvB+4vsxxt79dAdTkvoO+w
	 UBiE5Xg01xGq0XKss6X4SfkdurzI9BbwHtB04Jn+VmOmuutfi75GehlCP7x5cR+v0f
	 csq7HGnKd78f9EibARdiq0bwCYC+gXAK2lSpyAw75v7VpnTjcNibWt59VaCe8g3kKA
	 zzSHvWYTm+k8Q==
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
Subject: [PATCH v3 07/54] selftests/mm: rename hugepage-* tests to hugetlb-*
Date: Tue, 28 Apr 2026 23:41:53 +0300
Message-ID: <20260428204240.1924129-8-rppt@kernel.org>
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

hugepage could mean both THP and HugeTLB these days.

Rename hugepage-* tests for HugeTLB to hugetlb-* to avoid confusion.

Reviewed-by: Donet Tom <donettom@linux.ibm.com>
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 tools/testing/selftests/mm/.gitignore                     | 4 ++++
 tools/testing/selftests/mm/Makefile                       | 8 ++++----
 tools/testing/selftests/mm/hugetlb-madvise.c              | 2 +-
 .../selftests/mm/{hugepage-mmap.c => hugetlb-mmap.c}      | 2 +-
 .../selftests/mm/{hugepage-mremap.c => hugetlb-mremap.c}  | 2 +-
 .../selftests/mm/{hugepage-shm.c => hugetlb-shm.c}        | 2 +-
 .../mm/{hugepage-vmemmap.c => hugetlb-vmemmap.c}          | 0
 tools/testing/selftests/mm/run_vmtests.sh                 | 8 ++++----
 8 files changed, 16 insertions(+), 12 deletions(-)
 rename tools/testing/selftests/mm/{hugepage-mmap.c => hugetlb-mmap.c} (99%)
 rename tools/testing/selftests/mm/{hugepage-mremap.c => hugetlb-mremap.c} (99%)
 rename tools/testing/selftests/mm/{hugepage-shm.c => hugetlb-shm.c} (99%)
 rename tools/testing/selftests/mm/{hugepage-vmemmap.c => hugetlb-vmemmap.c} (100%)

diff --git a/tools/testing/selftests/mm/.gitignore b/tools/testing/selftests/mm/.gitignore
index b0c30c5ee9e3..9ccd9e1447e6 100644
--- a/tools/testing/selftests/mm/.gitignore
+++ b/tools/testing/selftests/mm/.gitignore
@@ -4,6 +4,10 @@ hugepage-mmap
 hugepage-mremap
 hugepage-shm
 hugepage-vmemmap
+hugetlb-mmap
+hugetlb-mremap
+hugetlb-shm
+hugetlb-vmemmap
 hugetlb-madvise
 hugetlb-read-hwpoison
 hugetlb-soft-offline
diff --git a/tools/testing/selftests/mm/Makefile b/tools/testing/selftests/mm/Makefile
index cbda989f6b6a..a6955660a806 100644
--- a/tools/testing/selftests/mm/Makefile
+++ b/tools/testing/selftests/mm/Makefile
@@ -63,10 +63,10 @@ TEST_GEN_FILES += hmm-tests
 TEST_GEN_FILES += hugetlb-madvise
 TEST_GEN_FILES += hugetlb-read-hwpoison
 TEST_GEN_FILES += hugetlb-soft-offline
-TEST_GEN_FILES += hugepage-mmap
-TEST_GEN_FILES += hugepage-mremap
-TEST_GEN_FILES += hugepage-shm
-TEST_GEN_FILES += hugepage-vmemmap
+TEST_GEN_FILES += hugetlb-mremap
+TEST_GEN_FILES += hugetlb-shm
+TEST_GEN_FILES += hugetlb-vmemmap
+TEST_GEN_FILES += hugetlb-mmap
 TEST_GEN_FILES += khugepaged
 TEST_GEN_FILES += madv_populate
 TEST_GEN_FILES += map_fixed_noreplace
diff --git a/tools/testing/selftests/mm/hugetlb-madvise.c b/tools/testing/selftests/mm/hugetlb-madvise.c
index 5b12041fa310..898cc90b314f 100644
--- a/tools/testing/selftests/mm/hugetlb-madvise.c
+++ b/tools/testing/selftests/mm/hugetlb-madvise.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * hugepage-madvise:
+ * hugetlb-madvise:
  *
  * Basic functional testing of madvise MADV_DONTNEED and MADV_REMOVE
  * on hugetlb mappings.
diff --git a/tools/testing/selftests/mm/hugepage-mmap.c b/tools/testing/selftests/mm/hugetlb-mmap.c
similarity index 99%
rename from tools/testing/selftests/mm/hugepage-mmap.c
rename to tools/testing/selftests/mm/hugetlb-mmap.c
index fa886ec148c2..9f5ea8d6d656 100644
--- a/tools/testing/selftests/mm/hugepage-mmap.c
+++ b/tools/testing/selftests/mm/hugetlb-mmap.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * hugepage-mmap:
+ * hugetlb-mmap:
  *
  * Example of using huge page memory in a user application using the mmap
  * system call.  Before running this application, make sure that the
diff --git a/tools/testing/selftests/mm/hugepage-mremap.c b/tools/testing/selftests/mm/hugetlb-mremap.c
similarity index 99%
rename from tools/testing/selftests/mm/hugepage-mremap.c
rename to tools/testing/selftests/mm/hugetlb-mremap.c
index b8f7d92e5a35..1c87c39780c5 100644
--- a/tools/testing/selftests/mm/hugepage-mremap.c
+++ b/tools/testing/selftests/mm/hugetlb-mremap.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * hugepage-mremap:
+ * hugetlb-mremap:
  *
  * Example of remapping huge page memory in a user application using the
  * mremap system call.  The path to a file in a hugetlbfs filesystem must
diff --git a/tools/testing/selftests/mm/hugepage-shm.c b/tools/testing/selftests/mm/hugetlb-shm.c
similarity index 99%
rename from tools/testing/selftests/mm/hugepage-shm.c
rename to tools/testing/selftests/mm/hugetlb-shm.c
index ef06260802b5..de8f5d523084 100644
--- a/tools/testing/selftests/mm/hugepage-shm.c
+++ b/tools/testing/selftests/mm/hugetlb-shm.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * hugepage-shm:
+ * hugetlb-shm:
  *
  * Example of using huge page memory in a user application using Sys V shared
  * memory system calls.  In this example the app is requesting 256MB of
diff --git a/tools/testing/selftests/mm/hugepage-vmemmap.c b/tools/testing/selftests/mm/hugetlb-vmemmap.c
similarity index 100%
rename from tools/testing/selftests/mm/hugepage-vmemmap.c
rename to tools/testing/selftests/mm/hugetlb-vmemmap.c
diff --git a/tools/testing/selftests/mm/run_vmtests.sh b/tools/testing/selftests/mm/run_vmtests.sh
index 61b450032af8..b9e520194634 100755
--- a/tools/testing/selftests/mm/run_vmtests.sh
+++ b/tools/testing/selftests/mm/run_vmtests.sh
@@ -282,18 +282,18 @@ run_test() {
 
 echo "TAP version 13" | tap_output
 
-CATEGORY="hugetlb" run_test ./hugepage-mmap
+CATEGORY="hugetlb" run_test ./hugetlb-mmap
 
 shmmax=$(cat /proc/sys/kernel/shmmax)
 shmall=$(cat /proc/sys/kernel/shmall)
 echo 268435456 > /proc/sys/kernel/shmmax
 echo 4194304 > /proc/sys/kernel/shmall
-CATEGORY="hugetlb" run_test ./hugepage-shm
+CATEGORY="hugetlb" run_test ./hugetlb-shm
 echo "$shmmax" > /proc/sys/kernel/shmmax
 echo "$shmall" > /proc/sys/kernel/shmall
 
-CATEGORY="hugetlb" run_test ./hugepage-mremap
-CATEGORY="hugetlb" run_test ./hugepage-vmemmap
+CATEGORY="hugetlb" run_test ./hugetlb-mremap
+CATEGORY="hugetlb" run_test ./hugetlb-vmemmap
 CATEGORY="hugetlb" run_test ./hugetlb-madvise
 CATEGORY="hugetlb" run_test ./hugetlb_dio
 
-- 
2.53.0

