Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6A3A3B2D38;
	Tue,  6 Oct 2026 09:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791278737; cv=none; b=rzstzjx5vbXBAd0adka1I/DXX3iSJ0hc+tMSi/qMrRW7eYlm+p1uHscWi/OTH6F98qrUStUulV9fHEkeslbwjnYWt9CVudXpH1y2UcPwCPOqYZix+8UdETsjQWdBkDsElqnPAIVXC+XcCCEX8lRfQ8ZBZvWw7/a9ceyehNlynQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791278737; c=relaxed/simple;
	bh=IF3lUGPWMJzNvOuGwTaC/WBQpUsleXIykIvYsx0nECU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nndrGCGci/Kjcb3K3hTB/pFWPaW+4v7pKRB4o+iYKTIhv8jsfHwgmG6Hl4L7jbaJxqNlkDpAJb5LBemseMTvfc7jzOoxD3q9uR8qciEReG1ztbvaqrYEUyIfKpLaO8SMfBXymAj7MsY8Zz14X7E2S4F1txTE4rMsaS9b+g96tpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=o4rRTIz8; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="o4rRTIz8"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C2B761516;
	Tue,  6 Oct 2026 02:25:31 -0700 (PDT)
Received: from a081061.blr.arm.com (a081061.arm.com [10.164.19.84])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DC12E3F763;
	Tue,  6 Oct 2026 02:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791278735; bh=IF3lUGPWMJzNvOuGwTaC/WBQpUsleXIykIvYsx0nECU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=o4rRTIz8i02AH/FtWQAVblnib4ItIIMS9KkATZu3f+BZI4kar62g5m07E45mleaGM
	 n/ZRG9gvU7bAhNRpT/TYnoyze9p/ULxXN5IaR+dBiazUP7bw6Vk1NoKbw1Un6RJyTB
	 5OMWfGRhFdeLWBrLq6CJS56vyyus6UrbnxPGvln4=
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
Subject: [PATCH v2 02/12] selftests/mm: mremap_test: drop munmap() checks from cleanup paths
Date: Tue,  6 Oct 2026 14:55:01 +0530
Message-ID: <20261006092511.145776-3-sarthak.sharma@arm.com>
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
index 41f211c39c83..95ce6563289c 100644
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
@@ -1144,11 +1135,11 @@ static void mremap_move_1mb_from_start(unsigned int pattern_seed,
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

