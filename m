Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0F933B6C9;
	Tue, 28 Apr 2026 20:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777409320; cv=none; b=PyhNBU9z8qnwK6Rqo/n2AalI7O1fFSbGq2zxVDFyR+vflh+fr3FvOr//JJcBku6jEzby70tu+b2fn3Z43vV26aqOajT6KIrEXEgRxuEquoNxCCBJQm/bsUcVXrxztgMrm9Lb8sk+EMEJEEWRx8UCn9iRD0eQ8S3UbfPLsRko8c4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777409320; c=relaxed/simple;
	bh=XYoR5ykBzH9ln8CEkCcM3Jpo8h2bXIFgxUkz6fxZ/LA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R0YZWICS2rZOU+fQPDMiKJBt1wYApZtL0E7HQ3tm2nLWGiiHoTxDT8eQFMmUFYjM7fiiUyOJ7k4scJ+CGoT+XUK5q8SCCOjC5CfbZdoGdpaXdqBe3HYAMDIB+NxRtHdPMtG7DwLacOstz7emFNiRek2ysKobNiLHW2HI6/wgiEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KtqfrHTS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KtqfrHTS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3441EC2BCB3;
	Tue, 28 Apr 2026 20:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777409320;
	bh=XYoR5ykBzH9ln8CEkCcM3Jpo8h2bXIFgxUkz6fxZ/LA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KtqfrHTS9/FD20Apc6D6Tc83MdB6i2S17dvN7aBXRCPZwoTGCiyaxEQu76quQaxOH
	 EDbLBrK09yVRuVjNG96piJu6xIptkjuo5ymsEv2ot/85tUVh0hwY57HLzsg3GTz6MH
	 lUMOoawbdRHlF4zZO2qY7frcKff9DET5JqFZkx9Z1lm4VkFtjIl3Zz1US2j7MxBq/Z
	 Z8hAzlo1QqTnexXK3qBvdh0BxU5BfJPvWcK/pncK9zuT2vfQjt9rEcdbAWjWNHqZbH
	 Pjtasw+ZBZq89CI+EJYemgvjUdlBKpYoMuuUzEFJ/lWb/wVPkpa4FsWeSmKn0gpzJi
	 mBpD7G/+Ge6Uw==
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
Subject: [PATCH v3 53/54] selftests/mm: run_vmtests.sh: free memory if available memory is low
Date: Tue, 28 Apr 2026 23:42:39 +0300
Message-ID: <20260428204240.1924129-54-rppt@kernel.org>
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

