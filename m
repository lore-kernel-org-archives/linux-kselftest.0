Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793613758;
	b=t7gEQVzUhEXp7/atqz086B+p1i+y05yyEBMgMvyY6lZsnOLnzQ5FBMCV0a1HCPvsFkcA
	 sfjB8vm1zBKJc7MZRiJLIKImpSTNylVUXBGXV9u29L0Skwc77q96wK8eTcEet2NcyvUb0
	 giJwCX9XuwWV32ktZCdxTfz0JAABDHsn3T9sdU9h8Qw8SfKQSVS7pl5bA9nBh18ftyNvb
	 cthQyOu8jSOLfRiTfMpVfNwgNc1eARUCejurMyEkH5OgPW/iWv5WmLkYXAD+TA9kqyiE3
	 dOalssjB5djeD0GZU5hTOZXdSv2M7T5/U9CCciQzIQ//Bm/6cGXXpP2Uxt5cgkthBrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793613758;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GOgDKaBCd/uW5l3tWVac81a1JgyJkjCjE7oa9weDmqs=;
	b=GsNggJS+xHKy62g2PA20hGldOkd5xqHQqmGUQa354rNzdZ9Px6EyapPfKUDE96s2/jT7
	 5tG1TI44jmJTHg4/bPl7BzfRgVO8U9LHg/ftVwIAFdB5BIl8Eol37tu8PSEzza4PiRNkx
	 w+ADaqLyFF7gWTi4L1pme/HsWZdPpQNp/xp5HB7eRlwCcGtrooyZmUhwO52DP/2ZhwEt1
	 lMf9JFy/9ALRr55adZdVD4r9dEY/wxkhOD+bq8UplxVMlWJ/ZUsYui4WT+Y7Y59/02GNk
	 PVaSPtwgGl0e2JabZxy2f2Hlq/d2nYt1Waw0W4qHAdtmmIKIWDM8ezTGe0P4CJbdmXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=LUs5F0sL;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD546606A327;
	Mon,  2 Nov 2026 10:02:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD546606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=LUs5F0sL
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 410981762;
	Mon,  2 Nov 2026 02:02:34 -0800 (PST)
Received: from a081061.arm.com (unknown [10.163.156.187])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 06D823F59E;
	Mon,  2 Nov 2026 02:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793613757; bh=HyPdk0n2/OF09K954RkPRG3iIDUACQY+PsIvlzDGa20=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LUs5F0sL+6hylMUkR+TZVfKkl10paUGcrplQiQQZ6WUfKLIjCLPhYGglP6Wb8wXTz
	 ar+3NnOPL300FWcax/3rYqdtkE0QnKJoVzemZcTwruUYy/r54YOhcITgXHWqwM/qrV
	 h/gacCCm20AoPv79aMBnztDGWfWcledNR5IdXzaM=
From: Sarthak Sharma <sarthak.sharma@arm.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	John Hubbard <jhubbard@nvidia.com>,
	Kalesh Singh <kaleshsingh@google.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Park Tae-sun <ts930@dgu.ac.kr>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sarthak Sharma <sarthak.sharma@arm.com>
Subject: [PATCH RESEND v2 01/12] selftests/mm: mremap_test: remove command line options
Date: Mon,  2 Nov 2026 15:32:00 +0530
Message-ID: <20261102100211.141831-2-sarthak.sharma@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261102100211.141831-1-sarthak.sharma@arm.com>
References: <20261102100211.141831-1-sarthak.sharma@arm.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
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
index 31b484517bda..15d8f7458251 100644
--- a/tools/testing/selftests/mm/mremap_test.c
+++ b/tools/testing/selftests/mm/mremap_test.c
@@ -1190,49 +1190,9 @@ static void run_mremap_test_case(struct test test_case, int *failures,
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
@@ -1261,9 +1221,6 @@ int main(int argc, char **argv)
 
 	pattern_seed = (unsigned int) time(&t);
 
-	if (parse_args(argc, argv, &threshold_mb, &pattern_seed) < 0)
-		exit(EXIT_FAILURE);
-
 	ksft_print_msg("Test configs:\n");
 	ksft_print_msg("threshold_mb=%u\n", threshold_mb);
 	ksft_print_msg("pattern_seed=%u\n", pattern_seed);
-- 
2.53.0

