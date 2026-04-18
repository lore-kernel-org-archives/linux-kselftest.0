Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC4A285CB6;
	Sat, 18 Apr 2026 10:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776509773; cv=none; b=MGssWMf18/MeoRoXXVcHBQPFUvsFI0i2cJjPymNIQdnFK3F+zPsg4sPswoC0BCLGU/c4ovL8zNZBwpDRkIBTEZUGgPLfrosdJdXzif/7+SN9PwztPgIDSKMQhUjV9qBEOdzdKuzofpLpD+/3Q6/8IkHRVKc340W56fz846RDL7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776509773; c=relaxed/simple;
	bh=HP6NlM6bvsHL46OUqlPVamucjfq0ryG8JPKt7QsDS+o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U+/TrkYqUVHBSwp48JA2pMIqjzHpU1KsYHe6jZf4z5I4RPbY7twjKoae5qLnfRAzEoKWZxahjkOiuLDCk+08QGspV5ul5XnNbc22NXfuzpIFA2q8nUBQ99DFJn911RVKu/FHAD4xv/nO2LZ7jREgRB/GHSJgztu8NAReqz2Zgcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W4kalYgW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W4kalYgW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66F13C2BCB5;
	Sat, 18 Apr 2026 10:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776509773;
	bh=HP6NlM6bvsHL46OUqlPVamucjfq0ryG8JPKt7QsDS+o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=W4kalYgWBmniwZj5jnpop+e/P4c1WJC28zCTQ+zd07l0YWEcSTchDRZgZyx6KVf0y
	 8qs7Te53lSeiUUh2fnrWPA4ykN/M0r9sYMKaSee7x9FeljPHiufOPZxXGU8Kj1isUF
	 /rOnKeo17zyLHV+tpII15eQ+aaqd8AkBDkAkTLUUtZH5RP4AaNYUAVXf9b1Eyr/vR0
	 u59+/eTR9SVFjQrNE6yz7zmPn4AQ7G+k5S1xQyinmuF52ZTd6rxKIkz06z6v3CuBm4
	 RAs/zzhgT9AzYW8UIoBLwRnhiSLD05SrVfSX79iQkSWJBiQny7Caa0ERFbaBeCHHmI
	 CcnPYud+GCFIA==
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
Subject: [PATCH v2 04/53] selftests/mm: run_vmtests.sh: don't gate THP and KSM tests on HAVE_HUGEPAGES
Date: Sat, 18 Apr 2026 13:54:49 +0300
Message-ID: <20260418105539.1261536-5-rppt@kernel.org>
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

HAVE_HUGEPAGES indicates availability of free HugeTLB pages. It should not
be used to gate KSM test that merges transparent huge pages or
split_huge_page_test.

Remove check for HAVE_HUGEPAGES when running these tests.

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

