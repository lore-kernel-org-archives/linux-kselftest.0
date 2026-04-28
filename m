Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C720633B6C9;
	Tue, 28 Apr 2026 20:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777409313; cv=none; b=ZgC8EesKVaiGs1Q630q4I7m9oqbaLuqzN2K8JyyJQ/0P9vbFyFvCNkZvl1s7i1QBXkoxGouXuEu3WGYSAdY1/0FiOz0OOQVZH3yct0JIyfA25091/4ImUhRfABNzcfeGlJrIvg5bFcvnLsvaO7fi3lY0YPKtRG9RBdftabr0Bvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777409313; c=relaxed/simple;
	bh=Y+6CuufKGBRmaBQ8v4yV5d9wcJCiC93SEawkGDgeJlU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UCTEQK9hjBVn8+768mBvd+ihklVRe5B7d6yNG+FQiK3fcRBkgrTExqTv04gIm5ckGx9vuwmiSVWOqLNCxq2I/yqRs8RunuLqbbWB7ncpw7WzcvPF4Hjo+wyU7M5GMsvHhwp1LqHoqbklJDaYZRiCn/42haKca/Ca7Y7ifqyrr+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W+uVDnSU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W+uVDnSU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C4D7C2BCAF;
	Tue, 28 Apr 2026 20:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777409313;
	bh=Y+6CuufKGBRmaBQ8v4yV5d9wcJCiC93SEawkGDgeJlU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=W+uVDnSU0GDGxd9dYc1UPrAi61qoOsqwnWxGzKpcS+fQCXupvYkTZPohSGMiBNDiP
	 f+cp9C8F8EEsm7aTf6gCKRx7ql5Obp58kL8u1g9nVgt6VeohkCRMfZxcvzOBLsxgC5
	 D8QrvdaAZtyZ79cNKZhjoo97ScLImtZyeNcm4rkAK12SbORcATSeYX3XZoZrVOOTtN
	 9kP7LagU9W5xXiXnpYz/Jt3Lgriq9l2tsB4gIsLIQeau7TbrkiOyddJAb9YL9DcIvi
	 hGwBOL+/bjp7pVO/+KlXHURo6UEC3GL5t7Mls7zO8DjTrwKQ2umWFsNWK+8VfRfmps
	 Oij28WScEgXhA==
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
Subject: [PATCH v3 52/54] selftests/mm: va_high_addr_switch.sh: drop huge pages setup
Date: Tue, 28 Apr 2026 23:42:38 +0300
Message-ID: <20260428204240.1924129-53-rppt@kernel.org>
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

Since va_high_addr_switch takes care of setting up huge pages, there is
no need to set them up in the va_high_addr_switch.sh wrapper script.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 .../selftests/mm/va_high_addr_switch.sh       | 41 +------------------
 1 file changed, 1 insertion(+), 40 deletions(-)

diff --git a/tools/testing/selftests/mm/va_high_addr_switch.sh b/tools/testing/selftests/mm/va_high_addr_switch.sh
index 9492c2d72634..01c15fe3c799 100755
--- a/tools/testing/selftests/mm/va_high_addr_switch.sh
+++ b/tools/testing/selftests/mm/va_high_addr_switch.sh
@@ -9,7 +9,6 @@
 
 # Kselftest framework requirement - SKIP code is 4.
 ksft_skip=4
-orig_nr_hugepages=0
 
 skip()
 {
@@ -77,43 +76,5 @@ check_test_requirements()
 	esac
 }
 
-save_nr_hugepages()
-{
-	orig_nr_hugepages=$(cat /proc/sys/vm/nr_hugepages)
-}
-
-restore_nr_hugepages()
-{
-	echo "$orig_nr_hugepages" > /proc/sys/vm/nr_hugepages
-}
-
-setup_nr_hugepages()
-{
-	local needpgs=$1
-	while read -r name size unit; do
-		if [ "$name" = "HugePages_Free:" ]; then
-			freepgs="$size"
-			break
-		fi
-	done < /proc/meminfo
-	if [ "$freepgs" -ge "$needpgs" ]; then
-		return
-	fi
-	local hpgs=$((orig_nr_hugepages + needpgs))
-	echo $hpgs > /proc/sys/vm/nr_hugepages
-
-	local nr_hugepgs=$(cat /proc/sys/vm/nr_hugepages)
-	if [ "$nr_hugepgs" != "$hpgs" ]; then
-		restore_nr_hugepages
-		skip "$0: no enough hugepages for testing"
-	fi
-}
-
 check_test_requirements
-save_nr_hugepages
-# The HugeTLB tests require 6 pages
-setup_nr_hugepages 6
-./va_high_addr_switch --run-hugetlb
-retcode=$?
-restore_nr_hugepages
-exit $retcode
+./va_high_addr_switch
-- 
2.53.0

