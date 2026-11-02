Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793613798;
	b=imMe4pc9TRKgGLMjWjW9vQ9W0JzXs/jGWSB53PAu95b4d+zU3vNocDF3ETYMz5hvAQTi
	 PZcxoqrbDbzAvpHVT3Q5tzn+7tPAPwG4sgSSl5zayXL2L1p3eXS098kSzSjIW+YOtgyI9
	 QyO3c/4/Vi9VsCZkJ7kLUbBCvkl6tbhPbcvl/yF2OQh3QZA8JjZQqB9OoPPqbVWKAMA3r
	 tkJOAYU7anX177qSXBft+2koPczn5DHTpi219POr2le9u9jwSojoG1DkblWXl404MRr5d
	 qZrUladUEFXDiVaKPO0oQ7KWV0ScXtJGe0rWRAHOjSL9pg+iVlthGb9m+63K59ymyLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793613798;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=D8izb9PqMMklTelG/61RmKlhnMnD7pxGRQkRjnQiPA8=;
	b=BEjJ0IP4gXSfPkqkwcapqzXX1DBLL77Kldi21nPTk8AIjAJYmcUUvNUPfpkHOPboyIjL
	 C8hFlADYpRpnWioqk4MQS+MRbvE/Sq/7QOCbp2e5UjIRQAK/HX/uhXr/VC2/DoZTPtMtS
	 2nKd4RJKvgCuOtP43pH47ucRq/I7MM/WmgVnPvck9UWgpz0Kd/NhLB956qmjzCKAR98oE
	 53JKWD5WF84iVWvWRAiJ2UbEzlKVojcqb2PG3kYKXR1NFj6fTyhp6trvWmpiXpOdT4GLX
	 JMLnxSWBKZJP1k00/iQI6BU0JH/Sd5sYatwBHw5xSLnTCF6hAL1tWlyLk8zJX/4OlWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=HSbNQsQX;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87D48606A326;
	Mon,  2 Nov 2026 10:03:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87D48606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=HSbNQsQX
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D61141595;
	Mon,  2 Nov 2026 02:03:14 -0800 (PST)
Received: from a081061.arm.com (unknown [10.163.156.187])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7EB403F59E;
	Mon,  2 Nov 2026 02:03:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793613797; bh=oSxZOGxLsR5uqrMDGNEtoYyQjxBFtNAV737u1zMG5mY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HSbNQsQXgcbaVwap0bQgZKzq64AEwJIOoHUKDagnDKOxKb5pju8OFQ8PV6pUYWOXA
	 c1ZP646n16SLOVpvdDLPzMb9yZFAUKrVth7pr5t944JugwHSFOm3eHXss4Bv/H5tTS
	 rNg7v8RxjAdpM3AXtUGfHh4r4GI80sn9vmmQo434=
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
Subject: [PATCH RESEND v2 06/12] selftests/mm: mremap_test: fail unexpected mremap successes
Date: Mon,  2 Nov 2026 15:32:05 +0530
Message-ID: <20261102100211.141831-7-sarthak.sharma@arm.com>
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
index 5b3ab12c2207..111cc3414073 100644
--- a/tools/testing/selftests/mm/mremap_test.c
+++ b/tools/testing/selftests/mm/mremap_test.c
@@ -1124,12 +1124,15 @@ static void run_mremap_test_case(struct test test_case,
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

