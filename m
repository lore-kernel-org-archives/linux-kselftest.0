Received: from va-1-111.ptr.blmpb.com (va-1-111.ptr.blmpb.com [209.127.230.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63CC835292A
	for <linux-kselftest@vger.kernel.org>; Sat, 27 Jun 2026 08:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782547412; cv=none; b=czPguPxKubL0UmSCSD6rZReXSvjP7RN4l4efdBrVmcvb9O9n8PZB5QvlA1+2TxvaN4uoefF7r+rFK28aBdcK/jleTp0fD++xyTZ63IM3EIKLlgZo+BQ78EuS/MdX7O9WDf7vriPOMb6tV9fYgggsAHDRfG0gBR0dkSUW+49F/bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782547412; c=relaxed/simple;
	bh=5JXu+6+Uw9g2my9n9mfcDrt58onZMsTIU/I3G/1MUcw=;
	h=References:To:Message-Id:Content-Type:From:Date:Mime-Version:
	 In-Reply-To:Cc:Subject; b=ZObWVoyElWP/hQNt3cmYZWorzkgT7av9euxa69dv1yX2hXwotYsogBBdXt2mwME2yg5DwJDPmZ/0mLJxu2bN1jXpAe4/wWsj1LZ250Pc0QU/RD4DVZ/6GP2jHydLh2vSHWhJU2cA0ts19YdZF8I+PXaNS5g5+KmUK+CjS7E1rBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=KnhrFjYa; arc=none smtp.client-ip=209.127.230.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="KnhrFjYa"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1782547404; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=yU3kYYTqqRN2edOzdCh3BdLd6D3B46NBQG1XnZHMwL4=;
 b=KnhrFjYaGp3qOw+XtKh5ossk56ePoufEJh2NJr6X3rq7LNy0fXQzel7BXG9aXJq7+hTt7w
 J880dLlj24oyI/299DfsfcjntODf6na2fkaSgRvTwkzWndPbcvxqIAC2HVQbF5AbYj1xBf
 hZcsOxCDeeTd9w4GVRKGegsnupPVTH2jL/bty1CIbMk9cvk0CztqjTLKi171XGEwe12Rpv
 2ncJVjn7c2y3B6cSJPLRwr1Gy/6s0Kw6twFEaf/vqO5/sXtHi904Y2fWZIAO6CZSTxUstO
 4igfWo8SZ99vhvGWQL9sjCgxl6QsU36FO1WcbVrh3ksxJwhKTpX5fst82ZC9Nw==
References: <20260627041334.2134330-1-wangyijia.yeah@bytedance.com>
To: "Shuah Khan" <shuah@kernel.org>, <linux-kselftest@vger.kernel.org>
Message-Id: <20260627080317.2316193-1-wangyijia.yeah@bytedance.com>
Content-Transfer-Encoding: 7bit
X-Original-From: wangyijia.yeah@bytedance.com
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset=UTF-8
From: =?utf-8?q?=E7=8E=8B=E7=BF=8A=E5=98=89?= <wangyijia.yeah@bytedance.com>
Date: Sat, 27 Jun 2026 16:03:17 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
In-Reply-To: <20260627041334.2134330-1-wangyijia.yeah@bytedance.com>
X-Lms-Return-Path: <lba+26a3f83ca+bcb914+vger.kernel.org+wangyijia.yeah@bytedance.com>
Cc: <linux-kernel@vger.kernel.org>, 
	"Yijia Wang" <wangyijia.yeah@bytedance.com>
Subject: [PATCH v3] selftests: mincore: fix the readahead check on large base page sizes

From: Yijia Wang <wangyijia.yeah@bytedance.com>

check_file_mmap faults a page in the middle of a file mapping and
expects the readahead window to have populated further pages *after*
it. With a large base page size this is wrong and the test fails
reliably, e.g. on arm64 with 64K pages:

  # mincore_selftest.c:260:check_file_mmap:Expected ra_pages (0) > 0 (0)
  # mincore_selftest.c:261:check_file_mmap:No read-ahead pages found in memory
  not ok 4 global.check_file_mmap

The read-around window is read_ahead_kb / page_size pages wide and is
centred on the faulting page (mm/filemap.c):

  ra->start = max(0, pgoff - ra_pages / 2)

With the default 128K budget that is 32 pages on 4K but only 2 pages on
64K, so the window becomes [pgoff-1, pgoff] and the single extra page
lands *before* the faulted page. The forward-only scan finds nothing.
This is not a huge-page (THP) effect; it is just a byte-sized readahead
budget divided by a large page size plus a fault-centred window.

Count readahead pages on both sides of the faulted page, and skip the
readahead check up front when there is no usable read-around window:
either it is narrower than two pages (readahead disabled, or the base
page size so large that read_ahead_kb covers a single page), or the file
has no backing block device whose read_ahead_kb can be read (e.g. on
tmpfs). When the window is wide enough the EXPECT_GT(ra_pages, 0)
assertion is kept, so a kernel that should read ahead but does not is
still caught.

Signed-off-by: Yijia Wang <wangyijia.yeah@bytedance.com>
---
How the problem was tracked down, step by step:

 1. On arm64 with 64K base pages, check_file_mmap fails:

      # mincore_selftest.c:260:check_file_mmap:Expected ra_pages (0) > 0 (0)
      # mincore_selftest.c:261:check_file_mmap:No read-ahead pages found in memory
      not ok 4 global.check_file_mmap

 2. The test faults the middle page and scans only *forward* for the
    readahead pages, so "ra_pages == 0" means nothing was read in after
    the faulted page.

 3. Readahead is a byte budget (read_ahead_kb, default 128K) turned into
    a page count: ra_pages = read_ahead_kb / page_size. That is 32 pages
    on 4K but only 2 pages on 64K.

 4. The mmap read-around window is centred on the fault:
    ra->start = max(0, pgoff - ra_pages / 2). With 2 pages the window is
    [pgoff-1, pgoff] - the one extra page lands *before* the fault.

 5. Measured directly on the 64K box, varying read_ahead_kb, faulting
    page 32:

      read_ahead_kb=64  (1 page):  resident: 32          (no neighbour)
      read_ahead_kb=128 (2 pages): resident: 31 32        (neighbour before)
      read_ahead_kb=192 (3 pages): resident: 31 32 33     (before and after)

    So the neighbour really is before the fault, and a 1-page window
    brings in no neighbour at all. This is not a THP effect.

 6. A file with no backing block device (e.g. tmpfs) has no
    read_ahead_kb to read and no block-device readahead at all; faulting
    the middle page brings in only that page (before=0 after=0). The fix
    therefore skips when the window cannot be determined, not just when
    it is too narrow.

Open question for the list: which fix do you prefer?

  (a) Move the fault towards the start of the mapping so the centred
      window always leaves a page *after* it, keeping the original
      forward-only scan. Minimal, but the page count after the fault is
      ceil(ra_pages/2) - 1, which is 0 whenever ra_pages <= 2; only a
      fault within the first ra_pages/2 pages (e.g. page 0) has a page
      after it. That changes the test's intent - it would exercise
      readahead at the boundary, not in the interior - and still fails
      when read_ahead_kb yields a 1-page window or on tmpfs.

  (b) Scan both sides of the faulted page (this patch), and skip up front
      when there is no usable read-around window. A little more code, but
      page-size-agnostic and it keeps the assertion whenever a neighbour
      is actually expected.

I went with (b); happy to switch to (a) if that is preferred.

An earlier posting of mine changed check_huge_pages instead - that was a
misdiagnosis (on the 64K box that subtest merely SKIPs and was never the
failure). Please disregard it; this version supersedes it.
 .../selftests/mincore/mincore_selftest.c      | 82 ++++++++++++++++++-
 1 file changed, 80 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/mincore/mincore_selftest.c b/tools/testing/selftests/mincore/mincore_selftest.c
index cdd022c1c..960851286 100644
--- a/tools/testing/selftests/mincore/mincore_selftest.c
+++ b/tools/testing/selftests/mincore/mincore_selftest.c
@@ -12,6 +12,8 @@
 #include <unistd.h>
 #include <stdlib.h>
 #include <sys/mman.h>
+#include <sys/stat.h>
+#include <sys/sysmacros.h>
 #include <string.h>
 #include <fcntl.h>
 
@@ -174,6 +176,48 @@ TEST(check_huge_pages)
 }
 
 
+/*
+ * Return the size of the mmap read-around window, in pages, for the block
+ * device backing the file referred to by @fd, or -1 if it cannot be
+ * determined. The window size is the device's read_ahead_kb divided by the
+ * page size; the kernel centres this window on the faulting page, so it must
+ * be at least two pages wide for any neighbouring page to be read in.
+ */
+static long readahead_window_pages(int fd, long page_size)
+{
+	char path[64];
+	struct stat st;
+	long ra_kb;
+	FILE *f;
+
+	if (fstat(fd, &st))
+		return -1;
+
+	/*
+	 * read_ahead_kb lives in the owning disk's queue/ directory. For a
+	 * whole-disk device that is the device's own queue/; for a partition
+	 * it is one level up ("..") at the parent disk.
+	 */
+	snprintf(path, sizeof(path), "/sys/dev/block/%u:%u/queue/read_ahead_kb",
+		 major(st.st_dev), minor(st.st_dev));
+	f = fopen(path, "r");
+	if (!f) {
+		snprintf(path, sizeof(path),
+			 "/sys/dev/block/%u:%u/../queue/read_ahead_kb",
+			 major(st.st_dev), minor(st.st_dev));
+		f = fopen(path, "r");
+		if (!f)
+			return -1;
+	}
+	if (fscanf(f, "%ld", &ra_kb) != 1) {
+		fclose(f);
+		return -1;
+	}
+	fclose(f);
+
+	return (ra_kb << 10) / page_size;
+}
+
 /*
  * Test mincore() behavior on a file-backed page.
  * No pages should be loaded into memory right after the mapping. Then,
@@ -194,6 +238,7 @@ TEST(check_file_mmap)
 	int fd;
 	int i;
 	int ra_pages = 0;
+	long ra_window;
 
 	page_size = sysconf(_SC_PAGESIZE);
 	vec_size = FILE_SIZE / page_size;
@@ -224,6 +269,22 @@ TEST(check_file_mmap)
 		SKIP(goto out_close, "fallocate not supported by filesystem.");
 	}
 
+	/*
+	 * mmap read-around brings in a window of pages centred on the
+	 * faulting page. Its width is the backing device's read_ahead_kb
+	 * divided by the page size. If that window is narrower than two
+	 * pages - because readahead is disabled, or the base page size is so
+	 * large that read_ahead_kb covers a single page - then no
+	 * neighbouring page can ever be read in and the readahead part of
+	 * this test does not apply, so skip it. The same goes for a file with
+	 * no backing block device (e.g. on tmpfs), where the window cannot be
+	 * determined and there is no block-device readahead to exercise.
+	 */
+	ra_window = readahead_window_pages(fd, page_size);
+	if (ra_window < 2)
+		SKIP(goto out_close,
+		     "no usable readahead window for this configuration.");
+
 	/*
 	 * Map the whole file, the pages shouldn't be fetched yet.
 	 */
@@ -242,8 +303,11 @@ TEST(check_file_mmap)
 	}
 
 	/*
-	 * Touch a page in the middle of the mapping. We expect the next
-	 * few pages (the readahead window) to be populated too.
+	 * Touch a page in the middle of the mapping. We expect the
+	 * surrounding pages (the readahead window) to be populated too.
+	 * The kernel centres the mmap read-around window on the faulting
+	 * page, so with a large base page size the readahead pages may
+	 * land before the touched page rather than after it.
 	 */
 	addr[FILE_SIZE / 2] = 1;
 	retval = mincore(addr, FILE_SIZE, vec);
@@ -252,11 +316,25 @@ TEST(check_file_mmap)
 		TH_LOG("Page not found in memory after use");
 	}
 
+	/* Count readahead pages that landed before the touched page. */
+	i = FILE_SIZE / 2 / page_size - 1;
+	while (i >= 0 && vec[i]) {
+		ra_pages++;
+		i--;
+	}
+
+	/* Count readahead pages that landed after the touched page. */
 	i = FILE_SIZE / 2 / page_size + 1;
 	while (i < vec_size && vec[i]) {
 		ra_pages++;
 		i++;
 	}
+
+	/*
+	 * The readahead window is at least two pages wide here (narrow
+	 * windows were skipped above), so the kernel must have brought in at
+	 * least one neighbouring page on one side of the faulted page.
+	 */
 	EXPECT_GT(ra_pages, 0) {
 		TH_LOG("No read-ahead pages found in memory");
 	}
-- 
2.43.0
