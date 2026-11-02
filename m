Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793613816;
	b=tUaHNvvP54HRRnmKQzCXuoqiO6EYNLkP6tzKFH2uI3Z+2ywphnlG2+eIM1O819jR8/5+
	 5He6fE/ta+EVmMDcIfyG8wIJbGTxkszDfGeyasjl0MQdQF0UL6QUylHlXPmCRxOHLrGqn
	 KD35mTzPZaYkBEHx2U+DO8HgPHtP4MPyY6XBVbq8KkI2cjS3nuRoVIHYjE/wI24sTW4Ch
	 ZRzoBTwZZNz6A2UF2USj40z/UtPGekM0VqIgjcY+vsJlDm6Doj7s9ZXmeUKeGKtWcsxS4
	 hLDzvWmaL6t3HiAs69xJqV90K11FS/nxGSvWcqYT+JCTAHLBrUbDVuA3fR9/ffyidDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793613816;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=XdnDmqlCH80gjvSxzbKE92AxnXNoFECvTQW6aAOAAUc=;
	b=qQ8QKGHAXA1Yhijs5nfC8IJICpx467SPu3euzDJpXvZNOqLbfz/oX1Kho27HAdbzXTxt
	 JyaIBq/yQEy389TEW9mB5fzxsVPDWZ3BSrdc8fklLGrGMVfVcfeWaEl4KsWpNzQ3a0DAw
	 +2iZxXXd41xTgpA2uUnO4nUXJT0yPKw/nYulAdJb7xini+TgC0GANaUor1tzJodq5nYTe
	 RRVkmQ/7GHF73vpP688EZIfUDwNojAZrxCNpnVu37kA4EblqvuAzK9G1AH4im1iAPVqRT
	 U1kHGpBu0hhp+hBrupI7Lz1KfGhtK1ej1Dt0QHC0m61ixuVFEJKC6KQYTs9zMK5UgIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=YbGeh5+y;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 830A4606A330;
	Mon,  2 Nov 2026 10:03:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 830A4606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=YbGeh5+y
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8C32D293B;
	Mon,  2 Nov 2026 02:03:31 -0800 (PST)
Received: from a081061.arm.com (unknown [10.163.156.187])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B88CB3F59E;
	Mon,  2 Nov 2026 02:03:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793613814; bh=h5dXF0m91cnxVDQONyXlGNTGhZvMDOX5pVEbRrsufFk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YbGeh5+yY/p2Pf0TkK8JgmGOFxk8huewbNvCL9C2KItaKajh1Y75ulaitXhXdVliD
	 G/H/x/NrUUkFkvpeANJctSS3OYjmyc1EqfUJLCs0wG1DMupLaTVYvGg9vt9c9xBQJ1
	 J0Kflxh+CdtIKZdCCkPi9fDjUSCUUCUmFdaHW2Z0=
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
Subject: [PATCH RESEND v2 08/12] selftests/mm: mremap_test: handle cleanup after mmap failures
Date: Mon,  2 Nov 2026 15:32:07 +0530
Message-ID: <20261102100211.141831-9-sarthak.sharma@arm.com>
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

In several tests, when target mapping fails, we directly
jump to the result handling, without unmapping the
previously created source mapping. This leaks the
source mapping. Unmap the source mapping when target
mapping fails.

Also bypass munmap() when source mapping fails in
mremap_move_within_range().

Signed-off-by: Sarthak Sharma <sarthak.sharma@arm.com>
---
 tools/testing/selftests/mm/mremap_test.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/mm/mremap_test.c b/tools/testing/selftests/mm/mremap_test.c
index 514d2003b88d..63bf8a475fe6 100644
--- a/tools/testing/selftests/mm/mremap_test.c
+++ b/tools/testing/selftests/mm/mremap_test.c
@@ -340,7 +340,7 @@ static void mremap_move_within_range(unsigned int pattern_seed, char *rand_addr)
 	if (new_ptr == MAP_FAILED) {
 		ksft_perror("mremap");
 		success = 0;
-		goto out;
+		goto out_unmap;
 	}
 
 	/* Verify byte pattern after remapping */
@@ -357,9 +357,9 @@ static void mremap_move_within_range(unsigned int pattern_seed, char *rand_addr)
 		}
 	}
 
-out:
+out_unmap:
 	munmap(ptr, size);
-
+out:
 	ksft_test_result(success, "%s\n", test_name);
 }
 
@@ -415,7 +415,7 @@ static void mremap_move_multiple_vmas(unsigned int pattern_seed,
 	if (tgt_ptr == MAP_FAILED) {
 		ksft_perror("mmap");
 		success = false;
-		goto out;
+		goto out_unmap_src;
 	}
 	if (munmap(tgt_ptr, 2 * size)) {
 		ksft_perror("munmap");
@@ -501,6 +501,7 @@ static void mremap_move_multiple_vmas(unsigned int pattern_seed,
 
 out_unmap:
 	munmap(tgt_ptr, 2 * size);
+out_unmap_src:
 	munmap(ptr, size);
 out:
 	ksft_test_result(success, "%s%s\n", test_name, dont_unmap ? " [dontunmap]" : "");
@@ -529,7 +530,7 @@ static void mremap_shrink_multiple_vmas(unsigned long page_size,
 	if (tgt_ptr == MAP_FAILED) {
 		ksft_perror("mmap");
 		success = false;
-		goto out;
+		goto out_unmap_src;
 	}
 	if (munmap(tgt_ptr, size)) {
 		ksft_perror("munmap");
@@ -573,6 +574,7 @@ static void mremap_shrink_multiple_vmas(unsigned long page_size,
 
 out_unmap:
 	munmap(tgt_ptr, size);
+out_unmap_src:
 	munmap(ptr, size);
 out:
 	ksft_test_result(success, "%s%s\n", test_name, inplace ? " [inplace]" : "");
@@ -605,7 +607,7 @@ static void mremap_move_multiple_vmas_split(unsigned int pattern_seed,
 	if (tgt_ptr == MAP_FAILED) {
 		ksft_perror("mmap");
 		success = false;
-		goto out;
+		goto out_unmap_src;
 	}
 	if (munmap(tgt_ptr, size)) {
 		ksft_perror("munmap");
@@ -690,6 +692,7 @@ static void mremap_move_multiple_vmas_split(unsigned int pattern_seed,
 
 out_unmap:
 	munmap(tgt_ptr, size);
+out_unmap_src:
 	munmap(ptr, size);
 out:
 	ksft_test_result(success, "%s%s\n", test_name, dont_unmap ? " [dontunmap]" : "");
@@ -738,7 +741,7 @@ static void mremap_move_multi_invalid_vmas(FILE *maps_fp,
 	if (tgt_ptr == MAP_FAILED) {
 		ksft_perror("mmap");
 		success = false;
-		goto out_close_uffd;
+		goto out_unmap_src;
 	}
 	if (munmap(tgt_ptr, size)) {
 		ksft_perror("munmap");
@@ -910,6 +913,7 @@ static void mremap_move_multi_invalid_vmas(FILE *maps_fp,
 
 out_unmap:
 	munmap(tgt_ptr, size);
+out_unmap_src:
 	munmap(ptr, size);
 out_close_uffd:
 	close(uffd);
-- 
2.53.0

