Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793613774;
	b=BCSTjTnawVloHpkfVyjKe80WkKP72A9hTrUqOBW3S9btLXzvdWRDlStCHDPma6W7/xZN
	 o0KmUwMTaxnDX5iE7ZupeTIxYc6oweM9jMPi6wajlQhadnYFb9oHOQFcfg0xicOQgO7ly
	 SyAy0BZqRXxmAcrEYQDTcV2AFD1K5D3uwatDwZGWPMCmNsb7nlWzGv5maRvQk1vnXWaLr
	 0AFKxpvmLyYhiam6UCCGFPA7h4alzQRQkq/n89A+4x0sh0Zb+abcL2b1GnXR2dINHilEc
	 ixBBwYymLOYJ88wm+PfMCRivh4deOqxWULlfXu8yBHAbh1xuMhDTGe2M1KJz6fnC0xQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793613774;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=fS2c2C7KwS+6ZnSiJLsAY1EuAFU3bigFxhXvD4SjIqg=;
	b=otDiD9S8qbkAZmk5Xj5Lf4nwOfrTo4+r5LQvrndai4wkZJ4JAk0vTgbpmtEV5xbP0NtD
	 5e9g/KGIk2u0Z+yOhU81s7ZjBBFNwQ3XZVjrXZMboVGKYbTvBwA+dP9ZYADH+84Tn82Fv
	 JsXx01pHpzUj4qB/8aoat39PJCzTKmpPKY/zBjZVMJnFVgJYE+sO0bQMPJEvz0NkhYgxe
	 74r6ypJy/NnPDgU5z5E7g7QwNalBOBsKytIi9TJuilrADcn0H2qpJ5h65Ew5jc/lW/pFv
	 cKovvJbKXFZsloHvEqcYYpRwy1GmBp/Q7g9Dnk+nhdDqr53xgrucl6u2WInAcxcywbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Cj6s93ZI;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56A52606A337;
	Mon,  2 Nov 2026 10:02:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56A52606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Cj6s93ZI
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9A2D6293B;
	Mon,  2 Nov 2026 02:02:50 -0800 (PST)
Received: from a081061.arm.com (unknown [10.163.156.187])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 417313F59E;
	Mon,  2 Nov 2026 02:02:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793613773; bh=8wsfGgLEdsKEjl6cnefytFCOo2oRceki3G1+uaW7P0Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Cj6s93ZI5cOA9As6Jz4UP/a6fwDKPjsNH1FDr57csxvtGo3Tpf9DN/B6dbyINrW+k
	 CyqhN2q+Smlfgo4haUaHe9GeO+Sx2ohv5eF363R2Fq3CFa+wXfa1CUDHLUkaF2wN3y
	 o9hrGMIjtf3HF75L01kb0JKMV+E0xeh+d8Jnm6uE=
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
Subject: [PATCH RESEND v2 03/12] selftests/mm: mremap_test: simplify errno handling
Date: Mon,  2 Nov 2026 15:32:02 +0530
Message-ID: <20261102100211.141831-4-sarthak.sharma@arm.com>
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

mremap_move_multi_invalid_vmas() saves and restores
errno around several checks even when no other function
call can change it. Remove these instances and compare
errno directly.

Also move perror() after the userfaultfd skip check
to avoid printing an error when the test is skipped.

Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
Signed-off-by: Sarthak Sharma <sarthak.sharma@arm.com>
---
 tools/testing/selftests/mm/mremap_test.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/tools/testing/selftests/mm/mremap_test.c b/tools/testing/selftests/mm/mremap_test.c
index ea1348a9532e..72e6e4c3bd87 100644
--- a/tools/testing/selftests/mm/mremap_test.c
+++ b/tools/testing/selftests/mm/mremap_test.c
@@ -727,7 +727,7 @@ static void mremap_move_multi_invalid_vmas(FILE *maps_fp,
 	const size_t size = 10 * page_size;
 	bool success = true;
 	char *ptr, *tgt_ptr;
-	int uffd, err, i;
+	int uffd, i;
 	void *res;
 	struct uffdio_api api = {
 		.api = UFFD_API,
@@ -736,12 +736,11 @@ static void mremap_move_multi_invalid_vmas(FILE *maps_fp,
 
 	uffd = syscall(__NR_userfaultfd, O_NONBLOCK);
 	if (uffd == -1) {
-		err = errno;
-		perror("userfaultfd");
-		if (err == EPERM) {
+		if (errno == EPERM) {
 			ksft_test_result_skip("%s - missing uffd", test_name);
 			return;
 		}
+		perror("userfaultfd");
 		success = false;
 		goto out;
 	}
@@ -810,14 +809,12 @@ static void mremap_move_multi_invalid_vmas(FILE *maps_fp,
 	 * time.
 	 */
 	res = mremap(ptr, size, size, MREMAP_MAYMOVE | MREMAP_FIXED, tgt_ptr);
-	err = errno;
 	if (res != MAP_FAILED) {
 		fprintf(stderr, "mremap() succeeded for multi VMA uffd armed\n");
 		success = false;
 		goto out_unmap;
 	}
-	if (err != EFAULT) {
-		errno = err;
+	if (errno != EFAULT) {
 		perror("mremap() unexpected error");
 		success = false;
 		goto out_unmap;
@@ -863,14 +860,12 @@ static void mremap_move_multi_invalid_vmas(FILE *maps_fp,
 	 * first VMA, but no others, and report a failure.
 	 */
 	res = mremap(ptr, size, size, MREMAP_MAYMOVE | MREMAP_FIXED, tgt_ptr);
-	err = errno;
 	if (res != MAP_FAILED) {
 		fprintf(stderr, "mremap() succeeded for multi VMA uffd armed\n");
 		success = false;
 		goto out_unmap;
 	}
-	if (err != EFAULT) {
-		errno = err;
+	if (errno != EFAULT) {
 		perror("mremap() unexpected error");
 		success = false;
 		goto out_unmap;
@@ -912,14 +907,12 @@ static void mremap_move_multi_invalid_vmas(FILE *maps_fp,
 	 * the last VMA, and report a failure.
 	 */
 	res = mremap(ptr, size, size, MREMAP_MAYMOVE | MREMAP_FIXED, tgt_ptr);
-	err = errno;
 	if (res != MAP_FAILED) {
 		fprintf(stderr, "mremap() succeeded for multi VMA uffd armed\n");
 		success = false;
 		goto out_unmap;
 	}
-	if (err != EFAULT) {
-		errno = err;
+	if (errno != EFAULT) {
 		perror("mremap() unexpected error");
 		success = false;
 		goto out_unmap;
-- 
2.53.0

