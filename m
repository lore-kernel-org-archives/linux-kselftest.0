Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66263367F51;
	Sat, 18 Apr 2026 11:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776510063; cv=none; b=s1g5YeDqUIN8fv9e6Z6p23WTzEdKVlRyqnEFNLXVsUAbWstlPe6O9TMjliBaXErqbuqekQ+jkFf+j07YBUVlbDdcGVmJPAW/exdiVPVo5z2VEhmNR9OcLBRKHuHGluY8l8iXjpiph23Rva+TjhdpS4/MY/yHqztPxqPxBPZkGw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776510063; c=relaxed/simple;
	bh=M6q1zkEt1sbIFV6K++NJye6dlph/Y82XdwR7nYmElQA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q+T4WGGQTdsnxZSoUroh2tHtw5FqGCuePDY1rV3/aF/Q7cj+I1YoZ/8WDi3SvMPO8P3FGOFiWH0mocbSpHtZWFmm7IznAyfpc0/7GslTQkNO5Cufo2yllRmcP/GIB5vYt8iKKvV55qmZTpSudVwnrwuGexGBGicV+xCau0hLfbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qRLqD8XX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qRLqD8XX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44825C2BCB7;
	Sat, 18 Apr 2026 11:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776510063;
	bh=M6q1zkEt1sbIFV6K++NJye6dlph/Y82XdwR7nYmElQA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qRLqD8XXobTlV3shNrjjV/Kn3npKRpbK0cLJy7y4EY11if6PfAefWSKJOf/kMBJZw
	 amNn/GjBjMO8/GgTHIIubqALfsex3oaPvaopNEovjV3/8zapxzolvtgoJpRQ+xyaB/
	 7pvGs9/uBwU5yPljkk2hklPqHQR+3iXvnxj9VKoU/PegVPAHtCaXlV2lebsfLiYyDy
	 22px77q6P666BhngIUCoxnIJyRI0ZJvnQgUBb3okM5tBA2ZY9BrV1PEVUz4XxA55wU
	 z2Mq2Bt9yQN87isK1IGmv80CcstBgeE3Iu55mcGEcgjWfSlFK8ewQYtxKER/raYeIX
	 VxtMa+ZbzrWEg==
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
Subject: [PATCH v2 51/53] selftests/mm: va_high_addr_switch.sh: drop huge pages setup
Date: Sat, 18 Apr 2026 13:55:36 +0300
Message-ID: <20260418105539.1261536-52-rppt@kernel.org>
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

Since va_high_addr_switch takes care of setting up huge pages, there is
no need to set them up in the va_high_addr_switch.sh wrapper script.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 .../selftests/mm/va_high_addr_switch.sh       | 39 +------------------
 1 file changed, 1 insertion(+), 38 deletions(-)

diff --git a/tools/testing/selftests/mm/va_high_addr_switch.sh b/tools/testing/selftests/mm/va_high_addr_switch.sh
index 9492c2d72634..d66c0fd3cb4d 100755
--- a/tools/testing/selftests/mm/va_high_addr_switch.sh
+++ b/tools/testing/selftests/mm/va_high_addr_switch.sh
@@ -9,7 +9,6 @@
 
 # Kselftest framework requirement - SKIP code is 4.
 ksft_skip=4
-orig_nr_hugepages=0
 
 skip()
 {
@@ -77,43 +76,7 @@ check_test_requirements()
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
+./va_high_addr_switch
 retcode=$?
-restore_nr_hugepages
 exit $retcode
-- 
2.53.0

