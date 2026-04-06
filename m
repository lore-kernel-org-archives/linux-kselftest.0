Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FBAA37FF73;
	Mon,  6 Apr 2026 14:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775485089; cv=none; b=djOiAn+XG7T9tkNt50D8i3NHCQf+ZBL4DAfB5CigjkvMeJQopFOYYtttYvxpA+1cug4Lj+xaoGmHo/icLM6jVlvEnVAAcSNO93H1kqzgcqwFdFgtvvcWcKLo0k/tRdiGBRylzrQLdERTdpnTiS2+07gBAY+KA/E5yB8Ci0DSJaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775485089; c=relaxed/simple;
	bh=HP6NlM6bvsHL46OUqlPVamucjfq0ryG8JPKt7QsDS+o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GIQC76X9DbQyvGAXRfevy69rkVjIsGInhKiWxyV3uCl10LBnRK11rKB8HHmpzp0SwAfZHGgvk8zoDZvmNg5JeRErEmTuB9z3oVphwifBzZHiZ+4Gsr/GJsYx9lqjrRnWADbmEjeA4pW5udpTSAEX4K9fPvv9RJWJxXs+5/71fsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eELZP2t5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eELZP2t5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2644CC4CEF7;
	Mon,  6 Apr 2026 14:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775485089;
	bh=HP6NlM6bvsHL46OUqlPVamucjfq0ryG8JPKt7QsDS+o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eELZP2t56SEYYr6dEjupCpgolItnOiDrwIk1wz0W5Vy9Ch/B1tOSnB4OzpnrymdFU
	 R/J/THWiCmNjAJJ5/tsILSLComfIP7fi+rE0pZmtDQ47sziKEIVLrGFOwXjV3gtS0m
	 cSQuLnAxofX1UE8/gPLwyEdwRTVh8Wu+47cNS8PnMkSjgE4cR4Cm4HnmoLhvx/xmGv
	 fGc59rO9V8vM5RcbKdvRaUjgD69N8Tv8roXoKyr0HQMfMOZ1h/zrJn7qeCPSn+jGwO
	 lpRSl6K6wKW5ZqoOTLvAS+aZ1ST4dh14P2sKeeVZ6BLUGyGPseW1OggOX1b4ueNrrQ
	 PEwKZ/Turz28g==
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
Subject: [PATCH 04/53] selftests/mm: run_vmtests.sh: don't gate THP and KSM tests on HAVE_HUGEPAGES
Date: Mon,  6 Apr 2026 17:16:46 +0300
Message-ID: <20260406141735.2179309-5-rppt@kernel.org>
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

