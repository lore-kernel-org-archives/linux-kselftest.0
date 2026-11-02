Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793613766;
	b=ubAvncM4Pwgopu50/nHnt2anE9LIk4zEsfhahpwqpeE4cWIhy/ZT1i4UsIihDEhfHi6m
	 sE/NEwXuOsBDKue8g/MV7cnvlf9r2W22dOStzOivPkLZ0vgJ8RPrdSc0gCYW/6NUK4H03
	 5kwkGB8WnEN9T2+4w3ph/nsO2JgbnkKJjeTbyDdGv9vwnXGWBiIGOvKLqU6eCs7k/Vkcj
	 BQAtsyizUPluRNwR4j2Tr+JhX15U80tpFLwuWdp3O5LcsV/+06QYg1nilc+T7s8f2v/s1
	 RucKjLEkXwskY7z+QpdB9xCVw/yFwwN9DGy6lmxbJpeRnRqgO7vDE6ee40dymXrHy5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793613766;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=i4Em7Py7g4q0VGn8W2HCRonK/evyicnat7HWkjVfGeQ=;
	b=HO121zH8djzmMONJRH02GvI5MroEZY0h/WVUZ55vTStDBxk2RWdk7w2qZLcDvHWJI3XN
	 MWkuDG9vTaKoAxP7I6Yl7aN+Q0S6unUr68yXaf3Kqt0P+Trmz4FOhG39QqwWjetv5ymI9
	 0AI+JoeuGBF5pfGQO1Ngu68nheysnvpPF1jqtMffcjS7afS7s87gBnrGwS36IFJ6OEJ77
	 hiL8bV4CQ9Tf1QjpEjbuqVPZusYvhrvYhXwd6WGenZ+OZUA1cQttfIvfBbiKEsm19A2GZ
	 8i/GNmJiFy00nhpWp9ZucgSamQ4NqiyD5EHgzBeD67Yab2iSCR4Lr2pXgjlAd7vxxEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=AFH7tUh1;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F14DC606A330;
	Mon,  2 Nov 2026 10:02:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F14DC606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=AFH7tUh1
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6FBFB1595;
	Mon,  2 Nov 2026 02:02:42 -0800 (PST)
Received: from a081061.arm.com (unknown [10.163.156.187])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 32D743F59E;
	Mon,  2 Nov 2026 02:02:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793613765; bh=4thU010nDUqthwP71EjUPPcaPA4vWd28xw0e1Se/q+w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AFH7tUh17/igJI+PU3NpCguj2gqLFnslktS0xnrfE8IGjqLMMK7IercLlwfXxs9pR
	 Ce25TkwLPR7wn7Sje93s/IXgJH8o1Er83jVJ4xZGbGSqjljynF8nXEZzTSlNDpI7PS
	 r/NDt4VY5A8VqdlUAYrftBfXbfBX+nwwfw5ytzlg=
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
Subject: [PATCH RESEND v2 02/12] selftests/mm: mremap_test: drop munmap() checks from cleanup paths
Date: Mon,  2 Nov 2026 15:32:01 +0530
Message-ID: <20261102100211.141831-3-sarthak.sharma@arm.com>
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

mremap_test checks the return value of munmap() on some cleanup
paths and prints an error when it fails. These failures do not
affect the test result and there is nothing useful we can do
about them during cleanup.

Stop checking munmap() return value on cleanup paths.

Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
Signed-off-by: Sarthak Sharma <sarthak.sharma@arm.com>
---
 tools/testing/selftests/mm/mremap_test.c | 35 +++++++++---------------
 1 file changed, 13 insertions(+), 22 deletions(-)

diff --git a/tools/testing/selftests/mm/mremap_test.c b/tools/testing/selftests/mm/mremap_test.c
index 15d8f7458251..ea1348a9532e 100644
--- a/tools/testing/selftests/mm/mremap_test.c
+++ b/tools/testing/selftests/mm/mremap_test.c
@@ -364,8 +364,7 @@ static void mremap_move_within_range(unsigned int pattern_seed, char *rand_addr)
 	}
 
 out:
-	if (munmap(ptr, size) == -1)
-		perror("munmap");
+	munmap(ptr, size);
 
 	if (success)
 		ksft_test_result_pass("%s\n", test_name);
@@ -510,10 +509,8 @@ static void mremap_move_multiple_vmas(unsigned int pattern_seed,
 	}
 
 out_unmap:
-	if (munmap(tgt_ptr, 2 * size))
-		perror("munmap tgt");
-	if (munmap(ptr, size))
-		perror("munmap src");
+	munmap(tgt_ptr, 2 * size);
+	munmap(ptr, size);
 
 out:
 	if (success)
@@ -590,10 +587,8 @@ static void mremap_shrink_multiple_vmas(unsigned long page_size,
 	}
 
 out_unmap:
-	if (munmap(tgt_ptr, size))
-		perror("munmap tgt");
-	if (munmap(ptr, size))
-		perror("munmap src");
+	munmap(tgt_ptr, size);
+	munmap(ptr, size);
 out:
 	if (success)
 		ksft_test_result_pass("%s%s\n", test_name,
@@ -713,10 +708,8 @@ static void mremap_move_multiple_vmas_split(unsigned int pattern_seed,
 	}
 
 out_unmap:
-	if (munmap(tgt_ptr, size))
-		perror("munmap tgt");
-	if (munmap(ptr, size))
-		perror("munmap src");
+	munmap(tgt_ptr, size);
+	munmap(ptr, size);
 out:
 	if (success)
 		ksft_test_result_pass("%s%s\n", test_name,
@@ -948,10 +941,8 @@ static void mremap_move_multi_invalid_vmas(FILE *maps_fp,
 	}
 
 out_unmap:
-	if (munmap(tgt_ptr, size))
-		perror("munmap tgt");
-	if (munmap(ptr, size))
-		perror("munmap src");
+	munmap(tgt_ptr, size);
+	munmap(ptr, size);
 out_close_uffd:
 	close(uffd);
 out:
@@ -1146,11 +1137,11 @@ static void mremap_move_1mb_from_start(unsigned int pattern_seed,
 	}
 
 out:
-	if (src && munmap(src, c.region_size) == -1)
-		perror("munmap src");
+	if (src)
+		munmap(src, c.region_size);
 
-	if (dest && munmap(dest, c.region_size) == -1)
-		perror("munmap dest");
+	if (dest)
+		munmap(dest, c.region_size);
 
 	if (success)
 		ksft_test_result_pass("%s\n", test_name);
-- 
2.53.0

