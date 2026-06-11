Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16B23ACA7C;
	Thu, 11 Jun 2026 10:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781172122; cv=none; b=I63JLRasGssZH718WaxRyxBy8k+oJ01czV8FxeyUSshruI+C1C0wr6QvFFvbZh5lbpcplWgy3DqhZg7E+rM+ApmqBA1IKm2KFvJRCHuqUPVATxMPO+tgOYLFWO+s2RbWh+GBwh74YqXVUSFzYBhi8l1domtBmRZgFmSBzpooLLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781172122; c=relaxed/simple;
	bh=epjhNjiTuw7OKicaBYm6IsSTnRn6aTsVutKxIjrfWck=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=IJIg0GkAfdct/fko91piTBiTtA/4PO3vwrIDYiMIHqf7vRlgU/K/yUVAoxa/aTtH8YUnuP8IEbzqK9YnksAV2S2xSnCXEK2DTsgctV4XG8QUKpLLSzUGPlSNjSnY5HAgq5TW1DjP0Z1Ak6JBFKUuT8aeRjzHEWhU3m5ZaKNRJSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cxkPnPGR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cxkPnPGR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8706D1F00893;
	Thu, 11 Jun 2026 10:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781172121;
	bh=7UQfP1YxizekUK5kBwNkIE8MO8+eXgLAl0KPnDKl73Q=;
	h=From:Date:Subject:To:Cc;
	b=cxkPnPGREf1vKQgkfjyrjPLaAePUQaLKLGYnyakzhJ13F0NoKNU/qv1sIbTW2albR
	 ecgmCAjsGMX2bVwzhXmgx1IMUh0hZuLT7tMHeoq5RaOYh9qBgc+7Oh7tZ5OonLQ3+T
	 UJ+JuiPxtLJkYlM3AyKvF6qaSAfg/ChHS4qlhX0zMDghQk3w3Kp3EE5kTcpdwjwJ30
	 pGVi3VnTmRV86EMuP904eSV+rjwLrJn+wSK4B6pPK/VbzC7y/nRAeNY8LnXnx1LEvF
	 xP2kbPnUOUIeXCdMy275ZOlSWpqZg/8acHrQO7xt1Ey561BF75PWNXpmNqPrtj8haH
	 2EhWbl7F0K9gg==
From: "David Hildenbrand (Arm)" <david@kernel.org>
Date: Thu, 11 Jun 2026 12:01:55 +0200
Subject: [PATCH] selftests: mm: fix and speedup "droppable" test
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-droppable_test-v1-1-b6a73d99f658@kernel.org>
X-B4-Tracking: v=1; b=H4sIAJKHKmoC/x3MQQqAIBBA0avIrBNSIamrRITmVAOhohJBePek5
 Vv8/0LGRJhhYi8kvClT8A2iY7Cdxh/IyTWD7OXQD0Jwl0KMxl64FsyFK620dXoUbrfQophwp+c
 fzkutHx5EE79gAAAA
To: Andrew Morton <akpm@linux-foundation.org>, 
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Shuah Khan <shuah@kernel.org>, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Anthony Yznaga <anthony.yznaga@oracle.com>, Mark Brown <broonie@kernel.org>, 
 Sarthak Sharma <sarthak.sharma@arm.com>
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aishwarya TCV <Aishwarya.TCV@arm.com>, 
 "David Hildenbrand (Arm)" <david@kernel.org>
X-Mailer: b4 0.13.0

The droppable test currently relies on creating memory pressure in a
child process to trigger dropping the droppable pages.

That not only takes a long time on some machines (allocating and filling
all that memory), on large machines this will not work as we hardcode the
area size to 134217728 bytes.

... further, we rely on timeouts to detect that memory was not dropped,
which is really suboptimal.

Instead, let's just use MADV_PAGEOUT on a 2 MiB region. MADV_PAGEOUT works
with droppable memory even without swap.

There is the low chance of MADV_PAGEOUT failing to drop a page because
of speculative references. We'll wait 1s and retry 10 times to
rule that unlikely case out as best as we can.

On a machine without swap:

	$ ./droppable
	TAP version 13
	1..1
	ok 1 madvise(MADV_PAGEOUT) behavior
	# Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0

Reported-by: Aishwarya TCV <Aishwarya.TCV@arm.com>
Fixes: 9651fcedf7b9 ("mm: add MAP_DROPPABLE for designating always lazily freeable mappings")
Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
---
 tools/testing/selftests/mm/droppable.c | 46 +++++++++++++++++++---------------
 1 file changed, 26 insertions(+), 20 deletions(-)

diff --git a/tools/testing/selftests/mm/droppable.c b/tools/testing/selftests/mm/droppable.c
index 30c8be37fcb9..57e1b6fc5569 100644
--- a/tools/testing/selftests/mm/droppable.c
+++ b/tools/testing/selftests/mm/droppable.c
@@ -17,10 +17,10 @@
 
 int main(int argc, char *argv[])
 {
-	size_t alloc_size = 134217728;
-	size_t page_size = getpagesize();
+	const size_t alloc_size = 2 * 1024 * 1024;
+	int retry_count = 10;
+	bool dropped;
 	void *alloc;
-	pid_t child;
 
 	ksft_print_header();
 	ksft_set_plan(1);
@@ -35,26 +35,32 @@ int main(int argc, char *argv[])
 		exit(KSFT_FAIL);
 	}
 	memset(alloc, 'A', alloc_size);
-	for (size_t i = 0; i < alloc_size; i += page_size)
-		assert(*(uint8_t *)(alloc + i));
-
-	child = fork();
-	assert(child >= 0);
-	if (!child) {
-		for (;;)
-			*(char *)malloc(page_size) = 'B';
-	}
 
-	for (bool done = false; !done;) {
-		for (size_t i = 0; i < alloc_size; i += page_size) {
-			if (!*(uint8_t *)(alloc + i)) {
-				done = true;
-				break;
+	while (retry_count--) {
+		if (madvise(alloc, alloc_size, MADV_PAGEOUT)) {
+			if (errno == EINVAL) {
+				ksft_test_result_skip("madvise(MADV_PAGEOUT) not supported\n");
+				exit(KSFT_SKIP);
 			}
+			ksft_test_result_fail("madvise(MADV_PAGEOUT) error: %s\n", strerror(errno));
+			exit(KSFT_FAIL);
 		}
+
+		dropped = memchr(alloc, 'A', alloc_size) == NULL;
+
+		/*
+		 * Speculative reference can temporarily prevent some
+		 * pages from getting dropped. So sleep and retry.
+		 *
+		 * If a page is not droppable for 10s, something
+		 * is seriously messed up and we want to fail.
+		 */
+		if (dropped)
+			break;
+		sleep(1);
 	}
-	kill(child, SIGTERM);
 
-	ksft_test_result_pass("MAP_DROPPABLE: PASS\n");
-	exit(KSFT_PASS);
+	ksft_test_result(dropped, "madvise(MADV_PAGEOUT) behavior\n");
+
+	ksft_finished();
 }

---

base-commit: d401506a8ee8ac6bc4a7767c17da036e9434a4a3

change-id: 20260611-droppable_test-3737bd791dfb

--

Cheers,

David

