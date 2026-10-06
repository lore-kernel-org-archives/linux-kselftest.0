Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 581003B71C2;
	Tue,  6 Oct 2026 09:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791278738; cv=none; b=QOnSJkXG3WQUD9JIKdRDEM5ZKwVCu4gtnG593BCg8ZdYuX/9MLKaLo68YFvVOCxLz9gWmdI1DeEDY2etDiTWxyuLdSNla7Q1JtwjRpEmBhXx+FLrAo2hG0w2l4gqb+4N71sZUKoZwbJXFKMcPyD2jGWLbDYbgxdqnrvpik3m6Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791278738; c=relaxed/simple;
	bh=rT9dP+qi1lu9WTSbwSfaqr1GwJLKLuxgpDVmof6dow8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=km9Ua3vmk12Sy1oJOKP30m8OCMn5xW7jXX8ODwnfgI8F7qLHtqMD/bbs05GzcFUmbdZsi7SO+VaMQTywlCPe5wY74sk7SwBhnWT3v0LHfmfu0AmivNCvHl9sSUxt+Km1PJs3A14Qs8NnHFy07p0le9SdduKUqlp16/vuSSnc5VU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=OzD07csJ; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="OzD07csJ"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F210B152B;
	Tue,  6 Oct 2026 02:25:26 -0700 (PDT)
Received: from a081061.blr.arm.com (a081061.arm.com [10.164.19.84])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 178663F763;
	Tue,  6 Oct 2026 02:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791278730; bh=rT9dP+qi1lu9WTSbwSfaqr1GwJLKLuxgpDVmof6dow8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OzD07csJ+pYeoO5LCpdCLD0TEiemxhh4995NGck9YbzWvxwT+Sew2JezCs0TC7JQM
	 mnliVHtWtjBGb9mF9gSqX9OVrflKe//lmOQ5gYSM78W5wPc5/hrk+u/850lVFEJjXV
	 4ap2PA7jVe7uhQs8ROOhK4+IeuEMli5iGMK11cHQ=
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
Subject: [PATCH v2 01/12] selftests/mm: mremap_test: remove command line options
Date: Tue,  6 Oct 2026 14:55:00 +0530
Message-ID: <20261006092511.145776-2-sarthak.sharma@arm.com>
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

mremap_test supports command line options for changing
the validation threshold and random pattern seed.

As part of a larger series to remove validation threshold
and randomization, remove all command line options from
the test. The test is already invoked without any
arguments in run_vmtests.sh, so no runner changes are
required.

Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
Signed-off-by: Sarthak Sharma <sarthak.sharma@arm.com>
---
 tools/testing/selftests/mm/mremap_test.c | 45 +-----------------------
 1 file changed, 1 insertion(+), 44 deletions(-)

diff --git a/tools/testing/selftests/mm/mremap_test.c b/tools/testing/selftests/mm/mremap_test.c
index 97abf4713cc5..41f211c39c83 100644
--- a/tools/testing/selftests/mm/mremap_test.c
+++ b/tools/testing/selftests/mm/mremap_test.c
@@ -1188,49 +1188,9 @@ static void run_mremap_test_case(struct test test_case, int *failures,
 	}
 }
 
-static void usage(const char *cmd)
-{
-	fprintf(stderr,
-		"Usage: %s [[-t <threshold_mb>] [-p <pattern_seed>]]\n"
-		"-t\t only validate threshold_mb of the remapped region\n"
-		"  \t if 0 is supplied no threshold is used; all tests\n"
-		"  \t are run and remapped regions validated fully.\n"
-		"  \t The default threshold used is 4MB.\n"
-		"-p\t provide a seed to generate the random pattern for\n"
-		"  \t validating the remapped region.\n", cmd);
-}
-
-static int parse_args(int argc, char **argv, unsigned int *threshold_mb,
-		      unsigned int *pattern_seed)
-{
-	const char *optstr = "t:p:";
-	int opt;
-
-	while ((opt = getopt(argc, argv, optstr)) != -1) {
-		switch (opt) {
-		case 't':
-			*threshold_mb = atoi(optarg);
-			break;
-		case 'p':
-			*pattern_seed = atoi(optarg);
-			break;
-		default:
-			usage(argv[0]);
-			return -1;
-		}
-	}
-
-	if (optind < argc) {
-		usage(argv[0]);
-		return -1;
-	}
-
-	return 0;
-}
-
 #define MAX_TEST 15
 #define MAX_PERF_TEST 3
-int main(int argc, char **argv)
+int main(void)
 {
 	int failures = 0;
 	unsigned int i;
@@ -1259,9 +1219,6 @@ int main(int argc, char **argv)
 
 	pattern_seed = (unsigned int) time(&t);
 
-	if (parse_args(argc, argv, &threshold_mb, &pattern_seed) < 0)
-		exit(EXIT_FAILURE);
-
 	ksft_print_msg("Test configs:\n");
 	ksft_print_msg("threshold_mb=%u\n", threshold_mb);
 	ksft_print_msg("pattern_seed=%u\n", pattern_seed);
-- 
2.53.0

