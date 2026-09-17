Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEA4C4D37DE;
	Thu, 17 Sep 2026 11:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789644026; cv=none; b=cHGvL3ikd4QNzxGFfOyIJtOYguHHhlV3f+cZzrw8JUVeH2FFXRt7o2Nu0YofjJBz+rZvJSc2p8sMTohp13sPe31/pQXOC3nG7gdhO6ZKLNxpVLXZ0Sw+293twcosCnG9HCOdvu0GPGtFpIsUwLz4OsT5jWKPNnWQ3Rtzuk2MS0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789644026; c=relaxed/simple;
	bh=8FIDVRnmopNIAGdnpQIyQoSfJVd6Jc6AKeojxfKddjA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pZSQfgQdSUCdg+EB212QFK1WWrZUVSDrV5bMbDg4VsKBEksa7Fz4fhQ5VRK/2AjL1BaHY57qJ6m/R9udC2VfZYAlX6i3AnZhXULPO5dcWFSABgAOf/e53eTK/jVoSk66Y5i7ZZkjA0MfnX/ezWglBui7vb91PWLubGiXYk8FPGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=DFUAoyAC; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="DFUAoyAC"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3C11E1F91;
	Thu, 17 Sep 2026 04:20:15 -0700 (PDT)
Received: from a081061.blr.arm.com (a081061.arm.com [10.164.19.84])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 877BF3F7B4;
	Thu, 17 Sep 2026 04:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789644018; bh=8FIDVRnmopNIAGdnpQIyQoSfJVd6Jc6AKeojxfKddjA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DFUAoyACMXV+je7j3KrKEcFwQqXT2R7/ETBB+IWWL17OYWl34QqpHPlTfqH5uxcwA
	 I2c+6eZ4SOFqMSowtcS7TqGVL8iNFR6pGPP8R5BQlHKm5IRxfYWadVw/FhlDBPKyfU
	 KAMveMSWQpFR6uuTmkZ6BI2+yoTc+Civ6jxP4PRQ=
From: Sarthak Sharma <sarthak.sharma@arm.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	John Hubbard <jhubbard@nvidia.com>,
	Kalesh Singh <kaleshsingh@google.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sarthak Sharma <sarthak.sharma@arm.com>
Subject: [PATCH 3/9] selftests/mm: mremap_test: fail unexpected mremap successes
Date: Thu, 17 Sep 2026 16:49:45 +0530
Message-ID: <20260917111951.188266-4-sarthak.sharma@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260917111951.188266-1-sarthak.sharma@arm.com>
References: <20260917111951.188266-1-sarthak.sharma@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

run_mremap_test_case() reports a test as pass when remap_region()
succeeds. But if the test was expecting failure and remap succeeds,
it should be treated as a failure and not a success.

Check test_case.expect_failure on the successful remap path. If
it expected failure, report a failure instead of success.

Fixes: 7df666253f26 ("kselftests: vm: add mremap tests")
Signed-off-by: Sarthak Sharma <sarthak.sharma@arm.com>
---
 tools/testing/selftests/mm/mremap_test.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/mm/mremap_test.c b/tools/testing/selftests/mm/mremap_test.c
index a5813a5e8f5b..ba9b7f7566d0 100644
--- a/tools/testing/selftests/mm/mremap_test.c
+++ b/tools/testing/selftests/mm/mremap_test.c
@@ -1138,12 +1138,15 @@ static void run_mremap_test_case(struct test test_case, unsigned int threshold_m
 		else
 			ksft_test_result_fail("%s\n", test_case.name);
 	} else {
+		if (test_case.expect_failure)
+			ksft_test_result_fail("%s: unexpected mremap success\n",
+					      test_case.name);
 		/*
 		 * Comparing mremap time is only applicable if entire region
 		 * was faulted in.
 		 */
-		if (threshold_mb == VALIDATION_NO_THRESHOLD ||
-		    test_case.config.region_size <= threshold_mb * _1MB)
+		else if (threshold_mb == VALIDATION_NO_THRESHOLD ||
+			 test_case.config.region_size <= threshold_mb * _1MB)
 			ksft_test_result_pass("%s: mremap time: %12lldns\n",
 					      test_case.name, remap_time);
 		else
-- 
2.53.0

