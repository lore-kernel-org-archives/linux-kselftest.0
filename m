Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84F8428822;
	Mon, 11 May 2026 16:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778516963; cv=none; b=ONxG/Zn/kSvNFAcHf4ciZJlcKNhg+nxsImdSP37QN3QzHjIi2xN0cyXIl4vD/oT2l/V2M41vY/oIrslyhg+YS0ChrtAS4q7bjugkwOWlPhA7x7ZvSxO/a/piWkutpROmPPBq9CQWOtb680hChQyLoaiYOsPxP/6YQjVncfHopHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778516963; c=relaxed/simple;
	bh=zhjARy9ljfabBxOe2IlzFCWLsSTMxyOB0v613c3jUpo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Kx8kGzdfCxbKGJ/0QyjAAeHvpOKxE+SjE6uFrj6BYNFGejjZZpO88Bn3tgPM42QO+TXuUJf4JdQCSWqP8cnWEczO7R5BcsaCmM7IPY0te1qCBlVZC6LF1gF0OHAos9TJBzuT0mfVMTaxn7RlI09e5w5Uieov51KZDklcnOWlMi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fl+YKUVU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fl+YKUVU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C2D3C2BCF5;
	Mon, 11 May 2026 16:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778516962;
	bh=zhjARy9ljfabBxOe2IlzFCWLsSTMxyOB0v613c3jUpo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fl+YKUVUg+j7xgkf+CKEpIeEb9gvv+l/mxRhCRLm4URzO9NL0YyNuT9qJokTu5gQh
	 FpUlDzTHkRjNCM8rEekjrupWlaQdbqksFVaLeG2U0JUphQb8S4kE+mB90NiREIIipi
	 EdbxcA2cyRu1ywJPaBwiNpWZGPBhZiac4GcplFIxqZSefT5dIuiFIu92Oa7P0QVsn8
	 peqPdPklgsLv49VWMExhKaxfj74qr+5QH538MQzO+FzanupyFaDbESKykOb9/RvQKo
	 yFOuW7yc+ivYkHRCiQ25Su52N9V8UfdoJnLqE15REjPcp3CBQE9iqs8L7FRLVDcDcr
	 pENXAZoQKonOQ==
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
Subject: [PATCH v4 05/55] selftests/mm: run_vmtests.sh: don't gate THP and KSM tests on HAVE_HUGEPAGES
Date: Mon, 11 May 2026 19:27:49 +0300
Message-ID: <20260511162840.375890-6-rppt@kernel.org>
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

HAVE_HUGEPAGES indicates availability of free HugeTLB pages. It should not
be used to gate KSM test that merges transparent huge pages or
split_huge_page_test.

Remove check for HAVE_HUGEPAGES when running these tests.

Tested-by: Li Wang <li.wang@linux.dev>
Reviewed-by: Li Wang <li.wang@linux.dev>
Tested-by: Luiz Capitulino <luizcap@redhat.com>
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 tools/testing/selftests/mm/run_vmtests.sh | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/tools/testing/selftests/mm/run_vmtests.sh b/tools/testing/selftests/mm/run_vmtests.sh
index d8468451b3a3..e2dc9ac87bfc 100755
--- a/tools/testing/selftests/mm/run_vmtests.sh
+++ b/tools/testing/selftests/mm/run_vmtests.sh
@@ -436,9 +436,7 @@ CATEGORY="memfd_secret" run_test ./memfd_secret
 fi
 
 # KSM KSM_MERGE_TIME_HUGE_PAGES test with size of 100
-if [ "${HAVE_HUGEPAGES}" = "1" ]; then
-	CATEGORY="ksm" run_test ./ksm_tests -H -s 100
-fi
+CATEGORY="ksm" run_test ./ksm_tests -H -s 100
 # KSM KSM_MERGE_TIME test with size of 100
 CATEGORY="ksm" run_test ./ksm_tests -P -s 100
 # KSM MADV_MERGEABLE test with 10 identical pages
@@ -493,16 +491,14 @@ CATEGORY="thp" run_test ./transhuge-stress -d 20
 
 # Try to create XFS if not provided
 if [ -z "${SPLIT_HUGE_PAGE_TEST_XFS_PATH}" ]; then
-    if [ "${HAVE_HUGEPAGES}" = "1" ]; then
-	if test_selected "thp"; then
-	    if grep xfs /proc/filesystems &>/dev/null; then
-		XFS_IMG=$(mktemp /tmp/xfs_img_XXXXXX)
-		SPLIT_HUGE_PAGE_TEST_XFS_PATH=$(mktemp -d /tmp/xfs_dir_XXXXXX)
-		truncate -s 314572800 ${XFS_IMG}
-		mkfs.xfs -q ${XFS_IMG}
-		mount -o loop ${XFS_IMG} ${SPLIT_HUGE_PAGE_TEST_XFS_PATH}
-		MOUNTED_XFS=1
-	    fi
+    if test_selected "thp"; then
+	if grep xfs /proc/filesystems &>/dev/null; then
+	    XFS_IMG=$(mktemp /tmp/xfs_img_XXXXXX)
+	    SPLIT_HUGE_PAGE_TEST_XFS_PATH=$(mktemp -d /tmp/xfs_dir_XXXXXX)
+	    truncate -s 314572800 ${XFS_IMG}
+	    mkfs.xfs -q ${XFS_IMG}
+	    mount -o loop ${XFS_IMG} ${SPLIT_HUGE_PAGE_TEST_XFS_PATH}
+	    MOUNTED_XFS=1
 	fi
     fi
 fi
-- 
2.53.0

