Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4DBE486E41
	for <linux-kselftest@vger.kernel.org>; Thu,  6 Aug 2026 18:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786040344; cv=none; b=Rr8UzU3zlC2SWU2iWmc3p7CAPvcYhSIBEbpSRUjYn/gTSzAlgvKycG5NllDsSx65g3/raUChIvWtiqglrPjZ1oD1w4pPcl+/Y//MRbx345ZPdW8P2PIgPrUh0mBafq/TYmJabhrtTCjdHfHeBJRCYkrfVd5Rd3/h6+o6P9faq0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786040344; c=relaxed/simple;
	bh=f/x5XOGSOVXL62dnTLwAi4t3GHNIl7TACwaS3NY/NUY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a/XB7mw14AEFBDh9euBJSNWNDauemUfuYumbVsd/NinD051itrZZEFVEbexMj6mCUvkz035FtUwX8jrpDE+ohLqyvTOwO6z/8lhguQjkCaOJz5IbbSsUGug0Dph37kAhfL/fUjh0uW2gg3xO/jGna76gE5REAGNp8ODCAtUQWQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PegDMw+7; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PegDMw+7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786040341;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1Od46/DzmUAyLPulZmr0Tuh5N+v6QlQ8E5evsDJ+JEQ=;
	b=PegDMw+7hUivGCzPLr5wXE5J9uFatOVwup+ZHxb7znyoX+ThZzN2ASdg54Ct2TOL1JRreZ
	yOlJ6Cu9pNFj2QfJm9RY0kB1CaRR+ESUygoyvnrca7pflqxlVoU5CeXnmNtAyAJSh6LMw/
	YlAqzEM8j9kbe8yhVpySoHRZLnWBwg4=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-266-njgfHLFnOPukWvRfLr7D5Q-1; Thu,
 06 Aug 2026 14:18:58 -0400
X-MC-Unique: njgfHLFnOPukWvRfLr7D5Q-1
X-Mimecast-MFC-AGG-ID: njgfHLFnOPukWvRfLr7D5Q_1786040336
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DDFAD18002C8;
	Thu,  6 Aug 2026 18:18:55 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.22.64.255])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id F249E180034C;
	Thu,  6 Aug 2026 18:18:52 +0000 (UTC)
From: Audra Mitchell <audra@redhat.com>
To: david@kernel.org
Cc: jocolema@redhat.com,
	raquini@redhat.com,
	Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	Colin Ian King <colin.i.king@gmail.com>,
	Muhammad Usama Anjum <usama.anjum@arm.com>,
	Andrei Vagin <avagin@google.com>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] selftests/mm: Fix soft-dirty kselftest supported check
Date: Thu,  6 Aug 2026 14:17:04 -0400
Message-ID: <20260806181843.1839943-3-audra@redhat.com>
In-Reply-To: <20260806181843.1839943-1-audra@redhat.com>
References: <7d6b4401-e230-4ca7-b64f-c1277fa643b8@kernel.org>
 <20260806181843.1839943-1-audra@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

On architectures with separate user address space, such as s390 or
those without an MMU, the soft-dirty kselftest may fail when checking
to see if the feature is supported.

  # --------------------
  # running ./soft-dirty
  # --------------------
  # TAP version 13
  # 1..15
  # Bail out! PAGEMAP_SCAN succeeded unexpectedly
  # # Totals: pass:0 fail:0 xfail:0 xpass:0 skip:0 error:0
  # [FAIL]
  not ok 1 soft-dirty # exit=1
  # SUMMARY: PASS=0 SKIP=0 FAIL=1

The soft-dirty test will initate an ioctl with the PAGEMAP_SCAN flag with
an invalid address for the page_region. This is done intentionally to
have the ioctl return with an expected EFAULT and with the correct
categories returned.

However, on architectures with separate user address space, such as s390 or
those without an MMU, the call to __access_ok (used to validate the
variables provided with the ioctl) will always return true and we will not
fail as expected.

        if (IS_ENABLED(CONFIG_ALTERNATE_USER_ADDRESS_SPACE) ||
            !IS_ENABLED(CONFIG_MMU))
                return true;

Let's simplify the check for PAGEMAP_SCAN and provide a valid page_region
address so that we get a non-errno return if it is supported.

Fixes: 600bca580579 ("selftests/mm: check that PAGEMAP_SCAN returns correct categories")

Signed-off-by: Audra Mitchell <audra@redhat.com>
---
 tools/testing/selftests/mm/vm_util.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/mm/vm_util.c
index 6b65bd0a1e0b..4a8e339a7403 100644
--- a/tools/testing/selftests/mm/vm_util.c
+++ b/tools/testing/selftests/mm/vm_util.c
@@ -66,20 +66,25 @@ static uint64_t pagemap_scan_get_categories(int fd, char *start)
 }
 
 /* `start` is any valid address. */
-static bool pagemap_scan_supported(int fd, char *start)
+static bool pagemap_scan_supported(int fd)
 {
+	const size_t pagesize = getpagesize();
 	static int supported = -1;
-	int ret;
+	struct page_region r;
+	void *test_area;
 
 	if (supported != -1)
 		return supported;
 
-	/* Provide an invalid address in order to trigger EFAULT. */
-	ret = __pagemap_scan_get_categories(fd, start, (struct page_region *) ~0UL);
-	if (ret == 0)
-		ksft_exit_fail_msg("PAGEMAP_SCAN succeeded unexpectedly\n");
-
-	supported = errno == EFAULT;
+	test_area = mmap(0, pagesize, PROT_READ | PROT_WRITE,
+			MAP_ANONYMOUS | MAP_PRIVATE, -1, 0);
+	if (test_area == MAP_FAILED) {
+		ksft_print_msg("WARN: mmap() failed: %s\n", strerror(errno));
+		supported = 0;
+	} else {
+		supported = __pagemap_scan_get_categories(fd, test_area, &r) >= 0;
+		munmap(test_area, pagesize);
+	}
 
 	return supported;
 }
@@ -89,7 +94,7 @@ static bool page_entry_is(int fd, char *start, char *desc,
 {
 	bool m = pagemap_get_entry(fd, start) & pagemap_flags;
 
-	if (pagemap_scan_supported(fd, start)) {
+	if (pagemap_scan_supported(fd)) {
 		bool s = pagemap_scan_get_categories(fd, start) & pagescan_flags;
 
 		if (m == s)
-- 
2.52.0

