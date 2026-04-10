Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 212CA3D47B5;
	Fri, 10 Apr 2026 14:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775831470; cv=none; b=KfpDn0PVxyEDghpD+iaN04QDIpWGm2UdyHmmhIdx0IaJ7KbfsbGhBnLIxxTKqurQJu5+JLqcxn93c+LSjKRFwW7ajtmzMisQJgLQpwrZLTCKr6PaV1wXK4rFDgsuBr7kmiBh2Qt0veq/zp0UCI1iBgmHCIp3GjqJIVekXjdouVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775831470; c=relaxed/simple;
	bh=N7h9PpNKNEk1zD5KGurgT0NJofTaFLHSOsD2O/huOxo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=e0gc8bLKySfi5WYpZ6VIJG1Rgz+biwzovBIKsJ3sUB/pj0XZ/65WK63lYbOEN+riLkiCMOAuy9UH6Abr4Hf73QRxjhnZx6DO2omSud6JoTQYWa10tHSqU4LYZh4nKZ8usiWi6pThT3HCz5ohlXRaQ0iukQy0hHlxWNf9KSI+zu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=cYIpxXHW; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="cYIpxXHW"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B9CE31D13;
	Fri, 10 Apr 2026 07:30:59 -0700 (PDT)
Received: from a080796.blr.arm.com (a080796.arm.com [10.164.21.51])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C42803F632;
	Fri, 10 Apr 2026 07:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775831465; bh=N7h9PpNKNEk1zD5KGurgT0NJofTaFLHSOsD2O/huOxo=;
	h=From:To:Cc:Subject:Date:From;
	b=cYIpxXHWrJW6xKuArS4N1OZ/LEImvK89tdsZClbHVaW4dipiqOXEsYEIsFk/A1Q1U
	 mb5hEeK3cq4OF3c8VcR4nLwXb1qkBTSbgMbRNF/lSXXKXys4Gvpu5NdmdtqAGNCYX4
	 FYgsiLSpDZiPSiU0E8+2izUTZdnGLtqzuUcVUv6Y=
From: Dev Jain <dev.jain@arm.com>
To: akpm@linux-foundation.org,
	david@kernel.org,
	shuah@kernel.org
Cc: ljs@kernel.org,
	Liam.Howlett@oracle.com,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ryan.roberts@arm.com,
	anshuman.khandual@arm.com,
	Dev Jain <dev.jain@arm.com>,
	Sarthak Sharma <sarthak.sharma@arm.com>
Subject: [PATCH] selftests/mm: Simplify byte pattern checking in mremap_test
Date: Fri, 10 Apr 2026 20:00:31 +0530
Message-Id: <20260410143031.148173-1-dev.jain@arm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The original version of mremap_test (7df666253f26: "kselftests: vm: add
mremap tests") validated remapped contents byte-by-byte and printed a
mismatch index in case the bytes streams are not equal. That made
validation expensive in both cases: for "no mismatch" (the common case when
mremap is not buggy), it still walked all bytes in C; for "mismatch", it
broke out of the loop after printing the mismatch index.

Later, my commit 7033c6cc9620 ("selftests/mm: mremap_test: optimize
execution time from minutes to seconds using chunkwise memcmp") tried to
optimize both cases by using chunk-wise memcmp() and only scanning bytes
within a range which has been determined by memcmp as mismatching.

But get_sqrt() in that commit is buggy: `high = mid - 1` is applied
unconditionally. This makes the speed of checking the mismatch index
suboptimal.

The mismatch index does not provide useful debugging value here: if
validation fails, we know mremap behavior is wrong, and the specific byte
offset does not make root-causing easier.

So instead of fixing get_sqrt(), bite the bullet, drop mismatch index
scanning and just compare the two byte streams with memcmp().

Reported-by: Sarthak Sharma <sarthak.sharma@arm.com>
Signed-off-by: Dev Jain <dev.jain@arm.com>
---
Sorry for sending two patchsets the same day - the problem was made known
to me today, and I couldn't help myself but fix it immediately, imagine
my embarrassment when I found out that I made a typo in the binary search
code which I had been writing consistently throughout college :)

Applies on mm-unstable.

 tools/testing/selftests/mm/mremap_test.c | 109 +++--------------------
 1 file changed, 10 insertions(+), 99 deletions(-)

diff --git a/tools/testing/selftests/mm/mremap_test.c b/tools/testing/selftests/mm/mremap_test.c
index 308576437228c..131d9d6db8679 100644
--- a/tools/testing/selftests/mm/mremap_test.c
+++ b/tools/testing/selftests/mm/mremap_test.c
@@ -76,27 +76,6 @@ enum {
 	.expect_failure = should_fail				\
 }
 
-/* compute square root using binary search */
-static unsigned long get_sqrt(unsigned long val)
-{
-	unsigned long low = 1;
-
-	/* assuming rand_size is less than 1TB */
-	unsigned long high = (1UL << 20);
-
-	while (low <= high) {
-		unsigned long mid = low + (high - low) / 2;
-		unsigned long temp = mid * mid;
-
-		if (temp == val)
-			return mid;
-		if (temp < val)
-			low = mid + 1;
-		high = mid - 1;
-	}
-	return low;
-}
-
 /*
  * Returns false if the requested remap region overlaps with an
  * existing mapping (e.g text, stack) else returns true.
@@ -995,11 +974,9 @@ static long long remap_region(struct config c, unsigned int threshold_mb,
 			      char *rand_addr)
 {
 	void *addr, *tmp_addr, *src_addr, *dest_addr, *dest_preamble_addr = NULL;
-	unsigned long long t, d;
 	struct timespec t_start = {0, 0}, t_end = {0, 0};
 	long long  start_ns, end_ns, align_mask, ret, offset;
 	unsigned long long threshold;
-	unsigned long num_chunks;
 
 	if (threshold_mb == VALIDATION_NO_THRESHOLD)
 		threshold = c.region_size;
@@ -1068,87 +1045,21 @@ static long long remap_region(struct config c, unsigned int threshold_mb,
 		goto clean_up_dest_preamble;
 	}
 
-	/*
-	 * Verify byte pattern after remapping. Employ an algorithm with a
-	 * square root time complexity in threshold: divide the range into
-	 * chunks, if memcmp() returns non-zero, only then perform an
-	 * iteration in that chunk to find the mismatch index.
-	 */
-	num_chunks = get_sqrt(threshold);
-	for (unsigned long i = 0; i < num_chunks; ++i) {
-		size_t chunk_size = threshold / num_chunks;
-		unsigned long shift = i * chunk_size;
-
-		if (!memcmp(dest_addr + shift, rand_addr + shift, chunk_size))
-			continue;
-
-		/* brute force iteration only over mismatch segment */
-		for (t = shift; t < shift + chunk_size; ++t) {
-			if (((char *) dest_addr)[t] != rand_addr[t]) {
-				ksft_print_msg("Data after remap doesn't match at offset %llu\n",
-						t);
-				ksft_print_msg("Expected: %#x\t Got: %#x\n", rand_addr[t] & 0xff,
-						((char *) dest_addr)[t] & 0xff);
-				ret = -1;
-				goto clean_up_dest;
-			}
-		}
-	}
-
-	/*
-	 * if threshold is not divisible by num_chunks, then check the
-	 * last chunk
-	 */
-	for (t = num_chunks * (threshold / num_chunks); t < threshold; ++t) {
-		if (((char *) dest_addr)[t] != rand_addr[t]) {
-			ksft_print_msg("Data after remap doesn't match at offset %llu\n",
-					t);
-			ksft_print_msg("Expected: %#x\t Got: %#x\n", rand_addr[t] & 0xff,
-					((char *) dest_addr)[t] & 0xff);
-			ret = -1;
-			goto clean_up_dest;
-		}
+	/* Verify byte pattern after remapping */
+	if (memcmp(dest_addr, rand_addr, threshold)) {
+		ksft_print_msg("Data after remap doesn't match\n");
+		ret = -1;
+		goto clean_up_dest;
 	}
 
 	/* Verify the dest preamble byte pattern after remapping */
-	if (!c.dest_preamble_size)
-		goto no_preamble;
-
-	num_chunks = get_sqrt(c.dest_preamble_size);
-
-	for (unsigned long i = 0; i < num_chunks; ++i) {
-		size_t chunk_size = c.dest_preamble_size / num_chunks;
-		unsigned long shift = i * chunk_size;
-
-		if (!memcmp(dest_preamble_addr + shift, rand_addr + shift,
-			    chunk_size))
-			continue;
-
-		/* brute force iteration only over mismatched segment */
-		for (d = shift; d < shift + chunk_size; ++d) {
-			if (((char *) dest_preamble_addr)[d] != rand_addr[d]) {
-				ksft_print_msg("Preamble data after remap doesn't match at offset %llu\n",
-						d);
-				ksft_print_msg("Expected: %#x\t Got: %#x\n", rand_addr[d] & 0xff,
-						((char *) dest_preamble_addr)[d] & 0xff);
-				ret = -1;
-				goto clean_up_dest;
-			}
-		}
-	}
-
-	for (d = num_chunks * (c.dest_preamble_size / num_chunks); d < c.dest_preamble_size; ++d) {
-		if (((char *) dest_preamble_addr)[d] != rand_addr[d]) {
-			ksft_print_msg("Preamble data after remap doesn't match at offset %llu\n",
-					d);
-			ksft_print_msg("Expected: %#x\t Got: %#x\n", rand_addr[d] & 0xff,
-					((char *) dest_preamble_addr)[d] & 0xff);
-			ret = -1;
-			goto clean_up_dest;
-		}
+	if (c.dest_preamble_size &&
+	    memcmp(dest_preamble_addr, rand_addr, c.dest_preamble_size)) {
+		ksft_print_msg("Preamble data after remap doesn't match\n");
+		ret = -1;
+		goto clean_up_dest;
 	}
 
-no_preamble:
 	start_ns = t_start.tv_sec * NS_PER_SEC + t_start.tv_nsec;
 	end_ns = t_end.tv_sec * NS_PER_SEC + t_end.tv_nsec;
 	ret = end_ns - start_ns;
-- 
2.34.1
