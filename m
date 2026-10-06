Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8613F3B6C16;
	Tue,  6 Oct 2026 09:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791278742; cv=none; b=soR6wgoZOnxtq3hc7MdYdG8g/ZMBZlVlRDP3GDyMv/BiNvyXUhV8229wfyqwd3ItMd7Vn6uIoS4n9I8SWjP7PqO7JOLeyUXIRdl7LJsfP6egSX4ylT+SoxDY+VucQKRWmU95ZngkEiEFcaUyyNqoIN9owsifA8PO2MkBzrVN6+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791278742; c=relaxed/simple;
	bh=pQa9n9na/unDTq1Miq8zfVgvzrRNO5BX3kT/+B7XDiU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lOL703fR27rLCDV9qFiPfnP4iiZ1nUaRtfaR4tLTsUTFG4zjOBhyruINXCpdbuzIGhnC+qYJN05XCvcCpExkGbXI+ZdopHmpbjHKTukxw6HR5SznseElIj4yC3diu4eT6w1oG7D1g0k+O1WQiuhlsW3IITg0n3xNEogegczZ1EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=amZ7w9bQ; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="amZ7w9bQ"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 92A3C152B;
	Tue,  6 Oct 2026 02:25:36 -0700 (PDT)
Received: from a081061.blr.arm.com (a081061.arm.com [10.164.19.84])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id ACEFD3F763;
	Tue,  6 Oct 2026 02:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791278739; bh=pQa9n9na/unDTq1Miq8zfVgvzrRNO5BX3kT/+B7XDiU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=amZ7w9bQrVuAlJ3HPbZo2g6Q+B6AZx3BsEqAvLxBxeyhvZwr1gvGDu6z1/vYaaOW1
	 UsRAKxU7NRytwwUTwZlfZd8T/ocvSAew59VTLGMK3d4DkXOCSFnr0OlSBN9HSsLnn1
	 f7yK5GEiwqeRMSBXo32ihCSY4em3fZNd2hcjrgZ0=
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
Subject: [PATCH v2 03/12] selftests/mm: mremap_test: simplify errno handling
Date: Tue,  6 Oct 2026 14:55:02 +0530
Message-ID: <20261006092511.145776-4-sarthak.sharma@arm.com>
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
index 95ce6563289c..7cf1d235f309 100644
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

