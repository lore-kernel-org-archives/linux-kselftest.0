Received: from mta0.migadu.com (out-12.mta0.migadu.com [91.218.175.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A729A3AEB39
	for <linux-kselftest@vger.kernel.org>; Mon, 17 Aug 2026 06:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786947620; cv=none; b=hmIUXFGzSr3K7EgpjNjK2G9CtI71WpeIIJyeFo8XLA4nShvaX06tq3Xwfs6YbDU6i6GPcA0sOIrW8CujlzmCudO0gx/HHneBfKxJcz8QLCpNPIX21IZw3eWfuj2c7x5blno0iD/tf6b9n4GTr4FcUyNbFI+xsinkIOjoe8SLQMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786947620; c=relaxed/simple;
	bh=k9Hg/Aix5bXOJ45/B31jl2pbqakUepn4Yh5kPod+wDU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rIb+lHCg8/9ThVC+pz5LCMUVvebSGQbE1tFSy0nu0I9cJAVoA1UF/fIt7cU5AaFclTpA7EbwzB9eSSDWsvCCA1Qkbn7uoBYE6OY5jLu3+iCdWSnEb+BnECsHg783wJhVBuhI76hEnDW9dT4rC9rtwNxacLBRHHaCqV3+kjjMffU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ZtJjXG26; arc=none smtp.client-ip=91.218.175.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ZtJjXG26"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=k9Hg/Aix5bXOJ45/B31jl2pbqakUepn4Yh5kPod+wDU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1786947616; v=1; x=1787552416;
 b=ZtJjXG26sMGVVKzxdBbJ8fIRgU3DCIobVeH8X8eRtvAr3xs+6Qcc7/0UNUEEGrUDB+INpLc8
 dfw1a55WGONBVbXZIikXTWcgFVc5ZyyX2BdOA4B4jfzF+9BkxXFb1KSGpoflcjlgee6aq1R1i+E
 wJCByBwYF43J/+WgSsUQCYI8=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: from localhost.localdomain (223.70.159.239)
	by smtp.migadu.com with ESMTPS id 5bb4235a9e59466b;
	Mon, 17 Aug 2026 06:20:16 +0000
X-Migadu-Flow: FLOW_OUT
From: Hongfu Li <hongfu.li@linux.dev>
To: akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	liam@infradead.org,
	nico.pache@linux.dev,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	lance.yang@linux.dev,
	usama.arif@linux.dev,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	shuah@kernel.org
Cc: linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	hongfu.li@linux.dev,
	Hongfu Li <lihongfu@kylinos.cn>
Subject: [PATCH] selftests/mm: khugepaged: consolidate error exits via kselftest helpers
Date: Mon, 17 Aug 2026 14:19:55 +0800
Message-ID: <20260817061955.45454-1-hongfu.li@linux.dev>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hongfu Li <lihongfu@kylinos.cn>

Replace the perror()+exit(EXIT_FAILURE) pattern with
ksft_exit_fail_perror() so failures are reported through the
kselftest framework, consistent with the rest of the file.

Signed-off-by: Hongfu Li <lihongfu@kylinos.cn>
---
 tools/testing/selftests/mm/khugepaged.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
index 0d6c71ed2fae..8d1b87f2195c 100644
--- a/tools/testing/selftests/mm/khugepaged.c
+++ b/tools/testing/selftests/mm/khugepaged.c
@@ -358,21 +358,15 @@ static void *file_setup_area_common(int nr_hpages, enum file_setup_ops setup)
 		ksft_exit_fail_perror("open()");
 
 	size = nr_hpages * hpage_pmd_size;
-	if (ftruncate(fd, size)) {
-		perror("ftruncate()");
-		exit(EXIT_FAILURE);
-	}
+	if (ftruncate(fd, size))
+		ksft_exit_fail_perror("ftruncate()");
 	p = mmap(BASE_ADDR, size, PROT_READ | PROT_WRITE,
 		MAP_SHARED, fd, 0);
-	if (p != BASE_ADDR) {
-		perror("mmap()");
-		exit(EXIT_FAILURE);
-	}
+	if (p != BASE_ADDR)
+		ksft_exit_fail_perror("mmap()");
 	fill_memory(p, 0, size);
-	if (msync(p, size, MS_SYNC)) {
-		perror("msync()");
-		exit(EXIT_FAILURE);
-	}
+	if (msync(p, size, MS_SYNC))
+		ksft_exit_fail_perror("msync()");
 	close(fd);
 	munmap(p, size);
 	success("OK");
@@ -447,7 +441,7 @@ static bool file_check_huge(void *addr, size_t len, int nr_hpages,
 	case VMA_SHMEM:
 		return check_huge_shmem(addr, len, nr_hpages, hpage_size);
 	default:
-		exit(EXIT_FAILURE);
+		ksft_exit_fail_msg("Unknown VMA type\n");
 		return false;
 	}
 }
-- 
2.54.0

