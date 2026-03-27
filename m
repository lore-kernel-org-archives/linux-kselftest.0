Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94DE133A708
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Mar 2026 12:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774613003; cv=none; b=fZMCt5xhLVDCgTBV7YX3IEX/Id+b+faaIDHrL0DNzGX6SddlbbWW4KEUtLSLKiOWlXkFsEgi0AKyg/c5LPWRoS1L7by+UV0X1F6tlzo6+NeEQWaiweurj+NADeWQtRmE5InBtEIcI0NsEksywqnt2Rx55JmMfLowKDjPIp4WP5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774613003; c=relaxed/simple;
	bh=lhJdUY0Mhi6aXaX+nWl4o10djbKJKushXLkCbuHA1E4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Qi/ZdZmTwE6d2r6wXo+7HbhS2r8xAw2Y2y3986XXIfuUlWZHnIHhCSRjpn8jpceUHEoARL5bDagNUsZi/wjysMj6WlnsoGn2/gFwKsy9Y3NVy6/DCl/jwEvjOCKxOQ1sOVUC0BQcNqgPdrlmvIMqnmwBkKGnGbS5PZNvWiDDkkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PnJuLpvR; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PnJuLpvR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774613001;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=m7nefQy6MzFPaVFBX4vR9wqZM8EfsR8dpshxHtPRdhI=;
	b=PnJuLpvRybk35vT4tKUVDGeH0zpI5nZPYe7R3EGBhKaex6iyDKENP7IFT8Oe1xKalacCHY
	DjeokUFq5H9Iwonos3AWI8V95+sXqlVgn649sEgbL3TRsTicRt61hi71E+eTczUKfkEqiP
	SPxvs8DWuSBKwi+nnE7s9sfH+yKNlm4=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-652-dgl2yJLpOAahmfcCskk-Zw-1; Fri,
 27 Mar 2026 08:03:18 -0400
X-MC-Unique: dgl2yJLpOAahmfcCskk-Zw-1
X-Mimecast-MFC-AGG-ID: dgl2yJLpOAahmfcCskk-Zw_1774612997
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 95A5B18005B6;
	Fri, 27 Mar 2026 12:03:16 +0000 (UTC)
Received: from fedora-laptop-x1.redhat.com (unknown [10.72.112.57])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 13F051955D71;
	Fri, 27 Mar 2026 12:03:09 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: rppt@kernel.org,
	akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	Liam.Howlett@oracle.com,
	vbabka@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	shuah@kernel.org
Cc: aubaker@redhat.com,
	liwang@redhat.com,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] selftests/mm: skip hugetlb_dio tests when DIO alignment is incompatible
Date: Fri, 27 Mar 2026 20:03:05 +0800
Message-ID: <20260327120305.58653-1-liwang@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

hugetlb_dio test uses sub-page offsets (pagesize / 2) to verify that
hugepages used as DIO user buffers are correctly unpinned at completion.

However, on filesystems with a logical block size larger than half the
page size (e.g., 4K-sector block devices), these unaligned DIO writes
are rejected with -EINVAL, causing the test to fail unexpectedly.

Add get_dio_alignment() to query the filesystem's required DIO alignment
via statx(STATX_DIOALIGN) and pass it to run_dio_using_hugetlb(). Skip
individual test cases whose write length is not a multiple of the
alignment, so that aligned cases are still tested.

=== Reproduce Steps ===

  # dd if=/dev/zero of=/tmp/test.img bs=1M count=512
  # losetup --sector-size 4096 /dev/loop0 /tmp/test.img
  # mkfs.xfs /dev/loop0
  # mkdir -p /mnt/dio_test
  # mount /dev/loop0 /mnt/dio_test

  // Modify test to open /mnt/dio_test and rebuild it:
  -       fd = open("/tmp", O_TMPFILE | O_RDWR | O_DIRECT, 0664);
  +       fd = open("/mnt/dio_test", O_TMPFILE | O_RDWR | O_DIRECT, 0664);

  # getconf PAGESIZE
  4096

  # echo 100 >/proc/sys/vm/nr_hugepages

  # ./hugetlb_dio
  TAP version 13
  1..4
  # No. Free pages before allocation : 100
  # No. Free pages after munmap : 100
  ok 1 free huge pages from 0-12288
  Bail out! Error writing to file
  : Invalid argument (22)
  # Planned tests != run tests (4 != 1)
  # Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0

Signed-off-by: Li Wang <liwang@redhat.com>
---

Notes:
    v2:
    	- Pass dio_align as a parameter to run_dio_using_hugetlb()
    	  instead of generally page_size/2 alignment check.

 tools/testing/selftests/mm/hugetlb_dio.c | 56 +++++++++++++++++-------
 1 file changed, 40 insertions(+), 16 deletions(-)

diff --git a/tools/testing/selftests/mm/hugetlb_dio.c b/tools/testing/selftests/mm/hugetlb_dio.c
index 9ac62eb4c97d..638a8abe3ae2 100644
--- a/tools/testing/selftests/mm/hugetlb_dio.c
+++ b/tools/testing/selftests/mm/hugetlb_dio.c
@@ -20,7 +20,35 @@
 #include "vm_util.h"
 #include "kselftest.h"
 
-void run_dio_using_hugetlb(unsigned int start_off, unsigned int end_off)
+#ifndef STATX_DIOALIGN
+#define STATX_DIOALIGN		0x00002000U
+#endif
+
+unsigned int get_dio_alignment(void)
+{
+	int fd, ret;
+	struct statx stx;
+	unsigned int dio_align = 1;
+
+	fd = open("/tmp", O_TMPFILE | O_RDWR | O_DIRECT, 0664);
+	if (fd < 0)
+		ksft_exit_skip("Unable to allocate file: %s\n", strerror(errno));
+
+	ret = statx(fd, "", AT_EMPTY_PATH, STATX_DIOALIGN, &stx);
+	if (ret < 0) {
+		ksft_perror("statx() failed");
+	} else if ((stx.stx_mask & STATX_DIOALIGN) &&
+			stx.stx_dio_offset_align) {
+		dio_align = stx.stx_dio_offset_align;
+	}
+
+	close(fd);
+
+	return dio_align;
+}
+
+void run_dio_using_hugetlb(unsigned int start_off, unsigned int end_off,
+			unsigned int dio_align)
 {
 	int fd;
 	char *buffer =  NULL;
@@ -33,6 +61,11 @@ void run_dio_using_hugetlb(unsigned int start_off, unsigned int end_off)
 	const int mmap_prot  = PROT_READ | PROT_WRITE;
 
 	writesize = end_off - start_off;
+	if (writesize % dio_align != 0) {
+		ksft_test_result_skip("DIO alignment (%u) incompatible with offset %zu\n",
+				dio_align, writesize);
+		return;
+	}
 
 	/* Get the default huge page size */
 	h_pagesize = default_huge_page_size();
@@ -89,37 +122,28 @@ void run_dio_using_hugetlb(unsigned int start_off, unsigned int end_off)
 
 int main(void)
 {
-	size_t pagesize = 0;
-	int fd;
+	size_t pagesize = psize();
+	unsigned int dio_align = get_dio_alignment();
 
 	ksft_print_header();
 
-	/* Open the file to DIO */
-	fd = open("/tmp", O_TMPFILE | O_RDWR | O_DIRECT, 0664);
-	if (fd < 0)
-		ksft_exit_skip("Unable to allocate file: %s\n", strerror(errno));
-	close(fd);
-
 	/* Check if huge pages are free */
 	if (!get_free_hugepages())
 		ksft_exit_skip("No free hugepage, exiting\n");
 
 	ksft_set_plan(4);
 
-	/* Get base page size */
-	pagesize  = psize();
-
 	/* start and end is aligned to pagesize */
-	run_dio_using_hugetlb(0, (pagesize * 3));
+	run_dio_using_hugetlb(0, (pagesize * 3), dio_align);
 
 	/* start is aligned but end is not aligned */
-	run_dio_using_hugetlb(0, (pagesize * 3) - (pagesize / 2));
+	run_dio_using_hugetlb(0, (pagesize * 3) - (pagesize / 2), dio_align);
 
 	/* start is unaligned and end is aligned */
-	run_dio_using_hugetlb(pagesize / 2, (pagesize * 3));
+	run_dio_using_hugetlb(pagesize / 2, (pagesize * 3), dio_align);
 
 	/* both start and end are unaligned */
-	run_dio_using_hugetlb(pagesize / 2, (pagesize * 3) + (pagesize / 2));
+	run_dio_using_hugetlb(pagesize / 2, (pagesize * 3) + (pagesize / 2), dio_align);
 
 	ksft_finished();
 }
-- 
2.53.0

