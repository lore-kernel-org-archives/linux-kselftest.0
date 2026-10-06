Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD32A3B8D6D;
	Tue,  6 Oct 2026 09:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791278756; cv=none; b=djtPSmhJ1SR3uo9cC/6h7YGwRiYBKgfb4jiyZ+0Pogxi1UqpxbBx5L7QIX9MzqCZfxLNVZ4v5KD3tNkzrWSwXEH20mZ6NDHRLKjmEAtReGXpiFN3r9K15wGqk7jh3Qr/cCbwDkJiNoB3D5DAJdzUhx6ngMmwhDBPmF88pOsVZ+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791278756; c=relaxed/simple;
	bh=a586Sp6pUc/Rl0Hz27O7nZU4psH3uyrQcOIiCrjEAuk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HKjBPUFofhifkaTIWX6wqdkyfTpheNRG9b4F/w44ctA3mjoVmrZ4rrx+s+KY9hQCMf8ESv7JQvrRG5PZuv2/tBI8OcmAPOSoTbdBoRhP1A6VKSxWL2uls6yAhquUN2ZjFubT40aikE9QkY3naQGJmL4IwKQU+dk1AR9JMBszCX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=NqrPAzy5; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="NqrPAzy5"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0C0BA1516;
	Tue,  6 Oct 2026 02:25:51 -0700 (PDT)
Received: from a081061.blr.arm.com (a081061.arm.com [10.164.19.84])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 261E13F763;
	Tue,  6 Oct 2026 02:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791278754; bh=a586Sp6pUc/Rl0Hz27O7nZU4psH3uyrQcOIiCrjEAuk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NqrPAzy5JUyK6aAQqeRno6BaQX5SMC0KAUPoany2vZccoCJ0lR1GZVDcCfe1VS8V/
	 MORnFLEHBiT7ImP/rQMIn7FHj66Qxb8m7KkmdI430E6XoI8JYSsFBnUPgOz+hKkS+j
	 jxLj1llAp1wOu16+f7UMeZ9vgdol206SgobB/IFY=
From: Sarthak Sharma <sarthak.sharma@arm.com>
To: akpm@linux-foundation.org,
	david@kernel.org
Cc: ljs@kernel.org,
	liam@infradead.org,
	vbabka@suse.com,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	shuah@kernel.org,
	jhubbard@nvidia.com,
	kaleshsingh@google.com,
	anshuman.khandual@arm.com,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sarthak Sharma <sarthak.sharma@arm.com>
Subject: [PATCH v2 06/12] selftests/mm: mremap_test: fail unexpected mremap successes
Date: Tue,  6 Oct 2026 14:55:05 +0530
Message-ID: <20261006092511.145776-7-sarthak.sharma@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261006092511.145776-1-sarthak.sharma@arm.com>
References: <20261006092511.145776-1-sarthak.sharma@arm.com>
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
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Signed-off-by: Sarthak Sharma <sarthak.sharma@arm.com>
---
 tools/testing/selftests/mm/mremap_test.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/mm/mremap_test.c b/tools/testing/selftests/mm/mremap_test.c
index 0be47348ecd0..1baf6374ec67 100644
--- a/tools/testing/selftests/mm/mremap_test.c
+++ b/tools/testing/selftests/mm/mremap_test.c
@@ -1122,12 +1122,15 @@ static void run_mremap_test_case(struct test test_case,
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

