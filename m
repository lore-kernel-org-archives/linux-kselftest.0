Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F569381B0C;
	Mon,  6 Apr 2026 14:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775485367; cv=none; b=meUD+Ah/AYyootOFE2c3zy5+2dUgd5+W8xP/xy0FONOK6Qo0X/vATYZqCl6bNJREiQvC/LBJ1BHNiivC/waJDNUZFg3zREDtiL8YLIaBBWFvLt2Q6+YyZpUEEyE328EZzBdfpwTM8Uym6wcjqUk3ciQe+YbiWndfYyib0RQz5HQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775485367; c=relaxed/simple;
	bh=XYoR5ykBzH9ln8CEkCcM3Jpo8h2bXIFgxUkz6fxZ/LA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QiEEOUSxAgntT+/QQvYHuox495w3vdLZ/8ZbNoKTh3kab8Ah2bQ+qVmyLQUpDYRRjYZ2voByuuiDzDMSs7qsd8/4Zv19th8/GkR+fgf6k6WwWyeaMxX5wusGyoqrlKUnYVPQaoEpiO2f4jbLx39ZQFbkDwGWky7u7s7aE9FVuic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RVN+JTw/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RVN+JTw/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBB9EC4CEF7;
	Mon,  6 Apr 2026 14:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775485367;
	bh=XYoR5ykBzH9ln8CEkCcM3Jpo8h2bXIFgxUkz6fxZ/LA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RVN+JTw/uWxfh0PVW+2wwrufGbFwIHsBNsRuK8r4mzYYR9SfsJJMPDt7+kC2G22h9
	 /jdXEHXQ78HCa2FtJAIUMNIYUd5Z/VKxdtPDVjlrXzopWagHU/Ms7r7m9shO7BNjUM
	 g+pyM8e9AonkKyL+Vmbppo0/QfyqiuUtOyQRUSQYqI6S1aNb46Lrn6bURL/XJKv7S1
	 s1joRS/5QIcLVSMRNniGpGXua98DwX71QLLTw7mPl79cQ6+gC9PXg4d4cPaUZC0XF3
	 vGukwiZTIrYoSFfZlhsMZTAcRB8a/hZ7vu1dvSlpxmb7YI6y44wwPOUGB82847exFC
	 eBjfPOZXIt+LA==
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
Subject: [PATCH 52/53] selftests/mm: run_vmtests.sh: free memory if available memory is low
Date: Mon,  6 Apr 2026 17:17:34 +0300
Message-ID: <20260406141735.2179309-53-rppt@kernel.org>
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

Currently when running THP and HugeTLB tests, if HAVE_HUGEPAGES is set
run_test() drops caches, compacts memory and runs the test. But if
HAVE_HUGEPAGES is not set it skips the tests entirely, even if THP tests
have nothing to do with HAVE_HUGEPAGES.

Replace the check if HAVE_HUGEPAGES is set with a check of how much memory
is available. If there is less than 256 MB of available memory, drop caches
and run compaction and then continue to run a test regardless of
HAVE_HUGEPAGES value.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 tools/testing/selftests/mm/run_vmtests.sh | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/tools/testing/selftests/mm/run_vmtests.sh b/tools/testing/selftests/mm/run_vmtests.sh
index b9e520194634..b42d19036182 100755
--- a/tools/testing/selftests/mm/run_vmtests.sh
+++ b/tools/testing/selftests/mm/run_vmtests.sh
@@ -99,6 +99,9 @@ EOF
 	exit 0
 }
 
+mem_available_kb=$(awk '/MemAvailable/ {print $2}' /proc/meminfo)
+mem_available_Mb=$((mem_available_kb / 1024))
+
 RUN_ALL=false
 RUN_DESTRUCTIVE=false
 TAP_PREFIX="# "
@@ -239,15 +242,12 @@ run_test() {
 		# On memory constrainted systems some tests can fail to allocate hugepages.
 		# perform some cleanup before the test for a higher success rate.
 		if [ ${CATEGORY} == "thp" -o ${CATEGORY} == "hugetlb" ]; then
-			if [ "${HAVE_HUGEPAGES}" = "1" ]; then
-				echo 3 > /proc/sys/vm/drop_caches
-				sleep 2
-				echo 1 > /proc/sys/vm/compact_memory
-				sleep 2
-			else
-				echo "hugepages not supported" | tap_prefix
-				skip=1
-			fi
+		    if (( $mem_available_Mb < 256 )); then
+			echo 3 > /proc/sys/vm/drop_caches
+			sleep 2
+			echo 1 > /proc/sys/vm/compact_memory
+			sleep 2
+		    fi
 		fi
 
 		local test=$(pretty_name "$*")
-- 
2.53.0

