Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 810CA35BDBB;
	Sat, 18 Apr 2026 11:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776510069; cv=none; b=lsknh+bm/D+SaUgrD3W0NMrdna8hk9lOPTLRGlsemcQAryddHPRZ2JP/Bepmp4d4wElC+EQvnpuru6U0N4Evs9aWD4hNMQn9CE/FwWJYiJxBEM/bYHb++U/ItmESlBYHEUIboC/GPZyYvndjuRkBp0/odw92ctntvX88p0+Pxf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776510069; c=relaxed/simple;
	bh=XYoR5ykBzH9ln8CEkCcM3Jpo8h2bXIFgxUkz6fxZ/LA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PHhXJXDGkCVGeuO8gzrWtjwRqEK5rnGvmT5QE31UuaEadVndEQasT2a4jWhyaWChY2KbuV2zRwNuW0ruGyj1SolnSd68zKBp83IEpQMqQZyRhsteFpqzyWN1efpSObH7gXuAVvmQ/UP6jHfA3r9btCeePm3dKbYOErRh1JLuftU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oUf1JsJl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oUf1JsJl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCB07C2BCB3;
	Sat, 18 Apr 2026 11:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776510069;
	bh=XYoR5ykBzH9ln8CEkCcM3Jpo8h2bXIFgxUkz6fxZ/LA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oUf1JsJlDlGVOwg3ohkg2AVYP8zRYvpQCyI6/xMXz6szqRoZGozv3mUPbiRMJtCZG
	 4BEBFXX1AESe6C4zXZyZFZx4xZ04/Q5G9ZLuIUqNmpoJk913stlnIb8gM2tewFxFga
	 DEartBWSlk0FXNJKzJbJP47Nbb0XTAmA7wYCJuIpVy86h1Y6IJrhrzQhgyM5rRxhXo
	 fdNaZd/ZPhexuhWh9/4irQQ46JRSsW3WZZbg3QvoM6Q/ylvJPSzRLzLmsJiDC9ntgl
	 FpxNIa/nehQ5M0SkwzVQ6MNFoYtfMktJij7HVB+ajbaHpDE9ZFmNOFy0hqz835OLGE
	 n8n1Sdq4TXhJQ==
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
Subject: [PATCH v2 52/53] selftests/mm: run_vmtests.sh: free memory if available memory is low
Date: Sat, 18 Apr 2026 13:55:37 +0300
Message-ID: <20260418105539.1261536-53-rppt@kernel.org>
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

