Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C1F21CFF6
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Mar 2026 03:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774581183; cv=none; b=THv4fjD5KnVx3C+zm55J5NH+NjNRH4rCZQ7KL5GyboZ7iEG+bJJDQGKp7p49HiRdLEh7iqBTEG851JyEibnZg0NlGWZAYmHAFAbBkzQTNZTeC+TWOzvaewqkakwz8Z04Gf4XbBuK84CFkYhjeUo6IAfN0aD2qnEX2ddWZ0YPzdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774581183; c=relaxed/simple;
	bh=1S2z0kVIgkBFPjK/fNU20tmV4RUsOz4mebDu49oqkK0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VPZtj39suGvQAtu9vNDjxUBiJUp9xhAJqsbgAgm2IzdLeNS7tLJE65abw36F08oCrmsQADBehhSVdIlpl8Hto2rIoWh8K/O+UBVxAsvyIMEz9bxKb75X3/vrGr3GfDou5NpPFu0/ZLo7RIb3WoBNB3LwOcVlrgF+PcLybcaa+Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UgWtS1gy; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UgWtS1gy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774581179;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2gMVERs5nD4fs9GE1Z+JDM+DqMotyc35OUdJ51PD49o=;
	b=UgWtS1gyb8t83xBM4P9/1mhSm1qP1ZyyjCkRB+KtkklPsL3n72u9WnIo90k8wv/95cs6My
	ebwuC0D9KxsSyc+mckV++z+KDwoHg/wdGkYBNbZ8oJRsGwwaHZHR+rKyuiPHul07ntIbBJ
	gP2aTA4234i1vJv2Lec6+XreaWjrFAI=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-280-Of6-ZzLLOnOsTZgr9Cn7ew-1; Thu,
 26 Mar 2026 23:12:55 -0400
X-MC-Unique: Of6-ZzLLOnOsTZgr9Cn7ew-1
X-Mimecast-MFC-AGG-ID: Of6-ZzLLOnOsTZgr9Cn7ew_1774581173
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A5C6C18005B9;
	Fri, 27 Mar 2026 03:12:53 +0000 (UTC)
Received: from fedora-laptop-x1.redhat.com (unknown [10.72.112.150])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D7A1D30001A1;
	Fri, 27 Mar 2026 03:12:47 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	Liam.Howlett@oracle.com,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	shuah@kernel.org
Cc: aubaker@redhat.com,
	liwang@redhat.com,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] selftests/mm: skip hugetlb_dio tests when DIO alignment is incompatible
Date: Fri, 27 Mar 2026 11:12:43 +0800
Message-ID: <20260327031243.15903-1-liwang@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

hugetlb_dio test uses sub-page offsets (pagesize / 2) to verify that
hugepages used as DIO user buffers are correctly unpinned at completion.

However, on filesystems with a logical block size larger than half the
page size (e.g., 4K-sector block devices), these unaligned DIO writes
are rejected with -EINVAL, causing the test to fail unexpectedly.

Add check_dio_alignment() which queries the filesystem's DIO alignment
requirement via statx(STATX_DIOALIGN) and skips the test early if the
sub-page offset used by the test is not compatible with the alignment
constraint.

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
 tools/testing/selftests/mm/hugetlb_dio.c | 37 +++++++++++++++++-------
 1 file changed, 27 insertions(+), 10 deletions(-)

diff --git a/tools/testing/selftests/mm/hugetlb_dio.c b/tools/testing/selftests/mm/hugetlb_dio.c
index 9ac62eb4c97d..afcca50d190e 100644
--- a/tools/testing/selftests/mm/hugetlb_dio.c
+++ b/tools/testing/selftests/mm/hugetlb_dio.c
@@ -20,6 +20,31 @@
 #include "vm_util.h"
 #include "kselftest.h"
 
+#ifndef STATX_DIOALIGN
+#define STATX_DIOALIGN		0x00002000U
+#endif
+
+void check_dio_alignment(size_t pagesize)
+{
+	int fd;
+	struct statx stx;
+	unsigned int dio_align = 1;
+
+	fd = open("/tmp", O_TMPFILE | O_RDWR, 0664);
+	if (fd < 0)
+		ksft_exit_skip("Unable to allocate file: %s\n", strerror(errno));
+
+	if (statx(fd, "", AT_EMPTY_PATH, STATX_DIOALIGN, &stx) == 0 &&
+				(stx.stx_mask & STATX_DIOALIGN))
+		dio_align = stx.stx_dio_offset_align;
+
+	close(fd);
+
+	if ((pagesize / 2) % dio_align != 0)
+		ksft_exit_skip("DIO alignment (%u) incompatible with sub-page offset %lu\n",
+				dio_align, pagesize / 2);
+}
+
 void run_dio_using_hugetlb(unsigned int start_off, unsigned int end_off)
 {
 	int fd;
@@ -89,16 +114,11 @@ void run_dio_using_hugetlb(unsigned int start_off, unsigned int end_off)
 
 int main(void)
 {
-	size_t pagesize = 0;
-	int fd;
+	size_t pagesize = psize();
 
 	ksft_print_header();
 
-	/* Open the file to DIO */
-	fd = open("/tmp", O_TMPFILE | O_RDWR | O_DIRECT, 0664);
-	if (fd < 0)
-		ksft_exit_skip("Unable to allocate file: %s\n", strerror(errno));
-	close(fd);
+	check_dio_alignment(pagesize);
 
 	/* Check if huge pages are free */
 	if (!get_free_hugepages())
@@ -106,9 +126,6 @@ int main(void)
 
 	ksft_set_plan(4);
 
-	/* Get base page size */
-	pagesize  = psize();
-
 	/* start and end is aligned to pagesize */
 	run_dio_using_hugetlb(0, (pagesize * 3));
 
-- 
2.53.0

